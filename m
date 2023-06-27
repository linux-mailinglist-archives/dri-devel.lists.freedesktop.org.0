Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5C73F763
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CAC10E2C4;
	Tue, 27 Jun 2023 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7876410E2BE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:35:04 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1A2A71F54E;
 Tue, 27 Jun 2023 10:35:02 +0200 (CEST)
Date: Tue, 27 Jun 2023 10:35:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 15/19] drm/msm/dpu: inline various PP_BLK_* macros
Message-ID: <2dsyjkbxoep6cg32bp5ivaynovsd5reympy2sa4ag7dljd4ilm@jnuerzahvwk4>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-16-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619212519.875673-16-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-20 00:25:15, Dmitry Baryshkov wrote:
> To simplify making changes to the hardware block definitions, expand
> corresponding macros. This way making all the changes are more obvious
> and visible in the source files.
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Validated that this incurs no changes by checksumming a stripped
dpu_hw_catalog.o.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 41 ++++++---
>  .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 41 ++++++---
>  .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 67 ++++++++++----
>  .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 67 ++++++++++----
>  .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 67 ++++++++++----
>  .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 23 +++--
>  .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    | 12 ++-
>  .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    | 23 +++--
>  .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   | 12 ++-
>  .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    | 12 ++-
>  .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 67 ++++++++++----
>  .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 45 +++++++---
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 61 ++++++++++---
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 89 ++++++++++++++-----
>  .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 89 ++++++++++++++-----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 21 -----
>  16 files changed, 527 insertions(+), 210 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index d5111f3782a2..9181d3ef8013 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -185,18 +185,35 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg msm8998_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SDM845_TE2_MASK,
> +		.sblk = &sdm845_pp_sblk_te,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x70800, .len = 0xd4,
> +		.features = PINGPONG_SDM845_TE2_MASK,
> +		.sblk = &sdm845_pp_sblk_te,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x71000, .len = 0xd4,
> +		.features = PINGPONG_SDM845_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x71800, .len = 0xd4,
> +		.features = PINGPONG_SDM845_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
> +	},
>  };
>  
>  static const struct dpu_dsc_cfg msm8998_dsc[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index b6f52b3864ce..8119a81ff260 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -209,18 +209,35 @@ static const struct dpu_dspp_cfg sdm845_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sdm845_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SDM845_TE2_MASK, 0, sdm845_pp_sblk_te,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13)),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14)),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SDM845_MASK, 0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SDM845_TE2_MASK,
> +		.sblk = &sdm845_pp_sblk_te,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x70800, .len = 0xd4,
> +		.features = PINGPONG_SDM845_TE2_MASK,
> +		.sblk = &sdm845_pp_sblk_te,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x71000, .len = 0xd4,
> +		.features = PINGPONG_SDM845_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x71800, .len = 0xd4,
> +		.features = PINGPONG_SDM845_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
> +	},
>  };
>  
>  static const struct dpu_dsc_cfg sdm845_dsc[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 0e09e759dc99..2f6899ebad06 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -218,24 +218,55 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm8150_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			-1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			-1),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			-1),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			-1),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> -			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> -			-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x70800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x71000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x71800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_4", .id = PINGPONG_4,
> +		.base = 0x72000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_5", .id = PINGPONG_5,
> +		.base = 0x72800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8150_merge_3d[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 4d2b0409a244..15975460dbad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -217,24 +217,55 @@ static const struct dpu_dspp_cfg sc8180x_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc8180x_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			-1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			-1),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			-1),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			-1),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> -			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> -			-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x70800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x71000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x71800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_4", .id = PINGPONG_4,
> +		.base = 0x72000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_5", .id = PINGPONG_5,
> +		.base = 0x72800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 50f857565dbf..c8f4c6326a1a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -218,24 +218,55 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm8250_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			-1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, MERGE_3D_0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			-1),
> -	PP_BLK("pingpong_2", PINGPONG_2, 0x71000, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			-1),
> -	PP_BLK("pingpong_3", PINGPONG_3, 0x71800, PINGPONG_SM8150_MASK, MERGE_3D_1, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			-1),
> -	PP_BLK("pingpong_4", PINGPONG_4, 0x72000, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> -			-1),
> -	PP_BLK("pingpong_5", PINGPONG_5, 0x72800, PINGPONG_SM8150_MASK, MERGE_3D_2, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> -			-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x70800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x71000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x71800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_4", .id = PINGPONG_4,
> +		.base = 0x72000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_5", .id = PINGPONG_5,
> +		.base = 0x72800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8250_merge_3d[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 5d71c9cfcba8..d7d117e3af36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -118,12 +118,23 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc7180_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			-1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x70800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 459955c1af2d..4236cd7317a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -82,9 +82,15 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm6115_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -		-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_intf_cfg sm6115_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index a9907010a4a2..82c04d2ce010 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -127,12 +127,23 @@ static const struct dpu_dspp_cfg sm6350_dspp[] = {
>  };
>  
>  static struct dpu_pingpong_cfg sm6350_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -		-1),
> -	PP_BLK("pingpong_1", PINGPONG_1, 0x70800, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -		-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x70800, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_dsc_cfg sm6350_dsc[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 3c4f4a4ad51b..c6bf487e131b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -79,9 +79,15 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg qcm2290_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -		-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_intf_cfg qcm2290_intf[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index e42f0dc3b2ab..97de7a1f52b4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -84,9 +84,15 @@ static const struct dpu_dspp_cfg sm6375_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm6375_pp[] = {
> -	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, PINGPONG_SM8150_MASK, 0, sdm845_pp_sblk,
> -		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -		-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x70000, .len = 0xd4,
> +		.features = PINGPONG_SM8150_MASK,
> +		.sblk = &sdm845_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_dsc_cfg sm6375_dsc[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 0added438239..108e35cbcd90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -216,24 +216,55 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm8350_pp[] = {
> -	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			-1),
> -	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			-1),
> -	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			-1),
> -	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			-1),
> -	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> -			-1),
> -	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> -			-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x69000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x6a000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x6b000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x6c000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_4", .id = PINGPONG_4,
> +		.base = 0x6d000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_5", .id = PINGPONG_5,
> +		.base = 0x6e000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8350_merge_3d[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 9c0beccce282..3b67010f336b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -130,18 +130,39 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc7280_pp[] = {
> -	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, 0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			-1),
> -	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, 0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			-1),
> -	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			-1),
> -	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x69000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x6a000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x6b000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x6c000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = 0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  /* NOTE: sc7280 only has one DSC hard slice encoder */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 0b4915dabe7a..062b17dedec7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -220,18 +220,55 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
> -	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
> -	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9), -1),
> -	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10), -1),
> -	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11), -1),
> -	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30), -1),
> -	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31), -1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x69000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x6a000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x6b000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x6c000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_4", .id = PINGPONG_4,
> +		.base = 0x6d000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_5", .id = PINGPONG_5,
> +		.base = 0x6e000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_merge_3d_cfg sc8280xp_merge_3d[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 45cda9162685..d92af1410c3e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -220,30 +220,71 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
>  };
>  
>  static const struct dpu_pingpong_cfg sm8450_pp[] = {
> -	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			-1),
> -	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			-1),
> -	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			-1),
> -	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			-1),
> -	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> -			-1),
> -	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> -			-1),
> -	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x65800, MERGE_3D_3, sc7280_pp_sblk,
> -			-1,
> -			-1),
> -	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x65c00, MERGE_3D_3, sc7280_pp_sblk,
> -			-1,
> -			-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x69000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x6a000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x6b000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x6c000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_4", .id = PINGPONG_4,
> +		.base = 0x6d000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_5", .id = PINGPONG_5,
> +		.base = 0x6e000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_6", .id = PINGPONG_6,
> +		.base = 0x65800, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_3,
> +		.intr_done = -1,
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_7", .id = PINGPONG_7,
> +		.base = 0x65c00, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_3,
> +		.intr_done = -1,
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8450_merge_3d[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 66dd414253f1..32ffb9a9cfc7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -234,30 +234,71 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
>  	},
>  };
>  static const struct dpu_pingpong_cfg sm8550_pp[] = {
> -	PP_BLK_DITHER("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> -			-1),
> -	PP_BLK_DITHER("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> -			-1),
> -	PP_BLK_DITHER("pingpong_2", PINGPONG_2, 0x6b000, MERGE_3D_1, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> -			-1),
> -	PP_BLK_DITHER("pingpong_3", PINGPONG_3, 0x6c000, MERGE_3D_1, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> -			-1),
> -	PP_BLK_DITHER("pingpong_4", PINGPONG_4, 0x6d000, MERGE_3D_2, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> -			-1),
> -	PP_BLK_DITHER("pingpong_5", PINGPONG_5, 0x6e000, MERGE_3D_2, sc7280_pp_sblk,
> -			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> -			-1),
> -	PP_BLK_DITHER("pingpong_6", PINGPONG_6, 0x66000, MERGE_3D_3, sc7280_pp_sblk,
> -			-1,
> -			-1),
> -	PP_BLK_DITHER("pingpong_7", PINGPONG_7, 0x66400, MERGE_3D_3, sc7280_pp_sblk,
> -			-1,
> -			-1),
> +	{
> +		.name = "pingpong_0", .id = PINGPONG_0,
> +		.base = 0x69000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_1", .id = PINGPONG_1,
> +		.base = 0x6a000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_0,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_2", .id = PINGPONG_2,
> +		.base = 0x6b000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_3", .id = PINGPONG_3,
> +		.base = 0x6c000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_1,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_4", .id = PINGPONG_4,
> +		.base = 0x6d000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 30),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_5", .id = PINGPONG_5,
> +		.base = 0x6e000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_2,
> +		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_6", .id = PINGPONG_6,
> +		.base = 0x66000, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_3,
> +		.intr_done = -1,
> +		.intr_rdptr = -1,
> +	}, {
> +		.name = "pingpong_7", .id = PINGPONG_7,
> +		.base = 0x66400, .len = 0,
> +		.features = BIT(DPU_PINGPONG_DITHER),
> +		.sblk = &sc7280_pp_sblk,
> +		.merge_3d = MERGE_3D_3,
> +		.intr_done = -1,
> +		.intr_rdptr = -1,
> +	},
>  };
>  
>  static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 72634a8109e8..3ea63ca358a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -450,27 +450,6 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	.len = 0x20, .version = 0x20000},
>  };
>  
> -#define PP_BLK_DITHER(_name, _id, _base, _merge_3d, _sblk, _done, _rdptr) \
> -	{\
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = 0, \
> -	.features = BIT(DPU_PINGPONG_DITHER), \
> -	.merge_3d = _merge_3d, \
> -	.sblk = &_sblk, \
> -	.intr_done = _done, \
> -	.intr_rdptr = _rdptr, \
> -	}
> -#define PP_BLK(_name, _id, _base, _features, _merge_3d, _sblk, _done, _rdptr) \
> -	{\
> -	.name = _name, .id = _id, \
> -	.base = _base, .len = 0xd4, \
> -	.features = _features, \
> -	.merge_3d = _merge_3d, \
> -	.sblk = &_sblk, \
> -	.intr_done = _done, \
> -	.intr_rdptr = _rdptr, \
> -	}
> -
>  /*************************************************************
>   * DSC sub blocks config
>   *************************************************************/
> -- 
> 2.39.2
> 
