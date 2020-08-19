Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC96249C64
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364D26E29A;
	Wed, 19 Aug 2020 11:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9276E22F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:24 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADE2922D75;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=U1Fn6R3HH/nCSOGEI8Nq0OF9Epnu4lU5x3hp5T2IvBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TileK6/o3AqFkzLVtx5iczylaFoJqwGC1tfmpvA2PoRr6hsRwO+q4FnCKsGcLfhRV
 tecOMMRhwEm0m7Z7zpBHroLLZHKmeRooJN4h45vN2vrufJF1G9Fvk4DGtuaaRFCjwQ
 pKxudLioPgVDcxiltIqqWJl0XVBo4gFI2/lrv+9w=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00EubL-J6; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 32/49] staging: hikey9xx/gpu: get rid of iommu_format
Date: Wed, 19 Aug 2020 13:46:00 +0200
Message-Id: <22b04b229a090821671eafaec635d4feff205afb.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Liuyao An <anliuyao@huawei.com>,
 mauro.chehab@huawei.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Those aren't needed anymore.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h | 1 -
 drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h | 1 -
 drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h | 2 --
 3 files changed, 4 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
index a0f7732063a3..7b9da796a671 100644
--- a/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin960_dpe_reg.h
@@ -3087,7 +3087,6 @@ struct dss_hw_ctx {
 	struct iommu_domain *mmu_domain;
 	struct ion_client *ion_client;
 	struct ion_handle *ion_handle;
-	struct iommu_map_format iommu_format;
 	char __iomem *screen_base;
 	unsigned long smem_start;
 	unsigned long screen_size;
diff --git a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
index 84293d2d462e..9c1b62831733 100644
--- a/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
+++ b/drivers/staging/hikey9xx/gpu/kirin970_dpe_reg.h
@@ -4100,7 +4100,6 @@ struct dss_hw_ctx {
 	struct iommu_domain *mmu_domain;
 	struct ion_client *ion_client;
 	struct ion_handle *ion_handle;
-	struct iommu_map_format iommu_format;
 	char __iomem *screen_base;
 	unsigned long smem_start;
 	unsigned long screen_size;
diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
index 261259cb8f5f..54b4ddc2fe42 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
@@ -18,7 +18,6 @@
 #include <drm/drm_print.h>
 
 #include <linux/iommu.h>
-#include <linux/hisi/hisi-iommu.h>
 
 #define MAX_CRTC	2
 
@@ -41,7 +40,6 @@ struct kirin_fbdev {
 
 	struct ion_client *ion_client;
 	struct ion_handle *ion_handle;
-	struct iommu_map_format iommu_format;
 	void *screen_base;
 	unsigned long smem_start;
 	unsigned long screen_size;
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
