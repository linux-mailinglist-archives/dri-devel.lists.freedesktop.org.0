Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F563E16AF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 16:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865EF6EA7F;
	Thu,  5 Aug 2021 14:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p03-ob.smtp.rzone.de (mo4-p03-ob.smtp.rzone.de
 [85.215.255.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59336EA75
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 14:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1628172484;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=K0sFdrnmJtU+HNf5UqSpAGXxaDpXX2cDTnFEZZMJfDU=;
 b=XolgD4QWcXvg1GfDR4Z3iFZtT4W0u9Zx++3vA8KDNyyHcf7L3SeBY9QRBCT9mCLvBM
 1kYboOqKMIvnxzdsEAlaS2UXaF+niHQa1JRRNvHGmOSQcWJX6XJa07Cq7Ikj+V+hCT4H
 4V6IXpU1AxHEK5cEc1OhLgrR712Pq1k+PDSBOXiNX1oBx/DOyRKRBBV1BONduVIpyPkA
 /WsUpQTtW+8pX+LYhhLn2JJ6R0jT5kiG0DowE2d0TezGxqiExgzB4e9RA7tMYMHCJwvV
 Dq05p84v0kz9WMPWAfPy+4azQbOLL1rlpurZ90/eh2ZHO4O6DDa2D0ddy6ZrgcjMQ/Yb
 xSvA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdbLzk="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 47.31.0 DYNA|AUTH)
 with ESMTPSA id Q02727x75E83785
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 5 Aug 2021 16:08:03 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/8] MIPS: DTS: jz4780: account for Synopsys HDMI driver
 and LCD controller
Date: Thu,  5 Aug 2021 16:07:54 +0200
Message-Id: <4784fa1d458e64024b10822f22d83c3f0e518408.1628172477.git.hns@goldelico.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628172477.git.hns@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
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

From: Paul Boddie <paul@boddie.org.uk>

A specialisation of the generic Synopsys HDMI driver is employed for JZ4780
HDMI support. This requires a new driver, plus device tree and configuration
modifications.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/jz4780.dtsi | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
index 9e34f433b9b58..4cbc6a4db6cda 100644
--- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
@@ -424,6 +424,51 @@ i2c4: i2c@10054000 {
 		status = "disabled";
 	};
 
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
 	nemc: nemc@13410000 {
 		compatible = "ingenic,jz4780-nemc", "simple-mfd";
 		reg = <0x13410000 0x10000>;
-- 
2.31.1

