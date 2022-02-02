Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0947C4A7574
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 17:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197F710E30D;
	Wed,  2 Feb 2022 16:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3729810E30D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 16:06:17 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id y17so18726275plg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 08:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ye0S9ZGhY+9EmUZN3Zyu0p+11AX+B8bmbaaOWhr2T0c=;
 b=THKJNrl8wZq9kLm8aIUQsyrUyYnORIkUj0AsqjphNpw6zKOLSU8mqe9LQMXJhqfiew
 6DsPPj5bqxhMpt7Fi9y3F1lK310+oJJ9mGsTFpzoKxamrrhR4Ba+/AupkvmyEhHI99Zg
 W2nXGzr1QnqjZvGL1A0rlvwPLTg4hCskXlNps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ye0S9ZGhY+9EmUZN3Zyu0p+11AX+B8bmbaaOWhr2T0c=;
 b=VmO4kKVJOVKcPcfWJ2AfO73UOsfsGibE0ro/FeXodzdwixtomz4mLw1F4Ax8xQj/5m
 8qSnUCDB/XoC1R48DmUa43UTNN1V3gmyG7u3M/3tgiBjd0Q0hmUiUqlSpnzVqNh7bXIc
 J+FjbJn6lDAr3rlTj0BOaLfRDmHC0Lgu3FcL956RDuHMfQC0WKsHvWDlZ6Kv1qqFcxZw
 tFNgLK2eAxzRftqKJpZS5QwlxJ4nepAZQWHr4Nex67TTINBKAzIxxJbPK/clHKdLgBll
 tJrofQ+hLKvyrbw56waJje9wHrIVKyl84U0j7u4I/KTMWFaHeTibh7iSpafThNvsYwJK
 LJug==
X-Gm-Message-State: AOAM530zaFgMYTQquJG8ORopVGaibHTEZr9zVXSPt+DVSLjhs8xbG/3D
 /D1/C85C7gGxckHk+iT/5q1wMQ==
X-Google-Smtp-Source: ABdhPJwmobxexK4WZn3maJdnwfwFpSVFi9apHR9NwFwzjjq9KmTbT11kIv6UjVpfSKsQhHnnARnRsg==
X-Received: by 2002:a17:90b:38c7:: with SMTP id
 nn7mr8872415pjb.124.1643817976720; 
 Wed, 02 Feb 2022 08:06:16 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:7ce0:466c:be86:774])
 by smtp.gmail.com with ESMTPSA id g5sm14722397pgc.51.2022.02.02.08.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 08:06:16 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH RESEND v5 4/4] dt-bindings: drm/bridge: anx7625: Add aux-bus
 node
Date: Thu,  3 Feb 2022 00:06:02 +0800
Message-Id: <20220202160602.440792-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202160602.440792-1-hsinyi@chromium.org>
References: <20220202160602.440792-1-hsinyi@chromium.org>
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
 dri-devel@lists.freedesktop.org,
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
2.35.0.rc2.247.g8bbb082509-goog

