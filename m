Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B51FCD16CE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 19:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6CE10F074;
	Fri, 19 Dec 2025 18:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="JQjg/rLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF8F10F071;
 Fri, 19 Dec 2025 18:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=n2QCGuXDn6fbkhpDLCszi/O5wYtsu/QFTBbHZORqNCg=; b=JQjg/rLVjCNRdyWY/1SfPFRDbI
 yJtq4Vwx70vKFz+nS6UxGTOgaGJihzGBItigXP+Ppj1X5O4vra8qUShwT8VMLzDXIaBq4qWARPVZB
 NvYeI1pxSrk9xZrGHuZ67QQWwFe9dzNCT9+3umXtcWQpG9SBCnahysOh7b5jYsg4qh1CZXYwLGq/r
 /XJMhrbJSAgPRSCprm/I5USH48Hpq9GMSPUlOTBy4D2acu4mjOcOlInVV7Ml29FPxOe+SRd7G5ZxC
 YnyoGYygkXByRb26cp/m7WjE0caLR/bVOunmNfPnQJijSbi5dpojyzsI227Cr7YKU0NjMwce6Y0R8
 8I62aMtQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vWfUu-0000000AqkV-2gJo; Fri, 19 Dec 2025 18:46:40 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/19] drm/msm: correct/add a load of kernel-doc comments
Date: Fri, 19 Dec 2025 10:46:19 -0800
Message-ID: <20251219184638.1813181-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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

Correct a bunch of kernel-doc comments in drm/msm/.

[PATCH 01/19] drm/msm/disp: mdp_format: fix all kernel-doc warnings
[PATCH 02/19] drm/msm/dp: fix all kernel-doc warnings
[PATCH 03/19] drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
[PATCH 04/19] drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
[PATCH 05/19] drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
[PATCH 06/19] drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
[PATCH 07/19] drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
[PATCH 08/19] drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
[PATCH 09/19] drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
[PATCH 10/19] drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
[PATCH 11/19] drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
[PATCH 12/19] drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
[PATCH 13/19] drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
[PATCH 14/19] drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
[PATCH 15/19] drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
[PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
[PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
[PATCH 18/19] drm/msm: msm_gpu.h: fix all kernel-doc warnings
[PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings


 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h      |    4 
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h      |   84 ++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h      |    3 
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h      |   10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h     |    6 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h     |   20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h       |   23 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h  |    1 
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h |   20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h     |   47 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h      |   21 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h     |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h       |    4 
 drivers/gpu/drm/msm/disp/mdp_format.h           |    6 -
 drivers/gpu/drm/msm/dp/dp_debug.h               |    2 
 drivers/gpu/drm/msm/dp/dp_drm.c                 |    1 
 drivers/gpu/drm/msm/dp/dp_link.h                |    9 -
 drivers/gpu/drm/msm/dp/dp_panel.h               |    8 -
 drivers/gpu/drm/msm/msm_fence.h                 |   36 +++---
 drivers/gpu/drm/msm/msm_gem_vma.c               |    5 
 drivers/gpu/drm/msm/msm_gpu.h                   |   68 +++--------
 drivers/gpu/drm/msm/msm_iommu.c                 |    4 
 22 files changed, 197 insertions(+), 201 deletions(-)

Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
