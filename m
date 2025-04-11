Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DC6A8517B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 04:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0451A10E0B5;
	Fri, 11 Apr 2025 02:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="GQLVU/J6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-101.freemail.mail.aliyun.com
 (out30-101.freemail.mail.aliyun.com [115.124.30.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0905B10E0B5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 02:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1744337881; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=BdLZmdV+hwJS8JC30tpB+FUcf/zAetbbZwWetwKbEfU=;
 b=GQLVU/J6jGusG2qg3nfrQ5k4LbLJ0KR/suvwXsy4i1itrYAA2XfJu/b1nEP0O+v7zA+46Jai7movhAKZbUkq+PjOYkKi3H62Ft0l2uHn/7cnxjpHPmQm5R1s/1o25Z+I7IlglsFMIXpN86s2o+WdxRSDFX7dYvMg4B096r4Bs4A=
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WWRB-R7_1744337873 cluster:ay36) by smtp.aliyun-inc.com;
 Fri, 11 Apr 2025 10:18:00 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: matthew.brost@intel.com
Cc: dakr@kernel.org, phasta@kernel.org, ckoenig.leichtzumerken@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/sched: Remove duplicate linux/atomic.h header
Date: Fri, 11 Apr 2025 10:17:50 +0800
Message-Id: <20250411021750.64839-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
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

./drivers/gpu/drm/scheduler/tests/sched_tests.h: linux/atomic.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=20293
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/scheduler/tests/sched_tests.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
index 27caf8285fb7..690a892ed659 100644
--- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
+++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
@@ -11,7 +11,6 @@
 #include <linux/hrtimer.h>
 #include <linux/ktime.h>
 #include <linux/list.h>
-#include <linux/atomic.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 
-- 
2.32.0.3.g01195cf9f

