Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8146455D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 04:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2486E43D;
	Wed,  1 Dec 2021 03:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127476E43D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 03:22:22 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3ksn3zQWz9vFJM
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 03:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DH2LmcNgFBq4 for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 21:22:21 -0600 (CST)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3ksn21tfz9vFJ7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 21:22:21 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3ksn21tfz9vFJ7
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3ksn21tfz9vFJ7
Received: by mail-pf1-f198.google.com with SMTP id
 y5-20020a62b505000000b004a804839861so10336160pfe.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 19:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTVXQuQhsc1d7iMiD9SeDU8sw7AZGqQF1iZx+0GbJuQ=;
 b=Mey8Hl7JhPtzcENOIjQlzQuHBwN14Xad2IfLzWd0Dz3xcaRSSWkau8hs6rEdYNBgao
 glJpVX/Mdc6/YX3cB+zKq900J8gpZrm+PTsJUBWtJHYGpiyVvLGyiQyUb2GKj7skJa5v
 53CZBH3zHnv7F72fAFphpJUSLeYf8xlImMdP9zmmPLaamOhJkznGLgl0R8oER53I4eVp
 q0d9eRTFTgDFjcutHYqx0Wdxf/hcJ2d8sCi1Am6pf+9ATUzlCRKdgmEMYCMPm85toYsN
 GAk3SfJnGHci4VBwKqPhkGsOHevxyf2eHjVCSR+qPQdynNd27emPdWE8jH5AKiBlihdU
 jayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fTVXQuQhsc1d7iMiD9SeDU8sw7AZGqQF1iZx+0GbJuQ=;
 b=pYxQarqTJ7c2182bNUFIZU7yobX6fUDriDFDaLZ4tBA0/rjYo3UZUrvNU6wxj5gSd/
 qcqDpC3OvtnC9jtXQx7EU88LdzlcJar1GETeN6nBT1MKDlHAe5TG1i7B/9Ux3Twr8MW/
 J4MhEGDusftbRMILptFmLvBtC1+vnW2R/dGWteoGR2HtckWrlW0vLDcW2XGc2n6ryCCX
 sRHQ/MG/6sKVi7Cr6D/xfJGHExzvA5Fiyhdkc5gQ9xK6m2nGOmyTmeMjszqmtafXl5p3
 x600gH0MHihNn2mul5ir+ORDpxWnyTa9gacsBN4jfx0ro6J9AkNfNEXDyoXHE6uzJIL8
 0zew==
X-Gm-Message-State: AOAM5312RAaHFeTOVhIGoKCfHiqUKY4QrQENP2nZPdVilFnaPhnTOchV
 jcB9oMBaNd3HtS7cREAYAFSwVkybljDUoUYTRQcSJeZyNNXSRz3kos7z9P0PluyrFcRvcHxBssm
 gMuYP/vgZYgk0A6Dd/BtfsYKkvl4WOzib
X-Received: by 2002:a17:90a:e613:: with SMTP id
 j19mr4115841pjy.182.1638328940432; 
 Tue, 30 Nov 2021 19:22:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOy3OLaq0lO89Vq1n1ggE83k1YfxOUFBWrgp7cpduV/6onKzj0Tsdgx1gaihpQEgkRiIJEsw==
X-Received: by 2002:a17:90a:e613:: with SMTP id
 j19mr4115810pjy.182.1638328940176; 
 Tue, 30 Nov 2021 19:22:20 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id 12sm1126114pjn.16.2021.11.30.19.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 19:22:19 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v4] drm/radeon/radeon_kms: Fix a NULL pointer dereference in
 radeon_driver_open_kms()
Date: Wed,  1 Dec 2021 11:22:14 +0800
Message-Id: <20211201032214.26889-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130155720.178214-1-zhou1615@umn.edu>
References: <20211130155720.178214-1-zhou1615@umn.edu>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to
vm->ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In
radeon_vm_bo_set_addr(), there is a dereference of vm->ib_bo_va,
which could lead to a NULL pointer dereference on failure of
radeon_vm_bo_add().

Fix this bug by adding a check of vm->ib_bo_va.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_RADEON=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: cc9e67e3d700 ("drm/radeon: fix VM IB handling")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
Changes in v2:
  -  Initialize the variables to silence warning

Changes in v3:
  -  Fix the bug that good case will also be freed
  -  Improve code style

Changes in v2:
  -  Improve the error handling into goto style

 drivers/gpu/drm/radeon/radeon_kms.c | 37 ++++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 482fb0ae6cb5..9d0f840286a1 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -648,7 +648,9 @@ void radeon_driver_lastclose_kms(struct drm_device *dev)
 int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 {
 	struct radeon_device *rdev = dev->dev_private;
-	int r;
+	struct radeon_fpriv *fpriv = NULL;
+	struct radeon_vm *vm = NULL;
+	int r = 0;

 	file_priv->driver_priv = NULL;

@@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 
 	/* new gpu have virtual address space support */
 	if (rdev->family >= CHIP_CAYMAN) {
-		struct radeon_fpriv *fpriv;
-		struct radeon_vm *vm;
 
 		fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
 		if (unlikely(!fpriv)) {
@@ -672,35 +672,38 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 		if (rdev->accel_working) {
 			vm = &fpriv->vm;
 			r = radeon_vm_init(rdev, vm);
-			if (r) {
-				kfree(fpriv);
-				goto out_suspend;
-			}
+			if (r)
+				goto out_fpriv;
 
 			r = radeon_bo_reserve(rdev->ring_tmp_bo.bo, false);
-			if (r) {
-				radeon_vm_fini(rdev, vm);
-				kfree(fpriv);
-				goto out_suspend;
-			}
+			if (r)
+				goto out_vm_fini;
 
 			/* map the ib pool buffer read only into
 			 * virtual address space */
 			vm->ib_bo_va = radeon_vm_bo_add(rdev, vm,
 							rdev->ring_tmp_bo.bo);
+			if (!vm->ib_bo_va) {
+				r = -ENOMEM;
+				goto out_vm_fini;
+			}
+
 			r = radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
 						  RADEON_VA_IB_OFFSET,
 						  RADEON_VM_PAGE_READABLE |
 						  RADEON_VM_PAGE_SNOOPED);
-			if (r) {
-				radeon_vm_fini(rdev, vm);
-				kfree(fpriv);
-				goto out_suspend;
-			}
+			if (r)
+				goto out_vm_fini;
 		}
 		file_priv->driver_priv = fpriv;
 	}
 
+out_vm_fini:
+	if (r)
+		radeon_vm_fini(rdev, vm);
+out_fpriv:
+	if (r)
+		kfree(fpriv);
 out_suspend:
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
-- 
2.25.1

