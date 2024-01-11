Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6467E82A971
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC03310E821;
	Thu, 11 Jan 2024 08:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B7D610E7E4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=WlG3u4VI90oQ5dQx7O
 3zDbT6BFxAUYMaGnbgXPVYfkc=; b=alv8AIjEI43QFMds5jF3YyTT8y3DIYGr+S
 CGXx/to9Lo0plMkEIdflmsBQLtAtmL4rbnQquKrJgVm5YJuZVVzBmCNJ2Zj1iTfh
 NK4yMvZBR+g8cJoKaa+PjHwyT5OYcGCypkMu3GxRmLppZAA05E25WKHQE/LShN6R
 KlhNbKgPI=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3v0cylJ9l+gSRAA--.56957S2;
 Thu, 11 Jan 2024 15:09:38 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 airlied@redhat.com
Subject: [PATCH] dma-buf: Clean up errors in qxl_release.h
Date: Thu, 11 Jan 2024 07:09:36 +0000
Message-Id: <20240111070936.9693-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3v0cylJ9l+gSRAA--.56957S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur13Ww1fXFyUZr48AF4Utwb_yoW3Gwb_WF
 4UXrnrWrsrCF1DC3W7A3y5ZrZIvF98uFWku3Z8tFy3Jry7Ar4UX34qkrZxZ348ZFZrCFsx
 Aa1kXrsxArn3ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjjQ6tUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBNi1mVOBk7AagAAsG
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
Cc: spice-devel@lists.freedesktop.org, GuoHua Chen <chenguohua_716@163.com>,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: else should follow close brace '}'

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..7f7aa7a62629 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -299,8 +299,7 @@ int qxl_alloc_release_reserved(struct qxl_device *qdev, unsigned long size,
 	} else if (type == QXL_RELEASE_CURSOR_CMD) {
 		cur_idx = 2;
 		priority = 1;
-	}
-	else {
+	} else {
 		DRM_ERROR("got illegal type: %d\n", type);
 		return -EINVAL;
 	}
-- 
2.17.1

