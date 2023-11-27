Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4745F7F9702
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 02:04:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B3510E164;
	Mon, 27 Nov 2023 01:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-112.freemail.mail.aliyun.com
 (out30-112.freemail.mail.aliyun.com [115.124.30.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBB510E163
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 01:04:35 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R971e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0Vx7Xb75_1701047071; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Vx7Xb75_1701047071) by smtp.aliyun-inc.com;
 Mon, 27 Nov 2023 09:04:32 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH -next] drm/imagination: Remove unneeded semicolon
Date: Mon, 27 Nov 2023 09:04:30 +0800
Message-Id: <20231127010430.119666-1-yang.lee@linux.alibaba.com>
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
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matt.coster@imgtec.com,
 Yang Li <yang.lee@linux.alibaba.com>, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

./drivers/gpu/drm/imagination/pvr_free_list.c:258:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7635
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/imagination/pvr_free_list.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_free_list.c b/drivers/gpu/drm/imagination/pvr_free_list.c
index c61fd417edcb..5e51bc980751 100644
--- a/drivers/gpu/drm/imagination/pvr_free_list.c
+++ b/drivers/gpu/drm/imagination/pvr_free_list.c
@@ -255,7 +255,7 @@ pvr_free_list_insert_pages_locked(struct pvr_free_list *free_list,
 
 		if (!num_pages)
 			break;
-	};
+	}
 	/* clang-format on */
 
 	/* Make sure our free_list update is flushed. */
-- 
2.20.1.7.g153144c

