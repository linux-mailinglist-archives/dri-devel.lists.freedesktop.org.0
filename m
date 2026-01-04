Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA2CF1577
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 22:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9127410E0F6;
	Sun,  4 Jan 2026 21:35:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Q0WJgdi1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Nq7dANlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB7510E0F6
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 21:35:06 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dkrLc5jSVz9snt;
 Sun,  4 Jan 2026 22:35:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767562504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rrUYwgrFVp1xDLQypda1U7/xuH0PMYfbXrKNuiEWFzQ=;
 b=Q0WJgdi1c8Bu3C69bFWW3Nb+Uma9Dduxe9ijgcHB1dUzjvXHVTzmQ1PsVyrR8Rvpli/699
 O6TjbvZ0NRmQ3gj/vazVxEu7G0ohxJVSTGRvOa5kiSvBIfNaNjchKDyUvnJUq75pSfEU81
 589Zuk4P60Lq6WQhAjLLZcqNl5kzY8KWMJvzQXgDEM+YvP2zA4xkMEKYYLytONcE2rxa/U
 WCQRi9RpnVj5QU8WQzJHkNcqFGYva9tavEJrZPQGbCbqO6khuEXzNlIl4UFqIl8q4Qedoc
 PkbMtdgrKITLias96wG1zi8rtQJQ10GRP30dMqAJ41U/dxyiiRkSiZGyJZedRw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767562502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rrUYwgrFVp1xDLQypda1U7/xuH0PMYfbXrKNuiEWFzQ=;
 b=Nq7dANlCWo5FfI/SSPJBHcxYLPnsggd08B29JF3hUac921Tk++Je2f91fbmGO+3XSjV396
 zABbG4pOhRaAxAT4Rrv69ZcSqTjWGMWp0jhF/vhevCGDjXmJvQ8Xawdsi1slizlYZ9AGJs
 XhSvBLqx11p6WNLgDcvqjYkVLzOzicO04sjXIO6ZpajWVRbEzQtH6vAxOJ0mkHmS9MScwz
 jaG0MXNVQrh9t/svCQW4vXWoL/KzIHkacLR5pU1f+5uA8Gwt19Bs1qBkZ2hgXOSCPl3d3q
 KfJUGiY5rniAjR535ucedX89joupM3jrjeoTjeBGBDI2rbCGGoinGLgr0Y+naw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: bridge: ldb: Add check for reg and
 reg-names
Date: Sun,  4 Jan 2026 22:34:21 +0100
Message-ID: <20260104213457.128734-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: sq7y4gpf6t1efmcr8ohft8b4xqwhjk3w
X-MBO-RS-ID: 23d73df06f66d33f65e
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

Make "reg" property mandatory for all LDB devices and "reg-names"
mandatory for i.MX8MP and i.MX93 which have two "reg" values. The
i.MX6SX has only one "reg" value so the "reg-names" property there
is optional and not needed.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 .../bindings/display/bridge/fsl,ldb.yaml           | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90df..197ae2f2dd36c 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -59,6 +59,7 @@ required:
   - compatible
   - clocks
   - ports
+  - reg
 
 allOf:
   - if:
@@ -73,6 +74,19 @@ allOf:
         ports:
           properties:
             port@2: false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: fsl,imx6sx-ldb
+    then:
+      required:
+        - compatible
+        - clocks
+        - ports
+        - reg
+        - reg-names
 
 additionalProperties: false
 
-- 
2.51.0

