Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA582CF63C9
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 02:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9C510E227;
	Tue,  6 Jan 2026 01:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="LyI+8Hsf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hDjXAa96";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A19710E227
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 01:22:45 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dlYLp5Zpwz9tDP;
 Tue,  6 Jan 2026 02:22:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767662562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gYOvgTRJ9OleuezPee58sgiUX/W+ALbrJws4bNLI/QM=;
 b=LyI+8HsfCMnXDdEz+9jylMAesPiSCkM2GGlY0bHBbaUKZN6oStDrL/j+lXWuLE6RTGR9PI
 1QgkYPuCTNlZ9NMI8EUnH098vGOeyzPJtegLktGC2CtjVKwaGY2EshdDsIdPjiv903EppL
 FLCDQkbjZNB7hHo9aYxkNZe1OIfE5rYV1G22jWa0izOajSi+Bj3HD0RQPIJ84xM5JJnwL9
 WGFmgRB3KM60enfZxG06FRIYFmxVPSq0b9ArJ41u9+UkOb0NOFbwtzTOk4MMVTBTKOaQCw
 hI0o1u947NT8R6WtB0i+kihJT3OVG2DSdrSyPOmyDPco1cASE75TDL6jV4QOAg==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=hDjXAa96;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::2 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767662560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=gYOvgTRJ9OleuezPee58sgiUX/W+ALbrJws4bNLI/QM=;
 b=hDjXAa96+QSQzl/DPAcDLWUmMoSC298w59LEbG4znjBzwudEcr2RMwaFFrAKLvFBu/vCAq
 Xo8GrsaNA3dLCiAvvisZfGfUzDJZyJSL9fopuVBm/K0ff2BuE/so4x3iOlXR8UAjqmPHfL
 qvwBnG/pgnrV1CQOL8Jsg8C549WNVsA4nSg9+RiFyP1ZGybqEvF1yZ9ArRMv5GNbP4FfTZ
 ekcBrR2j5x6GpL6XXmtxHdZtlDGI+3EK8F2tZG6MoFmXAclN92PNvq4fGO15MwrROTPFCo
 MCkmWQIxstgLjHCKtfkOyKLAyJ6C3PvGnRIi0WfDcRAUug7hvWXua1HEBBRT5Q==
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
Subject: [PATCH v2] dt-bindings: display: bridge: ldb: Add check for reg and
 reg-names
Date: Tue,  6 Jan 2026 02:22:20 +0100
Message-ID: <20260106012236.295834-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: bm4ik5bkgtsdhuio3uc7qmy7tdweh9ma
X-MBO-RS-ID: d684859267e0f6d19d8
X-Rspamd-Queue-Id: 4dlYLp5Zpwz9tDP
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
V2: Include only reg-names in the required: field for non-MX6SX
---
 .../devicetree/bindings/display/bridge/fsl,ldb.yaml    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90df..49664101a3537 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -59,6 +59,7 @@ required:
   - compatible
   - clocks
   - ports
+  - reg
 
 allOf:
   - if:
@@ -73,6 +74,15 @@ allOf:
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
+        - reg-names
 
 additionalProperties: false
 
-- 
2.51.0

