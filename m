Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A801B2E550
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 20:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C210410E7D8;
	Wed, 20 Aug 2025 18:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K9fvQlve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA35F10E7D8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 18:57:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 27F9C5C6AB2;
 Wed, 20 Aug 2025 18:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC9CC4CEE7;
 Wed, 20 Aug 2025 18:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755716223;
 bh=Sm2i3f1Ai5xvO93wNv5WISAxdQySXwq4uo3BepUxtxk=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=K9fvQlve8t/ZMqe7N1WklottI71bQxVIp0sm31LKMw1jQaYMTw2a7S35KKepwSQUz
 u6um9AKT3vQPJfXUpkIOQXA8jx56WD+0zIGMRlC89A7zJiv6JGArBR7pu+1WthGJaj
 l+7ErMokDHztw+BpIdRkWQJXRKKSU0Qu60oFxY3LsvcVZknLHXMNQQ89XRBLihUtjm
 ffDMPFAg2FCo763HWX83lLh18dAMAsFNihIQ958OvImvSc+1HT6UZ2ofGyk6S7LUyB
 OlsQckcs4k/4uzmT2UxlGUzEDZcJUSvgAKUT3ppmm8cJWKSABuRWC3SjpW3ak+9DRs
 sexWQiPie6OWw==
Date: Wed, 20 Aug 2025 13:57:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 jmassot@collabora.com, amergnat@baylibre.com, chunkuang.hu@kernel.org, 
 mchehab@kernel.org, conor+dt@kernel.org, support.opensource@diasemi.com, 
 maarten.lankhorst@linux.intel.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 airlied@gmail.com, davem@davemloft.net, mripard@kernel.org, 
 andrew+netdev@lunn.ch, krzk+dt@kernel.org, linus.walleij@linaro.org, 
 tiffany.lin@mediatek.com, linux-media@vger.kernel.org, 
 linux-input@vger.kernel.org, yunfei.dong@mediatek.com, kuba@kernel.org, 
 kyrie.wu@mediatek.corp-partner.google.com, sean.wang@kernel.org, 
 dri-devel@lists.freedesktop.org, edumazet@google.com, flora.fu@mediatek.com, 
 minghsiu.tsai@mediatek.com, dmitry.torokhov@gmail.com, jeesw@melfas.com, 
 linux-clk@vger.kernel.org, louisalexis.eyraud@collabora.com, 
 andrew-ct.chen@mediatek.com, p.zabel@pengutronix.de, 
 devicetree@vger.kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com, 
 broonie@kernel.org, linux-gpio@vger.kernel.org, pabeni@redhat.com, 
 lgirdwood@gmail.com, simona@ffwll.ch, linux-mediatek@lists.infradead.org, 
 houlong.wei@mediatek.com, linux-sound@vger.kernel.org, tzimmermann@suse.de
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
Message-Id: <175571287488.265851.15813545781419111729.robh@kernel.org>
Subject: Re: [PATCH v1 00/14] MediaTek dt-bindings sanitization (MT8173)
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


On Wed, 20 Aug 2025 14:12:48 -0300, Ariel D'Alessandro wrote:
> This patch series continues the effort to address Device Tree validation
> warnings for MediaTek platforms, with a focus on MT8173. It follows the initial
> cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177.html)
> 
> Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
> eliminates several of the remaining warnings by improving or converting DT
> bindings to YAML, adding missing properties, and updating device tree files
> accordingly.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> 
> Ariel D'Alessandro (14):
>   media: dt-bindings: Convert MediaTek mt8173-mdp bindings to YAML
>   media: dt-bindings: Convert MediaTek mt8173-vpu bindings to YAML
>   dt-bindings: arm: mediatek: mmsys: Add assigned-clocks/rates
>     properties
>   net: dt-bindings: Convert Marvell 8897/8997 bindings to YAML
>   sound: dt-bindings: Convert MediaTek RT5650 codecs bindings to YAML
>   dt-bindings: display: mediatek,od: Add mediatek,gce-client-reg
>     property
>   dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg
>     property
>   arm64: dts: mediatek: mt8173: Fix mt8173-pinctrl node names
>   dt-bindings: pinctrl: mediatek,mt65xx-pinctrl: Allow gpio-line-names
>   regulator: dt-bindings: Convert Dialog Semiconductor DA9211 Regulators
>     to YAML
>   arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
>   dt-bindings: soc: mediatek: pwrap: Add power-domains property
>   dt-bindings: input/touchscreen: Convert MELFAS MIP4 Touchscreen to
>     YAML
>   dt-bindings: media: mediatek,jpeg: Fix jpeg encoder/decoder ranges
> 
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml |   9 +
>  .../display/mediatek/mediatek,od.yaml         |  10 +
>  .../display/mediatek/mediatek,ufoe.yaml       |  11 +
>  .../input/touchscreen/melfas,mip4_ts.yaml     |  55 +++++
>  .../input/touchscreen/melfas_mip4.txt         |  20 --
>  .../bindings/media/mediatek,mt8173-mdp.yaml   | 174 +++++++++++++++
>  .../bindings/media/mediatek,mt8173-vpu.yaml   |  76 +++++++
>  .../media/mediatek,mt8195-jpegdec.yaml        |  31 +--
>  .../media/mediatek,mt8195-jpegenc.yaml        |  15 +-
>  .../bindings/media/mediatek-mdp.txt           |  95 --------
>  .../bindings/media/mediatek-vpu.txt           |  31 ---
>  .../bindings/net/marvell,sd8897-bt.yaml       |  91 ++++++++
>  .../bindings/net/marvell-bt-8xxx.txt          |  83 -------
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   2 +
>  .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
>  .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
>  .../bindings/soc/mediatek/mediatek,pwrap.yaml |  15 ++
>  .../sound/mediatek,mt8173-rt5650.yaml         |  73 +++++++
>  .../bindings/sound/mt8173-rt5650.txt          |  31 ---
>  .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   2 +-
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  31 ++-
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  14 +-
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  14 +-
>  23 files changed, 672 insertions(+), 520 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
>  create mode 100644 Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
>  delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt
> 
> --
> 2.50.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250820 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/mediatek/' for 20250820171302.324142-1-ariel.dalessandro@collabora.com:

arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: da9211@68 (dlg,da9211): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml#
arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): mmc1-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#





