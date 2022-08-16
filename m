Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F876595708
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 11:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1FC12A723;
	Tue, 16 Aug 2022 09:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 by gabe.freedesktop.org (Postfix) with SMTP id 233F610EB1D;
 Tue, 16 Aug 2022 09:50:23 +0000 (UTC)
Received: from ([60.208.111.195])
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id LJO00019;
 Tue, 16 Aug 2022 17:49:19 +0800
Received: from localhost.localdomain (10.200.104.97) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.9; Tue, 16 Aug 2022 17:49:21 +0800
From: Bo Liu <liubo03@inspur.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/i915: Fix all occurences of the "the the" typo
Date: Tue, 16 Aug 2022 05:49:19 -0400
Message-ID: <20220816094919.5419-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.200.104.97]
tUid: 2022816174919560fdac986ab64afd88d720d733eb086
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Cc: intel-gfx@lists.freedesktop.org, Bo Liu <liubo03@inspur.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is an unexpected word "the" in the file i915_irq.c,
fix it.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/gpu/drm/i915/i915_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 73cebc6aa650..783a6ca41a61 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -65,7 +65,7 @@
 
 /*
  * Interrupt statistic for PMU. Increments the counter only if the
- * interrupt originated from the the GPU so interrupts from a device which
+ * interrupt originated from the GPU so interrupts from a device which
  * shares the interrupt line are not accounted.
  */
 static inline void pmu_irq_stats(struct drm_i915_private *i915,
-- 
2.27.0

