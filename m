Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909F5A73DE4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 19:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E518810E92E;
	Thu, 27 Mar 2025 18:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u4VXboFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C6D10E92D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 18:19:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so9793295e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 11:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743099558; x=1743704358; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P12CtCMdehj+72VU5b5SqlHeK3VS+UZ5QpN9U1p7a2w=;
 b=u4VXboFd/mhKedcM6oCGQmXYGvbNt8uBnQJLfum+KHRO7EXBmDy3aAM+v0mTzw399t
 K6w9YemDAsHkJ+QYUxD0BpgWTe+ppVb09dzw7UcEc6k5lm4glW9SDGNMcsYJq28w7/50
 KC7Nbf7WgANXLnnM3RekX/5gfL57QqZz1I80qnQkls0yeHdz/+KHX17QehNh6bYyats/
 /o9TMnIJHizel12Ozvq/t4nMwrD3OxAF+ELYYqbI84fhBzwpUvseJtMHX9yyniqeHbeU
 sPdDgl6fkjAnZoddOyrBfTbSZ/yQZy6w4MkVFMKn725BRdyJ9Vdu3uw2CIg3ZU/D1n9Q
 nuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743099558; x=1743704358;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P12CtCMdehj+72VU5b5SqlHeK3VS+UZ5QpN9U1p7a2w=;
 b=XTadxJ2gfHXlLUSK/YHLdLtB3xgT72n6JHHPZEaSwImPRs8T3TvX8h6gJbkLBojGkI
 uUcemjTUl6aMKV2QOdGpHCV85jBXpbjCnIf36b6zfOZM0Xu1XYlPzQ9FduLNL8+lT+mm
 HHyoEBtvWeojnCNu3TtzyJidKGGOuFY25EdwgxO1u4A2AEKXp6L8b5NbIBvCW6Ude7YK
 HFN7EAsYJ6ByQCmFevxsq1CcLWrvNygv5FQG9ah0ei0ERLsUsZpWVDvLz0EX/wpS2GQ1
 4Jhfg0Av0uZG4QYpAI3K/v90r54+pLcW27bFM/ADlOt9wv6jQwTGQmLuKNhJOscvi5N3
 Yg2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVso9wVfZAMVzo2Wpf66iG3spdpgacrIqTuO9jOJ1MyIRqL/mpR6P1hl4G5j0BD4tD0syLUoBFKHkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy87sxJr+wBVtEgA+1Qa4lOFxj7uVvVV8WzAN33uM1A9gjlIKF8
 SqPX5fD563aYAGtJ36kRxMs7Uhf79+8Wst1VJckTAtiAKCaTQgHQ230IsSpkeRoryLrzAsUk8E/
 T4Z9XDIkTlbbb0oLwH0Y2MvYKQYEjr1tM+L0L/KTnr7uyQbPnZibgow==
X-Gm-Gg: ASbGnctVnplWdu478P50zNSZx0w1ifl76J/0XO0MXC6vHCyaRCVH0oT3OiT4fuwU6tc
 kX2aHafiqPUyZjCt4FYj27XKn3hST/ldC7iQMjJe6CZgBtngL40jO/p3ap7IrBzJra/rAxmqihe
 gbcgCfSzC8wvbvcSbudHQph2fPHL+XxwmUu8rsq/koCY6yzbQ2RM2sUEZ2azM=
X-Google-Smtp-Source: AGHT+IGx4OlX0tI6n3/lfCygKwYySqUqfocQ+HTgo0hqps8uwtgi4vXx3FWmqZeqeYjAFgREomQ4sonEMP2TUAFbl10=
X-Received: by 2002:a05:600c:1c14:b0:43c:e70d:4504 with SMTP id
 5b1f17b1804b1-43d85063ec9mr46080915e9.19.1743099558412; Thu, 27 Mar 2025
 11:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org>
 <07c48ba0-dcf5-4ece-8beb-f225652c5014@oss.qualcomm.com>
In-Reply-To: <07c48ba0-dcf5-4ece-8beb-f225652c5014@oss.qualcomm.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 18:19:07 +0000
X-Gm-Features: AQ5f1Jqc8u9VrZlkAGV9Tu1r0he8QdXLeQ8mXNLHX86N7Cf6oD6W0KLoAMXaF0k
Message-ID: <CACr-zFBwbniB3H5cnq0higsX6a_G4Be26N-nNL8JAzci8y9_Mw@mail.gmail.com>
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

Hi Dmitry,

On Thu, 27 Mar 2025 at 17:40, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 27/03/2025 19:25, Christopher Obbard wrote:
> > According to the eDP specification (e.g., VESA eDP 1.4b, section 3.3.10.2),
> > if DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > the sink is required to use the MIN value as the effective bit count.
> >
> > Some eDP panels report DP_EDP_PWMGEN_BIT_COUNT as 0 while still providing
> > valid non-zero MIN and MAX capability values. This patch updates the logic
> > to use the CAP_MIN value in such cases, ensuring correct scaling of AUX-set
> > backlight brightness values.
> >
> > This improves compatibility with panels like the Samsung ATNA40YK20 used
> > on the Lenovo T14s Gen6 (Snapdragon variant with OLED) which report a
> > bit count of 0 but declares an 11-bit PWM capability range.
> >
> > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> > Changes in v2:
> > - Split backlight brightness patch from T14s OLED enablement series.
> > - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> > - Rework commit message to reference eDP spec.
> > - Rebase on drm-misc-next.
> > - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> > ---
> >   drivers/gpu/drm/display/drm_dp_helper.c | 50 ++++++++++++++++++++++-----------
> >   1 file changed, 33 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index dbce1c3f49691fc687fee2404b723c73d533f23d..0b843d5b634f89f144b62b30311834d118b79ba9 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -4083,7 +4083,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >   {
> >       int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
> >       int ret;
> > -     u8 pn, pn_min, pn_max;
> > +     u8 pn, pn_min, pn_max, bl_caps;
> >
> >       if (!bl->aux_set)
> >               return 0;
> > @@ -4094,8 +4094,39 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >                           aux->name, ret);
> >               return -ENODEV;
> >       }
> > -
> >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > +     if (ret != 1) {
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > +                         aux->name, ret);
> > +             return 0;
> > +     }
> > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > +     if (ret != 1) {
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > +                         aux->name, ret);
> > +             return 0;
> > +     }
> > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
> > +     if (ret != 1) {
> > +             bl_caps = 0;
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
> > +                     aux->name, ret);
> > +     }
> > +
> > +     /*
> > +      * Some eDP panels report brightness byte count support, but the byte count
> > +      * reading is 0 (e.g. Samsung ATNA40YK20) so use pn_min instead.
> > +      */
> > +     if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
> > +         && pn_min)
> > +             pn = pn_min;
>
> I wonder, what stops you from implementing this part according to the
> standard, rather than adding a hack for 0 value.

I am simply quite dense, I do not know this spec or the DRM code well
at all ;-).
I do appreciate your continued reviews though, however painful it must be.

Before I send v3, can I clarify a proper solution?
I think you are saying that I can remove the section where I read the
capabilities and instead simply have something like (in pseudocode):

/* Determine effective bit count according to eDP spec */
u8 effective_bit_count = pwm_bit_count;
if (pwm_bit_count == 0 || pwm_bit_count < cap_min) {
    effective_bit_count = cap_min;
}

I would like to introduce this new variable to make the code easier to read.

If my understanding is correct, I'll send a v3 later.


> > +
> >       bl->max = (1 << pn) - 1;
> >       if (!driver_pwm_freq_hz)
> >               return 0;
