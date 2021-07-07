Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 528DF3BF601
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA2A6E212;
	Thu,  8 Jul 2021 07:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 379 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jul 2021 08:54:02 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E31EA8921C;
 Wed,  7 Jul 2021 08:54:02 +0000 (UTC)
Received: from localhost (unknown [192.168.167.69])
 by lucky1.263xmail.com (Postfix) with ESMTP id CFE02D5D0F;
 Wed,  7 Jul 2021 16:47:38 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [111.207.172.18])
 by smtp.263.net (postfix) whith ESMTP id
 P12345T139824290686720S1625647658082957_; 
 Wed, 07 Jul 2021 16:47:38 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8bb40e571c070238cc02cdc94e353cc6>
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
Subject: [PATCH 1/2] drivers/gpu/drm/i915/gt/intel_engine_cs.c: Repair typo in
 function name
Date: Wed,  7 Jul 2021 16:47:36 +0800
Message-Id: <9ee149b983a05be6789147f96cb884ff30e9c92c.1625646947.git.zhaoxiao@uniontech.com>
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

drivers/gpu/drm/i915/gt/intel_engine_cs.c:882: warning: expecting prototype for intel_engines_init_common(). Prototype was for engine_init_common() instead
drivers/gpu/drm/i915/gt/intel_engine_cs.c:959: warning: expecting prototype for intel_engines_cleanup_common(). Prototype was for intel_engine_cleanup_common() instead

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 7f03df236613..01b4dc041a72 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -868,7 +868,7 @@ create_kernel_context(struct intel_engine_cs *engine)
 }
 
 /**
- * intel_engines_init_common - initialize cengine state which might require hw access
+ * engine_init_common - initialize cengine state which might require hw access
  * @engine: Engine to initialize.
  *
  * Initializes @engine@ structure members shared between legacy and execlists
@@ -949,7 +949,7 @@ int intel_engines_init(struct intel_gt *gt)
 }
 
 /**
- * intel_engines_cleanup_common - cleans up the engine state created by
+ * intel_engine_cleanup_common - cleans up the engine state created by
  *                                the common initiailizers.
  * @engine: Engine to cleanup.
  *
-- 
2.20.1



