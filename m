Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4CA9AE1F2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 12:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABFF10E8EC;
	Thu, 24 Oct 2024 10:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HSXJrohl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE24010E901
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 10:02:34 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 856B6C3627
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 09:55:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E355840005;
 Thu, 24 Oct 2024 09:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729763744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=re3k969/SlvgwROLTlKKLvNJkp+Z9Z/HnVPkdFKy4V0=;
 b=HSXJrohlUgJJIsTUV1WUUKYrcz1hc6hgvNNTHiLerynqwjMmPaFJJ85vQgO0b9m7ZOZr6w
 uhQ3lJC5eIGgpogpUccKQ+zSMNvkldQqUjTQuilGbp01Qrv74hayRMkPtOGXgCctEOz2wT
 1dCApNsZ6jHgm1JJz54f25So8fviiujexGIXEz5bQQKS/31mTO7PpUPH+T//COV4qY6mAq
 7uWxQLP8QG7tITqcv5AcrTclk94ixSjVFZn9MwPkMG2Gf5Az9z1c8kNgCqD4AK6Q7RwiH/
 84dBA1vVKzsIIZ13u7iirPNLYuh2o4/WsAyh/uEYTgt3BxxD8xFdd79C1dIn9Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 1/2] dt-bindings: display: bridge: sn65dsi83: Add interrupt
Date: Thu, 24 Oct 2024 11:55:37 +0200
Message-ID: <20241024095539.1637280-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241024095539.1637280-1-herve.codina@bootlin.com>
References: <20241024095539.1637280-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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

Both the TI SN65DSI83 and SN65DSI84 bridges have an IRQ pin to signal
errors using interrupt.

This interrupt is not documented in the binding.

Add the missing interrupts property.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 48a97bb3e2e0..4505d2d83e0d 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -35,6 +35,9 @@ properties:
   vcc-supply:
     description: A 1.8V power supply (see regulator/regulator.yaml).
 
+  interrupts:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.46.2

