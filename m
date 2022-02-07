Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686A4AB368
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 04:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ADF10F37C;
	Mon,  7 Feb 2022 03:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E075710F37C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 03:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644204202; x=1675740202;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ko1vpkig3J7tQzgdH/SBKYMxBKnDnGBRY2QLcO+b5Kc=;
 b=hzuOCUw2wRhBkTX/YDGlBPw+q+rK4wM/qi7Mbp9AYJOZcfkzyRdoj6Go
 QxEYKSacBtduLmDmN09fn/To6tFFCtZQGxO61o6xpDtJYmGEDRsIf/UO3
 75kV8gMZFbeTwlVQntjLuu1p0f6Hd6jf5eJLO5nHvtkpJUnsRZAodvDKN
 BqKCPTc8DQK8461d+Ui88LoxK6Qcz2PWlO6jasFGWR7gvRF7sn6ilyp0u
 LJQE2gHHVonn0VsAWBTvZzk2lWEKKx5U5f8cWn2OSKEnMUZDmXg84PxAk
 rD5/lmH9kCPWq8asj1nKKv3IMr07ZlP4rIvFzRto9ANNgSQoZar1+XwMT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248844812"
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; d="scan'208";a="248844812"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2022 19:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; d="scan'208";a="772650492"
Received: from agabodun-lnx.jf.intel.com ([10.165.21.226])
 by fmsmga005.fm.intel.com with ESMTP; 06 Feb 2022 19:23:22 -0800
From: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
To: akeem.g.abodunrin@intel.com, matthew.d.roper@intel.com,
 baolu.lu@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] iommu/core: Remove comment reference to
 iommu_dev_has_feature
Date: Sun,  6 Feb 2022 19:23:22 -0800
Message-Id: <20220207032322.16667-1-akeem.g.abodunrin@intel.com>
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
Cc: iommu@lists.linux-foundation.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

iommu_dev_has_feature() api has been removed by the commit 262948f8ba573
("iommu: Delete iommu_dev_has_feature()") - So this patch removes comment
about the api to avoid any confusion.

Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
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

