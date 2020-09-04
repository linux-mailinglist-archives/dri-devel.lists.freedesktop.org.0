Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E6225DC67
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:54:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E976EC47;
	Fri,  4 Sep 2020 14:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3019A6EC47;
 Fri,  4 Sep 2020 14:54:20 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D4D120722;
 Fri,  4 Sep 2020 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599231260;
 bh=rpsSuPF55D8wUkxcwd9feqYT0zQ6KFywXHAw7ktgB80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JvV9pFWC3wErh0W+nTssH8qc19UqAU6Gr91Qlc56nQb2/BCiK1FfnlfgOUtWssA3X
 3fL2Ao7O7XBk3M5t0Zkx4Gcm616faoXTUxKKUZ1RYBQGWrpod+i60sROoY9MO9C0QA
 6Sx6tlTQYQ/ORbwGcJEl8bN5GGPSCJZAgzcM/oq8=
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
Subject: [PATCH 10/13] arm64: dts: imx8mq: Add missing interrupts to GPC
Date: Fri,  4 Sep 2020 16:53:09 +0200
Message-Id: <20200904145312.10960-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904145312.10960-1-krzk@kernel.org>
References: <20200904145312.10960-1-krzk@kernel.org>
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

The i.MX General Power Controller v2 device node was missing interrupts
property necessary to route its interrupt to GIC.  This also fixes the
dbts_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: gpc@303a0000:
    {'compatible': ... '$nodename': ['gpc@303a0000']} is not valid under any of the given schemas
  arch/arm64/boot/dts/freescale/imx8mq-evk.dt.yaml: gpc@303a0000: 'interrupts' is a required property

Fixes: fdbcc04da246 ("arm64: dts: imx8mq: add GPC power domains")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index aad3b9f2f35c..5e0e7d0f1bc4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -623,6 +623,7 @@
 			gpc: gpc@303a0000 {
 				compatible = "fsl,imx8mq-gpc";
 				reg = <0x303a0000 0x10000>;
+				interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&gic>;
 				interrupt-controller;
 				#interrupt-cells = <3>;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
