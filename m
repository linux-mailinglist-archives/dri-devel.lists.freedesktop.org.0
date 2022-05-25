Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E2D534030
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 17:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6337E10E2BE;
	Wed, 25 May 2022 15:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FF410E2AE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 15:17:47 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id t2so13427798qkb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 08:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o0TWzmZ1bmaf7p17Zf5nWwuIXbAj6o8jMjWAnu/6xwk=;
 b=Qz3PvMVB0GGT/b8s3TpvtZl0PibYJ1v6Lqbkk/zQUnUIqa5XC5iu8TanXAaIFL+BRz
 DqEIa2auOpS6sjH0lTv/SmD5cFBjZfYVKpjREeBmCrzTIrJlHXZ5houUWOsL+vMjEGps
 M/iqJ18E8DjUlQJHO0GXPHy0eIX4X5TcTGGjHKquUqa8E9vq9aPqx/wBb5qp5AzUSyqL
 /fsIaxtUCNDluy5a9iHRvuJ68aQcXeU32cA6YqOyRkOKfomNxQIVzAY3IZbLsiWt3LVi
 PPZFGjSsjRV3lEb5FMblfITiJ40Z7O1dr5kMwGmAWVm8O3uo2/ZcwxJbN8P10iIteU/D
 Uswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o0TWzmZ1bmaf7p17Zf5nWwuIXbAj6o8jMjWAnu/6xwk=;
 b=gmF7nFlovfkrYts9CiuvoLz/cvOYv8Ys0OT3NBQDXw7kvW5yV+M40nKjgP+5yYa1Ae
 4WOUzu1efRkCFv1YO4wlMebyRRP8DKp9KOz2Lc7pKxLksYL0sXLel5VyzVuG7KZqhYfI
 oy1Dld0n1cjWV1kbdjD8DgwsclJIPtzNROgzkuLM8ds+uor//iFixlTVneO1DgJpFNLC
 Q/CJJVc15V2JrH1lKwzVNm7feo6trgOlBoGz3rBe3U+Y88aUBS22Wuh8AeSLOhjDwRwT
 2xqCUTygLFe23cV3XTesy/mYFwf5yGdUhO7brdFJwxvq4jNR84oMGroIndH2W16KmMXl
 +UzA==
X-Gm-Message-State: AOAM531+17fsP4gcMymJIpk7xHlJoYnprZkntYPL01H7qi/ETrnOOwrK
 Cz50l9h5Swn7fACu9uEhVSbMgW5zoDIkMHgiEnU=
X-Google-Smtp-Source: ABdhPJzPBwi5G3QxLaArHLmZISUzjZmxyldbQidcWiv42gXg0uu0XLyjruAVxxk6qJMVCjRLC0xGwxrsPmUKH9+HSIs=
X-Received: by 2002:a05:620a:11b6:b0:6a3:2569:7a4f with SMTP id
 c22-20020a05620a11b600b006a325697a4fmr21047478qkk.666.1653491866625; Wed, 25
 May 2022 08:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220524135249.49993-1-roman.o.stratiienko@globallogic.com>
 <3174733.44csPzL39Z@kista>
 <CAGphcdmfm43aTim5tVL+LYTrtq+mrwJU9nJxinafXqN4xEhz9w@mail.gmail.com>
 <10083449.nUPlyArG6x@kista>
In-Reply-To: <10083449.nUPlyArG6x@kista>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Wed, 25 May 2022 18:17:35 +0300
Message-ID: <CAGphcd=HcQ=2KpJbJFXN5dGELQvkAuoP1_Dths_3zBeYJAh4Vg@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH] drm/sun4i: Fix blend registers corruption for
 DE2.0/DE3.0
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

=D1=81=D1=80, 25 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 18:14, Jernej =C5=
=A0krabec <jernej.skrabec@gmail.com>:
>
> Dne sreda, 25. maj 2022 ob 16:55:56 CEST je Roman Stratiienko napisal(a):
> > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 22:14, Jernej =
=C5=A0krabec <jernej.skrabec@gmail.com>:
> > >
> > > Dne torek, 24. maj 2022 ob 19:14:35 CEST je Roman Stratiienko napisal=
(a):
> > > > By the way, not related to this issue:
> > > >
> > > > I cherry-picked
> > > > https://patchwork.kernel.org/project/dri-devel/patch/
> 20220424162633.12369-9-samuel@sholland.org/
> > > > and got a blank FB console on OPI3.
> > > > Can you check it please?
> > >
> > > Reply to that patch and we'll talk.
> >
> > Despite the fact that I am the original author of the patches I'm not
> > even in CC, so I can respond to this thread.
>
> Actually, many people come up with similar idea.
>
> > Is there any other way to respond to the message where you're not in CC=
?
>
> Of course, I download patch as mbox and import it in my e-mail client. A =
reply
> to it will continue the thread.

Nevermind, it was an issue from my side. I haven't done rmmod/insmod
for sun4i_tcon.ko after recompiling.

> Best regards,
> Jernej
>
> >
> > >
> > > Best regards,
> > > Jernej
> > >
> > > >
> > > > Regards,
> > > > Roman
> > > >
> > > >
> > > >
> > > > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 20:10, Roma=
n Stratiienko <r.stratiienko@gmail.com>:
> > > > >
> > > > > Please draft a test for the zpos issue you're mentioning.
> > > > >
> > > > > It's very easy to do with kmsxx using python wrapper.
> > > > >
> > > > > Or explain steps to reproduce here, I will write it by myself.
> > > > >
> > > > > Thanks.
> > > > > Regards
> > > > > Roman
> > > > >
> > > > > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 19:21, Je=
rnej =C5=A0krabec <jernej.skrabec@gmail.com>:
> > > > > >
> > > > > > Dne torek, 24. maj 2022 ob 17:31:13 CEST je Roman Stratiienko
> > > napisal(a):
> > > > > > > NAK for this. Further testing showed such an approach is not
> reliable
> > > > > > > due to .atomic_update() callback called only in case planes h=
ave
> some
> > > > > > > changes.
> > > > > >
> > > > > > Additionally, I think it would be better to fix underlaying zpo=
s
> issue
> > > first
> > > > > > (attempted many times) and then worry about blending.
> > > > > >
> > > > > > Best regards,
> > > > > > Jernej
> > > > > >
> > > > > > >
> > > > > > > =D0=B2=D1=82, 24 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 16:52=
, Roman Stratiienko
> > > <r.stratiienko@gmail.com>:
> > > > > > > >
> > > > > > > > Corruption happens when plane zpos is updated
> > > > > > > >
> > > > > > > > Example scenario:
> > > > > > > >
> > > > > > > > Initial frame blender state:
> > > > > > > >     PLANE_ZPOS =3D {0, 1, 2, 3}
> > > > > > > >     BLD_ROUTE  =3D {0, 1, 2, 0}
> > > > > > > >     BLD_EN     =3D {1, 1, 1, 0}
> > > > > > > >
> > > > > > > > New frame commit (Only ZPOS has been changed):
> > > > > > > >
> > > > > > > >     PLANE_ZPOS =3D {0->2, 1->0, 2->1, 3}
> > > > > > > >
> > > > > > > > Expected results after plane state update:
> > > > > > > >                 Z0 Z1 Z2 Z3
> > > > > > > >     BLD_ROUTE =3D {1, 2, 0, 0}
> > > > > > > >     BLD_EN    =3D {1, 1, 1, 0}
> > > > > > > >
> > > > > > > > What is currently happening:
> > > > > > > >
> > > > > > > > 1. sun8i_vi_layer_enable(enabled=3Dtrue, zpos=3D2, old_zpos=
=3D0):
> > > > > > > >     BLD_ROUTE =3D {1->0, 1, 2->0, 0}
> > > > > > > >     BLD_EN    =3D {1->0, 1, 1->1, 0}
> > > > > > > >
> > > > > > > > 2. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D0, old_zpos=
=3D1):
> > > > > > > >     BLD_ROUTE =3D {0->1, 1->0, 0, 0}
> > > > > > > >     BLD_EN    =3D {0->1, 1->0, 1, 0}
> > > > > > > >
> > > > > > > > 3. sun8i_ui_layer_enable(enabled=3Dtrue, zpos=3D1, old_zpos=
=3D2):
> > > > > > > >     BLD_ROUTE =3D {1, 0->2, 0->0, 0}
> > > > > > > >     BLD_EN    =3D {1, 0->2, 1->0, 0}
> > > > > > > >
> > > > > > > > After updating of all the planes we are ending up with
> BLD_EN[2]=3D0,
> > > > > > > > which makes this channel disabled.
> > > > > > > >
> > > > > > > > To fix this issue, clear BLEND registers before updating th=
e
> planes
> > > > > > > > and do not clear the old state while processing every plane=
.
> > > > > > > >
> > > > > > > > Signed-off-by: Roman Stratiienko
> > > <roman.o.stratiienko@globallogic.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 16 ++++++++++++++=
+
> > > > > > > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 28 +++
> > > +----------------------
> > > > > > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 28 +++
> > > +----------------------
> > > > > > > >  3 files changed, 24 insertions(+), 48 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/=
gpu/
> drm/
> > > sun4i/
> > > > > > sun8i_mixer.c
> > > > > > > > index f5e8aeaa3cdf..004377a000fc 100644
> > > > > > > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > > > > > @@ -248,6 +248,21 @@ int sun8i_mixer_drm_format_to_hw(u32
> format,
> > > u32
> > > > > > *hw_format)
> > > > > > > >         return -EINVAL;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +static void sun8i_atomic_begin(struct sunxi_engine *engine=
,
> > > > > > > > +                              struct drm_crtc_state *old_s=
tate)
> > > > > > > > +{
> > > > > > > > +       struct sun8i_mixer *mixer =3D
> engine_to_sun8i_mixer(engine);
> > > > > > > > +       u32 bld_base =3D sun8i_blender_base(mixer);
> > > > > > > > +
> > > > > > > > +       regmap_write(engine->regs,
> > > > > > > > +                    SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > > > > > +                    0);
> > > > > > > > +
> > > > > > > > +       regmap_write(engine->regs,
> > > > > > > > +                    SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > > > > > +                    0);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static void sun8i_mixer_commit(struct sunxi_engine *engine=
)
> > > > > > > >  {
> > > > > > > >         DRM_DEBUG_DRIVER("Committing changes\n");
> > > > > > > > @@ -299,6 +314,7 @@ static struct drm_plane
> > > **sun8i_layers_init(struct
> > > > > > drm_device *drm,
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static const struct sunxi_engine_ops sun8i_engine_ops =3D =
{
> > > > > > > > +       .atomic_begin   =3D sun8i_atomic_begin,
> > > > > > > >         .commit         =3D sun8i_mixer_commit,
> > > > > > > >         .layers_init    =3D sun8i_layers_init,
> > > > > > > >  };
> > > > > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drive=
rs/
> gpu/
> > > drm/
> > > > > > sun4i/sun8i_ui_layer.c
> > > > > > > > index 7845c2a53a7f..b294a882626a 100644
> > > > > > > > --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> > > > > > > > @@ -24,8 +24,7 @@
> > > > > > > >  #include "sun8i_ui_scaler.h"
> > > > > > > >
> > > > > > > >  static void sun8i_ui_layer_enable(struct sun8i_mixer *mixe=
r,
> int
> > > channel,
> > > > > > > > -                                 int overlay, bool enable,
> unsigned
> > > int
> > > > > > zpos,
> > > > > > > > -                                 unsigned int old_zpos)
> > > > > > > > +                                 int overlay, bool enable,
> unsigned
> > > int
> > > > > > zpos)
> > > > > > > >  {
> > > > > > > >         u32 val, bld_base, ch_base;
> > > > > > > >
> > > > > > > > @@ -44,18 +43,6 @@ static void sun8i_ui_layer_enable(struct
> > > sun8i_mixer
> > > > > > *mixer, int channel,
> > > > > > > >
> SUN8I_MIXER_CHAN_UI_LAYER_ATTR(ch_base,
> > > > > > overlay),
> > > > > > > >                            SUN8I_MIXER_CHAN_UI_LAYER_ATTR_E=
N,
> val);
> > > > > > > >
> > > > > > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > > > > -
> > > SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > > > > > -
> > > > > > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > > > > > -                                  0);
> > > > > > > > -
> > > > > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > > > > -
> > > SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > > > > > -
> > > > > > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > > > > > -                                  0);
> > > > > > > > -       }
> > > > > > > > -
> > > > > > > >         if (enable) {
> > > > > > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos)=
;
> > > > > > > >
> > > > > > > > @@ -291,31 +278,24 @@ static int
> sun8i_ui_layer_atomic_check(struct
> > > > > > drm_plane *plane,
> > > > > > > >  static void sun8i_ui_layer_atomic_disable(struct drm_plane
> *plane,
> > > > > > > >                                           struct
> drm_atomic_state
> > > *state)
> > > > > > > >  {
> > > > > > > > -       struct drm_plane_state *old_state =3D
> > > > > > drm_atomic_get_old_plane_state(state,
> > > > > > > > -
> > > > > > plane);
> > > > > > > >         struct sun8i_ui_layer *layer =3D
> > > plane_to_sun8i_ui_layer(plane);
> > > > > > > > -       unsigned int old_zpos =3D old_state->normalized_zpo=
s;
> > > > > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > > > > >
> > > > > > > > -       sun8i_ui_layer_enable(mixer, layer->channel, layer-
> >overlay,
> > > > > > false, 0,
> > > > > > > > -                             old_zpos);
> > > > > > > > +       sun8i_ui_layer_enable(mixer, layer->channel, layer-
> >overlay,
> > > > > > false, 0);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void sun8i_ui_layer_atomic_update(struct drm_plane
> *plane,
> > > > > > > >                                          struct drm_atomic_=
state
> > > *state)
> > > > > > > >  {
> > > > > > > > -       struct drm_plane_state *old_state =3D
> > > > > > drm_atomic_get_old_plane_state(state,
> > > > > > > > -
> > > > > > plane);
> > > > > > > >         struct drm_plane_state *new_state =3D
> > > > > > drm_atomic_get_new_plane_state(state,
> > > > > > > >
> > > > > > plane);
> > > > > > > >         struct sun8i_ui_layer *layer =3D
> > > plane_to_sun8i_ui_layer(plane);
> > > > > > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > > > > > -       unsigned int old_zpos =3D old_state->normalized_zpo=
s;
> > > > > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > > > > >
> > > > > > > >         if (!new_state->visible) {
> > > > > > > >                 sun8i_ui_layer_enable(mixer, layer->channel=
,
> > > > > > > > -                                     layer->overlay, false=
, 0,
> > > old_zpos);
> > > > > > > > +                                     layer->overlay, false=
, 0);
> > > > > > > >                 return;
> > > > > > > >         }
> > > > > > > >
> > > > > > > > @@ -328,7 +308,7 @@ static void
> sun8i_ui_layer_atomic_update(struct
> > > > > > drm_plane *plane,
> > > > > > > >         sun8i_ui_layer_update_buffer(mixer, layer->channel,
> > > > > > > >                                      layer->overlay, plane)=
;
> > > > > > > >         sun8i_ui_layer_enable(mixer, layer->channel, layer-
> >overlay,
> > > > > > > > -                             true, zpos, old_zpos);
> > > > > > > > +                             true, zpos);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static const struct drm_plane_helper_funcs
> > > sun8i_ui_layer_helper_funcs =3D
> > > > > > {
> > > > > > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drive=
rs/
> gpu/
> > > drm/
> > > > > > sun4i/sun8i_vi_layer.c
> > > > > > > > index bb7c43036dfa..4653244b2fd8 100644
> > > > > > > > --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > > > > +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> > > > > > > > @@ -18,8 +18,7 @@
> > > > > > > >  #include "sun8i_vi_scaler.h"
> > > > > > > >
> > > > > > > >  static void sun8i_vi_layer_enable(struct sun8i_mixer *mixe=
r,
> int
> > > channel,
> > > > > > > > -                                 int overlay, bool enable,
> unsigned
> > > int
> > > > > > zpos,
> > > > > > > > -                                 unsigned int old_zpos)
> > > > > > > > +                                 int overlay, bool enable,
> unsigned
> > > int
> > > > > > zpos)
> > > > > > > >  {
> > > > > > > >         u32 val, bld_base, ch_base;
> > > > > > > >
> > > > > > > > @@ -38,18 +37,6 @@ static void sun8i_vi_layer_enable(struct
> > > sun8i_mixer
> > > > > > *mixer, int channel,
> > > > > > > >
> SUN8I_MIXER_CHAN_VI_LAYER_ATTR(ch_base,
> > > > > > overlay),
> > > > > > > >                            SUN8I_MIXER_CHAN_VI_LAYER_ATTR_E=
N,
> val);
> > > > > > > >
> > > > > > > > -       if (!enable || zpos !=3D old_zpos) {
> > > > > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > > > > -
> > > SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
> > > > > > > > -
> > > > > > SUN8I_MIXER_BLEND_PIPE_CTL_EN(old_zpos),
> > > > > > > > -                                  0);
> > > > > > > > -
> > > > > > > > -               regmap_update_bits(mixer->engine.regs,
> > > > > > > > -
> > > SUN8I_MIXER_BLEND_ROUTE(bld_base),
> > > > > > > > -
> > > > > > SUN8I_MIXER_BLEND_ROUTE_PIPE_MSK(old_zpos),
> > > > > > > > -                                  0);
> > > > > > > > -       }
> > > > > > > > -
> > > > > > > >         if (enable) {
> > > > > > > >                 val =3D SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos)=
;
> > > > > > > >
> > > > > > > > @@ -395,31 +382,24 @@ static int
> sun8i_vi_layer_atomic_check(struct
> > > > > > drm_plane *plane,
> > > > > > > >  static void sun8i_vi_layer_atomic_disable(struct drm_plane
> *plane,
> > > > > > > >                                           struct
> drm_atomic_state
> > > *state)
> > > > > > > >  {
> > > > > > > > -       struct drm_plane_state *old_state =3D
> > > > > > drm_atomic_get_old_plane_state(state,
> > > > > > > > -
> > > > > > plane);
> > > > > > > >         struct sun8i_vi_layer *layer =3D
> > > plane_to_sun8i_vi_layer(plane);
> > > > > > > > -       unsigned int old_zpos =3D old_state->normalized_zpo=
s;
> > > > > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > > > > >
> > > > > > > > -       sun8i_vi_layer_enable(mixer, layer->channel, layer-
> >overlay,
> > > > > > false, 0,
> > > > > > > > -                             old_zpos);
> > > > > > > > +       sun8i_vi_layer_enable(mixer, layer->channel, layer-
> >overlay,
> > > > > > false, 0);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void sun8i_vi_layer_atomic_update(struct drm_plane
> *plane,
> > > > > > > >                                          struct drm_atomic_=
state
> > > *state)
> > > > > > > >  {
> > > > > > > > -       struct drm_plane_state *old_state =3D
> > > > > > drm_atomic_get_old_plane_state(state,
> > > > > > > > -
> > > > > > plane);
> > > > > > > >         struct drm_plane_state *new_state =3D
> > > > > > drm_atomic_get_new_plane_state(state,
> > > > > > > >
> > > > > > plane);
> > > > > > > >         struct sun8i_vi_layer *layer =3D
> > > plane_to_sun8i_vi_layer(plane);
> > > > > > > >         unsigned int zpos =3D new_state->normalized_zpos;
> > > > > > > > -       unsigned int old_zpos =3D old_state->normalized_zpo=
s;
> > > > > > > >         struct sun8i_mixer *mixer =3D layer->mixer;
> > > > > > > >
> > > > > > > >         if (!new_state->visible) {
> > > > > > > >                 sun8i_vi_layer_enable(mixer, layer->channel=
,
> > > > > > > > -                                     layer->overlay, false=
, 0,
> > > old_zpos);
> > > > > > > > +                                     layer->overlay, false=
, 0);
> > > > > > > >                 return;
> > > > > > > >         }
> > > > > > > >
> > > > > > > > @@ -432,7 +412,7 @@ static void
> sun8i_vi_layer_atomic_update(struct
> > > > > > drm_plane *plane,
> > > > > > > >         sun8i_vi_layer_update_buffer(mixer, layer->channel,
> > > > > > > >                                      layer->overlay, plane)=
;
> > > > > > > >         sun8i_vi_layer_enable(mixer, layer->channel, layer-
> >overlay,
> > > > > > > > -                             true, zpos, old_zpos);
> > > > > > > > +                             true, zpos);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static const struct drm_plane_helper_funcs
> > > sun8i_vi_layer_helper_funcs =3D
> > > > > > {
> > > > > > > > --
> > > > > > > > 2.30.2
> > > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > >
> > >
> > >
> >
>
>
