Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065ACA7B872
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 09:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E1910EA5F;
	Fri,  4 Apr 2025 07:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hb7KDG1p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681D410EA5F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 07:54:43 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3965c995151so1010545f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 00:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743753281; x=1744358081; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nkuZ4fVXpLrSH/Uvc9xUgqho8doERlfYtGRqy5O0mmQ=;
 b=hb7KDG1pLAyZOSauqbtbc2Su+bh85ebS6gf3UsF1a37ly/hnWCyE/dY5LRphGgJF9J
 4HiDZTj+eU/ktQuP6ko1NyCbz/k1F/115Nn07vU1hrLFtuttz1yt9Nhd5RUPtiwn8FHB
 5yQ/EUTsWvOkFevnzMrydOSHzyzW15zQO35PHqNyTZhRBLeLTDcGCERXoTzhxWNaVKYh
 1PI/UhfSgCnBuePrWZIhLnWwxJM34a2NMef2AfdbsyfctnWkqaAtRrbcrSeB4kqNHW1/
 +kdBfu6L3GHNNVFvDhK/X2opZtYQxcTkxQk4e+8gD6VkOl+CVku19BaRij09TC5/5MGK
 xHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743753281; x=1744358081;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nkuZ4fVXpLrSH/Uvc9xUgqho8doERlfYtGRqy5O0mmQ=;
 b=BiP4viDf/APZss46g9g1uvywEBQakEO/aODmcCGRSCha7Mfp+JTwEA/ieJWSGGz3ul
 /0lsXyLbftPyDRlyNiXFQvR7vPV0fTXZBZRhsu1499ZjtM62rj2Zqi8/agv55+AsALaU
 6g36LhIX4dHbw93PrSirFFt/H+A92LPQpLs14RKTk02qvNyBIcXEBtrvxpmbNSMWG3Uy
 f2xWg6sIR+UaWo2KhdmK4bQW0nhWVFaNRE+1LBed4YBs/zb1Iz0e9ojRICGo/u1YfZLD
 IPWVWG3gQ8bJOw1v84dFTjlDXy2yU6zc2VLns+Do36vEmO0LmU9NYNWyYwFmeo+nmhfg
 /LaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3BpF00EctilAN3w/4ds8TGILNZTVfwM/cgGcqA9XjI1kbKnBHwOZrMTEv4EODGFnO2oeJbzGPk1M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrxhccSZOvMHWTGPX6uX7dcGrTtHtfuvY+I4XGqq5s1UFCf3en
 6l7B++CIefhSD+3rBRIo3vg1adc2i9wVIInp0cH3Xx4jtJcPCyO/2YMKhElj1p8GHa7U2hBPIKS
 0GeQQzW6gwFUu5DQEsVs1+JEwaeO+1m4S53U5LQ==
X-Gm-Gg: ASbGncuoBuvPkuO4ZAdskoqxFk9TtfWw/FDh+zxXgwwKv5Og+rizHnKKr+ipnlbcDK2
 3ElDxArQ/9ND810MOuSH7s7JvrAcbahgILTiUZbAGMTZhSHa0FemNHWyktNaPl12Nh/eCuW76VI
 XzhAIoe+P4mWkIKP2fLXafD7p3YtN3flRYzZ/KlSowqGfk61MH82T2RhBIzirVhNMnxdYdmA==
X-Google-Smtp-Source: AGHT+IEnvSgFxsnk8Iaa8NC1B0+A9BOHH30S3F6CvKMOM+vZqDuf3lRprSiLDiCiIG1i3TYnqSn8Gunnhk4ZCcvWNLo=
X-Received: by 2002:a05:6000:1788:b0:39c:d05:3779 with SMTP id
 ffacd0b85a97d-39cba9418c5mr1489289f8f.49.1743753280900; Fri, 04 Apr 2025
 00:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
 <Z-pTcB0L33bozxjl@hovoldconsulting.com>
In-Reply-To: <Z-pTcB0L33bozxjl@hovoldconsulting.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Fri, 4 Apr 2025 08:54:29 +0100
X-Gm-Features: ATxdqUE7yCYl5XlKqq5UiiO-MEOiByz26VjIsn9-FP2sQVcw5HFwQVWMPTy5k2A
Message-ID: <CACr-zFAiKRTHyRAF5HkM2drCMD7Q_Z3ZUFAsSnevy38yD8XMwg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
To: Johan Hovold <johan@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
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

Hi Johan,

On Mon, 31 Mar 2025 at 09:33, Johan Hovold <johan@kernel.org> wrote:
>
> On Sun, Mar 30, 2025 at 08:31:07PM +0100, Christopher Obbard wrote:
> > According to the eDP specification (VESA Embedded DisplayPort Standard
> > v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> > less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> > the MIN value as the effective PWM bit count.
> >
> > This commit updates the logic to clamp the reported
> > DP_EDP_PWMGEN_BIT_COUNT to the range defined by _CAP_MIN and _CAP_MAX.
> >
> > As part of this change, the behavior is modified such that reading both
> > _CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
> > bl->max value could end up being not set although
> > drm_edp_backlight_probe_max() returned success.
> >
> > This ensures correct handling of eDP panels that report a zero PWM
> > bit count but still provide valid non-zero MIN and MAX capability
> > values. Without this clamping, brightness values may be interpreted
> > incorrectly, leading to a dim or non-functional backlight.
> >
> > For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> > ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> > supports AUX backlight control and declares a valid 11-bit range.
> > Clamping ensures brightness scaling works as intended on such panels.
> >
> > Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
>
> > @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
> >       }
> >
> >       pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> > +     if (ret < 0) {
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> > +                         aux->name, ret);
> > +             return -ENODEV;
> > +     }
> > +     pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
> > +     if (ret < 0) {
> > +             drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
> > +                         aux->name, ret);
> > +             return -ENODEV;
> > +     }
> > +     pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> > +
> > +     /*
> > +      * Per VESA eDP Spec v1.4b, section 3.3.10.2:
> > +      * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
> > +      * the sink must use the MIN value as the effective PWM bit count.
> > +      * Clamp the reported value to the [MIN, MAX] capability range to ensure
> > +      * correct brightness scaling on compliant eDP panels.
> > +      */
> > +     pn = clamp(pn, pn_min, pn_max);
>
> You never make sure that pn_min <= pn_max so you could end up with
> pn < pn_min on broken hardware here. Not sure if it's something you need
> to worry about at this point.

I am honestly not sure. I would hope that devices follow the spec and
there is no need to be too paranoid, but then again we do live in the
real world where things are... not so simple ;-).
I will wait for further feedback from someone who has more experience
with eDP panels than I have.


> > +
> >       bl->max = (1 << pn) - 1;
> >       if (!driver_pwm_freq_hz)
> >               return 0;
>
> Otherwise this looks correct to me and does not break backlight control
> on the X1E reference design:
>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

Thanks for testing!


Chris
