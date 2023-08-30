Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB178E2E4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 00:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430D610E62B;
	Wed, 30 Aug 2023 22:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60EF810E637
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 22:57:51 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d78328bc2abso58289276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 15:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693436270; x=1694041070; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jbesLFZn89QtS3Nk/fxwNNUghSnqXExXEAIFGNCDeeM=;
 b=MbV0uVyDZmgGJsoIglbyEHlg2dx1YlV6BxlcXZBEuodhjb5uyiviUUSV5LMCV1wqy8
 VtaCFA4oY++Q8Ymeq0dQ68Hq9euArOWS5mHg/a6BIOcRPElX89tMYmKpeFhmQ02muFH0
 A5tDKGacrs5VWcl70KmLti/TyzHLdl2lSb7/4dyRMVPnPRTbvKqka2VlV29PQqTKKXwg
 o/VNocIG3ZcOk72yftLNPVaO6O6V5IVkOgo8tfBNvy79rVvDWPE88eAWvqRd5XyT+dV0
 xeVWl/rWtaPjV0MGwIgQgImbO5OZjbuIsQ3QVQeQZKz2wpugz6cGMUJJaetH+EXCnwWv
 fqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693436270; x=1694041070;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jbesLFZn89QtS3Nk/fxwNNUghSnqXExXEAIFGNCDeeM=;
 b=aLJ29Ozk7Z0GAVhVeRPAPqb3p9PM3juVkz62fGVlXHgbORTYS2qX2DlTSzgPnMiSPC
 v+ZUPmbIl7U+UEhTuvYuPc9QF+T8Tm43gbtDxz+ZWeGahqZFb4vm/RAZMM16Eo1kbsGd
 5wo9YruXujHZxNs5vu5HKv/ggGOyiBjKfl25mCNAEV7/ZESFLU5I/vaAIds57qUfsg7C
 WXtuRK4qMxxJW+RGUUflQNe+pEmNygTXzXlsex3qFIeGEBT6oNtTNuPTxK197xZu/XB4
 yZPKN2g67LUDJr6seHGPH9M9xAeBK2ZVwI8v/Ep4ghFwzmwPNpCDpNrolQ9I82MXpsC8
 P0rQ==
X-Gm-Message-State: AOJu0YyrO1fPC9oj2P+DA5abRnR/ZR4/GwkHPcZzR4UnBUEoRVW8oLF4
 OWRgashaTozj7TOtroOxKjGiWRL+eUEuiq5cq2OE7A==
X-Google-Smtp-Source: AGHT+IG3oe2ouCAeqBMeWjd+y2neQTbmLX7tFZM/1DYvgEWwNCBSvEIBngqoyJWkuhznJGDIW/5TaccccPTX2hs78ug=
X-Received: by 2002:a25:b188:0:b0:d71:c54:6821 with SMTP id
 h8-20020a25b188000000b00d710c546821mr3826853ybj.35.1693436270486; Wed, 30 Aug
 2023 15:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-5-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-5-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 01:57:39 +0300
Message-ID: <CAA8EJpoQ0L_b=KDQxuXEL4KbaP1DACq1Qpw6m_ot6m+UYsHZWg@mail.gmail.com>
Subject: Re: [PATCH 04/16] drm/msm/dpu: add cdm blocks to sc7280 dpu_hw_catalog
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> YUV format output from writeback block.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
>  3 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 3b5061c4402a..5252170f216d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -251,10 +251,19 @@ static const struct dpu_mdss_version sc7280_mdss_ver = {
>         .core_minor_ver = 2,
>  };
>
> +static const struct dpu_cdm_cfg sc7280_cdm = {
> +       .name = "cdm_0",
> +       .id = CDM_0,
> +       .len = 0x228,
> +       .base = 0x79200,
> +       .features = 0,

No need to.
Also, as the CDM block seems to be common to all existing platforms,
what about moving this definition to dpu_hw_catalog.c next to VBIF
settings?

> +};
> +
>  const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>         .mdss_ver = &sc7280_mdss_ver,
>         .caps = &sc7280_dpu_caps,
>         .mdp = &sc7280_mdp,
> +       .cdm = &sc7280_cdm,
>         .ctl_count = ARRAY_SIZE(sc7280_ctl),
>         .ctl = sc7280_ctl,
>         .sspp_count = ARRAY_SIZE(sc7280_sspp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 6c9634209e9f..4ea7c3f85a95 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -693,6 +693,17 @@ struct dpu_vbif_cfg {
>         u32 memtype[MAX_XIN_COUNT];
>  };
>
> +/**
> + * struct dpu_cdm_cfg - information of chroma down blocks
> + * @name               string name for debug purposes
> + * @id                 enum identifying this block
> + * @base               register offset of this block
> + * @features           bit mask identifying sub-blocks/features
> + */
> +struct dpu_cdm_cfg {
> +       DPU_HW_BLK_INFO;
> +};
> +
>  /**
>   * Define CDP use cases
>   * @DPU_PERF_CDP_UDAGE_RT: real-time use cases
> @@ -816,6 +827,8 @@ struct dpu_mdss_cfg {
>         u32 wb_count;
>         const struct dpu_wb_cfg *wb;
>
> +       const struct dpu_cdm_cfg *cdm;
> +
>         u32 ad_count;
>
>         u32 dspp_count;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index d85157acfbf8..4d6dba18caf0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -185,6 +185,11 @@ enum dpu_dsc {
>         DSC_MAX
>  };
>
> +enum dpu_cdm {
> +       CDM_0 = 1,
> +       CDM_MAX
> +};
> +
>  enum dpu_pingpong {
>         PINGPONG_NONE,
>         PINGPONG_0,
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
