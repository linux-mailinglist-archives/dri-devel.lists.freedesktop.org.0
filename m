Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBE791DACD
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 10:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8076810E220;
	Mon,  1 Jul 2024 08:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="DpSuTj6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4911510E220
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1719824361; x=1751360361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DfE31lfEgRnoFJg6fQzfDa/OyUkDiQn244MEDxgDLrs=;
 b=DpSuTj6iTt57A2rV5K0a1P99RnrhlxmzkUGeK0qoTrzx3uMmKppWmZLl
 XHET4v0LPJy+UgXUUm1vY92E11HO5fLFVk/nC9QxyxHN8CbL33OB04QhS
 r4fD5s0VPeilMrcHynqUJaDDQ9bGEX6HamHvdULuScPcrS++3et5mzMZ3
 DrRljJUQXUzJvYwtFIB4Bdvmk4Sz84oPNX0ggYRHKdmRKmMSNZaQbdl/X
 A39XaIvdFphM90PeGk30Rq0K3PVXzqOuXgvp6gzDC3xz5GBSIyaeRAZYF
 Tkzmqxlui19YiP86pdLS8IDNDCdWQ3nOsFG/u+zJEWuh8wSyikzJ7qeKL A==;
X-CSE-ConnectionGUID: 8eku2F0lT8uAGkGJJbQhew==
X-CSE-MsgGUID: HaoblIqpQPWoJzJh+lCk1A==
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="31278294"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jul 2024 01:59:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Jul 2024 01:58:52 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 1 Jul 2024 01:58:45 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <megi@xff.cz>, <javierm@redhat.com>, <neil.armstrong@linaro.org>,
 <quic_jesszhan@quicinc.com>, <sam@ravnborg.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, 
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: display: himax-hx8394: Add Microchip
 AC40T08A MIPI Display panel
Date: Mon, 1 Jul 2024 14:28:35 +0530
Message-ID: <20240701085837.50855-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240701085837.50855-1-manikandan.m@microchip.com>
References: <20240701085837.50855-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add compatible string for the Microchip's AC40T08A MIPI Display
panel.This panel uses a Himax HX8394 display controller.
The reset line is not populated and leads to driver probe issues,
thus add conditional block to narrow reset-gpio property per variant.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
changes in v2:
- re-order compatible string alphabetically.
- Add conditional block to narrow reset-gpio property from required
list based on compatible string check
---
 .../bindings/display/panel/himax,hx8394.yaml    | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 644387e4fb6f..75ccabff308b 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -15,14 +15,12 @@ description:
   such as the HannStar HSD060BHW4 720x1440 TFT LCD panel connected with
   a MIPI-DSI video interface.
 
-allOf:
-  - $ref: panel-common.yaml#
-
 properties:
   compatible:
     items:
       - enum:
           - hannstar,hsd060bhw4
+          - microchip,ac40t08a-mipi-panel
           - powkiddy,x55-panel
       - const: himax,hx8394
 
@@ -46,7 +44,6 @@ properties:
 required:
   - compatible
   - reg
-  - reset-gpios
   - backlight
   - port
   - vcc-supply
@@ -54,6 +51,18 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            enum:
+              - microchip,ac40t08a-mipi-panel
+    then:
+      required:
+        - reset-gpios
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.25.1

