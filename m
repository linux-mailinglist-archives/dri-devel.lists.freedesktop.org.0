Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CB225DC41
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA206EBFD;
	Fri,  4 Sep 2020 14:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D737C6EC01;
 Fri,  4 Sep 2020 14:53:23 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E45132074D;
 Fri,  4 Sep 2020 14:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599231203;
 bh=bjAz7YHJmR0xoTdAVB4K1GtWMTGGPiLOn6zcDC3zJ0I=;
 h=From:To:Cc:Subject:Date:From;
 b=OAv7X5gvBUumvNAkExgshZaX36psIdv419CgbhfhwJ7fQbY5FiVYF21NTEErDw0Tg
 G+/tMjMmogShWIVJAFpeFef+9Ol6liSBRC6RheddUo7D9zP+mn59CwAz2LY2lSPNds
 NnRND0xnpZLpR7g2qfrUAP0hpnUGxoOU5IP8XxxU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Li Yang <leoyang.li@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/13] iMX 8 - Another round of cleanups
Date: Fri,  4 Sep 2020 16:52:59 +0200
Message-Id: <20200904145312.10960-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This is an another round of cleanups of i.MX 8 DTS and binings.  No
dependencies.

Best regards,
Krzysztof

Krzysztof Kozlowski (13):
  dt-bindings: power: fsl,imx-gpcv2: Document interrupt controller
    properties
  dt-bindings: display: bridge: nwl-dsi: Add common properties
  dt-bindings: arm: fsl: Fix matching Purism Librem5 phones
  dt-bindings: gpu: vivante,gc: Add common properties
  dt-bindings: gpu: vivante,gc: Remove trailing whitespace
  dt-bindings: mfd: rohm,bd71837-pmic: Add common properties
  dt-bindings: mfd: rohm,bd71847-pmic: Add common clock-names
  arm64: dts: imx8mm-var-som-symphony: Use newer interrupts property
  arm64: dts: imx8mp-evk: Align pin configuration group names with
    schema
  arm64: dts: imx8mq: Add missing interrupts to GPC
  arm64: dts: imx8mq-librem5: Align regulator names with schema
  arm64: dts: imx8mq-librem5: Drop interrupt-names in PMIC
  arm64: dts: imx8mq-librem5: Add interrupt-names to ti,tps6598x

 .../devicetree/bindings/arm/fsl.yaml          | 10 ++++--
 .../bindings/display/bridge/nwl-dsi.yaml      |  4 +++
 .../devicetree/bindings/gpu/vivante,gc.yaml   |  9 +++++-
 .../bindings/mfd/rohm,bd71837-pmic.yaml       |  6 ++++
 .../bindings/mfd/rohm,bd71847-pmic.yaml       |  3 ++
 .../bindings/power/fsl,imx-gpcv2.yaml         |  4 +++
 .../dts/freescale/imx8mm-var-som-symphony.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 12 +++----
 .../dts/freescale/imx8mq-librem5-devkit.dts   |  1 -
 .../boot/dts/freescale/imx8mq-librem5.dtsi    | 32 +++++++++----------
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |  1 +
 11 files changed, 57 insertions(+), 27 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
