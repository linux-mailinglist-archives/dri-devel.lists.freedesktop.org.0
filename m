Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D95742EBC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 22:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E978610E3F9;
	Thu, 29 Jun 2023 20:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CBC10E3FA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 20:44:38 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f957a45b10so1742481e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 13:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688071476; x=1690663476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yaz00FEgGCTPJB8nvCETL7NnrgelsFGdklYuZ97nPlY=;
 b=ZiLvRjrx0hTzcGSqqZFobRZbdbjQYk5Ph8ozUtUffExhYwZt8uGNvPdc+o1z0Ynp4X
 VZ+tu2UtkoXGOO5pr6F0I+l90UmhOQWGOCBPcFZg8E5oWWVipkpFIZ1zV9ZcgHMYJWkt
 dTcDBSQW8yiI0G2PBISA6VNQ7Xr7z8j0w0H/y4nDHDXLdG5/yKTTmv5cV5OH+DOWrz9C
 KdxfJp7VRpS5EI9IocXPkDD2OdnmEmDoozkoyLzlA5VRZEY+LOEmKxtkgVKVHK8JKGWY
 vr6HKRydRWhVOVLw8HUZLVnqz/TK4EF1jtbIv+SPcfggbpwA3p+8+HfyRkqimRUEyNVU
 A03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688071476; x=1690663476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yaz00FEgGCTPJB8nvCETL7NnrgelsFGdklYuZ97nPlY=;
 b=Jp/NNmwINl6Z/4aQxDmSae0TJK/3NbhGZfT0F90G2ylgTQ0NtagPHMWPkDCxWH8axt
 W0DrCbMwFGP74c2bLCtabnWHwN0JXlW32bGnDaTDB8uqAopuvjvxX0AB1w5JU5fUb06X
 Hsnsw+kWbiaN9CcxK9aPef+eb+A1lrUvRzVmL6LAUkiACj4O3JXvCgef/2Fq3JMcneIs
 6scG4uEBzmCmjxb5onYGBgRsGoxwpwm5zD3qhX4HIzMsqNVrEN+3PFiqKOcvqFef1Dj/
 POZq1sjq/xTJJrZ+fMH0Yu7kK1JGu/CmV4dDM85XBMij5Hwuqnsyrui2mc13YLuYyPqm
 4rqg==
X-Gm-Message-State: ABy/qLYJy/3Bp+FaL7W3pu7Bpp8n52dsdiYk5I5uOuOCVTVoC2TTAeQe
 KqohVhIGIjlmPVlIGOWYvVIXlA==
X-Google-Smtp-Source: APBJJlHY6jW97U1D4G7rtrJ9N/FSbLkfUZXVa4JplOMQ3ixUjo5atHOSwdsjaRQRK6wNO8jyUxStRA==
X-Received: by 2002:a19:4f10:0:b0:4f9:607a:6508 with SMTP id
 d16-20020a194f10000000b004f9607a6508mr787367lfb.50.1688071476300; 
 Thu, 29 Jun 2023 13:44:36 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512014b00b004fb326d4ff0sm2045647lfo.77.2023.06.29.13.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 13:44:35 -0700 (PDT)
Message-ID: <8ddbd947-6cb6-8c86-eb48-8b6ae9b4be2b@linaro.org>
Date: Thu, 29 Jun 2023 22:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/4] regulator: Introduce Qualcomm REFGEN regulator
 driver
Content-Language: en-US
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230628-topic-refgen-v2-0-6136487c78c5@linaro.org>
 <20230628-topic-refgen-v2-2-6136487c78c5@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230628-topic-refgen-v2-2-6136487c78c5@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Konrad Dybcio <konradybcio@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29.06.2023 22:35, Konrad Dybcio wrote:
> Modern Qualcomm SoCs have a REFGEN (reference voltage generator)
> regulator, providing reference voltage to on-chip IP, like PHYs.
> 
> Add a driver to support toggling that regulator.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
Ugh. Missed the 'const' here and below. LMK if that warrants a resend
(or.. perhaps you just have other comments)

Konrad
> +	.ops = &(struct regulator_ops) {
> +		.enable		= qcom_sdm845_refgen_enable,
> +		.disable	= qcom_sdm845_refgen_disable,
> +		.is_enabled	= qcom_sdm845_refgen_is_enabled,
> +	},
> +};
> +
> +static struct regulator_desc sm8250_refgen_desc = {
> +	.enable_reg = REFGEN_REG_PWRDWN_CTRL5,
> +	.enable_mask = REFGEN_PWRDWN_CTRL5_MASK,
> +	.enable_val = REFGEN_PWRDWN_CTRL5_ENABLE,
> +	.disable_val = 0,
> +	.enable_time = 5,
> +	.name = "refgen",
> +	.owner = THIS_MODULE,
> +	.type = REGULATOR_VOLTAGE,
> +	.ops = &(struct regulator_ops) {
> +		.enable		= regulator_enable_regmap,
> +		.disable	= regulator_disable_regmap,
> +		.is_enabled	= regulator_is_enabled_regmap,
> +	},
> +};
> +
> +static const struct regmap_config qcom_refgen_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.fast_io = true,
> +};
> +
> +static int qcom_refgen_probe(struct platform_device *pdev)
> +{
> +	struct regulator_init_data *init_data;
> +	struct regulator_config config = {};
> +	const struct regulator_desc *rdesc;
> +	struct device *dev = &pdev->dev;
> +	struct regulator_dev *rdev;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +
> +	rdesc = of_device_get_match_data(dev);
> +	if (!rdesc)
> +		return -ENODATA;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base, &qcom_refgen_regmap_config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	init_data = of_get_regulator_init_data(dev, dev->of_node, rdesc);
> +	if (!init_data)
> +		return -ENOMEM;
> +
> +	config.dev = dev;
> +	config.init_data = init_data;
> +	config.of_node = dev->of_node;
> +	config.regmap = regmap;
> +
> +	rdev = devm_regulator_register(dev, rdesc, &config);
> +	if (IS_ERR(rdev))
> +		return PTR_ERR(rdev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_refgen_match_table[] = {
> +	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_refgen_desc },
> +	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_refgen_desc },
> +	{ }
> +};
> +
> +static struct platform_driver qcom_refgen_driver = {
> +	.probe = qcom_refgen_probe,
> +	.driver = {
> +		.name = "qcom-refgen-regulator",
> +		.of_match_table = qcom_refgen_match_table,
> +	},
> +};
> +module_platform_driver(qcom_refgen_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Qualcomm REFGEN regulator driver");
> 
