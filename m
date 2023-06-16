Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1A5733CAE
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 01:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC8C10E6A3;
	Fri, 16 Jun 2023 23:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E5610E13B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 23:00:35 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 966452147A;
 Sat, 17 Jun 2023 01:00:33 +0200 (CEST)
Date: Sat, 17 Jun 2023 01:00:32 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 08/19] drm/msm/dpu: drop zero features from
 dpu_ctl_cfg data
Message-ID: <sx4hzaybb65qoar2cd6ergzs2oromywfs7g4clvifjgiy5ttlq@bmt4oobpeq75>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616100317.500687-9-dmitry.baryshkov@linaro.org>
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

On 2023-06-16 13:03:06, Dmitry Baryshkov wrote:
> Drop useless zero assignments to the dpu_ctl_cfg::features field.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 3 ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 757ac648a692..e0cc1ce3f3e2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -54,7 +54,6 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x1200, .len = 0x94,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
> @@ -66,13 +65,11 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0x94,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0x94,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 9fb8ef21c7f0..f52e1fa27e2c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -58,19 +58,16 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
>  	{
>  	.name = "ctl_2", .id = CTL_2,
>  	.base = 0x1400, .len = 0xe4,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>  	},
>  	{
>  	.name = "ctl_3", .id = CTL_3,
>  	.base = 0x1600, .len = 0xe4,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>  	},
>  	{
>  	.name = "ctl_4", .id = CTL_4,
>  	.base = 0x1800, .len = 0xe4,
> -	.features = 0,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>  	},
>  };
> -- 
> 2.39.2
> 
