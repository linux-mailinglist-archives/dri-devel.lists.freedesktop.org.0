Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E7A554277
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503C0113899;
	Wed, 22 Jun 2022 05:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg.qq.com (smtpbg139.qq.com [175.27.65.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEB910E26B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 13:34:53 +0000 (UTC)
X-QQ-mid: bizesmtp82t1655818482t4lelr4u
Received: from ubuntu.localdomain ( [106.117.99.68])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 21 Jun 2022 21:34:37 +0800 (CST)
X-QQ-SSF: 0100000000700050B000D00A0000000
X-QQ-FEAT: xoS364mEyr1O7d4xyo1etuat7DIRMKm12/lCtpnC6qIif68t8nBxJY9ZY0STk
 aCyrhNuGMgYXDparfZoJuQ8uDc1fRY/EfzT/bF1r+YwjyQ3a2uB8NaB05pVwtNaxYlvfv//
 7dvJk1QTs0S1HUe/b4a35ZsfECag7K0z5MaNcrgykUjt1BrvA1qpMh0Ah56LlZZSBenHPRC
 bjKuzCJl1sZpG0o4wDlIK3ryt54M7HbVAZPyYJxtt4UESyhWT+mTnQQQHbTR9+6tWIk9rzE
 nUsJfM/qnjuFYHX2rDtvcJWkt6GE6IR04hq+FB8b5x3HnegcrA1rXb1obNyp1SIO6E2QvSk
 /BzCRf1lNt7q/sT7Nbrs2XjoA/7Sw==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/i915: i915_irq - drop unexpected word "the" in the
 comments
Date: Tue, 21 Jun 2022 21:34:35 +0800
Message-Id: <20220621133435.5924-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam6
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:39 +0000
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiang Jian <jiangjian@cdjrlc.com>, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

there is an unexpected word "the" in the comments that need to be dropped

file: drivers/gpu/drm/i915/i915_irq.c
line 68
 * interrupt originated from the the GPU so interrupts from a device which
changed to
 * interrupt originated from the GPU so interrupts from a device which

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
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
2.17.1

