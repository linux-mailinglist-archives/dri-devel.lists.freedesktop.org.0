Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C026CEBEA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 16:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB90F10E17A;
	Wed, 29 Mar 2023 14:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4D510E17A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 14:42:45 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 h22-20020a4ad756000000b0053e4ab58fb5so1411317oot.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680100964; x=1682692964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4TgCeK/FWwpScXFN0SkgR07QFqbQkFTnE4FHqctST/Q=;
 b=MBlJPXAskV5cOjS851q/v1jvH+O8w4O/Wo26RXvk8iIeJgykY4vkD97EKryHvGt1PR
 g9MtrBxo9oIhw0FBdyPbe1YRhsqWZWgVCjwrwZgBbuvYZ1SPZkkq7MCO7NA8kQgAE2on
 k1i1eKrBurtXPo0/NbokOCD+LuI2jjjEdIAiCkIUoiO7WiJrwLEKHCL3CLU7s+WXKf8a
 l79Rcfg29/qI0zgSGeZ15mxm7Gz9fbJ1BUNmLCTMov/sm8G32mfxLIdxZwH1WOv78oBU
 uqGOLM8yTUFvJEwvK9hyLzSZkTTdXVBL7hXCBCeju6e3oXfFF2p6aoT830nMu0ck+oxP
 EUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680100964; x=1682692964;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4TgCeK/FWwpScXFN0SkgR07QFqbQkFTnE4FHqctST/Q=;
 b=isJV1b+iqJeh/hzOP3+STNdb+KE+mcXu2VgAEadWPUTXTS+ivlBHCjFeCWyPzBxK2W
 IM4j4MFwsXGVf0DOZgUx2UaaFvm2c49CJ/LZZ7ABFNBIAZO90FCx2OcJfiGXDvWwqXrO
 nyJv5cEVWIC3Wu3I+BG5V/V86JWg9RNaKHgjwENiwU0cs4S40b1qLI/NzFj4bNDFWqiO
 t7JzT4j0MprlRDBtkMjNG5dFaNSa9p12FIAT4oah9r1miJYx8tr7+d7NrvzqoSXqxKMF
 7gcVx1sPwCw+p4GqlroapOz/FGvk78Kh6neqTB7zMI6iEZG7lU+XUXGRJZhDSsCkHZ1Q
 fFWg==
X-Gm-Message-State: AO0yUKWNlyl6zM9/0Wb4vjTFGsW66dCK0DNkQEL38YLyAmiKNOT4Y2M1
 1pcnUP9W7DXfmeCds4+Sr8A=
X-Google-Smtp-Source: AK7set/TWkvXPSoOa0QfT40/Y6m8YavrDMihlZIkTI4xvLJMt51azGNhzKDWzbnVRTBqbGD0P8YDDw==
X-Received: by 2002:a4a:c90d:0:b0:525:bdbb:2f94 with SMTP id
 v13-20020a4ac90d000000b00525bdbb2f94mr8394039ooq.1.1680100964557; 
 Wed, 29 Mar 2023 07:42:44 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:1c2d:271:d34:84ea])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a4aad8c000000b0053b909a5229sm7223691oom.4.2023.03.29.07.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 07:42:44 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH 1/2] dt-bindings: display: exynos: dsim: Add 'lane-polarities'
Date: Wed, 29 Mar 2023 11:41:54 -0300
Message-Id: <20230329144155.699196-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

The Samsung DSIM IP block allows the inversion of the clock and
data lanes.

Add an optional property called 'lane-polarities' that describes the
polarities of the MIPI DSI clock and data lanes.

This is property is useful for properly describing the hardware
when the board designer decided to switch the polarities of the MIPI DSI
clock and/or data lanes.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/display/exynos/exynos_dsim.txt      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index 2a5f0889ec32..65ed8ef7aed7 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -29,6 +29,12 @@ Required properties:
 
 Optional properties:
   - power-domains: a phandle to DSIM power domain node
+  - lane-polarities: Array that describes the polarities of the clock and data lanes.
+    1: inverted polarity
+    0: normal polarity
+    The first entry corresponds to the clock lanes. Subsequent entries correspond to the data lanes.
+    Example of a 4-lane system with only the clock lanes inverted:
+    lane-polarities = <1 0 0 0 0>;
 
 Child nodes:
   Should contain DSI peripheral nodes (see MIPI DSI bindings [1]).
-- 
2.34.1

