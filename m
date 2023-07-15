Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A30C7548B2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 15:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4228510E14D;
	Sat, 15 Jul 2023 13:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268C310E14D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 13:19:16 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb94b1423eso4831245e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jul 2023 06:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689427154; x=1692019154;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FXoY4wuUPjDOldwD7dE7gOpwgLhPzZMlyDRvF1aAR3s=;
 b=C2axjIxHAFyqA4pUT/iwr5T1Zw72zeD8qKwd9L/sJczW2aQrkfwLl4JweSQOSQ/EJK
 wVy804oYSTkALOAsniiYbueY8iRQSAHpgUqGMiQfsGikk4rRU85fZmGLJV9oPK6SxvjF
 0xEwTpEdWmO2XItPKI8ISVG3r4XGuiCTAVkljGB3f0JF2sLBm0iLFRN7kjNJ5JykAmav
 TRc28QFk5wjdlNIxAF7/z5sT44YxJE5v6DLDUuJL1f3D1yR5GzsRPpBKZ8kOPewVYOCY
 OAmFCh+7zAxA/VxU9a7qN5g6c/kFKFzlQrSt1JIbKpOxedTGVFXt49J4/XAoi+1a96nd
 oepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689427154; x=1692019154;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FXoY4wuUPjDOldwD7dE7gOpwgLhPzZMlyDRvF1aAR3s=;
 b=JLLrFwzj+UQfB9ErCHP7BF1jaVOQuX3+JnwgwfU3l0S5n347t3A5ghg3VDKX17ucWO
 cer45L0S6LCkopT7raRZkItMTP7bkzaLL9S+i1xZX+HO7HxX7uIxnhOL8vIcb5DIlSMS
 YN4y0ffGAsEx+JqvfeMRJQG610/PYmO5J7xtIao9E8uxFtCvhFBYXmYD9SjgxGKYLk5p
 Z2QJQW8TViWKnNVhGKH6YY8MQMcI5WPTGlvFF+q2UUfaqqCmKGolafrRCFCGXeFghbbX
 kshUoYQese02+/eeiziuyig2sa6iP5HGfI7LODoqQbRY7rGNUzvNrfaUcJbYEdH5tqZQ
 wl3g==
X-Gm-Message-State: ABy/qLbC2i5hFK+/oEgVT2zXTkpONLDy07hKsZd3TKFkZsYZ9PHuKYCJ
 ZkBCIvvRPasQxOAOxgixFK7nBQ==
X-Google-Smtp-Source: APBJJlHNHGPM6ATv15FJZUAumex5mVufXUwPA28GGXr0NLXlGIQ+FshHvcE2kpVgnkdPPX9VCM7m1A==
X-Received: by 2002:a05:6512:3b14:b0:4fb:8771:e898 with SMTP id
 f20-20020a0565123b1400b004fb8771e898mr7541862lfv.15.1689427153761; 
 Sat, 15 Jul 2023 06:19:13 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
 by smtp.gmail.com with ESMTPSA id
 v3-20020ac25583000000b004fcdd81355csm591322lfg.269.2023.07.15.06.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jul 2023 06:19:12 -0700 (PDT)
Message-ID: <6d709bda-afb3-35ce-7653-7703120699af@linaro.org>
Date: Sat, 15 Jul 2023 15:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 7/8] drm/msm/mdss: Handle the reg bus ICC path
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
 <20230712121145.1994830-8-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230712121145.1994830-8-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.07.2023 14:11, Dmitry Baryshkov wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects, from none to otherwise
> inexplicable DSI timeouts.
> 
> Provide a way for MDSS driver to vote on this bus.
> 
> A note regarding vote values. Newer platforms have corresponding
> bandwidth values in the vendor DT files. For the older platforms there
> was a static vote in the mdss_mdp and rotator drivers. I choose to be
> conservative here and choose this value as a default.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
We can store data in icc units (without the *1000).

Konrad
>  drivers/gpu/drm/msm/msm_mdss.c | 51 +++++++++++++++++++++++++++++++---
>  1 file changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index b7765e63d549..ee31a9ab88d4 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -26,6 +26,8 @@
>  
>  #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
>  
> +#define DEFAULT_REG_BW	153600000UL /* Used in mdss fbdev driver */
> +
>  struct msm_mdss_data {
>  	u32 ubwc_version;
>  	/* can be read from register 0x58 */
> @@ -34,6 +36,8 @@ struct msm_mdss_data {
>  	u32 ubwc_static;
>  	u32 highest_bank_bit;
>  	u32 macrotile_mode;
> +
> +	unsigned long reg_bus_bw;
>  };
>  
>  struct msm_mdss {
> @@ -50,6 +54,7 @@ struct msm_mdss {
>  	const struct msm_mdss_data *mdss_data;
>  	struct icc_path *mdp_path[2];
>  	u32 num_mdp_paths;
> +	struct icc_path *reg_bus_path;
>  };
>  
>  static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
> @@ -57,6 +62,7 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
>  {
>  	struct icc_path *path0;
>  	struct icc_path *path1;
> +	struct icc_path *reg_bus_path;
>  
>  	path0 = devm_of_icc_get(dev, "mdp0-mem");
>  	if (IS_ERR_OR_NULL(path0))
> @@ -71,6 +77,10 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
>  		msm_mdss->num_mdp_paths++;
>  	}
>  
> +	reg_bus_path = of_icc_get(dev, "cpu-cfg");
> +	if (!IS_ERR_OR_NULL(reg_bus_path))
> +		msm_mdss->reg_bus_path = reg_bus_path;
> +
>  	return 0;
>  }
>  
> @@ -231,6 +241,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
>  		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
>  
> +	if (msm_mdss->mdss_data && msm_mdss->mdss_data->reg_bus_bw)
> +		icc_set_bw(msm_mdss->reg_bus_path, 0,
> +			   Bps_to_icc(msm_mdss->mdss_data->reg_bus_bw));
> +	else
> +		icc_set_bw(msm_mdss->reg_bus_path, 0,
> +			   Bps_to_icc(DEFAULT_REG_BW));
> +
>  	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
>  	if (ret) {
>  		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);
> @@ -288,6 +305,9 @@ static int msm_mdss_disable(struct msm_mdss *msm_mdss)
>  	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
>  		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
>  
> +	if (msm_mdss->reg_bus_path)
> +		icc_set_bw(msm_mdss->reg_bus_path, 0, 0);
> +
>  	return 0;
>  }
>  
> @@ -374,6 +394,8 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
>  	if (!msm_mdss)
>  		return ERR_PTR(-ENOMEM);
>  
> +	msm_mdss->mdss_data = of_device_get_match_data(&pdev->dev);
> +
>  	msm_mdss->mmio = devm_platform_ioremap_resource_byname(pdev, is_mdp5 ? "mdss_phys" : "mdss");
>  	if (IS_ERR(msm_mdss->mmio))
>  		return ERR_CAST(msm_mdss->mmio);
> @@ -464,8 +486,6 @@ static int mdss_probe(struct platform_device *pdev)
>  	if (IS_ERR(mdss))
>  		return PTR_ERR(mdss);
>  
> -	mdss->mdss_data = of_device_get_match_data(&pdev->dev);
> -
>  	platform_set_drvdata(pdev, mdss);
>  
>  	/*
> @@ -499,11 +519,13 @@ static const struct msm_mdss_data msm8998_data = {
>  	.ubwc_version = UBWC_1_0,
>  	.ubwc_dec_version = UBWC_1_0,
>  	.highest_bank_bit = 1,
> +	.reg_bus_bw = 76800 * 1000,
>  };
>  
>  static const struct msm_mdss_data qcm2290_data = {
>  	/* no UBWC */
>  	.highest_bank_bit = 0x2,
> +	.reg_bus_bw = 76800 * 1000,
>  };
>  
>  static const struct msm_mdss_data sc7180_data = {
> @@ -511,6 +533,7 @@ static const struct msm_mdss_data sc7180_data = {
>  	.ubwc_dec_version = UBWC_2_0,
>  	.ubwc_static = 0x1e,
>  	.highest_bank_bit = 0x3,
> +	.reg_bus_bw = 76800 * 1000,
>  };
>  
>  static const struct msm_mdss_data sc7280_data = {
> @@ -520,6 +543,7 @@ static const struct msm_mdss_data sc7280_data = {
>  	.ubwc_static = 1,
>  	.highest_bank_bit = 1,
>  	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000 * 1000,
>  };
>  
>  static const struct msm_mdss_data sc8180x_data = {
> @@ -527,6 +551,7 @@ static const struct msm_mdss_data sc8180x_data = {
>  	.ubwc_dec_version = UBWC_3_0,
>  	.highest_bank_bit = 3,
>  	.macrotile_mode = 1,
> +	.reg_bus_bw = 76800 * 1000,
>  };
>  
>  static const struct msm_mdss_data sc8280xp_data = {
> @@ -536,12 +561,14 @@ static const struct msm_mdss_data sc8280xp_data = {
>  	.ubwc_static = 1,
>  	.highest_bank_bit = 2,
>  	.macrotile_mode = 1,
> +	.reg_bus_bw = 76800 * 1000,
>  };
>  
>  static const struct msm_mdss_data sdm845_data = {
>  	.ubwc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
>  	.highest_bank_bit = 2,
> +	.reg_bus_bw = 76800 * 1000,
>  };
>  
>  static const struct msm_mdss_data sm6350_data = {
> @@ -550,12 +577,14 @@ static const struct msm_mdss_data sm6350_data = {
>  	.ubwc_swizzle = 6,
>  	.ubwc_static = 0x1e,
>  	.highest_bank_bit = 1,
> +	.reg_bus_bw = 76800 * 1000,
>  };
>  
>  static const struct msm_mdss_data sm8150_data = {
>  	.ubwc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
>  	.highest_bank_bit = 2,
> +	.reg_bus_bw = 76800 * 1000,
>  };
>  
>  static const struct msm_mdss_data sm6115_data = {
> @@ -564,6 +593,7 @@ static const struct msm_mdss_data sm6115_data = {
>  	.ubwc_swizzle = 7,
>  	.ubwc_static = 0x11f,
>  	.highest_bank_bit = 0x1,
> +	.reg_bus_bw = 76800 * 1000,
>  };
>  
>  static const struct msm_mdss_data sm8250_data = {
> @@ -574,6 +604,18 @@ static const struct msm_mdss_data sm8250_data = {
>  	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
>  	.highest_bank_bit = 3,
>  	.macrotile_mode = 1,
> +	.reg_bus_bw = 76800 * 1000,
> +};
> +
> +static const struct msm_mdss_data sm8350_data = {
> +	.ubwc_version = UBWC_4_0,
> +	.ubwc_dec_version = UBWC_4_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 1,
> +	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
> +	.highest_bank_bit = 3,
> +	.macrotile_mode = 1,
> +	.reg_bus_bw = 74000 * 1000,
>  };
>  
>  static const struct msm_mdss_data sm8550_data = {
> @@ -584,6 +626,7 @@ static const struct msm_mdss_data sm8550_data = {
>  	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
>  	.highest_bank_bit = 3,
>  	.macrotile_mode = 1,
> +	.reg_bus_bw = 57000 * 1000,
>  };
>  
>  static const struct of_device_id mdss_dt_match[] = {
> @@ -600,8 +643,8 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
>  	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
>  	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
> -	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
> -	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
> +	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
> +	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
>  	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
>  	{}
>  };
