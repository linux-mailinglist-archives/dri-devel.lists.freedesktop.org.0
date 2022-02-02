Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A8A4A69F4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 03:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1017010E54F;
	Wed,  2 Feb 2022 02:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEA510E54F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 02:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643769465; x=1675305465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zFUncUbhfnvgaEbErIgawnk2kmhFomWqXowKdIic5EE=;
 b=le6jx2gpvSwjsDrTGkMDdNEX4/oYW8ZfJtmyVVlxSYchm/pdP7G2UMDx
 3jpR9VBrgcuLhg26imQz9lAO50naqPiX/U8/aYMwpHChkCEXCt6M3tC8l
 oXGbV0tAwdhBadihvkgOh5Qry4jw+nExd9B/KC9UpmE25hUre3oR8LjQo
 FfLfiWKuMoh2HqodEqRILCcjV/Se/IOuxgvhMQsIbChb7lFFoWBNgRGXE
 RVzsRS5/M0uvVu2vBQlqeSa2NydxIg/f+iWafj53WQ9yXrDpqXNmkT6dY
 PPOM5KlBT01Il3OiOiZhy7ILvqYcMu8N1B6pqiNYGGxItoCZxsN2P3HqF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="235234956"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="235234956"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 18:37:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; d="scan'208";a="583267957"
Received: from agabodun-lnx.jf.intel.com ([10.165.21.226])
 by fmsmga008.fm.intel.com with ESMTP; 01 Feb 2022 18:37:43 -0800
From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
To: akeem.g.abodunrin@intel.com, matthew.d.roper@intel.com,
 baolu.lu@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH] iommu/vt-d: Remove comment reference to iommu_dev_has_feature
Date: Tue,  1 Feb 2022 18:37:43 -0800
Message-Id: <20220202023743.28135-1-akeem.g.abodunrin@intel.com>
X-Mailer: git-send-email 2.21.3
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
Cc: iommu@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

iommu_dev_has_feature() api has been removed by the commit 262948f8ba573
("iommu: Delete iommu_dev_has_feature()") - So this patch removes comment
about the api to avoid any confusion.

Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/iommu.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index de0c57a567c8..bea054f2bd4d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -153,8 +153,7 @@ struct iommu_resv_region {
  *			 supported, this feature must be enabled before and
  *			 disabled after %IOMMU_DEV_FEAT_SVA.
  *
- * Device drivers query whether a feature is supported using
- * iommu_dev_has_feature(), and enable it using iommu_dev_enable_feature().
+ * Device drivers enable the feature via iommu_dev_enable_feature().
  */
 enum iommu_dev_features {
 	IOMMU_DEV_FEAT_AUX,
-- 
2.21.3

