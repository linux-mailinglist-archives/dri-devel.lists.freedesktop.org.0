Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A31E9E5790
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B477210EE7E;
	Thu,  5 Dec 2024 13:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fcocQJQ/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5513310EE7E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:45:43 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AA733E;
 Thu,  5 Dec 2024 14:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733406313;
 bh=CvG5cV3/BnOqrex+A4rcAyfGhlZH/bFpQ2vkN135FkY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fcocQJQ/mTBKbtvWtrWnl7cMgtQQ+bfVtYLL61OTIg1O/fDSsh8q3O0RuDq8o6XRV
 h4aW9QMUalMyIKWzzr/44s9EisbgWMzj/hCUUyRjALhlBRojzX2F/14QGn3YoI0fDJ
 fkkpUOqZQOgPKHLq6cr2nZT63W2HxsPQHw4w1HLg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:45:04 +0200
Subject: [PATCH v2 09/10] arm64: dts: renesas: r8a779h0: Add display
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-9-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bdk0P2sOC8R4gh5BoZ9fg3apaeHjc9+QqgKmbv8gVqY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa50SPX6Ulwze9yvprRJT2bV+YlEh2b5013yH
 5C4krNYpPOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GudAAKCRD6PaqMvJYe
 9cw3D/0Yqk1LwxdZY7MhaT6rNyfJMQZK3yTV2MMIA3KuOsVlwbAt9laTn0yo+iUffJTg6Vk06KG
 bkMIu4agYIWvF+MVCTNi3Gp+YzOkK13Ftc0MYNfoOByYZjN6T5W1dfRmpG59J10/ERz+rlqf5rC
 4Hmx9wxOOts7TGjtwgGzrn0L8hLDrUlFxgv88KEMQJAGRn9PbanhtXx27xVEOCXastW7kP6fw2g
 EkztfNa2eVuWYE2bIOxtn5Ckzz+6AfnGxHJc/f6YWa73UiJTQetDiJYJAPl/4wmzqLHY6F6g5s4
 8KqsIuEev/pyCsAciKZNm6J8lY1zfzslmlbQX3yRlCeVCT8riXw7g5JLxfp3GLqC/I7D3pnPVM0
 Tl4kQFRBgUD9zi/Pna5clwQAujcTLxoAzY3NkRKUlhUyihpwEv6ho1ub6BWnPvdLAw2o8MWXEB7
 7dh/sqZL6zS6ZqAW94EIxYZrPdUJ2X4Zr0EAorFtAdU1m45tpO8cm4s0V5QSISjSukxMDjFNE7e
 q7w94wrGNy4IEIPGa+B5eGWH1VSwiAqFS0vPrQIsz5uOJyF7tCEE+GuEO+NYZmLxjjTv1Wobz8t
 LY3K+iVn1n0/57clmJY1qWvAH0OeusO/o9DawsAjMTcGxHxTqxwhLXUomcjGInRZerWr3EnVAY4
 eX5J9agJoFdtzMg==
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 12d8be3fd579..4f97c483fd4b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1828,6 +1828,50 @@ csi41isp1: endpoint {
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
+			};
+		};
+
 		isp0: isp@fed00000 {
 			compatible = "renesas,r8a779h0-isp",
 				     "renesas,rcar-gen4-isp";
@@ -1996,6 +2040,35 @@ isp1vin15: endpoint {
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

