Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A53B2E317
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A2C10E042;
	Wed, 20 Aug 2025 17:14:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="iXdiIBjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE5D10E042
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755710040; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Tim5F0HvYU373WHcbS+AW8itdXClm69OGGAsV1A46kh652ncp3eSt6GC0leBhqQH405N+NPRTuGFjKQEUvPvcrXmcjPYge5C/9fszUGPrpZ5XGJoWwPlyg6Izx+fS2Si8WlHPNLOTPyqgUchpe4WQwKCX0+b+lLw//3TM164iRw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755710040;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=DaMNOnKm2AnfZhbaigAUu68c7YdBR4a87CV7XaTyqjQ=; 
 b=NO+n+dEsIpuIEW/n/h9GYA9kEKtT860Sym3jjxLtnbWPN+LQVmltK9yAjn4BT/NP9BeIqZ29j6cMMWzQ8cVuRxHQsn+gkG6m06E2i3FvJET1GwFmdYbpD/1QAJ/EvgPsXeR8DaWuwm6GggX8aaDWOJ1UsDCWYze9LFtBPVar8h4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710040; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=DaMNOnKm2AnfZhbaigAUu68c7YdBR4a87CV7XaTyqjQ=;
 b=iXdiIBjcdK3P7kvXuElLIVC112o9r1eEOb6UZAwC74zp+49vHMbc2ihpozoDyC7T
 X+KKEt/amBhjUN4d6/KrsnmQM8X6JXL/Fxoc1teeoq21qpT+5zcDfZ1qpXkTHyX+0Oa
 tsnKB3Yni2Qt7wENZUUvI7IQ/xdgh6kf7HnAjcUQ=
Received: by mx.zohomail.com with SMTPS id 1755710039628806.7841478498982;
 Wed, 20 Aug 2025 10:13:59 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v1 00/14] MediaTek dt-bindings sanitization (MT8173)
Date: Wed, 20 Aug 2025 14:12:48 -0300
Message-ID: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This patch series continues the effort to address Device Tree validation
warnings for MediaTek platforms, with a focus on MT8173. It follows the initial
cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177.html)

Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
eliminates several of the remaining warnings by improving or converting DT
bindings to YAML, adding missing properties, and updating device tree files
accordingly.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Ariel D'Alessandro (14):
  media: dt-bindings: Convert MediaTek mt8173-mdp bindings to YAML
  media: dt-bindings: Convert MediaTek mt8173-vpu bindings to YAML
  dt-bindings: arm: mediatek: mmsys: Add assigned-clocks/rates
    properties
  net: dt-bindings: Convert Marvell 8897/8997 bindings to YAML
  sound: dt-bindings: Convert MediaTek RT5650 codecs bindings to YAML
  dt-bindings: display: mediatek,od: Add mediatek,gce-client-reg
    property
  dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg
    property
  arm64: dts: mediatek: mt8173: Fix mt8173-pinctrl node names
  dt-bindings: pinctrl: mediatek,mt65xx-pinctrl: Allow gpio-line-names
  regulator: dt-bindings: Convert Dialog Semiconductor DA9211 Regulators
    to YAML
  arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
  dt-bindings: soc: mediatek: pwrap: Add power-domains property
  dt-bindings: input/touchscreen: Convert MELFAS MIP4 Touchscreen to
    YAML
  dt-bindings: media: mediatek,jpeg: Fix jpeg encoder/decoder ranges

 .../bindings/arm/mediatek/mediatek,mmsys.yaml |   9 +
 .../display/mediatek/mediatek,od.yaml         |  10 +
 .../display/mediatek/mediatek,ufoe.yaml       |  11 +
 .../input/touchscreen/melfas,mip4_ts.yaml     |  55 +++++
 .../input/touchscreen/melfas_mip4.txt         |  20 --
 .../bindings/media/mediatek,mt8173-mdp.yaml   | 174 +++++++++++++++
 .../bindings/media/mediatek,mt8173-vpu.yaml   |  76 +++++++
 .../media/mediatek,mt8195-jpegdec.yaml        |  31 +--
 .../media/mediatek,mt8195-jpegenc.yaml        |  15 +-
 .../bindings/media/mediatek-mdp.txt           |  95 --------
 .../bindings/media/mediatek-vpu.txt           |  31 ---
 .../bindings/net/marvell,sd8897-bt.yaml       |  91 ++++++++
 .../bindings/net/marvell-bt-8xxx.txt          |  83 -------
 .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   2 +
 .../devicetree/bindings/regulator/da9211.txt  | 205 ------------------
 .../bindings/regulator/dlg,da9211.yaml        | 104 +++++++++
 .../bindings/soc/mediatek/mediatek,pwrap.yaml |  15 ++
 .../sound/mediatek,mt8173-rt5650.yaml         |  73 +++++++
 .../bindings/sound/mt8173-rt5650.txt          |  31 ---
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   2 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  31 ++-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  14 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  14 +-
 23 files changed, 672 insertions(+), 520 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8173-vpu.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-mdp.txt
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/net/marvell,sd8897-bt.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/marvell-bt-8xxx.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/da9211.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/dlg,da9211.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650.txt

-- 
2.50.1

