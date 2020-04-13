Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BF61A7436
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFF58919D;
	Tue, 14 Apr 2020 07:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B4B389F01;
 Mon, 13 Apr 2020 14:06:16 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 94F0C48F6690EAB73C69;
 Mon, 13 Apr 2020 22:06:14 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 13 Apr 2020
 22:06:07 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <yanaijie@huawei.com>, <sam@ravnborg.org>, <y.oudjana@protonmail.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amdgpu: remove dead code in si_dpm.c
Date: Mon, 13 Apr 2020 22:32:35 +0800
Message-ID: <20200413143235.22945-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code is dead, let's remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/si_dpm.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.c b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
index 0860e85a2d35..c00ba4b23c9a 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
@@ -345,26 +345,6 @@ static const struct si_dte_data dte_data_tahiti =
 	false
 };
 
-#if 0
-static const struct si_dte_data dte_data_tahiti_le =
-{
-	{ 0x1E8480, 0x7A1200, 0x2160EC0, 0x3938700, 0 },
-	{ 0x7D, 0x7D, 0x4E4, 0xB00, 0 },
-	0x5,
-	0xAFC8,
-	0x64,
-	0x32,
-	1,
-	0,
-	0x10,
-	{ 0x78, 0x7C, 0x82, 0x88, 0x8E, 0x94, 0x9A, 0xA0, 0xA6, 0xAC, 0xB0, 0xB4, 0xB8, 0xBC, 0xC0, 0xC4 },
-	{ 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700 },
-	{ 0x2AF8, 0x2AF8, 0x29BB, 0x27F9, 0x2637, 0x2475, 0x22B3, 0x20F1, 0x1F2F, 0x1D6D, 0x1734, 0x1414, 0x10F4, 0xDD4, 0xAB4, 0x794 },
-	85,
-	true
-};
-#endif
-
 static const struct si_dte_data dte_data_tahiti_pro =
 {
 	{ 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
