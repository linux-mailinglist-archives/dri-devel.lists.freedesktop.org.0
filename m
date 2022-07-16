Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B1C57B16E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCC7112BCC;
	Wed, 20 Jul 2022 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCC818AA3A;
 Tue, 19 Jul 2022 11:59:49 +0000 (UTC)
X-QQ-mid: bizesmtp84t1658231978t4u9l6dy
Received: from localhost.localdomain ( [171.223.96.21])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 19 Jul 2022 19:59:36 +0800 (CST)
X-QQ-SSF: 01000000002000F0U000B00A0000020
X-QQ-FEAT: 3uhoZqdeMHMkGTYpkkjDgOhxGAR++wlBx2LmCDenBU68zf3/NsGKrawlk8a1s
 3GQwHzKIHhUpq7Vu+NnGP8opGQyr2IOdnZl4QEr4ZnffrQzsOtA5tEIu5VtWrr5Rr6nZWth
 DVpxdk96/GLl1wgNxcXRsGDK8r0iIgh8XYuTEbPY8wfMDnaGvH1r/tzbSSVawuNaqL81awY
 ctlUKbRpH0G+drjgv+GDGXQJ9uQNVinQtZrDe5Xe+mpHq7lRvDeGgdR+UFuf5WNoyPSDNL7
 3m++iuZYOAm1S/vXw0mj0PYzFxWxnYKuTFtA/YBZa/6juNsubDupYkhSUC56oBtoXH7BdRw
 XPBh/SripEEQzVeC6jDZLqNXIUb2C9k8gNDGXOm9strZoQEVCV72qy1+f5oZw==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: daniel@ffwll.ch
Subject: [PATCH] drm/radeon: Fix comment typo
Date: Sat, 16 Jul 2022 11:57:32 +0800
Message-Id: <20220716035732.30449-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Wed, 20 Jul 2022 07:11:29 +0000
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Jason Wang <wangborong@cdjrlc.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The double `have' is duplicated in line 696, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/radeon/radeon_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 84843b3b3aef..261fcbae88d7 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -693,7 +693,7 @@ int radeon_gem_va_ioctl(struct drm_device *dev, void *data,
 	}
 
 	/* !! DONT REMOVE !!
-	 * We don't support vm_id yet, to be sure we don't have have broken
+	 * We don't support vm_id yet, to be sure we don't have broken
 	 * userspace, reject anyone trying to use non 0 value thus moving
 	 * forward we can use those fields without breaking existant userspace
 	 */
-- 
2.35.1

