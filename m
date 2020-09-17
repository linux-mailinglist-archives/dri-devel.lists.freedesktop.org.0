Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182CA26E466
	for <lists+dri-devel@lfdr.de>; Thu, 17 Sep 2020 20:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D2D6EC75;
	Thu, 17 Sep 2020 18:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FA56EC73
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 18:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600368458;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ghYxhMCNQuXMvzmvt/HUTZrhOY7/Mqc1ggh+LnAUtcw=;
 b=gs1Y+kFXuj/L8Tyau03bbijGUFDLczbKPnhtu01v35EmYqiLpM3QEu2Kj3TJZiUooiC62w
 9aFo9uAiIs/FT5FwJ9DBBImPnFSmRMx01/BNO6dZwpMb01K8p6stTfKPGa43YyUXRHAegd
 3VySBKA3nRu0Y/m6X4RED5zNjvJ7ORc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-8xHFDz1KOqSHH0hA3baLEA-1; Thu, 17 Sep 2020 14:47:33 -0400
X-MC-Unique: 8xHFDz1KOqSHH0hA3baLEA-1
Received: by mail-qt1-f197.google.com with SMTP id a26so2521418qtb.16
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 11:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version;
 bh=vXT8RTQxGS5FYNBEVD8iwibOV6IBKVRsn0WLomOxrdg=;
 b=Z8As5M5gyPW/D+n1WAA25Pcu+q7k6lPCzXkQSYZSas9A+hJngBQRKac97o/thwEK7M
 szpWZ2iU+cFK5vhWzZ8je/t7PpLEzzIWAWEI8A6+d4DiDlGUdlLwlPNBXiteJVHcczi8
 0AGjAeyXmTzRRw0vQo6VKNFLFVv6h3um8NFGYz2KIOGTFVFqtOutdm8sYwzwdJLfqw8h
 W6sFwuMvrwf8gJS5u61upWB4F4kPbGVaWlmx74/ydf/N6CfLcpqEeME9ZZTKRKauYTEu
 F+2ZFcxSGgr6zvQF01IRjZB/KBf7GKHsrs5YRbGS3xGNCr5mwDnUHnj4o6UeX4vfRDig
 H4MQ==
X-Gm-Message-State: AOAM532wZn2xkYuC7JAHAWbTHvSkIEB1Gx5hs6vc3uKF8SOYCqz0hily
 n0NcC1LV3PTBezXCis32ZDu4/wUBhdPnaDTMzMIUOIKwJkJT0zesqhbDts7QVwBuMdeaONaI35R
 Qc6VPRdRecAsUXVkgPgzD1lo733AQ
X-Received: by 2002:ac8:44d2:: with SMTP id b18mr11949724qto.172.1600368453376; 
 Thu, 17 Sep 2020 11:47:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJWjwqOsVTkXFWmCg431207ZwDaIc8fd0luC+eQnL4OJURtLHXLQYFRvJ1nSg3I17p8B/NCg==
X-Received: by 2002:ac8:44d2:: with SMTP id b18mr11949703qto.172.1600368453123; 
 Thu, 17 Sep 2020 11:47:33 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id t10sm423033qkt.55.2020.09.17.11.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 11:47:31 -0700 (PDT)
Message-ID: <7742d99027ba51317d139a3bdddf13c886d7d28c.camel@redhat.com>
Subject: Re: [PATCH] i915: Introduce quirk for shifting eDP brightness.
From: Lyude Paul <lyude@redhat.com>
To: Kevin Chowski <chowski@chromium.org>
Date: Thu, 17 Sep 2020 14:47:30 -0400
In-Reply-To: <CANM=9DME980-tuvLgyAdA0aEZ8fzFO6nu8GK=OxBzPoapibQMA@mail.gmail.com>
References: <20200917110838.1.I63d52f5b96d7e81e1e2dc2a72c4bf5fd84d3d3d0@changeid>
 <e3dfb952555890779ad0717370786bf748955494.camel@redhat.com>
 <CANM=9DME980-tuvLgyAdA0aEZ8fzFO6nu8GK=OxBzPoapibQMA@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: multipart/mixed; boundary="===============1623172285=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1623172285==
Content-Type: multipart/alternative; boundary="=-NStdr8m4UwSEklYr3SyF"

--=-NStdr8m4UwSEklYr3SyF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-09-17 at 11:31 -0600, Kevin Chowski wrote:
> Thanks very much for the quick reply, Lyude!
> 
> I'm happy to make the requested changes, but I wanted to clarify before
> falling down the wrong hole: are you suggesting that I move
> the intel_dp_aux_set_backlight/intel_dp_aux_get_backlight routines to
> the drm_dp_helper.c file?

You don't have to do that yet (although I wouldn't object either way), I was
just mostly implying using drm_dp_has_quirk()
> On Thu, Sep 17, 2020 at 11:13 AM Lyude Paul <lyude@redhat.com> wrote:
> > Just an FYI, my plan for some of this eDP backlight code is to move as much
> > of
> > 
> > it into helpers as possible since we need to implement the same interface in
> > 
> > nouveau. We probably can figure out some other solution for handling this
> > quirk
> > 
> > if this isn't possible, but could we maybe use the panel's OUI here and add
> > a
> > 
> > quirk to drm_dp_helper.c instead?
> > 
> > 
> > 
> > On Thu, 2020-09-17 at 11:09 -0600, Kevin Chowski wrote:
> > 
> > > We have observed that Google Pixelbook's backlight hardware is
> > 
> > > interpretting these backlight bits from the most-significant side of the
> > 
> > > 16 bit word (if DP_EDP_PWMGEN_BIT_COUNT < 16), whereas the driver code
> > 
> > > assumes the peripheral cares about the least-significant bits.
> > 
> > > 
> > 
> > > Testing was done from within Chrome OS's build environment when the
> > 
> > > patch is backported to 5.4 (the version we are newly targeting for the
> > 
> > > Pixelbook); for the record:
> > 
> > >    $ emerge-eve-kernelnext sys-kernel/chromeos-kernel-5_4 && \
> > 
> > >       ./update_kernel.sh --remote=$IP
> > 
> > > 
> > 
> > > I used `/sys/kernel/debug/dri/0/eDP-1/i915_dpcd` on my laptop to verify
> > 
> > > that the registers were being set according to what the actual hardware
> > 
> > > expects; I also observe that the backlight is noticeably brighter with
> > 
> > > this patch.
> > 
> > > 
> > 
> > > Signed-off-by: Kevin Chowski <chowski@chromium.org>
> > 
> > > ---
> > 
> > > 
> > 
> > >  .../drm/i915/display/intel_dp_aux_backlight.c | 34 +++++++++++++++++++
> > 
> > >  drivers/gpu/drm/i915/display/intel_quirks.c   | 13 +++++++
> > 
> > >  drivers/gpu/drm/i915/i915_drv.h               |  1 +
> > 
> > >  3 files changed, 48 insertions(+)
> > 
> > > 
> > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > 
> > > b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > 
> > > index acbd7eb66cbe3..99c98f217356d 100644
> > 
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > 
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> > 
> > > @@ -91,6 +91,23 @@ static u32 intel_dp_aux_get_backlight(struct
> > 
> > > intel_connector *connector)
> > 
> > >       if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> > 
> > >               level = (read_val[0] << 8 | read_val[1]);
> > 
> > >  
> > 
> > > +     if (i915->quirks & QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS) {
> > 
> > > +             if (!drm_dp_dpcd_readb(&intel_dp->aux,
> > DP_EDP_PWMGEN_BIT_COUNT,
> > 
> > > +                                             &read_val[0])) {
> > 
> > > +                     DRM_DEBUG_KMS("Failed to read DPCD register 0x%x\n",
> > 
> > > +                                     DP_EDP_PWMGEN_BIT_COUNT);
> > 
> > > +                     return 0;
> > 
> > > +             }
> > 
> > > +             // Only bits 4:0 are used, 7:5 are reserved.
> > 
> > > +             read_val[0] = read_val[0] & 0x1F;
> > 
> > > +             if (read_val[0] > 16) {
> > 
> > > +                     DRM_DEBUG_KMS("Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X,
> > 
> > > expected at most 16\n",
> > 
> > > +                                             read_val[0]);
> > 
> > > +                     return 0;
> > 
> > > +             }
> > 
> > > +             level >>= 16 - read_val[0];
> > 
> > > +     }
> > 
> > > +
> > 
> > >       return level;
> > 
> > >  }
> > 
> > >  
> > 
> > > @@ -106,6 +123,23 @@ intel_dp_aux_set_backlight(const struct
> > 
> > > drm_connector_state *conn_state, u32 lev
> > 
> > >       struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> > 
> > >       u8 vals[2] = { 0x0 };
> > 
> > >  
> > 
> > > +     if (i915->quirks & QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS) {
> > 
> > > +             if (!drm_dp_dpcd_readb(&intel_dp->aux,
> > DP_EDP_PWMGEN_BIT_COUNT,
> > 
> > > +                                             &vals[0])) {
> > 
> > > +                     DRM_DEBUG_KMS("Failed to write aux backlight level:
> > 
> > > Failed to read DPCD register 0x%x\n",
> > 
> > > +                                       DP_EDP_PWMGEN_BIT_COUNT);
> > 
> > > +                     return;
> > 
> > > +             }
> > 
> > > +             // Only bits 4:0 are used, 7:5 are reserved.
> > 
> > > +             vals[0] = vals[0] & 0x1F;
> > 
> > > +             if (vals[0] > 16) {
> > 
> > > +                     DRM_DEBUG_KMS("Failed to write aux backlight level:
> > 
> > > Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X, expected at most 16\n",
> > 
> > > +                                             vals[0]);
> > 
> > > +                     return;
> > 
> > > +             }
> > 
> > > +             level <<= (16 - vals[0]) & 0xFFFF;
> > 
> > > +     }
> > 
> > > +
> > 
> > >       vals[0] = level;
> > 
> > >  
> > 
> > >       /* Write the MSB and/or LSB */
> > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c
> > 
> > > b/drivers/gpu/drm/i915/display/intel_quirks.c
> > 
> > > index 46beb155d835f..63b27d49b2864 100644
> > 
> > > --- a/drivers/gpu/drm/i915/display/intel_quirks.c
> > 
> > > +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
> > 
> > > @@ -53,6 +53,16 @@ static void quirk_increase_ddi_disabled_time(struct
> > 
> > > drm_i915_private *i915)
> > 
> > >       drm_info(&i915->drm, "Applying Increase DDI Disabled quirk\n");
> > 
> > >  }
> > 
> > >  
> > 
> > > +/*
> > 
> > > + * Some eDP backlight hardware uses the most-significant bits of the
> > 
> > > brightness
> > 
> > > + * register, so brightness values must be shifted first.
> > 
> > > + */
> > 
> > > +static void quirk_shift_edp_backlight_brightness(struct drm_i915_private
> > 
> > > *i915)
> > 
> > > +{
> > 
> > > +     i915->quirks |= QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS;
> > 
> > > +     DRM_INFO("Applying shift eDP backlight brightness quirk\n");
> > 
> > > +}
> > 
> > > +
> > 
> > >  struct intel_quirk {
> > 
> > >       int device;
> > 
> > >       int subsystem_vendor;
> > 
> > > @@ -156,6 +166,9 @@ static struct intel_quirk intel_quirks[] = {
> > 
> > >       /* ASRock ITX*/
> > 
> > >       { 0x3185, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
> > 
> > >       { 0x3184, 0x1849, 0x2212, quirk_increase_ddi_disabled_time },
> > 
> > > +
> > 
> > > +     /* Google Pixelbook */
> > 
> > > +     { 0x591E, 0x8086, 0x2212, quirk_shift_edp_backlight_brightness },
> > 
> > >  };
> > 
> > >  
> > 
> > >  void intel_init_quirks(struct drm_i915_private *i915)
> > 
> > > diff --git a/drivers/gpu/drm/i915/i915_drv.h
> > b/drivers/gpu/drm/i915/i915_drv.h
> > 
> > > index e4f7f6518945b..cc93bede4fab8 100644
> > 
> > > --- a/drivers/gpu/drm/i915/i915_drv.h
> > 
> > > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > 
> > > @@ -525,6 +525,7 @@ struct i915_psr {
> > 
> > >  #define QUIRK_PIN_SWIZZLED_PAGES (1<<5)
> > 
> > >  #define QUIRK_INCREASE_T12_DELAY (1<<6)
> > 
> > >  #define QUIRK_INCREASE_DDI_DISABLED_TIME (1<<7)
> > 
> > > +#define QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS (1<<8)
> > 
> > >  
> > 
> > >  struct intel_fbdev;
> > 
> > >  struct intel_fbc_work;
> > 
-- 
Sincerely,
Lyude Paul (she/her)
Software Engineer at Red Hat

--=-NStdr8m4UwSEklYr3SyF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Thu, 2020-09-17 at 11:31 -0600, Kevin Chowski wrote:</div><bloc=
kquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf so=
lid;padding-left:1ex"><div dir=3D"ltr">Thanks very much for the quick reply=
, Lyude!<br><br>I'm happy to make the requested changes, but I wanted to cl=
arify before falling down the wrong hole: are you suggesting that I move th=
e&nbsp;intel_dp_aux_set_backlight/intel_dp_aux_get_backlight routines&nbsp;=
to the&nbsp;drm_dp_helper.c file?</div></blockquote><div><br></div><div>You=
 don't have to do that yet (although I wouldn't object either way), I was j=
ust mostly implying using drm_dp_has_quirk()</div><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
hu, Sep 17, 2020 at 11:13 AM Lyude Paul &lt;<a href=3D"mailto:lyude@redhat.=
com">lyude@redhat.com</a>&gt; wrote:<br></div><blockquote type=3D"cite" sty=
le=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">Ju=
st an FYI, my plan for some of this eDP backlight code is to move as much o=
f<br>
it into helpers as possible since we need to implement the same interface i=
n<br>
nouveau. We probably can figure out some other solution for handling this q=
uirk<br>
if this isn't possible, but could we maybe use the panel's OUI here and add=
 a<br>
quirk to drm_dp_helper.c instead?<br>
<br>
On Thu, 2020-09-17 at 11:09 -0600, Kevin Chowski wrote:<br>
&gt; We have observed that Google Pixelbook's backlight hardware is<br>
&gt; interpretting these backlight bits from the most-significant side of t=
he<br>
&gt; 16 bit word (if DP_EDP_PWMGEN_BIT_COUNT &lt; 16), whereas the driver c=
ode<br>
&gt; assumes the peripheral cares about the least-significant bits.<br>
&gt; <br>
&gt; Testing was done from within Chrome OS's build environment when the<br=
>
&gt; patch is backported to 5.4 (the version we are newly targeting for the=
<br>
&gt; Pixelbook); for the record:<br>
&gt;&nbsp; &nbsp; $ emerge-eve-kernelnext sys-kernel/chromeos-kernel-5_4 &a=
mp;&amp; \<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;./update_kernel.sh --remote=3D$IP<br>
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
&gt;&nbsp; .../drm/i915/display/intel_dp_aux_backlight.c | 34 +++++++++++++=
++++++<br>
&gt;&nbsp; drivers/gpu/drm/i915/display/intel_quirks.c&nbsp; &nbsp;| 13 +++=
++++<br>
&gt;&nbsp; drivers/gpu/drm/i915/i915_drv.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
&gt;&nbsp; 3 files changed, 48 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<br>
&gt; b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<br>
&gt; index acbd7eb66cbe3..99c98f217356d 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c<br>
&gt; @@ -91,6 +91,23 @@ static u32 intel_dp_aux_get_backlight(struct<br>
&gt; intel_connector *connector)<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;if (intel_dp-&gt;edp_dpcd[2] &amp; DP_EDP_BA=
CKLIGHT_BRIGHTNESS_BYTE_COUNT)<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;level =3D (read_=
val[0] &lt;&lt; 8 | read_val[1]);<br>
&gt;&nbsp; <br>
&gt; +&nbsp; &nbsp; &nbsp;if (i915-&gt;quirks &amp; QUIRK_SHIFT_EDP_BACKLIG=
HT_BRIGHTNESS) {<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!drm_dp_dpcd_read=
b(&amp;intel_dp-&gt;aux, DP_EDP_PWMGEN_BIT_COUNT,<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;&amp;read_val[0])) {<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;DRM_DEBUG_KMS("Failed to read DPCD register 0x%x\n",<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DP_EDP_PWMGE=
N_BIT_COUNT);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;return 0;<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Only bits 4:0 are =
used, 7:5 are reserved.<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;read_val[0] =3D read_=
val[0] &amp; 0x1F;<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (read_val[0] &gt; =
16) {<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;DRM_DEBUG_KMS("Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X,<br>
&gt; expected at most 16\n",<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;read_val[0]);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;return 0;<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;level &gt;&gt;=3D 16 =
- read_val[0];<br>
&gt; +&nbsp; &nbsp; &nbsp;}<br>
&gt; +<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;return level;<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; @@ -106,6 +123,23 @@ intel_dp_aux_set_backlight(const struct<br>
&gt; drm_connector_state *conn_state, u32 lev<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;struct drm_i915_private *i915 =3D dp_to_i915=
(intel_dp);<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;u8 vals[2] =3D { 0x0 };<br>
&gt;&nbsp; <br>
&gt; +&nbsp; &nbsp; &nbsp;if (i915-&gt;quirks &amp; QUIRK_SHIFT_EDP_BACKLIG=
HT_BRIGHTNESS) {<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!drm_dp_dpcd_read=
b(&amp;intel_dp-&gt;aux, DP_EDP_PWMGEN_BIT_COUNT,<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;&amp;vals[0])) {<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;DRM_DEBUG_KMS("Failed to write aux backlight level:<br>
&gt; Failed to read DPCD register 0x%x\n",<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;DP_ED=
P_PWMGEN_BIT_COUNT);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;return;<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// Only bits 4:0 are =
used, 7:5 are reserved.<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vals[0] =3D vals[0] &=
amp; 0x1F;<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (vals[0] &gt; 16) =
{<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;DRM_DEBUG_KMS("Failed to write aux backlight level:<br>
&gt; Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X, expected at most 16\n",<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;vals[0]);<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;return;<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;level &lt;&lt;=3D (16=
 - vals[0]) &amp; 0xFFFF;<br>
&gt; +&nbsp; &nbsp; &nbsp;}<br>
&gt; +<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;vals[0] =3D level;<br>
&gt;&nbsp; <br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;/* Write the MSB and/or LSB */<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c<br>
&gt; b/drivers/gpu/drm/i915/display/intel_quirks.c<br>
&gt; index 46beb155d835f..63b27d49b2864 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_quirks.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_quirks.c<br>
&gt; @@ -53,6 +53,16 @@ static void quirk_increase_ddi_disabled_time(struct=
<br>
&gt; drm_i915_private *i915)<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;drm_info(&amp;i915-&gt;drm, "Applying Increa=
se DDI Disabled quirk\n");<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
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
&gt; +&nbsp; &nbsp; &nbsp;i915-&gt;quirks |=3D QUIRK_SHIFT_EDP_BACKLIGHT_BR=
IGHTNESS;<br>
&gt; +&nbsp; &nbsp; &nbsp;DRM_INFO("Applying shift eDP backlight brightness=
 quirk\n");<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; struct intel_quirk {<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;int device;<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;int subsystem_vendor;<br>
&gt; @@ -156,6 +166,9 @@ static struct intel_quirk intel_quirks[] =3D {<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;/* ASRock ITX*/<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;{ 0x3185, 0x1849, 0x2212, quirk_increase_ddi=
_disabled_time },<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp;{ 0x3184, 0x1849, 0x2212, quirk_increase_ddi=
_disabled_time },<br>
&gt; +<br>
&gt; +&nbsp; &nbsp; &nbsp;/* Google Pixelbook */<br>
&gt; +&nbsp; &nbsp; &nbsp;{ 0x591E, 0x8086, 0x2212, quirk_shift_edp_backlig=
ht_brightness },<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt;&nbsp; void intel_init_quirks(struct drm_i915_private *i915)<br>
&gt; diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i9=
15_drv.h<br>
&gt; index e4f7f6518945b..cc93bede4fab8 100644<br>
&gt; --- a/drivers/gpu/drm/i915/i915_drv.h<br>
&gt; +++ b/drivers/gpu/drm/i915/i915_drv.h<br>
&gt; @@ -525,6 +525,7 @@ struct i915_psr {<br>
&gt;&nbsp; #define QUIRK_PIN_SWIZZLED_PAGES (1&lt;&lt;5)<br>
&gt;&nbsp; #define QUIRK_INCREASE_T12_DELAY (1&lt;&lt;6)<br>
&gt;&nbsp; #define QUIRK_INCREASE_DDI_DISABLED_TIME (1&lt;&lt;7)<br>
&gt; +#define QUIRK_SHIFT_EDP_BACKLIGHT_BRIGHTNESS (1&lt;&lt;8)<br>
&gt;&nbsp; <br>
&gt;&nbsp; struct intel_fbdev;<br>
&gt;&nbsp; struct intel_fbc_work;<br>
</blockquote></div></blockquote><div><span><pre>-- <br></pre><div style=3D"=
width: 80ch;">Sincerely,</div><div style=3D"margin-left: 3ch; word-wrap: no=
rmal; width: 77ch;"><div style=3D"margin-left: 3ch; word-wrap: normal; widt=
h: 74ch;"><div>Lyude Paul (she/her)</div><div>Software Engineer at Red Hat<=
/div></div></div></span></div></body></html>

--=-NStdr8m4UwSEklYr3SyF--


--===============1623172285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1623172285==--

