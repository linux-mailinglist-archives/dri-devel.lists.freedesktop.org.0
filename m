Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEE893FFE9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 22:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C3B10E485;
	Mon, 29 Jul 2024 20:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IiZrmSIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE2310E485
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 20:57:36 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1fc66fc35f2so22357395ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 13:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722286656; x=1722891456; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XsyB4/IEI7fiDC+zo5ayLI7NX3RD/fWy5l3aPy+UUL8=;
 b=IiZrmSIyYFu5x0NiwlMkDV6ganganSOYDxQMI1GAvbZKU10t5tcuZhMS5W/eQVHlUZ
 JCyrG/JaRkEclD4Me4IEDU+lJvVFOQq5JJiEZ3fGPiy5lmadSiq+sPYEBXKfuJbOniYd
 mEMivHzTxfgjROhYW/PSwQdezdjjYcy0zVmc8eUw7z8SL2Ap/+TdjCb5l4rHfNGCeya1
 SapW2OSPBZ2jCopFfQxb+UZsBocGMLvNbuIwXkKSDpf7rZ2aCxQsQZw8QaJiW9VJ867s
 jDJ9dT7bUzweUXgtBHM1UsZW1cA0iFgmW9bK+rChARl3qDXssTOFZ7NVUR3hr7ziiPSp
 8I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722286656; x=1722891456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XsyB4/IEI7fiDC+zo5ayLI7NX3RD/fWy5l3aPy+UUL8=;
 b=rw9krd4ke0qbGgY9OSGXqsooQFLdBnd/hnk4T33sHRnSk4no2Kz9AvB7OGnHY0VAsr
 18LyvA39BoxFyCtmb9b8lHk6rmkVbE/nMARA1vwGdkh6lv5NM2k7YQajtiuRBngNktGL
 UyH165awy/oFwBk8H7ewfIna26rZX+f+JNaDmXFX9+J8gQ6wjcA+TSrIO+hD2fGVMWaI
 cKFFG6/2gCx2eSnjKdXmWnc1RzeVFD6HgNDz02PDYH8qDvJilD7C6IT8BA7/XabbEVzd
 rJa8V4s2Fq//rNXQ+gzH0N4ucgyWvPO8aZZk7DpvBQJeHy3EKuijU0Ejpk6n59IlWB+U
 0wNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpOZ8ty/Jz7g9p7i4GSKxBYlntYwyhtaolY8fi882MO/KU8OX4bDT7QFSr3IPn5FBo7HvQsbj9JAeQdT49dCmq+4gtnwmJ9H/DGJf91j8d
X-Gm-Message-State: AOJu0YzJmSoATwt4C9Ez4yqQ0rbjBPWgq7iS52g572HvmnNYtjybSVRz
 EW7IbVAsW1iODtxx9bQbNWnTa2uVpuhYcsDWYxTdzRQQ5R8zkGHu
X-Google-Smtp-Source: AGHT+IE7RlpPM0Ve8QorkWwBam/ulv41RrYw3YyiYgnmag2XmMfjp/FbZt1JmjuYH8DymxzoGN/ZDQ==
X-Received: by 2002:a17:903:41d2:b0:1fd:6581:93c5 with SMTP id
 d9443c01a7336-1ff04b1c364mr140162675ad.27.1722286655550; 
 Mon, 29 Jul 2024 13:57:35 -0700 (PDT)
Received: from localhost ([100.84.200.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fed7f6dc27sm87414365ad.237.2024.07.29.13.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 13:57:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Clark <robdclark@chromium.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/2] dt-bindings: display: panel: samsung,
 atna45dc02: Document ATNA45DC02
Date: Mon, 29 Jul 2024 13:57:24 -0700
Message-ID: <20240729205726.7923-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The Samsung ATNA45DC02 panel is an AMOLED eDP panel, similar to the
existing ATNA45AF01 and ATNA33XC20 panel but with a higher resolution.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/display/panel/samsung,atna33xc20.yaml       | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index 5192c93fbd67..87c601bcf20a 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -17,10 +17,13 @@ properties:
     oneOf:
       # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
       - const: samsung,atna33xc20
-      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
       - items:
-          - const: samsung,atna45af01
-          - const: samsung,atna33xc20
+        - enum:
+          # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
+          - samsung,atna45af01
+          # Samsung 14.5" 3K (2944x1840 pixels) eDP AMOLED panel
+          - samsung,atna45dc02
+        - const: samsung,atna33xc20
 
   enable-gpios: true
   port: true
-- 
2.45.2

