Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4BB171223
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7026EC25;
	Thu, 27 Feb 2020 08:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF7B6EBC9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 19:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582744400;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=rmAyGFH2w0GQdDqcolLuvQb3bXwl+Mlnr1aULm9Zmtc=;
 b=KIjYrdOo0ePE2OPnLUehAEA+XLFl9K57T6XRAVO8BnrOaxrhL/czvcJ37NUrpbw3EL
 5KYnZXGZLXAMk6CclUg+yV57RkjfgFOIg4/i9AB8mHi+jNJLhMl1q3XyXuq0eFlLDfMD
 GhcNMRfgipydoPEXKIpl8xUN1IZ6xXQqri6Py1BQWFNGjbhn9WBFBzk1ZOQtMS7GiO+x
 f5ZohjbdMDr9g/c70gx0eWBNIa2fZWgsob4pqydskE4Yp/8NTfrLY5fByO49Dpu+lpQE
 aksZPngy6LLCNqy9jSNh3TXvZK/EvPO7LBCVHkTGni2xWgzhevDuejANfCzBx1TtRvYj
 QZ4A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1QJD16bK
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Feb 2020 20:13:01 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [RFC 1/8] dt-bindings: video: Add jz4780-lcd binding
Date: Wed, 26 Feb 2020 20:12:53 +0100
Message-Id: <d7dd7c52a9f6cb4e31bce69bb6879e46bfba530c.1582744379.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582744379.git.hns@goldelico.com>
References: <cover.1582744379.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: devicetree@vger.kernel.org,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
 kernel@pyra-handheld.com, letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>

Add DT bindings for the LCD controller on the jz4780 SoC

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 .../bindings/display/ingenic-jz4780-lcd.txt   | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt

diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
new file mode 100644
index 000000000000..8512ce3f93df
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.txt
@@ -0,0 +1,39 @@
+Bindings for Ingenic JZ4780 LCD Controller
+
+LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
+
+Required properties:
+- compatible: should be "ingenic,jz4780-lcd"
+- reg: Should contain the address & size of the LCD controller registers.
+- interrupts: Should specify the interrupt provided by parent.
+- clocks: Should contain two clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD0PIXCLK.
+- clock-names : Must be "lcd_clk", "lcd_pixclk";
+- port: A port node with endpoint definitions as defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Optional properties:
+- interrupt-parent: phandle to parent interrupt controller
+
+Example:
+
+lcd: jz4780-lcdk@0x13050000 {
+	compatible = "ingenic,jz4780-lcd";
+	reg = <0x13050000 0x1800>;
+
+	clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
+	clock-names = "lcd_clk", "lcd_pixclk";
+
+	interrupt-parent = <&intc>;
+	interrupts = <31>;
+
+	jz4780_lcd_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			jz4780_out_hdmi: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&hdmi_in_lcd>;
+			};
+		};
+
+};
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
