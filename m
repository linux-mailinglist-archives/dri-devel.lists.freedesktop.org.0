Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A237BA0B236
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:03:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15A9010E137;
	Mon, 13 Jan 2025 09:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B8zUODNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6462110E137
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:03:48 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso4233610e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736758967; x=1737363767; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=VYkQdxTA3vBXlKKUBFkrgSmL9ucWyZWWWLZyZzkAa3w=;
 b=B8zUODNH8FpEF2v9GqC/1hQpTgkl2uGoKdCkc0I2r3+Lpr5Dunybcnxdx4Rkjp2FVD
 Bt28J6glAXVJbWGqEgqA8XURRuJJXYH/sVvNwe61ocC920X/B6ZQnitGgohrYt4JQ089
 FwURZQ90C0Ufh2e0s0uppJ5SaplzhxXVIt0LQwa2XL9ujqixnQmoHBU4YumaEBUyggCY
 YRrg+CkBXQAFd/c2kT2PTjq/+JjkZk6mDOY7qlfgXVdM57Xy9keaMtn3On0VxC9lQdCV
 Hvh426/BgxEF4CtnUp7lY9ZvHT31XHJ1kxaFVe4817fFnqmEiaKs9szgRxz1O2ueulOQ
 FUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736758967; x=1737363767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VYkQdxTA3vBXlKKUBFkrgSmL9ucWyZWWWLZyZzkAa3w=;
 b=lnGur08MaL8G+klmm1Wevg6PoGOyJaPI2fczeeGGJQQmHGJ6/X+iuITGNoDYVpJuKP
 tFJuhaJqWqDLh7sRihzwNeSICPWrGlthB1h7OjaLGpQCWvM2M1EheG24Z30HXb4RpTU4
 F8KowYHCHKBnKK7Zsh9gY63jLQ1zRBanr3eCRfxwW3mN/JNDIoS0/eAt6DrOi9dZ6c08
 3B3xTGAqyI2nQl/NkHTzQ8JFiPMysu5750wongfqxkJUTqPARghkBlrKrMdb/pcHFPYD
 iohp8RkO0nsOgkMu3yqg3Noma9rfkjP7saYm+M+lCP5GylCQ+FES/6nOpDVEBhcbdz8K
 nASQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxeUVkUEDjUb7OljDGp2NPiTSs7YjKkpHfFqm5nrgz0qLBv2gDni/C8JnnND8h3uEaXnKAzxPOUmY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxm0q2qM8vYPnqJf3aFCZZq2LZB2gINGOUVqSrRLZfVzZ5lYcKi
 8Gnf2TycBHw7rsH9b9pkftXRfjCBnkz7SlP+sysq9DIOhOsR0OofLA5ZGt14VVw=
X-Gm-Gg: ASbGnctCDW6ZOvb7khMTQDwAk87MHunpxK3YbwSWmdHOz+dV4Wp4yeUAqVJByIxMh9U
 iO47J/2yA/Az6GmKMBNWy0AmoytOZY2iWZICevWOyjACrz7Cnh9EO0afsDyVLGJtrUapo5FhxT+
 9aEkZIvrnfCEy9tpko6iMT7VWc2QVay1wFf9NWyJbLWjal1ETjWFSUI+QRjzXAQ3SuP5EYLQE/w
 86eCm0FMU/rFCKLjkNtBuLEHgEoV39NJV6sRqN1FyIIeqkWCQ8eLc2lORzMUdjNCo8DyEYws/ut
 yMNHpFPwyA5iohY07zmwZJzdfLs0ECgTX9ei
X-Google-Smtp-Source: AGHT+IHowqb7rFqBBDpRnlzRpSHyTMrFA26GRZ+fcN9JLnlQvPTm5oxedl6vvT+6rf1rsSPJNSIUoA==
X-Received: by 2002:a05:6512:3e17:b0:53d:ed69:a593 with SMTP id
 2adb3069b0e04-542845282a5mr6463480e87.22.1736758965311; 
 Mon, 13 Jan 2025 01:02:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be5483bsm1300830e87.105.2025.01.13.01.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:02:44 -0800 (PST)
Date: Mon, 13 Jan 2025 11:02:43 +0200
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
Message-ID: <qsq5so5i7fy3r7xcjtcr7aq2vtbywh57j3b3e7ddbsmmeu5qwy@pgcntgxknuul>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
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

On Mon, Jan 13, 2025 at 04:03:07PM +0800, Yongxing Mou wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm 
> QCS8300 target. It includes the addition of the hardware catalog, compatible
> string, and their YAML bindings.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> Changes in v3:Fixed review comments from Krzysztof, Dmitry.
> - Fix the missing space issue in commit message.[Krzysztof]
> - Separate the patch for the phy from this series.[Dmitry]
> - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
> - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
> 
> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
> - Correct formatting errors and remove unnecessary status in MDSS
>   bindings.[Krzysztof]
> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>   20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
> - Package the DisplayPort controller and eDP PHY bindings document to
>   this patch series.
> - Collecting MDSS changes reviewd-by Dmitry.
> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
> ~
> 
> ---
> Yongxing Mou (4):
>       dt-bindings: display/msm: Document the DPU for QCS8300
>       dt-bindings: display: msm: dp-controller: document QCS8300 compatible
>       dt-bindings: display/msm: Document MDSS on QCS8300

Is there any reason for not using a common style for these three
commits?

>       drm/msm: mdss: Add QCS8300 support
> 
>  .../bindings/display/msm/dp-controller.yaml        |   4 +
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
>  drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>  4 files changed, 268 insertions(+), 4 deletions(-)
> ---
> base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
> change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry
