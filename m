Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8EA3FD7C5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 12:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947AF6E17A;
	Wed,  1 Sep 2021 10:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
 by gabe.freedesktop.org (Postfix) with ESMTP id E66BC6E17F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 10:37:55 +0000 (UTC)
Received: from hq-00021.holoplot.net (unknown [194.162.236.226])
 by mail.bugwerft.de (Postfix) with ESMTPSA id EC19432D198;
 Wed,  1 Sep 2021 10:30:59 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Mack <daniel@zonque.org>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v9 1/2] dt-bindings: display: add bindings for newhaven,
 1.8-128160EF
Date: Wed,  1 Sep 2021 12:30:39 +0200
Message-Id: <20210901103040.1419706-2-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901103040.1419706-1-daniel@zonque.org>
References: <20210901103040.1419706-1-daniel@zonque.org>
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

This adds documentation for a new ILI9163 based, SPI connected display.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/ilitek,ili9163.txt       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9163.txt

diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9163.txt b/Documentation/devicetree/bindings/display/ilitek,ili9163.txt
new file mode 100644
index 000000000000..fee119991c14
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ilitek,ili9163.txt
@@ -0,0 +1,27 @@
+Ilitek ILI9163 display panels
+
+This binding is for display panels using an Ilitek ILI9163 controller in SPI
+mode.
+
+Required properties:
+- compatible:	"newhaven,1.8-128160EF", "ilitek,ili9163"
+- dc-gpios:	D/C pin
+- reset-gpios:	Reset pin
+
+The node for this driver must be a child node of a SPI controller, hence
+all mandatory properties described in ../spi/spi-bus.txt must be specified.
+
+Optional properties:
+- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
+- backlight:	phandle of the backlight device attached to the panel
+
+Example:
+	display@0{
+		compatible = "newhaven,1.8-128160EF", "ilitek,ili9163"
+		reg = <0>;
+		spi-max-frequency = <32000000>;
+		dc-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+		rotation = <270>;
+		backlight = <&backlight>;
+	};
-- 
2.31.1

