Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F51AB8FB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCC06EAE5;
	Thu, 16 Apr 2020 06:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79FC6E91C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586939767;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=j2lzjrB8duHEXBgNG8DmHoZUIFs1qULEA2767Fb3VsM=;
 b=CWKNCNKDK4tSjm25aO0N53fte0cRwcK1IXV8XE2a7YAZEjdb4vKqmxwByOaXvw2uVe
 WNayyh+sMirLQZk1BT1IWnqfhk8widPdbWoe+v4Xiv+kSRm8rqFeEiXtp1tmqRQXoGfg
 YW1UXwH4PVt8T0ezFxxhy1ZGL4SGBor0F702JyN/ILjUc9tMRnIO0IqjrxnsrgyGmEz1
 /yuDGxWxI2Q9+3Z9pVxRhSshOOI2eTCjtFMih7LsFzant2WWdnXLWuymVfqay/wM2Glj
 cL8MOD4AA+4w1mKH2AvNlWqt2sJZ6Y1tu1JRajb/YwzyBP4be2zHk2+kOjnxBw2buH+t
 RYNw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
 with ESMTPSA id 6028a2w3F8ZQ0It
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 15 Apr 2020 10:35:26 +0200 (CEST)
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
Subject: [PATCH v6 07/12] ARM: DTS: omap5: add sgx gpu child node
Date: Wed, 15 Apr 2020 10:35:14 +0200
Message-Id: <004611c9660943759b635a87484932869927cf74.1586939718.git.hns@goldelico.com>
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

Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # Pyra-Handheld.
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap5.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 2ac7f021c284..1cf41664fd00 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -270,7 +270,7 @@ sata: sata@4a141100 {
 			ports-implemented = <0x1>;
 		};
 
-		target-module@56000000 {
+		sgx_module: target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5600fe00 0x4>,
 			      <0x5600fe10 0x4>;
@@ -287,10 +287,11 @@ target-module@56000000 {
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu: gpu@0 {
+				compatible = "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+			};
 		};
 
 		target-module@58000000 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
