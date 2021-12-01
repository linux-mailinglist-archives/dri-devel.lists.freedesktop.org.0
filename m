Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B3465120
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 119F56E8AC;
	Wed,  1 Dec 2021 15:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25386E89B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:13:21 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J42f7688lz9w6Gh
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CUP574729ZX for <dri-devel@lists.freedesktop.org>;
 Wed,  1 Dec 2021 09:13:19 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J42f7455Dz9w6Gk
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 09:13:19 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J42f7455Dz9w6Gk
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J42f7455Dz9w6Gk
Received: by mail-pl1-f200.google.com with SMTP id
 y6-20020a17090322c600b001428ab3f888so10313583plg.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 07:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h4LXZln8T4HCcWzcanaTdpJLL3mZ2EfocGb+bUhELaY=;
 b=gD54pJwHKo5GPwYSZC10YNFg45mxtJJimjm+RtSINIL55BTNvRdZVZ8dEpn+Ezenhj
 8UVNeopOWpW6w275TNAoSZoe5qgb6YM6clzu+KzVkxtWZce7JBbxir8KaO9NiN2d79z2
 jDYv+3bGgG+FjKJ20zwdA9GBO61o4Z/yKROeuFCqF5YWXe3K2024+bZqrLTNwyPRGMWc
 sdJpo0APo3ipGHUYST547Tgcb/9rH450dJov8i0D/n72+2x7qcRF3luoNlMGS6jLe6oy
 nDnZhpBP9UwaF5FiW9eFfR72bsu9EBwFgrImdGfHqNnRlp50ayx2H/wOv7qt7Zm4cdT2
 gZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h4LXZln8T4HCcWzcanaTdpJLL3mZ2EfocGb+bUhELaY=;
 b=2btdtSChpaxUkVC12WBG83gfk0aiy2o+Pic+ejO6KgPrEAMojAfVZ9+ezcb7CJa0VS
 VU0TMlu1Q3W0o18KX2obd35sZt1ZPs8YYolDeqg8WTfVwY0cC0Ir71hUhV08HJvJvSct
 3u4dz39bGGgo5VcDwqbXLuqwNxCSOqtRkm7/ZNKGH8hlk8yyZqQtg7tX6Y1eY3D9OMU+
 VB9CbG4wSyvBzvswZErD5XjcWX+RD61jduUoroRu3nexTXzjSVHQpDv86idUX/J4RWjf
 R1LZp9oT74nAiyTbpskuD2FL9iVs9zlEsdYZGhcQvWexhw91DMPHZMHaQyv8ZGcWUgby
 q2/g==
X-Gm-Message-State: AOAM532plyBdWEsuJeDZBhepfMgQWp+WnKuj4RRB1PLB3ZYnsiZsgSPw
 Towosj8Gu9Ojgd63kGgCNLtgzG8wO13sLtjKs/eKFX0IrSUnr8lTT2pHuSzOGCC6OOZAKyT3F/7
 HsbS2GTONo81WvfRfaTMUBKuSesmH7/U6
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr8258168pjb.218.1638371598674; 
 Wed, 01 Dec 2021 07:13:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzQ3lgZ5HmEc+yg40LHvZgBrCVXftuWXu3L1JO3qkgIlyIo5lNUuY4CI/ttBB11keXNxAGag==
X-Received: by 2002:a17:90b:2252:: with SMTP id
 hk18mr8258135pjb.218.1638371598394; 
 Wed, 01 Dec 2021 07:13:18 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.22])
 by smtp.gmail.com with ESMTPSA id mh1sm6496pjb.6.2021.12.01.07.13.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:13:17 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v5] drm/radeon/radeon_kms: Fix a NULL pointer dereference in
 radeon_driver_open_kms()
Date: Wed,  1 Dec 2021 23:13:10 +0800
Message-Id: <20211201151310.177671-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e2685075-fbc5-6f36-907f-76b6f76a59ce@amd.com>
References: <e2685075-fbc5-6f36-907f-76b6f76a59ce@amd.com>
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
Changes in v5:
  -  Use conditions to avoid unnecessary initialization

Changes in v4:
  -  Initialize the variables to silence warning

Changes in v3:
  -  Fix the bug that good case will also be freed
  -  Improve code style

Changes in v2:
  -  Improve the error handling into goto style

 drivers/gpu/drm/radeon/radeon_kms.c | 36 ++++++++++++++++-------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 482fb0ae6cb5..66aee48fd09d 100644
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
@@ -672,35 +672,39 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
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
 
+	if (!r)
+		goto out_suspend;
+
+out_vm_fini:
+	radeon_vm_fini(rdev, vm);
+out_fpriv:
+	kfree(fpriv);
 out_suspend:
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
-- 
2.25.1

