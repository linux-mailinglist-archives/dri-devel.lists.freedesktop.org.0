Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD63A8CF0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 01:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E406E1F5;
	Tue, 15 Jun 2021 23:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AA589BBD;
 Tue, 15 Jun 2021 23:55:13 +0000 (UTC)
IronPort-SDR: qqOqCUyeC1s4B5fq0azYDfGEdTfHwb+XWK2gGfippIkiBmAAnAZAJy0HM8dA6UZ/3ZgMHIJmik
 Q+OG1eDQ4GVQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="267236627"
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="267236627"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 16:55:12 -0700
IronPort-SDR: FwllVYg6L4YdbeSzcZ+2mthkUAiDoTFB7XPNS8getH++g+7fhY0jWFjUVAKwl0Ist8MxWLuQQ9
 h1bJQ6Q2vNBw==
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; d="scan'208";a="452138650"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 16:55:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/i915/doc: Include GuC ABI documentation
Date: Tue, 15 Jun 2021 17:13:02 -0700
Message-Id: <20210616001302.84233-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210616001302.84233-1-matthew.brost@intel.com>
References: <20210616001302.84233-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

GuC ABI documentation is now ready to be included in i915.rst

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 Documentation/gpu/i915.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 42ce0196930a..c7846b1d9293 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -518,6 +518,14 @@ GuC-based command submission
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
    :doc: GuC-based command submission
 
+GuC ABI
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+
 HuC
 ---
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_huc.c
-- 
2.28.0

