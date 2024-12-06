Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 875749E6A34
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0823710F059;
	Fri,  6 Dec 2024 09:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tp2GQDRe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9BF10F05E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:33:35 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7496E1B86;
 Fri,  6 Dec 2024 10:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733477585;
 bh=CvG5cV3/BnOqrex+A4rcAyfGhlZH/bFpQ2vkN135FkY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tp2GQDReu5U4DRL05ZV8b4Q+uonv6bhZ5TDKrCvQYv2fiM+9Z61f22rxq2W+irKMS
 Y49DeYw6JwygJ5CNYLtXuk0RQFnckGwxCaZI1Bpj1Z05yT3HN5KoSS9tpQUJYVbDbK
 i5ywJZJqcA+F7rNm57zH0IAJvzMN/I98C5l6KXy0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 11:32:42 +0200
Subject: [PATCH v3 09/10] arm64: dts: renesas: r8a779h0: Add display
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-rcar-gh-dsi-v3-9-d74c2166fa15@ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTc5XZMELywslf7WBWEVdil5p0owfGG4R13T
 HeSlKIDmGWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE3AAKCRD6PaqMvJYe
 9R2rEACSTQMlWH3Gwp2utBlwWAd+Dgmu6UVwgqZrout5o2Lqtt2klL57c5v/OTcmM3f2jypO8Pq
 tYvmlvP0vGfH+6gbN5Ld8oUEQohInbZfks7dZB2fVz6UBbVGK1C1fKYGnEzV+ZmzmSnjd6I/qGR
 krrKN6EcpLf16oiMIdEkokzKR8KPDL+JUVfsI6aUuKyhP1UsQ1eeJ2FS4AeyajOujVwRLCih8R+
 vO+G1mNqNsqk6Y5a2lR1dn5MOa2PZb8lqviU3xklx3r51f9NepNFrHkOKt9ruiw9K0yJ7fe9PEn
 quOwf540Mima1Awqb23JMC4NklHjBmtIXPcBhstl2tNXHOyUWGVtOnxGPvcwVakQdpnoies71Qq
 7BWwn8KpwifvD4SjdyJdLulRWni6Tceyp1Hy8ALeDdJAE55e5wflRCBmWqhIOQuc5zBxOhvKxMp
 OlYooIv2QAcy3yPY1G7wfKo8W90OxDrzjpREGURhp4pjlBjZQwOUOXbxxqtYkMtF4NsqdXOi2wZ
 pckZI7B/dlvH/vo7TP5ZKgqRXHhv2bSivRitdWjWJd6RXsQc3eBo4jZVR+aEFK2hW5cFsDPmACF
 X9V0FvCN9XvUNH1SEpmNTp6twqBB94CKq3ysXaRGR0aR3uQW5isF1dqZp76FLILJNsEX0qzL1vr
 wf8FWJkfl7PCAUg==
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

