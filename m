Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA4F1D232F
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 01:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FD56E24B;
	Wed, 13 May 2020 23:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6319A6E24B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 23:39:21 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B5B051F;
 Thu, 14 May 2020 01:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1589413159;
 bh=Y4DkRn61MRzCqseOA2AvGHrf6l1DWCHhlqOe6q7877g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u6BcbwgkG7abAaZe/WM+2u7yklF6pmVqsjvc9eyIHnljCV9Z8bOsxcS8Ybj2/ANZw
 2zNaHzj0v4GPH2kfSS59VIoDsOywMbSHOFLrdLX5kEadzpxUeJTSjZYiureiTYUOUH
 ON7S/vucRTrFNupM1oG75K3wK1QazlDsgqKhIko4=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 6/4] dt-bindings: display: renesas: lvds: RZ/G2E needs renesas,
 companion too
Date: Thu, 14 May 2020 02:39:08 +0300
Message-Id: <20200513233908.23629-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org
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
Changes compared to RFC:

- Rebased on top of YAML conversion
---
 .../devicetree/bindings/display/bridge/renesas,lvds.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
index 33c06630a2dd..1045f0e33f2c 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
@@ -81,9 +81,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       phandle to the companion LVDS encoder. This property is mandatory
-      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
-      the second encoder to be used as a companion in dual-link mode. It
-      shall not be set for any other LVDS encoder.
+      for the first LVDS encoder on D3, R-Car E3 and RZ/G2E SoCs, and shall
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
