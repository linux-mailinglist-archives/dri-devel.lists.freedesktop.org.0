Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F196BE9C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 15:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EF410E7CB;
	Wed,  4 Sep 2024 13:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WEj9Cl/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710A510E7CB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 13:36:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19AE05C57A0;
 Wed,  4 Sep 2024 13:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08DDAC4CEC2;
 Wed,  4 Sep 2024 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725456999;
 bh=yWmSynJzCxsvtgTjdin14bAF7/jddkPj62l5cvjrxu0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=WEj9Cl/SyM83a95tlioUDl2cVmArNGdR5UZ2oQ9K60mYHEz0WlKMhLKKFT7Xk6yWk
 E9Euatn2lv3fwKCzTFiYrOxKXzBZi0vKdJfcd3aH/tJusROewJN+1aqKfpf2dKis2Y
 TiLOIfCwOzX/adLABFvMJuP9l+vPdk2q6n98hmOoU/H5mPQnwWHa/10Ztcd4gIU3gS
 ZkZixV4Zc6z/xSvIzF+DrUBBCmmPpQdyPXVGAk2p++Vvn7P9tfWzyk7wQidXIfDdIX
 npspIQXdcydyqPLnkEiwvlC/9kABHbSP42N7AyyLk2cHHD01pyXmrAOASxVSKorvaf
 HoccRy+Pz1VcQ==
Date: Wed, 04 Sep 2024 08:36:38 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Michael Riesch <michael.riesch@wolfvision.net>, 
 linux-spi@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-kernel@vger.kernel.org, Ondrej Jirman <megi@xff.cz>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Elon Zhang <zhangzj@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Tim Lunn <tim@feathertop.org>, 
 linux-i2c@vger.kernel.org, Muhammed Efe Cetin <efectn@protonmail.com>, 
 Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org, 
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>, 
 Mark Brown <broonie@kernel.org>, linux-serial@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Andy Yan <andyshrk@163.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 kernel@collabora.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jimmy Hon <honyuenkwun@gmail.com>, Jagan Teki <jagan@edgeble.ai>, 
 linux-rockchip@lists.infradead.org, Chris Morgan <macromorgan@hotmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>, 
 Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>
In-Reply-To: <20240903152308.13565-1-detlev.casanova@collabora.com>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
Message-Id: <172545685596.2410388.14109659052925686003.robh@kernel.org>
Subject: Re: [PATCH v4 0/9] Add device tree for ArmSoM Sige 5 board
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


On Tue, 03 Sep 2024 11:22:30 -0400, Detlev Casanova wrote:
> Add the rk3576-armsom-sige5 device tree as well as its rk3576.dtsi base
> and pinctrl information in rk3576-pinctrl.dtsi.
> 
> The other commits add DT bindings documentation for the devices that
> already work with the current corresponding drivers.
> 
> Note that as is, the rockchip gpio driver needs the gpio nodes
> to be children of the pinctrl node, even though this is deprecated.
> 
> When the driver supports it, they can be moved out of the pinctrl node.
> 
> The power-domain@RK3576_PD_USB is a child of power-domain@RK3576_PD_VOP.
> That looks strange but it is how the hardware is, and confirmed by
> Rockchip: The NOC bus of USB passes through the PD of VOP, so it relies on
> VOP PD.
> 
> The other bindings have been applied on next.
> 
> Changes since v3:
> - Dropped mmc dt-bindings (submitted in [2])
> - Dropped syscon dt-bindings (applied in [3])
> - Fix gpu interrupt names mapping
> - (Fix email headers overwriting)
> 
> Changes since v2:
> - Fix LEDs in armsom dts
> - mmc: Move allOf after the required block
> - Remove saradc dt-binding commit (already applied)
> - Remove opp-microvolt-L* fields
> - Reword mali commit message
> - Use rgmii-id and remove delays on gmac nodes
> 
> Changes since v1:
> - Add eMMC support
> - Add gpu node
> - Add rtc node
> - Add spi compatible dt-bindings
> - Add watchdog support
> - Dropped timer compatible commit (applied in [0])
> - Move ethernet aliases to board dt
> - Move mmio nodes to soc node
> - Removed cru grf phandle
> - Removed gpio aliases
> - Removed grf compatibles (applied in [1])
> - Removed pinctrl php-grf phandle
> - Removed v2-tuning for sdcard
> - Renamed clock nodes
> - Renamed regulators do match regulator-vcc-<voltage>-<name>
> - Renamed the rkvdec_sram node to vdec_sram to match prior generations
> - Reorder fields consistently in nodes
> - Use correct #power-domain-cells values
> 
> [0]: https://lore.kernel.org/all/918bb9e4-02d9-4dca-bed2-28bb123bdc10@linaro.org/
> [1]: https://lore.kernel.org/all/172441646605.877570.8075942261050000.b4-ty@sntech.de/
> [2]: https://lore.kernel.org/all/20240903145615.9302-1-detlev.casanova@collabora.com/
> [3]: https://lore.kernel.org/all/172500660860.97285.13837050366813522297.b4-ty@kernel.org/
> 
> Detlev.
> 
> Detlev Casanova (9):
>   dt-bindings: arm: rockchip: Add ArmSoM Sige 5
>   dt-bindings: arm: rockchip: Add rk3576 compatible string to pmu.yaml
>   dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
>   dt-bindings: serial: snps-dw-apb-uart: Add Rockchip RK3576
>   dt-bindings: gpu: Add rockchip,rk3576-mali compatible
>   dt-bindings: watchdog: Add rockchip,rk3576-wdt compatible
>   spi: dt-bindings: Add rockchip,rk3576-spi compatible
>   arm64: dts: rockchip: Add rk3576 SoC base DT
>   arm64: dts: rockchip: Add rk3576-armsom-sige5 board
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |    5 +
>  .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
>  .../bindings/gpu/arm,mali-bifrost.yaml        |    1 +
>  .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
>  .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
>  .../devicetree/bindings/spi/spi-rockchip.yaml |    1 +
>  .../bindings/watchdog/snps,dw-wdt.yaml        |    1 +
>  arch/arm64/boot/dts/rockchip/Makefile         |    1 +
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts |  659 ++
>  .../boot/dts/rockchip/rk3576-pinctrl.dtsi     | 5775 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 1644 +++++
>  11 files changed, 8091 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576.dtsi
> 
> --
> 2.46.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y rockchip/rk3576-armsom-sige5.dtb' for 20240903152308.13565-1-detlev.casanova@collabora.com:

arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: clock-controller@27200000: 'rockchip,grf' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/rockchip,rk3576-cru.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: gpu@27800000: interrupt-names:0: 'job' was expected
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: gpu@27800000: interrupt-names:2: 'gpu' was expected
	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a310000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
	'rockchip,rk2928-dw-mshc' was expected
	'rockchip,rk3288-dw-mshc' was expected
	'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a310000: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a330000: compatible:0: 'rockchip,rk3576-dwcmshc' is not one of ['rockchip,rk3568-dwcmshc', 'rockchip,rk3588-dwcmshc', 'snps,dwcmshc-sdhci', 'sophgo,cv1800b-dwcmshc', 'sophgo,sg2002-dwcmshc', 'sophgo,sg2042-dwcmshc', 'thead,th1520-dwcmshc']
	from schema $id: http://devicetree.org/schemas/mmc/snps,dwcmshc-sdhci.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a330000: compatible: ['rockchip,rk3576-dwcmshc', 'rockchip,rk3588-dwcmshc'] is too long
	from schema $id: http://devicetree.org/schemas/mmc/snps,dwcmshc-sdhci.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a330000: Unevaluated properties are not allowed ('compatible', 'power-domains' were unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/snps,dwcmshc-sdhci.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/mmc@2a330000: failed to match any schema with compatible: ['rockchip,rk3576-dwcmshc', 'rockchip,rk3588-dwcmshc']
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: rtc@51: Unevaluated properties are not allowed ('clock-frequency' was unexpected)
	from schema $id: http://devicetree.org/schemas/rtc/haoyu,hym8563.yaml#





