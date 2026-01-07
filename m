Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BD3D0054B
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 23:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70DA210E65F;
	Wed,  7 Jan 2026 22:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nabladev.com header.i=@nabladev.com header.b="Snhx864w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 338 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jan 2026 21:41:32 UTC
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A2210E228
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 21:41:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6A21210D649; Wed,  7 Jan 2026 22:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1767821752; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=fy9APZzqEAIRSyeUxmDLTgDS8ZnQVE9HBWckGtI8aTk=;
 b=Snhx864w7UQNhCIosd2P/2oy5jI2xUnksS5iQSHRrtPDrUyKPzcRcVgEQ6sIpSc9ov2mnU
 6yzpY7SCEZLAoB1kP6drNxHP58fGyYKzQnf2ESKwXeowMr/YF9vs3XHHLBrOe+BazpY9my
 KdeqTEdOI57Jbd7NaLYSrD01MdiYZ9Jpa85GnXAjdyqYQwOQH0HR/0nKi13YkmE8wXu0/J
 taJ66dc4Zco1+ZSYAtSxZVEYvVIIiv45IdxRs1mkuzWvmdc0oNLlHIHUAKp2bKrkybvC+z
 W/QBEPUydp8xJttU9SxgfegexCQxXSuMAUzgT5VsrpX+Q4FP1CjolOH9xUrJnQ==
From: Marek Vasut <marex@nabladev.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: bridge: tc358867: mark port 0 and 1
 configuration as valid
Date: Wed,  7 Jan 2026 22:35:21 +0100
Message-ID: <20260107213546.505137-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 07 Jan 2026 22:35:42 +0000
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

Current binding document enforces presence of either port@0 (DSI in) or
port@1 (DPI IN/OUT), with port@2 (DP out) being optional. This bridge is
capable of DSI->DP, DPI->DP and DPI->DP, it is therefore perfectly valid
to have both port@0 and port@1 described in the DT, because this is fairy
standard DPI->DP configuration of this bridge. Replace oneOf with anyOf
to cover this configuration.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
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
 .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
index 70f229dc4e0c4..75804114f71f7 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -115,11 +115,11 @@ properties:
                   enum:
                     - 0 # No pre-emphasis
                     - 1 # 3.5dB pre-emphasis
                     - 2 # 6dB pre-emphasis
 
-    oneOf:
+    anyOf:
       - required:
           - port@0
       - required:
           - port@1
 
-- 
2.51.0

