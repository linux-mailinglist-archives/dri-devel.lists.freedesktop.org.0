Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4F4C74739
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 15:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EEA10E74C;
	Thu, 20 Nov 2025 14:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CVqEZpA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F8810E74C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:09:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A0A1D60052;
 Thu, 20 Nov 2025 14:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC6AC4CEF1;
 Thu, 20 Nov 2025 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763647760;
 bh=cB1MfBeclsVR7tg+ihgdmU0VGtZGLmlkem4dlSdvRNE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CVqEZpA4Nhxw17SJ6Vlb53h4OvwmjmgrppItW3kIZG6sdTTYWjpPlGn4rQMDAeDc9
 jWEkGWCbUwTt9Dt2afL8cx3GVtBatWPkjpKeglKw7d/lusU97BuPDWcZwDFb9y9OBT
 zeINZpzcVhQcmHtH28yKnbPEV/AAGjkPkL2XFsWKOMEHoYDxRIS1nIQo3YEroSaNdl
 S5LhNRuQJ/R62Xfq2HhkqGkfV0/EQJxdUiGhwXnJdLJuvysjbVRfxG/lQLs49pIRSf
 FHTj1JZ7n33i3YoRq+WnPd2bpS7LcJpQsdt82RA+av+cML3mNqSIbdGVQzP/V3RHiA
 7w8E7a7gXKMNg==
Message-ID: <3f66d2dd-4378-4d33-a0ce-3128c13ad6a5@kernel.org>
Date: Thu, 20 Nov 2025 15:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] backlight: Add Congatec Board Controller (CGBC) backlight
 support
To: petri.karhula@novatron.fi, Thomas Richard <thomas.richard@bootlin.com>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20251118-cgbc-backlight-v1-1-cc6ac5301034@novatron.fi>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251118-cgbc-backlight-v1-1-cc6ac5301034@novatron.fi>
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

On 18/11/2025 17:43, Petri Karhula via B4 Relay wrote:
> +
> +/**
> + * Get current backlight brightness
> + * @bl: Backlight device
> + *
> + * Returns the current brightness level by reading from hardware.
> + *
> + * Return: Current brightness level (0-100), or negative error code
> + */

Why are you documenting standard API?

> +static int cgbc_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct cgbc_bl_data *bl_data = bl_get_data(bl);
> +	int ret;
> +
> +	/* Read current PWM brightness settings */
> +	ret = cgbc_bl_read_pwm_settings(bl_data);
> +
> +	if (ret < 0) {
> +		dev_err(bl_data->dev, "Failed to read PWM settings: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return bl_data->current_brightness;
> +}
> +
> +/* Backlight device operations */

Huh? Can it be a GPIO device operations?

> +static const struct backlight_ops cgbc_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.update_status = cgbc_bl_update_status,
> +	.get_brightness = cgbc_bl_get_brightness,
> +};
> +
> +/**
> + * Probe function for CGBC backlight driver
> + * @pdev: Platform device
> + *
> + * Initializes the CGBC backlight driver and registers it with the
> + * Linux backlight subsystem.
> + *
> + * Return: 0 on success, negative error code on failure

Very redundant and useless comment.

> + */
> +static int cgbc_bl_probe(struct platform_device *pdev)
> +{
> +	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
> +	struct cgbc_bl_data *bl_data;
> +	struct backlight_properties props;
> +	struct backlight_device *bl_dev;
> +	int ret;
> +
> +	bl_data = devm_kzalloc(&pdev->dev, sizeof(*bl_data), GFP_KERNEL);
> +

Drop blank line. There is never such line between allocation and check.

> +	if (!bl_data)
> +		return -ENOMEM;
> +
> +	bl_data->dev = &pdev->dev;
> +	bl_data->cgbc = cgbc;
> +
> +	ret = cgbc_bl_read_pwm_settings(bl_data);
> +
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to read initial PWM settings: %d\n",
> +			ret);

return dev_err_probe

> +		return ret;
> +	}
> +
> +	memset(&props, 0, sizeof(props));
> +	props.type = BACKLIGHT_PLATFORM;
> +	props.max_brightness = CGBC_BL_MAX_BRIGHTNESS;
> +	props.brightness = bl_data->current_brightness;
> +
> +	bl_dev = devm_backlight_device_register(&pdev->dev, "cgbc-backlight",
> +						&pdev->dev, bl_data,
> +						&cgbc_bl_ops, &props);
> +
> +	if (IS_ERR(bl_dev)) {
> +		dev_err(&pdev->dev, "Failed to register backlight device\n");

return dev_err_probe

> +		return PTR_ERR(bl_dev);
> +	}
> +
> +	bl_data->bl_dev = bl_dev;
> +	platform_set_drvdata(pdev, bl_data);
> +
> +	dev_info(&pdev->dev,
> +		 "CGBC backlight driver registered (brightness=%u)\n",
> +		 bl_data->current_brightness);

Drop.

This does not look like useful printk message. Drivers should be silent
on success:
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79

> +
> +	return 0;
> +}
> +
> +/**
> + * Remove function for CGBC backlight driver
> + * @pdev: Platform device
> + *
> + * The Linux device-managed resource framework (devres) does the cleanup.
> + * No explicit cleanup is needed here.

Drop such comments, they are not useful. Please write only useful
comments, not ones stating obvious.

> + */
> +static void cgbc_bl_remove(struct platform_device *pdev)
> +{
> +	dev_info(&pdev->dev, "CGBC backlight driver removed\n");

Drop, there is no such code in Linux kernel. Drop it.


> +}
> +
Best regards,
Krzysztof
