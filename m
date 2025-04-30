Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8077AA455A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 10:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C7310E702;
	Wed, 30 Apr 2025 08:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="PPVjllzf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA9810E706
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=+sziV7MF8+jBwSYemNEdogvFX2m4sp7ZLD0VYElL25s=; b=PPVjllzf4GOZ8Kuc/PW/d8MSh7
 TrGmSYLm0P0ko9zBkUBXv+9YehlBs+HOk1tn9e7iXgPAP0GWIi0QG7rxAAgsYt2SbLiLQvwvEl6Nk
 oXYJ5AXHV1F+N5AoEUXeTluJb2HkmRuRGjRgTgqgsKUFT/nK8euPbYsXbpz4Y4wVmV2PmxJdJkqG8
 y4QxjVfJbcgThgKwR6LE2A7I8OVQIxw8gxiMaE096KRW54aqgzL+Vdoo+TIdBIPXle34BMvcBrTGH
 dc9MvV3LTFSQaW1wxYLYQDkmhwgp4NYL8/048dJdlrP9QWE2rdztbrnC6pmxFp+Oe5Z4qeJVph/ge
 DCCK91mA==;
Received: from i53875ba4.versanet.de ([83.135.91.164]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1uA2oX-00032E-1q; Wed, 30 Apr 2025 10:29:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de,
 heiko@sntech.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/2] dt-bindings: display: ltk500hd1829: add port property
Date: Wed, 30 Apr 2025 10:28:50 +0200
Message-ID: <20250430082850.244199-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250430082850.244199-1-heiko@sntech.de>
References: <20250430082850.244199-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The panel can be connected to via graph nodes, so allow the port property.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
index af9e0ea0e72f..b0e2c82232d3 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
@@ -22,6 +22,7 @@ properties:
     maxItems: 1
 
   backlight: true
+  port: true
   reset-gpios: true
   iovcc-supply:
     description: regulator that supplies the iovcc voltage
-- 
2.47.2

