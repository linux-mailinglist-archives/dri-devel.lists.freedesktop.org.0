Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8E739E5CB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148506E998;
	Mon,  7 Jun 2021 17:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5507F6E98D;
 Mon,  7 Jun 2021 17:46:07 +0000 (UTC)
IronPort-SDR: jUYEhwU4rgYlGtarkIrNkDcvbYCI9kHc3IXUQlVfS2Ae1zaZJcfncMODHokAwhoYRmeVATW/kz
 EnOvM2MUIZ2Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204695181"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="204695181"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:05 -0700
IronPort-SDR: v97xek1kPBb5P2dyHsLAgQkiff2rdmXJXyH/NNYs78gWLyfGLhpKqoelbEnnHcdN58DWJHryuP
 q4lXX4TvSHHw==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="551970177"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/13] drm/i915/doc: Include GuC ABI documentation
Date: Mon,  7 Jun 2021 11:03:51 -0700
Message-Id: <20210607180356.165785-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210607180356.165785-1-matthew.brost@intel.com>
References: <20210607180356.165785-1-matthew.brost@intel.com>
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

