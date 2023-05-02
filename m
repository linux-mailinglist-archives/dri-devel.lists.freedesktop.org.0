Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 484536F4334
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 14:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6517D10E0DF;
	Tue,  2 May 2023 12:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508B510E0DF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 12:00:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-95f4c5cb755so729789366b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 05:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683028846; x=1685620846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=f3Lfco4BnCXSWDeSvGyocalO93LWCUXAn4Hyq4qa2GU=;
 b=k0Qq8qmjrUvfH6d/fC9U0sPZuAEoXcPQ4JTMgHYGwISYhsa+oGHET4gBj5mRXV5BY6
 J9oPKo6p6LNHUzk6fNIf1/8kxsUPtVW9Q/ap8x6H4UR0256dSsZKyyxiMM6bu9JmZAgD
 C3ul8k+qwtitqBiLFWI8XgCyZuh7Ma+NNHjVrxGHXaDpxWvzHFcwmACfQns75pQTOJmh
 /amtYuMgcdsWfxX0xl9doBLJhh7lzyKykOA3ZcSwH2mEBLq2MgB1AgriHZ0275vZbhcJ
 b++yGidZypMKNhCy9xAA4L4h4ef9MN65JVflD0AjbCpmbmYev0QUORf1kf3lOqVWZbPs
 YZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683028846; x=1685620846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f3Lfco4BnCXSWDeSvGyocalO93LWCUXAn4Hyq4qa2GU=;
 b=I0UUYzFFjTEsT0qsM5NCnIi+wOKBICfycJyoT/5QL7eeeNZ2Xwww4lXgPDmWYymsb9
 g9lAuZC8IWAuNDVBhyEr+4DK5wthOr31ca8PzLxOHowcyzfrynVa0xbrasP9pZWC9KWU
 7RzjEy5yVuPgWRPNUum+wpOBbaid1Ix2FGlqiZeSOxcCFEZ8bKLxW80B8VFYTK28QjOW
 wTFernZsV71bbKlIrRhlNlBXTIdDj23F/RNpjvenBAUaI41JNsE8QYzhUj31MHB2muBZ
 jmBszgto5RgIru2Yl+Oo2QGo6VliGbAhf/o8c6uSFm4ajvix0C4+1DPlKZHi3xvHbUf5
 8bsA==
X-Gm-Message-State: AC+VfDxcNW7zzhgLrXEUMbTXQgyXZZOJsSPWQL9TgYalpHRZgG2ev5uH
 x4ByGmGBlA2TXUCHFpivminT+Q==
X-Google-Smtp-Source: ACHHUZ4A7IqeyLXRL8smscOzdIf9v+IQzynF+xG31Ayj1umN6zEC38/CTVoxXfWwQg6EJ/5ynn1J+A==
X-Received: by 2002:a17:907:6d19:b0:94f:720b:1b14 with SMTP id
 sa25-20020a1709076d1900b0094f720b1b14mr16467542ejc.29.1683028846077; 
 Tue, 02 May 2023 05:00:46 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a1709063bca00b0094ee3e4c934sm16063403ejf.221.2023.05.02.05.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:00:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: novatek,nt35950: define ports
Date: Tue,  2 May 2023 14:00:35 +0200
Message-Id: <20230502120036.47165-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The panel-common schema does not define what "ports" property is, so
bring the definition to enforce the type.  Panels can be single- or
dual-link, thus require only one port@0.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Rework to add ports to device schema, not to panel-common.
https://lore.kernel.org/all/20230420160905.GA2952736-robh@kernel.org/
---
 .../bindings/display/panel/novatek,nt35950.yaml           | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
index 377a05d48a02..c93cc1018b41 100644
--- a/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt35950.yaml
@@ -47,8 +47,13 @@ properties:
   vddio-supply:
     description: regulator that supplies the I/O voltage
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    required:
+      - port@0
+
   backlight: true
-  ports: true
   reg: true
 
 required:
@@ -59,6 +64,7 @@ required:
   - avee-supply
   - dvdd-supply
   - vddio-supply
+  - ports
 
 additionalProperties: false
 
-- 
2.34.1

