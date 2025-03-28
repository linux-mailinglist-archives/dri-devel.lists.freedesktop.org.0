Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC64A7495F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FCA710E9ED;
	Fri, 28 Mar 2025 11:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IqdcoGOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B420410E9ED
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:42:27 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so14411435e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 04:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743162146; x=1743766946; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AS/0CIBsi1C255m5jqDocxDCw5rV2cEQ21vMKmlqX4M=;
 b=IqdcoGOQ1vsjWgD882z6pZLq+ue9rJhuK3cbE6sahldPSh+GgV4kX9T92t0sNwmUJG
 dK0XN5eO8fCUV1KISF9RirpEWps9J2RN0Raai0KjwmYm6o+E5iuAV25WGGcjYZDsE0Ck
 ugP4F5ZmnhVxjXeZNk2nULUpqwXKoQXR2T7oR84tHi+m4tiB+AopfKv8Dj27mSbkAwuE
 HPjUKf6ph1SrfhU3qvjNctWS53K8k1xQ4RXYRleV8ht7FQhrec/8IIfklGmxz074MfCj
 JEdBorQmYjpt9/+jLnTNg45DKSwFBLYi0PWtdDkpwuHw5aei30VtC8bxm2IaW/L+A3pl
 +sXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743162146; x=1743766946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AS/0CIBsi1C255m5jqDocxDCw5rV2cEQ21vMKmlqX4M=;
 b=n2GehpbzWJtTS4a58AB+ozs6rKGZty8leprtG4n4Q7PZB6Kukqe8/kU8/AeeWcEoJR
 vVmGpKSrsI5affOCjYkghi6JyF8I8agXSI8KBFGCE6b4dYU1GBwWRRiAcwq3q5HQ6Yss
 p/q5+g0xV48pUDrJg+DIRVWKlSyGyGiAUz7PgfyRjrnTceBmrT0tUFvmb1ADkkLTtwu1
 v0jKij+26dcAqf+5flfX9u4oO9inu47NOSRxgSJv5I9iArUPYDOr6ost2VrwKgApgZrK
 fgRX8UAqfVkva+c2JqnC1I6HRKiYQMhiQ6pMgXwPLFx8HOtWvFnzo9bwvh9GWK38nWy2
 pIDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhN7wM/d9h8mp2gWaMMyBbC/xBR+25IvfK8rl3NewGR6FIHyz47Rf/D8D3Zh+E0WOwaGMpGtcgIrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV0qi7D0tB+MQ4liSWdMOwDd6KqU6lzd5yLLUSp/XoCfmFpVKU
 HA0TXZQVEumiFKyz1ly0s7Uf5d7ugFA/FJCTgxAa9YmifGJp333r5GCV/3Tloss3E2DhlAgswN1
 3tWFsFSdxDR0bDY4x7R/Ujg6BQLlOXCeLzOl8Fw==
X-Gm-Gg: ASbGnctZ4eMth0JfqBVJddAuUEV+J99FHVtrkO/ItUp8iNA2TZ5d9gLt4e7ttdPOSVo
 I+cRU7m8YGJfh7VIOXoRd0YP8vLqPswDQv9/TdlPrfCqoPHZhYHJdbTTHz/Sn7q7SaaraQvvJV+
 2WLfIvWY2+/KMh+bsOoIDm6vozsygFTCNJYZuDP0oX3kUUzphNQK01oPYWFfA8w6Jc3yM94A==
X-Google-Smtp-Source: AGHT+IE6DFwevMI8umQ4tgADXxarbv7OqWe6Kyd18SAYlOSWPmoAsgrW20v3mTBE3zBuxdlvqAAzLVExBU+4czelYKA=
X-Received: by 2002:a05:600c:1d1b:b0:43b:b756:f0a9 with SMTP id
 5b1f17b1804b1-43d84f9a35emr69100225e9.11.1743162146129; Fri, 28 Mar 2025
 04:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org>
 <07c48ba0-dcf5-4ece-8beb-f225652c5014@oss.qualcomm.com>
 <CACr-zFBwbniB3H5cnq0higsX6a_G4Be26N-nNL8JAzci8y9_Mw@mail.gmail.com>
 <CAO9ioeUGS0dX8tC6gfB8GmDB136WFUg4erE9NSNBUCcPrYsUTg@mail.gmail.com>
In-Reply-To: <CAO9ioeUGS0dX8tC6gfB8GmDB136WFUg4erE9NSNBUCcPrYsUTg@mail.gmail.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 28 Mar 2025 11:42:15 +0000
X-Gm-Features: AQ5f1Jq1trXav_HDawVpwNUELxJsb6YJEQRW9zlHX1OK6pOv_cw0hfl6gg857F4
Message-ID: <CACr-zFCuAm2eUOV_Rm1fzS-rsDMy4E=-euiUTJwL5h4z4cvbSA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dp: fallback to minimum when PWM bit count is zero
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Mar 2025 at 11:25, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, 27 Mar 2025 at 20:19, Christopher Obbard
> <christopher.obbard@linaro.org> wrote:
> >
> > Hi Dmitry,
> >
> > On Thu, 27 Mar 2025 at 17:40, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On 27/03/2025 19:25, Christopher Obbard wrote:
> > > > According to the eDP specification (e.g., VESA eDP 1.4b, section 3.3.10.2),
> > > > if DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > > > the sink is required to use the MIN value as the effective bit count.
> > > >
> > > > Some eDP panels report DP_EDP_PWMGEN_BIT_COUNT as 0 while still providing
> > > > valid non-zero MIN and MAX capability values. This patch updates the logic
> > > > to use the CAP_MIN value in such cases, ensuring correct scaling of AUX-set
> > > > backlight brightness values.
> > > >
> > > > This improves compatibility with panels like the Samsung ATNA40YK20 used
> > > > on the Lenovo T14s Gen6 (Snapdragon variant with OLED) which report a
> > > > bit count of 0 but declares an 11-bit PWM capability range.
> > > >
> > > > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > > > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > > > ---
> > > > Changes in v2:
> > > > - Split backlight brightness patch from T14s OLED enablement series.
> > > > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > > > - Rework commit message to reference eDP spec.
> > > > - Rebase on drm-misc-next.
> > > > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > > > ---
> > > >   drivers/gpu/drm/display/drm_dp_helper.c | 50 ++++++++++++++++++++++-----------
> > > >   1 file changed, 33 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > index dbce1c3f49691fc687fee2404b723c73d533f23d..0b843d5b634f89f144b62b30311834d118b79ba9 100644
> > > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > > @@ -4083,7 +4083,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > >   {
> > > >       int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> > > >       int ret;
> > > > -     u8 pn, pn_min, pn_max;
> > > > +     u8 pn, pn_min, pn_max, bl_caps;
> > > >
> > > >       if (!bl->aux_set)
> > > >               return 0;
> > > > @@ -4094,8 +4094,39 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> > > >                           aux->name, ret);
> > > >               return -ENODEV;
> > > >       }
> > > > -
> > > >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > > > +     if (ret != 1) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return 0;
> > > > +     }
> > > > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > > > +     if (ret != 1) {
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > > > +                         aux->name, ret);
> > > > +             return 0;
> > > > +     }
> > > > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > > > +
> > > > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
> > > > +     if (ret != 1) {
> > > > +             bl_caps = 0;
> > > > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
> > > > +                     aux->name, ret);
> > > > +     }
> > > > +
> > > > +     /*
> > > > +      * Some eDP panels report brightness byte count support, but the byte count
> > > > +      * reading is 0 (e.g. Samsung ATNA40YK20) so use pn_min instead.
> > > > +      */
> > > > +     if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> > > > +         && pn_min)
> > > > +             pn = pn_min;
> > >
> > > I wonder, what stops you from implementing this part according to the
> > > standard, rather than adding a hack for 0 value.
> >
> > I am simply quite dense, I do not know this spec or the DRM code well
> > at all ;-).
>
> Okay, no worries. It should be pretty easy:
>
> pn = clamp(pn_min, pn_max);
>
> No need to check for pn being non-zero, etc.

I think you probably mean:
pn = clamp(pn, pn_min, pn_max);

I will look to use this macro in the next version later today & make
it more generic; thanks !


PS: I also found someone who tried to fix this in 2019; I will add the
author to CC of the next version.

https://lore.kernel.org/r/dri-devel/a766c3498d3754b598a8bf66f59a76e78ec57080.camel@intel.com/T/
