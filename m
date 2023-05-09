Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A626FCE53
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 21:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4C410E052;
	Tue,  9 May 2023 19:11:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C5710E052
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 19:11:24 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-195ffe37d10so541981fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 May 2023 12:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683659483; x=1686251483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7SBKSnGQTBkLIjNmdaQUl/gJk+HCRRsXzqznc1iL51k=;
 b=cZpW8zVQjMSQ4WoBPS9QBcy4qxm/DPFssrv5ZQm8++NC3EvLF/eY6VndM66B7+uVX7
 FbTQT5Nnt3ocW70w7jc3qaSZlqiVb1FAlLLY8t733T1c6kBlLArOQa6pBTUTF4kv/6ot
 9QkZM7/p90ZzVCYr4W60YNfEIf7X2rBPSLGwtMMTQHY6ikSf6MgeTNcCHHMgs41H4E8q
 jVQAly2hQMAlVy4KOqbr8nHmDgCxbJjb03H8ugYH96gfzmescTPhMO9CcJS4NGrHEXJd
 sOyl5X+n2Ebe8yu/l4HtX2UZK9tuqdcNbOiIq+76DF5+TYc+cyYcnd/4AlVtZgYFGwyq
 T7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683659483; x=1686251483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7SBKSnGQTBkLIjNmdaQUl/gJk+HCRRsXzqznc1iL51k=;
 b=Gq77Y7+t0bSJLT+gTyhXv0U8TqhZctJf4wUKoE0HixyEihvfsPsdM7ZQ9OpP7926Mj
 XMbrk/Ttv+bszRUHsjs6aJyyj5aTUxWU6I9AsI2E9z7Fxgms6s3t1G6LVTmotSWygjwg
 y+0jX6xWKhGiv+UHXEfhjfx2kiOqejfyAvRo6j1mItq0gpCccnXHJUm/C6UlVH+1r+VF
 8RqVAPRp2HE9lMS3vqMKBIUJuz4pQrMNq82Vr0U4zDKt6XOe03OuiJRnbRYldqQwrwNl
 q7gK1j4XzAFi75Tycf1CmkHdtxEXsKGm+JUGw6pGQ82AqFj1Phg40hQuocdxM9bOnolk
 nu9w==
X-Gm-Message-State: AC+VfDwLarUElK4jHmngx0baHwZI56fOde/S3r+8iFQ+01l2EZHZZCJ9
 CvmoiMkjl4Bg6CJVeldR+gt2dNx5utzCLg==
X-Google-Smtp-Source: ACHHUZ7okq0CBstdAFiCtDIdIZh0aPn6yrqa+xXNMaiBiNXOqb43R0HStG8Re0WImLuw/nPHzr1vMQ==
X-Received: by 2002:a05:6870:42cb:b0:192:5e53:2e64 with SMTP id
 z11-20020a05687042cb00b001925e532e64mr8965273oah.1.1683659482861; 
 Tue, 09 May 2023 12:11:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:70eb:d83f:a7c5:b735])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a05687004c100b00192843c21b9sm6358134oam.25.2023.05.09.12.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 12:11:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH v3 1/2] dt-bindings: samsung,mipi-dsim: Add 'lane-polarities'
Date: Tue,  9 May 2023 16:10:58 -0300
Message-Id: <20230509191059.3327960-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

The Samsung DSIM IP block allows the inversion of the clock and
data lanes.

Add an optional property called 'lane-polarities' that describes the
polarities of the MIPI DSI clock and data lanes.

This property is useful for properly describing the hardware when the
board designer decided to switch the polarities of the MIPI DSI
clock and/or data lanes.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Use video-interfaces.yaml (Rob).

 .../display/bridge/samsung,mipi-dsim.yaml     | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
index e841659e20cd..dad6d06fbdd9 100644
--- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml
@@ -105,6 +105,35 @@ properties:
           DSI output port node to the panel or the next bridge
           in the chain.
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                oneOf:
+                  - minItems: 1
+                    maxItems: 4
+                    uniqueItems: true
+                    items:
+                      enum: [ 1, 2, 3, 4 ]
+                    description:
+                      See ../../media/video-interfaces.yaml for details.
+
+              lane-polarities:
+                minItems: 1
+                maxItems: 5
+                items:
+                  enum: [ 0, 1 ]
+                description:
+                  See ../../media/video-interfaces.yaml for details.
+                  The Samsung MIPI DSI IP requires that all the data lanes have
+                  the same polarity.
+
+            dependencies:
+              lane-polarities: [data-lanes]
+
 required:
   - clock-names
   - clocks
-- 
2.34.1

