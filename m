Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A54B37B7F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B4A10E71D;
	Wed, 27 Aug 2025 07:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="FTX85omX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1829910E6F8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 05:07:35 +0000 (UTC)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20250827045907epoutp0444b4e6947e8794ff30f42480c07dc6e6~fhvCW50661794517945epoutp04X
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20250827045907epoutp0444b4e6947e8794ff30f42480c07dc6e6~fhvCW50661794517945epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756270747;
 bh=4OaX8SYxIlvnIjTkW++dFL0U3/EmZSsNqRJJF3Co8hI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FTX85omXfrgSzUmKDRyWP3+NX1JgnQV87XUHKwsChnIDBwL2m8HzAyqMDuSCZVBaD
 UX4mOQ3eo1HEpJ8ALuY4/32IKdV9PRQ+TA/4Gl20v7lW8BR5mOFN1P8v9Nt0F3f2Yv
 GQg/RA3sfpp0aVbZxEWu9J0eFDBsQMDbcjL6hVNM=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
 20250827045907epcas2p2330c46b8a707ebf26928786595989d76~fhvB7xaPP1733617336epcas2p2C;
 Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.100]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4cBXPQ5GpDz3hhTQ; Wed, 27 Aug
 2025 04:59:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20250827045906epcas2p2198037517886df0714e24d8d908a6c57~fhvA-1I341733217332epcas2p2Z;
 Wed, 27 Aug 2025 04:59:06 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250827045905epsmtip2928268d367150f1c7d2d0e8b4493e7bb~fhvA3r_Mm1856618566epsmtip2d;
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
Subject: [PATCH 4/4] media: samsung: scaler: Add Kconfig and Makefile
Date: Wed, 27 Aug 2025 04:47:20 +0000
Message-ID: <20250827044720.3751272-5-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827044720.3751272-1-kiisung.lee@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045906epcas2p2198037517886df0714e24d8d908a6c57
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045906epcas2p2198037517886df0714e24d8d908a6c57
References: <20250827044720.3751272-1-kiisung.lee@samsung.com>
 <CGME20250827045906epcas2p2198037517886df0714e24d8d908a6c57@epcas2p2.samsung.com>
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

Add Kconfig and Makefile for Scaler driver directory.
This will serve as the entry point for enabling and building
Exynosautov920 specific device drivers.

Signed-off-by: Kisung Lee <kiisung.lee@samsung.com>
---
 drivers/media/platform/samsung/Kconfig  | 1 +
 drivers/media/platform/samsung/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/media/platform/samsung/Kconfig b/drivers/media/platform/samsung/Kconfig
index 0e34c5fc1dfc..baff5f7b9c3a 100644
--- a/drivers/media/platform/samsung/Kconfig
+++ b/drivers/media/platform/samsung/Kconfig
@@ -8,3 +8,4 @@ source "drivers/media/platform/samsung/s3c-camif/Kconfig"
 source "drivers/media/platform/samsung/s5p-g2d/Kconfig"
 source "drivers/media/platform/samsung/s5p-jpeg/Kconfig"
 source "drivers/media/platform/samsung/s5p-mfc/Kconfig"
+source "drivers/media/platform/samsung/v920-scaler/Kconfig"
diff --git a/drivers/media/platform/samsung/Makefile b/drivers/media/platform/samsung/Makefile
index 21fea3330e4b..7a9e6f126628 100644
--- a/drivers/media/platform/samsung/Makefile
+++ b/drivers/media/platform/samsung/Makefile
@@ -5,3 +5,4 @@ obj-y += s3c-camif/
 obj-y += s5p-g2d/
 obj-y += s5p-jpeg/
 obj-y += s5p-mfc/
+obj-y += v920-scaler/
-- 
2.25.1

