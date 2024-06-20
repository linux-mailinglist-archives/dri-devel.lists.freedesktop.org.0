Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A90910B0D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A0110EAC8;
	Thu, 20 Jun 2024 16:05:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uyuA3tv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48ED610EAC9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:05:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 44791CE21BC;
 Thu, 20 Jun 2024 16:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815E2C2BD10;
 Thu, 20 Jun 2024 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718899511;
 bh=VxwxD9NlRx02IyNbc/jHsn3Pas/lBfmDoifITi881bg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uyuA3tv9HEGJ0cbi+XB62kPlv8bBvRWLA1xMi447pWjJl+MwiU9oRbgaGaqbAjiJm
 0uaW8CxfqAw5ujZj+iLTxPMLxjqoVI14D4KLfAGDCjfnGPDjKnKULYfREWZu6L13qh
 uoxKbtqfUE6NxpenmMBzvHw5P82UTD72luGvTOa1LBXGJo2VjX+8lxdnaFSgbxQUTo
 MIcU7Vxgo+h79ekBibAC/3Z2kPXJDwOkoYOM9vIz+6a/PoLRpoZa2RYLD3QsfTxhAi
 XECwf0XuI67epGZOHyA/sRtACxfM3MU1AWzpMB1p8raEkr3fh937YuY6+mcCCcx0C0
 +JI+q1MIvIkfQ==
Message-ID: <da34df13-bc57-4142-b558-88a6628d8b81@kernel.org>
Date: Thu, 20 Jun 2024 18:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/23] input: add max77705 haptic driver
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-13-e3f6662017ac@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-13-e3f6662017ac@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/06/2024 15:59, Dzmitry Sankouski wrote:
> Add support for haptic controller on MAX77705 Multifunction
> device.
> 
> This driver supports external pwm and LRA (Linear Resonant Actuator) motor.
> User can control the haptic device via force feedback framework.
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

> +static int max77705_haptic_bias(struct max77705_haptic *haptic, bool on)
> +{
> +	int error;
> +
> +	error = regmap_update_bits(haptic->regmap_haptic,
> +							   MAX77705_PMIC_REG_MAINCTRL1,
> +							   MAX77705_MAINCTRL1_BIASEN_MASK,
> +							   on << MAX77705_MAINCTRL1_BIASEN_SHIFT);
> +
> +	if (error) {
> +		dev_err(haptic->dev, "failed to %s bias: %d\n",
> +			on ? "enable" : "disable", error);
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max77705_haptic_configure(struct max77705_haptic *haptic,
> +				     bool enable)
> +{
> +	unsigned int value, config_reg;
> +	int error;
> +
> +	value = ((haptic->type << MAX77705_CONFIG2_MODE_SHIFT) |
> +		(enable << MAX77705_CONFIG2_MEN_SHIFT) |
> +		(haptic->mode << MAX77705_CONFIG2_HTYP_SHIFT) |
> +		MAX77705_HAPTIC_PWM_DIVISOR_128);
> +	config_reg = MAX77705_PMIC_REG_MCONFIG;
> +
> +	error = regmap_write(haptic->regmap_haptic,
> +			     config_reg, value);
> +	if (error) {
> +		dev_err(haptic->dev,
> +			"failed to update haptic config: %d\n", error);
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +
> +static void max77705_haptic_enable(struct max77705_haptic *haptic)
> +{
> +	int error;
> +
> +	if (haptic->enabled)
> +		return;
> +
> +	error = pwm_enable(haptic->pwm_dev);
> +	if (error) {
> +		dev_err(haptic->dev,
> +			"failed to enable haptic pwm device: %d\n", error);
> +		return;
> +	}
> +
> +	error = max77705_haptic_configure(haptic, true);
> +	if (error)
> +		goto err_enable_config;
> +
> +	haptic->enabled = true;
> +
> +	return;
> +
> +err_enable_config:
> +	pwm_disable(haptic->pwm_dev);
> +}
> +
> +static void max77705_haptic_disable(struct max77705_haptic *haptic)
> +{
> +	int error;
> +
> +	if (!haptic->enabled)
> +		return;
> +
> +	error = max77705_haptic_configure(haptic, false);
> +	if (error)
> +		return;
> +
> +	pwm_disable(haptic->pwm_dev);
> +	haptic->enabled = false;
> +}
> +
> +static void max77705_haptic_play_work(struct work_struct *work)
> +{
> +	struct max77705_haptic *haptic =
> +			container_of(work, struct max77705_haptic, work);
> +	int error;
> +
> +	error = max77705_haptic_set_duty_cycle(haptic);
> +	if (error) {
> +		dev_err(haptic->dev, "failed to set duty cycle: %d\n", error);
> +		return;
> +	}
> +
> +	if (haptic->magnitude)
> +		max77705_haptic_enable(haptic);
> +	else
> +		max77705_haptic_disable(haptic);
> +}
> +
> +static int max77705_haptic_play_effect(struct input_dev *dev, void *data,
> +				       struct ff_effect *effect)
> +{
> +	struct max77705_haptic *haptic = input_get_drvdata(dev);
> +	struct pwm_args pargs;
> +	u64 period_mag_multi;
> +
> +	haptic->magnitude = effect->u.rumble.strong_magnitude;
> +	if (!haptic->magnitude)
> +		haptic->magnitude = effect->u.rumble.weak_magnitude;
> +
> +	/*
> +	 * The magnitude comes from force-feedback interface.
> +	 * The formula to convert magnitude to pwm_duty as follows:
> +	 * - pwm_duty = (magnitude * pwm_period) / MAX_MAGNITUDE(0xFFFF)
> +	 */
> +	pr_info("magnitude: %d(%x)", haptic->magnitude, haptic->magnitude);

Do not use pr_xxx in your drivers. That's a generic comment so please
apply it everywhere. Anyway driver should be silent.


> +	pwm_get_args(haptic->pwm_dev, &pargs);
> +	period_mag_multi = (u64)pargs.period * haptic->magnitude;
> +	haptic->pwm_duty = (unsigned int)(period_mag_multi >>
> +						MAX_MAGNITUDE_SHIFT);
> +
> +	schedule_work(&haptic->work);
> +
> +	return 0;
> +}


> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(max77705_haptic_pm_ops,
> +				max77705_haptic_suspend,
> +				max77705_haptic_resume);
> +
> +static const struct of_device_id of_max77705_haptic_dt_match[] = {
> +	{ .compatible = "maxim,max77705-haptic", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, of_max77705_haptic_dt_match);
> +
> +static struct platform_driver max77705_haptic_driver = {
> +	.driver		= {
> +		.name	= "max77705-haptic",
> +		.pm	= pm_sleep_ptr(&max77705_haptic_pm_ops),
> +		.of_match_table = of_max77705_haptic_dt_match,
> +	},
> +	.probe		= max77705_haptic_probe,
> +	.remove_new	= max77705_haptic_remove,
> +};
> +module_platform_driver(max77705_haptic_driver);
> +
> +MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
> +MODULE_AUTHOR("Jaewon Kim <jaewon02.kim@samsung.com>");
> +MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");

I doubt that this driver is needed. Everything is copy of max777693.


Best regards,
Krzysztof

