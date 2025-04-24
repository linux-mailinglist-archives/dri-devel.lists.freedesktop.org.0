Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D845A9AC90
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 13:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B7C10E02E;
	Thu, 24 Apr 2025 11:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LUCA9mQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F143110E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745495817; x=1777031817;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pka1TihqqENohML/m9+LvmBVBPz6iWRC7JscbAmLv8c=;
 b=LUCA9mQz4kjBeHkkZt7D1jSOep73Mhj6bnt79IKB1Op0l/fS1MeQqBFd
 B/18vFbJcus6EUR+jRVDfrznkkVU4iqMD/h2DJN1K2gMg2HoHaECN4wpK
 YufNz67HUZosLwyLBQxiJRPOr75ZhdJf+/9epqtWqXaE+FTomXz5PpdS8
 uEBbaSniEMhdYslxLfYQkTzRkczndi867rD00hWITE7xFzd00ZgOwDAsU
 02FW/6hMooz/4ldU3Pp7wi5Zspds0rKby3JR0b7jK8iy2ndaIYv3It7ZK
 bU/iiiV14lMbYFGoho+sZrMdxP4pB4iS9CxYvU8i+Rv8dBcTQD4jP9PCP w==;
X-CSE-ConnectionGUID: dnm541/tSHyAbss0vGQJwA==
X-CSE-MsgGUID: 3T5mZIhkRUm0ZV0oFvRWIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="34741044"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="34741044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 04:56:56 -0700
X-CSE-ConnectionGUID: IDo3JUZ6RcidTPOCx71IMA==
X-CSE-MsgGUID: AZvtWOwUQ2OotH8IgPz5gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="132332660"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa009.jf.intel.com with ESMTP; 24 Apr 2025 04:56:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3E4C81AC; Thu, 24 Apr 2025 14:56:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH v1 1/1] atyfb: Remove unused PCI vendor ID
Date: Thu, 24 Apr 2025 14:56:52 +0300
Message-ID: <20250424115652.2451062-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The custom definition of PCI vendor ID in video/mach64.h is unused.
Remove it. Note, that the proper one is available in pci_ids.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/video/mach64.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/video/mach64.h b/include/video/mach64.h
index d96e3c189634..f1709f7c8421 100644
--- a/include/video/mach64.h
+++ b/include/video/mach64.h
@@ -934,9 +934,6 @@
 #define MEM_BNDRY_EN		0x00040000
 
 #define ONE_MB			0x100000
-/* ATI PCI constants */
-#define PCI_ATI_VENDOR_ID	0x1002
-
 
 /* CNFG_CHIP_ID register constants */
 #define CFG_CHIP_TYPE		0x0000FFFF
-- 
2.47.2

