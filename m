Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE42AAECF1
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3039B10E8B7;
	Wed,  7 May 2025 20:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CEHIKvmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1920B10E8AE
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:44 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-72c7332128eso156486a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649363; x=1747254163; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5O5IKDOodRu44GGCb4BG8zpMxyESHszk53bt91Bq6Fc=;
 b=CEHIKvmPBlmDWtNg7Yf0NWxKq5rJZqgDsdYkuqhjPBLprfqqvkOlMiELNI8tiX55+H
 9gpbsjVZYe775PN59v266ysjEytWCwnM/AvesTuvuh7Mv59lVFt6Ca3+2afnWvjid26b
 uGbbkZxM1uA0LJ7sjGND/5MBtfhjVmV5XDjHleAqC2gSzOUu8dZFm2Ok/324xNUraAzy
 7c9PimRObCOF0+zs7RRoeQN2dXRLlGhoXjNYWEFGKkvBKbUQfd7Mt0y8XZzauLsRQNOu
 D37JFmAeRIiWN/dsXgzvzH2mIwObv9tOhhEl3yyag0OSo5IRs9RDxOduHN5NQFxuaX3C
 FIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649363; x=1747254163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5O5IKDOodRu44GGCb4BG8zpMxyESHszk53bt91Bq6Fc=;
 b=kRaOUmOdUU/AmiOQLJWFL9HAYFaWKCJihoC5JqtS/DrEpWQpuC+7HBws8UwZiMIcEm
 7V1zWCbrvUziefVdoMwSgBMGh2IfrfOpaHcGmOomhYlfIPbY3d05aLps3u/0cVK4aZpc
 +OBfw+BGzBKy2KTsSgvZlhqClVi8RRhhoe7h51Cz7yOn2Oa5b8yp0wx9g7FBGs5uHm9M
 TKqbgomj0CJ26F2+CBy6vZ/UB1l0pKLPJW2NDP33il/WC8CGbjm6cNC0XQTUYhG66HCa
 N+zP/AgnuWawDORF5eMvq5bfpkvmEk/aXJoVU69VUjFnhv9r3i8A1mij+FfZg8wVoePp
 ExLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwRc20sp+UJH1QnS82PP43KY0oN6NGL0Aj4Z1n3Gt94hUEyL5YrlqwgreN2tyv42TZ76QbcuxHTFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxETiFEqNc4YElIYG3j8KdnPFtTVTQwsoVUoP13CooAupxkTkAZ
 4+YQ0h5T6cYOZX7eALSVhNfHwuyXVN47bMxrt4ajSlWC4m7k0moR
X-Gm-Gg: ASbGncvt+ZNyDTKJVEpDmEIwUXSll7C34YVCgw4P7v5LfBDn6dNo64726a/SzV0wa4n
 jpDPedkVLaSiRv2tj2Hc5q3f3k2O8bG0ByftyyReKfrpM72PVgd0CWa3aKeOIqwzZldRqOKMajj
 o5VY5WXANU8ml/gc1UFPa8rvGwebIyPgUjqdi80ji7ckqCzTa9N/IEm5Ti7UOVSZ4Yy7j52DY1e
 pkhl14OnGDVoQdBJNNqeEh1YC6lO7WdCMu7kK8F9b7cDEyiCtEy1JLpYWf+axQTEWSTCl+RdXWv
 mzyPA1LRZqWpVnFE2OgjRjDZXz4fu28Opom3CY2kfltvZxPUd0Z4rRzirNKU
X-Google-Smtp-Source: AGHT+IEOq3je+wdHKClXriTnH/qW1I0Dd/fwjIaZZ5wgaKePHeaYweMEfsDSEKSVXN1KtPnla+IiCg==
X-Received: by 2002:a05:6830:280e:b0:72b:cdcd:628b with SMTP id
 46e09a7af769-7321c900e1fmr477585a34.20.1746649363335; 
 Wed, 07 May 2025 13:22:43 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:43 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 21/24] arm64: dts: allwinner: h616: Add TCON nodes to H616
 DTSI
Date: Wed,  7 May 2025 15:19:40 -0500
Message-ID: <20250507201943.330111-22-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The Allwinner H616 has a display pipeline similar to other Allwinner
devices, specifically the A10, but using a newer display engine
revision (DE33).

Not all output pins are exposed on all package variants, for example
only the H700 and T507 have LCD pins exposed, but all variants support
HDMI output. However on the die these are connected to a display engine
via a TCON TOP and one or more timing controllers (TCONs).

HDMI output support is not provided in this series (but will be in a
subsequent patch) so for now note this within the relevant node to
prevent a DT compiler error.

Add TCON nodes for the TOP, and the LCD and TV timing controllers. The
timing controllers are compatible with the existing R40 driver.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index 542d129da9c3..129ce78ae5f3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -7,9 +7,12 @@
 #include <dt-bindings/clock/sun50i-h616-ccu.h>
 #include <dt-bindings/clock/sun50i-h6-r-ccu.h>
 #include <dt-bindings/clock/sun6i-rtc.h>
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/clock/sun8i-tcon-top.h>
 #include <dt-bindings/reset/sun50i-h616-ccu.h>
 #include <dt-bindings/reset/sun50i-h6-r-ccu.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -912,6 +915,142 @@ ohci3: usb@5311400 {
 			status = "disabled";
 		};
 
+		tcon_top: tcon-top@6510000 {
+			compatible = "allwinner,sun50i-h616-tcon-top",
+				     "allwinner,sun50i-h6-tcon-top";
+			reg = <0x06510000 0x1000>;
+			clocks = <&ccu CLK_BUS_TCON_TOP>,
+				 <&ccu CLK_TCON_TV0>;
+			clock-names = "bus", "tcon-tv0";
+			clock-output-names = "tcon-top-tv0";
+			#clock-cells = <1>;
+			resets = <&ccu RST_BUS_TCON_TOP>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_top_mixer0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon_top_mixer0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_top_mixer0_out_tcon_lcd0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_lcd0_in_tcon_top_mixer0>;
+					};
+
+					tcon_top_mixer0_out_tcon_tv0: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&tcon_tv0_in_tcon_top_mixer0>;
+					};
+				};
+
+				tcon_top_hdmi_in: port@4 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <4>;
+
+					tcon_top_hdmi_in_tcon_tv0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon_tv0_out_tcon_top>;
+					};
+				};
+
+				tcon_top_hdmi_out: port@5 {
+					reg = <5>;
+
+					tcon_top_hdmi_out_hdmi: endpoint {
+						/* placeholder for HDMI  - remote-endpoint = <&hdmi_in_tcon_top>;*/
+					};
+				};
+			};
+		};
+
+		tcon_lcd0: lcd-controller@6511000 {
+			compatible = "allwinner,sun50i-h616-tcon-lcd",
+				     "allwinner,sun8i-r40-tcon-lcd";
+			reg = <0x06511000 0x1000>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_LCD0>, <&ccu CLK_TCON_LCD0>;
+			clock-names = "ahb", "tcon-ch0";
+			clock-output-names = "tcon-data-clock";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_LCD0>, <&ccu RST_BUS_LVDS>;
+			reset-names = "lcd", "lvds";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_lcd0_in: port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					tcon_lcd0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_lcd0>;
+					};
+				};
+
+				tcon_lcd0_out: port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
+		tcon_tv0: lcd-controller@6515000 {
+			compatible = "allwinner,sun50i-h616-tcon-tv",
+				     "allwinner,sun8i-r40-tcon-tv";
+			reg = <0x06515000 0x1000>;
+			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON_TV0>,
+				 <&tcon_top CLK_TCON_TOP_TV0>;
+			clock-names = "ahb", "tcon-ch1";
+			#clock-cells = <0>;
+			resets = <&ccu RST_BUS_TCON_TV0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon_tv0_in: port@0 {
+					reg = <0>;
+
+					tcon_tv0_in_tcon_top_mixer0: endpoint {
+						remote-endpoint = <&tcon_top_mixer0_out_tcon_tv0>;
+					};
+				};
+
+				tcon_tv0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon_tv0_out_tcon_top: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon_top_hdmi_in_tcon_tv0>;
+					};
+				};
+			};
+		};
+
 		rtc: rtc@7000000 {
 			compatible = "allwinner,sun50i-h616-rtc";
 			reg = <0x07000000 0x400>;
-- 
2.43.0

