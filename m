Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3E9667D0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4E510EAA9;
	Fri, 30 Aug 2024 17:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NuycyKmo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BBF10EA9F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:18:32 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f4f2cda058so27895771fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725038311; x=1725643111; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KpE0Uc5dFOEGFFibSJ4UWHOb/IqeB0GMqdfzV3gaXTQ=;
 b=NuycyKmoUcIYUFtbxvxOScKrbrGuilDnIrUFxy+qelYi8v0I22cfxYhb0zECgfS5Pq
 Jll1n4ny7ik23K/TFvrqznTRgjkaRYfgcmVt97ACXrf24R0J6kxFu00lZqI4Mn0QvU6U
 Cytjlh2Xb3oFDODzUY7h7435YotpTOL149vpvTQPdLtUt60VBe15O/TMSKK7RTXzIkT+
 71273xDVxiRIoXXGHc7Hqn3j0ehKkkazPOhVEzaDBVbSwokilfQPfALsWeNaOJWNgt9/
 LjecprsP/NsbAJ2TYMf8Ye1U3Q/zpJqWaDmcDiC97bOXc13QT3dWrn7agkr/OQlecLQ4
 c81A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725038311; x=1725643111;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KpE0Uc5dFOEGFFibSJ4UWHOb/IqeB0GMqdfzV3gaXTQ=;
 b=MbxArobksiMbkKniyi0vjkfMr6vhN8imeBLu+VVgskh0k99s8JV03hAf7hL9aJOO85
 yDS8N0HSy63b2bP4zGZkEAu8pyaOSzpD1f3iXs1cnBqa+WdjNKS/FsVAhW0vn77NyqQW
 ZYzOJCd5rzP3fA/8D5ZAcxx9+uflrosChlXxM5oi7xgJvr5rm8yBRg7VQsACG+flA3F+
 F9MkJZbH78KMNz25xZLeErcOJynNMeLD4jrCHLTLTikYiuIT+MwKDNJmRgFeYBFoWYaU
 y46Q5BDzuJRV+EYYFGPhluy6u4gW4m0BTVZVfqLM9UDC22VdquyiO11Ca6HR+SDY1UEc
 qRcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQKh5n/W5BLPmmVbfhWMAqSlUO1Bdr0CFP9e7AGvJeEEOAqWkORDJ737JH7SyZyw9/RXU8cpv/F9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG5kmB9z4OMFuezwrA/Zv/cEY6fy1Idi+UOVKUKf2J+FSpcw5a
 wxOyqMqJv9Pksrwu9TzHWNss60mBtufnC2bDgudQKYTMFMVOS4Nku519EQrWHV0=
X-Google-Smtp-Source: AGHT+IH7lCDOnpQjJkBV0xBr9wZhLABIPrs5eADI+IUifWzRid0MPQk+CnkK+72iNFUgRHp+MLBZWQ==
X-Received: by 2002:a05:6512:239c:b0:52e:8161:4ce6 with SMTP id
 2adb3069b0e04-5354634774fmr1184289e87.25.1725038310319; 
 Fri, 30 Aug 2024 10:18:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535407ac283sm693918e87.106.2024.08.30.10.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:18:29 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:18:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 11/21] drm/msm/dpu: Add RM support for allocating CWB
Message-ID: <pf6xgu7yjanzjigfpupons4ud6jbcmbr5icnd7yur6qhh3n5sf@plj4bi3beguw>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-11-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-11-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:32PM GMT, Jessica Zhang wrote:
> Add support for allocating the concurrent writeback mux as part of the
> WB allocation
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 ++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 30 +++++++++++++++++++++++++++--
>  2 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index c17d2d356f7a..c43cb55fe1d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -1,5 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>  
>  #ifndef _DPU_HW_MDSS_H
> @@ -352,6 +354,7 @@ struct dpu_mdss_color {
>  #define DPU_DBG_MASK_DSPP     (1 << 10)
>  #define DPU_DBG_MASK_DSC      (1 << 11)
>  #define DPU_DBG_MASK_CDM      (1 << 12)
> +#define DPU_DBG_MASK_CWB      (1 << 13)
>  
>  /**
>   * struct dpu_hw_tear_check - Struct contains parameters to configure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index bc99b04eae3a..738e9a081b10 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -1,9 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <drm/drm_managed.h>
>  #include "msm_drv.h"
>  #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
>  #include "dpu_kms.h"
> @@ -34,6 +35,7 @@ int dpu_rm_init(struct drm_device *dev,
>  		void __iomem *mmio)
>  {
>  	int rc, i;
> +	struct dpu_hw_blk_reg_map *cwb_reg_map;
>  
>  	if (!rm || !cat || !mmio) {
>  		DPU_ERROR("invalid kms\n");
> @@ -100,11 +102,35 @@ int dpu_rm_init(struct drm_device *dev,
>  		rm->hw_intf[intf->id - INTF_0] = hw;
>  	}
>  
> +	if (cat->cwb_count > 0) {
> +		cwb_reg_map = drmm_kzalloc(dev,
> +				sizeof(*cwb_reg_map) * cat->cwb_count,
> +				GFP_KERNEL);

Please move CWB block pointers to dpu_rm. There is no need to allocate a
separate array.

> +
> +		if (!cwb_reg_map) {
> +			DPU_ERROR("failed cwb object creation\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
> +
> +	for (i = 0; i < cat->cwb_count; i++) {
> +		struct dpu_hw_blk_reg_map *cwb = &cwb_reg_map[i];
> +
> +		cwb->blk_addr = mmio + cat->cwb[i].base;
> +		cwb->log_mask = DPU_DBG_MASK_CWB;
> +	}
> +
>  	for (i = 0; i < cat->wb_count; i++) {
>  		struct dpu_hw_wb *hw;
>  		const struct dpu_wb_cfg *wb = &cat->wb[i];
>  
> -		hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> +		if (cat->cwb)
> +			hw = dpu_hw_wb_init_with_cwb(dev, wb, mmio,
> +					cat->mdss_ver, cwb_reg_map);
> +		else
> +			hw = dpu_hw_wb_init(dev, wb, mmio, cat->mdss_ver);
> +
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
>  			DPU_ERROR("failed wb object creation: err %d\n", rc);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
