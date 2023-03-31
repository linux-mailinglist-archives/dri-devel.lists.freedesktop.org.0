Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2163D6D1F31
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 13:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE0610F1EB;
	Fri, 31 Mar 2023 11:36:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FC710F1EB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680262575; x=1711798575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2nbKPAelKSAQ1MjJoGjBcTxhckTlyZJRRfEdyBr1DNM=;
 b=SsN/NZ1RjeAy/kfs4c7S8GR6PYkrg4TUtyoEhi1fiAAQZbbwOO+Of4MX
 exP+LEbrgmnCiw1nvbM7fP9y6UiyDUJs4EXIWuGId2BS6u+tdXp3mKyYM
 MqZm2OVJj8ZvKB68qpk2EaN5ARWpuGNQs8c1RoPc1a+lkOGH4I3w5gEc3
 /UqJTOxUTX3mLWAIOcfb4kPGIFgJCVeA4ArCGDLe+QhyxPdqcOTjWBGMP
 bolPgYz+idBJLzld1jIMHLFG8WxMWfaVVu+MLT//o+aCpM4zTv/oXN0mD
 KIKxO2mLx0lSVN+GJeKMSwxKEsx2SDzLxAfBYNS1J6qlU3tesuKLq8WXF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="321083176"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321083176"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:36:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687624682"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="687624682"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 04:36:13 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] accel/ivpu: Fixes for linux-6.3-rc6 
Date: Fri, 31 Mar 2023 13:36:01 +0200
Message-Id: <20230331113603.2802515-1-stanislaw.gruszka@linux.intel.com>
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

Jacek Lawrynowicz (1):
  accel/ivpu: Fix S3 system suspend when not idle

Karol Wachowski (1):
  accel/ivpu: Add dma fence to command buffers only

 drivers/accel/ivpu/ivpu_job.c | 18 +++++++-----------
 drivers/accel/ivpu/ivpu_pm.c  | 26 +++++++++++---------------
 2 files changed, 18 insertions(+), 26 deletions(-)

-- 
2.25.1

