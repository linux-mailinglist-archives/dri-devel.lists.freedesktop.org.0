Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7595693221
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 16:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2774F10E324;
	Sat, 11 Feb 2023 15:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06BA10E2C1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 15:52:20 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gr7so22537330ejb.5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Feb 2023 07:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X/CBZGFwxvsxz1KF+BMnclxJtqObB1aSM34Xtri/K84=;
 b=SZ6/oJM29QaSwLJxKkL572VuSipP5WvS9TWNyVDin/Jbu3hU9VW9ffZuJfre5tsd4O
 BlnAzbgPE8unrFETJZoQ6JI/2wzVUVnz8bw6uUxz3HuJ36k43q5rZagQYSWhShKVneJu
 dD9KWQYhhGSQ1oiuvPOsOEoJAFdynklEMXrgdmQuVHL3C0WVg4HDZz0YGlXfcSb4uC4e
 d5fLBDzIDfy3S6oyaJwrN80PC7uqZKyXG2loyJeo/XyHjBLSSeNTS6YdipO0nIebUDat
 32U8KApsCMgl39ZBvRJltc/mRz4JdmHDbR8PIzE0k51EjhFDVYp7N+Yny2Am+OSntmme
 Gbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X/CBZGFwxvsxz1KF+BMnclxJtqObB1aSM34Xtri/K84=;
 b=XSrrV66qzx5DMoQOvalj4ZYoRvluXQg8WZIov0djZrQLzJ73bWLxmW3/O7cNct1PGg
 0BBndi8Aq9OiRL5+Sz/YpCRRsGm/zbxjZfpjrmuva3Qg7EIURMU6E9KMTNallndvZExm
 1LRMhTo4M6w0QZCe9yg2+Kn8crwCwU1aJvAma2daTTYOrWt+LEGzXBrOwTQf0CfbnQ8u
 fk0hUXudCF3VTDmFnSDtqDQfmVCf283fDWi60n5vInZU7CVQgjbvK7atGWasvPwzwPP9
 a37mYnt/xt5IF3ywwXKmlu+4qBWtOFj866PIdIE0trYcMR9MAybn5u3b/2cz1+J0oYS+
 8aUg==
X-Gm-Message-State: AO0yUKW2qF7I7ZOzlsPLtwKKFtOQ5thjomIKUuyRusrKvn5sRYqDt6cR
 Qti8ozpEyTTaYrlZL3dYMqQ1Pg==
X-Google-Smtp-Source: AK7set+pNxXblClsex3EZH3sUAnVDSU7NEuLDctsJGUWMlH3Q7l6qPTWBbmo3srYP4i7WdH1i59bZg==
X-Received: by 2002:a17:907:94ca:b0:8aa:be1a:c4bf with SMTP id
 dn10-20020a17090794ca00b008aabe1ac4bfmr22547966ejc.16.1676130739227; 
 Sat, 11 Feb 2023 07:52:19 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a1709065e0800b0087fa83790d8sm4051582eju.13.2023.02.11.07.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 07:52:18 -0800 (PST)
Message-ID: <fc29d13c-28bf-5090-bfaa-52ec6b3860e1@linaro.org>
Date: Sat, 11 Feb 2023 17:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/10] drm/msm/dsi: dsi_cfg: Deduplicate identical structs
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-6-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211115110.1462920-6-konrad.dybcio@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 Harigovindan P <harigovi@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>, marijn.suijten@somainline.org,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/02/2023 13:51, Konrad Dybcio wrote:
> Some structs were defined multiple times for no apparent reason.
> Deduplicate them.
> 
> Fixes: 3f3c8aff1f8f ("drm/msm/dsi: Add configuration for 8x76")
> Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
> Fixes: 6125bd327e16 ("drm/msm: add DSI support for sc7180")
> Fixes: 65c391b31994 ("drm/msm/dsi: Add DSI support for SC7280")

I think we should drop these Fixes headers. There are no issues to be 
fixed in those versions. The code was inefficient and resulted in 
duplication of data, but that's all.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 77 +++++++++++--------------------
>   1 file changed, 26 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 5f62c563bd1c..860681bfc084 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -47,41 +47,32 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>   	},
>   };
>   
> -static const char * const dsi_8916_bus_clk_names[] = {
> +static const char * const dsi_v1_3_1_clk_names[] = {
>   	"mdp_core", "iface", "bus",
>   };
>   
> -static const struct regulator_bulk_data msm8916_dsi_regulators[] = {
> +static const struct regulator_bulk_data dsi_v1_3_1_regulators[] = {
>   	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
>   	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
>   };
>   
>   static const struct msm_dsi_config msm8916_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = msm8916_dsi_regulators,
> -	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
> -	.bus_clk_names = dsi_8916_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
> +	.regulator_data = dsi_v1_3_1_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_v1_3_1_regulators),
> +	.bus_clk_names = dsi_v1_3_1_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v1_3_1_clk_names),
>   	.io_start = {
>   		{ 0x1a98000, 0 },
>   	},
>   };
>   
> -static const char * const dsi_8976_bus_clk_names[] = {
> -	"mdp_core", "iface", "bus",
> -};
> -
> -static const struct regulator_bulk_data msm8976_dsi_regulators[] = {
> -	{ .supply = "vdda", .init_load_uA = 100000 },	/* 1.2 V */
> -	{ .supply = "vddio", .init_load_uA = 100000 },	/* 1.8 V */
> -};
> -
>   static const struct msm_dsi_config msm8976_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = msm8976_dsi_regulators,
> -	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
> -	.bus_clk_names = dsi_8976_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
> +	.regulator_data = dsi_v1_3_1_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_v1_3_1_regulators),
> +	.bus_clk_names = dsi_v1_3_1_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v1_3_1_clk_names),
>   	.io_start = {
>   		{ 0x1a94000, 0x1a96000, 0 },
>   	},
> @@ -107,10 +98,6 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
>   	},
>   };
>   
> -static const char * const dsi_8996_bus_clk_names[] = {
> -	"mdp_core", "iface", "bus", "core_mmss",
> -};
> -
>   static const struct regulator_bulk_data msm8996_dsi_regulators[] = {
>   	{ .supply = "vdda", .init_load_uA = 18160 },	/* 1.25 V */
>   	{ .supply = "vcca", .init_load_uA = 17000 },	/* 0.925 V */
> @@ -121,8 +108,8 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
>   	.regulator_data = msm8996_dsi_regulators,
>   	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
> -	.bus_clk_names = dsi_8996_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
> +	.bus_clk_names = dsi_6g_bus_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>   	.io_start = {
>   		{ 0x994000, 0x996000, 0 },
>   	},
> @@ -167,24 +154,20 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
>   	},
>   };
>   
> -static const char * const dsi_sdm845_bus_clk_names[] = {
> +static const char * const dsi_v2_4_clk_names[] = {
>   	"iface", "bus",
>   };
>   
> -static const char * const dsi_sc7180_bus_clk_names[] = {
> -	"iface", "bus",
> -};
> -
> -static const struct regulator_bulk_data sdm845_dsi_regulators[] = {
> +static const struct regulator_bulk_data dsi_v2_4_regulators[] = {
>   	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
>   };
>   
>   static const struct msm_dsi_config sdm845_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = sdm845_dsi_regulators,
> -	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
> -	.bus_clk_names = dsi_sdm845_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
> +	.regulator_data = dsi_v2_4_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>   	.io_start = {
>   		{ 0xae94000, 0xae96000, 0 },
>   	},
> @@ -198,32 +181,24 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
>   	.regulator_data = sm8550_dsi_regulators,
>   	.num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
> -	.bus_clk_names = dsi_sdm845_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>   	.io_start = {
>   		{ 0xae94000, 0xae96000, 0 },
>   	},
>   };
>   
> -static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
> -	{ .supply = "vdda", .init_load_uA = 21800 },	/* 1.2 V */
> -};
> -
>   static const struct msm_dsi_config sc7180_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
> -	.regulator_data = sc7180_dsi_regulators,
> -	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
> -	.bus_clk_names = dsi_sc7180_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
> +	.regulator_data = dsi_v2_4_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>   	.io_start = {
>   		{ 0xae94000, 0 },
>   	},
>   };
>   
> -static const char * const dsi_sc7280_bus_clk_names[] = {
> -	"iface", "bus",
> -};
> -
>   static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>   	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
>   };
> @@ -232,8 +207,8 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>   	.io_offset = DSI_6G_REG_SHIFT,
>   	.regulator_data = sc7280_dsi_regulators,
>   	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
> -	.bus_clk_names = dsi_sc7280_bus_clk_names,
> -	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
>   	.io_start = {
>   		{ 0xae94000, 0xae96000, 0 },
>   	},

-- 
With best wishes
Dmitry

