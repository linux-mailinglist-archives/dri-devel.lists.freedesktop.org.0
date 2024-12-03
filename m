Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791FA9E14F4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:02:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E252710E941;
	Tue,  3 Dec 2024 08:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FtQMVagw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7A710E93F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:02:56 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD5A9FC5;
 Tue,  3 Dec 2024 09:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733212948;
 bh=7z6/EAnT7VsSyYSmFx1O+9nGFu4lUDeRzP91zNyEoSU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FtQMVagw1Xka630s8e9EA8GAY8nIVm2UgMXZ6DUPRpui2NjyYceB6lWFoyUEgfunl
 suglfdn1xx/z1w/4xsI3+maUkv0q55yeR+z0vo47V/YcfcMeDRgPIK6tnbfjtvhBLj
 B28jGFGnvilRy5fKFr0HvdDLaBgjxNhJ4sEmKJHM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:42 +0200
Subject: [PATCH 8/9] arm64: dts: renesas: r8a779h0: Add display support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-8-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2600;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/iTNN3gFzdKBzcdbMuJkel0BN+dgFjVgvK5qDPf9lBQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrsf+8tuNFXEnXx33H/UJARul4NXBtLotKVGC
 cdOdiEB6CmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HwAKCRD6PaqMvJYe
 9dwJEACS8+VfqzeZ7oDbidTXVXZvzcIdWM94ohHMXEHRUiwkHgT6zFpPDyv3iilBcNd0pB7bsoH
 j6Mr3JarPdMQMAhllZjo4wLzwXT/MdeEqHI4h2WVS9Ua0ev9nuy7LQ7/kjQsI2aSQgFJjy6gRh7
 qoQtqBkmKtYXxcrlPGYo/W2Em77w1AT2Ai1DPlwiNtmP3/OXnUXNB6S6ke1OLo/oYeqfS1A0Nco
 J3NTSfDygPIkTOBOK+2Ux/ELZeJqybH47ZZznTTci1KBseduSzoIdS51aC7IicwGzCWhQqrWHpD
 R5BvDUeO2E2iHCANJ2qbu72gPpxB3USTThkfoczX0+wIrnfjt8i0rSgHAz3kIHfmnm+p+AZn2rR
 x11Ik8Cb43Ldo4Sef4JFcc7v4yLGS3QWU6msaQuOkDYoeh6yZo03v8zaS8Dd90Krh2uCtmkq/ow
 nVNBKTPaPbDHNJV9dx+fnwzAXDLTaKKxzCc9DFcFzaJqsF/gNGpjIYdk33EVzNHq9nbiOW5E38/
 8NwpMYdfsAH8fwVOIob+Tsy39E1u5B6dVt1MeYa+Lb6ee3pJ8PEY+cG/sPAb3+lCKRD6MoFpwQb
 dhJU0/77EvOsC2eEY/dS1r+Kt64iiPpoJsDPllajx1fEfSsftfrThBjiGFVkmIbJKys0D5tMVd1
 PNMHCRXq1QWDYEQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add the device nodes for supporting DU and DSI.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 12d8be3fd579..82df6ee98afb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1828,6 +1828,54 @@ csi41isp1: endpoint {
 			};
 		};
 
+		fcpvd0: fcp@fea10000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea10000 0 0x200>;
+			clocks = <&cpg CPG_MOD 508>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 508>;
+		};
+
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x8000>;
+			interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 830>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 830>;
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a779h0";
+			reg = <0 0xfeb00000 0 0x40000>;
+			interrupts = <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 411>;
+			clock-names = "du.0";
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 411>;
+			reset-names = "du.0";
+			renesas,vsps = <&vspd0 0>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_dsi0: endpoint {
+						remote-endpoint = <&dsi0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		isp0: isp@fed00000 {
 			compatible = "renesas,r8a779h0-isp",
 				     "renesas,rcar-gen4-isp";
@@ -1996,6 +2044,35 @@ isp1vin15: endpoint {
 			};
 		};
 
+		dsi0: dsi-encoder@fed80000 {
+			compatible = "renesas,r8a779h0-dsi-csi2-tx";
+			reg = <0 0xfed80000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 415>,
+				 <&cpg CPG_CORE R8A779H0_CLK_DSIEXT>,
+				 <&cpg CPG_CORE R8A779H0_CLK_DSIREF>;
+			clock-names = "fck", "dsi", "pll";
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 415>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi0_in: endpoint {
+						remote-endpoint = <&du_out_dsi0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;

-- 
2.43.0

