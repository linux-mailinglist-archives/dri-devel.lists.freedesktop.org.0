Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5C4573299
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53FA98A91;
	Wed, 13 Jul 2022 09:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB69898A7B;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2060B61CCD;
 Wed, 13 Jul 2022 09:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B90C341E6;
 Wed, 13 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704622;
 bh=CCKKzwB0qHXF+WGVUFGTqABjxYBM8eht5j02XIx4jVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uTJLFfDrWmXusPvlk/y7wR2q/VA5ySyre0cG0m02FfgFLLaJ5BrBmOK7FqmakpLJS
 xYVl9PR4l2pc/7fAeiOqKtV17Jx6+jBmlvDzKuRGhYHZyfZ1yaONRl9GyhIJv+USmx
 nOub+MnFujdOK7+c1oh21empX7bgoMedy0TclG2SLbMpSZGbu6P57Oaz6saHaYp8QW
 ZOMi1JMwjeYCR55Z9VEGP+aeUYlnozoMRLjNUjIa9pxNcQCrp3JeZf5bgSTeCpA2Fa
 8UDVuTgFBEOfJXuxw7gg9JfHzm8HER+L562SdDQl8O4iLnZwg5+1vEyB8ybY9c8gnL
 YYenUXTz8VkUg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhI-0050MF-04;
 Wed, 13 Jul 2022 10:30:20 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 20/21] drm/i915/guc: describe enum
 intel_guc_tlb_invalidation_type
Date: Wed, 13 Jul 2022 10:30:17 +0100
Message-Id: <73d51e0580ba98a466f951473902eda3cfa97053.1657703926.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657703926.git.mchehab@kernel.org>
References: <cover.1657703926.git.mchehab@kernel.org>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Borislav Petkov <bp@suse.de>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a description for intel_guc_tlb_invalidation_type enum.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 5c019856a269..e97065c62d28 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -187,6 +187,18 @@ enum intel_guc_state_capture_event_status {
 /* Flush PPC or SMRO caches along with TLB invalidation request */
 #define INTEL_GUC_TLB_INVAL_FLUSH_CACHE (1 << 31)
 
+/**
+ * enum intel_guc_tlb_invalidation_type - type of TLB cache invalidation
+ *
+ * @INTEL_GUC_TLB_INVAL_FULL:
+ *	Global TLB invalidation
+ * @INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE:
+ *	Page-selective TLB cache invalidation
+ * @INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX:
+ *	Context-selective TLB cache invalidation
+ * @INTEL_GUC_TLB_INVAL_GUC:
+ *	Invalidate TLB on GuC itself
+ */
 enum intel_guc_tlb_invalidation_type {
 	INTEL_GUC_TLB_INVAL_FULL = 0x0,
 	INTEL_GUC_TLB_INVAL_PAGE_SELECTIVE = 0x1,
-- 
2.36.1

