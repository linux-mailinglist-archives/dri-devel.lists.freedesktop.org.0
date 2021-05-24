Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936CA38F52D
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 23:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96936E971;
	Mon, 24 May 2021 21:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685A46E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 21:51:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621893076; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Dx/uQI8w502btdlmPWESdw7tCerTwVAA5RfI8qHdxWc=;
 b=rilJ0ke5rD5no3qzLUm6T5sr1IYvg8t1tXNdvUe7N6p0x1HSuGlx6Pz1tLXouOOGbfprhbMh
 J+y+CndMvVWK1WH0tmrC5ErxM5c3G877vFnAq4CoYRo++r+oKeDNBAPSttgj0ah+xEmzevvh
 bDDeUYFUeMwbrdGl4Q4TUqiKAEs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60ac1fc760c53c8c9d2e4d60 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 24 May 2021 21:51:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 90590C43146; Mon, 24 May 2021 21:51:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E885C433D3;
 Mon, 24 May 2021 21:51:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 24 May 2021 14:51:01 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/6] drm/msm/dpu: define interrupt register
 names
In-Reply-To: <20210516202910.2141079-4-dmitry.baryshkov@linaro.org>
References: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
 <20210516202910.2141079-4-dmitry.baryshkov@linaro.org>
Message-ID: <c407ca28075fe0f4ed34f693b0c4f9c5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-16 13:29, Dmitry Baryshkov wrote:
> In order to make mdss_irqs readable (and error-prone) define names for
I think you meant "less error-prone" here.
> interrupt register indices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
With that nit fixed,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 45 ++++++++++++++++---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 18 ++++++++
>  2 files changed, 58 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b569030a0847..9a77d64d3fd4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -7,6 +7,7 @@
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include "dpu_hw_mdss.h"
> +#include "dpu_hw_interrupts.h"
>  #include "dpu_hw_catalog.h"
>  #include "dpu_kms.h"
> 
> @@ -56,6 +57,23 @@
> 
>  #define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
> 
> +#define IRQ_SDM845_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_INTR) | \
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF2_INTR) | \
> +			 BIT(MDP_INTF3_INTR) | \
> +			 BIT(MDP_INTF4_INTR) | \
> +			 BIT(MDP_AD4_0_INTR) | \
> +			 BIT(MDP_AD4_1_INTR))
> +
> +#define IRQ_SC7180_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_INTR) | \
> +			 BIT(MDP_INTF1_INTR))
> +
>  #define INTR_SC7180_MASK \
>  	(BIT(DPU_IRQ_TYPE_PING_PONG_RD_PTR) |\
>  	BIT(DPU_IRQ_TYPE_PING_PONG_WR_PTR) |\
> @@ -63,6 +81,23 @@
>  	BIT(DPU_IRQ_TYPE_PING_PONG_TEAR_CHECK) |\
>  	BIT(DPU_IRQ_TYPE_PING_PONG_TE_CHECK))
> 
> +#define IRQ_SC7280_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_7xxx_INTR) | \
> +			 BIT(MDP_INTF1_7xxx_INTR) | \
> +			 BIT(MDP_INTF5_7xxx_INTR))
> +
> +#define IRQ_SM8250_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
> +			 BIT(MDP_SSPP_TOP0_INTR2) | \
> +			 BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> +			 BIT(MDP_INTF0_INTR) | \
> +			 BIT(MDP_INTF1_INTR) | \
> +			 BIT(MDP_INTF2_INTR) | \
> +			 BIT(MDP_INTF3_INTR) | \
> +			 BIT(MDP_INTF4_INTR))
> +
> +
>  #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
>  #define DEFAULT_DPU_LINE_WIDTH		2048
>  #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
> @@ -1060,7 +1095,7 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg 
> *dpu_cfg)
>  		.reg_dma_count = 1,
>  		.dma_cfg = sdm845_regdma,
>  		.perf = sdm845_perf_data,
> -		.mdss_irqs = 0x3ff,
> +		.mdss_irqs = IRQ_SDM845_MASK,
>  	};
>  }
> 
> @@ -1091,7 +1126,7 @@ static void sc7180_cfg_init(struct dpu_mdss_cfg 
> *dpu_cfg)
>  		.reg_dma_count = 1,
>  		.dma_cfg = sdm845_regdma,
>  		.perf = sc7180_perf_data,
> -		.mdss_irqs = 0x3f,
> +		.mdss_irqs = IRQ_SC7180_MASK,
>  		.obsolete_irq = INTR_SC7180_MASK,
>  	};
>  }
> @@ -1125,7 +1160,7 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg 
> *dpu_cfg)
>  		.reg_dma_count = 1,
>  		.dma_cfg = sm8150_regdma,
>  		.perf = sm8150_perf_data,
> -		.mdss_irqs = 0x3ff,
> +		.mdss_irqs = IRQ_SDM845_MASK,
>  	};
>  }
> 
> @@ -1158,7 +1193,7 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg 
> *dpu_cfg)
>  		.reg_dma_count = 1,
>  		.dma_cfg = sm8250_regdma,
>  		.perf = sm8250_perf_data,
> -		.mdss_irqs = 0xff,
> +		.mdss_irqs = IRQ_SM8250_MASK,
>  	};
>  }
> 
> @@ -1181,7 +1216,7 @@ static void sc7280_cfg_init(struct dpu_mdss_cfg 
> *dpu_cfg)
>  		.vbif_count = ARRAY_SIZE(sdm845_vbif),
>  		.vbif = sdm845_vbif,
>  		.perf = sc7280_perf_data,
> -		.mdss_irqs = 0x1c07,
> +		.mdss_irqs = IRQ_SC7280_MASK,
>  		.obsolete_irq = INTR_SC7180_MASK,
>  	};
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 5bade5637ecc..b26a3445a8eb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -74,6 +74,24 @@ enum dpu_intr_type {
>  	DPU_IRQ_TYPE_RESERVED,
>  };
> 
> +/* When making changes be sure to sync with dpu_intr_set */
> +enum dpu_hw_intr_reg {
> +	MDP_SSPP_TOP0_INTR,
> +	MDP_SSPP_TOP0_INTR2,
> +	MDP_SSPP_TOP0_HIST_INTR,
> +	MDP_INTF0_INTR,
> +	MDP_INTF1_INTR,
> +	MDP_INTF2_INTR,
> +	MDP_INTF3_INTR,
> +	MDP_INTF4_INTR,
> +	MDP_AD4_0_INTR,
> +	MDP_AD4_1_INTR,
> +	MDP_INTF0_7xxx_INTR,
> +	MDP_INTF1_7xxx_INTR,
> +	MDP_INTF5_7xxx_INTR,
> +	MDP_INTR_MAX,
> +};
> +
>  struct dpu_hw_intr;
> 
>  /**
