Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ADC7100F5
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 00:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B72510E61A;
	Wed, 24 May 2023 22:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399AB10E61A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 22:27:11 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DD8AA3F812;
 Thu, 25 May 2023 00:27:08 +0200 (CEST)
Date: Thu, 25 May 2023 00:27:07 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v13 02/10] drm/msm/dpu: add dsc blocks to the catalog of
 MSM8998 and SC8180X
Message-ID: <nihammaqz2eklkxddojannftwtyvbushvrpptgfh64n6sy3l3h@74ei6r5isjga>
References: <1684800039-18231-1-git-send-email-quic_khsieh@quicinc.com>
 <1684800039-18231-3-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1684800039-18231-3-git-send-email-quic_khsieh@quicinc.com>
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

Title: DSC


On 2023-05-22 17:00:31, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Some platforms have DSC blocks which have not been declared in the catalog.
> Complete DSC 1.1 support for all platforms by adding the missing blocks to
> MSM8998 and SC8180X.
> 
> Changes in v9:
> -- add MSM8998 and SC8180x to commit title
> 
> Changes in v10:
> -- fix grammar at commit text
> 
> Changes in v12:
> -- fix "titil" with "title" at changes in v9
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 11 +++++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index c0dd477..521cfd5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -126,6 +126,11 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
>  };
>  
> +static const struct dpu_dsc_cfg msm8998_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
> +};
> +
>  static const struct dpu_dspp_cfg msm8998_dspp[] = {
>  	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
>  		 &msm8998_dspp_sblk),
> @@ -199,6 +204,8 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>  	.dspp = msm8998_dspp,
>  	.pingpong_count = ARRAY_SIZE(msm8998_pp),
>  	.pingpong = msm8998_pp,
> +	.dsc_count = ARRAY_SIZE(msm8998_dsc),
> +	.dsc = msm8998_dsc,
>  	.intf_count = ARRAY_SIZE(msm8998_intf),
>  	.intf = msm8998_intf,
>  	.vbif_count = ARRAY_SIZE(msm8998_vbif),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index e8057a1..fec1665 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -142,6 +142,15 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
>  	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
>  };
>  
> +static const struct dpu_dsc_cfg sc8180x_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
> +	DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
> +};
> +
>  static const struct dpu_intf_cfg sc8180x_intf[] = {
>  	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK,
>  			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> @@ -206,6 +215,8 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
>  	.mixer = sc8180x_lm,
>  	.pingpong_count = ARRAY_SIZE(sc8180x_pp),
>  	.pingpong = sc8180x_pp,
> +	.dsc_count = ARRAY_SIZE(sc8180x_dsc),
> +	.dsc = sc8180x_dsc,
>  	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
>  	.merge_3d = sc8180x_merge_3d,
>  	.intf_count = ARRAY_SIZE(sc8180x_intf),
> -- 
> 2.7.4
> 
