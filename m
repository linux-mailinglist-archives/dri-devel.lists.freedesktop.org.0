Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14213BF602
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822546E215;
	Thu,  8 Jul 2021 07:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3D08921C;
 Wed,  7 Jul 2021 08:54:03 +0000 (UTC)
Received: from localhost (unknown [192.168.167.69])
 by lucky1.263xmail.com (Postfix) with ESMTP id DFFE6FB057;
 Wed,  7 Jul 2021 16:47:39 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [111.207.172.18])
 by smtp.263.net (postfix) whith ESMTP id
 P12345T139824290686720S1625647658082957_; 
 Wed, 07 Jul 2021 16:47:39 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7ca24137f5f85a4099dc1963a6476211>
X-RL-SENDER: zhaoxiao@uniontech.com
X-SENDER: zhaoxiao@uniontech.com
X-LOGIN-NAME: zhaoxiao@uniontech.com
X-FST-TO: airlied@linux.ie
X-RCPT-COUNT: 16
X-SENDER-IP: 111.207.172.18
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhaoxiao <zhaoxiao@uniontech.com>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 venkata.s.dhanalakota@intel.com
Subject: [PATCH 2/2] drivers/gpu/drm/i915/display/intel_display_power.c:
 Repair typo in function name
Date: Wed,  7 Jul 2021 16:47:37 +0800
Message-Id: <73d3e6c31f6a02b744cff588eb9ef1825a47b672.1625646947.git.zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1625646947.git.zhaoxiao@uniontech.com>
References: <cover.1625646947.git.zhaoxiao@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:08:27 +0000
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
Cc: matthew.brost@intel.com, zhaoxiao <zhaoxiao@uniontech.com>,
 tvrtko.ursulin@intel.com, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, linux-kernel@vger.kernel.org,
 chris@chris-wilson.co.uk, daniele.ceraolospurio@intel.com,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

drivers/gpu/drm/i915/display/intel_display_power.c:2300: warning: expecting prototype for intel_display_power_put_async(). Prototype was for __intel_display_power_put_async() instead

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index 4298ae684d7d..c37e14f2df90 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -2285,7 +2285,7 @@ intel_display_power_put_async_work(struct work_struct *work)
 }
 
 /**
- * intel_display_power_put_async - release a power domain reference asynchronously
+ * __intel_display_power_put_async - release a power domain reference asynchronously
  * @i915: i915 device instance
  * @domain: power domain to reference
  * @wakeref: wakeref acquired for the reference that is being released
-- 
2.20.1



