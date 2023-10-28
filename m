Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930C47DA749
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 15:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB38E10E0A7;
	Sat, 28 Oct 2023 13:34:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51CC10E0A7
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 13:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698500067; x=1730036067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nRul3fh0lZ20w3/kLQws+HPatbqfkrscmJD4TT9Gm6g=;
 b=f9LXvddI70ruolB2CczOeWAFc2iPracMokrlreGk5EPrjnf6KIw8pJYH
 5bCTSdXOzHAhX/yIga13j0Qvqr1/s/S/aqluY/OA7fknUv3oKXyEcTULM
 r/ANxfKTNBpH40FXOeD4BF69VXr/h75DTcGCX87G9Lll0t22Os0FtyJuL
 1dWoUE2YephMXtiUJTEOHpiI7RCmlEC9RSI5hINolEfqLotIsW7NXF8n+
 DrERoLZ2g/yzdGN/WcjjuwOnKuaEp6TqUSQwGwTlcYIyN0VA7NGYUr8IZ
 /5PbuFjruqPSInEyH5o9j1NnmtnStpyI0MOSuaAG+4PjBtW5mP0jCgL/d A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="474136712"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="474136712"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="794871445"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; d="scan'208";a="794871445"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 06:34:25 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/11] accel/ivpu: Remove unneeded drm_driver declaration
Date: Sat, 28 Oct 2023 15:34:06 +0200
Message-Id: <20231028133415.1169975-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231028133415.1169975-1-stanislaw.gruszka@linux.intel.com>
References: <20231028133415.1169975-1-stanislaw.gruszka@linux.intel.com>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cleanup drm_driver declaration leftover.

Reviewed-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index b6aa8893ff1c..8f5655dfd83f 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -31,8 +31,6 @@
 			   __stringify(DRM_IVPU_DRIVER_MINOR) "."
 #endif
 
-static const struct drm_driver driver;
-
 static struct lock_class_key submitted_jobs_xa_lock_class_key;
 
 int ivpu_dbg_mask;
-- 
2.25.1

