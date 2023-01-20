Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16BB675A39
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812A310EAAA;
	Fri, 20 Jan 2023 16:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E99D10E377;
 Fri, 20 Jan 2023 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232878; x=1705768878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KVl2AnWuJQzNasPCzJnkx7bzKX4LGxtCV87AIAtF8NM=;
 b=fmz88E7sKNAL6nhiahlY9+ph9RD+fBvIbdVfP7OgWzI7AoxwFpUif94H
 1BEFO4zZo81EexkwnVeO4zgqTah5sXYiXq+89TjWLauky7ZwMhUzOSLEK
 b32/8PvQ/0CscbwyQ9Vh6DZwX6li59B5GkdCPmbb2g5+cLbhe5t/DdBp/
 y1fdc96Rbr7vN2A+maISViq6WJ8ycwKDltBtLhhN30nhX2iC4CWBRBO06
 dUVnDmfqPnPl+PhDzTQc8ZnaN9Vf5mSFQGCEky4BKNQDI0iQMxaSgmTk3
 T/uGhiReZfNjcW2SZ6Aj1XJajXjEtdAWpTKPmkAleSJ8vEWfDeO1fU633 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323309812"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="323309812"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:41:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="691109932"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="691109932"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga008.jf.intel.com with ESMTP; 20 Jan 2023 08:41:15 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.145.153])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 30KGfEfa023485; Fri, 20 Jan 2023 16:41:14 GMT
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] GuC oriented print macros
Date: Fri, 20 Jan 2023 17:40:42 +0100
Message-Id: <20230120164050.1765-1-michal.wajdeczko@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow up series for existing commit 67804e48b494
("drm/i915/gt: Start adding module oriented dmesg output")
that was focusing just on the GT.

Now extend changes to uc/ folder and focus on the GuC.

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

 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 31 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 12 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 17 +++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 35 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h  | 48 ++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 60 +++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 74 +++++++++----------
 8 files changed, 160 insertions(+), 125 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h

-- 
2.25.1

