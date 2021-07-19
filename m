Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9523CEB6F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 21:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEC46E0DA;
	Mon, 19 Jul 2021 19:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5266E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 19:50:05 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id x10so21375423ion.9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 12:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aG3jRlbPN2vUwxCTM7m5lg6AuY6gMHA+0U8gF5Ougek=;
 b=PjvPeeCTKSJmRWMFNukQvYx4eekS7HyijdaQaDVaet5CC2cULtoIEdTcPGxqIfgHIA
 qQI/nlJdg29NqnMVI7Azz7cHIOWFZSyHuVReRDf2g2uevORXMApZRd1/s/GdDZRQM15E
 n97aVauaNuVzn9npCBQDKc0Xt8QS+vXAHpcIwiH34yIZy/wskGqppFNFhWHxDnumR9kf
 VYjIUQRI7SCquqjwYnWEIReImnxFNaKeWkn0hWl4gwRJH3WMHP4j2O3/Q1m1V94C18bz
 dwMGjLH1qbMxEcCnTqzkCoXPVZ0hhXHEPDwBxkhZCCwdI4pTGaGeIe7Nov79CKNO0n8Z
 d/Og==
X-Gm-Message-State: AOAM5315u3bapGqNPBcSN86oCSu4orsJTTtwrYT/c4rtIhCJv2XMjTth
 MXvW6CSttjh5vWi3H0Nu8g==
X-Google-Smtp-Source: ABdhPJzYjU7X6oo+Ckis+hbPzMu6oq0X2BoiJ+rZT/hptX49jmi/YaKeQBNle+ttKv8qObNGowKU8g==
X-Received: by 2002:a05:6602:59d:: with SMTP id
 v29mr9469036iox.132.1626724205186; 
 Mon, 19 Jul 2021 12:50:05 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id g22sm10898287ion.10.2021.07.19.12.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 12:50:04 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: Fix graph 'unevaluatedProperties'
 related warnings
Date: Mon, 19 Jul 2021 13:50:01 -0600
Message-Id: <20210719195001.2412345-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: Marek Vasut <marex@denx.de>, Krishna Manikandan <mkrishn@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The graph schema doesn't allow custom properties on endpoint nodes for
'#/properties/port' and '#/$defs/port-base' should be used instead. This
doesn't matter until 'unevaluatedProperties' support is implemented.

Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marek Vasut <marex@denx.de>
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml    | 6 ++++--
 .../bindings/display/msm/dsi-controller-main.yaml           | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index d101233ae17f..07b20383cbca 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -37,7 +37,8 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: Video port for MIPI DSI Channel-A input
 
         properties:
@@ -57,7 +58,8 @@ properties:
                   - const: 4
 
       port@1:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: Video port for MIPI DSI Channel-B input
 
         properties:
diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 76348b71f736..de23cab9b5f1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -77,7 +77,8 @@ properties:
 
     properties:
       port@0:
-        $ref: "/schemas/graph.yaml#/properties/port"
+        $ref: "/schemas/graph.yaml#/$defs/port-base"
+        unevaluatedProperties: false
         description: |
           Input endpoints of the controller.
         properties:
@@ -92,7 +93,8 @@ properties:
                   enum: [ 0, 1, 2, 3 ]
 
       port@1:
-        $ref: "/schemas/graph.yaml#/properties/port"
+        $ref: "/schemas/graph.yaml#/$defs/port-base"
+        unevaluatedProperties: false
         description: |
           Output endpoints of the controller.
         properties:
-- 
2.27.0

