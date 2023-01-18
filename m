Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D7A6718D3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 11:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FF410E669;
	Wed, 18 Jan 2023 10:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6622F10E655
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 10:22:07 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 17F9720123;
 Wed, 18 Jan 2023 11:22:04 +0100 (CET)
Date: Wed, 18 Jan 2023 11:22:02 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Remove some unused variables
Message-ID: <20230118102202.3oaiv74oo2pi6uuu@SoMainline.org>
References: <20230118091833.87708-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118091833.87708-1-jiapeng.chong@linux.alibaba.com>
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run,
 Abaci Robot <abaci@linux.alibaba.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-01-18 17:18:33, Jiapeng Chong wrote:
> Variables 'sc8280xp_regdma' and 'sm8350_regdma' are defined in the
> dpu_hw_catalog.c file, but not used elsewhere, so remove these unused
> variables.
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2029:37: warning: unused
> variable 'sc8280xp_regdma'.
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:2053:37: warning: unused
> variable 'sm8350_regdma'.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3722
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Does this need a Fixes tag?

> ---
> Changes in v2:
>   -Adding the regdma entries to .dma_cfg of these chipsets.

Don't forget to change the title of this patch; now you're not removing
unused variables anymore.

- Marijn

>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 0f3da480b066..3318e1d18a0e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -2677,6 +2677,8 @@ static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
>  	.intf = sc8280xp_intf,
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
> +	.reg_dma_count = 1,
> +	.dma_cfg = &sc8280xp_regdma,
>  	.perf = &sc8280xp_perf_data,
>  	.mdss_irqs = IRQ_SC8280XP_MASK,
>  };
> @@ -2732,7 +2734,7 @@ static const struct dpu_mdss_cfg sm8350_dpu_cfg = {
>  	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  	.vbif = sdm845_vbif,
>  	.reg_dma_count = 1,
> -	.dma_cfg = &sm8250_regdma,
> +	.dma_cfg = &sm8350_regdma,
>  	.perf = &sm8350_perf_data,
>  	.mdss_irqs = IRQ_SM8350_MASK,
>  };
> -- 
> 2.20.1.7.g153144c
> 
