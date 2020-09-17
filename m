Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A6726E819
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 00:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAF26E405;
	Thu, 17 Sep 2020 22:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FEA6EC6D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 17:34:05 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id f82so3079198ilh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 10:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bvEQFztQPuE8viTRZv4r7NoJrBod8jSBPM7mRWmOF+Q=;
 b=jCONn2tTLvDiGW7wFctPJ63OT+YcQ7bhKJF4WyqpYEfE5v/++tWhcomwDc+jqGwFBq
 MfF6zoiPZM+Iy7spF56rgE/fs3LXOhz9B4bgA2yfBZ8DFDyBKIM0aKk5atHVP7eQgS0v
 0LMFKG4dY9VTvVLwbmWg+9da7/b++K0dmxPiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bvEQFztQPuE8viTRZv4r7NoJrBod8jSBPM7mRWmOF+Q=;
 b=Zt2N1gUVmIEc/8y2WmfGWgVf6DSfDsVvZoWfMOcHs3TGtLa5PBW+l89F/9461ODsRd
 rKdQmDpBVFrBlCHyb89mEnkCw1Y3PJO1yqafJ2+Ju/OeoczmrQnutKhYX7lgP2O23vWl
 1pahEm2QPOegn+nwm6xp45uJ9mqAbbG6rW0oF8TTsHqWMc3FEsasAVZ6TG1sv1pX392N
 ctZWQXmUjiokIuGc5pM0P+CDLz2HM+7SJm1JLG8bkDjSS3V+4N9cEC/NFAWbR+ZqApTu
 wgvGnABT9N/iNSxpdk3Cyp2ksnisv39JV2F2qMpRyna9srIeaFwGp+x7UmtOAqPhn2sj
 x1BA==
X-Gm-Message-State: AOAM532OFuXxGp/SVq4HGh7cO/qyWVlXY5UzJFL8vt8k8+M8W4oymNKN
 GGt3mqq2GGpAwq488ZC83yACkUHBJ0BOgEh12sKbCQ==
X-Google-Smtp-Source: ABdhPJy+6fAG8ognE5b0H5zeigIDrGPIlgUmyvJHvGbn0gU4BsqIo9N+xzdQEUiHr4ZlYAPQadfXG13Z3Eo+ig1LkxI=
X-Received: by 2002:a92:d785:: with SMTP id d5mr19151636iln.123.1600364045296; 
 Thu, 17 Sep 2020 10:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200917110838.1.I63d52f5b96d7e81e1e2dc2a72c4bf5fd84d3d3d0@changeid>
 <e3dfb952555890779ad0717370786bf748955494.camel@redhat.com>
In-Reply-To: <e3dfb952555890779ad0717370786bf748955494.camel@redhat.com>
From: Kevin Chowski <chowski@chromium.org>
Date: Thu, 17 Sep 2020 11:33:54 -0600
Message-ID: <CANM=9DPUh8tZbW=qXEdoE7bKqCv55hHr-YAAOerKi+ES_JSH+A@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(resending as plain-text, my last mail was rejected by lots of
addresses for some reason)

Thanks very much for the quick reply, Lyude!

I'm happy to make the requested changes, but I wanted to clarify
before falling down the wrong hole: are you suggesting that I move the
intel_dp_aux_set_backlight/intel_dp_aux_get_backlight routines to the
drm_dp_helper.c file?

On Thu, Sep 17, 2020 at 11:13 AM Lyude Paul <lyude@redhat.com> wrote:
>
> Just an FYI, my plan for some of this eDP backlight code is to move as much of
> it into helpers as possible since we need to implement the same interface in
> nouveau. We probably can figure out some other solution for handling this quirk
> if this isn't possible, but could we maybe use the panel's OUI here and add a
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
> > +             if (!drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT,
> > +                                             &read_val[0])) {
> > +                     DRM_DEBUG_KMS("Failed to read DPCD register 0x%x\n",
> > +                                     DP_EDP_PWMGEN_BIT_COUNT);
> > +                     return 0;
> > +             }
> > +             // Only bits 4:0 are used, 7:5 are reserved.
> > +             read_val[0] = read_val[0] & 0x1F;
> > +             if (read_val[0] > 16) {
> > +                     DRM_DEBUG_KMS("Invalid DP_EDP_PWNGEN_BIT_COUNT 0x%X,
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
> > +             if (!drm_dp_dpcd_readb(&intel_dp->aux, DP_EDP_PWMGEN_BIT_COUNT,
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
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
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
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
