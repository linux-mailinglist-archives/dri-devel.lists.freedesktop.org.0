Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3782A0B30B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6977C10E5EA;
	Mon, 13 Jan 2025 09:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SuNVklLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5A510E5E7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:36:27 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5426fcb3c69so3488049e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736760985; x=1737365785; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DmCzDFErLnBOfEME/9QnQ60BqhOwOM+03PSKJOPU4Wk=;
 b=SuNVklLAe0iK7HRg4zsn9DHMQXd/bXvS08oki6hZNAOPrg5GJOGgRgvdCUZyP5SsYH
 CcTjK0XaH2tKUlnPzcOlgi27t4kTVM6IFNiUo6s4NumCzBXmyy6mNTIRQ8t3uIGpzxi9
 uwFMp3y+Cqv8KGxWo0ZcxOWES9fX2Yuz/rHX0pNPb4xIG5icKUHjKqJN/MjmDMiykCtf
 TmqiRpYy2fTvkVcVyviMYJTRrMk6jFT0J9G6Kv5veQnshQh5bHU8k3uaeFzue91/8do5
 YtaI8uM3tY3sN+F+YS8PZeyhYQxPPFLaQICr0Tyxsi5qoH5VyW5gB6NLphPi2Kz/6Muc
 9CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736760985; x=1737365785;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DmCzDFErLnBOfEME/9QnQ60BqhOwOM+03PSKJOPU4Wk=;
 b=GMOBnPgLZzC9JTtu6HJ7I7aImpSZxJstuW93+atPH3baQqve/NkSY6VnlZbVT8IUZC
 Hz+d16DnnnjE0Y2xDzhXvr/cTXRBnaFkyZCSnIk8SALA6yJ1Fl/NWo3dYYBe7STfhrhH
 iAgkgK/QlDr1iv/ReQ1oNTwdfT+Y1YbAXACEjxyLfyeYc//z0plk5i9/EotaNu5W6DT5
 hVhu8HDmvvQaW52SN9zBvIcaH3Jw7qvBadYX2wMpu97wt85RBE0LuKxuUBG6PvkGqv1X
 Y0kie4vL6P2K1KnZoA/MTQ9dHJRAjh567AixKuwQ9GhSK2zHfpeHf63zn8Gt95Dp7CGF
 1wPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQc+rWwN7bjmceYiDkn/4Poh5dEcOIvYJiHU5qiZ1UVcdmW3PcU73DI0vHgCk8qb07rdlx2X7Uip4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQcScJV//VCNO/fnusHfG0Qem4VDeCoPmZ7JF9RkSTxtxIE3aN
 Xl1w52kEGIRRMMLZBQlCQhpQufElaRNeG9lAQu5itDMYCvZboeX3L+eVMCa+Yeo=
X-Gm-Gg: ASbGncsn+urIiYd9rr5AjmG8NCMQ/Jk4fNBY3tTu4sCCUoi2XDInRTiei4CfI9kaDKS
 reTpOuTmhwxKVmbftYotLKmkHr5tlkdg6A6s+bDaowFVf3qFOuOR/wAQx5AsoBgGVNV2tl+v/M9
 wo1Lspog1SLvmcWByBI5Ytg3upisszEVniaoFaqft1ZiVWjAz1ItyfB/UzA+AB+JLNE3vTJRNxP
 1Bcci5uGHF0xLR3xSAiFciVKRneHdQN/8zJHbW1h5reT0yIaB2SEWOdhEvcGe8J2ZqGmDEMGIha
 Mxt/NdRg/1RQb0jRx6w2Y++kTTSvf+F45HLO
X-Google-Smtp-Source: AGHT+IFbM2UcO1EMYcGq6BZ2DVYviG/knD27dv0NN39pkseZUIPzaniaUfN4FBwQvW32Hm9VBxgPAA==
X-Received: by 2002:a05:6512:220b:b0:53e:389d:8ce6 with SMTP id
 2adb3069b0e04-542845d1dbamr6309742e87.28.1736760985355; 
 Mon, 13 Jan 2025 01:36:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becd501sm1272396e87.246.2025.01.13.01.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:36:24 -0800 (PST)
Date: Mon, 13 Jan 2025 11:36:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/4] Display enablement changes for Qualcomm QCS8300
 platform
Message-ID: <5exaup4mceoq3a3wk44csybigcg3yc2drvv7nwdndbig7edzya@5d543uzrnoxx>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <qsq5so5i7fy3r7xcjtcr7aq2vtbywh57j3b3e7ddbsmmeu5qwy@pgcntgxknuul>
 <9a87724c-1906-4a9b-bf01-e603b310e47a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a87724c-1906-4a9b-bf01-e603b310e47a@quicinc.com>
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

On Mon, Jan 13, 2025 at 05:26:56PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/1/13 17:02, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 04:03:07PM +0800, Yongxing Mou wrote:
> > > This series introduces support to enable the Mobile Display Subsystem (MDSS)
> > > , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
> > > QCS8300 target. It includes the addition of the hardware catalog, compatible
> > > string, and their YAML bindings.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > > Changes in v3:Fixed review comments from Krzysztof, Dmitry.
> > > - Fix the missing space issue in commit message.[Krzysztof]
> > > - Separate the patch for the phy from this series.[Dmitry]
> > > - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
> > > - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
> > > 
> > > Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
> > > - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
> > > - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
> > > - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
> > > - Correct formatting errors and remove unnecessary status in MDSS
> > >    bindings.[Krzysztof]
> > > - Add the the necessary information in MDSS changes commit msg.[Dmitry]
> > > - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
> > >    20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
> > > - Package the DisplayPort controller and eDP PHY bindings document to
> > >    this patch series.
> > > - Collecting MDSS changes reviewd-by Dmitry.
> > > - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
> > > - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
> > > - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
> > > ~
> > > 
> > > ---
> > > Yongxing Mou (4):
> > >        dt-bindings: display/msm: Document the DPU for QCS8300
> > >        dt-bindings: display: msm: dp-controller: document QCS8300 compatible
> > >        dt-bindings: display/msm: Document MDSS on QCS8300
> > 
> > Is there any reason for not using a common style for these three
> > commits?
> > 
> Hi，actually, for the dp-controller.yamel file, I just noticed that the
> previous platforms added the dt-binding files using this format. So, I
> followed their format to write the commit message. Such as dt-bindings for
> sm8650/sm8150/sm8250...

I don't care about either of the formats, but please be self-consistent.
If one patch out of three has a different subject prefix, that looks
strange.

> > >        drm/msm: mdss: Add QCS8300 support
> > > 
> > >   .../bindings/display/msm/dp-controller.yaml        |   4 +
> > >   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
> > >   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
> > >   drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
> > >   4 files changed, 268 insertions(+), 4 deletions(-)
> > > ---
> > > base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
> > > change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
> > > 
> > > Best regards,
> > > -- 
> > > Yongxing Mou <quic_yongmou@quicinc.com>
> > > 
> > 
> 

-- 
With best wishes
Dmitry
