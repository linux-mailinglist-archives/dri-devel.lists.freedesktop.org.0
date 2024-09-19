Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748D97D1A5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 09:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9C410E7C8;
	Fri, 20 Sep 2024 07:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="gwuMj+Rw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8442910E040
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 15:21:05 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 6C96323D4F;
 Thu, 19 Sep 2024 17:21:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNWoonSMiFBj; Thu, 19 Sep 2024 17:21:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1726759263; bh=nvVtJPZU+6i/0iKiXxq0eINrojPz7dYMmz/1raiBwfw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=gwuMj+RwZMpwd6/9vwtYGrppumnTO+qGQlMpTtJ1TVudHFNR/ZjqUykKTazDdSSXz
 WZBRnt4N4d2HGJ00vXRCFsvZ9i4YZ0tV1yZy5VyHrQtv9nYa7GnQB420X0RhkWMzUU
 4wqRg474W28Rvd6bTlCFGIAiACDItLBxzW6wCC6VJU15NHyyGq2FJS11lNkJM73rAF
 yzwCjsiLzPCTk54W2k+WZkhtM40ZK5t4LXk1G7Yrfnc2vkoZf4SgvSYC+tmo3ILv0c
 Nh6w1djHuKjpyRww3NTODoSKuiwOomoiCNczoMNqv/GH1VvaCIr//Z6dwgPMpUcDSk
 NiPAhJ0wIPRvA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: kauschluss@disroot.org
Cc: airlied@gmail.com, alim.akhtar@samsung.com, conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 inki.dae@samsung.com, krzk@kernel.org, kyungmin.park@samsung.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch,
 sw0312.kim@samsung.com, tzimmermann@suse.de
Subject: [PATCH 6/6] dt-bindings: display: samsung,
 exynos7-decon: add exynos7870 compatible
Date: Thu, 19 Sep 2024 20:50:42 +0530
Message-ID: <20240919-exynosdrm-decon-v1-6-8c3e3ccffad5@disroot.org>
In-Reply-To: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Sep 2024 07:22:50 +0000
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

Add the compatible string of Exynos7870 to the existing list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 .../devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
index 992c23ca7a4e..53916e4c95d8 100644
--- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
+++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: samsung,exynos7-decon
+    enum:
+      - samsung,exynos7-decon
+      - samsung,exynos7870-decon
 
   clocks:
     maxItems: 4

-- 
2.46.1
