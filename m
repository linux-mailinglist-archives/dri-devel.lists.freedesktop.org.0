Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCC131D8CE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 12:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD996E4EA;
	Wed, 17 Feb 2021 11:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFF06E4E6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 11:50:26 +0000 (UTC)
IronPort-SDR: V7367kAeZX1D6ct/55jGsy33My9etLdadgGMAQILHfhDmO06bg5+CpPIw2jYLgOMbCs+O3ZJ7t
 /KkCEYz5p0+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="170307969"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="170307969"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 03:50:25 -0800
IronPort-SDR: BbByJAqGFyjH+0gh5n+wiiglRCppP7MZhB3lArq/4GRrXLvUXXIjDejsLlnOQ5Qs3f6TcZrY/Y
 Sp800kWajrrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="419072436"
Received: from tejas-system-product-name.iind.intel.com ([10.145.162.130])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2021 03:50:23 -0800
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 2/2] intel: add INTEL_ADLS_IDS to the pciids list
Date: Wed, 17 Feb 2021 17:10:05 +0530
Message-Id: <20210217114005.11888-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210217114005.11888-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
References: <20210217114005.11888-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This enables drm_intel_bufmgr on ADLS

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 intel/intel_chipset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/intel/intel_chipset.c b/intel/intel_chipset.c
index 439db3e5..8ec36f82 100644
--- a/intel/intel_chipset.c
+++ b/intel/intel_chipset.c
@@ -35,6 +35,7 @@ static const struct pci_device {
 	uint16_t gen;
 } pciids[] = {
 	/* Keep ids sorted by gen; latest gen first */
+	INTEL_ADLS_IDS(12),
 	INTEL_RKL_IDS(12),
 	INTEL_DG1_IDS(12),
 	INTEL_TGL_12_IDS(12),
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
