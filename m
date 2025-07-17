Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC24B08EFA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF2710E82F;
	Thu, 17 Jul 2025 14:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mfnOiQeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0310E823
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 14:22:04 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-555163cd09aso865246e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752762123; x=1753366923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g7ue/q490Bd452PA3a4MG8OCwMqBN1HWIRSyCiyX4Tk=;
 b=mfnOiQeTdb7RI6B2kh0FjQnpXM60J7Wv7ZiXifJTyFESysKZPsoDB5BVhzAfwW3L/N
 aCfybd0vYDqxtYZE0/MxGUK6JNwlG+MzZo4AHdq2MSC+30RzzwYGG9j2lJCC/8jSbMvF
 K6ykqY3IgbGj2jfr1Nm1vJWd8Pd2ygepycTANJQVC3CvRLoMCVqQu36Qv/RIEWa6Hmic
 zs79sHnFr38DhYWkxJkzeJ8CbYS7hAbIBXqKzQ/m+1fE7kzUEXp90ZzaS9GTVlHtE+G5
 I61wIMwDywrQR97hGs2jCH3LYWBvkcGBTXA+Zlf4ZtgH6bvwt8ds/nVF3bAianNDZwjj
 GM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752762123; x=1753366923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g7ue/q490Bd452PA3a4MG8OCwMqBN1HWIRSyCiyX4Tk=;
 b=XwbdtbiZ+zi7If5Oao8diduWapvAyUKrjunSA8SG3MCd59I4lvCx7GSJuGQe27XZ19
 VMRVrCeski/D/uXazNiDcMrKH6UVprxcDjfPKNIQymYQZXZIBXSXN6w6nmhMUDXKf4D/
 4WShNOZf7QfNhibNnnAbA87p3jkQlUnn7wJ6MlIq0mHlV/IFV0NNjAsN4esqoN+xRZq2
 g5ejvFQNI+9UyI0sd66HfADvl9XOmYedjjDis9/MwCXmamF3o1yPLCdQytzo6X5rUNah
 T6g4l8h3sU8P466zPFoLeIEZBZuBHxGVNooo3q4NZeI/Fktt/2fILKemwocUr8TUBRnF
 1BFw==
X-Gm-Message-State: AOJu0YzWiNhJJJQkOlotFjUMzlng0DTLtQHwmknYcXP6/+nmZk5fNjkd
 E6CXoMs+/ZMnW8dcYzJkhzx5S2tkbi/D5hgS4MBzMDhF/rFm/z2RkDrU
X-Gm-Gg: ASbGncseL9iQIFPJhsLUFnR6FpPz8FyWvuaFFsCJzVyrqhfUiZ9smvyXzOCWi3Sn13V
 tny2n83J++O757s32N5Ewv5cVf9GpVV/WYkfVYA9YmrjkJoGeqqYa5/l4aUPfA7mW+jCQQhkfdD
 IYaYBnxZx3FO69F1Z8VkdQvOIBGbMfyp2qeSUzoPTpRDgZVBVHpJi62ICAgERSKaYESKaG2NjWN
 dYUkv1rnw9aO00/0u+SG0is1bbNi6QwoRVpe3mNRDD7J0amkNSQx/SrXXaXKGAZhwU8wKEorcAL
 plTULzOqgPFp2/xgmq+5nuGH0D8xZXf5RIbmWYA+EN/5o9KM/ZSXbDNN2McY4RCt2xU1FuIA0l2
 K+hJblhZhfKrr1w==
X-Google-Smtp-Source: AGHT+IEYk+/QbStoViVMLJIO/p/fftz94aAho/XA0aw08ZkztVpXmEoajpb3l1K1Fxb88pX9WHm7QA==
X-Received: by 2002:a05:6512:398d:b0:553:35ad:2f45 with SMTP id
 2adb3069b0e04-55a29729104mr984896e87.50.1752762122328; 
 Thu, 17 Jul 2025 07:22:02 -0700 (PDT)
Received: from xeon.. ([188.163.112.60]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b61134sm3079983e87.162.2025.07.17.07.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 07:22:01 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v1 1/5] dt-bindings: display: tegra: document MIPI calibration
 for Tegra20/Tegra30
Date: Thu, 17 Jul 2025 17:21:35 +0300
Message-ID: <20250717142139.57621-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717142139.57621-1-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
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

Adjust Tegra114 MIPI calibration schema to include Tegra20/Tegra30 MIPI
calibration logic.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/tegra/nvidia,tegra114-mipi.yaml   | 41 ++++++++++++++++---
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..ddf1b9fff085 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -16,6 +16,8 @@ properties:
 
   compatible:
     enum:
+      - nvidia,tegra20-mipi
+      - nvidia,tegra30-mipi
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
       - nvidia,tegra210-mipi
@@ -25,12 +27,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: module clock
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    items:
-      - const: mipi-cal
+    minItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
@@ -42,7 +44,36 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     const: 1
 
-additionalProperties: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-dsi
+              - nvidia,tegra30-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: VI module clock
+            - description: CSI module clock
+
+        clock-names:
+          items:
+            - const: vi
+            - const: csi
+    else:
+      properties:
+        clocks:
+          items:
+            - description: module clock
+
+        clock-names:
+          items:
+            - const: mipi-cal
+
+unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.48.1

