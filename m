Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF4463AC3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12ED89F6B;
	Tue, 30 Nov 2021 15:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDDF89DB9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:58:04 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3RhC5HYXz9vsqw
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:58:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADupV2Wvu4Sx for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 09:58:03 -0600 (CST)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3RhC2xYTz9vsr6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:58:03 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3RhC2xYTz9vsr6
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3RhC2xYTz9vsr6
Received: by mail-pl1-f197.google.com with SMTP id
 p24-20020a170902a41800b001438d6c7d71so8462134plq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bTXkxPkhvwkgKe3CfQ7oKNFqLLxsibJM72YviuHICJY=;
 b=JXLhE+gLz8807ShPZSZBtudJocl+w6stUALlj11N7rM24NN8HXfOXGqMUBWF6f9IYK
 4tmgYEOcRw/QvKTRyOwZfpfmnqzsmA/hrkVGyp6sbzvGR8IJz7Eae2Db2itgWd2hJh6k
 FT1Vps8hTXW4OuK7IkVnGNU0EFN25oMFBeZjJitk2c1IzzpIMqSUG5KjCLIMngKJB51T
 HcFCQRDcSgoh8/UcsiseRNjQjbruj0ErYBwux3J8lLI8E7l6flcIPzCSVOLUG4dkdZht
 E9+2I7o3/hGSbZgptPnE/cbwb19FsDWZBKItWc6DAfFm7RLgXAx61vNw3OOnvPFJ+uBV
 iYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bTXkxPkhvwkgKe3CfQ7oKNFqLLxsibJM72YviuHICJY=;
 b=5C+oPF3OlCWIzVUf+t0ovZQYQENXzOrpIAd+bB25dwGb1k2chUNJU8lf+BL/h0+3Im
 kKanu5TUPTR0hHNqadCozXX3wShApFkn6w092x+1T90JRnz5vrdJ05TG5A3LGTsxmCnP
 oR92qWR25TFt49nanyqYLPR5e04Vh9I2QaM5mGUe2EYuLQsl2K1WVlc+QAoIqs/lpNIu
 BpRSroNq/a82ySbWaeMsc5IUM1jwdMn5RfNh8uJfp1MBLjqsDYKiVC0Tix0f4hdCbhhp
 T+Nw5iTt5nrgK71mQH9V6YtQmSTPz7YCgr8jY+yD5KcFHVJNS7TB38HPC+N1IrsbCDS5
 +YWw==
X-Gm-Message-State: AOAM530fktMhJ7qYNAsIO7rYbnaH/LQgfK2qwXdvDHWDX+do5dDrUI17
 F6N+6N/PkVm3ftCDbOlIFylkqfxY2Cev1ofkGNhvVBCtrwVNOeYbmtOGfnGUxnlCu99QRpZna3r
 PunTZDkQrJzoDmaYZLCdBGS2IQ0GP7JYh
X-Received: by 2002:a63:155d:: with SMTP id 29mr21858pgv.302.1638287882663;
 Tue, 30 Nov 2021 07:58:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIaxwNEDzH7cmq7l7LiRaYXMObjxXyqF8evR41ZnOQZpK9G2rDCI1/FqCk8Jv+9cm2uvYXJw==
X-Received: by 2002:a63:155d:: with SMTP id 29mr21828pgv.302.1638287882411;
 Tue, 30 Nov 2021 07:58:02 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id h13sm15230838pgg.16.2021.11.30.07.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 07:58:02 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v3] drm/radeon/radeon_kms: Fix a NULL pointer dereference in
 radeon_driver_open_kms()
Date: Tue, 30 Nov 2021 23:57:19 +0800
Message-Id: <20211130155720.178214-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f776cb6f-d599-a543-9177-dac7d08cf7d4@amd.com>
References: <f776cb6f-d599-a543-9177-dac7d08cf7d4@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
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
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
Changes in v3:
  -  Fix the bug that good case will also be freed
  -  Improve code style

Changes in v2:
  -  Improve the error handling into goto style

 drivers/gpu/drm/radeon/radeon_kms.c | 35 ++++++++++++++++-------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 482fb0ae6cb5..439f4d1fdd65 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -648,6 +648,8 @@ void radeon_driver_lastclose_kms(struct drm_device *dev)
 int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 {
 	struct radeon_device *rdev = dev->dev_private;
+	struct radeon_fpriv *fpriv;
+	struct radeon_vm *vm;
 	int r;
 
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

