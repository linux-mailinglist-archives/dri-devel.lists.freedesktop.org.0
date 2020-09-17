Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848AC26E814
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 00:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C766E0DF;
	Thu, 17 Sep 2020 22:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C326E2D3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 17:31:24 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id q4so3084211ils.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3/0+y5PbtwBgxrMJ+KqGjVQEtm1T45UJncLtqkaRO20=;
 b=l2tLBBepUhFLm4JyHfEUk5MPtED4cTGyBYUm91XWN1JVLXzk4BZ0aSQ0FRVUWrcmnp
 rioTU5XOl20hiiiFJJU1+O4SGfiwKTbJS7KCtAzXCeU82f3ng3dEZhJc+65F/4gfGBZy
 m2TfNy1mJoYqXYYXjt3X7cM2V88KOiZfh6EtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3/0+y5PbtwBgxrMJ+KqGjVQEtm1T45UJncLtqkaRO20=;
 b=WW5ELz1WNIq/Ij863Qj5qiz4V3WpFTwqt48kQy9FOvtm1eaWFEdeP4qdLIGFWrGEvQ
 QMxEGpbvff0E7h65nS3SW/SbGGbr36qC9Ea80zcWdLLEYwTc7+vwmZFQ3R0xGCGVCh9+
 hzqo6kQc0MrL0RmlU/WUG17KqMOFCmAia5p7asZRiAya+Cezgsj1mrJSxtVAk3xJ96OY
 pJtt0FfHFEwZM77AzgftR7KNS/hLNMc1t8YenRY9vuG4VvkJy1gl6grmV+qZVYZzoJPr
 oDPrlYYr0X587vH9DKSpwvNRCSicfsh39Hf043txR6dN2ub1hFjciiaISPUtwohAJc2T
 OghQ==
X-Gm-Message-State: AOAM532KXGIpuPW+NLkjmVbCaqcYMOE3PEecKIzUCdkpZPh8+kUVN2rM
 R2Y8fug+JC2vH7Gzdjo243z65nFMFIpTt1i1yXWjVw==
X-Google-Smtp-Source: ABdhPJwVhVrKdH3d/hHLzrhucpTrZxXPks3qtSJdAK1ciJ5jydKQVMJvqNdt/jLAaFocWEWvojECc7Y+/+DnCJ+o9hI=
X-Received: by 2002:a05:6e02:49:: with SMTP id
 i9mr18463323ilr.40.1600363884023; 
 Thu, 17 Sep 2020 10:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200917110838.1.I63d52f5b96d7e81e1e2dc2a72c4bf5fd84d3d3d0@changeid>
 <e3dfb952555890779ad0717370786bf748955494.camel@redhat.com>
In-Reply-To: <e3dfb952555890779ad0717370786bf748955494.camel@redhat.com>
From: Kevin Chowski <chowski@chromium.org>
Date: Thu, 17 Sep 2020 11:31:13 -0600
Message-ID: <CANM=9DME980-tuvLgyAdA0aEZ8fzFO6nu8GK=OxBzPoapibQMA@mail.gmail.com>
Subject: Re: [PATCH] i915: Introduce quirk for shifting eDP brightness.
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 22:17:03 +0000
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
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: multipart/mixed; boundary="===============1922716446=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1922716446==
Content-Type: multipart/alternative; boundary="000000000000d1abc905af85c017"

--000000000000d1abc905af85c017
Content-Type: text/plain; charset="UTF-8"

Thanks very much for the quick reply, Lyude!

I'm happy to make the requested changes, but I wanted to clarify before
falling down the wrong hole: are you suggesting that I move
the intel_dp_aux_set_backlight/intel_dp_aux_get_backlight routines to
the drm_dp_helper.c file?

On Thu, Sep 17, 2020 at 11:13 AM Lyude Paul <lyude@redhat.com> wrote:

> Just an FYI, my plan for some of this eDP backlight code is to move as
> much of
> it into helpers as possible since we need to implement the same interface
> in
> nouveau. We probably can figure out some other solution for handling this
> quirk
> if this isn't possible, but could we maybe use the panel's OUI here and
> add a
> quirk to drm_dp_helper.c instead?
>
> On Thu, 2020-09-17 at 11:09 -0600, Kevin Chowski wrote:
> > We have observed that Google Pixelbook's backlight hardware is
> > interpretting these backlight bits from the most-significant side of the
> > 16 bit word (if DP_EDP_PWMGEN_BIT_COUNT < 16), whereas the driver code
> > assumes the peripheral cares about the least-significant bits.
> >
> > Testing was done from within Chrome OS's build environment when the
> > patch is backported to 5.4 (the version we are newly targeting for the
> > Pixelbook); for the record:
> >    $ emerge-eve-kernelnext sys-kernel/chromeos-kernel-5_4 && \
> >       ./update_kernel.sh --remote=$IP
> >
> > I used `/sys/kernel/debug/dri/0/eDP-1/i915_dpcd` on my laptop to verify
> > that the registers were being set according to what the actual hardware
> > expects; I also observe that the backlight is noticeably brighter with
> > this patch.
> >
> > Signed-off-by: Kevin Chowski <chowski@chromium.org>
> > ---
> >
> >  .../drm/i915/display/intel_dp_aux_backlight.c | 34 +++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_quirks.c   | 13 +++++++
> >  drivers/gpu/drm/i915/i915_drv.h               |  1 +
> >  3 files changed, 48 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > index acbd7eb66cbe3..99c98f217356d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > @@ -91,6 +91,23 @@ static u32 intel_dp_aux_get_backlight(struct
> > intel_connector *connector)
> >       if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> >               level = (read_val[0] << 8 | read_val[1]);
> >
> > +     if (i915->quirks & QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS) {
> > +             if (!drm_dp_dpcd_readb(&intel_dp->aux,
> DP_EDP_PWMGEN_BIT_COUNT,
> > +                                             &read_val[0])) {
> > +                     DRM_DEBUG_KMS("Failed to read DPCD register
> 0x%x\n",
> > +                                     DP_EDP_PWMGEN_BIT_COUNT);
> > +                     return 0;
> > +             }
> > +             // Only bits 4:0 are used, 7:5 are reserved.
> > +             read_val[0] = read_val[0] & 0x1F;
> > +             if (read_val[0] > 16) {
> > +                     DRM_DEBUG_KMS("Invalid DP_EDP_PWNGEN_BIT_COUNT
> 0x%X,
> > expected at most 16\n",
> > +                                             read_val[0]);
> > +                     return 0;
> > +             }
> > +             level >>= 16 - read_val[0];
> > +     }
> > +
> >       return level;
> >  }
> >
> > @@ -106,6 +123,23 @@ intel_dp_aux_set_backlight(const struct
> > drm_connector_state *conn_state, u32 lev
> >       struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> >       u8 vals[2] = { 0x0 };
> >
> > +     if (i915->quirks & QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS) {
> > +             if (!drm_dp_dpcd_readb(&intel_dp->aux,
> DP_EDP_PWMGEN_BIT_COUNT,
> > +                                             &vals[0])) {
> > +                     DRM_DEBUG_KMS("Failed to write aux backlight level:
> > Failed to read DPCD register 0x%x\n",
> > +                                       DP_EDP_PWMGEN_BIT_COUNT);
> > +                     return;
> > +             }
> > +             // Only bits 4:0 are used, 7:5 are reserved.
> > +             vals[0] = vals[0] & 0x1F;
> > +             if (vals[0] > 16) {
> > +                     DRM_DEBUG_KMS("Failed to write aux backlight level:
> > Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X, expected at most 16\n",
> > +                                             vals[0]);
> > +                     return;
> > +             }
> > +             level <<= (16 - vals[0]) & 0xFFFF;
> > +     }
> > +
> >       vals[0] = level;
> >
> >       /* Write the MSB and/or LSB */
> > diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c
> > b/drivers/gpu/drm/i915/display/intel_quirks.c
> > index 46beb155d835f..63b27d49b2864 100644
> > --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> > +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> > @@ -53,6 +53,16 @@ static void quirk_increase_ddi_disabled_time(struct
> > drm_i915_private *i915)
> >       drm_info(&i915->drm, "Applying Increase DDI Disabled quirk\n");
> >  }
> >
> > +/*
> > + * Some eDP backlight hardware uses the most-significant bits of the
> > brightness
> > + * register, so brightness values must be shifted first.
> > + */
> > +static void quirk_shift_edp_backlight_brightness(struct drm_i915_private
> > *i915)
> > +{
> > +     i915->quirks |= QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS;
> > +     DRM_INFO("Applying shift eDP backlight brightness quirk\n");
> > +}
> > +
> >  struct intel_quirk {
> >       int device;
> >       int subsystem_vendor;
> > @@ -156,6 +166,9 @@ static struct intel_quirk intel_quirks[] = {
> >       /* ASRock ITX*/
> >       { 0x3185, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
> >       { 0x3184, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
> > +
> > +     /* Google Pixelbook */
> > +     { 0x591E, 0x8086, 0x2212, quirk_shift_edp_backlight_brightness },
> >  };
> >
> >  void intel_init_quirks(struct drm_i915_private *i915)
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h
> b/drivers/gpu/drm/i915/i915_drv.h
> > index e4f7f6518945b..cc93bede4fab8 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -525,6 +525,7 @@ struct i915_psr {
> >  #define QUIRK_PIN_SWIZZLED_PAGES (1<<5)
> >  #define QUIRK_INCREASE_T12_DELAY (1<<6)
> >  #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
> > +#define QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS (1<<8)
> >
> >  struct intel_fbdev;
> >  struct intel_fbc_work;
> --
> Sincerely,
>       Lyude Paul (she/her)
>       Software Engineer at Red Hat
>
>

--000000000000d1abc905af85c017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks very much for the quick reply, Lyude!<br><br>I&#39;=
m happy to make the requested changes, but I wanted to clarify before falli=
ng down the wrong hole: are you suggesting that I move the=C2=A0intel_dp_au=
x_set_backlight/intel_dp_aux_get_backlight routines=C2=A0to the=C2=A0drm_dp=
_helper.c file?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Sep 17, 2020 at 11:13 AM Lyude Paul &lt;<a href=3D"=
mailto:lyude@redhat.com">lyude@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Just an FYI, my plan for some of t=
his eDP backlight code is to move as much of<br>
it into helpers as possible since we need to implement the same interface i=
n<br>
nouveau. We probably can figure out some other solution for handling this q=
uirk<br>
if this isn&#39;t possible, but could we maybe use the panel&#39;s OUI here=
 and add a<br>
quirk to drm_dp_helper.c instead?<br>
<br>
On Thu, 2020-09-17 at 11:09 -0600, Kevin Chowski wrote:<br>
&gt; We have observed that Google Pixelbook&#39;s backlight hardware is<br>
&gt; interpretting these backlight bits from the most-significant side of t=
he<br>
&gt; 16 bit word (if DP_EDP_PWMGEN_BIT_COUNT &lt; 16), whereas the driver c=
ode<br>
&gt; assumes the peripheral cares about the least-significant bits.<br>
&gt; <br>
&gt; Testing was done from within Chrome OS&#39;s build environment when th=
e<br>
&gt; patch is backported to 5.4 (the version we are newly targeting for the=
<br>
&gt; Pixelbook); for the record:<br>
&gt;=C2=A0 =C2=A0 $ emerge-eve-kernelnext sys-kernel/chromeos-kernel-5_4 &a=
mp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0./update_kernel.sh --remote=3D$IP<br>
&gt; <br>
&gt; I used `/sys/kernel/debug/dri/0/eDP-1/i915_dpcd` on my laptop to verif=
y<br>
&gt; that the registers were being set according to what the actual hardwar=
e<br>
&gt; expects; I also observe that the backlight is noticeably brighter with=
<br>
&gt; this patch.<br>
&gt; <br>
&gt; Signed-off-by: Kevin Chowski &lt;<a href=3D"mailto:chowski@chromium.or=
g" target=3D"_blank">chowski@chromium.org</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt;=C2=A0 .../drm/i915/display/intel_dp_aux_backlight.c | 34 +++++++++++++=
++++++<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_quirks.c=C2=A0 =C2=A0| 13 +++=
++++<br>
&gt;=C2=A0 drivers/gpu/drm/i915/i915_drv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 3 files changed, 48 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<br>
&gt; b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<br>
&gt; index acbd7eb66cbe3..99c98f217356d 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<br>
&gt; @@ -91,6 +91,23 @@ static u32 intel_dp_aux_get_backlight(struct<br>
&gt; intel_connector *connector)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (intel_dp-&gt;edp_dpcd[2] &amp; DP_EDP_BA=
CKLIGHT_BRIGHTNESS_BYTE_COUNT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0level =3D (read_=
val[0] &lt;&lt; 8 | read_val[1]);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (i915-&gt;quirks &amp; QUIRK_SHIFT_EDP_BACKLIG=
HT_BRIGHTNESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_dp_dpcd_read=
b(&amp;intel_dp-&gt;aux, DP_EDP_PWMGEN_BIT_COUNT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;read_val[0])) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_DEBUG_KMS(&quot;Failed to read DPCD register 0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DP_EDP_PWMGE=
N_BIT_COUNT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Only bits 4:0 are =
used, 7:5 are reserved.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_val[0] =3D read_=
val[0] &amp; 0x1F;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (read_val[0] &gt; =
16) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_DEBUG_KMS(&quot;Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X,<br>
&gt; expected at most 16\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0read_val[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0level &gt;&gt;=3D 16 =
- read_val[0];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return level;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -106,6 +123,23 @@ intel_dp_aux_set_backlight(const struct<br>
&gt; drm_connector_state *conn_state, u32 lev<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_private *i915 =3D dp_to_i915=
(intel_dp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 vals[2] =3D { 0x0 };<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (i915-&gt;quirks &amp; QUIRK_SHIFT_EDP_BACKLIG=
HT_BRIGHTNESS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_dp_dpcd_read=
b(&amp;intel_dp-&gt;aux, DP_EDP_PWMGEN_BIT_COUNT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;vals[0])) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_DEBUG_KMS(&quot;Failed to write aux backlight level:<br>
&gt; Failed to read DPCD register 0x%x\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DP_ED=
P_PWMGEN_BIT_COUNT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Only bits 4:0 are =
used, 7:5 are reserved.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vals[0] =3D vals[0] &=
amp; 0x1F;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (vals[0] &gt; 16) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_DEBUG_KMS(&quot;Failed to write aux backlight level:<br>
&gt; Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X, expected at most 16\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0vals[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0level &lt;&lt;=3D (16=
 - vals[0]) &amp; 0xFFFF;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vals[0] =3D level;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Write the MSB and/or LSB */<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c<br>
&gt; b/drivers/gpu/drm/i915/display/intel_quirks.c<br>
&gt; index 46beb155d835f..63b27d49b2864 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_quirks.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_quirks.c<br>
&gt; @@ -53,6 +53,16 @@ static void quirk_increase_ddi_disabled_time(struct=
<br>
&gt; drm_i915_private *i915)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_info(&amp;i915-&gt;drm, &quot;Applying I=
ncrease DDI Disabled quirk\n&quot;);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * Some eDP backlight hardware uses the most-significant bits of the<=
br>
&gt; brightness<br>
&gt; + * register, so brightness values must be shifted first.<br>
&gt; + */<br>
&gt; +static void quirk_shift_edp_backlight_brightness(struct drm_i915_priv=
ate<br>
&gt; *i915)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0i915-&gt;quirks |=3D QUIRK_SHIFT_EDP_BACKLIGHT_BR=
IGHTNESS;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_INFO(&quot;Applying shift eDP backlight brigh=
tness quirk\n&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 struct intel_quirk {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int device;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int subsystem_vendor;<br>
&gt; @@ -156,6 +166,9 @@ static struct intel_quirk intel_quirks[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* ASRock ITX*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x3185, 0x1849, 0x2212, quirk_increase_ddi=
_disabled_time },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0x3184, 0x1849, 0x2212, quirk_increase_ddi=
_disabled_time },<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Google Pixelbook */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ 0x591E, 0x8086, 0x2212, quirk_shift_edp_backlig=
ht_brightness },<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void intel_init_quirks(struct drm_i915_private *i915)<br>
&gt; diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i9=
15_drv.h<br>
&gt; index e4f7f6518945b..cc93bede4fab8 100644<br>
&gt; --- a/drivers/gpu/drm/i915/i915_drv.h<br>
&gt; +++ b/drivers/gpu/drm/i915/i915_drv.h<br>
&gt; @@ -525,6 +525,7 @@ struct i915_psr {<br>
&gt;=C2=A0 #define QUIRK_PIN_SWIZZLED_PAGES (1&lt;&lt;5)<br>
&gt;=C2=A0 #define QUIRK_INCREASE_T12_DELAY (1&lt;&lt;6)<br>
&gt;=C2=A0 #define QUIRK_INCREASE_DDI_DISABLED_TIME (1&lt;&lt;7)<br>
&gt; +#define QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS (1&lt;&lt;8)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct intel_fbdev;<br>
&gt;=C2=A0 struct intel_fbc_work;<br>
-- <br>
Sincerely,<br>
=C2=A0 =C2=A0 =C2=A0 Lyude Paul (she/her)<br>
=C2=A0 =C2=A0 =C2=A0 Software Engineer at Red Hat<br>
<br>
</blockquote></div>

--000000000000d1abc905af85c017--

--===============1922716446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1922716446==--
