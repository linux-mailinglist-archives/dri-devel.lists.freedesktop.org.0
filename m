Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E1E5E99BA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 08:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B741910E53B;
	Mon, 26 Sep 2022 06:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C40D10E53A;
 Mon, 26 Sep 2022 06:41:01 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R511e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VQhBgOH_1664174448; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VQhBgOH_1664174448) by smtp.aliyun-inc.com;
 Mon, 26 Sep 2022 14:40:56 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: zhenyuw@linux.intel.com
Subject: [PATCH 2/2] drm/i915/gvt: Remove the unused function get_pt_type()
Date: Mon, 26 Sep 2022 14:40:43 +0800
Message-Id: <20220926064044.53016-1-jiapeng.chong@linux.alibaba.com>
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
Cc: tvrtko.ursulin@linux.intel.com,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 zhi.a.wang@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function get_pt_type is defined in the gtt.c file, but not
called elsewhere, so delete this unused function.

drivers/gpu/drm/i915/gvt/gtt.c:285:19: warning: unused function 'get_pt_type'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2277
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ce0eb03709c3..6cd4c1d386a5 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -282,11 +282,6 @@ static inline int get_next_pt_type(int type)
 	return gtt_type_table[type].next_pt_type;
 }
 
-static inline int get_pt_type(int type)
-{
-	return gtt_type_table[type].pt_type;
-}
-
 static inline int get_entry_type(int type)
 {
 	return gtt_type_table[type].entry_type;
-- 
2.20.1.7.g153144c

