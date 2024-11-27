Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 656B89DAF48
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 23:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A0D10E052;
	Wed, 27 Nov 2024 22:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="FIyOGmrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F017910E22C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YDXSwxdQFKqF1c/3avYtLd4G9gMBk0YXaL0G1r3dLXc=; b=FIyOGmrPJwNmk5+OJm7laIa2/Z
 ir0dwoYtdw7FyovDD18pnqGkgveT4ngssKEaznw/AGRyt+LREHf0z5UBb1V+3EsyHAN2juTv4u/xu
 uu0MecOyXO1CFWjKrMQ9hei7Rb25PtLZ0ApM/wJ0umLEL62wjYp0/RyCuGLQIOj8t1Fe8/oWMnU2k
 8g67j2E8ybW8KjwylpZZSfPjfo+XrFdN4BudENEusn255TSLZ2mU4ASs4/jypJeMDENSWRvtcQS4t
 I82wv6s+TrMVO1vfLInB8TaGgZ9BCTZ4zCPomzcN/4nBikuz/XMmvYXu6+w79bZFqmOxilm/RsGVw
 7hsrZklA==;
Received: from [89.212.21.243] (port=49750 helo=and-HP-Z4..)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <andrej.picej@norik.com>) id 1tGFK3-007Rx6-2G;
 Wed, 27 Nov 2024 11:31:03 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, marex@denx.de
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti, lvds-vcom
Date: Wed, 27 Nov 2024 11:30:29 +0100
Message-Id: <20241127103031.1007893-2-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241127103031.1007893-1-andrej.picej@norik.com>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Wed, 27 Nov 2024 22:47:27 +0000
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

From: Janine Hagemann <j.hagemann@phytec.de>

Add an optional property to change LVDS output voltage. This depends on
the connected display specifications. With this property we directly set
the LVDS_VCOM (0x19) register.
Better register property mapping would be quite tricky. Please check
bridge's datasheet for details on how register values set the LVDS
data lines and LVDS clock output voltage.

Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 48a97bb3e2e0..5b2c0c281824 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -58,6 +58,12 @@ properties:
                   - const: 2
                   - const: 3
                   - const: 4
+              ti,lvds-vcom:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                description: LVDS output voltage configuration. This defines
+                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
+                  details on how register values set the LVDS data lines and
+                  LVDS clock output voltage.
 
       port@1:
         $ref: /schemas/graph.yaml#/$defs/port-base
@@ -78,6 +84,12 @@ properties:
                   - const: 2
                   - const: 3
                   - const: 4
+              ti,lvds-vcom:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                description: LVDS output voltage configuration. This defines
+                  LVDS_VCOM (0x19) register value. Check bridge's datasheet for
+                  details on how register values set the LVDS data lines and
+                  LVDS clock output voltage.
 
       port@2:
         $ref: /schemas/graph.yaml#/properties/port
@@ -120,7 +132,7 @@ allOf:
           properties:
             port@1: false
 
-additionalProperties: false
+additionalProperties: true
 
 examples:
   - |
-- 
2.34.1

