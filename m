Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB580A204
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 12:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C809710EA5E;
	Fri,  8 Dec 2023 11:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E4910EA5B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 11:20:10 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5d3644ca426so19019637b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 03:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702034410; x=1702639210; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PjkH0OgEXUrXFF57deKZ2Z1C3PCEiKPWjgS+DscQXoo=;
 b=y5lZAB6L1iQ1EAe3m+dwRDZPhKX+t5IqMAErc7LJ3YOAYP29B0xORjYlE39eqrAosB
 u2/JgdswYKm4INDAs9Rc9nw7uo0KQ+vX4fSDiNZ3zIFtGFUGn9HJuc718fx1WmhjxOCB
 n8seaZYbDEzcwtoQNXETJuOWA3eUb+1lAjoBj+9iYpj6wLQkwpmZOe4Ypxu5lGVTCcWl
 dH3V93i4TPm/9peSMo3UM/OMdxvoeYKZdOUKrGeBFDwTUbqqmZPlesz4DkxvSSskG5/c
 CPu2xe+CA21NKKIswFuXgMgCaJU41yyZG6iWG8jwBjBhSfMQYXTnlYC00JDM73uvifjY
 Ce5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034410; x=1702639210;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PjkH0OgEXUrXFF57deKZ2Z1C3PCEiKPWjgS+DscQXoo=;
 b=SXiH3sFD1PxSk3d9czZ5A1/vVSegeSt8WGkKN2eB955PDdTfswkL74rJQSxEFaLG1p
 ysPjLccvmUOeLUhYOAEqsht+wfViHW7u/u9jX4kbGXSvmFbK/aXVzqVlluPZdkT+Vv0l
 izOst9ThVkWcjBCl3PQbgSCs7VSN9ZaCqAl0IzRWy+x6Brg8Lk+kHQJMBtkkvDq3e2M4
 wGVdnfDOyFF6fHAsxvYoWrfp2478upFTpsdNG8MacrFSMVpwo2DcbH226Xl50UguKoo1
 xwrNCDuR2TcDFX5sk3Qt07taRLGel8SKqPMEu8kYMtbOHjKDtsyAQrPddvsv9rIkiiUn
 twUg==
X-Gm-Message-State: AOJu0YwivlhP3wymv3eTpktQl4vN4WJhZHJZ6Bxvx+tpPPUGz+A8vDEP
 mMBwqdeLbI10aBes1wU7OBAe6aVXim5UeBOEns4FZQ==
X-Google-Smtp-Source: AGHT+IENzXnL65rUKcfXc1UjBloxQGOKo/9sIvlcivy8/yrcy30Yfl5penQ9BvNYc36tu7FXKcpXwLrUyO/1eJhTnzw=
X-Received: by 2002:a81:f205:0:b0:5d7:4d53:192c with SMTP id
 i5-20020a81f205000000b005d74d53192cmr3948363ywm.26.1702034409712; Fri, 08 Dec
 2023 03:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-6-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-6-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:19:58 +0200
Message-ID: <CAA8EJprR92=TRvYNu1dSTUcphUu3v-cD326AK2+80Ex8ppYBBw@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] drm/msm/dpu: add cdm blocks to sc7280
 dpu_hw_catalog
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
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add CDM blocks to the sc7280 dpu_hw_catalog to support
> YUV format output from writeback block.
>
> changes in v2:
>         - remove explicit zero assignment for features
>         - move sc7280_cdm to dpu_hw_catalog from the sc7280
>           catalog file as its definition can be re-used
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 10 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h         |  5 +++++
>  4 files changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 209675de6742..19c2b7454796 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -248,6 +248,7 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>         .mdss_ver = &sc7280_mdss_ver,
>         .caps = &sc7280_dpu_caps,
>         .mdp = &sc7280_mdp,
> +       .cdm = &sc7280_cdm,
>         .ctl_count = ARRAY_SIZE(sc7280_ctl),
>         .ctl = sc7280_ctl,
>         .sspp_count = ARRAY_SIZE(sc7280_sspp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d52aae54bbd5..1be3156cde05 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -426,6 +426,16 @@ static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
>         .ctl = {.name = "ctl", .base = 0xF80, .len = 0x10},
>  };
>
> +/*************************************************************
> + * CDM sub block config

Nit: it is not a subblock config.

> + *************************************************************/
> +static const struct dpu_cdm_cfg sc7280_cdm = {

I know that I have r-b'ed this patch. But then one thing occurred to
me. If this definition is common to all (or almost all) platforms, can
we just call it dpu_cdm or dpu_common_cdm?

> +       .name = "cdm_0",
> +       .id = CDM_0,
> +       .len = 0x228,
> +       .base = 0x79200,
> +};
> +
>  /*************************************************************
>   * VBIF sub blocks config
>   *************************************************************/
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e3c0d007481b..ba82ef4560a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -682,6 +682,17 @@ struct dpu_vbif_cfg {
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
> @@ -805,6 +816,8 @@ struct dpu_mdss_cfg {
>         u32 wb_count;
>         const struct dpu_wb_cfg *wb;
>
> +       const struct dpu_cdm_cfg *cdm;
> +
>         u32 ad_count;
>
>         u32 dspp_count;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index a6702b2bfc68..f319c8232ea5 100644
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
