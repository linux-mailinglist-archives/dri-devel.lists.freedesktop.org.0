Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9265757E042
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 12:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550122BB5B;
	Fri, 22 Jul 2022 10:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1702B800
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 10:52:15 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 952C666019E6;
 Fri, 22 Jul 2022 11:52:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658487133;
 bh=kFAslBVlJoHgLrrvN1O6EZ92+ayKqlc5D4IWhxvPP/w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WcnTj5IviG5rcDShXoXbR39JBDKe32ASqqEublwMzD8DVgN9+r6S6uf2npaIFcNH4
 WjvMZqkbbd40dKBXkgbB9jRvCMdkGHIMVbtHfgu8BRGzOU14d+T2glgMzL/r2P8wkQ
 0vTjhWbE3eEkhnE90VVncPLSkCXqB+ywlQqr2sgWJ8nAQsYGdOCbG8ySUhqsUAXV+6
 RI2uxlQHyM57Eq7pli9zouTJLACaSnvNGdrSkqMQtMp9c/f4qsQPTxmXq2i7GBG5wS
 Mwc3owXreYH/NKGFFbQ4MH1FgCHjcaN6IXOuE3Fp7Qca8h0kNivWCRWu9OzP27pCkc
 M7ra8kxkL7b3A==
Message-ID: <c1c0913d-d711-d415-a84e-25427ed750c9@collabora.com>
Date: Fri, 22 Jul 2022 12:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 11/13] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-12-peterwu.pub@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220722102407.2205-12-peterwu.pub@gmail.com>
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

Il 22/07/22 12:24, ChiaEn Wu ha scritto:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> In MediaTek MT6370, there are four channel current-sink RGB LEDs that
> support hardware pattern for constant current, PWM, and breath mode.
> Isink4 channel can also be used as a CHG_VIN power good indicator.
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
> v6
> - Remove the 'ko' from mt6370 led Kconfig description.
> - Add both authors for Alice and ChiYuan.
> - Use pdata to distinguish the code from mt6370/71 to mt6372.
> - Instead of 'state' define, use the 'state' enum.
> - Fix the typo for 'MT6372_PMW_DUTY'.
> - For pwm_duty define, replace with bit macro - 1.
> - Refine all the labels from 'out' to 'out_unlock'.
> - Use struct 'dev' variable and 'dev_err_probe' to optimize the LOC.
> - Revise for the array initialization from {0} to {}.
> - Move into rgb folder and rename file name to 'leds-mt6370-rgb'.
> - Refine the 'comma' usage in struct/enum.
> ---
>   drivers/leds/rgb/Kconfig           |   13 +
>   drivers/leds/rgb/Makefile          |    1 +
>   drivers/leds/rgb/leds-mt6370-rgb.c | 1004 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 1018 insertions(+)
>   create mode 100644 drivers/leds/rgb/leds-mt6370-rgb.c
> 
