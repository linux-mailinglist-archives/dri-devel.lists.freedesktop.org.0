Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D54EAC327A
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 07:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB3A10E00A;
	Sun, 25 May 2025 05:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BZp7qoA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C76110E00A
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 05:16:52 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-442f4d40152so629445e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 22:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748150211; x=1748755011; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=msz6xS+TXEWf8BCe56XVsqhhuQHPDAmqJV6W3BuHJYo=;
 b=BZp7qoA5A7FPX8kJf7H3SUGdj2baFPzdism7sLucRKygu17Uu7CDwbQiUNFdvGgcGs
 nNj63/J1kfbQ8IaKMnRRkjBcHMH3ZUxgjIbg1bv/V0APYrSFqvldJ05ZBC7TiQeicpaJ
 UZGvVKF34xzSv4U9jGeqnBKb5rTnGANNpemnm4o7C8vhhmH4WjWEnMKhaMiyPhZTiwpw
 V+VN2L/+i4BfoIOdUwGDUzty/q3UB7PkUgeGvptBLW4TlCefqpbI31wyCTQPD35jyUEk
 mSZ3sUJJGGXISObkUWxULgu0/DCzA8WproV63pw/4xl7K4IzU4q+z/S4bYXT7IaevYkd
 sIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748150211; x=1748755011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=msz6xS+TXEWf8BCe56XVsqhhuQHPDAmqJV6W3BuHJYo=;
 b=mWpvuR2qtqwNnJB0OIyRUbt9rZ3SBWHSd9HuEGyWIQOq8Q8wSSAfg/X+NiJtyNPyZI
 OgsAWfm/aSTXYWWInvzMu9iksLeHS/JX+LZqYvrtmnJjPYcwtPVmzEJTdOqxC/pBd29/
 oQJWtoDmgkb/GHUuAt7dMGOCjY+26Fvaf3odCNxPeCHEEyHmVA+8MlpZLqu9D+rRq2aE
 CjK2/VeoIU5jheLD0bWsAHETBFWPgFsOu7mqBXB/esoKALozBGuS7EXVWdjTQEwpykny
 cS2ego7OCm6BaHFSdRQZVwrhJhpcDhEs0zWNn1dViM0nIDYct+/oWteJ0g7lkZBNN8+Q
 hu/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ojG/01ocBlA5RNWBys02pRgLa9MPhhvJVGmGJk1uwKq0je69wqqEY+s1+0IfSIfcYgy6grNoILQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFLtkRw+QL6hZyjUXY4AZ/pYPPAEmd0LNM2nZICt0KnDiSr2m+
 G7qKAZrogGkvLTe+8dnNKIkVz5BFk6HQGXKgAcZC0yKTHvu2xyQnrv1Y1UX/LfxC+Uw=
X-Gm-Gg: ASbGncv85BrzLrJLIqSvYAe9iSvElTpUKFSBCEBd2BQZnJPLnGwefLjbxH8xaSlrmdj
 35ipy81FbfAE1/vFNjI3kyfYMXjyU+tTp6tDHkPP7jVl9TuAywt/FgfB6gfgf7bBBbxvix2ng34
 7hJrgiQj7pI2ybiCETZB9CFJtxMQ9wCk9x96pxcpzdgOHz61jvtqWjkYQ31v9YShANV3389ToKk
 ziEGO4DLYs8k0vdj78n1zOWYTJjYW2HkeIaI55eVw71WsRLP1WhzNoS86W0uyLa4txbJ52BZrjA
 +k8zUBgeYDvWRm+8No2pikpktGWpqFK1ZpjXuU2sIlUyzk708opVCOJ2FVeE+Q==
X-Google-Smtp-Source: AGHT+IF/jwowPMNweDb/B2JPyAKFGWGQxdc3mLIKIM4NNW5whKHA8bo7N+3jJruEbrSaU/3hrj+bdA==
X-Received: by 2002:a05:6000:40e0:b0:3a3:62e1:a7dc with SMTP id
 ffacd0b85a97d-3a4cb434a24mr1333037f8f.1.1748150210738; 
 Sat, 24 May 2025 22:16:50 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d67795eesm372940f8f.86.2025.05.24.22.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 22:16:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: mediatek: Constrain iommus
Date: Sun, 25 May 2025 07:16:40 +0200
Message-ID: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3619;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=+5c0VEkCDydqP+dJvv5yWg3lhMM2EDfhOnBOrhDfWlw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoMqe34zQlzL+mH8sYednrPzCB+DkOTefFX/gsg
 CPcqSp2phOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDKntwAKCRDBN2bmhouD
 1+d+D/wO4XWtaSL5Qb2EZcmthSwwShwp2UkTqt4aV2OtyA/7xavezOOZEsI64ORhN+e6aSKIJjt
 8aV5tclmOA+GGI92SpVK3nLJUWcuV1gn87alc+VfrGqU8UfrsDB/lMef5fNZIaqIHJhW3uXoEyK
 jjSdxY2nwJS4tofa8kjxqmuAkmjv/wZasaEbDfw2YiTLu2wWCjmlmO3OsYM9z6KA3j8q1dnW7Dw
 e7tf64cBf5FP0xdNNxBNNWpqggwSqwryvr+6Vxp7GefHghXl/luFwh/31n4jhV5twJXdFX4w6O5
 BIFyepFm4VuMoDeHOXqQsnhUGEob2rU1GSpDzRHtodioeou+G1qQu6RZcRaXILpSMPMY8XTjKfd
 jVQA/q0nNLYctkBfycPA5OiavcADRTUJ5I6a7zUY+7nf689HDwiBzyF9DV6N9djU0jug4Qe37Le
 zzRBlrazoQT2FuQJY9YZiJWwXCG6lv83lYsMSkgHyL98/yTXdy0aHZl08HjdyICYGaHFJ4VnrOy
 0TsfjR0sbuBvtGme9HmCnlehtrp2kRR/gvMEGGAjNWaFb1ANYblR/W0BGN9CsWyiSQoW0Hzq30n
 kxEL8vcOovz7A3QtUcXlvRmkvPf56Mua848yvHoIncqJFWv3t+Ls/bLbqjXzxoH940UIYc7UC1F
 +hPx0ET/ieWU3Gw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Lists should have fixed constraints, because binding must be specific in
respect to hardware.  Add missing constraints to number of iommus in
Mediatek media devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 4 +---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +---
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index bacdfe7d08a6..ac0d924a451b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -45,9 +45,8 @@ properties:
       - description: OVL-2L Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4f110635afb6..c0fd0a91c4d8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -65,9 +65,8 @@ properties:
       - description: OVL Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 878f676b581f..7e5234def39a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -64,9 +64,7 @@ properties:
       - description: RDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,rdma-fifo-size:
     description:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index a3a2b71a4523..276868c0fde7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -43,9 +43,7 @@ properties:
       - description: WDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
-- 
2.45.2

