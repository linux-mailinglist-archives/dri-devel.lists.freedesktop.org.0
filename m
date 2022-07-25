Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A709C580189
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CE3BFF82;
	Mon, 25 Jul 2022 15:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76424BFF7A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:17:25 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5684C840F9;
 Mon, 25 Jul 2022 17:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1658762243;
 bh=s/nvNtWsvkUUPVDwDBds48qJRMI131j7hYdOlu7aNOE=;
 h=From:To:Cc:Subject:Date:From;
 b=WtlffziDyMWe39qf1WYglJgjNPZWAEN2DxPkRO3z/lxyIjsqpQcdiYK8R4rExLVcN
 MrN3dobXBDe4wav9teBIzSKEd7smWWmOVCia0DALHoeSWpehRNi4JJkUyshz03oQsS
 MF3io9IeQxBpPzH7ZnrfhKEJ+jyGMu9es1VcwU5b/yMYpI6hlBAzZHcj40W4WcowcL
 vBpPao+W0NtOo6jI7wrt3N9O6NhEGQmrcx2/woocfoo4/ZzpwRUXdNV66fkCLMm9Ly
 7bL/M4eC7bS4ieBYmuvqk8hrJ+QG4ePNs4p7Z1cczxdXVBofXU6oPmS5ypdQSm+Fpy
 J42kJPXI2j3JA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: panel: sitronix,
 st7701: Add Densitron DMT028VGHMCMI-1A TFT
Date: Mon, 25 Jul 2022 17:17:02 +0200
Message-Id: <20220725151703.319939-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible string for Densitron DMT028VGHMCMI-1A TFT matrix.
This is a DSI-attached 480x640 2.83 inch panel.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/display/panel/sitronix,st7701.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
index 6dff59fe4be14..34d5e20c6cb32 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
@@ -17,6 +17,9 @@ description: |
   Techstar TS8550B is 480x854, 2-lane MIPI DSI LCD panel which has
   inbuilt ST7701 chip.
 
+  Densitron DMT028VGHMCMI-1A is 480x640, 2-lane MIPI DSI LCD panel
+  which has built-in ST7701 chip.
+
 allOf:
   - $ref: panel-common.yaml#
 
@@ -24,6 +27,7 @@ properties:
   compatible:
     items:
       - enum:
+          - densitron,dmt028vghmcmi-1a
           - techstar,ts8550b
       - const: sitronix,st7701
 
-- 
2.35.1

