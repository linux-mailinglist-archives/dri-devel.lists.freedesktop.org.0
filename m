Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A97FE576EB5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6546E10F1F4;
	Sat, 16 Jul 2022 14:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1477810E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:05:33 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 820746601A60;
 Fri, 15 Jul 2022 13:38:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657888730;
 bh=/TkDguAmwrQGEReJEUwEbAbHZt9Am5gC3Cijy8SnuRk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VoDxu0JROMcD2NU4mSc6KU2oGQ7nEERAimPhTXO1VD8zFmQrbHNDwrMwNlUWql2ae
 Zuvmkm0S3xwbgzI0zpP/kz9v3yoK04k3QoNZnwBwykuKhQHbqzG51CGtKCFA96Q6hi
 SeMAcSwP8M3CnBQZ7d6ejvM7cYBoV2bb/L1QWCeHDzIDpF5HfiphDmwnkVigH/QEC8
 cacBNFGX1b0Sx2GeWa+fRrekL7Ugtuq2wO6cDNApOe8OIX/YGGcz0ksVK6jkZ1EswM
 /7iGpFbZ+/xKc21HN8XGBZCqDFsk5RLnoa5rUbp9NV/sxPAYXZ8QaDApGSE/izbOhf
 dhsY8N99yXETA==
Message-ID: <ec3bdfb8-0e42-a772-28b1-165811872afa@collabora.com>
Date: Fri, 15 Jul 2022 14:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-14-peterwu.pub@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715112607.591-14-peterwu.pub@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, alice_chen@richtek.com, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/07/22 13:26, ChiaEn Wu ha scritto:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
> 
> This adds support for MediaTek MT6370 Backlight driver. It's commonly used
> to drive the display WLED. There are 4 channels inside, and each channel
> supports up to 30mA of current capability with 2048 current steps in
> exponential or linear mapping curves.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Hello ChiaEn,

I propose to move this one to drivers/leds (or drivers/pwm) and, instead of
registering a backlight device, register a PWM device.

This way you will be able to reuse the generic backlight-pwm driver, as you'd
be feeding the PWM device exposed by this driver to the generic one: this will
most importantly make it easy to chain it with MTK_DISP_PWM (mtk-pwm-disp)
with a devicetree that looks like...

	pwmleds-disp {

		compatible = "pwm-leds";



		disp_led: disp-pwm {

			label = "backlight-pwm";

			pwms = <&pwm0 0 500000>;

			max-brightness = <1024>;

		};

	};



	backlight_lcd0: backlight {

		compatible = "led-backlight";

		leds = <&disp_led>, <&pmic_bl_led>;



		default-brightness-level = <300>;

	};

Regards,
Angelo


