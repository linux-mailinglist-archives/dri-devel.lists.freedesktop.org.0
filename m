Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381D2027C7
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 02:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384AB6E3B7;
	Sun, 21 Jun 2020 00:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5C86E3B7
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 00:48:08 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32E2C532;
 Sun, 21 Jun 2020 02:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592700485;
 bh=x1qwEsYa9TpzZ3jxVEYrdT2VvcD4ES6ffAolj8MmeqY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qtB3Ee6X9zOTt21KJnwGgigCzH01hRSJbIYTM4AvS/tF/q959RIj35J+IZeJ83Niy
 84UMJY4wsaMf9HjfCZEopuKS4FLfquurxgaW95MxLxJCdADqyiMOIyqmJMNYa0+J3j
 czBaBHCSHRdDueax1IseNyH5Ob9sTAL3+UqyYJ9c=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 6/8] dt-bindings: media: renesas,fdp1: Add resets property
Date: Sun, 21 Jun 2020 03:47:32 +0300
Message-Id: <20200621004734.28602-7-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
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
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The resets property is used in DT sources in the kernel tree. Document
it and make it mandatory.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes since v1:

- Fix typo in commit message
---
 Documentation/devicetree/bindings/media/renesas,fdp1.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
index 39184bd21a27..2a27a7296fea 100644
--- a/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fdp1.yaml
@@ -32,6 +32,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   renesas,fcp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -44,6 +47,7 @@ required:
   - interrupts
   - clocks
   - power-domains
+  - resets
 
 additionalProperties: false
 
@@ -59,6 +63,7 @@ examples:
         interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cpg CPG_MOD 119>;
         power-domains = <&sysc R8A7795_PD_A3VP>;
+        resets = <&cpg 119>;
         renesas,fcp = <&fcpf0>;
     };
 ...
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
