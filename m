Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1D752EBE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF5C10E7BB;
	Fri, 14 Jul 2023 01:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C3710E7AD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1CA161BE0;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1046AC433BF;
 Fri, 14 Jul 2023 01:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298687;
 bh=iLhpUF4pLTJLc882q+rJQiASC5xWtAhQ8T/pxZjp7tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rLtHx7JrF9wloqIQ/DokGpWO7b4r78X7GtVZP6Nu2yi8KzLdf5R8sP8AFBkfJ5Lr7
 uWZ6GLYD/usCVxCZdeqFu0wrlvYrusYn0gO5bp1MLC4WOXuyXBqonN7Akvue9+66OC
 KsHyDZ7M8Z7dOjHPGHpARg6G7gjSgEAFRmvpeX7JqaetY/CywJcSSNowcezNgFgSib
 KR04oy0xVif76KzPM7GNsduYlQyQ2zqZV+xF5mzuInp7GhfSP0aeHG2TI+9UG4Chb6
 VfaP8Oai58MU26ueBvgxvJgm59652lG6jCyX8v+vcPChNaX+/tiWUXL1+PRw+Fjos2
 TRLTmWIDhVhyw==
Received: by mercury (Postfix, from userid 1000)
 id EE20D10676F6; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 14/19] dt-bindings: display: st7789v: Add the edt,
 et028013dma panel compatible
Date: Fri, 14 Jul 2023 03:37:51 +0200
Message-Id: <20230714013756.1546769-15-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Miquel Raynal <miquel.raynal@bootlin.com>

The ST7789V LCD controller is also embedded in the ET028013DMA
panel. Add a compatible string to describe this other panel.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../devicetree/bindings/display/panel/sitronix,st7789v.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index 75e935f0547b..9f4157b02b84 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -16,6 +16,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - edt,et028013dma
       - inanbo,t28cp45tn89-v17
       - sitronix,st7789v
 
-- 
2.40.1

