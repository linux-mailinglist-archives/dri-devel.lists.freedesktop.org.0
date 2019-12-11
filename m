Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3E411A6D1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 10:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462FF6EACD;
	Wed, 11 Dec 2019 09:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C366E1BB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 06:19:44 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c13so1004376pls.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vdhu1Xt9iOedS/Y8YF8BetiFT0tTQ4LeUM36vWZzls=;
 b=JVb+VkabPQpc1d5JUv94Fd3rqHXoQkJurV2AnuXWDyxigkquyeTCTxqAYzFjy9N+Dm
 ZQWD5a0FFJoK+9dAUlknTnV6sPgRWC1+3PHnstZPVCLZZdiKpS612xxtZEqQpCaeI0Ya
 k5Y9ILlV/QAS/hAe8zIKHJSZMN9pVZnMIMbkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vdhu1Xt9iOedS/Y8YF8BetiFT0tTQ4LeUM36vWZzls=;
 b=H6NRR1J33bo6dXzowr9Iw022hfXpIK37hhv4+oSjHdVuScyKnFm96lfZmYokouQwJx
 ALs+EDYnKD5Ld+J8wr6OYnkoBN79jvBm3cXgOrsWnxie4ajpsGQZ0iiGg0sMcCPJ/enf
 yoRHD/lk8RnU0afecvFrgqh1jGR1AmImLRde/ZAWieaqQB6eXoKYqsd3aryuHN1WhqzC
 Qq6Pn/y0G04RLVWjxpzMgWBNu+knlWJ3nej24UtYskD19LjxuYWcfPLlYLSMB5kD/tgb
 NNpAdwc+WMDs3yljQTY8UYApZV2/33CudnYPOvQr1rL/+OQhrutm77iLSjFHdOm+/YdV
 NDqQ==
X-Gm-Message-State: APjAAAV53lyz16KpYm0zQs8SOX9TjrBhNDWSeGwSlugzHlJ2H+EIyGxk
 nTYbHZwN/n9bbHxvRq+2TCPtt3N18oujxA==
X-Google-Smtp-Source: APXvYqxI5BdqGC+o0XbfbWbIJyNfBExUJT97/YgzDdhNEcLu8lCjJOHwASBUyGlA8wNzDs513PNQCA==
X-Received: by 2002:a17:902:7c0a:: with SMTP id
 x10mr1557524pll.168.1576045183686; 
 Tue, 10 Dec 2019 22:19:43 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id h5sm1225579pfk.30.2019.12.10.22.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 22:19:43 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 1/4] dt-bindings: drm/bridge: analogix-anx7688: Add
 ANX7688 transmitter binding
Date: Wed, 11 Dec 2019 14:19:08 +0800
Message-Id: <20191211061911.238393-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
In-Reply-To: <20191211061911.238393-1-hsinyi@chromium.org>
References: <20191211061911.238393-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Dec 2019 09:20:35 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nicolas Boichat <drinkcat@chromium.org>

Add support for analogix,anx7688

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Change from RFC to v1:
- txt to yaml
---
 .../bindings/display/bridge/anx7688.yaml      | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
new file mode 100644
index 000000000000..cf79f7cf8fdf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/anx7688.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/anx7688.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analogix ANX7688 SlimPort (Single-Chip Transmitter for DP over USB-C)
+
+maintainers:
+  - Nicolas Boichat <drinkcat@chromium.org>
+
+description: |
+  The ANX7688 is a single-chip mobile transmitter to support 4K 60 frames per
+  second (4096x2160p60) or FHD 120 frames per second (1920x1080p120) video
+  resolution from a smartphone or tablet with full function USB-C.
+
+  This binding only describes the HDMI to DP display bridge.
+
+properties:
+  compatible:
+    const: analogix,anx7688
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device
+
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: |
+          Video port for HDMI input
+
+      port@1:
+        type: object
+        description: |
+          Video port for eDP output
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - ports
+
+examples:
+  - |
+    anx7688: anx7688@2c {
+      compatible = "analogix,anx7688";
+      reg = <0x2c>;
+
+      port {
+        anx7688_in: endpoint {
+          remote-endpoint = <&hdmi0_out>;
+        };
+      };
+    };
-- 
2.24.0.525.g8f36a354ae-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
