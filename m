Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897CB92CA3F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 07:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DA910E5A6;
	Wed, 10 Jul 2024 05:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="hBxey19p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC4310E5A6
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 05:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1720590591; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=KcWZ936mP77StWiaIt38K+2eLtyyTBUiBBVOItUQAZI=;
 b=hBxey19pLaGZa/lBmLT2X73QDDutjesjqFhYMzWl0Q1OrqUgn2JnCtzNCmK1NG6L3joeo1KU+6BIxoDUMTGIO8WuYasD3GTLeDilf2UOjQkwNNLZYgAXOeddc6dSu5sILZflH56iFwN2v4NJ6WXkL7UaP2fROocB5K+G/tB9wiI=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033068173054;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0WAE92uh_1720590582; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0WAE92uh_1720590582) by smtp.aliyun-inc.com;
 Wed, 10 Jul 2024 13:49:50 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lucas.demarchi@intel.com
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] drm/xe: Remove duplicate generated/xe_wa_oob.h header
Date: Wed, 10 Jul 2024 13:49:41 +0800
Message-Id: <20240710054941.44013-1-jiapeng.chong@linux.alibaba.com>
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

./drivers/gpu/drm/xe/xe_gt.c: generated/xe_wa_oob.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=9493
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index ce8994b808fe..5547191773fb 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -11,8 +11,6 @@
 #include <drm/xe_drm.h>
 #include <generated/xe_wa_oob.h>
 
-#include <generated/xe_wa_oob.h>
-
 #include "instructions/xe_gfxpipe_commands.h"
 #include "instructions/xe_mi_commands.h"
 #include "regs/xe_gt_regs.h"
-- 
2.20.1.7.g153144c

