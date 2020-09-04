Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8EB25DC71
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 16:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C076EC4D;
	Fri,  4 Sep 2020 14:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDE56EC4E;
 Fri,  4 Sep 2020 14:54:31 +0000 (UTC)
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0ABC620722;
 Fri,  4 Sep 2020 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599231271;
 bh=QOJLGecW1qxz6ZNlLifYa3oKhiDzUyvvKI7pYuzuHRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MIaC+jSu5K5Ul1I+hd40MUvRZUlCxrX3f809s3TEnNjprGSdRQROcWey19AD11pmp
 rNnrLLXLjWuznWa5iLoYcNm9Pklcbv5VdJ06qeBB/uqh9wDr7sdvRI3xD6HUPPtJgH
 LJlaXSdlXFcy/CbOvNSeld92RdgUUw+jXBoqcLkk=
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
Subject: [PATCH 12/13] arm64: dts: imx8mq-librem5: Drop interrupt-names in PMIC
Date: Fri,  4 Sep 2020 16:53:11 +0200
Message-Id: <20200904145312.10960-13-krzk@kernel.org>
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

The 'interrupt-names' property is not described in dtschema, not used by
the driver and does not really make sense as its value is simple 'irq'.
Drop it to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dt.yaml:
    pmic@4b: 'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts | 1 -
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi       | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
index 10f30ff85fd3..cce1b595e2d6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
@@ -289,7 +289,6 @@
 		clock-output-names = "pmic_clk";
 		interrupt-parent = <&gpio1>;
 		interrupts = <3 GPIO_ACTIVE_LOW>;
-		interrupt-names = "irq";
 		rohm,reset-snvs-powered;
 
 		regulators {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 4e50cb62654d..a78584086fa9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -640,7 +640,6 @@
 		clock-output-names = "pmic_clk";
 		interrupt-parent = <&gpio1>;
 		interrupts = <7 GPIO_ACTIVE_LOW>;
-		interrupt-names = "irq";
 		rohm,reset-snvs-powered;
 
 		regulators {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
