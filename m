Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FC764051F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9183510E6D2;
	Fri,  2 Dec 2022 10:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75A010E012
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:56:52 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AC9198C;
 Thu,  1 Dec 2022 10:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669888611;
 bh=+Iw1lIC2DfiPDS7XgR9gAyUsUIEu1mzVmEjS0w/SQ9o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eGrHKJc42GziHTOu1BrdBgO6A8UzeRJrE6t4MlSBEwxk9sopGmb/DzBuKNJge4zMO
 qdwqourkGeJapZvfNva23YEMPjuTZxXzkp70FYfPjZdQY7liTilYCSD9EhHneWq1V6
 i/SSvxNyWTCAf5i63PlqRazfnYsKMjCGr0vd0BnA=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/7] dt-bindings: display: bridge: renesas,
 dsi-csi2-tx: Add r8a779g0
Date: Thu,  1 Dec 2022 11:56:26 +0200
Message-Id: <20221201095631.89448-3-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Dec 2022 10:48:00 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the Renesas DSI display bindings to support the r8a779g0 V4H.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/display/bridge/renesas,dsi-csi2-tx.yaml           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
index afeeb967393d..d33026f85e19 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -11,13 +11,14 @@ maintainers:
 
 description: |
   This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
-  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
+  R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2 mode, with up
   to four data lanes.
 
 properties:
   compatible:
     enum:
       - renesas,r8a779a0-dsi-csi2-tx    # for V3U
+      - renesas,r8a779g0-dsi-csi2-tx    # for V4H
 
   reg:
     maxItems: 1
-- 
2.34.1

