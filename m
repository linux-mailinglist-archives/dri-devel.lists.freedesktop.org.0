Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AF182A9F0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BA610E815;
	Thu, 11 Jan 2024 08:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81E5F10E812;
 Thu, 11 Jan 2024 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=FrZ434+W1oaHLGGNXB
 CK30hsAMgi7pQWiJQDfPcRLLQ=; b=e8NdRELpIGPIble44DcuxfAGwNruZ1dSVP
 SuUjnptJN01jOJlYTIld5f3fXLtfRTcAa9wqa4k6HkLQD6H8eMCt7nmj1qQZTT+O
 N4SgJ5WID4XpGo5rOsKjsXsj8dSN09RioBHFMIV2cwCwIkNketr4ZOr6EkX91rQ0
 J0GIwsqls=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wDXX5TprZ9l1JmXAA--.14692S2;
 Thu, 11 Jan 2024 16:59:21 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon: Clean up errors in rv515.c
Date: Thu, 11 Jan 2024 08:59:19 +0000
Message-Id: <20240111085919.13149-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXX5TprZ9l1JmXAA--.14692S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWDZrWxuFy5Kry8JFWfuFg_yoW3XwbE9a
 1Yqrn3Gay0y3sY9F15AF4q9r92ya1F9Fs5Ga1IqFyktFy7Xw4ruasrGry5Xw48WF4xJFnx
 Aw4kXF13AwsFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUZXo7UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/xtbBEhxi1mVOBlCTEgAAsG
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
 drivers/gpu/drm/radeon/rv515.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
index 76260fdfbaa7..79709d26d983 100644
--- a/drivers/gpu/drm/radeon/rv515.c
+++ b/drivers/gpu/drm/radeon/rv515.c
@@ -42,8 +42,7 @@
 static void rv515_gpu_init(struct radeon_device *rdev);
 int rv515_mc_wait_for_idle(struct radeon_device *rdev);
 
-static const u32 crtc_offsets[2] =
-{
+static const u32 crtc_offsets[2] = {
 	0,
 	AVIVO_D2CRTC_H_TOTAL - AVIVO_D1CRTC_H_TOTAL
 };
-- 
2.17.1

