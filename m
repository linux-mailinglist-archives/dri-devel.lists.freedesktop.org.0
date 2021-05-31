Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C49B396785
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 19:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5976E430;
	Mon, 31 May 2021 17:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2F46E82B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 17:57:37 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e2so15970078ljk.4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 10:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=333dg+4T08AjdOad74NZzvWXFUaJwUvbt5gSjRnF5Bk=;
 b=ccMoi6YQw2A/Dh6PUhcIIvNzDlKney868O40tFPLo84ubnWU8VScD1X9CBEKTyE5XO
 Yh+SHXnbPnuqA9+Ghy3ynubdRRy+jSFRn79EQBi9pwHec4qv5wwoBOclbqgqs8fyK55B
 zupywCtm05sPDGpxWJDQg746m1fKE6urgKNzHwOmHk1PL1fbcfaqG+eGIdT51q+CzDfB
 NTEjNnELQ19r0DpxySRgK67FoUKSDA1/7AdPjM5vO6087hF+TKXw2UssWzU5hP5Hsqy8
 YOw/23vkQoPxOYG2sk9vg+DjVnmMJygaxW2cZlupCxu+8n5gehEHwbDIYtpI92h+Txz3
 ksTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=333dg+4T08AjdOad74NZzvWXFUaJwUvbt5gSjRnF5Bk=;
 b=GAh3FBb45X5WErBy9WYdWR/ajA2B3BBn9ydzCqbhFIBKiKLs/Ya+4JI46vyexnWFSY
 wGU9BQF52OZ6HPYqGG2/j3Htf+Jpx3QEazE7b8h1eQzqBaw7Y5JtQJW44PAaSaNhybRQ
 kE+fle39Lz+ElvZtbHUaYRRxJ9Ss3wLavEE5SL5vZ+JBHsnsNTeZRrLBAEfzXU0+KRwJ
 uMu2wUI/o/X7Ide9z4fwA4Yn8e0ZqU6FUcIoz+H1fWOfzzh6yCOOuwuog8Ihm+iDhRrf
 U1/2SURPOjHkBilfUiPnKb/kUF+vBWoQvuNjIG4zL5Kv+NXSEu+BsS/UsXvErowScqhe
 J7Kw==
X-Gm-Message-State: AOAM531R3jrYAw66AeCzqxFAMiC8A05v4aLwOjqWxPFA7yCTJJbPYYXs
 ssZKbkojNwoZnZ+d4JGYwyk98A==
X-Google-Smtp-Source: ABdhPJwM7suewNJq5pRVK78PJGYgETOZsCEtDogRNSid13ZhqbxxIXaSRw6HS7Ifcco0SiiLzzZsag==
X-Received: by 2002:a2e:8653:: with SMTP id i19mr17547012ljj.11.1622483856102; 
 Mon, 31 May 2021 10:57:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id o2sm943808lfu.89.2021.05.31.10.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 10:57:35 -0700 (PDT)
Subject: Re: [v1 3/3] drm/msm/dsi: Add DSI support for SC7280
To: Rajeev Nandan <rajeevny@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-4-git-send-email-rajeevny@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <03dd0cb1-433c-2bb8-6859-39e7c679dee2@linaro.org>
Date: Mon, 31 May 2021 20:57:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1622468035-8453-4-git-send-email-rajeevny@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: mkrishn@codeaurora.org, jonathan@marek.ca, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, robh+dt@kernel.org, kalyan_t@codeaurora.org,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2021 16:33, Rajeev Nandan wrote:
> Add support for v2.5.0 DSI block in the SC7280 SoC.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 20 ++++++++++++++++++++
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
>   2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index f3f1c03..d76a680 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -200,6 +200,24 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
>   	.num_dsi = 1,
>   };
>   
> +static const char * const dsi_sc7280_bus_clk_names[] = {
> +	"iface", "bus",
> +};
> +
> +static const struct msm_dsi_config sc7280_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vdda", 8350, 0 },	/* 1.2 V */
> +		},
> +	},
> +	.bus_clk_names = dsi_sc7280_bus_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
> +	.io_start = { 0xae94000 },
> +	.num_dsi = 1,
> +};
> +
>   static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>   	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
>   	.link_clk_enable = dsi_link_clk_enable_v2,
> @@ -267,6 +285,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>   		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>   	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
>   		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
> +		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>   };
>   
>   const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index ade9b60..b2c4d5e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -24,6 +24,7 @@
>   #define MSM_DSI_6G_VER_MINOR_V2_3_0	0x20030000
>   #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
>   #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
> +#define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
>   
>   #define MSM_DSI_V2_VER_MINOR_8064	0x0
>   
> 


-- 
With best wishes
Dmitry
