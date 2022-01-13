Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74A48D39A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 09:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD38E10EC2A;
	Thu, 13 Jan 2022 08:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03A710EC2A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 08:29:29 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 a1-20020a17090a688100b001b3fd52338eso8955589pjd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 00:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJ7jhTxZtYx2s5hY3iEvxpmsU4PPvMVmZGrdRkEcvPI=;
 b=PLAaBUlntcankP7m4gA6KoVaSoKmRjBpv22xwtJTl640B14bcNtySYU0gIRBgsP809
 QOVf+cLw3LwXpTHXRt1Eyf4hdqXQK6fr/bEEnIKR3lsfvFxahjhfsONjI78HBsB9yKh6
 b7JBFm1QAhDVkheYeHE2Z1Y8OXPHral1o1dqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJ7jhTxZtYx2s5hY3iEvxpmsU4PPvMVmZGrdRkEcvPI=;
 b=AZiWcrWtuP97Qo569zTtMtE0Y3uBbK26s3ASUUs0hnLCzx8YJZFGa4Tmw0/1WHjg1H
 0eQmsTMz7WbJzHeCaj544D3IUp/7o0K5/olc52GD2cOpqnrc0sQPywtZFCHxxvhoYJ5w
 aWwsJmLKO3zV4UP3ydD7lP7uAqygE0j4kROVdaqYmxc2yIOkbtCuPWJ6js7IQoSV6p+h
 QCPH+MPh5ZAq7JCHs1JFlHI+M+LtGyu5PHwkiSWBmq7TN2YWOT49VABtfSf4AFeZvRik
 GmVYj6bRGVSZEyM+D5rIfjbpGlwWSCZt09cI75GTkqbBe39WKYeMuG4yrbRAIQWuWf/m
 X+9g==
X-Gm-Message-State: AOAM530uuv4HgebawpxA+7d5v3Hoj4CqCo6Cnl9gBCTMkCH5TLVUbIhn
 2fspyAhCAXkuFzQNxehmw8ge+A==
X-Google-Smtp-Source: ABdhPJz3FAaPjCmLcQZSvMjXwU7x63sWZyU7FnTBqQIB9bRgLOw6BP2FLX5QBqCTsb5MEq6GUDupnA==
X-Received: by 2002:a17:902:b202:b0:149:9a8a:f93b with SMTP id
 t2-20020a170902b20200b001499a8af93bmr3261822plr.127.1642062569199; 
 Thu, 13 Jan 2022 00:29:29 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3ced:e0da:4852:430c])
 by smtp.gmail.com with ESMTPSA id b12sm2109894pfv.148.2022.01.13.00.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 00:29:28 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v3 3/3] dt-bindings: drm/bridge: anx7625: Add aux-bus node
Date: Thu, 13 Jan 2022 16:29:18 +0800
Message-Id: <20220113082918.2279347-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220113082918.2279347-1-hsinyi@chromium.org>
References: <20220113082918.2279347-1-hsinyi@chromium.org>
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
Reviewed-by: Xin Ji <xji@analogixsemi.com>
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

