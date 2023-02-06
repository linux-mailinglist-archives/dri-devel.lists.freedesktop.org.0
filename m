Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D78B68C3EA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 17:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEF4610E9D9;
	Mon,  6 Feb 2023 16:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7E910E422;
 Mon,  6 Feb 2023 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675702475; x=1707238475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PSYQAEUEBk3AiM9erWro/kil4zQ/kWzygn4bQTXV4Zo=;
 b=oBu2ThVo4m5ZvRkcxdjXQjforZJ2FrFY5RpBfz4etwN76jMJQs/YchBn
 4qguQzcZcr0ba7phsn0L9wz3ViqVZ4QAtbVKreASOHj9di089pMcyTz1k
 qgSSGpxovfcL/0ihjFjidOl3l/WZdENmbl4y5RV9CiA25METpVJ80eNsb
 YhcZnw+00VR9mgMFD88ckBCrty+IrHQDmIg4AJq3Vlf8NXQOUqpyd+beq
 Pe+ORwLb7g181ujyqRoHKIjjQ37gOMuf8++o73jadDIC8qXrAz4HLdupL
 cnkR01Ko9+aKOQOlooTaoVwyH1MyuAdnFHTSJT3w2iNmglz2MBNxYA4KP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="326939657"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="326939657"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 08:54:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="840410623"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="840410623"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 08:54:33 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/i915: Remove unused/wrong INF_UNIT_LEVEL_CLKGATE
Date: Mon,  6 Feb 2023 08:54:10 -0800
Message-Id: <20230206165410.3056073-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230206165410.3056073-1-lucas.demarchi@intel.com>
References: <20230206165410.3056073-1-lucas.demarchi@intel.com>
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>, dri-devel@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

INF_UNIT_LEVEL_CLKGATE is not replicated, but since it's not actually
used it can just be removed.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index cc1539c7a6b6..7256f7e3fd11 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -769,9 +769,6 @@
 #define GEN10_DFR_RATIO_EN_AND_CHICKEN		MCR_REG(0x9550)
 #define   DFR_DISABLE				(1 << 9)
 
-#define INF_UNIT_LEVEL_CLKGATE			MCR_REG(0x9560)
-#define   CGPSF_CLKGATE_DIS			(1 << 3)
-
 #define MICRO_BP0_0				_MMIO(0x9800)
 #define MICRO_BP0_2				_MMIO(0x9804)
 #define MICRO_BP0_1				_MMIO(0x9808)
-- 
2.39.0

