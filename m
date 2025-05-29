Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FE2AC77C7
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 07:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0C10E6E1;
	Thu, 29 May 2025 05:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoO2Vo3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A27D10E274
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 05:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748497331; x=1780033331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SszxCmsQ/alnLjPMaj/qHpVpVa5oHlCJl3O95fFvP8o=;
 b=LoO2Vo3fV7n2BunwX1rdMkVOXuelDaX0YsqTNQun7eHl0ph9t2i2xrZX
 /VdQaZAhew8fjKccU+4Ykur4PGoRQF9HzVkASz8vUzaAWh2G8xfqAz4yB
 5pBi6H9XLx7Kim5Rhhle5J4o7aEJuT+5uqaLvkgb6voJUiuXgNDR8Mcxk
 IU0hwO4B34rb1ryNF8bvWAHqBZO+4eOKQC1Bi7ItxxXrpJIIjyJ8OyQ1k
 O2xsw8bZs66z5p/e1SmUZZcajk53mw6Qo29iUVsFuY8KyD3jZeEE4Js6a
 UGAjxyJYKq3UZKG35tHjYxYc2154UNhuE77rIWQwJxG5O13cGr21kGgWW g==;
X-CSE-ConnectionGUID: ZP+Igqr+TvW1zfwKoFUi4w==
X-CSE-MsgGUID: 0oJfdASsQhmqmlAK4vd3ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67962967"
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="67962967"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 22:42:10 -0700
X-CSE-ConnectionGUID: eCitUIkpQa2RjTiX6bzOHQ==
X-CSE-MsgGUID: gVKSKMYHTUWyYpK329M9qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,323,1739865600"; d="scan'208";a="144443296"
Received: from yilunxu-optiplex-7050.sh.intel.com ([10.239.159.165])
 by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 22:42:04 -0700
From: Xu Yilun <yilun.xu@linux.intel.com>
To: kvm@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 jgg@nvidia.com, dan.j.williams@intel.com, aik@amd.com,
 linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, yilun.xu@linux.intel.com, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Subject: [RFC PATCH 05/30] fixup! vfio/pci: fix dma-buf revoke typo on reset
Date: Thu, 29 May 2025 13:34:48 +0800
Message-Id: <20250529053513.1592088-6-yilun.xu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
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

Fixed the patch:

  vfio/pci: Allow MMIO regions to be exported through dma-buf

Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
---
 drivers/vfio/pci/vfio_pci_config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index efccbb2d2a42..7ac062bd5044 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -911,7 +911,7 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
 			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
 			if (__vfio_pci_memory_enabled(vdev))
-				vfio_pci_dma_buf_move(vdev, true);
+				vfio_pci_dma_buf_move(vdev, false);
 			up_write(&vdev->memory_lock);
 		}
 	}
@@ -996,7 +996,7 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
 			vfio_pci_dma_buf_move(vdev, true);
 			pci_try_reset_function(vdev->pdev);
 			if (__vfio_pci_memory_enabled(vdev))
-				vfio_pci_dma_buf_move(vdev, true);
+				vfio_pci_dma_buf_move(vdev, false);
 			up_write(&vdev->memory_lock);
 		}
 	}
-- 
2.25.1

