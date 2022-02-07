Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0694ACC1F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 23:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966F810E240;
	Mon,  7 Feb 2022 22:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-94-112-206-30.net.upcbroadband.cz [94.112.206.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB6110E240
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 22:39:17 +0000 (UTC)
Received: from newone.lan (_gateway [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 1F7AB20056;
 Mon,  7 Feb 2022 23:39:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1644273554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Hrv0q5degBZRzHJi8zdFvUy/sNS40DZBw0W334KX7A=;
 b=EAqJAHwNgILhLHYMb9SluOMd9N15lijee22r39HTUjFFKr0sihX1cU4KzeFApt9AaTL5Bu
 BbuP17zjfIdfkOLSIfil6+5HsL6j3GxbeJKHhUzJD6iwYDlLAI9XmjOvTWI2VXO7t7zayU
 ZI1mHimlr5ut2gVwKiVtX4HrZQPWx8E=
From: David Heidelberg <david@ixit.cz>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2] dt-bindings: display: bridge: document Toshiba TC358768
 cells and panel node
Date: Mon,  7 Feb 2022 23:39:11 +0100
Message-Id: <20220207223911.97180-1-david@ixit.cz>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 Dmitry Osipenko <digetx@gmail.com>, ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inherit valid properties from the dsi-controller.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
v2:
 - added $ref ../dsi-controller.yaml# instead copying properties (Dmitry)
 - additionalProperties -> unevaluatedProperties (Dmitry)
 - example dsi-bridge@ -> dsi@ (Dmitry)

 .../bindings/display/bridge/toshiba,tc358768.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
index eacfe7165083..3bd670b8e5cd 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
@@ -77,7 +77,10 @@ required:
   - vddio-supply
   - ports
 
-additionalProperties: false
+allOf:
+  - $ref: ../dsi-controller.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -87,7 +90,7 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
 
-      dsi_bridge: dsi-bridge@e {
+      dsi_bridge: dsi@e {
         compatible = "toshiba,tc358768";
         reg = <0xe>;
 
-- 
2.34.1

