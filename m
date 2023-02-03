Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2C688C2E
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 01:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9547610E6DA;
	Fri,  3 Feb 2023 00:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4768910E6D4;
 Fri,  3 Feb 2023 00:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675385852; x=1706921852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PSYQAEUEBk3AiM9erWro/kil4zQ/kWzygn4bQTXV4Zo=;
 b=fq9pXb+n0FgDNlF2co8Iq2yqk7JivtVBjy2EezCj9swNLHO67y2ODuMl
 hqfV/G1pmKuYULGhBL2hC/AI3QnpAqVJgRydk2u4Fp4pleUMWKFfJL0qE
 z8JEVyO115of/HAUaykBot7546xrfJsJAyfTxqG7PP/S/kxDqDFt4gka6
 aXvymtQEsOici61x0QnHXt9xy2KrY6gbLw7r6TwQpDhx1D8sy5oeRH8AO
 EiQ84eoP5R7xQ5fkatRR3FWjuPRHSnm1Fv7UZHJV0lQ6r9VjUvbqfmDx3
 zCVKvsz6HyDzYcbVajOjIYXJeSoSTaLt1oVMbOvZ8/99HzLSEqrwnxDt/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="316618624"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="316618624"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 16:57:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="734138523"
X-IronPort-AV: E=Sophos;i="5.97,269,1669104000"; d="scan'208";a="734138523"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 16:57:31 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Remove unused/wrong INF_UNIT_LEVEL_CLKGATE
Date: Thu,  2 Feb 2023 16:57:09 -0800
Message-Id: <20230203005709.2612633-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230203005709.2612633-1-lucas.demarchi@intel.com>
References: <20230203005709.2612633-1-lucas.demarchi@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
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

