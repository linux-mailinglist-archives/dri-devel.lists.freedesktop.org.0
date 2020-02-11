Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F3615A34C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 09:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74306F493;
	Wed, 12 Feb 2020 08:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5304::12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D136E03A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 21:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581458013;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=dZbZVnixfoO3ZI6/71WGGwComZxww6jvUSKhufZA4ck=;
 b=XjbryxoMniuLEPaGW8Z9hncJrVoD/vXIKeJDodu9dpRG/Of6PA/4o7r+sMOlLZ0sGs
 EaCBxWq4dT1GEDzjp9582Yok+wfo8+hxOr2BSPoWArRnJCcxUirt3JiPqe0rc7WpZBL5
 0Y52SD0znvy2WugBBXKkOQzb+pH3M6zBExbQ1mH024bA65MVVL8bpoBvZVTAuWtSVTIu
 eFp14PrCzhCwy0oezOQjX1ITmgwIrGzTZji0Nb5zLMvwlbgPEcpM6ie8Jw68oS1qXZmX
 w9cHTQKlLUrZ/UYRUtqh34a3bYnHcGbpnzdn7xnK6pHa91GY1zWgobT4AheW0uItIiuH
 IS7g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0P2mp10IM"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1BLff0ET
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 11 Feb 2020 22:41:41 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 Alex Smith <alex.smith@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paulburton@kernel.org>, James Hogan <jhogan@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Andi Kleen <ak@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
 Richard Fontana <rfontana@redhat.com>,
 Allison Randal <allison@lohutok.net>, Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 12/14] MIPS: DTS: CI20: add DT node for SW1 as Enter button
Date: Tue, 11 Feb 2020 22:41:29 +0100
Message-Id: <be2a188b8f36db4c9e21dfd73fef89d25dc5299e.1581457290.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581457290.git.hns@goldelico.com>
References: <cover.1581457290.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 12 Feb 2020 08:25:13 +0000
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, kernel@pyra-handheld.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SW1 button can be used as a simple one-button keyboard
and is connected to PD17.

Note: SW1 has a second meaning to change the boot sequence
when pressed while powering on.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index b4a820313992..8f9d182566db 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -4,6 +4,7 @@
 #include "jz4780.dtsi"
 #include <dt-bindings/clock/ingenic,tcu.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	compatible = "img,ci20", "ingenic,jz4780";
@@ -25,6 +26,17 @@
 		       0x30000000 0x30000000>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		sw1 {
+			label = "ci20:sw1";
+			linux,code = <KEY_ENTER>;
+			gpios = <&gpd 17 GPIO_ACTIVE_HIGH>;
+			wakeup-source;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
