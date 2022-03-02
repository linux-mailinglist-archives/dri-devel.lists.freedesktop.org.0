Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0764CA51D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 13:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C628410ECFA;
	Wed,  2 Mar 2022 12:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3399310ECF8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646225142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QOqtk8N28P4LW85N0QCWUUhlLsc+6PwvTIzB1n1peR4=;
 b=UpfN4E2DMrBRaCP5ezNVpSRNTAAaSQNthH0il2+B33WrL+oOK4/VQSn2+Zs+cIAxnXW8VJ
 LvgDaYD5dDheUu66X/PvpLufzXD9SnZmnqY9LrD2beHKqObifbMEWPzEHS7h+r1nBb/lZo
 49nyNNyubylHnEYBmkTZDJ5I8cqSYcw=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-OBH3ExCsOROUhd3YLBqxsQ-1; Wed, 02 Mar 2022 07:45:41 -0500
X-MC-Unique: OBH3ExCsOROUhd3YLBqxsQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 b10-20020a4a340a000000b0031937d5a5efso1145618ooa.15
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Mar 2022 04:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QOqtk8N28P4LW85N0QCWUUhlLsc+6PwvTIzB1n1peR4=;
 b=EMLBIO0or4MUuKYnx1/lH707eYnEnPnGPXoN9ps6xKZaLKFZ4B5zBh+43HbEtW9HXB
 9kR/rOnDf3HQbOHAwzJaxJUJ47QLDoqujpQ+gAMj8C/T6ROlS1Myb4/XUi85DW9qgRwD
 lupQzt6fwEyGRiq8p38nwTCxgWdipCwiYvmdCTdLieivXByEj3O0jg2p3lhHvFSnDWFv
 b9bVwjsmm14Fw4FcQka9IE07krB7058osW6oSpUC34E+TNgfuHoVm2EYLobCgeo3H6FX
 q0YFwHIFiPc8Piw3FBuyV0KBymI6v6dXt/WugZmysTVGCYepF0+jKAn0SUox745eSD4v
 jYYA==
X-Gm-Message-State: AOAM530xd6GTjKeNCyBJxhVdYgfvVxl4CUuKDoQq4OC6Dfh0pX+ahBrS
 wxraY0u0oGOPg0DlhkF6vIDwHcEOPe+J+xPxOVbcxIbkLKyPx4K3r8d8FGm65rw7pVw5k1Nm/YX
 mQXVJxmr9avxu8VNhQ7dROB4+T7X8
X-Received: by 2002:a05:6830:19c8:b0:5b0:298f:42fa with SMTP id
 p8-20020a05683019c800b005b0298f42famr6537989otp.167.1646225140341; 
 Wed, 02 Mar 2022 04:45:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnDPc+2WvUOGatFtOiVPEE5LXJGFam8aUb+jqjAchdLIWMbnsYv+rv/jMkNL9HI/Eoo4PdeA==
X-Received: by 2002:a05:6830:19c8:b0:5b0:298f:42fa with SMTP id
 p8-20020a05683019c800b005b0298f42famr6537973otp.167.1646225140110; 
 Wed, 02 Mar 2022 04:45:40 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 y28-20020a4aea3c000000b0031c0cddfbf9sm7743217ood.20.2022.03.02.04.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 04:45:39 -0800 (PST)
From: trix@redhat.com
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2] drm/panfrost: cleanup comments
Date: Wed,  2 Mar 2022 04:45:35 -0800
Message-Id: <20220302124535.358060-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

For spdx
change tab to space delimiter
Use // for *.c

Replacements
commited to committed
regsiters to registers
initialze to initialize

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: remove multiline comment change

 drivers/gpu/drm/panfrost/panfrost_drv.c          | 2 +-
 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c | 2 +-
 drivers/gpu/drm/panfrost/panfrost_issues.h       | 2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c          | 2 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 96bb5a4656278..94b6f0a19c83a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -562,7 +562,7 @@ static int panfrost_probe(struct platform_device *pdev)
 
 	pfdev->coherent = device_get_dma_attr(&pdev->dev) == DEV_DMA_COHERENT;
 
-	/* Allocate and initialze the DRM device. */
+	/* Allocate and initialize the DRM device. */
 	ddev = drm_dev_alloc(&panfrost_drm_driver, &pdev->dev);
 	if (IS_ERR(ddev))
 		return PTR_ERR(ddev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
index b0142341e2235..77e7cb6d1ae3b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2019 Arm Ltd.
  *
  * Based on msm_gem_freedreno.c:
diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index 8e59d765bf19f..501a76c5e95ff 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -14,7 +14,7 @@
  */
 enum panfrost_hw_issue {
 	/* Need way to guarantee that all previously-translated memory accesses
-	 * are commited */
+	 * are committed */
 	HW_ISSUE_6367,
 
 	/* On job complete with non-done the cache is not flushed */
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 39562f2d11a47..d3f82b26a631d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier:	GPL-2.0
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 
 #include <drm/panfrost_drm.h>
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 6c5a11ef1ee87..efe4b75149d35 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -292,7 +292,7 @@
 #define AS_FAULTADDRESS_LO(as)		(MMU_AS(as) + 0x20) /* (RO) Fault Address for address space n, low word */
 #define AS_FAULTADDRESS_HI(as)		(MMU_AS(as) + 0x24) /* (RO) Fault Address for address space n, high word */
 #define AS_STATUS(as)			(MMU_AS(as) + 0x28) /* (RO) Status flags for address space n */
-/* Additional Bifrost AS regsiters */
+/* Additional Bifrost AS registers */
 #define AS_TRANSCFG_LO(as)		(MMU_AS(as) + 0x30) /* (RW) Translation table configuration for address space n, low word */
 #define AS_TRANSCFG_HI(as)		(MMU_AS(as) + 0x34) /* (RW) Translation table configuration for address space n, high word */
 #define AS_FAULTEXTRA_LO(as)		(MMU_AS(as) + 0x38) /* (RO) Secondary fault address for address space n, low word */
-- 
2.26.3

