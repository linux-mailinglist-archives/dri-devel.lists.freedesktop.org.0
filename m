Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F2A82A9A6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8F610E84D;
	Thu, 11 Jan 2024 08:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD1B610E7C8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=R8VFdJC97hGi6WO7sk
 P6qyL2qnnTIh7AwE9P1ND/YWU=; b=IuYA6eEoUN8jXWDf/dlMDBMmMSWwjSmHgZ
 EPAupVCZx6oULRtVs2eq3pIiAGY/8kFu9C21+GPLIMgd3kZTALqKgrnnD6CgTVjG
 NxsZ94RZrVtZqxuZy7JSM/ijPw1moJk61JhssiF1srWzdmDsf7rlR/Kw/+zBoWhP
 BbFxlb/9o=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wDXv5Dokp9lWXmQAA--.19329S2;
 Thu, 11 Jan 2024 15:04:08 +0800 (CST)
From: GuoHua Chen <chenguohua_716@163.com>
To: tzimmermann@suse.de, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 daniel@ffwll.ch, mripard@kernel.org, patrik.r.jakobsson@gmail.com
Subject: [PATCH] drm/gma500: Clean up errors in intel_gmbus.h
Date: Thu, 11 Jan 2024 07:04:06 +0000
Message-Id: <20240111070406.9430-1-chenguohua_716@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wDXv5Dokp9lWXmQAA--.19329S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw45KryUWr48CFWUZrW3trb_yoW3Xwb_uF
 s8Jr48u395CF9agF13AF4Y9rWjvr1Y9r4kA3Wrta47t3W5Ar1Uu34v9FyUWrW8WFy7Wa9r
 Ja1kXF1FqFsrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjb4S3UUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: xfkh0w5xrk3tbbxrlqqrwthudrp/1tbiqAli1mVOBk6dnAAAs3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 GuoHua Chen <chenguohua_716@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: space prohibited after that '!' (ctx:BxW)

Signed-off-by: GuoHua Chen <chenguohua_716@163.com>
---
 drivers/gpu/drm/gma500/intel_gmbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
index aa45509859f2..769e47480e11 100644
--- a/drivers/gpu/drm/gma500/intel_gmbus.c
+++ b/drivers/gpu/drm/gma500/intel_gmbus.c
@@ -39,7 +39,7 @@
 #define _wait_for(COND, MS, W) ({ \
 	unsigned long timeout__ = jiffies + msecs_to_jiffies(MS);	\
 	int ret__ = 0;							\
-	while (! (COND)) {						\
+	while (!(COND)) {						\
 		if (time_after(jiffies, timeout__)) {			\
 			ret__ = -ETIMEDOUT;				\
 			break;						\
-- 
2.17.1

