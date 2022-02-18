Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D4B4BAD7F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 00:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9008110E921;
	Thu, 17 Feb 2022 23:52:19 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3355510E83D;
 Thu, 17 Feb 2022 23:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645141930; x=1676677930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/jtcmQCWmewm6u7f5IMw5k2Fc8FC9venu7o4KF5/f3c=;
 b=FO3uHGxwOufKiQogXNEIBcr7Lz/LzSunLIeUlqABA4/Nwi/fuoPM55R3
 MFYjJiQsrgIaffXu0ciVm+AjY1BPa4KYYRm/Yf4m6Qky46b7+t5xZXL+L
 EtDsnEwFsclatfr/FkBPXOn7983IsRWGCX328gQnxuwe6cZbRRQ+JgPPe
 8C9PROGSa4wqLk3WsNvDsCRilI5Qv75aZCJTlkIAguNYaj3JJFJsOD70s
 1KKssYWpZ2N3L5qtaSBtfCZQNH3TbaVtpCl85UqoXOAqBnYqBSawzH1Ox
 Jz+kMJegx8fy3muFYeUGU6BSmoNCRzw+1D/N/4K1R28tzHp2uzQm2YtDw g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311749000"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="311749000"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 15:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="545964447"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 17 Feb 2022 15:52:08 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 7/8] drm/i915/guc: Drop obsolete H2G definitions
Date: Thu, 17 Feb 2022 15:52:06 -0800
Message-Id: <20220217235207.930153-8-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217235207.930153-1-John.C.Harrison@Intel.com>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The CTB registration process changed significantly a while back using
a single KLV based H2G. So drop the original and now obsolete H2G
definitions.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 7afdadc7656f..e77f955435ce 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -131,8 +131,6 @@ enum intel_guc_action {
 	INTEL_GUC_ACTION_AUTHENTICATE_HUC = 0x4000,
 	INTEL_GUC_ACTION_REGISTER_CONTEXT = 0x4502,
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
-	INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
-	INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
 	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
 	INTEL_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
-- 
2.25.1

