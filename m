Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4DD197531
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3FA89F73;
	Mon, 30 Mar 2020 07:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5303::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B098826D
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 17:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503373;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=q969EphFXv0KGrhdAiGCS2+PMGXFbeBIe9i3fa3YlIU=;
 b=ri0gRhWriNjyHWMzVAao3Owe054FfrMo19CMvMqPKbZwZaofimd8yy1/hKpLPP3ulG
 J+/IN+QsNy8thXLF59lRFkIxn/qQGQbX4DUBlKQkMIKJ6L4r8Tifz8KZNl95W8fjV/Iy
 yG1sXhxILGZBHqNHHovl+k0/6ULND30Te9hFCeyI+rIrZOyCKTId6kJ++hn8XSja787E
 +9/WBiI0iqCEWEVdreu8iXjmPtpOnZTIm3xILoXxSnJ2BYgj3veKY4qR/nOrbnUfLro2
 1iOq/ulzeRqYbrgUZAyl6Zjj0sQcwCnkDDcs3sZbRzj7crGSc85paZsoeYOhMj40NDaU
 Bomw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
 with ESMTPSA id m02241w2THa1BMF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 29 Mar 2020 19:36:01 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Kees Cook <keescook@chromium.org>
Subject: [RFC v3 6/8] MIPS: DTS: jz4780: account for Synopsys HDMI driver and
 LCD controller
Date: Sun, 29 Mar 2020 19:35:52 +0200
Message-Id: <62c975f7de965181e1e44eb85e01ab60a645453b.1585503354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503354.git.hns@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-gpio@vger.kernel.org, mips-creator-ci20-dev@googlegroups.com,
 letux-kernel@openphoenux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Boddie <paul@boddie.org.uk>

A specialisation of the generic Synopsys HDMI driver is employed for JZ4780
HDMI support. This requires a new driver, plus device tree and configuration
modifications.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index bb89653d16a3..73776514bbe5 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -434,4 +434,50 @@ bch: bch@134d0000 {
 
 		status = "disabled";
 	};
+
+	hdmi: hdmi@10180000 {
+		compatible = "ingenic,jz4780-dw-hdmi";
+		reg = <0x10180000 0x8000>;
+		reg-io-width = <4>;
+
+		clocks = <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
+		clock-names = "isfr" , "iahb";
+
+		assigned-clocks = <&cgu JZ4780_CLK_HDMI>;
+		assigned-clock-rates = <27000000>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <3>;
+
+		/* ddc-i2c-bus = <&i2c4>; */
+
+		status = "disabled";
+	};
+
+	lcdc0: lcdc0@13050000 {
+		compatible = "ingenic,jz4780-lcd";
+		reg = <0x13050000 0x1800>;
+
+		clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
+		clock-names = "lcd", "lcd_pclk";
+
+		interrupt-parent = <&intc>;
+		interrupts = <31>;
+
+		status = "disabled";
+	};
+
+	lcdc1: lcdc1@130a0000 {
+		compatible = "ingenic,jz4780-lcd";
+		reg = <0x130a0000 0x1800>;
+
+		clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD1PIXCLK>;
+		clock-names = "lcd", "lcd_pclk";
+
+		interrupt-parent = <&intc>;
+		interrupts = <31>;
+
+		status = "disabled";
+	};
+
 };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
