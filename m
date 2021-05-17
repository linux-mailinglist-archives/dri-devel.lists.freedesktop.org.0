Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33E43865DF
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADEC6EA77;
	Mon, 17 May 2021 20:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8676E2EF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:09:50 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id k5so4293698pjj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ibC0JQ1noBgZMhZpAkhp6+LWFKsRlOrZ8j0drDGOJUc=;
 b=WuNlzNsceu7te8upmYnD24kk4Zbrbvf7LBNU1IGaOZTNfldtXzy8SP5gxoJmy31Ztw
 WqEQK49yIrFEDP5WcTNE1gQVxI2bG2TMmxPeQQGgwqNPO9i1CziftTYOrUqT4zaaon7n
 m3/NL/6XIwHL0CmYhCmu/ETlm0QbHatWt1e9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ibC0JQ1noBgZMhZpAkhp6+LWFKsRlOrZ8j0drDGOJUc=;
 b=Ys6Ca0UKgBISY3qpPEu37IvD4bTyOWLlxoiZ+mZlXvcIOfy9FXFSbhjDDZERCd4EcX
 l+H40lAfQhXgsG62rK3r5e/+6AhYBd06B3eFzo0iNVIs1ixnNOOGBtcgZaG5zQYVIkRh
 lo5d3eifMEWw6w0s0RP/30RN84CmRPicFVBp2JYCelewH5b4H9stPlBeuysRezwkWqs+
 hRsvsfA1x9vvSo2SxJaFI2fYs9YOWO7S3lfTqdFV3JC3rase2PHbOdEjLDiTsdaOFWBl
 R4OOBONJx2erfOhQCLIu6JkqV0l2RH3e1w0R+ga4ZtQ1jagfyFKgpN95/SnO2FDcBGMn
 ivFg==
X-Gm-Message-State: AOAM532ujXpU9P3TCp431rVSALYxNb5Hqp3WfZuEHpvAFYzzEjC/W8oL
 OKFLoXB7yiw64Rip+4Q/6ciGuA==
X-Google-Smtp-Source: ABdhPJzFA78VI2ZxClv8Expyof7VKru3oLqIN3yVSmvQaS6IsPGGiLHBrJQRCZ1MDayUfdlmXlfQsA==
X-Received: by 2002:a17:90b:1bd2:: with SMTP id
 oa18mr1241491pjb.72.1621282190331; 
 Mon, 17 May 2021 13:09:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:bc91:c597:ded0:7930])
 by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:09:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v7 03/10] dt-bindings: drm/bridge: ti-sn65dsi86: Add aux-bus
 child
Date: Mon, 17 May 2021 13:09:00 -0700
Message-Id: <20210517130450.v7.3.I98bf729846c37c4c143f6ab88b1e299280e2fe26@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Sandeep Panda <spanda@codeaurora.org>,
 Steev Klimaszewski <steev@kali.org>, Thierry Reding <treding@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We want to be able to list an eDP panel as a child of a ti-sn65dsi86
node to represent the fact that the panel is connected to the bridge's
DP AUX bus. Though the panel and the bridge chip are connected in
several ways, the DP AUX bus is the primary control interface between
the two and thus makes the most sense to model in device tree
hierarchy.

Listing a panel in this way makes it possible for the panel driver to
easily get access to the DP AUX bus that it resides on, which can be
useful to help in auto-detecting the panel and for turning on various
bits.

NOTE: it's still possible to continue using the bridge chip and point
to a panel that _isn't_ listed as a child of the bridge chip (since
it's worked that way previously), but that should be deprecated since
there is no downside to listing the panel under the bridge chip.

The idea for this bus's design was hashed out over IRC [1].

[1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Possibly we might want something fancier that could be included by
other eDP controller bindings. If we want to do this, I'd love to be
pointed at a good example to follow.

Changes in v7:
- ti-sn65dsi86: Add aux-bus child patch new for v7.

 .../bindings/display/bridge/ti,sn65dsi86.yaml | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 26932d2e86ab..51f5a29e216c 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -70,6 +70,11 @@ properties:
     const: 1
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  aux-bus:
+    description:
+      It is recommended that you place your panel under the aux-bus node
+      here to represent the control hierarchy.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -201,11 +206,26 @@ examples:
 
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
2.31.1.751.gd2f1c929bd-goog

