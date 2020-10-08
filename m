Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6628B28839A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAC66EC5E;
	Fri,  9 Oct 2020 07:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCC86EAA8;
 Thu,  8 Oct 2020 21:32:51 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l85so7909865oih.10;
 Thu, 08 Oct 2020 14:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cevBbZkl6jHkOu62C8Mabmldy49O6VfxjaThJkT7fqo=;
 b=Jh38EcWPcovRgGZovjptNmTC3XFLtdgDObcxU9J+Ngdo+JXkKMre2cFv1NNnc3Cksz
 Gw1qrxaSLznsP44k1kDXrGURJtVDpg1gMW5y6NJWW6QJFYp0CLt1vqtuojXyFkSvn7/t
 b666ABSDS178wKDyFFqh62mHgrcTal81GSuk9H4yQgCPhyBgz8h1fYNazcKi9tmUEesw
 QFj/aEbAF/sDrj5NYtY25wL63a2jcP2s6fXckEKyJFY6VnM3AF+1q1Feri6T0/wPUaLl
 jhKfGgOdYFJ9Nsyrc7zMJrY9aDBghZGQkYsosoQ0BzSJ8LOrRWAdYgxRTGBWHMwOSeuX
 EBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cevBbZkl6jHkOu62C8Mabmldy49O6VfxjaThJkT7fqo=;
 b=idn8bEleAo+26+7mHDS1lKGGQ+L8VPmCR0HJb+JBs49V4GX/z7euSu+OKumLKlSe6x
 raEaOQ4bPd3mqAWvDWHZgUBi8oaIY4SrUd6CADPvouxkcp+9pdq0cQC2I47sr0Lg4Bja
 J3VS+TQYMSTvWmIZCp2qOXox5TUNEY+1/u1yMQepT/sdwxcWUcDJ32pzPIkjJqNvcEdU
 JBR8f2MbuabTNA5N3MJxMIa86XiDCehw6yflAd5HJpqacvbDGwszCxyu+/4LYdVi9XO+
 hvsY2GVbJXcnOrOoutN46diZsR7E1sBn75j+ibbdbMTqbY8SM5+wzNaryYBypug8c4lR
 EVJw==
X-Gm-Message-State: AOAM533EEE16EtMcIucn0U2JN7VaDurxIKCQrq1WOV6FeQwl0pRxGxP4
 usSx/WUg8uA8khJDYqJvnk454HH6BnsN2pkM58c=
X-Google-Smtp-Source: ABdhPJzzahJ9fNxMH7IRwnNuERPwbx/+Sm0GiltQD1QVQgQHMkVEjAJGOq4UBnib/mfX+ntmq1mJfDiRNt2fXEspr4I=
X-Received: by 2002:aca:b9c4:: with SMTP id j187mr502838oif.48.1602192770806; 
 Thu, 08 Oct 2020 14:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201007065915.13883-1-kai.heng.feng@canonical.com>
 <268f495fbb7e3042eb613398a8513a83d28d3fd9.camel@redhat.com>
 <D18BA369-25A0-4D5E-A171-9EACF7DC950B@canonical.com>
 <27402476cddeef59e9ee05e1cdda430a9e34d29c.camel@redhat.com>
In-Reply-To: <27402476cddeef59e9ee05e1cdda430a9e34d29c.camel@redhat.com>
From: Satadru Pramanik <satadru@gmail.com>
Date: Thu, 8 Oct 2020 17:32:39 -0400
Message-ID: <CAFrh3J9epixh4tTbZ83+W3bEd+Y6OzEAd+WX8t6hmmjHMnw_PQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915/dpcd_bl: Skip testing control capability
 with force DPCD quirk
To: Lyude Paul <lyude@redhat.com>, Kevin Chowski <chowski@chromium.org>
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: multipart/mixed; boundary="===============1590714799=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1590714799==
Content-Type: multipart/alternative; boundary="000000000000f7378b05b12f92e7"

--000000000000f7378b05b12f92e7
Content-Type: text/plain; charset="UTF-8"

Kevin Chowski said he would be geting to working on upstreaming a version
of that which was in the ChromeOS tree here:

https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2344844
when I last spoke to hi

(This was two weeks ago.)

Kevin - do you have any input on this?

Satadru

On Thu, Oct 8, 2020 at 1:07 PM Lyude Paul <lyude@redhat.com> wrote:

> oh hold on, I misspoke. Here's the patch I was thinking of:
>
> https://patchwork.freedesktop.org/series/82041/
>
> On Thu, 2020-10-08 at 10:32 +0800, Kai-Heng Feng wrote:
> > Hi Lyude,
> >
> > > On Oct 8, 2020, at 05:53, Lyude Paul <lyude@redhat.com> wrote:
> > >
> > > Hi! I thought this patch rang a bell, we actually already had some
> > > discussion
> > > about this since there's a couple of other systems this was causing
> issues
> > > for.
> > > Unfortunately it never seems like that patch got sent out. Satadru?
> > >
> > > (if I don't hear back from them soon, I'll just send out a patch for
> this
> > > myself)
> > >
> > > JFYI - the proper fix here is to just drop the
> > > DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP check from the code entirely.
> As
> > > long as
> > > the backlight supports AUX_SET_CAP, that should be enough for us to
> control
> > > it.
> >
> > Does the proper fix include dropping DP_QUIRK_FORCE_DPCD_BACKLIGHT
> entirely?
> >
> > Kai-Heng
> >
> > >
> > > On Wed, 2020-10-07 at 14:58 +0800, Kai-Heng Feng wrote:
> > > > HP DreamColor panel needs to be controlled via AUX interface.
> However,
> > > > it has both DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP and
> > > > DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP set, so it fails to pass
> > > > intel_dp_aux_display_control_capable() test.
> > > >
> > > > Skip the test if the panel has force DPCD quirk.
> > > >
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > ---
> > > > drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 10 ++++++----
> > > > 1 file changed, 6 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > index acbd7eb66cbe..acf2e1c65290 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > > > @@ -347,9 +347,13 @@ int intel_dp_aux_init_backlight_funcs(struct
> > > > intel_connector *intel_connector)
> > > >   struct intel_panel *panel = &intel_connector->panel;
> > > >   struct intel_dp *intel_dp =
> enc_to_intel_dp(intel_connector->encoder);
> > > >   struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > > > + bool force_dpcd;
> > > > +
> > > > + force_dpcd = drm_dp_has_quirk(&intel_dp->desc,
> intel_dp->edid_quirks,
> > > > +                               DP_QUIRK_FORCE_DPCD_BACKLIGHT);
> > > >
> > > >   if (i915->params.enable_dpcd_backlight == 0 ||
> > > > -     !intel_dp_aux_display_control_capable(intel_connector))
> > > > +     (!force_dpcd &&
> > > > !intel_dp_aux_display_control_capable(intel_connector)))
> > > >           return -ENODEV;
> > > >
> > > >   /*
> > > > @@ -358,9 +362,7 @@ int intel_dp_aux_init_backlight_funcs(struct
> > > > intel_connector *intel_connector)
> > > >    */
> > > >   if (i915->vbt.backlight.type !=
> > > >       INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE &&
> > > > -     i915->params.enable_dpcd_backlight != 1 &&
> > > > -     !drm_dp_has_quirk(&intel_dp->desc, intel_dp->edid_quirks,
> > > > -                       DP_QUIRK_FORCE_DPCD_BACKLIGHT)) {
> > > > +     i915->params.enable_dpcd_backlight != 1 && !force_dpcd) {
> > > >           drm_info(&i915->drm,
> > > >                    "Panel advertises DPCD backlight support, but "
> > > >                    "VBT disagrees. If your backlight controls "
> > > --
> > > Sincerely,
> > >      Lyude Paul (she/her)
> > >      Software Engineer at Red Hat
> --
> Sincerely,
>       Lyude Paul (she/her)
>       Software Engineer at Red Hat
>
>

--000000000000f7378b05b12f92e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Kevin Chowski said he would be geting to working on upstre=
aming a version of that which was in the ChromeOS tree here:=C2=A0<div><br>=
</div><div><a href=3D"https://chromium-review.googlesource.com/c/chromiumos=
/third_party/kernel/+/2344844">https://chromium-review.googlesource.com/c/c=
hromiumos/third_party/kernel/+/2344844</a> when I last spoke to hi<div><br>=
</div><div>(This was two weeks ago.)</div></div><div><br></div><div>Kevin -=
 do you have any input on this?</div><div><br></div><div>Satadru</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Oct 8, 2020 at 1:07 PM Lyude Paul &lt;<a href=3D"mailto:lyude@redhat.com=
" target=3D"_blank">lyude@redhat.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">oh hold on, I misspoke. Here&#39;s the =
patch I was thinking of:<br>
<br>
<a href=3D"https://patchwork.freedesktop.org/series/82041/" rel=3D"noreferr=
er" target=3D"_blank">https://patchwork.freedesktop.org/series/82041/</a><b=
r>
<br>
On Thu, 2020-10-08 at 10:32 +0800, Kai-Heng Feng wrote:<br>
&gt; Hi Lyude,<br>
&gt; <br>
&gt; &gt; On Oct 8, 2020, at 05:53, Lyude Paul &lt;<a href=3D"mailto:lyude@=
redhat.com" target=3D"_blank">lyude@redhat.com</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; Hi! I thought this patch rang a bell, we actually already had som=
e<br>
&gt; &gt; discussion<br>
&gt; &gt; about this since there&#39;s a couple of other systems this was c=
ausing issues<br>
&gt; &gt; for.<br>
&gt; &gt; Unfortunately it never seems like that patch got sent out. Satadr=
u?<br>
&gt; &gt; <br>
&gt; &gt; (if I don&#39;t hear back from them soon, I&#39;ll just send out =
a patch for this<br>
&gt; &gt; myself)<br>
&gt; &gt; <br>
&gt; &gt; JFYI - the proper fix here is to just drop the<br>
&gt; &gt; DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP check from the code entir=
ely. As<br>
&gt; &gt; long as<br>
&gt; &gt; the backlight supports AUX_SET_CAP, that should be enough for us =
to control<br>
&gt; &gt; it.<br>
&gt; <br>
&gt; Does the proper fix include dropping DP_QUIRK_FORCE_DPCD_BACKLIGHT ent=
irely?<br>
&gt; <br>
&gt; Kai-Heng<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; On Wed, 2020-10-07 at 14:58 +0800, Kai-Heng Feng wrote:<br>
&gt; &gt; &gt; HP DreamColor panel needs to be controlled via AUX interface=
. However,<br>
&gt; &gt; &gt; it has both DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP and<br>
&gt; &gt; &gt; DP_EDP_BACKLIGHT_BRIGHTNESS_PWM_PIN_CAP set, so it fails to =
pass<br>
&gt; &gt; &gt; intel_dp_aux_display_control_capable() test.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Skip the test if the panel has force DPCD quirk.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Kai-Heng Feng &lt;<a href=3D"mailto:kai.heng.=
feng@canonical.com" target=3D"_blank">kai.heng.feng@canonical.com</a>&gt;<b=
r>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 10 +=
+++++----<br>
&gt; &gt; &gt; 1 file changed, 6 insertions(+), 4 deletions(-)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backl=
ight.c<br>
&gt; &gt; &gt; b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<br>
&gt; &gt; &gt; index acbd7eb66cbe..acf2e1c65290 100644<br>
&gt; &gt; &gt; --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<=
br>
&gt; &gt; &gt; +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<=
br>
&gt; &gt; &gt; @@ -347,9 +347,13 @@ int intel_dp_aux_init_backlight_funcs(s=
truct<br>
&gt; &gt; &gt; intel_connector *intel_connector)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0struct intel_panel *panel =3D &amp;intel_connect=
or-&gt;panel;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0struct intel_dp *intel_dp =3D enc_to_intel_dp(in=
tel_connector-&gt;encoder);<br>
&gt; &gt; &gt;=C2=A0 =C2=A0struct drm_i915_private *i915 =3D dp_to_i915(int=
el_dp);<br>
&gt; &gt; &gt; + bool force_dpcd;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; + force_dpcd =3D drm_dp_has_quirk(&amp;intel_dp-&gt;desc, in=
tel_dp-&gt;edid_quirks,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DP_QUIRK_FORCE_DPCD_BAC=
KLIGHT);<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0if (i915-&gt;params.enable_dpcd_backlight =3D=3D=
 0 ||<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0!intel_dp_aux_display_control_capable(i=
ntel_connector))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0(!force_dpcd &amp;&amp;<br>
&gt; &gt; &gt; !intel_dp_aux_display_control_capable(intel_connector)))<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0/*<br>
&gt; &gt; &gt; @@ -358,9 +362,7 @@ int intel_dp_aux_init_backlight_funcs(st=
ruct<br>
&gt; &gt; &gt; intel_connector *intel_connector)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 */<br>
&gt; &gt; &gt;=C2=A0 =C2=A0if (i915-&gt;vbt.backlight.type !=3D<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INTEL_BACKLIGHT_VESA_EDP_AUX_INTER=
FACE &amp;&amp;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0i915-&gt;params.enable_dpcd_backlight !=
=3D 1 &amp;&amp;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0!drm_dp_has_quirk(&amp;intel_dp-&gt;des=
c, intel_dp-&gt;edid_quirks,<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0DP_QUIRK_FORCE_DPCD_BACKLIGHT)) {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0i915-&gt;params.enable_dpcd_backlight !=
=3D 1 &amp;&amp; !force_dpcd) {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_info(&amp;i915-&=
gt;drm,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Panel advertises DPCD backlight support, but &quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;VBT disagrees. If your backlight controls &quot;<br>
&gt; &gt; -- <br>
&gt; &gt; Sincerely,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Lyude Paul (she/her)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 Software Engineer at Red Hat<br>
-- <br>
Sincerely,<br>
=C2=A0 =C2=A0 =C2=A0 Lyude Paul (she/her)<br>
=C2=A0 =C2=A0 =C2=A0 Software Engineer at Red Hat<br>
<br>
</blockquote></div>

--000000000000f7378b05b12f92e7--

--===============1590714799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1590714799==--
