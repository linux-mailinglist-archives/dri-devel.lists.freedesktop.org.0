Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B7682A9B2
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268F110E85E;
	Thu, 11 Jan 2024 08:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05C3E10E1A0;
 Thu, 11 Jan 2024 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=pqAv59DnHmAlYYjDto
 1NDLdVrv6L33IDTawGCAaJOeU=; b=HJkso97mQtk9PZ9uFr5mcW836PxwccLtOb
 84z+xkNYHH9DBmzfBGPCHu/78SKbIGkrdFGr2xjqRCO+YnIX++tmeqKjyMIRYxQG
 uEGjKxpm4ONC68Lws3CEzroIwIyPZ0B4WyXljuyXoOCTHbrrHGRC6xImJehLNQih
 0XnXO98zw=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wDH76ZuqJ9lXb2UAA--.19493S2;
 Thu, 11 Jan 2024 16:35:58 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in rs600.c
Date: Thu, 11 Jan 2024 08:35:56 +0000
Message-Id: <20240111083556.12325-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDH76ZuqJ9lXb2UAA--.19493S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWDZrWxuFy5Kry8JFWfuFg_yoW3Xwb_C3
 WUXrs7uay0yr9Y9F12vr4DZr92vw409FZ3G3WIy3WxKry2qr1fua4DKr1Yqw48WFsrXF1D
 Ja1vqF13CrsrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqBNi1mVOBlDa0AAAs4
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

ERROR: that open brace { should be on the previous line

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/radeon/rs600.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
index 8cf87a0a2b2a..5c162778899b 100644
--- a/drivers/gpu/drm/radeon/rs600.c
+++ b/drivers/gpu/drm/radeon/rs600.c
@@ -54,8 +54,7 @@
 static void rs600_gpu_init(struct radeon_device *rdev);
 int rs600_mc_wait_for_idle(struct radeon_device *rdev);
 
-static const u32 crtc_offsets[2] =
-{
+static const u32 crtc_offsets[2] = {
 	0,
 	AVIVO_D2CRTC_H_TOTAL - AVIVO_D1CRTC_H_TOTAL
 };
-- 
2.17.1

