Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 342EE3A47A8
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 19:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA966F39A;
	Fri, 11 Jun 2021 17:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0976F3AA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 17:18:08 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id q25so4982693pfh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 10:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iNt+OGJw9beffEtpBGTCu3+ysNF07AUPG7fXgLPAxNk=;
 b=KvcuA9MoUxl9ScP1xT12a2JoVbNPCXjFYHbFVn39RBDclYDN4NsOHPtu3RxGU5L+ml
 iyn6EcBshka8D6BkaKAE8rnnJbMy2F4ZLFvyYl+oAvzXW88V28FOLw8tlWDe29KUMUvy
 3uA1P5sRvzdvMmiq4SCx67LcV3CfQCRt4riB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iNt+OGJw9beffEtpBGTCu3+ysNF07AUPG7fXgLPAxNk=;
 b=nSVbfTAr3BgQUhz0EH96h/qowugj91/24SJSZco1Oisfxuo8vEYxSTZoY9obOu8XWD
 dFmltFHdncEizpPI36itmU+cQz2xuqpl95HBBaC5cG58soMl4BUBxMzT63g7njohZYdZ
 aYSy4UAOXYtzEuczHf+c9mjo2ZvkykrnFOiVg6/VaWH5Ud2J1rrMxSQJwsUsePr5LSwm
 Kz4M5k1vbv4pAK4JJJLAh5VLJRs7hcQgVIsRdKBimJTqG8bIObqDY1zRsFaGcxxQTE5w
 IYTlUHZloSi++jfYwv2N25BhRcJQRth6djocLEI+zxGr+U1Nv6fVZSr8IqRI+f9yk5UX
 rymw==
X-Gm-Message-State: AOAM531LYii0jHit83CaLVnaK2h7fkPh+hvtWWtRWzMDWVKBSfV8MHiz
 CLCnUrM5ybMdLxqW0E+xzGkIzQ==
X-Google-Smtp-Source: ABdhPJyF9EzM22Lo3EZWBnffeRG8IlVmb5QHhK1YOl5v2N6AOcQD2QDRQvoQTUNeAaxV/BhbCTkjAg==
X-Received: by 2002:a63:b54:: with SMTP id a20mr4696491pgl.407.1623431887764; 
 Fri, 11 Jun 2021 10:18:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:4128:5428:5cd0:cfa5])
 by smtp.gmail.com with ESMTPSA id f17sm5837850pgm.37.2021.06.11.10.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 10:18:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v10 03/11] dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus
 child
Date: Fri, 11 Jun 2021 10:17:39 -0700
Message-Id: <20210611101711.v10.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210611171747.1263039-1-dianders@chromium.org>
References: <20210611171747.1263039-1-dianders@chromium.org>
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
 Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch ("dt-bindings: drm: Introduce the DP AUX bus") talks about
how using the DP AUX bus is better than learning how to slice
bread. Let's add it to the ti-sn65dsi86 bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---

(no changes since v9)

Changes in v9:
- Use an absolute path to refer to aux-bus schema.

Changes in v8:
- ti-sn65dsi86 references the new aux bus bindings.

Changes in v7:
- ti-sn65dsi86: Add aux-bus child patch new for v7.

 .../bindings/display/bridge/ti,sn65dsi86.yaml | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 26932d2e86ab..12b876a20574 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -70,6 +70,9 @@ properties:
     const: 1
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
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
2.32.0.272.g935e593368-goog

