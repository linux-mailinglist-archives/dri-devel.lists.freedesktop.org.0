Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3DF7D0DCA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 12:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4160210E5A3;
	Fri, 20 Oct 2023 10:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E3710E5A3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 10:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697798705; x=1729334705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rdWXhanTUCsiJOSLLFch1G9TeWX1KM4ERXZ9Nzc2Gsw=;
 b=kizJJkDdcR26KFi7Zc+g0FtDyjShwXBf3zY4SpSe0Bg3a860MkMUAZ7a
 zDOrk8jhNSHbJt8seJ5LqRNyMlH16KV4ipFVY9OPePnLgBy5H1fuxND4i
 p9NMSz8UyiQyQoVcfVvCSaAuu8oWz/bjWri75CME8ds2sEnZVVrbPmgdW
 mFGpqhxqlCCpVoz7xp3DpnhZN3ZdRdLsT2DooVSYUOPVHarORqof1RnEc
 akwS3ll551DDTvcTiNyrcRlcPN0GlRD9D/ux0ZNTPfNyEJOzNGfiSYECV
 3gI880TfdBCo+Y+g4UZzD/OHWBYhqE0IglHJEVkyXIFKxfZOpaSFz9T+u Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="386287475"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="386287475"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="1004572479"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="1004572479"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 03:45:03 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] accel/ivpu: Update to -next 2023-10-20 
Date: Fri, 20 Oct 2023 12:44:55 +0200
Message-Id: <20231020104501.697763-1-stanislaw.gruszka@linux.intel.com>
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

Random changes across the driver.

Karol Wachowski (1):
  accel/ivpu: Read clock rate only if device is up

Krystian Pradzynski (3):
  accel/ivpu: Use ratelimited warn and err in IPC/JSM
  accel/ivpu: Fix verbose version of REG_POLL macros
  accel/ivpu: Print IPC type string instead of number

Stanislaw Gruszka (2):
  accel/ivpu: Do no initialize parameters on power up
  accel/ivpu/37xx: Remove support for FPGA and simics

 drivers/accel/ivpu/ivpu_drv.c       | 18 ++++++-
 drivers/accel/ivpu/ivpu_hw_37xx.c   | 63 ++++------------------
 drivers/accel/ivpu/ivpu_hw_40xx.c   |  8 +--
 drivers/accel/ivpu/ivpu_hw_reg_io.h | 32 ++++++-----
 drivers/accel/ivpu/ivpu_ipc.c       | 34 ++++++------
 drivers/accel/ivpu/ivpu_jsm_msg.c   | 82 ++++++++++++++++++++++++++---
 drivers/accel/ivpu/ivpu_jsm_msg.h   |  2 +
 drivers/accel/ivpu/ivpu_mmu.c       | 47 ++++++++++-------
 drivers/accel/ivpu/ivpu_pm.c        | 13 +++++
 drivers/accel/ivpu/ivpu_pm.h        |  1 +
 10 files changed, 189 insertions(+), 111 deletions(-)

-- 
2.25.1

