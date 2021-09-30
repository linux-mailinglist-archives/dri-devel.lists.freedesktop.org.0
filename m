Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5C41D09C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 02:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CAF6EB0B;
	Thu, 30 Sep 2021 00:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE46D6E2B8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 00:35:06 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id h3so4472639pgb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 17:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AgZhYHdye54r6ShDoaQFSdXhndbZUW3v28dxdpS3Tao=;
 b=oQgFAPuw89Z0XQftMMhBeGuniB6bE/9874lJytDJkWt+kezg72K+gksvMmV88OIEuM
 Eyy3WSWdxU+gnWEx70j38/t7N7wyShxBNzbSNjZXozje94sq5QwoiSqqm20aTpSQSKdC
 1N7sBCXf5Ws0kgBHUhcO5tDWZfQ/LKM9qch9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AgZhYHdye54r6ShDoaQFSdXhndbZUW3v28dxdpS3Tao=;
 b=e73MAYlczRtWK/YvIjGi90YcXtA/FpMDjpKhsMXBoB3evx4PQmnT3MYaIy8j8PIgZY
 rAMi2fcLoQPfPuA8lmd0O1E9BUADxYtlJdx8vKe5kQztKiA9ujVzlBSTYQaGvQoenzni
 ktVlvb+utzgKS8NrqCxymxIHMm70vdGE9uNDFANYf5E+ndz0dXDwLYkh9tZeA53q65qn
 HypFKMjrVQX4XD7EyQt9Emjd9dInMU8qbYB8FWrZzqUOKLI61qplwn/5SD7bCJ1BWPXN
 3SRfiE2ighH/suqakJ+Hm+1VH9qMgOnzgrqu0yMl4ehDPp/0KW4BdE3mS2De0IzJQBab
 +PrQ==
X-Gm-Message-State: AOAM531lWwlNVQffblGP1ZTtUq3GFhVZkbRH+yDmQohLmx5IdTfkbK+H
 xC5dBhv+r8x2Mt7cuq1WA8+Frg==
X-Google-Smtp-Source: ABdhPJxR9ohnQ+FXvrOlYtUk9aMrDtETY39YyKk7EZ+OawfXb0zWBw1TSfoVQJOrNHv1XXkZlynECA==
X-Received: by 2002:aa7:8f01:0:b0:447:8167:46c1 with SMTP id
 x1-20020aa78f01000000b00447816746c1mr1529882pfr.30.1632962106583; 
 Wed, 29 Sep 2021 17:35:06 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:b6b6:ed63:b801:ded7])
 by smtp.gmail.com with ESMTPSA id 23sm711648pgk.89.2021.09.29.17.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 17:35:06 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: dianders@chromium.org, swboyd@chromium.org,
 Philip Chen <philipchen@chromium.org>,
 Balletbo i Serra <enric.balletbo@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] dt-bindings: drm/bridge: ps8640: Add aux-bus child
Date: Wed, 29 Sep 2021 17:34:57 -0700
Message-Id: <20210929173343.v2.2.I6050ba184b24d887e92692a72ee3054d643d6091@changeid>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
In-Reply-To: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dp-aux-bus.yaml says we can list an eDP panel as a child of
an eDP controller node to represent the fact that the panel
is connected to the controller's DP AUX bus.

Let's add it to the ps8640 bindings.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

(no changes since v1)

 .../bindings/display/bridge/ps8640.yaml       | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
index fce82b605c8b..cdaf7a7a8f88 100644
--- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
@@ -40,6 +40,9 @@ properties:
   vdd33-supply:
     description: Regulator for 3.3V digital core power.
 
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -98,7 +101,21 @@ examples:
                     reg = <1>;
                     ps8640_out: endpoint {
                         remote-endpoint = <&panel_in>;
-                   };
+                    };
+                };
+            };
+
+            aux-bus {
+                panel {
+                    compatible = "boe,nv133fhm-n62";
+                    power-supply = <&pp3300_dx_edp>;
+                    backlight = <&backlight>;
+
+                    port {
+                        panel_in: endpoint {
+                            remote-endpoint = <&ps8640_out>;
+                        };
+                    };
                 };
             };
         };
-- 
2.33.0.685.g46640cef36-goog

