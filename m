Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C66A6671F2E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 15:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5BD10E755;
	Wed, 18 Jan 2023 14:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B50E10E752
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 14:15:44 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so83604893ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GdcrXBW2MtYoLFVY9wCMCVpizC+Njw3MsYjn9jDyc/o=;
 b=RB/YGMXSb9wj8Og+DZdsXMUzp3Ir4wtmJ7x+U7HVoknku5DSE/DHjV9KOq6FuV/Uo4
 8mttHM06RNyisoQ8/Eb6esz3avzeaLM02yKoItQiidPOliAiEogLlVJVpphb3/L5LuMp
 DnajvT+5huNOZK5wz8hvuKFEru250OgRYkXkdIGackFvV2hTEsDcg/BIlBqYHJ+ywkR7
 4pFNhijqfvdDJqQFB4zfPByKtibD3vn43SUDENxZbWdGwjV7zgJ7iKvgVIQuAQCU6TUD
 Pf2QKxlee+QENlLtSDz4V0gibVjfCEfbEwbTZ0j8ItIFapnTUaR9qFEByvDoCWadxuug
 dGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GdcrXBW2MtYoLFVY9wCMCVpizC+Njw3MsYjn9jDyc/o=;
 b=Qk8U5IcyMppaIco1sWvjoGHi9dsR07WYUL3rQE89IeEHpFl6uW70beFDtynVoBaAJM
 CoDc+L7LIGPBp2ewvYclkAFAr9tSIOz1CYcEBjpX67n0H6YsefFOlhUosJeESEsxpMOx
 eCTs3lBHP5k9PTDjoRHHViLPcyAgTyXGd9NfZeXXV7Sy9mL1GsQYUSnptl+8U3bMYdUm
 BL55dtiWHQ5tBX2JdJ0YitS5rWczrWnnH5h1+URUcrJgWe7ESqfBwIuxjtyLOxPOP4zx
 Ppil8HEbFNQxo/lPiJa0SLlvPFrg0NNRr8IwmM1oH7XNCAfc5Li6j7LsnoASzFNVqz35
 /i0A==
X-Gm-Message-State: AFqh2kpBKllc2UiSKNmhEb74RhDdBuTMHFfjyFjVv0HvEejLt6Gy02ka
 6soNBLiIIJ4PjpaVo31UCgUqEQ==
X-Google-Smtp-Source: AMrXdXsIKT861wAEvSPGjUCBEBtzhIh9JueOVO76XSoFaU14eREu4Bux4PhbSbZOwXnl4aiLRBl3Zg==
X-Received: by 2002:a17:906:348b:b0:84d:3a95:cdf9 with SMTP id
 g11-20020a170906348b00b0084d3a95cdf9mr7190429ejb.50.1674051342794; 
 Wed, 18 Jan 2023 06:15:42 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906318900b0080c433a9eeesm14695321ejy.182.2023.01.18.06.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 06:15:42 -0800 (PST)
Message-ID: <9855fd94-d6a2-9a34-d6f7-e548e1a75550@linaro.org>
Date: Wed, 18 Jan 2023 15:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: drm/msm/dsi: correct byte intf clock rate for 14nm DSI PHY
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230118130027.2345719-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230118130027.2345719-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Loic Poulain <loic.poulain@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.01.2023 14:00, Dmitry Baryshkov wrote:
> According to the vendor kernel, byte intf clock rate should be a half of
> the byte clock only when DSI PHY version is above 2.0 (in other words,
> 10nm PHYs and later) and only if PHY is used in D-PHY mode. Currently
> MSM DSI code handles only the second part of the clause (C-PHY vs
> D-PHY), skipping DSI PHY version check, which causes issues on some of
> 14nm DSI PHY platforms (e.g. qcm2290).
> 
> Move divisor selection to DSI PHY code, pass selected divisor through
> shared timings and set byte intf clock rate accordingly.
> 
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> 
> This patch is a reimplementation of [1] in a slightly more flexible way.
> 
> [1] https://patchwork.kernel.org/project/linux-arm-msm/patch/1642586079-12472-1-git-send-email-loic.poulain@linaro.org/
> 
> ---
Tested-by: Konrad Dybcio <konrad.dybcio@linaro.org> # SM6115P J606F
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Interestingly enough, this seems to somehow solve the issue
where I had to manually set the brightness again after the
first frame transfer or get a black screen otherwise.. 

Konrad
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 14 ++++++--------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c |  4 ++++
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 1a551cc0e889..bd3763a5d723 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -141,6 +141,7 @@ struct msm_dsi_phy_shared_timings {
>  	u32 clk_post;
>  	u32 clk_pre;
>  	bool clk_pre_inc_by_2;
> +	bool byte_intf_clk_div_2;
>  };
>  
>  struct msm_dsi_phy_clk_request {
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 7c21f2fba520..18fa30e1e858 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -122,6 +122,7 @@ struct msm_dsi_host {
>  	struct clk *byte_intf_clk;
>  
>  	unsigned long byte_clk_rate;
> +	unsigned long byte_intf_clk_rate;
>  	unsigned long pixel_clk_rate;
>  	unsigned long esc_clk_rate;
>  
> @@ -398,7 +399,6 @@ int msm_dsi_runtime_resume(struct device *dev)
>  
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  {
> -	unsigned long byte_intf_rate;
>  	int ret;
>  
>  	DBG("Set clk rates: pclk=%d, byteclk=%lu",
> @@ -418,13 +418,7 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  	}
>  
>  	if (msm_host->byte_intf_clk) {
> -		/* For CPHY, byte_intf_clk is same as byte_clk */
> -		if (msm_host->cphy_mode)
> -			byte_intf_rate = msm_host->byte_clk_rate;
> -		else
> -			byte_intf_rate = msm_host->byte_clk_rate / 2;
> -
> -		ret = clk_set_rate(msm_host->byte_intf_clk, byte_intf_rate);
> +		ret = clk_set_rate(msm_host->byte_intf_clk, msm_host->byte_intf_clk_rate);
>  		if (ret) {
>  			pr_err("%s: Failed to set rate byte intf clk, %d\n",
>  			       __func__, ret);
> @@ -2394,6 +2388,10 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  		goto unlock_ret;
>  	}
>  
> +	msm_host->byte_intf_clk_rate = msm_host->byte_clk_rate;
> +	if (phy_shared_timings->byte_intf_clk_div_2)
> +		msm_host->byte_intf_clk_rate /= 2;
> +
>  	msm_dsi_sfpb_config(msm_host, true);
>  
>  	ret = regulator_bulk_enable(msm_host->cfg_hnd->cfg->num_regulators,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 57445a5dc816..bb09cbe8ff86 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -350,6 +350,8 @@ int msm_dsi_dphy_timing_calc_v3(struct msm_dsi_dphy_timing *timing,
>  		timing->shared_timings.clk_pre_inc_by_2 = 0;
>  	}
>  
> +	timing->shared_timings.byte_intf_clk_div_2 = true;
> +
>  	timing->ta_go = 3;
>  	timing->ta_sure = 0;
>  	timing->ta_get = 4;
> @@ -454,6 +456,8 @@ int msm_dsi_dphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
>  	tmax = 255;
>  	timing->shared_timings.clk_pre = DIV_ROUND_UP((tmax - tmin) * 125, 10000) + tmin;
>  
> +	timing->shared_timings.byte_intf_clk_div_2 = true;
> +
>  	DBG("%d, %d, %d, %d, %d, %d, %d, %d, %d, %d",
>  		timing->shared_timings.clk_pre, timing->shared_timings.clk_post,
>  		timing->clk_zero, timing->clk_trail, timing->clk_prepare, timing->hs_exit,
> 
