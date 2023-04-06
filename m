Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF53F6DA0A0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 21:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F57510E112;
	Thu,  6 Apr 2023 19:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645BE10E112
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 19:04:08 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6a11f365f87so1187608a34.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 12:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680807847; x=1683399847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tgMSLoXvpb41dzn7vUbLqG4YYGMU1dgRXM40AmhHt3k=;
 b=kMX/P8uRuh4nCfSPQXZMNuxXEwuQirPpCMzCU4gnXNa2aSTLGq8DMRDppHeVD3U/MI
 a7OCbUSc+9w+r1GTD14CsrL9DTnLoezq+adGndZpSPQfwYUrtAXd7dKuHMLPvsy0VndO
 utVvRuFqkNp741ZH59L4avn20gWfJ18lSmsFfKTzyaAdx6KfO1dA/qL6uHkzHENnocV+
 2A5jfacQPHxDw46+hu8pWKOftFHc3/CcGXGALDtjNAptyS/zwdkkOkiDR4AvY+CluXWe
 PHLus7FNvlzinp4Y4+1bTi5UDbNF9k1z3emwZ6uxDB+m3agjPz8tr9ySDarxVPxZ37FP
 XC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680807847; x=1683399847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tgMSLoXvpb41dzn7vUbLqG4YYGMU1dgRXM40AmhHt3k=;
 b=VFeOnf8Vsk/LFZl/hkEIEk2m8oBfW2pb5OSt+FW9vMXg7PZ2s5LTKHpbPjpHIfJBg8
 qKfB1VIXR3Eef4/uxYN+F3Slzh3s4vHs/1Icv77XQGZOtCN4qI/7YnjYbXa8gVFvHsW8
 e9CNEnYNMAa1I0YSv6UEa6PNGF3PHETUJHbKnOf2jqEFEb31XGO/HGeKF00G/hJicFi1
 ponlPNlfZ56DWWzcTxklJKTBXaQ9heN32opvKJXDybfbwo1x1fh6rrXM2NoylDNyI6mG
 M/ZECesO9/e5KFq37YgGx+/ndE8HCj3Lqiw48cprDfrsH0ekXbwv8U+gVVOy5GTg6THs
 kN6Q==
X-Gm-Message-State: AAQBX9c3CWCKXmnXTvBp0cK/Hapn8yldVyJzijNhJguHDnE51kzO8at3
 Zyq8w/LTpHGck5rm/bwdptc=
X-Google-Smtp-Source: AKy350YAqdbAzkif8xUQ6LbO+5MM7Ceb+V7ivrupy8k+evqC08095O2JIY7T/QKhIXWrhhyN55pOZg==
X-Received: by 2002:a05:6808:1995:b0:385:d91:ee30 with SMTP id
 bj21-20020a056808199500b003850d91ee30mr2852309oib.3.1680807847256; 
 Thu, 06 Apr 2023 12:04:07 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:c4b0:ddac:a031:82c4])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a056808150a00b0037832f60518sm986761oiw.14.2023.04.06.12.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 12:04:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v2 1/2] dt-bindings: samsung,mipi-dsim: Add 'lane-polarities'
Date: Thu,  6 Apr 2023 16:03:53 -0300
Message-Id: <20230406190354.1641352-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

The Samsung DSIM IP block allows the inversion of the clock and
data lanes.

Add an optional property called 'lane-polarities' that describes the
polarities of the MIPI DSI clock and data lanes.

This property is useful for properly describing the hardware when the
board designer decided to switch the polarities of the MIPI DSI
clock and/or data lanes.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Rebased against drm-misc-next that has samsung,mipi-dsim.yaml.

 .../display/bridge/samsung,mipi-dsim.yaml     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index e841659e20cd..04eb440ade72 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -105,6 +105,35 @@ properties:
           DSI output port node to the panel or the next bridge
           in the chain.
 
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                oneOf:
+                  - minItems: 1
+                    maxItems: 4
+                    uniqueItems: true
+                    items:
+                      enum: [ 1, 2, 3, 4 ]
+                    description:
+                      See ../../media/video-interfaces.yaml for details.
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 5
+                items:
+                  enum: [ 0, 1 ]
+                description:
+                  See ../../media/video-interfaces.yaml for details.
+                  The Samsung MIPI DSI IP requires that all the data lanes have
+                  the same polarity.
+
+            dependencies:
+              lane-polarities: [data-lanes]
+
 required:
   - clock-names
   - clocks
-- 
2.34.1

