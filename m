Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F487D6724
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1CC10E626;
	Wed, 25 Oct 2023 09:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E0410E621
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698227039; x=1729763039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xywv7hDD75Mlb2EfsRoGOjF7mskHaeaJesq8A0Y8V98=;
 b=dd+9MqanNXZgrX/1wJbBgXcbBlpa64MMctg7AEliOdCoG1Gb9aKtSHNd
 xARY4fSVOVSnynFxSH9JGlp4Nz5dHS9yQHw51h8Z5Q1vNSwkV6LBDRdnA
 pXQKeTkvJfJTnbuB0/TOxdwVhyCAVTGh47YOzo+X5DjmYJ/abF8W9nuv+
 CITn5D2VOQGPioD9v5nzqcYIAn2t0jyFCdbMgmutWDvLQBkEqNv2IVYip
 mujWo4TuUOu71jsbs8kpiB0Cz/5O0ZfLxEV7ebtf0+xgut1CW4UmC3biF
 BorzBqk3SWJns5aECJJmuPUVtyqOfINEg2EF0HkmubbUK+vbzzPfNRnxG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="387090735"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="387090735"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="932308224"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="932308224"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:43:34 -0700
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/11] accel/ivpu: Remove unneeded drm_driver dectaration
Date: Wed, 25 Oct 2023 11:43:14 +0200
Message-Id: <20231025094323.989987-3-stanislaw.gruszka@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
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
Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 790603017653..346dd7fdcacb 100644
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

