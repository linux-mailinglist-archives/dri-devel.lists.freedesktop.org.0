Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA7D2DB6BE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 23:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465CE89581;
	Tue, 15 Dec 2020 22:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C006893EF
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 22:59:40 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E28C6593;
 Tue, 15 Dec 2020 23:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608073178;
 bh=xoMtxA949fF+Ll5x4NfZx06ethoLb3wfdTfzB+Y8pwQ=;
 h=From:To:Cc:Subject:Date:From;
 b=K++9MclYfP+vJv+nB01CAQxwJ/YTX5vZFTmnfdhf4LN+tMs+u4T/UbKyePf/Ie4xp
 xt+u+nOTkXbj2RzObZwXSnAXBm5vkXYzNizlotd4jpWyr26mR1GGAxtnmfStU3lfjS
 MQlvFSrXU3OnCtK87lQANQY5b03u2PQ0NinpXci8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dt-bindings: display: bridge: renesas,
 lvds: RZ/G2E needs renesas, companion too
Date: Wed, 16 Dec 2020 00:59:27 +0200
Message-Id: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Document RZ/G2E support for property renesas,companion.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Slight reword of SoC list in description
---
 .../devicetree/bindings/display/bridge/renesas,lvds.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
index e5b163951b91..7eddcdb666dc 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
@@ -83,9 +83,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       phandle to the companion LVDS encoder. This property is mandatory
-      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
-      the second encoder to be used as a companion in dual-link mode. It
-      shall not be set for any other LVDS encoder.
+      for the first LVDS encoder on R-Car D3 and E3, and RZ/G2E SoCs, and shall
+      point to the second encoder to be used as a companion in dual-link mode.
+      It shall not be set for any other LVDS encoder.
 
 required:
   - compatible
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
