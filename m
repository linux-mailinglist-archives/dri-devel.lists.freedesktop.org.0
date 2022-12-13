Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB764AF74
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 06:50:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F23910E1AD;
	Tue, 13 Dec 2022 05:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out199-6.us.a.mail.aliyun.com (out199-6.us.a.mail.aliyun.com
 [47.90.199.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5743010E1AD;
 Tue, 13 Dec 2022 05:50:30 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jiapeng.chong@linux.alibaba.com; NM=0; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VXCbU9B_1670910617; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VXCbU9B_1670910617) by smtp.aliyun-inc.com;
 Tue, 13 Dec 2022 13:50:23 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: jani.nikula@linux.intel.com
Subject: [PATCH v2] drm/i915/hwconfig: Remove comment block
Date: Tue, 13 Dec 2022 13:50:15 +0800
Message-Id: <20221213055015.27968-1-jiapeng.chong@linux.alibaba.com>
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
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 intel-gfx@lists.freedesktop.org, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional modification involved.

drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c:112: warning: expecting prototype for intel_guc_hwconfig_init(). Prototype was for guc_hwconfig_init() instead.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3414
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v2:
  -Remove the comment block.

 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index 4781fccc2687..5559d39881ee 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -102,12 +102,6 @@ static bool has_table(struct drm_i915_private *i915)
 	return false;
 }
 
-/**
- * intel_guc_hwconfig_init - Initialize the HWConfig
- *
- * Retrieve the HWConfig table from the GuC and save it locally.
- * It can then be queried on demand by other users later on.
- */
 static int guc_hwconfig_init(struct intel_gt *gt)
 {
 	struct intel_hwconfig *hwconfig = &gt->info.hwconfig;
-- 
2.20.1.7.g153144c

