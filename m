Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E00D9B3778
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 18:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D76A10E0BA;
	Mon, 28 Oct 2024 17:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CWAOt+iN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE5D10E0BA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 17:15:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 94C2C5C5848;
 Mon, 28 Oct 2024 17:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F54C4CEC3;
 Mon, 28 Oct 2024 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730135726;
 bh=SHA60aUVkHc5dOlticmp590SgsHwyopdCX3RsUQYjWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CWAOt+iNqV10UbkGMm36iAkjcva/IcPN2CiH5/NaihQtNCvt2RzbFu8Z3qJejfR/Q
 98AB7CAtGwicrznM29UzZtx5rnNHNFMdA+3xsHywrzFCo1yMoZfBcypBFW3cGCGzX3
 jp9BqiggK9yw/A9paQ0uxWnhV5vZwe+v/SIAYcfIrWWQ1Omrtgx7Fy/KjGRXcYky9S
 BaRi3qsuI14JxJiHm6H57dmVXxLmHwbfMfYlKBxnIbs+7CToaZIPAbEOJGmMRXegVS
 AVuGchll3ZzAwXShS1RXO8r0Ur5pK71nmjuv57v+czwzRxMO6s+DsZVO46wUB0mf/0
 atZrkOYxqzCsw==
Date: Mon, 28 Oct 2024 12:15:24 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 0/5] dt-bindings: mfd: convert zii,rave-sp.txt and
 child txt to yaml format
Message-ID: <20241028171524.GA888974-robh@kernel.org>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
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

On Thu, Oct 10, 2024 at 11:42:37AM -0400, Frank Li wrote:
> Fixed below warnings:
> 
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu: failed to match any schema with compatible: ['zii,rave-sp-rdu2']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/watchdog: failed to match any schema with compatible: ['zii,rave-sp-watchdog']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/backlight: failed to match any schema with compatible: ['zii,rave-sp-backlight']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/pwrbutton: failed to match any schema with compatible: ['zii,rave-sp-pwrbutton']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a3: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-zest.dtb: /soc@0/bus@30800000/serial@30890000/mcu/eeprom@a4: failed to match any schema with compatible: ['zii,rave-sp-eeprom']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - change all maintainer to frank li.
> - Link to v1: https://lore.kernel.org/r/20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com
> 
> ---
> Frank Li (5):
>       dt-bindings: input: convert zii,rave-sp-pwrbutton.txt to yaml
>       dt-bindings: backlight: convert zii,rave-sp-backlight.txt to yaml
>       dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format
>       dt-bindings: watchdog: convert zii,rave-sp-wdt.txt to yaml format
>       dt-bindings: mfd: convert zii,rave-sp.txt to yaml format

Applied 1 and 4 since they still haven't been picked up and linux-next 
is warning due to the whole series not being applied. Once again, these 
MFD bindings need to go in via 1 tree.

Rob
