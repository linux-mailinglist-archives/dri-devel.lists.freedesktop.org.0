Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25294464563
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 04:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3611E6E43F;
	Wed,  1 Dec 2021 03:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909286E43F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 03:23:37 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3kvF1CWwz9vKM9
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 03:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqcyCrgCqT0Q for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 21:23:37 -0600 (CST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3kvD62lFz9vKMj
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 21:23:36 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3kvD62lFz9vKMj
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3kvD62lFz9vKMj
Received: by mail-pj1-f70.google.com with SMTP id
 t7-20020a17090a5d8700b001a7604b85f5so7828344pji.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 19:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PcN89m0hNh8auiyKMnyR563+8hFhi5+/hyGQkE1jlAk=;
 b=Bk/yRbPP0oXG+bDwmG7kNY+y5Dbd5lFfpyT4lGWAETenIIuEDH35DX27RzZBA/bsU7
 uK5zr1Zm5oB/6t+bjqWAYyfzA5AEusq2Ge2aUcLEQlKYPAxV8noFh1N5h6rBioItyKMh
 pCaCv0fCpQM+j8UyphV1XFIAKBRsc4K1p5IQoqrBuqc8u5rtpfWui0vdgeE0apcRX+Lh
 DIRg+hzgwZyo4oFyzQ+jKytlkuIxLRpWl2XBgWRxzzEk+mTnM4xWOkkaK+6YlOhO8YtR
 bdtCX6GOl3LcduLKg39GBOm1uRxbafHpQ8MmYLjx5433rWLL1tt3ilQ90FF+cz/y/Qnc
 txFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PcN89m0hNh8auiyKMnyR563+8hFhi5+/hyGQkE1jlAk=;
 b=3o7tGGHRKkR3vyFKEp0Z5oYlWWWAFcm5tpPhV+f2an0r31GDLb4WzGd3tLkow4BFXZ
 Z5laOCwysG7JBFslrQVqpHBFkjuWeY+8lGaes5FQAjkFJSDoLTaUYiy98nDgrqgdrP1r
 Q3AOt8gGauAR2Ke+7hEj2gisA8Tvh/ze2ggx2Qs/0mad4wFforsB6Qj0PtZvb2fJwErc
 SnnhqZnfDEfRDPwoPAcjvd9pTGV7mOVcL0jEBz0+YmG9oqCw/y2l+u8O2iAtrkgTZ+eH
 wSIkW+n/UYa0AIaNcTQrp5PPxciaoFj90O661Ee3xdfyep5yyo+v+El5QNk361e1FDi5
 RuJg==
X-Gm-Message-State: AOAM530mbqFTJMhJcBNVx0dC3wumK07NUVlxeD1WO3vwLNK8kUAY5SWp
 0+3SYzHRhSiPxOengaTJoKLvT1VveZ6MZo1xMq2bP6J1tV5qZvB3uV7qjaSyYGVY+2IT6Rb4VXa
 7QMdYNHa032wkaJic3a73H8TWdnAOlWQe
X-Received: by 2002:a05:6a00:26f7:b0:494:72f3:e8a3 with SMTP id
 p55-20020a056a0026f700b0049472f3e8a3mr3362403pfw.37.1638329015941; 
 Tue, 30 Nov 2021 19:23:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6LEQ1WK5rmgYHxSzQZ6XJ8+SXmljAje6xdJ/DZlh/Q5lYBueNR4OVAlZ2S1KJx990iXYBeA==
X-Received: by 2002:a05:6a00:26f7:b0:494:72f3:e8a3 with SMTP id
 p55-20020a056a0026f700b0049472f3e8a3mr3362384pfw.37.1638329015726; 
 Tue, 30 Nov 2021 19:23:35 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id 13sm21998388pfp.216.2021.11.30.19.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 19:23:35 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v4] drm/radeon/radeon_kms: Fix a NULL pointer dereference in
 radeon_driver_open_kms()
Date: Wed,  1 Dec 2021 11:23:30 +0800
Message-Id: <20211201032330.27157-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
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
Changes in v4:
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

