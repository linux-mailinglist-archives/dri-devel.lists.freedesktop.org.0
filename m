Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F3586BCF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 15:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF32EB4571;
	Mon,  1 Aug 2022 13:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15256B218B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:18:06 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0184384488;
 Mon,  1 Aug 2022 15:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1659359885;
 bh=7u1j7bRHd+HUoYk010/j4ga0au7FJj/EVBZkBw4gTMQ=;
 h=From:To:Cc:Subject:Date:From;
 b=fK/E5KSxDerRpzmgY5dilY4OpNdzj4Bwz1l2oeRy7ETJfciIaql/zcSxLytsCtI7E
 yG5avFe2FV9oZ38kWoUWfs0xYryBhrG3VVzjkOqdgdVXhwjeLrkWzdK2y+18DD6c7K
 bQcdZqmryTERSIohCYYSUaN5nDzxNKwjHmcKVumL5L4FF7quqsGA54xYCviMe2O3Am
 8/L/24yaWsCgPci3tIk+P/x4ZCVjnOuqvLnAXo9uWKTUHZG+AiM94QzKZDMHwcSIYB
 qRgZrlmnP5ViJcTtM7zdc0XKpKEpmq1cu8YP4DHsykHKK3q+q8+02ew2GUBTEiIGk+
 lRqNj3lUUrEwg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Add support for
 external REFCLK
Date: Mon,  1 Aug 2022 15:17:46 +0200
Message-Id: <20220801131747.183041-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
 robert.foss@linaro.org, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ICN6211 is capable of deriving its internal PLL clock from either
MIPI DSI HS clock, external REFCLK clock, or even internal oscillator.
Currently supported is only the first option. Document support for
external REFCLK clock input in addition to that.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/bridge/chipone,icn6211.yaml         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
index 4f0b7c71313c3..18563ebed1a96 100644
--- a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
@@ -24,6 +24,15 @@ properties:
     maxItems: 1
     description: virtual channel number of a DSI peripheral
 
+  clock-names:
+    const: "refclk"
+
+  clocks:
+    maxItems: 1
+    description: |
+        Optional external clock connected to REF_CLK input.
+        The clock rate must be in 10..154 MHz range.
+
   enable-gpios:
     description: Bridge EN pin, chip is reset when EN is low.
 
-- 
2.35.1

