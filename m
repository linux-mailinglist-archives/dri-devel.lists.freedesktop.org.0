Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07EFB103C3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2010B10E8C6;
	Thu, 24 Jul 2025 08:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SFfgW1X8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0129C10E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1753346365;
 bh=4NBMeskJJYDnenHlSqSeWLJKYF+YSmg93IfAieUBW9w=;
 h=From:To:Cc:Subject:Date:From;
 b=SFfgW1X8GoYI4sLbMqsbPp0GVsh2Cpeh5In9VC6Zz3n05nZQDpl6q6RkZlvlfyq64
 NdLQadh6AdBs0l+SzJZIr5lnSg5ndZjvvPA3eAheT+9xiSWOuxTYvphf4jpzQJpfwv
 SVNm6JaH5Xn+0PRwm/w3sGIrNgy7R/LDuBsE/WPf+vfYprQuEhjvP30VnFa3bTrXmW
 gyB30ejOXqbTeR4IIjC7vY4L5DzCNjWyUI41+lY3MnyBTIcJYHy00hNx3A2QAPOV/W
 +mGT71Oa1FEHEbaDpdvGDbR+iHqM/ezow8Mj56sUt84sQepXREM13OFjolgFO0tYym
 oa6SoAoo78OUw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0509D17E0FC2;
 Thu, 24 Jul 2025 10:39:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de, atenart@kernel.org,
 jitao.shi@mediatek.com, ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: [PATCH 00/38] MediaTek devicetree/bindings warnings sanitization
Date: Thu, 24 Jul 2025 10:38:36 +0200
Message-ID: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

As Rob pointed out, MediaTek devicetrees are *poor* in the dtbs_check
tests, and got an infinite load of warnings.

This series starts attacking this situation.

I didn't really count how many warnings I have resolved - it's a lot
of them anyway - and I think that this is a good start in any case.

More will come, but I'll be on a long holiday soon, so not from me
(or anyway not before I come back anyway), but most probably from
someone else (in August...!).

Cheers!
Angelo

AngeloGioacchino Del Regno (38):
  dt-bindings: display: mediatek: dpi: Allow specifying resets
  dt-bindings: display: mediatek,dp: Allow DisplayPort AUX bus
  dt-bindings: mailbox: mediatek,gce-mailbox: Make clock-names optional
  ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
  dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
  dt-bindings: timer: mediatek: Add compatible for MT6795 GP Timer
  dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing pwm_ch7_2
  dt-bindings: pinctrl: mediatek,mt7622-pinctrl: Add missing base reg
  dt-bindings: pinctrl: mt6779: Allow common MediaTek pinctrl node names
  dt-bindings: regulator: mediatek,mt6332-regulator: Add missing
    compatible
  dt-bindings: regulator: mediatek,mt6331: Fix various regulator names
  dt-bindings: regulator: mediatek,mt6331: Add missing compatible
  dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO from MT8188 dual
  dt-bindings: media: mediatek,mt8195-jpeg: Allow range number in node
    address
  dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195
  arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node
    names
  arm64: dts: mediatek: mt6797: Fix pinctrl node names
  arm64: dts: mediatek: mt6797: Remove bogus id property in i2c nodes
  arm64: dts: mediatek: mt6795: Add mediatek,infracfg to iommu node
  arm64: dts: mediatek: mt6795-xperia-m5: Fix mmc0 latch-ck value
  arm64: dts: mediatek: mt6795-sony-xperia-m5: Add pinctrl for mmc1/mmc2
  arm64: dts: mediatek: Fix node name for SYSIRQ controller on all SoCs
  arm64: dts: mediatek: mt7986a: Fix PCI-Express T-PHY node address
  arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C node names
  arm64: dts: mediatek: mt7986a-bpi-r3: Set interrupt-parent to mdio
    switch
  arm64: dts: mediatek: acelink-ew-7886cax: Remove unnecessary cells in
    spi-nand
  arm64: dts: mediatek: mt7988a: Fix PCI-Express T-PHY node address
  arm64: dts: mediatek: mt8173: Fix pinctrl node names and cleanup
  arm64: dts: mediatek: mt8183: Fix pinctrl node names
  arm64: dts: mediatek: pumpkin-common: Fix pinctrl node names
  arm64: dts: mediatek: mt8183-pumpkin: Add power supply for CCI
  arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
  arm64: dts: mediatek: mt8183-kukui: Move DSI panel node to machine
    dtsis
  arm64: dts: mediatek: mt8195: Fix ranges for jpeg enc/decoder nodes
  arm64: dts: mediatek: mt8195-cherry: Move VBAT-supply to Tomato R1/R2
  arm64: dts: mediatek: mt8195-cherry: Add missing regulators to rt5682
  arm64: dts: mediatek: mt8395-kontron-i1200: Fix MT6360 regulator nodes
  arm64: dts: mediatek: mt8516-pumpkin: Fix machine compatible

 .../crypto/inside-secure,safexcel.yaml        |   2 +
 .../display/mediatek/mediatek,dp.yaml         |   3 +
 .../display/mediatek/mediatek,dpi.yaml        |   7 +
 .../mailbox/mediatek,gce-mailbox.yaml         |  11 -
 .../media/mediatek,mt8195-jpegdec.yaml        |   2 +-
 .../media/mediatek,mt8195-jpegenc.yaml        |   2 +-
 .../bindings/phy/mediatek,hdmi-phy.yaml       |  25 +-
 .../pinctrl/mediatek,mt6779-pinctrl.yaml      |   4 +-
 .../pinctrl/mediatek,mt7622-pinctrl.yaml      |   5 +-
 .../regulator/mediatek,mt6331-regulator.yaml  |  19 +-
 .../regulator/mediatek,mt6332-regulator.yaml  |   7 +
 .../bindings/remoteproc/mtk,scp.yaml          |  23 +-
 .../bindings/sound/mt8192-afe-pcm.yaml        | 106 +++++++-
 .../bindings/timer/mediatek,timer.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt6331.dtsi      |  10 +-
 arch/arm64/boot/dts/mediatek/mt6755.dtsi      |   2 +-
 arch/arm64/boot/dts/mediatek/mt6779.dtsi      |   2 +-
 .../dts/mediatek/mt6795-sony-xperia-m5.dts    |  40 ++-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi      |   3 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi      |  52 ++--
 .../mediatek/mt7986a-acelink-ew-7886cax.dts   |   2 -
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  |  11 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  12 +-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     |  28 +-
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  34 ++-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 138 +++++-----
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  60 +++--
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  28 +-
 .../mediatek/mt8183-kukui-audio-da7219.dtsi   |   4 +-
 .../mediatek/mt8183-kukui-audio-ts3a227e.dtsi |   2 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  27 +-
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  43 +++-
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  40 ++-
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  40 ++-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 101 +++-----
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |  12 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 239 +++++++++++++++++-
 .../dts/mediatek/mt8195-cherry-tomato-r1.dts  |   1 +
 .../dts/mediatek/mt8195-cherry-tomato-r2.dts  |   1 +
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |   3 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  30 ++-
 .../mediatek/mt8395-kontron-3-5-sbc-i1200.dts |  16 +-
 .../boot/dts/mediatek/mt8516-pumpkin.dts      |   2 +-
 .../boot/dts/mediatek/pumpkin-common.dtsi     |  18 +-
 44 files changed, 843 insertions(+), 375 deletions(-)

-- 
2.50.1

