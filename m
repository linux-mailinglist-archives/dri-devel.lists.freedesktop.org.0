Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947294B3ADE
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 11:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E138410F55D;
	Sun, 13 Feb 2022 10:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A33410F55F
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 10:34:51 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id on2so11897300pjb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 02:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JaE8rdmOlwWqUb0OkieD4Ifqh+45CRaIN9t5xJmzq/U=;
 b=F/iPtsAVyE3zfhNHTOKy6Ss3n4Di/6whgRfIL1jeyJwM75hCYoSe+cN/0GARZhDaIK
 2zylYQRRcqy4ILGnTAANK11FULjNy2v9JhDzSmZfD8Tjki2P+985by+41GxyUB6e9l7k
 XRNItK5pSXbtCW5fsb731Wa6fRNPVk67tvaSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JaE8rdmOlwWqUb0OkieD4Ifqh+45CRaIN9t5xJmzq/U=;
 b=Q6fzQNfzEDbqgfnEDkA1KHJQODT7+gRF/39uwIjpLjWm+8bWl9QwajruN9SnVx3in+
 UUNi2AmHTRG1IymwY0+57kfyBdad3PuKxuia7JfU4kByHXinphoFhJM3D+wG5cPIFd98
 uGOwKinMERYzDGBVBT6C3uHcyuvkPcw5CHpADkYg2xZDXvSe3aZcLDAvTcKE2KFQgu9E
 k/2pE9rwPTAHX6LFJQGX+XEHpXDRVI7yrcQk1Xz/6yfY8EXYF8uwqOSXyANLG35WRnCI
 IpEtTC6PcauZXQnkjsVtMY2NcDfPz6NO7OQSBJOieRDJg8aC2NeRl3fZDVQ6sWpBNG7O
 L6Bw==
X-Gm-Message-State: AOAM530oPBxm2Ewmq9MDyiKXAh4WbWyT3PMhO+VMLhk5A0bzCpZmHMvR
 qxDu2cxlQWIqK/EPkBMVubFeTg==
X-Google-Smtp-Source: ABdhPJybMLnNcKW28zmhskixVEukX3DCMuQiWQikE3x6Y9kLtBv1Vv7JU8vhVj7UK+2EoVikj9Sk8g==
X-Received: by 2002:a17:902:eb90:: with SMTP id
 q16mr8828315plg.76.1644748491136; 
 Sun, 13 Feb 2022 02:34:51 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3653:bf18:8571:5f26])
 by smtp.gmail.com with ESMTPSA id n85sm1589407pfd.142.2022.02.13.02.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 02:34:50 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v7 4/4] dt-bindings: drm/bridge: anx7625: Add aux-bus node
Date: Sun, 13 Feb 2022 18:34:37 +0800
Message-Id: <20220213103437.3363848-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
In-Reply-To: <20220213103437.3363848-1-hsinyi@chromium.org>
References: <20220213103437.3363848-1-hsinyi@chromium.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.35.1.265.g69c8d7142f-goog

