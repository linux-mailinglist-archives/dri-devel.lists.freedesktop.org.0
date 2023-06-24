Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C232073C612
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 03:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3A310E6FA;
	Sat, 24 Jun 2023 01:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D687410E6FA
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 01:49:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f86fbe5e4fso1633862e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 18:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687571368; x=1690163368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rfro2Z7t9cpTSkdETXGdcSnHCdkerPzBWRSGF3KNDQQ=;
 b=E711irWY9xbUdqCcACzkiknYFKiJC21DydvbOwg8e+nNeBP2ptQ+BDe9rifzUC1mEV
 qpLjB1n9M2vT9pfcd1htykBghjEw/LEVhiLiusXd+NojiMZxcLm8IzBXgOjslL3YIblG
 7DTzy6hHTy9aJtyOld5JYh5vQ0+ZQ7H/m/uf8B1JjzzDsIGjxGeoJbyt5FWMMhV7D7Fr
 7IkmYrEvQblTmzGUP6HjyUGNFPHYczoysxzQBqc6dHxssSWeHEbVKKqxCtWxlOiAL7wd
 9u/2J3Jyc0z+cSKDLESVsHbJEf0g2NGykxC0cNT0vIS2p8jbjvXW3tW/fwDRvZ5Ll4d6
 6qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687571368; x=1690163368;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rfro2Z7t9cpTSkdETXGdcSnHCdkerPzBWRSGF3KNDQQ=;
 b=UE38ozrsm9bbUZhmRFCognb/V4SeXX7W3w9ZYmpqq+bktrPkZ93fx7Hs1+7ZSwwc22
 THRadkTfsEgj8obu8V4gX3RlRMMPkyupqkC/FpqVlYh8483HFIkmL45ByoWreQFrhwb1
 vXBaxzxLbv6mP+cDWznUxrOfJQy+2i3JbZwWOviYy+3moiF2aMyAEZSsMwZxojujcgHI
 f5xmxzZ3/gZtw+MRJPrpLY1aiBDETRrIVqyyzXgESSJgAPXQwy7wZswaJIHBSIz4cwPT
 LZifePlVQTBSGPe1KDdJw97cv8aEHeawUMLoK9gPDfZu7y3UauzsLFcY1JEFgtmZUpgc
 MqPg==
X-Gm-Message-State: AC+VfDz616eiBZySnDTtUajo398YHNBai6fjYPmTtpQOhJRsthTpwo/b
 3ZD0AcaCIFdexkiXnq/5YNURFA==
X-Google-Smtp-Source: ACHHUZ7lkBMDt6hQqNSL6eUx+zSLBCaelrzQ4f+uB82xB4QPavcR2tmkz9cOmbgTOgaJew8XT0385w==
X-Received: by 2002:ac2:5d28:0:b0:4f8:4255:16ca with SMTP id
 i8-20020ac25d28000000b004f8425516camr13553209lfb.38.1687571368069; 
 Fri, 23 Jun 2023 18:49:28 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a19c519000000b004f85885cff1sm94649lfe.134.2023.06.23.18.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 18:49:27 -0700 (PDT)
Message-ID: <18d969bb-69b5-0d42-1518-e8a3b92859b7@linaro.org>
Date: Sat, 24 Jun 2023 03:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 11/15] drm/msm/dsi: Add 14nm phy configuration for SM6125
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-11-1d5a638cebf2@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-11-1d5a638cebf2@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24.06.2023 02:41, Marijn Suijten wrote:
> SM6125 features only a single PHY (despite a secondary PHY PLL source
> being available to the disp_cc_mdss_pclk0_clk_src clock), and downstream
> sources for this "trinket" SoC do not define the typical "vcca"
> regulator to be available nor used.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
The introduced ops are identical to 2290, modulo regulator..

But the regulator is absent on both (VDD_MX powers it instead), so
feel free to clean that up and reuse it ;)

Konrad
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 15 +++++++++++++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 9d5795c58a98..8688ed502dcf 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -559,6 +559,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_14nm_2290_cfgs },
>  	{ .compatible = "qcom,dsi-phy-14nm-660",
>  	  .data = &dsi_phy_14nm_660_cfgs },
> +	{ .compatible = "qcom,dsi-phy-14nm-6125",
> +	  .data = &dsi_phy_14nm_6125_cfgs },
>  	{ .compatible = "qcom,dsi-phy-14nm-8953",
>  	  .data = &dsi_phy_14nm_8953_cfgs },
>  #endif
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 8b640d174785..ebf915f5e6c6 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -52,6 +52,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_6125_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 3ce45b023e63..5d43c9ec69ae 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1068,6 +1068,21 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
>  	.num_dsi_phy = 2,
>  };
>  
> +const struct msm_dsi_phy_cfg dsi_phy_14nm_6125_cfgs = {
> +	.has_phy_lane = true,
> +	.ops = {
> +		.enable = dsi_14nm_phy_enable,
> +		.disable = dsi_14nm_phy_disable,
> +		.pll_init = dsi_pll_14nm_init,
> +		.save_pll_state = dsi_14nm_pll_save_state,
> +		.restore_pll_state = dsi_14nm_pll_restore_state,
> +	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
> +	.io_start = { 0x5e94400 },
> +	.num_dsi_phy = 1,
> +};
> +
>  const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
>  	.has_phy_lane = true,
>  	.regulator_data = dsi_phy_14nm_17mA_regulators,
> 
