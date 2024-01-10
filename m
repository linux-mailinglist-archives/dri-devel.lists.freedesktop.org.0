Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1D829F59
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 18:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E316110E669;
	Wed, 10 Jan 2024 17:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3469410E669;
 Wed, 10 Jan 2024 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704908372; x=1736444372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2z4G7ayANmd3AttgTkRDlrCJNrBsUpZOQMgDuxHVslg=;
 b=ICMY3cLg+cpqTyp5yyiGHZF8zrfFSOO48vm+bxTjLralxeYANUirMJYo
 bv5dxkgpJw8V5x6ERYyrTjAGybEzN5lAg6U31SkzQL390yDUcwWf01McH
 VcpHmXKJEUxXizEp7e6ES+WEH+VOhxy3SKmLMHHLGahkp+Na5ig3q7XzQ
 /ZWXgBU2SwmxerummeZzMZbIV89R3KYL9dYuFTlMeST15OM2JYENRDCe3
 kgD+y8MEOIpPP686DUNADD30qCegOSE+Z6L+sR0FbMq9bBMnu6h4BNQdC
 EoA/EAePuD2oiW99DVvOlmLFKqYeNqETERb8MXAwr5BTSSJ0CkKH3j17P Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="462878553"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="462878553"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="1029221825"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="1029221825"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.36.240])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 09:39:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm/nouveau/svm: remove unused but set variables
Date: Wed, 10 Jan 2024 19:39:12 +0200
Message-Id: <8b133e7ec0e9aef728be301ac019c5ddcb3bbf51.1704908087.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704908087.git.jani.nikula@intel.com>
References: <cover.1704908087.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Karol Herbst <kherbst@redhat.com>, jani.nikula@intel.com,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the W=1 warning -Wunused-but-set-variable.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index cc03e0c22ff3..4d1008915499 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -112,7 +112,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 {
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct drm_nouveau_svm_bind *args = data;
-	unsigned target, cmd, priority;
+	unsigned target, cmd;
 	unsigned long addr, end;
 	struct mm_struct *mm;
 
@@ -136,9 +136,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 		return -EINVAL;
 	}
 
-	priority = args->header >> NOUVEAU_SVM_BIND_PRIORITY_SHIFT;
-	priority &= NOUVEAU_SVM_BIND_PRIORITY_MASK;
-
 	/* FIXME support CPU target ie all target value < GPU_VRAM */
 	target = args->header >> NOUVEAU_SVM_BIND_TARGET_SHIFT;
 	target &= NOUVEAU_SVM_BIND_TARGET_MASK;
@@ -926,15 +923,14 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
 		 unsigned long addr, u64 *pfns, unsigned long npages)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
-	int ret;
 
 	args->p.addr = addr;
 	args->p.size = npages << PAGE_SHIFT;
 
 	mutex_lock(&svmm->mutex);
 
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
-				struct_size(args, p.phys, npages), NULL);
+	nvif_object_ioctl(&svmm->vmm->vmm.object, args,
+			  struct_size(args, p.phys, npages), NULL);
 
 	mutex_unlock(&svmm->mutex);
 }
-- 
2.39.2

