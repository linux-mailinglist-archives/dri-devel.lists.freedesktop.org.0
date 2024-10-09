Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B72996F22
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 533E810E763;
	Wed,  9 Oct 2024 15:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oOM32IBO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AB910E763
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:02:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C92405C590C;
 Wed,  9 Oct 2024 15:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F2AC4CEC3;
 Wed,  9 Oct 2024 15:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728486150;
 bh=YijPQnFRilQWRtLvvdo5y8s95IoL47EEoI6aPDUbRg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oOM32IBOekQCh583Xv7JBTXXjGSGt2wiWSi5G5Vm0PCPDbsJolFYePCS0OVH04/Ni
 ftaxp2RWcWQ/fUzPu5bG2JHkteD4AmFOv07W9KmW5z2aUcWgZKqKvlYJcDXMlrCOsH
 hgc7i291Q3Eev3H2ywjGqVu2JrFRHOsyggEqwp3rOu7LQ69CRg5AZvGHam08EGbbHM
 UTtOVbLFRE0ZQF0XRYj6XsgW1q+5a+7+duAyfl6UjcCUqa87iUc8xGXEVZ8oaDUHT9
 1AdY46RGoiD4S08D4n6SA6O8LCxnjkSc/Af91uZuqzwPJmeFl+i3c9LT6Pj7LCn/sj
 jdwilatPoP4WQ==
Date: Wed, 9 Oct 2024 10:02:28 -0500
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
Subject: Re: [PATCH 0/5] dt-bindings: mfd: convert zii,rave-sp.txt and child
 txt to yaml format
Message-ID: <20241009150228.GB465237-robh@kernel.org>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
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

On Tue, Oct 08, 2024 at 06:00:56PM -0400, Frank Li wrote:
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
> Frank Li (5):
>       dt-bindings: input: convert zii,rave-sp-pwrbutton.txt to yaml
>       dt-bindings: backlight: convert zii,rave-sp-backlight.txt to yaml
>       dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml format
>       dt-bindings: watchdog: convert zii,rave-sp-wdt.txt to yaml format
>       dt-bindings: mfd: convert zii,rave-sp.txt to yaml format

All looks fine except for the maintainers.

Rob
