Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 747C778FB68
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 11:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4D410E759;
	Fri,  1 Sep 2023 09:50:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650F710E758
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693561801; x=1725097801;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cVX8a9oazVozXiPqhKYyvtEhPctQZSefTqSwXj0AWjU=;
 b=TMxo2Bm7MmgM+2wYBZ6i1j41pO/vkBkTwGeYxHHZ1Pok3WO6ZLxfOAYU
 JiwrV6eJozkW4vI9ujbNCONPRRhpemKzV835Cu+SgXaxO3MWqmS1/gcaV
 +QjgDCq7L2ywQtjJSYiV2/lG5DGRWV7l1cQX+7VaduJZj5SEL0v83zEUl
 1OHPTKX2HRmRw12TtmAk4aWePoKXR/qxmPHYrO/4HYgxLmF3ylVxxfdzT
 kxHNyJxJpqjZrZ0L4hjRFNSSr51lnLdw8rxW+cMwCoyTddt6OYOtxyyz3
 Yyv/larHxXdZPGu3+BDjs2bOxmACHi3h0qxN+gXheWDxpW+9Dpn94hroI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361206819"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="361206819"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:50:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070679915"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="1070679915"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 02:49:58 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/11] accel/ivpu: Update for -next 2023.08.25
Date: Fri,  1 Sep 2023 11:49:46 +0200
Message-Id: <20230901094957.168898-1-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update for -next:
 - various cleanups
 - begin preparation for conversion to GEM SHMEM
 - print information about used workarounds

v3:
 - fix commit messages
 - split patch 2 into separate patches

v2:
 - fix compilation without CONFIG_PM

Jacek Lawrynowicz (4):
  accel/ivpu: Remove duplicated error messages
  accel/ivpu: Move ivpu_fw_load() to ivpu_fw_init()
  accel/ivpu: Add ivpu_bo_vaddr() and ivpu_bo_size()
  accel/ivpu: Move MMU register definitions to ivpu_mmu.c

Karol Wachowski (1):
  accel/ivpu: Initialize context with SSID = 1

Krystian Pradzynski (1):
  accel/ivpu: Move set autosuspend delay to HW specific code

Stanislaw Gruszka (5):
  accel/ivpu: Make ivpu_pm_init() void
  accel/ivpu: Add information about context on failure
  accel/ivpu: Print information about used workarounds
  accel/ivpu/37xx: Change register rename leftovers
  accel/ivpu/37xx: White space cleanup

 drivers/accel/ivpu/ivpu_drv.c         |  65 +++------
 drivers/accel/ivpu/ivpu_drv.h         |  18 ++-
 drivers/accel/ivpu/ivpu_fw.c          |  26 ++--
 drivers/accel/ivpu/ivpu_fw.h          |   2 +-
 drivers/accel/ivpu/ivpu_fw_log.c      |   6 +-
 drivers/accel/ivpu/ivpu_gem.c         |  30 ++---
 drivers/accel/ivpu/ivpu_gem.h         |  22 ++-
 drivers/accel/ivpu/ivpu_hw_37xx.c     |  75 ++++++-----
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h | 187 +++++++++++---------------
 drivers/accel/ivpu/ivpu_hw_40xx.c     |   7 +
 drivers/accel/ivpu/ivpu_ipc.c         |  19 ++-
 drivers/accel/ivpu/ivpu_job.c         |   8 +-
 drivers/accel/ivpu/ivpu_mmu.c         | 117 ++++++++++------
 drivers/accel/ivpu/ivpu_mmu_context.c |  18 ++-
 drivers/accel/ivpu/ivpu_mmu_context.h |   2 +
 drivers/accel/ivpu/ivpu_pm.c          |  18 +--
 drivers/accel/ivpu/ivpu_pm.h          |   2 +-
 17 files changed, 324 insertions(+), 298 deletions(-)

-- 
2.25.1

