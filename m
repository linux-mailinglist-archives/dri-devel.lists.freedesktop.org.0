Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A116BCAA6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5F810E080;
	Thu, 16 Mar 2023 09:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF8110E080
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:20:56 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R551e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VdzzZt9_1678958451; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VdzzZt9_1678958451) by smtp.aliyun-inc.com;
 Thu, 16 Mar 2023 17:20:52 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: jani.nikula@linux.intel.com
Subject: [PATCH -next] drm/i915/wm: Fix some kernel-doc comments
Date: Thu, 16 Mar 2023 17:20:50 +0800
Message-Id: <20230316092050.28622-1-yang.lee@linux.alibaba.com>
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
Cc: tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the description of @dev_priv to @i915 to silence the warnings:
drivers/gpu/drm/i915/display/intel_wm.c:46: warning: Function parameter or member 'i915' not described in 'intel_update_watermarks'
drivers/gpu/drm/i915/display/intel_wm.c:46: warning: Excess function parameter 'dev_priv' description in 'intel_update_watermarks'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4546
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/i915/display/intel_wm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_wm.c b/drivers/gpu/drm/i915/display/intel_wm.c
index bb99179cd5fd..b615449e70b4 100644
--- a/drivers/gpu/drm/i915/display/intel_wm.c
+++ b/drivers/gpu/drm/i915/display/intel_wm.c
@@ -11,7 +11,7 @@
 
 /**
  * intel_update_watermarks - update FIFO watermark values based on current modes
- * @dev_priv: i915 device
+ * @i915: i915 device
  *
  * Calculate watermark values for the various WM regs based on current mode
  * and plane configuration.
-- 
2.20.1.7.g153144c

