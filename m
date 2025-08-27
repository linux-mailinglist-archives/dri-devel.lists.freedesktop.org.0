Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F950B37B94
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A5010E737;
	Wed, 27 Aug 2025 07:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="qqeX1/48";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at gabe;
 Wed, 27 Aug 2025 05:04:18 UTC
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40AE10E6F8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 05:04:18 +0000 (UTC)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20250827045907epoutp03e79565d0c1f4fcf6c43d5b150e27c825~fhvChj2Qb1999319993epoutp03q
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20250827045907epoutp03e79565d0c1f4fcf6c43d5b150e27c825~fhvChj2Qb1999319993epoutp03q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756270747;
 bh=8oixCpq4frQkHJU5kPDWHHO8FnB0bWWAyMSsLl8RP6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qqeX1/48myY0kVClgM04MOHYWrhW8F/qrchPTWqSl6c4kWaC7c3nNK90Z1jSVzLnl
 ekDDPBcjuFdjGAI1eABnCrmT2+XuXWT3WEu2qkDJs57VKik1fcxhGntrE1g0/ZP1Ga
 NTa3VzzLbipMV2op+0JBsXeCfgJ9exYCXlcTpNLw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
 20250827045907epcas2p14cd817aeb803e37481873e88e923355a~fhvCCg1GE1186511865epcas2p1f;
 Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.91]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cBXPQ25Hmz3hhTD; Wed, 27 Aug
 2025 04:59:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20250827045905epcas2p4b2cbd4b881af1c1be4b345861d1a635b~fhvAflIe82320923209epcas2p4t;
 Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250827045905epsmtip2009f0b11b3909a6cc82fa31a646beeb5~fhvASaS5H1855818558epsmtip2h;
 Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
From: Kisung Lee <kiisung.lee@samsung.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Kisung Lee <kiisung.lee@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: soc: samsung: scaler: exynos: Add
 ExynosAutov920 compatible
Date: Wed, 27 Aug 2025 04:47:17 +0000
Message-ID: <20250827044720.3751272-2-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045905epcas2p4b2cbd4b881af1c1be4b345861d1a635b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045905epcas2p4b2cbd4b881af1c1be4b345861d1a635b
References: <20250827044720.3751272-1-kiisung.lee@samsung.com>
 <CGME20250827045905epcas2p4b2cbd4b881af1c1be4b345861d1a635b@epcas2p4.samsung.com>
X-Mailman-Approved-At: Wed, 27 Aug 2025 07:22:35 +0000
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

Add samsung,exynos5-scaler compatible for ExynosAutov920 SoC.

Signed-off-by: Kisung Lee <kiisung.lee@samsung.com>
---
 Documentation/devicetree/bindings/gpu/samsung-scaler.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
index 9fb530e65d0e..5a472e29dc8a 100644
--- a/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
+++ b/Documentation/devicetree/bindings/gpu/samsung-scaler.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - samsung,exynos5420-scaler
       - samsung,exynos5433-scaler
+      - samsung,exynos5-scaler
 
   reg:
     maxItems: 1
-- 
2.25.1

