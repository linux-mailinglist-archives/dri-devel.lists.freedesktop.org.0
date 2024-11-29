Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEE49DE7B9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DFA10EE16;
	Fri, 29 Nov 2024 13:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VbVBZBS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE6E10E0A9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:37:42 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e3985aabf43so647958276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732887461; x=1733492261; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=58OMzBUym1v3QZatsP+eIIFv2sSi0+p3zj755X8dJ8Q=;
 b=VbVBZBS9Rd0pF+ISwOdsxVcFXn2Whzpm48klu1SOjcScdo6b4Oj8/AxyjVUpCf3RWi
 l+t2+Z80gXOKW7XRvQXKLAanwAH1Vr/gPaf9Rt+jKcU+mbbe4ULsE6sPiFSwl7HKAKN6
 +RtCJbjPZm6Umf3Hx9pVQHtgKqnEmE887zmK/MG4RqlEj+U6hDqpb4r+EV1Z/11mKiYC
 lHWMDT6yL6CLaZl6WkWSwJ+fwwXgBjcFzSa/Paro5nXLjufReJ3Cz8uhlaAW6bSI71OO
 fj5r1DCPFYI/KpWtc4YAL1ksbKd08HSVKbzw5WuE0vTQALql6IsktR1FpX4feWbAqzhR
 2ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732887461; x=1733492261;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=58OMzBUym1v3QZatsP+eIIFv2sSi0+p3zj755X8dJ8Q=;
 b=Hp4UV51EZ6GvtWgSMMw1i77fJEZsCAmB7NSB/JC52tUa00gwW1pGrdCgBc9wparTyB
 mHoNCXIcPowBhoQvHb7bMOxO5fI16AtO9JY5tZ1AZJBwiB6dbwb0TmvBM08HxWIcaufn
 wgArX1HC6M47ineO9wMbxEz0iGEnrJt6QOz05k4nG1OdQM2Rk3ZJpj6s52oXFZAUcxUQ
 M1hFMtKBHfVTMake2RU6yCM9I266MlKMCmJfsppXlA6FZqmtJeIUdbSc5PK1pH3E84hT
 PKdvfTSxury+EPaTzXybK0poGIbPR/N28ZbYwm4ia9VqvLV13Nl4EMDGz1O/RxGa2J5J
 F7ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSprhJyIR2xxEw1Sn9ftKqXXzZRHeZOLhqR6PhmzTRwhYNSIRVpX6PrFKGDK37QfSrzTMWAJWGAA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRuBob09UXg6v2z3A2FAz2UqbMRq7O6Lw2d6f5QMnmR2PkGA5C
 98xrdQk+C4u5qy/eFblKJsIe6YXDpAEdW44hDOKSqr0GsQBcbstALUZ/LWXesLS3EYytlsU49oA
 tCXpq+uT9c6hp4J+LecijPdduhwg37wYzvQV1Iw==
X-Gm-Gg: ASbGnctHb+YMzT5ZW1H+GKIb+xM6Y/Wle9DWEFUegCgbvRyMM2UCx8IhbbH/oCvi596
 0FC7QbrGfoZAUQ0WDiQjSVApqcCGeECk=
X-Google-Smtp-Source: AGHT+IFrkQj4k5kVrrQDIL9m2/Jvz3+WCa9PDtXeRIXqBRMzU6Wvt9L6VaM1TYObS+1ILE0ANh43T1BRSKVu2mYCPeA=
X-Received: by 2002:a05:6902:f84:b0:e38:b6be:1d58 with SMTP id
 3f1490d57ef6-e395b893aaemr14088801276.21.1732887461424; Fri, 29 Nov 2024
 05:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-3-29b2c3ee95b8@quicinc.com>
 <nllulh3vskl3hm3hvjux4khxtanqj7cpoytodwkzphwn4ajmo7@g46rgnhp637b>
 <4b4a7609-0d9e-4b52-9193-a79583419902@quicinc.com>
In-Reply-To: <4b4a7609-0d9e-4b52-9193-a79583419902@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:37:35 +0200
Message-ID: <CAA8EJprGLfa2H1VMAG7uYJOEUyf9aMbC9-V6Q_J-pDz4pGV1yQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add QCS8300 support
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Fri, 29 Nov 2024 at 11:56, Yongxing Mou <quic_yongmou@quicinc.com> wrote:
>
>
>
> On 2024/11/27 21:46, Dmitry Baryshkov wrote:
> > On Wed, Nov 27, 2024 at 03:05:03PM +0800, Yongxing Mou wrote:
> >> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> >
> > Please mention, why do you need it at all. I see that the UBWC swizzle
> > and HBB settings are different. Is this really the case? Is it because
> > of the different memory being used on those platforms?
> >
> Thanks, will modify the comment to add more information .QCS8300 UBWC
> setting is quite different with SA8775P,it use different memory,so their
> recommended configurations are not quite the same.this is really setting.

We had several cases where the platform should be using different HBB
if it uses different memory type. Is that the case here? If so, rather
than adding another compat entry please extend the msm_mdss to read
memory type and select HBB based on that. This will also fix several
TODO items in the driver.

As a side note, I see that your config has different ubwc_swizzle. If
that's actually different, then maybe you are right and there should
be a separate entry.

> >>
> >> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> >> index b7bd899ead44bf86998e7295bccb31a334fa6811..90d8fe469d3134ec73f386153509ac257d75930a 100644
> >> --- a/drivers/gpu/drm/msm/msm_mdss.c
> >> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> >> @@ -568,6 +568,16 @@ static const struct msm_mdss_data qcm2290_data = {
> >>      .reg_bus_bw = 76800,
> >>   };
> >>
> >> +static const struct msm_mdss_data qcs8300_data = {
> >> +    .ubwc_enc_version = UBWC_4_0,
> >> +    .ubwc_dec_version = UBWC_4_0,
> >> +    .ubwc_swizzle = 6,
> >> +    .ubwc_static = 1,
> >> +    .highest_bank_bit = 3,
> >> +    .macrotile_mode = 1,
> >> +    .reg_bus_bw = 74000,
> >> +};
> >> +
> >>   static const struct msm_mdss_data sa8775p_data = {
> >>      .ubwc_enc_version = UBWC_4_0,
> >>      .ubwc_dec_version = UBWC_4_0,
> >> @@ -715,6 +725,7 @@ static const struct of_device_id mdss_dt_match[] = {
> >>      { .compatible = "qcom,mdss" },
> >>      { .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
> >>      { .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
> >> +    { .compatible = "qcom,qcs8300-mdss", .data = &qcs8300_data },
> >>      { .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
> >>      { .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
> >>      { .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
> >>
> >> --
> >> 2.34.1
> >>
> >
>


-- 
With best wishes
Dmitry
