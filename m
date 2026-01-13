Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 987F2D15EC6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 01:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC7810E11D;
	Tue, 13 Jan 2026 00:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uMF0s+UK";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UDmx9jM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FED010E11D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 00:07:28 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dqqLl06Zdz9sqQ;
 Tue, 13 Jan 2026 01:07:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768262847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2pTxnpKtVagF5+gCjQtKJ1gRyYFDd8W2XyMeI2ZD/XA=;
 b=uMF0s+UKdHBLvQliR0o8jop9QNhzxsgjXqwQzCDmGXrjIUz6MU2ntZTCwUzLFa60vJ3jND
 orq2r3rvmj4CvB5J6tRShFpcLzYKYYQ/PkDJluGJGuPGAXniHmgmMM33O4eoJXxZ2qbKdH
 KeMMouKKMkXfUBku6N+uO3nN9ScbArnChnbm2+ApZ55OlXZT3nDyb+9eHHYT7AdqkeSh8a
 N9lph3uIMzkV0nVaBgBwITAuM3eJE5WOtBG/nIeHXyC7FpLhcwBJxu/fhKHdmNu63BxUKW
 v0VdYt/kZgX1fHBF7CQxefKpTZy09IcHOildaixoD2tAS5UlU+2kDQWeaFQ83g==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=UDmx9jM0;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org
 designates 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1768262844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2pTxnpKtVagF5+gCjQtKJ1gRyYFDd8W2XyMeI2ZD/XA=;
 b=UDmx9jM0pT1R3d8WCVWuqA/0vfoLwdisqPoMEgFrq5oN1+az1HYet/kZwNTU/8qzVB+VLE
 2AbKMshA29uDu7rWRf2o4sMaytuR3I8vhlgLuP6pA5IfXj5WjIwO/W1Xch2oNuCAI+3j4k
 BEPCypmtEo2+3vde3YJT9yzvSobWbEW4Ev8whx0wfif7GX6WmAzXUlYBdz0zS5rqKz+Ls8
 zdnHDu2xfCkfPwr7qGMwZ7yI4VYOl0jXtKm7EIeeKv/I/NthBnNoyDvXbw9Wao+1R7FAz5
 4QKrCt3YnHbrGihvXB+L+FOGYZqL6HUNWhQpFnvrxxiPSg9IhwmXC4+86/4tBQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels into
 separate document
Date: Tue, 13 Jan 2026 01:05:30 +0100
Message-ID: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9tpdposorz9wu4i5rnpdtenewup5u5wd
X-MBO-RS-ID: ed51021b6f7a264a3dc
X-Rspamd-Queue-Id: 4dqqLl06Zdz9sqQ
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

Move the Waveshare panels description into separate document, so they
can be properly described with compatible = "waveshare,...", "panel-dpi"
and attached to "waveshare,dsi2dpi" bridge.

While these panels are described as DPI panels, they are generally part
of a larger unit in non-removable metal casing, so the actual internal
configuration is not known. It is likely that internally, those panels
are LVDS panels, connected to ICN6211 DSI-to-DPI bridge and then another
unknown DPI-to-LVDS bridge.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../bindings/display/panel/panel-simple.yaml  |  4 ---
 .../bindings/display/panel/waveshare,dpi.yaml | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index e4a5b30ccfc93..62bfc3f4fee14 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -335,10 +335,6 @@ properties:
       - vivax,tpc9150-panel
         # VXT 800x480 color TFT LCD panel
       - vxt,vl050-8048nt-c01
-        # Waveshare 13.3" FHD (1920x1080) LCD panel
-      - waveshare,13.3inch-panel
-        # Waveshare 7.0" WSVGA (1024x600) LCD panel
-      - waveshare,7.0inch-c-panel
         # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
       - winstar,wf35ltiacd
         # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel
diff --git a/Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml b/Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml
new file mode 100644
index 0000000000000..40a6a8e98cc33
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/waveshare,dpi.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/waveshare,dpi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Waveshare Touch Display
+
+maintainers:
+  - Marek Vasut <marek.vasut+renesas@mailbox.org>
+
+allOf:
+  - $ref: panel-dpi.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - waveshare,13.3inch-panel
+          - waveshare,7.0inch-c-panel
+      - {} # panel-dpi, but not listed here to avoid false select
+
+  height-mm: true
+  label: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  width-mm: true
+
+additionalProperties: false
+
+...
-- 
2.51.0

