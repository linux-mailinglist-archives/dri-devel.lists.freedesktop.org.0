Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AFA733CA8
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 00:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88B310E6A6;
	Fri, 16 Jun 2023 22:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F33810E6A3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 22:54:42 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A5EF5200C3;
 Sat, 17 Jun 2023 00:54:40 +0200 (CEST)
Date: Sat, 17 Jun 2023 00:54:39 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 07/19] drm/msm/dpu: drop zero features from
 dpu_mdp_cfg data
Message-ID: <gywbncs37e5ij2tkcxasmobx56tff3bqdtpmlu3xctl4sws2qx@qokvphbtqgjo>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-8-dmitry.baryshkov@linaro.org>
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

On 2023-06-16 13:03:05, Dmitry Baryshkov wrote:
> Drop useless zero assignments to the dpu_mdp_cfg::features field.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 1 -
>  7 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index ab1820f1ac54..e321cc0a80ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -28,7 +28,6 @@ static const struct dpu_ubwc_cfg sm8250_ubwc_cfg = {
>  static const struct dpu_mdp_cfg sm8250_mdp = {
>  	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
> -	.features = 0,
>  	.clk_ctrls = {
>  		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>  		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 2df9a00728c0..1919ee487e68 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -25,7 +25,6 @@ static const struct dpu_ubwc_cfg sc7180_ubwc_cfg = {
>  static const struct dpu_mdp_cfg sc7180_mdp = {
>  	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
> -	.features = 0,
>  	.clk_ctrls = {
>  		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>  		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 1982654e74a0..0252fe9590e7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -26,7 +26,6 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
>  static const struct dpu_mdp_cfg sm6115_mdp = {
>  	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
> -	.features = 0,
>  	.clk_ctrls = {
>  		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>  		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index ac237c3197cf..3c2083760294 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -28,7 +28,6 @@ static const struct dpu_ubwc_cfg sm6350_ubwc_cfg = {
>  static const struct dpu_mdp_cfg sm6350_mdp = {
>  	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
> -	.features = 0,
>  	.clk_ctrls = {
>  		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>  		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 24c4536e7981..54cc6ad8ee36 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -23,7 +23,6 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
>  static const struct dpu_mdp_cfg qcm2290_mdp = {
>  	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
> -	.features = 0,
>  	.clk_ctrls = {
>  		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>  		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 099b74be3fd2..f0f6f2d801b4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -27,7 +27,6 @@ static const struct dpu_ubwc_cfg sm6375_ubwc_cfg = {
>  static const struct dpu_mdp_cfg sm6375_mdp = {
>  	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
> -	.features = 0,
>  	.clk_ctrls = {
>  		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>  		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 7db3a6969189..318bed612da5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -27,7 +27,6 @@ static const struct dpu_ubwc_cfg sm8350_ubwc_cfg = {
>  static const struct dpu_mdp_cfg sm8350_mdp = {
>  	.name = "top_0",
>  	.base = 0x0, .len = 0x494,
> -	.features = 0,
>  	.clk_ctrls = {
>  		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>  		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> -- 
> 2.39.2
> 
