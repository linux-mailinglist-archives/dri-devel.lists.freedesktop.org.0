Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4173CD1719
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0A610F099;
	Fri, 19 Dec 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="ykRwGRLj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAADC10F093;
 Fri, 19 Dec 2025 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=blWFti2tFPKyEyaGfXOc6NvTt/uLRQso2G+suyw4GtU=; b=ykRwGRLjoAFK64oxwV8+/J/SF2
 WdYo2v82JUuGB2qNdnWfisKxszkRcTgRw+lWNRzThvJsnJpFo9MrudRFfq8n8+z7+mQMBnePhyO32
 UnsxCh+YN+xkU+psGOjZE5ef9xGYPyBDa65LKrhU0eTmUDf0SwWMRmfhcfjKOLOZIt6Fo6lOrJtjZ
 73AFfA6sPJciaGw1KT3FJ+wuR29iJXzix1rPlr/cZKWrnqk1uG90a2pULux0T4teZWBUdEcyg8uUe
 KJIFQWYRL7gVpPVF53kTL36qE5ecmq73wp4D1UcbQnhCeUa6C2CGY+c1+vgwCT5dYOlfgc7TNZ+ut
 mkBANM9A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfV0-0000000AqkV-1vLz; Fri, 19 Dec 2025 18:46:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:38 -0800
Message-ID: <20251219184638.1813181-20-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
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

Correct or add kernel-doc comments to eliminate all warnings:

Warning: ../drivers/gpu/drm/msm/msm_iommu.c:381 expecting prototype for
 alloc_pt(). Prototype was for msm_iommu_pagetable_alloc_pt() instead
Warning: ../drivers/gpu/drm/msm/msm_iommu.c:426 expecting prototype for
 free_pt(). Prototype was for msm_iommu_pagetable_free_pt() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_iommu.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/msm_iommu.c
+++ linux-next-20251119/drivers/gpu/drm/msm/msm_iommu.c
@@ -364,7 +364,7 @@ msm_iommu_pagetable_prealloc_cleanup(str
 }
 
 /**
- * alloc_pt() - Custom page table allocator
+ * msm_iommu_pagetable_alloc_pt() - Custom page table allocator
  * @cookie: Cookie passed at page table allocation time.
  * @size: Size of the page table. This size should be fixed,
  * and determined at creation time based on the granule size.
@@ -416,7 +416,7 @@ msm_iommu_pagetable_alloc_pt(void *cooki
 
 
 /**
- * free_pt() - Custom page table free function
+ * msm_iommu_pagetable_free_pt() - Custom page table free function
  * @cookie: Cookie passed at page table allocation time.
  * @data: Page table to free.
  * @size: Size of the page table. This size should be fixed,
