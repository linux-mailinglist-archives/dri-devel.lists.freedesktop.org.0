Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0276E48D2DA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 08:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BEB1122B3;
	Thu, 13 Jan 2022 07:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE7C1122B3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 07:32:10 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id h1so8332430pls.11
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 23:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJ7jhTxZtYx2s5hY3iEvxpmsU4PPvMVmZGrdRkEcvPI=;
 b=IJSx48yyim2T+/autKNyiGUP5WVCIa2LnzXnNoCi6Gr8LHqpcsTey0lxosDSWWukoQ
 Itwtn9aJjQ8QeRk28BDdMwEOfJrG3FrUz3yPlgbA3Abg3QwKfQW5QmZvkriKl39DdQQU
 MwSLZ6ACdE1JK6QSgl/1slJLqLO9rP6cq5P8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fJ7jhTxZtYx2s5hY3iEvxpmsU4PPvMVmZGrdRkEcvPI=;
 b=gpmMKCAG627mqMFQ74YaZM2jM7IyMcH8UdEB34gFSNyvE9LM/dy0uLfqoowzgOhnwC
 bXV7p3me9OdSS3SADSKnNQO2EdUyAaOfPt/nkELDKdHe1vm66Wq8oJnngYtKFSHhLgAr
 6YA4MMc4wvVyMdn/vKDGrWk+a19kdA9RihFHw7nc36zeM9n+/I1enhuR1Psu35H3Nx51
 HcIdsg3Qts3Jri6CCPP3q9im6PBDoai2vpskVpFONvl1D/ZEBGOtC/IChZOIqOaSzF4D
 wISLQNWRz2nyDOj+XEkqchqEohGs6pHk7odWaFL/ac9SAwQWBoQu0jOCran4QndQcUj9
 8w0g==
X-Gm-Message-State: AOAM530ZZNEI8gTiAJiFthPAyS3gCv/xtyDELkYOFfC/9I/6FF5XHdRG
 CWtU50yBJ31kVdxr3459yUee2w==
X-Google-Smtp-Source: ABdhPJziGsBxli+6Iq6w6hS+WQ2CJbZK7AzLfAwT/ACq/ydScWMRWwiOoZBeFrG0UOgEMIqdg1xPcg==
X-Received: by 2002:a17:902:904b:b0:143:73ff:eb7d with SMTP id
 w11-20020a170902904b00b0014373ffeb7dmr3518103plz.85.1642059129830; 
 Wed, 12 Jan 2022 23:32:09 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3ced:e0da:4852:430c])
 by smtp.gmail.com with ESMTPSA id om3sm7747701pjb.49.2022.01.12.23.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 23:32:09 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 3/3] dt-bindings: drm/bridge: anx7625: Add aux-bus node
Date: Thu, 13 Jan 2022 15:31:58 +0800
Message-Id: <20220113073158.2171673-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220113073158.2171673-1-hsinyi@chromium.org>
References: <20220113073158.2171673-1-hsinyi@chromium.org>
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

