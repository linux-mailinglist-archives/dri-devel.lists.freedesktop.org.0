Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC39357CCD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 08:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935096EA11;
	Thu,  8 Apr 2021 06:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909C36EA10;
 Thu,  8 Apr 2021 06:54:45 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGBlg3NC6zyNlN;
 Thu,  8 Apr 2021 14:52:31 +0800 (CST)
Received: from huawei.com (10.67.174.96) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 14:54:32 +0800
From: Zhang Jianhua <zhangjianhua18@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lyude@redhat.com>
Subject: [PATCH -next] drm/nouveau/nvenc: delete redundant header file priv.h
Date: Thu, 8 Apr 2021 14:54:37 +0800
Message-ID: <20210408065437.175608-1-zhangjianhua18@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.96]
X-CFilter-Loop: Reflected
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
Cc: zhangjianhua18@huawei.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The header file priv.h has been included two times in base.c,
delete the redundant one.

Signed-off-by: Zhang Jianhua <zhangjianhua18@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
index c39e797dc7c9..cf5dcfda7b25 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
@@ -21,7 +21,6 @@
  */
 #include "priv.h"
 
-#include "priv.h"
 #include <core/firmware.h>
 
 static void *
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
