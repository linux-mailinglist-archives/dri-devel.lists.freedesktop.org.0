Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61582A38BE4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD00E10E5AD;
	Mon, 17 Feb 2025 19:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vkO/WN01";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1B910E5AD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:05:30 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5439e331cceso5574845e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739819129; x=1740423929; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ht4Pghdo7uLCRP78An2YAFjRBxhnNPD/6He7H1tEdog=;
 b=vkO/WN01ulwr8d455t9nvXwDmIT4eDVzMIGcGxl1G3cbWnDv0jQb56JzWeyzSLajnQ
 geZiezWwS0fKw8+SuDmsDciI2UT1uAczHnbHN4QX/qMZ1ig4vI2rwEwh7f1Dwf3nTQX2
 U9t0Vdto2y+ohBPQ3xlnMCJgIDAGDxWh7lywNkFa74kw/SJvAix6MI1VO6zTUZE7LxYW
 3K3DNgp32BViiey5TCCsK5ssEG4wwL/7jm7piSEARDV7ULhKBNX0KyEkAI46skytDrQW
 J8kg6GtmTOzS2BWY+9oBe4WwI+5J+MRmmWdrTj7kOhtuCzkyrAVEI2F9PKqLm1ASmHMj
 dnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739819129; x=1740423929;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ht4Pghdo7uLCRP78An2YAFjRBxhnNPD/6He7H1tEdog=;
 b=eF9NnkjcZwqRPwHT1mxjd+xHUymrew4jS2/nU5wjY6Yu1is6vp8SCWeDB3OW83R3tX
 APB+Rpu52MFtFk7H+9Mj6FJGAHDCqWDdxYd9CSvnSffywJRaUmSHDihh27SIj6fkW5+N
 qsAVjwJc9gWl1zr9XOQY91qbOozPLUf2XTKepJxa1cSl/5A8fkHG1sSnmwMO14LHXybL
 ZUrtoSuby+PfmPgBsd0XzGYboGKOoR4OJBpZ/Jw4XtEtTlLmKRIf5F86NRk5I1OhYPCq
 IMzr2XMof60H7V7nOr3onFF49J7ad/isWDGTgdDrF3vNtcgl04rodEFHm1B/dfhxxMe1
 XH9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU85s6uBNXvlrrq5iHlRa/gdMhpmh+3kmxsaM12SMr8okwO+v5s9Ftx/UwDcAh+7SGRmU/li1M5+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+Ggd2GsH3vW5MHY7WU6jnxO4u2pQ9KiUVYQlnFqm1n1TRaJt8
 LEevn7B2el92gbD8HYgbzGfJqFfPlCmMcxAsv2+Lg+MdPM5Q7kYzL8Gwfg338Ag=
X-Gm-Gg: ASbGncvrVvqRByxgUoiX09JHEf7f/KgrTJVmzxhwNxJkGMy8IDHzWYSUMdBn+nURUHj
 vDUDW+1h+HEE06TeFA50P8j9g5AyKvHFZhFLxMAijbUB67IFl0OrLDfduxk+ZHR9og41w9MI9gH
 5D5jCn0ntVWK2xnWab9I9SyV12YjI8XrZqH5ifhAE6squ3Qr98Zy/inMlsd7tQjkfaymoFkx6t8
 oaLucrpX8yAcmo7a1Z3U/QABVaYeVHwYRUBJW/b1fhNjP/fbaauDivG3hRTsysiIXFblepF/DYC
 vYs2XbCmndJTqUvhzFdZeEP27qvfMYa/UNyQhQRnupbO1UyHJasxr4GMhG65Pi+BlmPFaF4=
X-Google-Smtp-Source: AGHT+IFEbhrM0nWi82cCaGvwSYXj6LdzEaAz+2hRFf9rrqKf6VFlvlNtTYi7/LSYD5QH5IDU/5M5yw==
X-Received: by 2002:a05:6512:108a:b0:545:5d:a5e2 with SMTP id
 2adb3069b0e04-5452fe2b38amr3782879e87.10.1739819129100; 
 Mon, 17 Feb 2025 11:05:29 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545d1b9c30fsm862532e87.15.2025.02.17.11.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:05:27 -0800 (PST)
Date: Mon, 17 Feb 2025 21:05:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 12/16] drm/msm/dsi: Add support for SM8750
Message-ID: <bvxw6btyefw67owjeke7edxk67dhq56ewu63cw57ckpupcunng@v7oq7knhaukm>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-12-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-12-d201dcdda6a4@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 17, 2025 at 05:41:33PM +0100, Krzysztof Kozlowski wrote:
> Add support for DSI on Qualcomm SM8750 SoC with notable difference:
> 
> DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> parents before DSI PHY is configured and the PLLs are prepared with
> initial rate is set.  Therefore assigned-clock-parents are not working
> here and driver is responsible for reparenting clocks with proper
> procedure: see dsi_clk_init_6g_v2_9().
> 
> Part of the change is exactly the same as CLK_OPS_PARENT_ENABLE, however
> CLK_OPS_PARENT_ENABLE won't work here because assigned-clock-parents are
> executed way too early - before DSI PHY is configured.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> SM8750 DSI PHY also needs Dmitry's patch:
> https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
> (or some other way of correct early setting of the DSI PHY PLL rate)
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h      |  2 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 25 ++++++++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 80 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 108 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 87496db203d6c7582eadcb74e94eb56a219df292..93c028a122f3a59b1632da76472e0a3e781c6ae8 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -98,6 +98,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi);
>  int msm_dsi_runtime_suspend(struct device *dev);
>  int msm_dsi_runtime_resume(struct device *dev);
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host);
> +int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_set_rate_v2(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
>  int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
> @@ -115,6 +116,7 @@ int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
>  int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
>  int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
>  int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host);
> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host);
>  int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>  int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi);
>  void msm_dsi_host_snapshot(struct msm_disp_state *disp_state, struct mipi_dsi_host *host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..e2a8d6fcc45b6c207a3018ea7c8744fcf34dabd2 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
>  	},
>  };
>  
> +static const struct msm_dsi_config sm8750_dsi_cfg = {

Can we use sm8650_dsi_cfg instead? What is the difference?

> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.regulator_data = sm8650_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +	.io_start = {
> +		{ 0xae94000, 0xae96000 },
> +	},
> +};
> +

The rest LGTM. I'm not very happy regarding the clock handling, but it
seems we jave to live with it.

-- 
With best wishes
Dmitry
