Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACCF171225
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DC06EC22;
	Thu, 27 Feb 2020 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2466EBBA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 19:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582744394;
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ZlvegWKzEL7p+n4163sWKIEhQycTr4lr1NjcravaYHg=;
 b=SUD3iuINVgw8sDCbuPVAbS6Eaf9C9HYB8iXQ5SuuqKn+G6dklsuWklWQoZfEJ8kSYr
 tScVkxiTeMFjcjiygWUekmgCpRd/K1gos/SIq0QT4UhLg4gXKzRlw1l3wKJf5PfhPB7l
 XEkme/B3x0ycjpDKXYaZR3dbMD865usj81uYRK4H1be9s9GSnnOLQT/FAXUoXeq2SO+6
 FXbDNqstPhYJU1MKz2Ih1+YvpFQp5EGd1eWFPMOgydnNm/iDt1mGBeM/4jZrfkh51Gv9
 wy55Tjis77sStvTnJwJ/PA06si4Iphyl1hZcR645+KqIhqdmibMsQlzuV9DrUD5qHk02
 /oIg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
 with ESMTPSA id U06217w1QJD26bL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Feb 2020 20:13:02 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Paul Cercueil <paul@crapouillou.net>, Paul Boddie <paul@boddie.org.uk>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Kleen <ak@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Subject: [RFC 2/8] dt-bindings: video: Add jz4780-hdmi binding
Date: Wed, 26 Feb 2020 20:12:54 +0100
Message-Id: <2d7202155bae3fa9c7097275d4c9a1ccab569aea.1582744379.git.hns@goldelico.com>
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

Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 .../bindings/display/ingenic-jz4780-hdmi.txt  | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
new file mode 100644
index 000000000000..f02e59fbdd5a
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.txt
@@ -0,0 +1,41 @@
+Device-Tree bindings for Ingenic JZ4780 HDMI Transmitter
+
+The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HDMI 1.4
+TX controller IP with accompanying PHY IP.
+
+Required properties:
+ - #address-cells : should be <1>
+ - #size-cells : should be <0>
+ - compatible : should be "ingenic,jz4780-hdmi"
+ - reg-io-width: must be <4>
+ - clocks: phandle to isrf and iahb clocks
+ - clock-names : must be "isrf" and "iahb"
+ - ports: Port nodes with endpoint definitions as defined in
+   Documentation/devicetree/bindings/media/video-interfaces.txt,
+
+Optional properties:
+ - ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
+
+example:
+
+hdmi: hdmi@10180000 {
+	compatible = "ingenic,jz4780-hdmi";
+	reg = <0x10180000 0x8000>;
+	reg-io-width = <4>;
+	ddc-i2c-bus = <&i2c4>;
+	interrupt-parent = <&intc>;
+	interrupts = <3>;
+	clocks = <&cgu JZ4780_CLK_HDMI>, <&cgu JZ4780_CLK_AHB0>;
+	clock-names = "isfr", "iahb";
+
+	ports {
+		hdmi_in: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			hdmi_in_lcd: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&jz4780_out_hdmi>;
+			};
+		};
+	};
+};
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
