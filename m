Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982BEB57298
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 10:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08D110E33D;
	Mon, 15 Sep 2025 08:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="pY4e33IN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 15 Sep 2025 08:11:54 UTC
Received: from out30-98.freemail.mail.aliyun.com
 (out30-98.freemail.mail.aliyun.com [115.124.30.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E9410E33C;
 Mon, 15 Sep 2025 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1757923912; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=bH4bmRFC6mfdBg3cFxo4HyAhTqlu4zYCWpK8buVrQX8=;
 b=pY4e33INxyIKDrtaVKy6OV9lIjAOvFq3KtMvu1OJLJsQI4ZJuysMDP/u+bufa0XvwdxWB4XJxIu6pg2R4sSRCWH5Qvw+4rTRdu45BtHdGGG4Junt66c+QJCHT6Q7ax1rx1IZ/St1+WAogz9fcllWiXoZlqEfPDfMRF7ke0dTGU8=
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0WnzmTq6_1757923608 cluster:ay36) by smtp.aliyun-inc.com;
 Mon, 15 Sep 2025 16:06:49 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next 1/2] drm/xe: Remove duplicated include in xe_pt.c
Date: Mon, 15 Sep 2025 16:06:46 +0800
Message-ID: <20250915080647.669569-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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

The header files xe_tlb_inval_job.h is included twice in xe_pt.c,
so one inclusion of each can be removed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=24705
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 01eea8eb1779..3e33b10e7ba9 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -21,7 +21,6 @@
 #include "xe_sched_job.h"
 #include "xe_sync.h"
 #include "xe_svm.h"
-#include "xe_tlb_inval_job.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_userptr.h"
-- 
2.43.7

