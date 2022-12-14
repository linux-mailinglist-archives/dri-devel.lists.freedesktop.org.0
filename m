Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695DC64C261
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 03:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4D210E205;
	Wed, 14 Dec 2022 02:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F282810E0D5;
 Wed, 14 Dec 2022 02:51:39 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R451e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VXGK2Xz_1670986274; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VXGK2Xz_1670986274) by smtp.aliyun-inc.com;
 Wed, 14 Dec 2022 10:51:33 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: jani.nikula@linux.intel.com
Subject: [PATCH v3] drm/i915: Remove unnecessary doc from static
 engine_init_common()
Date: Wed, 14 Dec 2022 10:51:12 +0800
Message-Id: <20221214025112.104595-1-jiapeng.chong@linux.alibaba.com>
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

The function engine_init_common() has changed to static and we don't need
doc comment in the static function. No functional modification involved.

drivers/gpu/drm/i915/gt/intel_engine_cs.c:1306: warning: expecting prototype for intel_engines_init_common(). Prototype was for engine_init_common() instead.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3442
Fixes: 019bf277634a ("drm/i915: Pull out some more common engine init code")
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
Changes in v3:
  -Modify the commit message and add a "Fixes:" tag.

 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index c33e0d72d670..7c29b1504ae7 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1291,17 +1291,6 @@ create_kernel_context(struct intel_engine_cs *engine)
 						  &kernel, "kernel_context");
 }
 
-/**
- * intel_engines_init_common - initialize cengine state which might require hw access
- * @engine: Engine to initialize.
- *
- * Initializes @engine@ structure members shared between legacy and execlists
- * submission modes which do require hardware access.
- *
- * Typcally done at later stages of submission mode specific engine setup.
- *
- * Returns zero on success or an error code on failure.
- */
 static int engine_init_common(struct intel_engine_cs *engine)
 {
 	struct intel_context *ce;
-- 
2.20.1.7.g153144c

