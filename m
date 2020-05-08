Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFF01CB0FD
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 15:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141866E19A;
	Fri,  8 May 2020 13:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A917B6E19A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 13:52:11 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id 7so5260595pjo.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 06:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0jCsV9kMCvKoLy/+F2UgXK4X/51ktfa1OAMmkbW9Vos=;
 b=ghHY8m6xtX8A574McPTJ+47EkLLBC4yXXpjqq5KpkaG44TQALnL8DTje3tAxiPinzi
 fXfnByOXmrNQArBPy2GqK++mVUdsKUcHeqINCPGHjg0HmnstTAdBq8Pyj7wtwj10gsva
 Ng92GCFDKcfcF2puH7AWmOgxKZpLDKE3bLs5G8mZ3jKLRq3w/W7V7+zgryKhtPTTzN8e
 91HI2CD9MSokbfuol3Yjg42Vw4RjQj9xnuO0Zsa5XrKwjIl71sN1hHhARQvfttm0rsdb
 cUxf7iSBcs+dVFb2zTcuhMUUygVCggJQqUrtkYkKIBCSbkBYzLbUNk9W7+KI303KiSEk
 EbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0jCsV9kMCvKoLy/+F2UgXK4X/51ktfa1OAMmkbW9Vos=;
 b=MhtvtkRalXzDKDfeQ7f/WmF7HVSpOugpYj5K27zqM6PubpCDgO2/w7LKSEqhLEr3YJ
 6Q+YN9tAYXZok9R2Koiixf8YTK97ZMETFnhBVQs4Slao23v6hlwUnc2FO/K8nm9P4mGQ
 q7/+jCgHXcnGIK/sW1Ri+wF6NE0eS/HD+eB0sLsl7jq1+hcrJqK8H9YqlvAFlr55eoWI
 ycFqScf2LAMExlWmIUHd5sXClSfQqfhda5C000M8a1D5jWfiH7xupupOWUB64U5c+X/+
 4ToaXAXTILaf36On9azIXg7oSHkjuY4Pjj7TKvLFO/2FKWP4KH3EkWH6M1LF0xQ8zVRQ
 NTWA==
X-Gm-Message-State: AGi0PuYSoFOsiLmFiLddg+UBJK+Drw44O04AuyktOHELJH/ID8hc8S8d
 FLdcEQ7UUTVs3pN6woF8xnEkoQ==
X-Google-Smtp-Source: APiQypI9Qdzl3FHEOWr4U3hPDPJFhtn4Y3+xwR+HhV6XqnRiET+VZg6Rk0X/IKLivbJ7mZtbbldAEQ==
X-Received: by 2002:a17:90a:e013:: with SMTP id
 u19mr5644114pjy.16.1588945931131; 
 Fri, 08 May 2020 06:52:11 -0700 (PDT)
Received: from dragon ([80.251.214.228])
 by smtp.gmail.com with ESMTPSA id o6sm1845540pfp.172.2020.05.08.06.52.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 May 2020 06:52:10 -0700 (PDT)
Date: Fri, 8 May 2020 21:51:59 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36
 and its derivatives, such as MSM8939.
Message-ID: <20200508135157.GD30486@dragon>
References: <20200501205201.149804-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200501205201.149804-1-konradybcio@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: freedreno@lists.freedesktop.org, skrzynka@konradybcio.pl,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin <zhengbin13@huawei.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Konrad,

On Fri, May 01, 2020 at 10:51:59PM +0200, Konrad Dybcio wrote:
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Please write up some commit log.  Since this is based on msm8x16_config,
maybe document the differences from it in commit log?

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 70 ++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> index e3c4c250238b7..1c7de7d6870cf 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> @@ -342,6 +342,75 @@ static const struct mdp5_cfg_hw msm8x16_config = {
>  	.max_clk = 320000000,
>  };
>  
> +static const struct mdp5_cfg_hw msm8x36_config = {
> +	.name = "msm8x36",
> +	.mdp = {
> +		.count = 1,
> +		.base = { 0x0 },
> +		.caps = MDP_CAP_SMP |
> +			0,
> +	},
> +	.smp = {
> +		.mmb_count = 8,
> +		.mmb_size = 10240,
> +		.clients = {
> +			[SSPP_VIG0] = 1, [SSPP_DMA0] = 4,
> +			[SSPP_RGB0] = 7, [SSPP_RGB1] = 8,
> +		},
> +	},
> +	.ctl = {
> +		.count = 3,
> +		.base = { 0x01000, 0x01200, 0x01400 },
> +		.flush_hw_mask = 0x4003ffff,
> +	},
> +	.pipe_vig = {
> +		.count = 1,
> +		.base = { 0x04000 },
> +		.caps = MDP_PIPE_CAP_HFLIP | MDP_PIPE_CAP_VFLIP |
> +				MDP_PIPE_CAP_SCALE | MDP_PIPE_CAP_CSC |
> +				MDP_PIPE_CAP_DECIMATION,
> +	},
> +	.pipe_rgb = {
> +		.count = 2,
> +		.base = { 0x14000, 0x16000 },
> +		.caps = MDP_PIPE_CAP_HFLIP | MDP_PIPE_CAP_VFLIP |
> +				MDP_PIPE_CAP_DECIMATION,
> +	},
> +	.pipe_dma = {
> +		.count = 1,
> +		.base = { 0x24000 },
> +		.caps = MDP_PIPE_CAP_HFLIP | MDP_PIPE_CAP_VFLIP,
> +	},
> +	.lm = {
> +		.count = 1,

From what I read on downstream 3.10 kernel, there should be two mixers
just like msm8x16.

	qcom,mdss-mixer-intf-off = <0x00045000>;
	qcom,mdss-mixer-wb-off = <0x00048000>;

> +		.base = { 0x44000 },
> +		.instances = {
> +				{ .id = 0, .pp = 0, .dspp = 0,
> +				  .caps = MDP_LM_CAP_DISPLAY, },
> +				},
> +		.nb_stages = 8,
> +		.max_width = 2048,

It should probably be 2560 from downstream below.

	qcom,max-mixer-width = <2560>;

> +		.max_height = 0xFFFF,
> +	},
> +	.pp = {
> +		.count = 1,
> +		.base = { 0x70000 },
> +	},
> +

For consistency, we may want to drop this newline.  And it looks like
there is a .ad block on msm8x36.

	qcom,mdss-ad-off = <0x0079000>;

> +	.dspp = {
> +		.count = 1,
> +		.base = { 0x54000 },
> +	},
> +	.intf = {
> +		.base = { 0x00000, 0x6a800, 0x6b000 },
> +		.connect = {
> +			[0] = INTF_DISABLED,
> +			[1] = INTF_DSI,
> +			[2] = INTF_DSI,
> +		},
> +	},
> +	.max_clk = 366670000,
> +};

Need a newline here.

Shawn

>  static const struct mdp5_cfg_hw msm8x94_config = {
>  	.name = "msm8x94",
>  	.mdp = {
> @@ -840,6 +909,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
>  	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
>  	{ .revision = 3, .config = { .hw = &apq8084_config } },
>  	{ .revision = 6, .config = { .hw = &msm8x16_config } },
> +	{ .revision = 8, .config = { .hw = &msm8x36_config } },
>  	{ .revision = 9, .config = { .hw = &msm8x94_config } },
>  	{ .revision = 7, .config = { .hw = &msm8x96_config } },
>  	{ .revision = 11, .config = { .hw = &msm8x76_config } },
> -- 
> 2.26.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
