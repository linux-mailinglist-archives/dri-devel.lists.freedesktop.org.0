Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F6D47A9F1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 13:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625AB10F7E1;
	Mon, 20 Dec 2021 12:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD4410F7E1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 12:51:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so9489170wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuZC+K3Kaok5hXKjmR3Gu9qJFZKj26rdkdsCekbAVko=;
 b=ljJMnVDbZcI+Dhh1HqX3uLyt6uBCnSN4UvdQbPsKlmIbiDrVZC511h+pT5usnu7aiV
 BgmkAZntnTgcBoJwQdjsnNhR0Kmsr8BTJmaCjylV7Li4HTMYK9rVh2l7Izbad+yB1JxJ
 b1FynDH0BiZGaHieJE6XmA9hnlA7RLxQSOWsZwykM7SfcgYQq7WCjMfc4Heo6u2d1X31
 VB8vC75zwNzSfVEsHBsbYZ5pHPRrWM+N+5zkJhZFikGaYVsAOiiBILRIAEP1qzc3Mxrn
 MyS/E/XRJNiQpaiW+ldMC8NRNKXUN6JahdTQmQ0FXfnNfDjYiHqpjJ7DoZFRhYZEijvA
 GbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PuZC+K3Kaok5hXKjmR3Gu9qJFZKj26rdkdsCekbAVko=;
 b=iUhkZoiXd6IMAYmu3/lAefFBE7SGX8sJUUUpFFzyQlCed7wZqz9KS4tKu3fC5WacmJ
 HY6zATWeQukUc9zHgMmY0bWNrprGIeNKAa6R9G4ZLkRBEsX9mxI4uKUTUkC2Y8M/bAOh
 5VSk+WBMyLlWiiKTLsoFjVEMekFHShDVLrskwsHGVF7sxhd+xc5gUYXjdpidMSTtZ3sa
 6xP30qKLcD3nR2E3kwo1Gzv6pjMoUupgN0rFuKyjFsYFVpE23Eg5pJIULl9rRtoTm0RV
 f+GgRjo4UlY0nbbG0S6Fm1uRU5TsIfRga2m0aPEgTS7CT554Ymy2PTzzGh7OCT1K8Im2
 gZAA==
X-Gm-Message-State: AOAM530RkkBKeJLp4nLuBHctZFZ5caRojJ/Q3loF1XZb6DfuyuQKY2jS
 ikRQoR3+L3q95T7UjCbmSSQ=
X-Google-Smtp-Source: ABdhPJz0IQEiVaLK1pt3cm9gdzR58X+4LPKSU6c7UShi1z55pyRFRJidt5rlF2ufCR+OCN0Q7FpMiA==
X-Received: by 2002:a05:600c:4e46:: with SMTP id
 e6mr3222669wmq.132.1640004712601; 
 Mon, 20 Dec 2021 04:51:52 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id r11sm15316245wrw.5.2021.12.20.04.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 04:51:51 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Marek Vasut <marex@denx.de>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: display: bridge: lvds-codec: Fix duplicate key
Date: Mon, 20 Dec 2021 13:51:47 +0100
Message-Id: <20211220125147.519880-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

In order to validate multiple "if" conditionals, they must be part of an
"allOf:" list, otherwise they will cause a failure in parsing the schema
because of the duplicated "if" property.

Fixes: d7df3948eb49 ("dt-bindings: display: bridge: lvds-codec: Document pixel data sampling edge select")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/display/bridge/lvds-codec.yaml   | 43 ++++++++++---------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 708de84ac138..5079c1cc337b 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -94,31 +94,32 @@ properties:
 
   power-supply: true
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          const: lvds-decoder
-then:
-  properties:
-    ports:
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: lvds-decoder
+    then:
       properties:
-        port@0:
+        ports:
           properties:
-            endpoint:
+            port@0:
               properties:
-                data-mapping: false
+                endpoint:
+                  properties:
+                    data-mapping: false
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          const: lvds-encoder
-then:
-  properties:
-    pclk-sample: false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: lvds-encoder
+    then:
+      properties:
+        pclk-sample: false
 
 required:
   - compatible
-- 
2.34.1

