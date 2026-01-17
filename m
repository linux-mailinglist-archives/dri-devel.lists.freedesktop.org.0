Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A3D38AE2
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 01:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BC810E26F;
	Sat, 17 Jan 2026 00:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="kHo2FD01";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pEZm25ks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC9110E26F
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 00:50:44 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dtJ6q1wvQz9tnr;
 Sat, 17 Jan 2026 01:50:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768611043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2StUYOSKIvxbYZNQ/iaVvb/LqaBjKMetc/e557o+i4=;
 b=kHo2FD01NEaWZJ2rTwt5HmImJtC3e443bLH/QEFrcW6poi/ERNp2gPQs1IQp2nmGfZrJJB
 I738GfFnUbaE9G+UYKJNST/WAO6vt3I3y3JsIlHDRwelRIj3VA1BH7EJCNv8iL+zqY+0bL
 MOQegqH/YpdMT7EMRfC4uPbNOpJF2wtLxAYkI8PQbqRgIJrqQqIrdxUPCxxjkkMIvFLJF2
 KQQ8vKmuhfERSt+Y9ucxPY4vPa5lJoEBT8/5XR3ZiD40uNVarH+hBZQ8tGpT+HGgzIRQ+F
 t9t+6iCNEfgkVkc5e8aaCDBGIMP0ZSHa+2I9cBgJYCLNnNhRJ6IZIzoJYdbh0w==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pEZm25ks;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768611041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R2StUYOSKIvxbYZNQ/iaVvb/LqaBjKMetc/e557o+i4=;
 b=pEZm25ksjEB+SK3aznf3MiTOypY97he9EmpCpFrQGtY72xl/fNl4s0msb8Qqlxs6Y1cnCl
 V+oLVqo9jGZWY/9S1a/lscO4ql5R5Whx6LR8iIUoHFk8XbSroMtD/qHDrIAO+MqleTUU3y
 eTN3c90iOnDmUIz39SSFz8yFezoqPKFeiBNStKMNvxqRKU1F9W7aINfVmguUzrP1fhMukB
 +qNUdJQIc+A9HIXqunvS6f8++rXPLysDaCQOd/bg+FM6Iuulh3p76QtuQHheJp7Q9AGJxv
 bSQzk+KP8CFsDLLNFT+55iL9rK+EW8TYhxgyoprhKcSGO4NdJoaf7RzAeaCvVA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare Display 13.3"
Date: Sat, 17 Jan 2026 01:49:49 +0100
Message-ID: <20260117005028.126361-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8oaa3rjymsb4wxzzq3rwsfp1qhyoh5nc
X-MBO-RS-ID: e55271f627dd3f688aa
X-Rspamd-Queue-Id: 4dtJ6q1wvQz9tnr
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

Add a DT overlay to bind the WaveShare 13.3inch 1920x1080 DSI Capacitive
Touch Display on the Retronix R-Car V4H Sparrow Hawk board.

Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
DEPENDS:
- https://lore.kernel.org/linux-input/20260112234534.225954-1-marek.vasut+renesas@mailbox.org/
- https://lore.kernel.org/linux-devicetree/20260112234834.226128-1-marek.vasut+renesas@mailbox.org/
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
V3: Use compatible = "waveshare,13.3inch-panel" and drop timings
    and dimensions, those are part of panel-simple
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 ...r8a779g3-sparrow-hawk-ws-display-13in.dtso | 90 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 1fab1b50f20e6..8a2d1baa69c77 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -120,6 +120,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 r8a779g3-sparrow-hawk-rpi-display-2-7in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtbo
+r8a779g3-sparrow-hawk-ws-display-13in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-ws-display-13in.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single.dtb
 r8a779g3-white-hawk-single-ard-audio-da7212-dtbs := r8a779g3-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
new file mode 100644
index 0000000000000..4c3bfd28848aa
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the Waveshare 13.3 MIPI DSI panel connected
+ * to J4:DSI on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025-2026 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel {
+		compatible = "waveshare,13.3inch-panel";
+		power-supply = <&reg_5p0v>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+	};
+
+	reg_5p0v: regulator-5p0v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5.0V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&i2c0_mux3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+	};
+
+	bridge@45 {
+		compatible = "waveshare,dsi2dpi";
+		reg = <0x45>;
+		power-supply = <&reg_5p0v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+};
+
+&dsi0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			dsi0_out: endpoint {
+				remote-endpoint = <&bridge_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
-- 
2.51.0

