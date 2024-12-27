Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0769FD167
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 08:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D9F10E0CC;
	Fri, 27 Dec 2024 07:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aTuE13RY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169A610E0CC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 07:38:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EA3A25C01AB;
 Fri, 27 Dec 2024 07:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6D2C4CED3;
 Fri, 27 Dec 2024 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735285136;
 bh=Wf+SvqNi6slsfwtp9CR+b3C0cjM1BKcBVm093pQ2syc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aTuE13RYXpFbp4ATHOcud1qoWz6gazgLh6G7+g6K+m+MYZPlTmlVRioMn0km9mkEE
 nnTTjnBXZJevN4SHX8nPschH5OjNfKocnRCSFM9T8KfGnWGkIXoZljNeczyVXhfrx1
 4BNhx+ANKF+gAznsdRteWmHrJJHiGVK6UDkVMsbK3RCzUiOLDiC6akwNed3GJjIbe/
 0ik79J2Z8Ye9WlYsQNJfZ0hF9PF84uZjnNMtpTuI4RgbKUM0h6TZ6SgiULSqNfU7tX
 IS5ZupcP/HvUDTuTG6HDZbZoFJSnMfh91qi+HIUmZhi6NOdjhwR245l5M6wLVCG3nM
 iZrIdyQYy8NzQ==
Date: Fri, 27 Dec 2024 08:38:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
 Simon Xue <xxm@rock-chips.com>, Guenter Roeck <linux@roeck-us.net>, 
 Mark Brown <broonie@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Frank Wang <frank.wang@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, 
 Johan Jonker <jbx6244@gmail.com>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-i2c@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, 
 Simona Vetter <simona@ffwll.ch>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Conor Dooley <conor+dt@kernel.org>, Finley Xiao <finley.xiao@rock-chips.com>, 
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
 FUKAUMI Naoki <naoki@radxa.com>, linux-pwm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andyshrk@163.com>,
 linux-serial@vger.kernel.org, 
 Michael Riesch <michael.riesch@wolfvision.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 devicetree@vger.kernel.org, 
 Diederik de Haas <didi.debian@cknow.org>, linux-watchdog@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Shresth Prasad <shresthprasad7@gmail.com>, 
 Tim Lunn <tim@feathertop.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Dragan Simic <dsimic@manjaro.org>,
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH v2 00/17] rockchip: Add rk3562 support
Message-ID: <sasnc2ocxnlfp4kprsobu5gkajjb5wdxhld73bg6xocgb3foah@yjmphtvpmyff>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>
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

On Tue, Dec 24, 2024 at 05:49:03PM +0800, Kever Yang wrote:
> 
> This patch set adds rk3562 SoC and its evb support.
> 
> Split out patches belong to different subsystem.
> 
> Test with GMAC, USB, PCIe, EMMC, SD Card.
> 
> This patch set is base on the patche set for rk3576 evb1 support.
> 
> Changes in v2:
> - Update in sort order
> - remove grf in cru
> - Update some properties order
> 
> Finley Xiao (2):
>   arm64: dts: rockchip: add core dtsi for RK3562 Soc
>   arm64: dts: rockchip: Add RK3562 evb2 devicetree
> 
> Kever Yang (15):
>   dt-bindings: PCI: dwc: rockchip: Add rk3562 support
>   dt-bindings: mmc: Add support for rk3562 eMMC
>   dt-bindings: mmc: rockchip-dw-mshc: Add rk3562 compatible string
>   dt-bindings: power: rockchip: Add bindings for rk3562
>   dt-bindings: i2c: i2c-rk3x: Add rk3562 compatible
>   dt-bindings: gpu: Add rockchip,rk3562-mali compatible
>   dt-bindings: watchdog: Add rk3562 compatible
>   dt-bindings: spi: Add rockchip,rk3562-spi compatible
>   dt-bindings: serial: snps-dw-apb-uart: Add support for rk3562
>   dt-bindings: usb: dwc3: add compatible for rk3562
>   dt-bindings: pwm: rockchip: Add rockchip,rk3562-pwm
>   dt-bindings: rockchip: pmu: Add rk3562 compatible
>   dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
>   dt-bindings: arm: rockchip: Add rk3562 evb2 board
>   dt-bindings: mfd: syscon: Add rk3562 QoS register compatible

You squezzed here like 12 different subsystems. Some of these changes
suggest missing drivers.

Please read basic upstreaming guide, some previous discussions and get
internal rock-chips help so we want repeat basics over and over.

Bindings are with drivers. Send them to respective subsystems.

Best regards,
Krzysztof

