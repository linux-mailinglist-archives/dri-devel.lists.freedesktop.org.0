Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A6DC4738E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 15:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FBA10E3EB;
	Mon, 10 Nov 2025 14:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bVK12m3s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B0F10E3E7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 14:34:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7897C601BD;
 Mon, 10 Nov 2025 14:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140EDC19424;
 Mon, 10 Nov 2025 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762785271;
 bh=j2fpe8eJvApgn7cYpHzNxA3KOm/6F5GzlUkdK+ztIrg=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=bVK12m3sOJGDFFJAv7gcPUux0ZlsYHoz8PnH2HKGIBWWMecav0QArZACBn4ru6Zi7
 81FXrM/RxNg5UaJP+58ouJd/IAe9bT0UdbIrt3BGw+wvsuqGauYu/MdJv499XO1ymW
 OvlJ8WNaHJ5+nM5qMJlQC1T9p0sSju+KfQt+BZ797sGrupVW+xNeFqZJ11hNggGazj
 0EwZu3VofGPuIndZRHNGCaoH8uAwfS1rASsSCSnLIZbQVwd+DH6aiya+kryDtOBFFG
 hqHwEn55hpzNouM515HEJISFkEIZh5gILJl7r4NHoQANUD0kwSqasEu/KjQNYV/DfZ
 oeduGCVhBNhUg==
Date: Mon, 10 Nov 2025 08:34:30 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, Shawn Guo <shawnguo@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Josua Mayer <josua@solid-run.com>
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
Message-Id: <176278493126.154536.17870405687578843628.robh@kernel.org>
Subject: Re: [PATCH v2 00/11] arm64: dts: add description for solidrun
 imx8mp hummingboard-iiot
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


On Fri, 07 Nov 2025 12:46:07 +0100, Josua Mayer wrote:
> This patchset mainl adds description for 3 SolidRun boards:
> - i.MX8MP Hummingboard IIoT
> - SolidSense N8 Compact
> - i.MX8MM Hummingboard Ripple
> 
> This includes dt bindings and a range of bug-fixes:
> 
> - dt bindings for the boards
> - fix to dsi panel bindings referncing panel-common and adding port
>   property
> - cosmetic fix to some  solidrun imx8mp boards for regulator gpio
>    polarity
> - fix dsi hdmi bridge on hummingboard pulse
> - compile dtbs with symbols to support overlays
> - gpiod_set_value _can_sleep conversion for panel and touchscreen
>    drivers
> 
> Open Questions:
> 
> - How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
>   (affects imx8mm-hummingboard-ripple.dts)
> - Is "description for" implied not only on dt-bindings patches, but also
>   dts? E.g. is this commit subject acceptable?:
>   "arm64: dts: add solidrun solidsense-n8 board"
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
> Changes in v2:
> - fix spelling mistakes in commit descriptions.
> - remove redundant "binding for" from subject:
>   https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
>   (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
> - remove one useless comment from imx8mm-sr-som.dtsi to fix long line
>   warning.
> - change ronbo panel binding to inherit panel-common and switch
>   additionalProperties to unevaluatedProperties.
>   (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
> - add dt binding for winstar lvds panel
> - fix dtbs_check for dsi & lvds panel addons
> - change n8 board dts comment-style in header
> - collected ack on solidrun boards bindings patch (patch 1 in the series)
>   (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
> - added standard led label property to hb-iiot multi-purpose leds
>   ensuring consistent names in case lp5562 driver starts using it.
> - Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com
> 
> ---
> Josua Mayer (11):
>       dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
>       dt-bindings: display: panel: ronbo,rb070d30: panel-common ref
>       dt-bindings: panel: lvds: add Winstar WF70A8SYJHLNGA
>       Input: ilitek_ts_i2c: fix warning with gpio controllers that sleep
>       drm/panel: ronbo-rb070d30: fix warning with gpio controllers that sleep
>       arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
>       arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
>       arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
>       arm64: dts: add description for solidrun imx8mp hummingboard-iiot
>       arm64: dts: add description for solidrun solidsense-n8 board
>       arm64: dts: add description for solidrun i.mx8mm som and evb
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
>  .../bindings/display/panel/panel-lvds.yaml         |   2 +
>  .../bindings/display/panel/ronbo,rb070d30.yaml     |  14 +-
>  arch/arm64/boot/dts/freescale/Makefile             |  15 +
>  .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
>  arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 395 ++++++++++
>  .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 853 +++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
>  ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
>  ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
>  .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
>  .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
>  .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 712 +++++++++++++++++
>  .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
>  .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       |   8 +-
>  drivers/input/touchscreen/ilitek_ts_i2c.c          |   4 +-
>  17 files changed, 2548 insertions(+), 24 deletions(-)
> ---
> base-commit: 607bcb1e539a7f2b2ba6832ba96fe3ad73b7401c
> change-id: 20251026-imx8mp-hb-iiot-525b03beea62
> 
> Best regards,
> --
> Josua Mayer <josua@solid-run.com>
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


This patch series was applied (using b4) to base:
 Base: base-commit 607bcb1e539a7f2b2ba6832ba96fe3ad73b7401c not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/v6.18-rc1 (exact match)
 Base: tags/v6.18-rc1 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com:

arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dtb: accelerometer@53 (adi,adxl345): 'interrupt-names' is a dependency of 'interrupts-extended'
	from schema $id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml





