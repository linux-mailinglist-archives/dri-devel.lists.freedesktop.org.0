Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CC553678C
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 21:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15B210E20A;
	Fri, 27 May 2022 19:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42D310EF4F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 19:38:27 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 1so5934568ljp.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 May 2022 12:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=klws8LcPpjxRhRYTPznrCVkjdydBI1gn+rN6wXmy0Ak=;
 b=KrlTewnJjM5HJAZjTx1l321iXwL1DYoLjqi6BQYoIaweoKhXNNqY/E5brig5JPlHIP
 WMStCe37WjZqH1y3nKNJ1/v0GzL43WoR86w2H/iOITBAEHt4s7lUZCIG7pYGEp15A0z9
 kjkujkYaAYcjj/NMWLHM21mtkRgcnOQZnfSUKSDgcmldyLOYemvC1qOoIhwJ0d7rvHrX
 Kyo5bWCL2sRafolTO1ic8H1DYsamT1jEPblaPnXhx4LC+FLZAzklkDkg1/Fl4n5fGblY
 ZGEvHzewTWzw2sP80ZA39ILnknl6RIBbRWDpxbrvBWkRDEU+4OngR8ZJx+dXbaYEFLBl
 WLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=klws8LcPpjxRhRYTPznrCVkjdydBI1gn+rN6wXmy0Ak=;
 b=DuWreKVjPwUboC4H1YlfHMfcxo+MrwyYyMse7LYhNw89iW6ONtfxAQ9RPdCDDFhjeE
 rxh623S0zFUmVACwjeQkfzqjQO18FtTTuRXB5L0RLxhELLX4Lmwk3FPecVeY6JEjgjju
 J1if0kGBOh14QTl5eqbfE5tNvo7Ydost1JbUPLsqIKtGZqIh9o20q7POISs6qnr7o0TI
 dg+Dsy3Mb7+TapQFRA39aggy2AJwXK8ZJyoa9dgpJdJy6SNSm5TO7ZX6DYt/C1HjVe3p
 vubZbOu1FLGxLk37orFqChJ6R1OgBgYvg+NYFERFMQwcduI6iuyjXyex4Wdm2FV+9JBJ
 bW0g==
X-Gm-Message-State: AOAM532a6vWBFOm9b8fdap+I8gS4AyiQ8oYR826rNYTpCMzjJ4MeXAxP
 vUKrhxCOAr4qYAdkSA5Sm/XoDtXbDCc/dA==
X-Google-Smtp-Source: ABdhPJwdG/8yeA7OAbdphmRnmQEtOCk+ov2OhcjWBljt/yhOS/iT7elZ9ESlrrDHb1oemQfklWo+2g==
X-Received: by 2002:a2e:a377:0:b0:253:e02f:1c2f with SMTP id
 i23-20020a2ea377000000b00253e02f1c2fmr20201518ljn.461.1653680306066; 
 Fri, 27 May 2022 12:38:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05651202e400b00477c69719f2sm988916lfq.174.2022.05.27.12.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 May 2022 12:38:25 -0700 (PDT)
Message-ID: <d72845af-f444-af2e-b834-6e4c754a1094@linaro.org>
Date: Fri, 27 May 2022 22:38:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/3] drm/msm/dpu: Add MISR register support for interface
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-3-quic_jesszhan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220527185407.162-3-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/05/2022 21:54, Jessica Zhang wrote:
> Add support for setting MISR registers within the interface
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 55 ++++++++++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  8 ++-
>   2 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 3f4d2c6e1b45..29aaeff9eacd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -1,5 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    */
>   
>   #include "dpu_hwio.h"
> @@ -67,6 +69,14 @@
>   #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
>   #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
>   
> +#define INTF_MISR_CTRL			0x180
> +#define INTF_MISR_SIGNATURE		0x184
> +#define INTF_MISR_FRAME_COUNT_MASK	0xFF
> +#define INTF_MISR_CTRL_ENABLE		BIT(8)
> +#define INTF_MISR_CTRL_STATUS		BIT(9)
> +#define INTF_MISR_CTRL_STATUS_CLEAR	BIT(10)
> +#define INTF_MISR_CTRL_FREE_RUN_MASK	BIT(31)

I'm tempted to ask to move these bits to some common header. Is there 
any other hardware block which uses the same bitfields to control MISR?

> +
>   static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>   		const struct dpu_mdss_cfg *m,
>   		void __iomem *addr,
> @@ -319,6 +329,47 @@ static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
>   	return DPU_REG_READ(c, INTF_LINE_COUNT);
>   }
>   
> +static void dpu_hw_intf_setup_misr(struct dpu_hw_intf *intf, bool enable, u32 frame_count)
> +{
> +	struct dpu_hw_blk_reg_map *c = &intf->hw;
> +	u32 config = 0;
> +
> +	DPU_REG_WRITE(c, INTF_MISR_CTRL, INTF_MISR_CTRL_STATUS_CLEAR);
> +
> +	/* Clear old MISR value (in case it's read before a new value is calculated)*/
> +	wmb();
> +
> +	if (enable) {
> +		config = (frame_count & INTF_MISR_FRAME_COUNT_MASK) |
> +				INTF_MISR_CTRL_ENABLE | INTF_MISR_CTRL_FREE_RUN_MASK;
> +
> +		DPU_REG_WRITE(c, INTF_MISR_CTRL, config);
> +	} else {
> +		DPU_REG_WRITE(c, INTF_MISR_CTRL, 0);
> +	}
> +}
> +
> +static int dpu_hw_intf_collect_misr(struct dpu_hw_intf *intf, u32 *misr_value)
> +{
> +	struct dpu_hw_blk_reg_map *c = &intf->hw;
> +	u32 ctrl = 0;
> +
> +	if (!misr_value)
> +		return -EINVAL;
> +
> +	ctrl = DPU_REG_READ(c, INTF_MISR_CTRL);
> +
> +	if (!(ctrl & INTF_MISR_CTRL_ENABLE))
> +		return -ENODATA;
> +
> +	if (!(ctrl & INTF_MISR_CTRL_STATUS))
> +		return -EINVAL;
> +
> +	*misr_value = DPU_REG_READ(c, INTF_MISR_SIGNATURE);
> +
> +	return 0;
> +}
> +
>   static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>   		unsigned long cap)
>   {
> @@ -329,6 +380,8 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>   	ops->get_line_count = dpu_hw_intf_get_line_count;
>   	if (cap & BIT(DPU_INTF_INPUT_CTRL))
>   		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
> +	ops->setup_misr = dpu_hw_intf_setup_misr;
> +	ops->collect_misr = dpu_hw_intf_collect_misr;
>   }
>   
>   struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 7b2d96ac61e8..8d0e7b509260 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -1,5 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
> -/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> +/*
> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>    */
>   
>   #ifndef _DPU_HW_INTF_H
> @@ -57,6 +59,8 @@ struct intf_status {
>    * @ get_line_count: reads current vertical line counter
>    * @bind_pingpong_blk: enable/disable the connection with pingpong which will
>    *                     feed pixels to this interface
> + * @setup_misr: enable/disable MISR
> + * @collect_misr: read MISR signature
>    */
>   struct dpu_hw_intf_ops {
>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
> @@ -77,6 +81,8 @@ struct dpu_hw_intf_ops {
>   	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
>   			bool enable,
>   			const enum dpu_pingpong pp);
> +	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
> +	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
>   };
>   
>   struct dpu_hw_intf {


-- 
With best wishes
Dmitry
