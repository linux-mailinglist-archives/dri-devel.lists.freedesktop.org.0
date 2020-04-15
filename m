Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0FD1AB914
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 09:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74FE6EAFE;
	Thu, 16 Apr 2020 06:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30596E924
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586939762;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=6++awsC9MQ9UWUKEnojY9Xy95sI3Ppl7eM2gLntDGuI=;
 b=Sw1el/jHqhQaNq7RsJSn+MJr+7UKWzo/CcbAZXq0b0mNeusPPGepf5lnKRXBZNbjV9
 4/kiIEgf53/hn7VN8Hu9TK70PUdwR1bmK8wxKUNVGV+p5sg49DFHKcj22reeI3mQ1Ms0
 d14z5BnCUyU7ZVdJMikeT98exyvJcGuWdweeCrYQyGp8hRokhdsAWvjmLy/ZkMGWDEnL
 jDjCipx1TL0EZgweVPHKhc+7/kcoPvGe248tdu0ZvweuaZgEPPPaoom9Nwszo5kWckQJ
 Wt7X78vajWjHGoa5aKFJJa87KbVmuftnjomcWlXjf7bY2+4XCANTQatNVwVZMonCJklz
 xJeA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id 6028a2w3F8ZP0Ir
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 10:35:25 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Paul Cercueil <paul@crapouillou.net>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v6 06/12] ARM: DTS: omap4: add sgx gpu child node
Date: Wed, 15 Apr 2020 10:35:13 +0200
Message-Id: <dc8ff147e82d9b7862f0122801d30600a80f314c.1586939718.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586939718.git.hns@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: devicetree@vger.kernel.org, letux-kernel@openphoenux.org,
 Philipp Rossak <embed3d@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 openpvrsgx-devgroup@letux.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, kernel@pyra-handheld.com,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

and add interrupt.

Since omap4420/30/60 and omap4470 come with different SGX variants
we need to introduce a new omap4470.dtsi. If an omap4470 board
does not want to use SGX it is no problem to still include
omap4460.dtsi.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # PandaBoard ES
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap4.dtsi   | 11 ++++++-----
 arch/arm/boot/dts/omap4470.dts | 15 +++++++++++++++
 2 files changed, 21 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/omap4470.dts

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
index 763bdea8c829..15ff3d7146af 100644
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -389,7 +389,7 @@ abb_iva: regulator-abb-iva {
 			status = "disabled";
 		};
 
-		target-module@56000000 {
+		sgx_module: target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5600fe00 0x4>,
 			      <0x5600fe10 0x4>;
@@ -408,10 +408,11 @@ target-module@56000000 {
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu: gpu@0 {
+				compatible = "ti,omap4-sgx540-120", "img,sgx540-120", "img,sgx540";
+				reg = <0x0 0x2000000>;	/* 32MB */
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		/*
diff --git a/arch/arm/boot/dts/omap4470.dts b/arch/arm/boot/dts/omap4470.dts
new file mode 100644
index 000000000000..f29c581300bf
--- /dev/null
+++ b/arch/arm/boot/dts/omap4470.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device Tree Source for OMAP4470 SoC
+ *
+ * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This file is licensed under the terms of the GNU General Public License
+ * version 2.  This program is licensed "as is" without any warranty of any
+ * kind, whether express or implied.
+ */
+#include "omap4460.dtsi"
+
+&sgx {
+	compatible = "ti,omap4470-sgx544-112", "img,sgx544-112", "img,sgx544";
+};
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
