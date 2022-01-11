Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F58F48AC6C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 12:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0308B113605;
	Tue, 11 Jan 2022 11:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9204B113605
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:27:12 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so5335947pjp.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 03:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46kd66rKp1VnZanb08w1/JpSToEg+cj/w+6OGWRBAbI=;
 b=P6QMB5idryLJTr3iH3aGsPFWQqdMBgyrOTWI2fb6nj+/59JF8pNCQ8ib/h9WhXwQpn
 gSYS9b/FptI2EBclwOYxhyP02wNJkf1Zy0/ixU50sOa6HY7a0KjCgx/PyrPmBjNh2x8E
 ZPbsHZYOnVv76vefS8FwzNcZ71BjdGoI0/+6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46kd66rKp1VnZanb08w1/JpSToEg+cj/w+6OGWRBAbI=;
 b=Nkv/zFZdW/H8oiOBBf/nxKVhkDvMQCM871+947Fw5QWaH/VD/9do0hkU2HW63RSQoK
 gkf5EolmOw1lFW/3yPLk7JCQGp5NzrLeAKSXYaYKm7cnvGI1yf6et83X+TDnw59grkj2
 1eKfXYRU730siA0AgqkBTIzCSgIYxXa2/FRfIjoCZa+bVKXLXnwNXr2Oh0upi0rgtr/2
 UF2ug4dflXHLtqS5GgCjaPzmt6KXPP6+uYJJAAau1nC9GKMGNka7heR+Uqmbe3b6pn1z
 SVpQRoorH6ZLLOHYZ/WtoGDZpbuUWmx74cjV+QgQUzf/6qHQ0CRMInkcpBv/IOgAo2JG
 R7RQ==
X-Gm-Message-State: AOAM533VQbQJQIbDEFcGf3w3KJC16GDBk/mI82MRwst6rnvvD5gyNeSN
 rf07weFHjXPpU9umQ0QcvTVvkw==
X-Google-Smtp-Source: ABdhPJwBxKovKopjCX5pP4JOnS4rwZP5WhoX7cewWM9Dc4eadgFObegLOSPJIImxTL28vbn+19MI1w==
X-Received: by 2002:a17:902:bf02:b0:149:c653:22af with SMTP id
 bi2-20020a170902bf0200b00149c65322afmr3928905plb.139.1641900432166; 
 Tue, 11 Jan 2022 03:27:12 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a41:eba5:ec46:f86c])
 by smtp.gmail.com with ESMTPSA id d12sm10664856pfv.172.2022.01.11.03.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:27:11 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 3/3] dt-bindings: drm/bridge: anx7625: Add aux-bus node
Date: Tue, 11 Jan 2022 19:27:01 +0800
Message-Id: <20220111112701.1064458-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112701.1064458-1-hsinyi@chromium.org>
References: <20220111112701.1064458-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

List panel under aux-bus node if it's connected to anx7625's aux bus.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../display/bridge/analogix,anx7625.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 1d3e88daca041a..0d38d6fe39830f 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -83,6 +83,9 @@ properties:
     type: boolean
     description: let the driver enable audio HDMI codec function or not.
 
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -167,5 +170,19 @@ examples:
                     };
                 };
             };
+
+            aux-bus {
+                panel {
+                    compatible = "innolux,n125hce-gn1";
+                    power-supply = <&pp3300_disp_x>;
+                    backlight = <&backlight_lcd0>;
+
+                    port {
+                        panel_in: endpoint {
+                            remote-endpoint = <&anx7625_out>;
+                        };
+                    };
+                };
+            };
         };
     };
-- 
2.34.1.575.g55b058a8bb-goog

