Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E437DA747
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 15:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF48110E039;
	Sat, 28 Oct 2023 13:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD75A10E039
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698500059; x=1730036059;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K+Y1bdJyc9jmkdSmJTYki4heGZl8bfqsAAa30wU1dn0=;
 b=TsdnL5vIYPOUxgItSc/bk58Dn/Uum88p8onpWNCnOAQqVzeDCJbln44+
 cpQT5OHIf0nFemtcie5JLTXyQYaeoeagis/U9STYFbJK+8LAzG5vqSOjG
 iGyAgaBYBtEwN8oZ684GPp1Ir6Xkx3ngQi6GT/v0cZnEkYxK7IuUrVj1a
 b7o5ATOGQJHjFbFCALgTXr2W9Ak+Uut5yuT3PCNzNjufnPW9InYvSHUtJ
 MmTFLEnUtCem0WQGNX07qPBEWsXhLY0l5JVkO0ixhfJnesp369IjopehR
 vLTEkIRfoKmgWhIh9bjN5t3gmHgHk8j3eur4G3BZXqOdc9w2K7kp2xmWf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474136701"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="474136701"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="794871427"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="794871427"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:34:17 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/11] accel/ivpu: Update for -next 2023-10-25
Date: Sat, 28 Oct 2023 15:34:04 +0200
Message-Id: <20231028133415.1169975-1-stanislaw.gruszka@linux.intel.com>
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

Various driver updates:
 
 - FW api update
 - suspend/resume optimizations 
 - dynamic valtage and frequency mode knob
 - new test modes

v2:
 - fix spelling mistakes pointed Jeffrey
 - move patch 7, add note where new function will be used
 - change patches 8 and 9 ordering
 - separate print warn change from patch 10 into separate patch 
 - squash patch 10 and 11
 - rebase to latest drm-misc-next

Andrzej Kacprowski (4):
  accel/ivpu: Add support for VPU_JOB_FLAGS_NULL_SUBMISSION_MASK
  accel/ivpu/40xx: Capture D0i3 entry host and device timestamps
  accel/ivpu: Pass D0i3 residency time to the VPU firmware
  accel/ivpu: Add support for delayed D0i3 entry message

Karol Wachowski (3):
  accel/ivpu: Remove reset from power up sequence
  accel/ivpu: Change test_mode module param to bitmask
  accel/ivpu: Introduce ivpu_ipc_send_receive_active()

Krystian Pradzynski (1):
  accel/ivpu: Update FW API

Stanislaw Gruszka (2):
  accel/ivpu: Remove unneeded drm_driver declaration
  accel/ivpu/37xx: Print warning when VPUIP is not idle during power
    down

Tomasz Rusinowicz (1):
  accel/ivpu: Add dvfs_mode file to debugfs

 drivers/accel/ivpu/ivpu_debugfs.c     |  28 +++
 drivers/accel/ivpu/ivpu_drv.c         |   6 +-
 drivers/accel/ivpu/ivpu_drv.h         |  10 +-
 drivers/accel/ivpu/ivpu_fw.c          |  70 +++++-
 drivers/accel/ivpu/ivpu_fw.h          |   1 +
 drivers/accel/ivpu/ivpu_hw.h          |   8 +
 drivers/accel/ivpu/ivpu_hw_37xx.c     |  28 ++-
 drivers/accel/ivpu/ivpu_hw_37xx_reg.h |   2 +
 drivers/accel/ivpu/ivpu_hw_40xx.c     |  24 +-
 drivers/accel/ivpu/ivpu_ipc.c         |  33 ++-
 drivers/accel/ivpu/ivpu_ipc.h         |   8 +-
 drivers/accel/ivpu/ivpu_job.c         |   4 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c     |  38 ++++
 drivers/accel/ivpu/ivpu_jsm_msg.h     |   1 +
 drivers/accel/ivpu/ivpu_pm.c          |  11 +-
 drivers/accel/ivpu/vpu_boot_api.h     |  90 +++++++-
 drivers/accel/ivpu/vpu_jsm_api.h      | 309 ++++++++++++++++++++++++--
 17 files changed, 607 insertions(+), 64 deletions(-)

-- 
2.25.1

