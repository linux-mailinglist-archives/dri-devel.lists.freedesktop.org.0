Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D670759D
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 00:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F4C10E2D1;
	Wed, 17 May 2023 22:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951D110E2D1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 22:47:48 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 964E9204C1;
 Thu, 18 May 2023 00:47:46 +0200 (CEST)
Date: Thu, 18 May 2023 00:47:44 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v10 7/8] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Message-ID: <w7xre5jdot3fpe3ldj6vcnvribpbalfvova5hhmbgvgvkrcm34@xqvsc5ga2knb>
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-8-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684360919-28458-8-git-send-email-quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Title: "DPU >= 7.0" instead of "relevant chipsets" to match the others.

On 2023-05-17 15:01:58, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Add DSC 1.2 hardware blocks to the catalog with necessary sub-block and
> feature flag information.  Each display compression engine (DCE) contains
> dual DSC encoders so both share same base address but with
> its own different sub block address.

If you reword it, also reflow this line.

> 
> changes in v4:
> -- delete DPU_DSC_HW_REV_1_1
> -- re arrange sc8280xp_dsc[]
> 
> changes in v4:
> -- fix checkpatch warning
> 
> changes in v10:
> -- remove hard slice from commit text

It is still mentioned in the diff though, that's why I originally
requested a better place to describe it.

> -- replace DPU_DSC_NATIVE_422_EN with DPU_DSC_NATIVE_42x_EN
> -- change DSC_BLK_1_2 .len from 0x100 to 0x29c
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> 
> kuogee: catalog.h

What's this for?  This file isn't touched in this patch.

> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 14 ++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 ++++++
>  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 16 ++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 14 ++++++++++++
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 14 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 25 +++++++++++++++++++++-
>  6 files changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 500cfd0..d90486f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -153,6 +153,18 @@ static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
>  	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
>  };
>  
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sm8350_dsc[] = {
> +	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
> +	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
> +	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> +	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
> +};
> +
>  static const struct dpu_intf_cfg sm8350_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> @@ -215,6 +227,8 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
>  	.dspp = sm8350_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8350_pp),
>  	.pingpong = sm8350_pp,
> +	.dsc_count = ARRAY_SIZE(sm8350_dsc),
> +	.dsc = sm8350_dsc,
>  	.merge_3d_count = ARRAY_SIZE(sm8350_merge_3d),
>  	.merge_3d = sm8350_merge_3d,
>  	.intf_count = ARRAY_SIZE(sm8350_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 5646713..52609b8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -93,6 +93,11 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>  	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
>  };
>  
> +/* NOTE: sc7280 only has one DSC hard slice encoder */
> +static const struct dpu_dsc_cfg sc7280_dsc[] = {
> +	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> +};
> +
>  static const struct dpu_intf_cfg sc7280_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> @@ -149,6 +154,8 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
>  	.mixer = sc7280_lm,
>  	.pingpong_count = ARRAY_SIZE(sc7280_pp),
>  	.pingpong = sc7280_pp,
> +	.dsc_count = ARRAY_SIZE(sc7280_dsc),
> +	.dsc = sc7280_dsc,
>  	.intf_count = ARRAY_SIZE(sc7280_intf),
>  	.intf = sc7280_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 808aacd..a84cf36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -141,6 +141,20 @@ static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
>  	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x50000),
>  };
>  
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
> +	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
> +	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
> +	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> +	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
> +	DSC_BLK_1_2("dce_2_0", DSC_4, 0x82000, 0x29c, 0, dsc_sblk_0),
> +	DSC_BLK_1_2("dce_2_1", DSC_5, 0x82000, 0x29c, 0, dsc_sblk_1),
> +};
> +
>  /* TODO: INTF 3, 8 and 7 are used for MST, marked as INTF_NONE for now */
>  static const struct dpu_intf_cfg sc8280xp_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
> @@ -216,6 +230,8 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
>  	.dspp = sc8280xp_dspp,
>  	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
>  	.pingpong = sc8280xp_pp,
> +	.dsc_count = ARRAY_SIZE(sc8280xp_dsc),
> +	.dsc = sc8280xp_dsc,
>  	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
>  	.merge_3d = sc8280xp_merge_3d,
>  	.intf_count = ARRAY_SIZE(sc8280xp_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 1a89ff9..1620622 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -161,6 +161,18 @@ static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
>  	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x65f00),
>  };
>  
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sm8450_dsc[] = {
> +	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
> +	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
> +	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> +	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
> +};
> +
>  static const struct dpu_intf_cfg sm8450_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> @@ -223,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
>  	.dspp = sm8450_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8450_pp),
>  	.pingpong = sm8450_pp,
> +	.dsc_count = ARRAY_SIZE(sm8450_dsc),
> +	.dsc = sm8450_dsc,
>  	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
>  	.merge_3d = sm8450_merge_3d,
>  	.intf_count = ARRAY_SIZE(sm8450_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 497b34c..6582a14 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -165,6 +165,18 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>  	MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
>  };
>  
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */
> +static const struct dpu_dsc_cfg sm8550_dsc[] = {
> +	DSC_BLK_1_2("dce_0_0", DSC_0, 0x80000, 0x29c, 0, dsc_sblk_0),
> +	DSC_BLK_1_2("dce_0_1", DSC_1, 0x80000, 0x29c, 0, dsc_sblk_1),
> +	DSC_BLK_1_2("dce_1_0", DSC_2, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_0),
> +	DSC_BLK_1_2("dce_1_1", DSC_3, 0x81000, 0x29c, BIT(DPU_DSC_NATIVE_42x_EN), dsc_sblk_1),
> +};
> +
>  static const struct dpu_intf_cfg sm8550_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> @@ -227,6 +239,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>  	.dspp = sm8550_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8550_pp),
>  	.pingpong = sm8550_pp,
> +	.dsc_count = ARRAY_SIZE(sm8550_dsc),
> +	.dsc = sm8550_dsc,
>  	.merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>  	.merge_3d = sm8550_merge_3d,
>  	.intf_count = ARRAY_SIZE(sm8550_intf),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index f2a1535..9612ab5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
> @@ -522,6 +522,16 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  /*************************************************************
>   * DSC sub blocks config
>   *************************************************************/
> +static const struct dpu_dsc_sub_blks dsc_sblk_0 = {
> +	.enc = {.base = 0x100, .len = 0x100},
> +	.ctl = {.base = 0xF00, .len = 0x10},
> +};
> +
> +static const struct dpu_dsc_sub_blks dsc_sblk_1 = {
> +	.enc = {.base = 0x200, .len = 0x100},
> +	.ctl = {.base = 0xF80, .len = 0x10},
> +};
> +
>  #define DSC_BLK(_name, _id, _base, _features) \
>  	{\
>  	.name = _name, .id = _id, \
> @@ -529,6 +539,19 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.features = _features, \
>  	}
>  
> +/*
> + * NOTE: Each display compression engine (DCE) contains dual hard
> + * slice DSC encoders so both share same base address but with
> + * its own different sub block address.
> + */

I still think this comment is superfluous (and doesn't even apply
generically, see i.e. sc7280) and should best be kept exclusively in the
SoC-specific catalog files.

- Marijn

> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
> +	{\
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = _len, \
> +	.features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
> +	.sblk = &_sblk, \
> +	}
> +
>  /*************************************************************
>   * INTF sub blocks config
>   *************************************************************/
> -- 
> 2.7.4
> 
