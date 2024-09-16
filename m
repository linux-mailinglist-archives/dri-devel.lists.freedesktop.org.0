Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B2979E4E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 11:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D819010E17C;
	Mon, 16 Sep 2024 09:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jsPGQlYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E860E10E17C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 09:22:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0C7F5C0117;
 Mon, 16 Sep 2024 09:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D82BC4CEC4;
 Mon, 16 Sep 2024 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726478521;
 bh=A5qBoko8pAMwveL+v901lMUwnWa5DeXCPvgTk3pPW/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jsPGQlYBPSTiFJMXX9gAj5l7zVJTiyzJzXpksrqR1WURfgNlsR0edZrPFBFebfxPh
 1naZciVddWbs2v5+7UTUIxbnrMUVzYbF5ER+r4g7G90IE6v7I0XAKjcFMgpbg4pig/
 wQ1XSQ+SdxEj2650FQa2tjaQT0SoQ+ylNtYEqDp9dTqjaKiOECALJJSYA7VNitOgMh
 AjMnnhcHLCDsPFpPK6KW1AURzv0wx3qvnIOHepmhmYrEopdQjswknmjwCMOOKs1mS4
 TWRHOApsZFFUD1JA6Wcz85YIauCpiAwmve4uFw0m7r0nd+IqVpw4u51eyKxUASgxfI
 5W4F6EODAOv9w==
Date: Mon, 16 Sep 2024 11:21:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Simona Vetter <simona@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 15/27] regulator: add s2dos05 regulator support
Message-ID: <35liocltjuxv3gjueuvpaytx44crebbc4c63atztakuq5dfpax@bquve7tkrvtx>
References: <20240913-starqltechn_integration_upstream-v4-0-2d2efd5c5877@gmail.com>
 <20240913-starqltechn_integration_upstream-v4-15-2d2efd5c5877@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913-starqltechn_integration_upstream-v4-15-2d2efd5c5877@gmail.com>
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

On Fri, Sep 13, 2024 at 06:07:58PM +0300, Dzmitry Sankouski wrote:
> S2dos05 has 1 buck and 4 LDO regulators, used for powering
> panel/touchscreen.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> 

...

> +#include <linux/bug.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/mfd/samsung/core.h>
> +#include <linux/regulator/s2dos05.h>
> +#include <linux/i2c.h>
> +
> +struct s2dos05_data {
> +	struct regmap *regmap;
> +	struct device *dev;
> +};
> +
> +static const struct regulator_ops s2dos05_ops = {

Keep definitions together. This goes down, after all declarations and
macros.

> +	.list_voltage		= regulator_list_voltage_linear,
> +	.map_voltage		= regulator_map_voltage_linear,
> +	.is_enabled		= regulator_is_enabled_regmap,
> +	.enable			= regulator_enable_regmap,
> +	.disable		= regulator_disable_regmap,
> +	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
> +	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
> +	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
> +	.set_active_discharge	= regulator_set_active_discharge_regmap,
> +};
> +
> +#define _BUCK(macro)	S2DOS05_BUCK##macro
> +#define _buck_ops(num)	s2dos05_ops##num
> +
> +#define _LDO(macro)	S2DOS05_LDO##macro
> +#define _REG(ctrl)	S2DOS05_REG##ctrl
> +#define _ldo_ops(num)	s2dos05_ops##num
> +#define _MASK(macro)	S2DOS05_ENABLE_MASK##macro
> +#define _TIME(macro)	S2DOS05_ENABLE_TIME##macro
> +

...

> +
> +static struct regulator_desc regulators[S2DOS05_REGULATOR_MAX] = {

This should be const.

> +		// name, id, ops, min_uv, uV_step, vsel_reg, enable_reg
> +		LDO_DESC("ldo1", _LDO(1), &_ldo_ops(), _LDO(_MIN1),
> +			_LDO(_STEP1), _REG(_LDO1_CFG),
> +			_REG(_EN), _MASK(_L1), _TIME(_LDO), _REG(_LDO1_CFG)),
> +		LDO_DESC("ldo2", _LDO(2), &_ldo_ops(), _LDO(_MIN1),
> +			_LDO(_STEP1), _REG(_LDO2_CFG),
> +			_REG(_EN), _MASK(_L2), _TIME(_LDO), _REG(_LDO2_CFG)),
> +		LDO_DESC("ldo3", _LDO(3), &_ldo_ops(), _LDO(_MIN2),
> +			_LDO(_STEP1), _REG(_LDO3_CFG),
> +			_REG(_EN), _MASK(_L3), _TIME(_LDO), _REG(_LDO3_CFG)),
> +		LDO_DESC("ldo4", _LDO(4), &_ldo_ops(), _LDO(_MIN2),
> +			_LDO(_STEP1), _REG(_LDO4_CFG),
> +			_REG(_EN), _MASK(_L4), _TIME(_LDO), _REG(_LDO4_CFG)),
> +		BUCK_DESC("buck1", _BUCK(1), &_buck_ops(), _BUCK(_MIN1),
> +			_BUCK(_STEP1), _REG(_BUCK_VOUT),
> +			_REG(_EN), _MASK(_B1), _TIME(_BUCK), _REG(_BUCK_CFG)),
> +};
> +
> +static int s2dos05_pmic_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
> +	struct of_regulator_match *rdata = NULL;
> +	struct s2dos05_data *s2dos05;
> +	struct regulator_config config = { };
> +	unsigned int rdev_num = ARRAY_SIZE(regulators);
> +	int i, ret;
> +
> +	s2dos05 = devm_kzalloc(dev, sizeof(struct s2dos05_data),
> +				GFP_KERNEL);

sizeof(*)

> +	if (!s2dos05)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, s2dos05);
> +
> +	rdata = devm_kcalloc(dev, rdev_num, sizeof(*rdata), GFP_KERNEL);
> +	if (!rdata)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < rdev_num; i++)
> +		rdata[i].name = regulators[i].name;
> +
> +	s2dos05->regmap = iodev->regmap_pmic;
> +	s2dos05->dev = dev;
> +	if (!dev->of_node)
> +		dev->of_node = dev->parent->of_node;
> +
> +	for (i = 0; i < rdev_num; i++) {
> +		struct regulator_dev *regulator;
> +
> +		config.init_data = rdata[i].init_data;
> +		config.of_node = rdata[i].of_node;
> +		config.dev = dev;
> +		config.driver_data = s2dos05;
> +		regulator = devm_regulator_register(&pdev->dev,
> +						&regulators[i], &config);
> +		if (IS_ERR(regulator)) {
> +			ret = PTR_ERR(regulator);
> +			dev_err(&pdev->dev, "regulator init failed for %d\n",
> +				i);
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct platform_device_id s2dos05_pmic_id[] = {
> +	{ "s2dos05-regulator" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(platform, s2dos05_pmic_id);
> +
> +static struct platform_driver s2dos05_platform_driver = {
> +	.driver = {
> +		.name = "s2dos05",
> +	},
> +	.probe = s2dos05_pmic_probe,
> +	.id_table = s2dos05_pmic_id,
> +};
> +module_platform_driver(s2dos05_platform_driver);
> +
> +MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
> +MODULE_DESCRIPTION("SAMSUNG s2dos05 Regulator Driver");

s/SAMSUNG/Samsung/

Also, your Kconfig used different name, so please use one - probably
Samsung.

This applies to MFD patch as well.

> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/regulator/s2dos05.h b/include/linux/regulator/s2dos05.h
> new file mode 100644
> index 000000000000..2e89fcbce769
> --- /dev/null
> +++ b/include/linux/regulator/s2dos05.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */

Are you sure that here (and other places) you want any newer GPL? This
is quite odd. Does original code (from which you took 2016 copyrights)
have this as well?

Best regards,
Krzysztof

