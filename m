Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF328A48AF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 09:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7913A112239;
	Mon, 15 Apr 2024 07:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ccdCgo/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 13186 seconds by postgrey-1.36 at gabe;
 Mon, 15 Apr 2024 07:07:35 UTC
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D563112239;
 Mon, 15 Apr 2024 07:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1713164852; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=f78laVDT74bv+AVMGVZViOyOOk+q6lg37f3PWzvCEN4=;
 b=ccdCgo/B2Wo4YG5awqf+36ApdUbKuN2Zh/J/Ybn9cn64YndSrwY6Bdi3YgZGKUjBKgy5HONXK7VKEJlhMKQCED+nJPY9PbVntqaBjTjakTTyLNE5wr9NmI95jy9MHqrPeUZ864kyvSE/u1z4QvopKc9pPnw+sfxr3jkXTBFRABM=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0W4WgZ8V_1713164843; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0W4WgZ8V_1713164843) by smtp.aliyun-inc.com;
 Mon, 15 Apr 2024 15:07:30 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lucas.demarchi@intel.com
Cc: ogabbay@kernel.org, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH v2] drm/xe/irq: Remove unnecessary semicolon in
 pick_engine_gt()
Date: Mon, 15 Apr 2024 15:07:22 +0800
Message-Id: <20240415070722.5131-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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

No functional modification involved.

./drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8757
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -Make the commit message more clearer.

 drivers/gpu/drm/xe/xe_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 996806353171..5b1a2f46a1b2 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -276,7 +276,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
 			return tile->media_gt;
 		default:
 			break;
-		};
+		}
 		fallthrough;
 	default:
 		return tile->primary_gt;
-- 
2.20.1.7.g153144c

