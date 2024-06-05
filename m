Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B09AE8FC97E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 12:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B2710E4A2;
	Wed,  5 Jun 2024 10:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cLECBAZo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DE410E4A2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 10:57:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-421392b8156so20261545e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 03:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717585024; x=1718189824; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h23rJhkzcdNUIkugpoAcaZsXI84pnHqCrii/WaDJ/bw=;
 b=cLECBAZoK+WoCgBJTqOT+8HGtxspjy4K/CN7oYU2RrqDwIptnDK7JpxE9ZQ4xi/SNJ
 ez7cjEYaMmy/j9zzRNGI0/VhIZ97Jd9HjgYXYCWwdv7JnQtcLzr4mdHZMRAU7lagYkzE
 MmiYhJTI4f9ovvUvD/jUQms+0m4N3+XI/l+Nr03SXyB4YOk/dTuNo47Rzd+bmECe6jMb
 09PJ0UqmIcmCqGrUEI6wqHjOKo2yLV9t5D/GKDYvFHppDZw5vOCMhprufL4SHw/8562T
 XP9l42p32j2JPqluksWZv0owI9SDPn11+cdZPQqWzWIVfqi5xE7kM7K0rEr8DIilbt1D
 9NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717585024; x=1718189824;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h23rJhkzcdNUIkugpoAcaZsXI84pnHqCrii/WaDJ/bw=;
 b=mulGNHH+gFQb9OpHcs3spBdnpV405WOe74cqGToluDRRWtO776wbxc98NaMXkz1kjt
 Qd+wyY/WGacuVM0UrXVAE7turLKSqjiKzRKpz9Xus0DN56fUP4SPoFCrF6tGQ0TfbYMf
 2tHL7EmSHABPFlSefdKa+OKqHQT78Nb4TG9mAeIVr8EIpBb2pV4FWJcBt3Wz29gMl6Hz
 AqBxGwKdYDOOTBxbU8IHHzNFI8muWhiNGs24T942GEa/+RS3rV/NGS6eDSI/DMXnQJd1
 kZTs/QDEBPYQk1uF/HUnGl3DMKHfYtPlJNHnWZnVbqgJXLVblrpeOA8zKQ/KeSAY2jOA
 kmWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKh612niqY2YhN6vmFpix4eyBq6zmTaJltD9G2mrquL1s/d5Au0K6v5y5eB/TUzDJgkqHg1zNS9L0mUpY2XacKc0cTaZT6Ju9OsnEKlaLD
X-Gm-Message-State: AOJu0YygjyoQlTjBd1j+U1kRdVHiTIMykrYSHUUcXMvzaHW81RHrJ9jN
 zMbk5zwnbK62hFikc64Dvpe6/NEx9oqPXsQSLld0jrYPj8A+nVG4L2xy/KWJDBU=
X-Google-Smtp-Source: AGHT+IFGPo/96hccbojOu1aKs4N1JEV7FxLvULnYmJBPJcHF19qcyQLnJ1sfkfuMEPY2OxD9IK1ZTg==
X-Received: by 2002:a05:600c:4fd3:b0:41b:855b:5d26 with SMTP id
 5b1f17b1804b1-421562c2773mr17454165e9.2.1717585023717; 
 Wed, 05 Jun 2024 03:57:03 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421581016e0sm17653855e9.9.2024.06.05.03.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 03:57:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Wronek <david@mainlining.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display: panel: constrain 'reg' in DSI panels
 (part two)
Date: Wed,  5 Jun 2024 12:56:59 +0200
Message-ID: <20240605105659.27433-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
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

DSI-attached devices could respond to more than one virtual channel
number, thus their bindings are supposed to constrain the 'reg' property
to match hardware.  Add missing 'reg' constrain for DSI-attached display
panels, based on DTS sources in Linux kernel (assume all devices take
only one channel number).

Few bindings missed previous fixup: LG SW43408 and Raydium RM69380.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This should apply on any tree.
---
 .../devicetree/bindings/display/panel/lg,sw43408.yaml        | 4 +++-
 .../devicetree/bindings/display/panel/raydium,rm69380.yaml   | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
index 1e08648f5bc7..bbaaa783d184 100644
--- a/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lg,sw43408.yaml
@@ -21,7 +21,9 @@ properties:
     items:
       - const: lg,sw43408
 
-  reg: true
+  reg:
+    maxItems: 1
+
   port: true
   vddi-supply: true
   vpnl-supply: true
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
index b17765b2b351..ec445ff5631c 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
@@ -28,6 +28,9 @@ properties:
       to work with the indicated panel. The raydium,rm69380 compatible shall
       always be provided as a fallback.
 
+  reg:
+    maxItems: 1
+
   avdd-supply:
     description: Analog voltage rail
 
@@ -38,8 +41,6 @@ properties:
     maxItems: 1
     description: phandle of gpio for reset line - This should be active low
 
-  reg: true
-
 required:
   - compatible
   - reg
-- 
2.43.0

