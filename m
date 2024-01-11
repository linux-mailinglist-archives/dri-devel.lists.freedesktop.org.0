Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CAF82A98E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F8610E850;
	Thu, 11 Jan 2024 08:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC76510E589;
 Thu, 11 Jan 2024 08:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=Ec0SMURkHcRLbm9pR8
 p3/Y4NEdzpA/NYtXmEiNFKUR8=; b=AaxgRjc7rY6+RThdQlV5O8IjXjitP6pBmR
 S3LtCfx7XAboWi+WKhAOrjmY2UUoisqSERwpqsQiIiIivSYJDR67b8A6qg/JbrwP
 NFCIvH9AicjJRglkpNzDRQdc6qzotreEnYqEnZRRi+uYZZ5bjS+8BqzU+DvR2X8F
 eGYZHC5cA=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wDnb5FbpJ9lFPKUAA--.20884S2;
 Thu, 11 Jan 2024 16:18:35 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in radeon_asic.c
Date: Thu, 11 Jan 2024 08:18:34 +0000
Message-Id: <20240111081834.11664-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDnb5FbpJ9lFPKUAA--.20884S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4kWr13GFW5Zr47KFyDWrg_yoWDuFcEgr
 WDZryxJas2yF93WF17Cr1jkFySkr409rWrWF12q3WFqry8WryxXFW5JFyUZw4UX3Wakr1D
 Jr18KFnxJrs3KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEB5i1mVOBk+DQQACsY
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: GuoHua Chen <chenguohua_716@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: spaces required around that '||' (ctx:VxE)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/radeon_asic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_asic.c b/drivers/gpu/drm/radeon/radeon_asic.c
index 802b5af19261..b5a0109b2e2c 100644
--- a/drivers/gpu/drm/radeon/radeon_asic.c
+++ b/drivers/gpu/drm/radeon/radeon_asic.c
@@ -2400,10 +2400,10 @@ int radeon_asic_init(struct radeon_device *rdev)
 	case CHIP_RS880:
 		rdev->asic = &rs780_asic;
 		/* 760G/780V/880V don't have UVD */
-		if ((rdev->pdev->device == 0x9616)||
-		    (rdev->pdev->device == 0x9611)||
-		    (rdev->pdev->device == 0x9613)||
-		    (rdev->pdev->device == 0x9711)||
+		if ((rdev->pdev->device == 0x9616) ||
+		    (rdev->pdev->device == 0x9611) ||
+		    (rdev->pdev->device == 0x9613) ||
+		    (rdev->pdev->device == 0x9711) ||
 		    (rdev->pdev->device == 0x9713))
 			rdev->has_uvd = false;
 		else
-- 
2.17.1

