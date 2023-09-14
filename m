Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F827A1103
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0776D10E599;
	Thu, 14 Sep 2023 22:31:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D99210E599;
 Thu, 14 Sep 2023 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694730713; x=1726266713;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ig8XLfpekzmOV+dM59/+QvGXEaljplk4zqlVhMG1eHs=;
 b=THB2rSNb96OKuEBA67C8rcrZ38WYHmSEXfrZVzFkpeGntFCn3UURx34m
 X93rQEfzKLLSLPa20d850th6RiQ8rmQzc8zrl24E1vZGyFLdQzHa+RgIU
 6rwo1Eny4+QbsrYnAdb3jVvSzB8eZJjiBEHoAHCAShJOkBvSKtWgAtf4b
 ObFureaiN2iZb1t+2SxWbPC6H6TWdFaPjPbli7SoJpGVza90F38Qr7a6c
 mGmGdoQ9cr5mpYKbzUgSoiW8CMwYN2N8f2Idq+YJuxErYIR6sltpMJrNE
 cQS9wzCBMOSUr35vyS1jqMCKxxmKVYGhSymU2Dgg9rNFXdSSyoNjs1Ubh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="382913331"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="382913331"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 15:29:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744717702"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="744717702"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 14 Sep 2023 15:29:11 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/2] Enable Wa_14018913170 on DG2/MTL/PVD
Date: Thu, 14 Sep 2023 15:28:11 -0700
Message-ID: <20230914222813.278774-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
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

Enable a WA on the latest platforms. Also update the recommended GuC
version for those platforms to the latest available. Further patches
will follow to make use of other features in the latest GuC firmware,
but the w/a at least requires something newer than what was previously
in use.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


Daniele Ceraolo Spurio (1):
  drm/i915/guc: Enable WA 14018913170

John Harrison (1):
  drm/i915/guc: Update 'recommended' version to 70.11.0 for
    DG2/ADL-P/MTL

 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 6 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h      | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 6 +++---
 4 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.41.0

