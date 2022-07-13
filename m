Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD87573285
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002B998A79;
	Wed, 13 Jul 2022 09:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D794B98A6C;
 Wed, 13 Jul 2022 09:30:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5741061CAC;
 Wed, 13 Jul 2022 09:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4F2C341D1;
 Wed, 13 Jul 2022 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657704622;
 bh=wMNkL9BlFfZJJ7e12qDIh/CAGTODMlA3hMOonBBSBIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kKsBel7mj3ls/9+FJ+M6yCLp7kQw/5gZ8Oo5Lx6pRk+sPzn9/OMRvmuqYB2JC3/RP
 1Eeff3/MjVgHS4owXL61rqiH6ltPLCn59woKSEy2LqneGPjJ7IgwDdfhchFoPm/7Xi
 lMaJquH1VYmkll9JXP3L/hDMAF2ef2zqQZsdIj6HXRo/jZX8Y4zSYIlQKpkFrXoEbA
 Njxr+TLK4PWhC+2O4rIJSnzrQYflxHAC3oHTw2ALP9xQ+z2migkW+KrqFpShl94vJr
 4XT0uidmQk0DHk2q9jrnluZlXlZk4fq0OQTeuRIy/COc2vWXalcxGrqCY1lzizPVfy
 loL0/rQO+F48w==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBYhH-0050Ld-Od;
 Wed, 13 Jul 2022 10:30:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 10/21] drm/i915/guc: use kernel-doc for enum
 intel_guc_tlb_inval_mode
Date: Wed, 13 Jul 2022 10:30:07 +0100
Message-Id: <39ff9de11bef9a30205fa340f89fa36de783be55.1657703926.git.mchehab@kernel.org>
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
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Transform the comments for intel_guc_tlb_inval_mode into a
kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH 00/21] at: https://lore.kernel.org/all/cover.1657703926.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 2e39d8df4c82..14e35a2f8306 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -190,15 +190,18 @@ enum intel_guc_tlb_invalidation_type {
 	INTEL_GUC_TLB_INVAL_GUC = 0x3,
 };
 
-/*
- * 0: Heavy mode of Invalidation:
+/**
+ * enum intel_guc_tlb_inval_mode - define the mode for TLB cache invlidation
+ *
+ * @INTEL_GUC_TLB_INVAL_MODE_HEAVY: Heavy Invalidation Mode.
  * The pipeline of the engine(s) for which the invalidation is targeted to is
  * blocked, and all the in-flight transactions are guaranteed to be Globally
- * Observed before completing the TLB invalidation
- * 1: Lite mode of Invalidation:
+ * Observed before completing the TLB invalidation.
+ * @INTEL_GUC_TLB_INVAL_MODE_LITE: Light Invalidation Mode.
  * TLBs of the targeted engine(s) are immediately invalidated.
  * In-flight transactions are NOT guaranteed to be Globally Observed before
  * completing TLB invalidation.
+ *
  * Light Invalidation Mode is to be used only when
  * it can be guaranteed (by SW) that the address translations remain invariant
  * for the in-flight transactions across the TLB invalidation. In other words,
-- 
2.36.1

