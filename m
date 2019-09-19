Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB8B8BFF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 09:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167DA6F88C;
	Fri, 20 Sep 2019 07:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E506F559
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 20:03:42 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id p10so4328674edq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 13:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9pTdPfYYyf5MJ0Hig+dr/GOwIsFTpFLEfz0trmTPahI=;
 b=PpaWGX9yZ9ZZa1pooIeU6wmeFeoFnPvaVrzknJflJ4ljvMeiJn+SWhSJvC6jxdMSJI
 AvsLQd+hIVx7RXf0qa1K1vGJJGPF9SFakWV3Pw4tu7fywbOwCl+H3OzZqLj6TvYV6PPu
 VkV4CDY5qDoAOaWZ6dj945NKPbnUwh7ApB4j8DzQGLOAkiQ5jMP46qT7AkYGnma3719z
 No+9uSNSIIoWbPDGbUZ9kr3q0Koun/P2p0TQGV+ZDyeFrXIv19OQcTRrt5MlJMDs9S0x
 y/UaagRTumZku+e5rLjvIn0cqe7ZhRBbd2bmJLXEMW0U9iZugZxJx6sZ7H9+bRwkxI0G
 bvbA==
X-Gm-Message-State: APjAAAXrPLbkNaIe8Y/xLkm753qXxfr/kJfaxEChptqjZMNgewTO48/Y
 Z0yrJuj0aEbc/hYJPPQDL1NLRvlBVgOBqmrsHEHpNQ==
X-Google-Smtp-Source: APXvYqx0wqzKTNiJg9m3G0ohekpYu0RGnIUWqUf72q8hD7DVt2OnNYZ0xHE/dTWoQZhEi2FKaJneJISBtcGenKjfpyU=
X-Received: by 2002:a05:6402:1f4:: with SMTP id
 i20mr18119165edy.137.1568923420813; 
 Thu, 19 Sep 2019 13:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190919123703.8545-1-roman.stratiienko@globallogic.com>
 <20190919171754.x6lq73cctnqsjr4v@gilmour> <104595190.vWb6g8xIPX@jernej-laptop>
In-Reply-To: <104595190.vWb6g8xIPX@jernej-laptop>
From: Roman Stratiienko <roman.stratiienko@globallogic.com>
Date: Thu, 19 Sep 2019 23:03:26 +0300
Message-ID: <CAODwZ7sPG+_YvnLBU11uYaNpDFthLOkcYXsd=ZQtM+88+cPi9A@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Use vi plane as primary
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>
X-Mailman-Approved-At: Fri, 20 Sep 2019 07:51:39 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=globallogic.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9pTdPfYYyf5MJ0Hig+dr/GOwIsFTpFLEfz0trmTPahI=;
 b=Q6IYogYEa9+OSQ4sDWaz9aWS+9vCsa4xs3oU4fGUT+fLrdQcxVYIXFkonKd3g7iA/l
 qh4WYDHX2on+tVhHBQHb0mlBtT4FxIG46rjPQwjYzuy/IbHptV44W3IZp314/N0/Cl8h
 /yA/0gWu364syNTLn0wPE6ulHfRhyLCksYHeyRGbHN9m2Tq94bqbg4b9XcIWYfQRrZZ/
 +XwuDHzWDKM6SiZrK9e0O1kBjIzWFQcCzhF28ijZHUjLOUovZZMISJvzc8DvzA3yjlNv
 Ylp6XrpFsWLa51WoENhslGyulv4qvEOkPkm/iEXVC9OBGk+Cj2yW5qCq8yZM3jGIG7u8
 GjCQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org
Content-Type: multipart/mixed; boundary="===============0208563201=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0208563201==
Content-Type: multipart/alternative; boundary="0000000000002d92600592ed73e2"

--0000000000002d92600592ed73e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello guys,

Actually, I beleive this is True solution, and current one is wrong.  Let
me explain why.

De2. 0 was designed to match Android hwcomposer hal requirements IMO.
You can easily agree with this conclusion by comparing Composer HAL and
De2. 0 hardware manuals.

I faced at least 4 issues when try to run Android using the mainline kernel
sun8i mixer implementation. Current one, missing pixel formats (my previous
patch), missing plane alpha and rotation properties. I plan to fix it and
also send appropriate solution to the upstream.

To achieve optimal UI performance Android requires at least 4 ui layers to
make screen composition. Current patch enables 4th plane usable.

As for using vi plane to display video. I assume that some of current users
may have regression in their software, but it could be easily fixed. For
example if vi layer isn't fullscreen and should be on top of the other
layers, it can actually be placed on the bottom and overlayed with pictures
with transparent rectangles in video region.
But I assume most of users such as browser etc. uses GPU for that.

And if you are watching fullscreen video, I can imagine only subtitles
layer and advertizing layers on top of the video layers.


=D1=87=D1=82, 19 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3., 21:15 Jernej =C5=
=A0krabec <jernej.skrabec@siol.net>:

> Dne =C4=8Detrtek, 19. september 2019 ob 19:17:54 CEST je Maxime Ripard
> napisal(a):
> > Hi,
> >
> > On Thu, Sep 19, 2019 at 03:37:03PM +0300,
> roman.stratiienko@globallogic.com
> wrote:
> > > From: Roman Stratiienko <roman.stratiienko@globallogic.com>
> > >
> > > DE2.0 blender does not take into the account alpha channel of vi laye=
r.
> > > Thus makes overlaying of this layer totally opaque.
> > > Using vi layer as bottom solves this issue.
>
> What issue? Overlays don't have to be "full screen", thus missing support
> for
> alpha blending doesn't make it less valuable. And VI planes are already
> placed
> at the bottom (zpos =3D 0).
>
> > >
> > > Tested on Android.
> > >
> > > Signed-off-by: Roman Stratiienko <roman.stratiienko@globallogic.com>
> >
> > It sounds like a workaround more than an actual fix.
> >
> > If the VI planes can't use the alpha, then we should just stop
> > reporting that format.
> >
> > Jernej, what do you think?
>
> Commit message is misleading. What this commit actually does is moving
> primary
> plane from first UI plane to bottom most plane, i.e. first VI plane.
> However, VI
> planes are scarce resource, almost all mixers have only one. I wouldn't
> set it
> as primary, because it's the only one which provide support for YUV
> formats.
> That could be used for example by video player for zero-copy rendering.
> Probably most apps wouldn't touch it if it was primary (that's usually
> reserved for window manager, if used).
>
> I left few formats with alpha channel exposed by VI planes, just because
> they
> don't have equivalent format without alpha. But I'm fine with removing
> them if
> you all agree on that.
>
> Best regards,
> Jernej
>
> >
> > Maxime
> >
> > > ---
> > >
> > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 33 -----------------------
> > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 36 ++++++++++++++++++++++++=
+-
> > >  2 files changed, 35 insertions(+), 34 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c index
> dd2a1c851939..25183badc85f
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > @@ -99,36 +99,6 @@ static int sun8i_ui_layer_update_coord(struct
> > > sun8i_mixer *mixer, int channel,>
> > >     insize =3D SUN8I_MIXER_SIZE(src_w, src_h);
> > >     outsize =3D SUN8I_MIXER_SIZE(dst_w, dst_h);
> > >
> > > -   if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> > > -           bool interlaced =3D false;
> > > -           u32 val;
> > > -
> > > -           DRM_DEBUG_DRIVER("Primary layer, updating global size
> W: %u H: %u\n",
> > > -                            dst_w, dst_h);
> > > -           regmap_write(mixer->engine.regs,
> > > -                        SUN8I_MIXER_GLOBAL_SIZE,
> > > -                        outsize);
> > > -           regmap_write(mixer->engine.regs,
> > > -                        SUN8I_MIXER_BLEND_OUTSIZE(bld_base),
> outsize);
> > > -
> > > -           if (state->crtc)
> > > -                   interlaced =3D state->crtc->state-
> >adjusted_mode.flags
> > > -                           & DRM_MODE_FLAG_INTERLACE;
> > > -
> > > -           if (interlaced)
> > > -                   val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> > > -           else
> > > -                   val =3D 0;
> > > -
> > > -           regmap_update_bits(mixer->engine.regs,
> > > -
> SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> > > -
> SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> > > -                              val);
> > > -
> > > -           DRM_DEBUG_DRIVER("Switching display mixer interlaced
> mode %s\n",
> > > -                            interlaced ? "on" : "off");
> > > -   }
> > > -
> > >
> > >     /* Set height and width */
> > >     DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
> > >
> > >                      state->src.x1 >> 16, state->src.y1 >> 16);
> > >
> > > @@ -349,9 +319,6 @@ struct sun8i_ui_layer
> *sun8i_ui_layer_init_one(struct
> > > drm_device *drm,>
> > >     if (!layer)
> > >
> > >             return ERR_PTR(-ENOMEM);
> > >
> > > -   if (index =3D=3D 0)
> > > -           type =3D DRM_PLANE_TYPE_PRIMARY;
> > > -
> > >
> > >     /* possible crtcs are set later */
> > >     ret =3D drm_universal_plane_init(drm, &layer->plane, 0,
> > >
> > >                                    &sun8i_ui_layer_funcs,
> > >
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index
> 07c27e6a4b77..49c4074e164f
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > @@ -116,6 +116,36 @@ static int sun8i_vi_layer_update_coord(struct
> > > sun8i_mixer *mixer, int channel,>
> > >     insize =3D SUN8I_MIXER_SIZE(src_w, src_h);
> > >     outsize =3D SUN8I_MIXER_SIZE(dst_w, dst_h);
> > >
> > > +   if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> > > +           bool interlaced =3D false;
> > > +           u32 val;
> > > +
> > > +           DRM_DEBUG_DRIVER("Primary layer, updating global size
> W: %u H: %u\n",
> > > +                            dst_w, dst_h);
> > > +           regmap_write(mixer->engine.regs,
> > > +                        SUN8I_MIXER_GLOBAL_SIZE,
> > > +                        outsize);
> > > +           regmap_write(mixer->engine.regs,
> > > +                        SUN8I_MIXER_BLEND_OUTSIZE(bld_base),
> outsize);
> > > +
> > > +           if (state->crtc)
> > > +                   interlaced =3D state->crtc->state-
> >adjusted_mode.flags
> > > +                           & DRM_MODE_FLAG_INTERLACE;
> > > +
> > > +           if (interlaced)
> > > +                   val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> > > +           else
> > > +                   val =3D 0;
> > > +
> > > +           regmap_update_bits(mixer->engine.regs,
> > > +
> SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> > > +
> SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> > > +                              val);
> > > +
> > > +           DRM_DEBUG_DRIVER("Switching display mixer interlaced
> mode %s\n",
> > > +                            interlaced ? "on" : "off");
> > > +   }
> > > +
> > >
> > >     /* Set height and width */
> > >     DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
> > >
> > >                      (state->src.x1 >> 16) & ~(format->hsub -
> 1),
> > >
> > > @@ -445,6 +475,7 @@ struct sun8i_vi_layer
> *sun8i_vi_layer_init_one(struct
> > > drm_device *drm,>
> > >                                            struct
> sun8i_mixer *mixer,
> > >                                            int index)
> > >
> > >  {
> > >
> > > +   enum drm_plane_type type =3D DRM_PLANE_TYPE_OVERLAY;
> > >
> > >     struct sun8i_vi_layer *layer;
> > >     unsigned int plane_cnt;
> > >     int ret;
> > >
> > > @@ -453,12 +484,15 @@ struct sun8i_vi_layer
> > > *sun8i_vi_layer_init_one(struct drm_device *drm,>
> > >     if (!layer)
> > >
> > >             return ERR_PTR(-ENOMEM);
> > >
> > > +   if (index =3D=3D 0)
> > > +           type =3D DRM_PLANE_TYPE_PRIMARY;
> > > +
> > >
> > >     /* possible crtcs are set later */
> > >     ret =3D drm_universal_plane_init(drm, &layer->plane, 0,
> > >
> > >                                    &sun8i_vi_layer_funcs,
> > >                                    sun8i_vi_layer_formats,
> > >
> ARRAY_SIZE(sun8i_vi_layer_formats),
> > >
> > > -                                  NULL,
> DRM_PLANE_TYPE_OVERLAY, NULL);
> > > +                                  NULL, type, NULL);
> > >
> > >     if (ret) {
> > >
> > >             dev_err(drm->dev, "Couldn't initialize layer\n");
> > >             return ERR_PTR(ret);
> > >
> > > --
> > > 2.17.1
>
>
>
>
>

--0000000000002d92600592ed73e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello guys,<div dir=3D"auto"><br></div><div dir=3D"auto">=
Actually, I beleive this is True solution, and current one is wrong.=C2=A0 =
Let me explain why.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">De2. 0 was designed to match Android hwcomposer hal requirements IMO.=C2=
=A0</div><div dir=3D"auto">You can easily agree with this conclusion by com=
paring Composer HAL and De2. 0 hardware manuals.=C2=A0</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">I faced at least 4 issues when try to run An=
droid using the mainline kernel sun8i mixer implementation. Current one, mi=
ssing pixel formats (my previous patch), missing plane alpha and rotation p=
roperties. I plan to fix it and also send appropriate solution to the upstr=
eam.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">To achieve op=
timal UI performance Android requires at least 4 ui layers to make screen c=
omposition. Current patch enables 4th plane usable.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">As for using vi plane to display video. I assum=
e that some of current users may have regression in their software, but it =
could be easily fixed. For example if vi layer isn&#39;t fullscreen and sho=
uld be on top of the other layers, it can actually be placed on the bottom =
and overlayed with pictures with transparent rectangles in video region.=C2=
=A0</div><div dir=3D"auto">But I assume most of users such as browser etc. =
uses GPU for that.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>And if you are watching fullscreen video, I can imagine only subtitles lay=
er and advertizing layers on top of the video layers.</div><br><br><div cla=
ss=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">=D1=
=87=D1=82, 19 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3., 21:15 Jernej =C5=A0kr=
abec &lt;<a href=3D"mailto:jernej.skrabec@siol.net">jernej.skrabec@siol.net=
</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Dne =C4=8Detrtek, 19. sep=
tember 2019 ob 19:17:54 CEST je Maxime Ripard napisal(a):<br>
&gt; Hi,<br>
&gt; <br>
&gt; On Thu, Sep 19, 2019 at 03:37:03PM +0300, <a href=3D"mailto:roman.stra=
tiienko@globallogic.com" target=3D"_blank" rel=3D"noreferrer">roman.stratii=
enko@globallogic.com</a> <br>
wrote:<br>
&gt; &gt; From: Roman Stratiienko &lt;<a href=3D"mailto:roman.stratiienko@g=
loballogic.com" target=3D"_blank" rel=3D"noreferrer">roman.stratiienko@glob=
allogic.com</a>&gt;<br>
&gt; &gt; <br>
&gt; &gt; DE2.0 blender does not take into the account alpha channel of vi =
layer.<br>
&gt; &gt; Thus makes overlaying of this layer totally opaque.<br>
&gt; &gt; Using vi layer as bottom solves this issue.<br>
<br>
What issue? Overlays don&#39;t have to be &quot;full screen&quot;, thus mis=
sing support for <br>
alpha blending doesn&#39;t make it less valuable. And VI planes are already=
 placed <br>
at the bottom (zpos =3D 0).<br>
<br>
&gt; &gt; <br>
&gt; &gt; Tested on Android.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Roman Stratiienko &lt;<a href=3D"mailto:roman.stra=
tiienko@globallogic.com" target=3D"_blank" rel=3D"noreferrer">roman.stratii=
enko@globallogic.com</a>&gt;<br>
&gt; <br>
&gt; It sounds like a workaround more than an actual fix.<br>
&gt; <br>
&gt; If the VI planes can&#39;t use the alpha, then we should just stop<br>
&gt; reporting that format.<br>
&gt; <br>
&gt; Jernej, what do you think?<br>
<br>
Commit message is misleading. What this commit actually does is moving prim=
ary <br>
plane from first UI plane to bottom most plane, i.e. first VI plane. Howeve=
r, VI <br>
planes are scarce resource, almost all mixers have only one. I wouldn&#39;t=
 set it <br>
as primary, because it&#39;s the only one which provide support for YUV for=
mats. <br>
That could be used for example by video player for zero-copy rendering. <br=
>
Probably most apps wouldn&#39;t touch it if it was primary (that&#39;s usua=
lly <br>
reserved for window manager, if used).<br>
<br>
I left few formats with alpha channel exposed by VI planes, just because th=
ey <br>
don&#39;t have equivalent format without alpha. But I&#39;m fine with remov=
ing them if <br>
you all agree on that.<br>
<br>
Best regards,<br>
Jernej<br>
<br>
&gt; <br>
&gt; Maxime<br>
&gt; <br>
&gt; &gt; ---<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 33 ---------------=
--------<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 36 +++++++++++++++=
++++++++++-<br>
&gt; &gt;=C2=A0 2 files changed, 35 insertions(+), 34 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c<br>
&gt; &gt; b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c index dd2a1c851939..2518=
3badc85f<br>
&gt; &gt; 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c<br>
&gt; &gt; @@ -99,36 +99,6 @@ static int sun8i_ui_layer_update_coord(struct<=
br>
&gt; &gt; sun8i_mixer *mixer, int channel,&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0insize =3D SUN8I_MIXER_SIZE(src_w, src_h);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0outsize =3D SUN8I_MIXER_SIZE(dst_w, dst_h);<br=
>
&gt; &gt; <br>
&gt; &gt; -=C2=A0 =C2=A0if (plane-&gt;type =3D=3D DRM_PLANE_TYPE_PRIMARY) {=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool interlaced =3D fal=
se;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER(&quot;=
Primary layer, updating global size <br>
W: %u H: %u\n&quot;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_w, dst_h);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(mixer-&gt;=
engine.regs,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 SUN8I_MIXER_GLOBAL_SIZE,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 outsize);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(mixer-&gt;=
engine.regs,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 SUN8I_MIXER_BLEND_OUTSIZE(bld_base), <br>
outsize);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (state-&gt;crtc)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0interlaced =3D state-&gt;crtc-&gt;state-<br>
&gt;adjusted_mode.flags<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; DRM_MODE_FLAG_INTERLACE;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (interlaced)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0val =3D 0;<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(mixe=
r-&gt;engine.regs,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
SUN8I_MIXER_BLEND_OUTCTL(bld_base),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val);<br>
&gt; &gt; -<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER(&quot;=
Switching display mixer interlaced <br>
mode %s\n&quot;,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interlaced ? &quot;on&quot; : &quot;off&=
quot;);<br>
&gt; &gt; -=C2=A0 =C2=A0}<br>
&gt; &gt; -<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Set height and width */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER(&quot;Layer source offset X: =
%d Y: %d\n&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 state-&gt;src.x1 &gt;&gt; 16, state-&gt;src.y1 &gt;&gt; 16);<br>
&gt; &gt; <br>
&gt; &gt; @@ -349,9 +319,6 @@ struct sun8i_ui_layer *sun8i_ui_layer_init_on=
e(struct<br>
&gt; &gt; drm_device *drm,&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (!layer)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EN=
OMEM);<br>
&gt; &gt; <br>
&gt; &gt; -=C2=A0 =C2=A0if (index =3D=3D 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D DRM_PLANE_TYPE=
_PRIMARY;<br>
&gt; &gt; -<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* possible crtcs are set later */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0ret =3D drm_universal_plane_init(drm, &amp;lay=
er-&gt;plane, 0,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sun8i_ui_l=
ayer_funcs,<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c<br>
&gt; &gt; b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c index 07c27e6a4b77..49c4=
074e164f<br>
&gt; &gt; 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c<br>
&gt; &gt; @@ -116,6 +116,36 @@ static int sun8i_vi_layer_update_coord(struc=
t<br>
&gt; &gt; sun8i_mixer *mixer, int channel,&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0insize =3D SUN8I_MIXER_SIZE(src_w, src_h);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0outsize =3D SUN8I_MIXER_SIZE(dst_w, dst_h);<br=
>
&gt; &gt; <br>
&gt; &gt; +=C2=A0 =C2=A0if (plane-&gt;type =3D=3D DRM_PLANE_TYPE_PRIMARY) {=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool interlaced =3D fal=
se;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER(&quot;=
Primary layer, updating global size <br>
W: %u H: %u\n&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_w, dst_h);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(mixer-&gt;=
engine.regs,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 SUN8I_MIXER_GLOBAL_SIZE,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 outsize);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_write(mixer-&gt;=
engine.regs,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 SUN8I_MIXER_BLEND_OUTSIZE(bld_base), <br>
outsize);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (state-&gt;crtc)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0interlaced =3D state-&gt;crtc-&gt;state-<br>
&gt;adjusted_mode.flags<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; DRM_MODE_FLAG_INTERLACE;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (interlaced)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0val =3D 0;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_update_bits(mixe=
r-&gt;engine.regs,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
SUN8I_MIXER_BLEND_OUTCTL(bld_base),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER(&quot;=
Switching display mixer interlaced <br>
mode %s\n&quot;,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interlaced ? &quot;on&quot; : &quot;off&=
quot;);<br>
&gt; &gt; +=C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* Set height and width */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0DRM_DEBUG_DRIVER(&quot;Layer source offset X: =
%d Y: %d\n&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (state-&gt;src.x1 &gt;&gt; 16) &amp; ~(format-&gt;hsub - <br>
1),<br>
&gt; &gt; <br>
&gt; &gt; @@ -445,6 +475,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_on=
e(struct<br>
&gt; &gt; drm_device *drm,&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 struct <br>
sun8i_mixer *mixer,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int index)<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 {<br>
&gt; &gt; <br>
&gt; &gt; +=C2=A0 =C2=A0enum drm_plane_type type =3D DRM_PLANE_TYPE_OVERLAY=
;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0struct sun8i_vi_layer *layer;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0unsigned int plane_cnt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; <br>
&gt; &gt; @@ -453,12 +484,15 @@ struct sun8i_vi_layer<br>
&gt; &gt; *sun8i_vi_layer_init_one(struct drm_device *drm,&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (!layer)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EN=
OMEM);<br>
&gt; &gt; <br>
&gt; &gt; +=C2=A0 =C2=A0if (index =3D=3D 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type =3D DRM_PLANE_TYPE=
_PRIMARY;<br>
&gt; &gt; +<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0/* possible crtcs are set later */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0ret =3D drm_universal_plane_init(drm, &amp;lay=
er-&gt;plane, 0,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;sun8i_vi_l=
ayer_funcs,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sun8i_vi_layer_=
formats,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
ARRAY_SIZE(sun8i_vi_layer_formats),<br>
&gt; &gt; <br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, <br>
DRM_PLANE_TYPE_OVERLAY, NULL);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NULL, type, NULL);<=
br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(drm-&gt;de=
v, &quot;Couldn&#39;t initialize layer\n&quot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(ret=
);<br>
&gt; &gt; <br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000002d92600592ed73e2--

--===============0208563201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0208563201==--
