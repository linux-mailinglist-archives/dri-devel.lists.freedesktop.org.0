Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DDC38F6A0
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 02:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235E76E47A;
	Tue, 25 May 2021 00:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB486E452
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 00:02:41 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 27so20002892pgy.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 17:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=frU/MIzwrtJawHtHpJ2wMhHOm//TNBEwf1FFx7azP48=;
 b=RmPVDYwmFaVUEaUke1HUVctixj/lUivUYphXkuYDtAk2my9OzGNqfTwHBMTLZMNOpk
 FThVamNIUDasehzHdFesXrMfpwPU/okm50gJ8OvAN9rDUM0qs9FXPfeR9vSh50LvQc48
 d5KOkGBjoOibcmUz6TNVaZHIQBk3BKVIvqTk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=frU/MIzwrtJawHtHpJ2wMhHOm//TNBEwf1FFx7azP48=;
 b=ZsqIMC32hfTG4kHkcf+1D3E/FBfllgXLiJ+G/M+lLh5szSyHJdiLGOHH+TIGD1bdEk
 Pv7smfYhfCfyWIccJP+zSu6xOrFlCVc0fBBtwQb0/6HKxPu34iC5ssT1PfZiK6KDbYhU
 K5CM5wVKApNtjUi26V3vVK0COc0+QwSkahOGeeJB/bjm+OmEo2+KaXmCmXvCE1o+L27M
 ahHh4iVTB2iBeENHKNyufbByp34iKokFeRoOh0mNQocDMOkWmtaL79pFRLAgHugxP/y6
 6LPZIyHGuto7JrID10BxsJe1aEjgAoBvZi+CZwutyCAeinrwL5zJ/06KGpBOye0D7tBX
 gBJg==
X-Gm-Message-State: AOAM531R+SPZwwfW9a0BAlDkl54nc4IQhoNCELLTXzJu5nMEOL5U4ijy
 hTtI1EEPFZY6WvDhiFK23016tQ==
X-Google-Smtp-Source: ABdhPJz7TwoVvVpbGA4bqbTOwnQj4Q0UDCsunLiUBQEUrWd8K6cpvy/AslaHNQRurgVp+feNQF2Vow==
X-Received: by 2002:aa7:8201:0:b029:27b:9b59:8676 with SMTP id
 k1-20020aa782010000b029027b9b598676mr26655853pfi.47.1621900961353; 
 Mon, 24 May 2021 17:02:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
 by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 17:02:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v8 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus
 child
Date: Mon, 24 May 2021 17:01:51 -0700
Message-Id: <20210524165920.v8.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525000159.3384921-1-dianders@chromium.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
how using the DP AUX bus is better than learning how to slice
bread. Let's add it to the ti-sn65dsi86 bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- ti-sn65dsi86 references the new aux bus bindings.

Changes in v7:
- ti-sn65dsi86: Add aux-bus child patch new for v7.

 .../bindings/display/bridge/ti,sn65dsi86.yaml | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 26932d2e86ab..4007f36d04ba 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -70,6 +70,9 @@ properties:
     const: 1
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  aux-bus:
+    $ref: ../dp-aux-bus.yaml#
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -201,11 +204,26 @@ examples:
 
           port@1 {
             reg = <1>;
-            endpoint {
+            sn65dsi86_out: endpoint {
               remote-endpoint = <&panel_in_edp>;
             };
           };
         };
+
+        aux-bus {
+          panel {
+            compatible = "boe,nv133fhm-n62";
+            power-supply = <&pp3300_dx_edp>;
+            backlight = <&backlight>;
+            hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+            port {
+              panel_in_edp: endpoint {
+                remote-endpoint = <&sn65dsi86_out>;
+              };
+            };
+          };
+        };
       };
     };
   - |
-- 
2.31.1.818.g46aad6cb9e-goog

