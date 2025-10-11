Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0EBCF991
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 19:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CC510E33D;
	Sat, 11 Oct 2025 17:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="YD7lKh4Z";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fpp2uCXH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25D10E33D
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Oct 2025 17:04:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ckVML5Ssxz9tH5;
 Sat, 11 Oct 2025 19:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPiyri8B7k2bct+4e5c5xnBcOdZcRZjBPgHNHY8UKtw=;
 b=YD7lKh4Zdf76nSMCJAStIiM4bNPfP83U5mHSGc7jOe8IoG7sEJjLs/hUyPsc28E1gdMCdw
 aSUz5TVuvEwk/5NNlLD3wDiBC6DdB+g5GN3W7x3WBJBCG4hMoWDKuhL9mC1viULyKjOg1/
 xfH2Ncz6xbELzrH13+MUci1zwASXsZjLN3RRsJPBD/mXOOJu+QOj9HIYMTqD5LPJ/rf1Xv
 UqPXHNcFzQ5rD8bOP2d9pwvgmiXeqxALuqiuCqDAWWzXH1WuTM5vqy4HPblLGxz4Zl71cJ
 1KZG1LPu0M0tURJ3uMbjOXZvh20jPE52r8bnpcz8GlVmINHVzCP8Uu7NFRauUQ==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=fpp2uCXH;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760202252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPiyri8B7k2bct+4e5c5xnBcOdZcRZjBPgHNHY8UKtw=;
 b=fpp2uCXHh9XD4JyA5nrRXLCt89JMZD68UW2GptC0MJOAZzUetKaPCyrUniPt6MAQkkeRzF
 nOP85GjwcWMHFAYxLsSlhe2rrwCwC+KDSsj8hWpP/AGPxqwVhNmo/KCBRYqPcA2UaPRBd4
 WEj8An3sdIo22BNhCfL6oe54ng0C0cPNpY/MeWMQseG/NrRtZ+Xqc1nWD5FzxYsg1EU0Hi
 ko7Gw/vc9o5DaoYkWaPwfW/K8Wzl+Cohn9cVSplZiIvwuGQ+aQy6C/CPxv3exPlM7TXgJp
 9MEg+Xsxap9B/jZcP28e4M4SfCf1a0T0gsaC67G7lpipBzv2pXL4EW1rMKgOcQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH 29/39] dt-bindings: display: bridge: Document Freescale i.MX95
 MIPI DSI
Date: Sat, 11 Oct 2025 18:51:44 +0200
Message-ID: <20251011170213.128907-30-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 85zz6hyigpakz4rsiia6ykwknitchfqo
X-MBO-RS-ID: a8076b6bb914c6c52ba
X-Rspamd-Queue-Id: 4ckVML5Ssxz9tH5
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

Freescale i.MX95 SoC embeds a Synopsys Designware MIPI DSI host
controller and a Synopsys Designware MIPI DPHY. Unlike the i.MX93
PHY, the i.MX95 PHY uses more syscon interfaces to configure the
PHY.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 48 +++++++++++++++++--
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
index d6e51d0cf5464..388301c4f95c1 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-dsi.yaml
@@ -14,12 +14,11 @@ description: |
   Designware MIPI DPHY embedded in Freescale i.MX93 SoC.  Some configurations
   and extensions to them are controlled by i.MX93 media blk-ctrl.
 
-allOf:
-  - $ref: snps,dw-mipi-dsi.yaml#
-
 properties:
   compatible:
-    const: fsl,imx93-mipi-dsi
+    enum:
+      - fsl,imx93-mipi-dsi
+      - fsl,imx95-mipi-dsi
 
   clocks:
     items:
@@ -46,13 +45,52 @@ properties:
       controller and MIPI DPHY PLL related configurations through PLL SoC
       interface.
 
+  fsl,disp-master-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      i.MX95 Display Master CSR is a syscon which includes registers to
+      control DSI clock settings, clock gating, and pixel link select.
+
+  fsl,disp-stream-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      i.MX95 Display Stream CSR is a syscon which includes configuration
+      and status registers for the DSI host.
+
+  fsl,mipi-combo-phy-csr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      i.MX95 Display Stream CSR is a syscon which configuration and status
+      registers for the MIPI Tx DPHY module in the Camera domain.
+
   power-domains:
     maxItems: 1
 
+allOf:
+  - $ref: snps,dw-mipi-dsi.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx93-mipi-dsi
+    then:
+      required:
+        - fsl,media-blk-ctrl
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-mipi-dsi
+    then:
+      required:
+        - fsl,disp-master-csr
+        - fsl,disp-stream-csr
+        - fsl,mipi-combo-phy-csr
+
 required:
   - compatible
   - interrupts
-  - fsl,media-blk-ctrl
   - power-domains
 
 unevaluatedProperties: false
-- 
2.51.0

