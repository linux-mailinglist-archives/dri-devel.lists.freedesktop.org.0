Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062969E578B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761D710EE7B;
	Thu,  5 Dec 2024 13:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QDcIQTpI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E69F10EE7B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:45:41 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 774472B3;
 Thu,  5 Dec 2024 14:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733406312;
 bh=qoTsg3vndyaPE/uVLOmVNadi0lVmr7QYIfbec2DlMKc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=QDcIQTpI26NEcgMaCWYakp4o+FHIUB1u3FhguEl+zZ0lBaFkvBOLv4E7wK5+oEOEa
 jJC0LEHyvf5mgr+TetLl6Kt4xRn81YlDE1MHYhGr+AxBjx5tfQK5NVPOukDIm6dyPh
 uXsb14VvzS3MflZnfkSMRf2gfGb4klQ7A558nMWw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:45:03 +0200
Subject: [PATCH v2 08/10] arm64: dts: renesas: gray-hawk-single: Fix
 indentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-8-42471851df86@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Us/qOVaconodKiCI/8cMfuQCvz6NZT6cEboixpCmzug=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa50VCq39RfrqAvgPMh8IWT5NJwBWYlDgLM2U
 ZlMuBxaMoaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GudAAKCRD6PaqMvJYe
 9VLfD/wLsXlwdAsjP+Z83i54Pqtnz1S8ievnRw/TnUf0dqhknxnxVHdJQ9bcLdwChclkDlVFWOv
 vQFQjQP/CPd8xOKNTqflSLrtJGXG9ulQY83QI5NJYUF33Lz8hJNZlRpmRuKOJtrLU9gc8xWreH3
 xu75yfwEugUVlz/BUQ7tv4pK69IF5QWTcz3ofpv4XI5WcXQZ/w+dZQhVePdbrrpqeIzPGeYFpuo
 v0DCJM6uJK2sdbD7w5zV0s+0bXPTMi+d+iJVzMshkrRn7H9EeYga/6QG2ngVvZUHt1mdyLmHHUY
 UQ2bZdbeY9Vde04RgGtr/Kd0I1PU8LLtvcwaNNmv7yRZ1IAsAHmye9D9LUbc3scsex1eYVeWPA7
 Gkhd6s8lu/hs5OinF5XleI71o9B/DbOfp5nqBujDkFeYAOcDG3tgn6DMMgqaVvXwJ9AvmDCUyAJ
 J6+CoAniXQsAQ10mNNzGfE81ONrPAkB99HUH+u2QiCVij8quNgQeURAdOj9CooRMLj1XYAQkFFI
 1TJgSpxUAXFYxBOfTjY66HjUamXPZTEB41gqFVX+3qlr5SuTAk4H87YVn5jL9pVpmqAbW4sSRAC
 nm2MgdOpfT/rup9DV8BrbPVfJuDm7RJci9WaPk44C8h5UyqkKo/o4rkloIxPUZk5RJ5gUZgkDXV
 hQ1cl6LEMQ+UXfw==
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

