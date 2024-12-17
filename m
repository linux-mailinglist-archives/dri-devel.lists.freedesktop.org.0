Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569079F4A9B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 13:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494DA10E948;
	Tue, 17 Dec 2024 12:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n6NqXr5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38B410E94C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 12:06:53 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e39779a268bso4128344276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 04:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734437213; x=1735042013; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xtcNS4WYNQ7vwgcHRVs06xAqqZt34Z8yAs31pHoB2MM=;
 b=n6NqXr5l53ALWLMr25ftXM93mMm9AfKl4xhmpoNCbzW8tWoexZ5IeUMt0R+7UmC17O
 q7kvFOa4zfan5pmjVwgqST4IdhuoNU2z/ldnqe5xmJ3W8zJwSeLwzW7/TUhWjsDw48lT
 3yVnS8p9YGwYPfwt5UVTLt8HV5h3TCpuDgt4qCPwTMVAxeR3tAbMYurYJ/9yFmQPJT2W
 Z3bSG63AnQePAvvfRltiX2GRyP6riNj65zlyEiQZBLoCTH0xvJEkMOwm7p/0JERtKXbz
 DUOOM7y/n2kRdVwdEwsUE04P9LyFlL/52PfRQUf8TlVAmIaxp2DL0rQXSKCVOg6o8Ccq
 CArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734437213; x=1735042013;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtcNS4WYNQ7vwgcHRVs06xAqqZt34Z8yAs31pHoB2MM=;
 b=kMzrgRUMWe7RXLdsOXTle0fZ/XBxcmFnBSImgccYQhb5IQRCCail05zS4wiVTZss9+
 6g7mp404YM5Rs1scg/17vUcMFJym+KjEdx46w00LQu0lrvTA0xwUfA3HGqNAFsJVhzeW
 Hv7D547YOr3uY8fcglzHs1B5ScKjCgFzoUCnUa/s6xTaIzE7cG1eZzuwJES+Ph7UoPig
 1AxuwLBWkc9fa2D9nbW/7AXdTOtmpX7ozt8g3QnaIrOR9VNhEV+heaPTvl9059xbyWz/
 doNwn038+8XsBzRXwzTvk33JIzhfiAPhLvNh/n/v4KPuU9KHCeP/IoOaGhLL5dn5voh4
 nkHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIvPVzDsQLS8UhyJF1XTMrXJROnT94q7B5Kr2JqQDxWh/vjHNjIQjAoHosypQ7RwRp243JdQu/rx4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycMaIcdcgIiS+JxdO2UKC3tCxn1KV4YEmx1Efp80x+QP+/TujN
 CvVNzM59rmEo70PlktzcEz7CieTqdtHVHmMvttgLuRXxu39HouwXB3EbRDVXwIe1z1kZgrFKx8T
 DwexSu0vmtBEZedtxAjlYUPmWW9pmS2nscxJkMQ==
X-Gm-Gg: ASbGncvksKKBQjTExY7bVTTGfofLUR/IAAfGSCkU8Lic36NMKPQfm1LqcLOteU+sC0F
 wWxOwbYvHm7nGKGYYtOU+thc4TKqahxATkbedXwymaY7TyArb4WpZ
X-Google-Smtp-Source: AGHT+IHA892uAzKw6cPgSlziTULlXbGE7tU9YemAvZukjV0KTn0lzS8KUSWqbZi8euRBjZNVY3gThecx/TV6P6m2k58=
X-Received: by 2002:a25:acce:0:b0:e38:8d3b:66e0 with SMTP id
 3f1490d57ef6-e53299709aemr2594135276.19.1734437212629; Tue, 17 Dec 2024
 04:06:52 -0800 (PST)
MIME-Version: 1.0
References: <20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com>
 <20241210-add-display-support-for-qcs615-platform-v4-5-2d875a67602d@quicinc.com>
 <ntffm2jwr44m77z2bvuifv3itkpywco3cemgzkizzdp7e2ekdv@htfktmyyoe3k>
 <ba59f164-2ccd-4cf9-9426-9b6a2c199224@quicinc.com>
In-Reply-To: <ba59f164-2ccd-4cf9-9426-9b6a2c199224@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 17 Dec 2024 14:06:41 +0200
Message-ID: <CAA8EJpqApTLaNTkfHyfg5vgPtDQZs1cWjBSgdGULP=xRm+WmMw@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] drm/msm/dpu: Add SM6150 support
To: fange zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Liu Li <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 17 Dec 2024 at 13:02, fange zhang <quic_fangez@quicinc.com> wrote:
>
>
>
> On 2024/12/17 18:54, Dmitry Baryshkov wrote:
> > On Tue, Dec 10, 2024 at 02:53:56PM +0800, Fange Zhang wrote:
> >> From: Li Liu <quic_lliu6@quicinc.com>
> >>
> >> Add definitions for the display hardware used on the Qualcomm SM6150
> >> platform.
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> >> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> >> ---
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 254 +++++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
> >>   4 files changed, 257 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..621a2140f675fa28b3a7fcd8573e59b306cd6832
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> >
> > [...]
> >
> >> +
> >> +const struct dpu_mdss_cfg dpu_sm6150_cfg = {
> >> +    .mdss_ver = &sm6150_mdss_ver,
> >> +    .caps = &sm6150_dpu_caps,
> >> +    .mdp = &sm6150_mdp,
> >> +    .ctl_count = ARRAY_SIZE(sm6150_ctl),
> >> +    .ctl = sm6150_ctl,
> >> +    .sspp_count = ARRAY_SIZE(sm6150_sspp),
> >> +    .sspp = sm6150_sspp,
> >> +    .mixer_count = ARRAY_SIZE(sm6150_lm),
> >> +    .mixer = sm6150_lm,
> >> +    .dspp_count = ARRAY_SIZE(sm6150_dspp),
> >> +    .dspp = sm6150_dspp,
> >> +    .pingpong_count = ARRAY_SIZE(sm6150_pp),
> >> +    .pingpong = sm6150_pp,
> >> +    .intf_count = ARRAY_SIZE(sm6150_intf),
> >> +    .intf = sm6150_intf,
> >> +    .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >> +    .vbif = sdm845_vbif,
> >> +    .perf = &sm6150_perf_data,
> >
> > I noticed that the catalog entry doesn't provide writeback configuration
> > although the vendor DTSi specified that there is WB_2 on this platform.
> > Please send a followup patch enabling writeback on this platform.
> ok, will update it in next update

Just a followup patch is fine.

> >
> >> +};
> >> +
> >> +#endif
> >
>


-- 
With best wishes
Dmitry
