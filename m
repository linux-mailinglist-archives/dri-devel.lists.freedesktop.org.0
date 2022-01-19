Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2798493CD3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1AF10E2B7;
	Wed, 19 Jan 2022 15:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0B110E2B7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:18:05 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id 188so2927662pgf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kp2JX1puGgzXBsvWu8HbdG09bQuSVyJ347xkXdyu4zM=;
 b=ZaOoXpvKVo/hhWAxlfGIC4Hk1xJcaYgYgke072IZ/a1xoXNvgiTsIFrkIm391CbNWe
 rXo3/f6oF4ai4CzsZgsQIdn5xyO5h2SUmwlkA2BWP3pdVw2lYIdh+nfCp00F3gye0UHE
 sXXsTfTiASjt0LRqtXNbmgE8FuBtcTux/WwiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kp2JX1puGgzXBsvWu8HbdG09bQuSVyJ347xkXdyu4zM=;
 b=cV2VC4PX/HGR5+BwUnCoG1Gbv7wVkv/YfG4DD1ITEQ25a9J5n67emU/AW8bp/7ytfW
 boPSi2pyvA/VxLg8HHrmY63FUWz8j/4qCYDvNLVB86ZhH4pSMFT1KehfJxysfajZlf++
 JTQUA/UAY7SjFeRDXqT3em6bYphkjdMZjdvJDXzQqZJdGKp5DNgRKKY1gqjX5kpP9qSV
 z+egdCifcUbgxKQB17lVBtx7+fAyGpEiBTBznFUndYFslX3/8b1LC4+LGdLPGolOCPZS
 fTbzRmTdViRK1m6iXRypQ72H1gpcNd4doATTR3JCHs+w1p3JDqhJUHAGYQvmLAJCtNcI
 u+YQ==
X-Gm-Message-State: AOAM533gr8H73I84FU46pjhefITAmswSlcg3FG12Sk+dTcJPSW72tnyb
 zpFKpHvgSHJU9MfaHMe5TOAX0w==
X-Google-Smtp-Source: ABdhPJwq/W/AkvyyrQ2/pwRcgiWGOEiwcnyR4t8Y9k4BxxuoDweqV6ttCqo15/59QA8a3KuadqovyA==
X-Received: by 2002:a63:317:: with SMTP id 23mr20669854pgd.318.1642605484698; 
 Wed, 19 Jan 2022 07:18:04 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ab3b:7ccf:392:3f04])
 by smtp.gmail.com with ESMTPSA id ip14sm6731596pjb.11.2022.01.19.07.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:18:04 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v5 4/4] dt-bindings: drm/bridge: anx7625: Add aux-bus node
Date: Wed, 19 Jan 2022 23:17:51 +0800
Message-Id: <20220119151751.986185-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220119151751.986185-1-hsinyi@chromium.org>
References: <20220119151751.986185-1-hsinyi@chromium.org>
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
2.34.1.703.g22d0c6ccf7-goog

