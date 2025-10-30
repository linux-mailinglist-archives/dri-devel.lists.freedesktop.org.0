Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D56C21FC9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 20:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50CCD10EA28;
	Thu, 30 Oct 2025 19:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="LVpllqau";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com
 [209.85.214.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5C910EA25
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 19:36:54 +0000 (UTC)
Received: by mail-pl1-f228.google.com with SMTP id
 d9443c01a7336-29470bc80ceso16704535ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 12:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761853014; x=1762457814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3XDelQobsLwdo6gXrraQPRzg65rIFTKYHYA1RjqmFQ=;
 b=NlpIrz4otrjoX6pbDUbIAnirC0TxExm5jxxd9D4vXCTfBbyqk2+r1VBRis7ToEiah4
 7JWcf95OmjL2ncub0k3VVu+Ye2yToit9qgJHABmGi26Nuov/UBtvuKGmO/k42BFy0OY6
 G8+g5u8xlmQInHP7xvgrEtCo8X6EAaM7Uc2xojzh/cWjLFT5urnWLCvQr3I0m8rFxAg3
 oYzqxwaBSMpJDCmPxLE6+HNnaSxagnCz7qm1ERd+Ik3JVcm4vizuxJhDx/8Kyn/fYhKw
 USQwJduE2jOqc5WuGQJypDjQ6nRsU6DIkDepSrKvyWjW3bwPmsxTRuaztqpwTjPUdQo7
 MNGg==
X-Gm-Message-State: AOJu0YxGrAvE0i27Zm/aARtyFBs4/zIWotQE1b8i37k7MUQSLuaL+KSB
 u0nDEyjZrJLq4ktmkd8lPO8pfmS12+RQH8r8IXwy55a59JMJJ1mo3IdMOAXHiR6U45TPND2Q3yQ
 pJ6/KxtgyUdx/vIJV298hj+Vt+/kaJdwRuChuwG5ffo3oNtQUVZxHY2MvNuJdedeHH3pH2uGQup
 qaHwM1OEiSeplVs1JQhYc3IbZmp5dEM19AnJNjp09Gw+SzL9A9XSPUveUmJKm4tvkWd0Z1IbpKH
 8/2jmESlWSyTPdGf38+
X-Gm-Gg: ASbGncvyYFnFs0GRVtI6eoDCT8CKwzgcV2vcGw05kluYgemU4f9B43vFsUxRVdJ2PVR
 xPnhfpYlv/cBc3cKlyJTKcy7tkpDVIboZTv7+1Pmx+rXu0ksE7mtHf8tGfzWHUQxyqaClrbWabs
 TYNoJirpKSaoUOK6krr5Gos/gkbEij3A9q9L9Xk5axMsBX8uygwtnCSIZ78+xls5JLrEHQ8SGpQ
 XRao6YtT15ixK76UJzd5Os1sMzdp6AvgwMsRlwniV0IVTc4I415OUZXUiPyLz6KWiCnh3mhdn8V
 kdetHz8/v1ami6ZHua4pSDT7jto3D3MrIjVlUSk/1IVaYzLcRPoSYDTrvm2xnE5P8bzpoObD8AZ
 qIuJ4hcuaTOAYHJ+xoC3gEj9ENZ/j3bO7+RxsfwaUlI1X+uJ0iEpjw8UyctIL3V6h1R6qhtIBq3
 p+iKc3NhEamDvobV2Fo8M2nhDszdG4v0sm6w==
X-Google-Smtp-Source: AGHT+IEZd5VUfm17kYKR1fCS2umtaorPMknXmQrzN6NnfKtcow5vhNczEABVitJTpYDV1rf7Ee28UdFq3pON
X-Received: by 2002:a17:902:f549:b0:290:e390:94f0 with SMTP id
 d9443c01a7336-294ed2b8f8bmr51398365ad.24.1761853014134; 
 Thu, 30 Oct 2025 12:36:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-29498d40ae1sm17586275ad.43.2025.10.30.12.36.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Oct 2025 12:36:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-79e43c51e6fso983960b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 12:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1761853012; x=1762457812;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M3XDelQobsLwdo6gXrraQPRzg65rIFTKYHYA1RjqmFQ=;
 b=LVpllqaua7XCpQS+/Ehy5kF9onJzZrjWp10tdcj+2CmhIgVD/xJ9nER5tfN2oLnojU
 oVhk+btT9h47iuA132UGtY7cu4NBSk28Ti4MNnVamYXK2On6qaswLLjhiRw1Q+WFHVQs
 60UvgpTTynGeXW98soSAYsxCLa1PcP306TqiA=
X-Received: by 2002:a05:6a00:6f94:b0:77f:60b8:2a48 with SMTP id
 d2e1a72fcca58-7a615260bcdmr4253388b3a.11.1761853011942; 
 Thu, 30 Oct 2025 12:36:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:6f94:b0:77f:60b8:2a48 with SMTP id
 d2e1a72fcca58-7a615260bcdmr4253366b3a.11.1761853011193; 
 Thu, 30 Oct 2025 12:36:51 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a414012b19sm19397624b3a.12.2025.10.30.12.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 12:36:50 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 maaz.mombasawala@broadcom.com, Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Use kref in vmw_bo_dirty
Date: Thu, 30 Oct 2025 14:36:40 -0500
Message-ID: <20251030193640.153697-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Rather than using an ad hoc reference count use kref which is atomic
and has underflow warnings.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index 7de20e56082c..fd4e76486f2d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -32,22 +32,22 @@ enum vmw_bo_dirty_method {
 
 /**
  * struct vmw_bo_dirty - Dirty information for buffer objects
+ * @ref_count: Reference count for this structure. Must be first member!
  * @start: First currently dirty bit
  * @end: Last currently dirty bit + 1
  * @method: The currently used dirty method
  * @change_count: Number of consecutive method change triggers
- * @ref_count: Reference count for this structure
  * @bitmap_size: The size of the bitmap in bits. Typically equal to the
  * nuber of pages in the bo.
  * @bitmap: A bitmap where each bit represents a page. A set bit means a
  * dirty page.
  */
 struct vmw_bo_dirty {
+	struct   kref ref_count;
 	unsigned long start;
 	unsigned long end;
 	enum vmw_bo_dirty_method method;
 	unsigned int change_count;
-	unsigned int ref_count;
 	unsigned long bitmap_size;
 	unsigned long bitmap[];
 };
@@ -221,7 +221,7 @@ int vmw_bo_dirty_add(struct vmw_bo *vbo)
 	int ret;
 
 	if (dirty) {
-		dirty->ref_count++;
+		kref_get(&dirty->ref_count);
 		return 0;
 	}
 
@@ -235,7 +235,7 @@ int vmw_bo_dirty_add(struct vmw_bo *vbo)
 	dirty->bitmap_size = num_pages;
 	dirty->start = dirty->bitmap_size;
 	dirty->end = 0;
-	dirty->ref_count = 1;
+	kref_init(&dirty->ref_count);
 	if (num_pages < PAGE_SIZE / sizeof(pte_t)) {
 		dirty->method = VMW_BO_DIRTY_PAGETABLE;
 	} else {
@@ -274,10 +274,8 @@ void vmw_bo_dirty_release(struct vmw_bo *vbo)
 {
 	struct vmw_bo_dirty *dirty = vbo->dirty;
 
-	if (dirty && --dirty->ref_count == 0) {
-		kvfree(dirty);
+	if (dirty && kref_put(&dirty->ref_count, (void *)kvfree))
 		vbo->dirty = NULL;
-	}
 }
 
 /**
-- 
2.51.1

