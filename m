Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CB9E6A32
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7619C10F05F;
	Fri,  6 Dec 2024 09:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="v4qXt/v+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF8D10F05A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:33:33 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C25C01419;
 Fri,  6 Dec 2024 10:33:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733477583;
 bh=qoTsg3vndyaPE/uVLOmVNadi0lVmr7QYIfbec2DlMKc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=v4qXt/v+GTI5PruD7kRS7a4CwbdNLyao+Gw9J6h6eHEaGLPbcA19cphlaYI33/7Yp
 HRBXdkFUOLqZSDdcoEb6l2ocOXNjK8Fb+PwSjjpLpN3N4SOCFZXkTfworODmlkExM8
 aIBqeusk6ZzVVPhuzGZjvrZFCGWXJ0Jqm/cgk7VU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 11:32:41 +0200
Subject: [PATCH v3 08/10] arm64: dts: renesas: gray-hawk-single: Fix
 indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-rcar-gh-dsi-v3-8-d74c2166fa15@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Us/qOVaconodKiCI/8cMfuQCvz6NZT6cEboixpCmzug=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTbpe0L8ZLJIEo4PGzXTgWK+jUgVzmpGiY94
 2Y5/tfjJJWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE2wAKCRD6PaqMvJYe
 9aSLD/oDLj1m4/4CIiQF5h1Rl9NYitQ9BSTNqsgCUXxJYisQdfJGFygqoCl2QeOzRGs9qPu1C5S
 TKYS/MV9I5aQAXWBYj85Ei1YOswr78eFOnoPnUA7yvXh4xG6rD1KnQKCx6hko+0iQTtzJlTKC/U
 5OuBAEKiOd/ZQJBOpi+xbmvHXnSNKTYpgi4bduOFKPAgyK3UJeqqVb02UNm6wdpI9csSnx5lIeF
 XzNYdIMJ11g8yyKjQi3XCx4Ii+sTHS08uughr8x7jKd6ou2jn75/KjwPygq0BxLucs9PNJ9jhGA
 6/yS4u4XuTA3lCzlkIvXEzQfmSzOJ6X8SU+z953Id/mqzMcjIot7hhRHV3si5mzkAXOkfr/AdJH
 R5bQMKjGaUMR4MllQoDYa4+NAHhNhz5z98/KTeQ96pNJHPZqxA5ZdYM106dsp0aZNygxOXKqgi6
 w+f58bh0TgPsbr444LzSGgrR4pMh/h70yd2rXifwgRcz40sClWoZTY+X8ws7LjB36F6nH4N/k5T
 8GJYzC0esXwy/nnKWKVHcClIMuqk5d3PvFTAtAhdR+q142RBBP9Eiaoi5T4yD5mcZ6wlxXeHfqN
 /B56OMZEnM+TT9gTWsavoODeFaTqW9SXh2tEsZUP6s4EZBTY5tRe3cMQWUfKRM2MgDKisZ1lbwd
 R9nesxkoc8vxnnw==
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

Fix the indent on the two regulators.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 9a1917b87f61..057f959d67b3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -127,21 +127,21 @@ memory@480000000 {
 	};
 
 	reg_1p8v: regulator-1p8v {
-			compatible = "regulator-fixed";
-			regulator-name = "fixed-1.8V";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-boot-on;
-			regulator-always-on;
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	reg_3p3v: regulator-3p3v {
-			compatible = "regulator-fixed";
-			regulator-name = "fixed-3.3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-boot-on;
-			regulator-always-on;
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	sound_mux: sound-mux {

-- 
2.43.0

