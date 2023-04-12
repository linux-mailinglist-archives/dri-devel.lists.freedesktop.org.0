Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C707E6DFD22
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 19:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F5310E821;
	Wed, 12 Apr 2023 17:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6D110E821
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 17:58:13 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6a4152eac7eso70041a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 10:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681322292; x=1683914292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d2uw0pnbO7YgaFGMc7HjwyNcPXnRtQStNSMvy/NZNMw=;
 b=CRINQtglWRDFKrsCRyvGOzktaOvab5x2F96gRppWJOzYoS862rqLvBuQGiHPG+vZRq
 vWKFw1rYOoYQ/XnyCN69hnv6NBOlvUDUg0m7k7i4Z6B7jGmLDjBwKU7g8ev7GrJJ9cNY
 gaNzzAUqG0xy5cDFqECC7IAlO3l01MACdBNdE8Y/a1DK0S715Ux/ROLM0WAprekl3R7N
 2kANckd4+cjTPf1XrBspGHrQaZNJRus9y4WgSaYnOVPX96zthFOL+qEQ0FV7hwDb1V89
 weGEq2rF7yq9rMALQ7BETyBpfn0/pFN59Ig+7aKhprypXJ/NiKtnxpua5xbG5qzKzxAw
 bW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681322292; x=1683914292;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d2uw0pnbO7YgaFGMc7HjwyNcPXnRtQStNSMvy/NZNMw=;
 b=NSc3lLOkpwmVMp8+g6UUFjr1J4ibTIoN+HN3NFlnoKG1bTsoXKTFzbQyFF9c8EQX5f
 7gZdnN0FmymO+nR0sr5g7BlPsKO+2GQCYlCC3enXCo6mOP/W1rJdetQsk67YIueeKouw
 ETSRSrr9Lya6WxL3WHkRFOhPL3BVDRGN30CifAtlB5eZRyIAJu3ek0HK8TexzfALn2EL
 bdizZwoI3mJnYgyQD0jLqemVBtykYhfOHJHpOM7FinxbIgBWOiv1kEPdDlg8l0Ap2Ls5
 ODRy+F3Mcw3Sps5qodlZLjGKTG4nfEWcVukfqd3APzDtEVIaHA4yxMlgtr0V/5dtobIk
 z/YA==
X-Gm-Message-State: AAQBX9d8ofbW4n5WWiIjrhoH19WblZUmJdEiuYzGcmwhi3JAMOlkI7jB
 6QQZ6Kq1DJGMsghAaO1kVUPAZvEY9Tg=
X-Google-Smtp-Source: AKy350abdyjnrVs0S69rq9Jb8RhHOVKQq6sbgPsExmOg+jtr0lPrDBjrMAIAi1t6JtCIT5V+Efd0gQ==
X-Received: by 2002:a05:6870:a18a:b0:183:cf65:a4bd with SMTP id
 a10-20020a056870a18a00b00183cf65a4bdmr9607102oaf.5.1681322292431; 
 Wed, 12 Apr 2023 10:58:12 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:9b67:19cc:485f:3268])
 by smtp.gmail.com with ESMTPSA id
 zh20-20020a0568716b9400b0017281100b75sm6323803oab.42.2023.04.12.10.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 10:58:11 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dianders@chromium.org
Subject: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix the
 video-interfaces.yaml references
Date: Wed, 12 Apr 2023 14:58:00 -0300
Message-Id: <20230412175800.2537812-1-festevam@gmail.com>
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
Cc: neil.armstrong@linaro.org, Fabio Estevam <festevam@denx.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

video-interface.txt does not exist anymore, as it has been converted
to video-interfaces.yaml.

Instead of referencing video-interfaces.yaml multiple times,
pass it as a $ref to the schema.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Pass  video-interfaces.yaml as a $ref to the schema. (Rob)

 .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml    | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
index 911564468c5e..6ec6d287bff4 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
@@ -90,7 +90,7 @@ properties:
 
         properties:
           endpoint:
-            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            $ref: /schemas/media/video-interfaces.yaml#
             unevaluatedProperties: false
 
             properties:
@@ -106,7 +106,6 @@ properties:
                     description:
                       If you have 1 logical lane the bridge supports routing
                       to either port 0 or port 1.  Port 0 is suggested.
-                      See ../../media/video-interface.txt for details.
 
                   - minItems: 2
                     maxItems: 2
@@ -118,7 +117,6 @@ properties:
                     description:
                       If you have 2 logical lanes the bridge supports
                       reordering but only on physical ports 0 and 1.
-                      See ../../media/video-interface.txt for details.
 
                   - minItems: 4
                     maxItems: 4
@@ -132,7 +130,6 @@ properties:
                     description:
                       If you have 4 logical lanes the bridge supports
                       reordering in any way.
-                      See ../../media/video-interface.txt for details.
 
               lane-polarities:
                 minItems: 1
@@ -141,7 +138,6 @@ properties:
                   enum:
                     - 0
                     - 1
-                description: See ../../media/video-interface.txt
 
             dependencies:
               lane-polarities: [data-lanes]
-- 
2.34.1

