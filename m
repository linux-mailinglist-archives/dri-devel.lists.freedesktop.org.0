Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD6679FAA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 18:06:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FAC10E6D0;
	Tue, 24 Jan 2023 17:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D65F10E6D0;
 Tue, 24 Jan 2023 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674579991; x=1706115991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kQaawP+GRxxgAtwtza9R85W8TEbbAgFuMLjdLdBpcSY=;
 b=DG7Re4tXYVo75Eo2zD5ORKBfW0sDVlK2V0R5V+Tb56f00B6+s1eztcEe
 TeRQk1nDHvVcw4j8vRg1zOhv21ibAcnEwFj5yAZ9MT2lXc8JxMGa0vIVQ
 PQ/NNeGtUu39jd0P/Rk5cHa67cTWzr43/CVo5NK15BwEZiUsb9z1J5q/R
 gZlUHOPbC+Ekk+fwhEQVz/wgrERSlbwV8K3BczG9jOnS7h5mcvnx+xP4v
 /aStat1vlNYuI436iSPCFLA/PGr3VVZbxCTNO/AoIbahUuDyb+5ilAbl5
 BxPTDegJZQWT3dqMCBd/bdk50iOwd0TqRtPF48I80dK0Qcgpv1LVxmSmt g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="306007399"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="306007399"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 09:05:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="750895780"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="750895780"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 09:05:24 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.147.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 9181F37E21;
 Tue, 24 Jan 2023 17:05:22 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/8] GuC oriented print macros
Date: Tue, 24 Jan 2023 18:05:14 +0100
Message-Id: <20230124170522.1808-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow up series for existing commit 67804e48b494
("drm/i915/gt: Start adding module oriented dmesg output")
that was focusing just on the GT.

Now extend changes to uc/ folder and focus on the GuC.

v2: applying feedback from John

Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>	

Michal Wajdeczko (8):
  drm/i915/guc: Add GuC oriented print macros
  drm/i915/guc: Update GuC messages in intel_guc.c
  drm/i915/guc: Update GuC messages in intel_guc_ads.c
  drm/i915/guc: Update GuC messages in intel_guc_ct.c
  drm/i915/guc: Update GuC messages in intel_guc_fw.c
  drm/i915/guc: Update GuC messages in intel_guc_log.c
  drm/i915/guc: Update GuC messages in intel_guc_submission.c
  drm/i915/guc: Update GT/GuC messages in intel_uc.c

 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 31 ++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 23 +-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 17 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 37 +++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h  | 48 +++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 61 ++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 80 +++++++++----------
 8 files changed, 165 insertions(+), 140 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h

-- 
2.25.1

