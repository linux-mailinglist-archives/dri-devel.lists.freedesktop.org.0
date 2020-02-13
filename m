Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3D15D380
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6206EB44;
	Fri, 14 Feb 2020 08:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7506E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 20:20:01 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id q8so8121988ljb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 12:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mW6PukSxckGSUCke6VTFTCVByD+nJPm6k8mdLJlJUQ8=;
 b=RC09I+Bvk9BEGM312oV5NW7pG1aKQPts5wE1yDyMZ5aunmfCjtpj/ZtkVQfg5cc4kX
 n4rUd7Uw8Ed/epLUm9Gj7Q9rrTgeNaB7fA6T6msnWDT9n49NXzqbTh4gbBQ3D4ylyM2m
 Db9pfSfadEt1TPmiY25g7eQP5kfvza19ucaRwOBa4LoatztuIsBGKZCRLtsT1qGzqb+x
 3R1jApficdWMUC38I6zCdiYLKbYUeP7ewABAHw3uNkUlziHLUZmEa77C55CQ9fX5E8yR
 nhxT/uqgKTwmRXqalvyie7/fOEEnIe6JNxBaGyGoRwKVGvbXa2Gl0eaaV/pVBbzSbPgj
 WORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mW6PukSxckGSUCke6VTFTCVByD+nJPm6k8mdLJlJUQ8=;
 b=tZ6GNfIcGoRKidKcpOtEfL+BzXwAc+ifoe70ADLJw7ltY849LRmrnir8Tkgp0OyJOe
 1Mqo/o5A1q/ayWZdQyBC3f5e3z0YALtGguIu/CDno+jYXplYcr3i56BmZ9Yoqa3hiY/U
 cjNbWyWNEpnzU/lH5ENidxxoBhuGabijIxI4KVqK2PBZOzO9oiihdFCeKYOEt2yuomtB
 s9R3hWUa8M0QNqyDXYLDF6JRUeLEqxmQ46toHaYNzmX6eISa/NWSNgoLJPJlfMZrHI7O
 YTB5hXSXU7Y8BIPQrlPxlXbthlSr33w3nWo6FY3ItNEvLm0AUO/coowg5R2oNsJfX6yK
 ++8A==
X-Gm-Message-State: APjAAAVYLNeUf/3JBjcXphjNF1zYDwzgiJZDUBfYYeptd6kL0DbrHtU4
 PZU1TJlMjJ+vIwk9lO/V7d4=
X-Google-Smtp-Source: APXvYqxw0rZXUmiJIT9xq2xe3VuahXdAUOtscc4DdIG+xn5Y17KAhRRAUvyZVKqDwcbtKuS/oxnM5w==
X-Received: by 2002:a2e:9e19:: with SMTP id e25mr12844931ljk.179.1581625199519; 
 Thu, 13 Feb 2020 12:19:59 -0800 (PST)
Received: from localhost.localdomain ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id s22sm2209470ljm.41.2020.02.13.12.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 12:19:59 -0800 (PST)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] ARM: dts: sun7i: Add LVDS panel support on A20
Date: Thu, 13 Feb 2020 22:18:57 +0200
Message-Id: <20200213201854.810-3-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200210195633.GA21832@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: Andrey Lebedev <andrey@lebedev.lt>, linux-sunxi@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Lebedev <andrey@lebedev.lt>

Define pins for LVDS channels 0 and 1, configure reset line for tcon0 and
provide sample LVDS panel, connected to tcon0.

Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 92b5be97085d..3b3c366a2bee 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -47,6 +47,7 @@
 #include <dt-bindings/dma/sun4i-a10.h>
 #include <dt-bindings/clock/sun7i-a20-ccu.h>
 #include <dt-bindings/reset/sun4i-a10-ccu.h>
+#include <dt-bindings/pinctrl/sun4i-a10.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -407,8 +408,8 @@
 			compatible = "allwinner,sun7i-a20-tcon";
 			reg = <0x01c0c000 0x1000>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-			resets = <&ccu RST_TCON0>;
-			reset-names = "lcd";
+			resets = <&ccu RST_TCON0>, <&ccu RST_LVDS>;
+			reset-names = "lcd", "lvds";
 			clocks = <&ccu CLK_AHB_LCD0>,
 				 <&ccu CLK_TCON0_CH0>,
 				 <&ccu CLK_TCON0_CH1>;
@@ -444,6 +445,11 @@
 					#size-cells = <0>;
 					reg = <1>;
 
+					tcon0_out_lvds: endpoint@0 {
+						reg = <0>;
+						allwinner,tcon-channel = <0>;
+					};
+
 					tcon0_out_hdmi: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&hdmi_in_tcon0>;
@@ -1162,6 +1168,24 @@
 				pins = "PI20", "PI21";
 				function = "uart7";
 			};
+
+			/omit-if-no-ref/
+			lcd_lvds0_pins: lcd-lvds0-pins {
+				pins =
+					"PD0", "PD1", "PD2", "PD3", "PD4",
+					"PD5", "PD6", "PD7", "PD8", "PD9";
+				function = "lvds0";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+			};
+
+			/omit-if-no-ref/
+			lcd_lvds1_pins: lcd-lvds1-pins {
+				pins =
+					"PD10", "PD11", "PD12", "PD13", "PD14",
+					"PD15", "PD16", "PD17", "PD18", "PD19";
+				function = "lvds1";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+			};
 		};
 
 		timer@1c20c00 {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
