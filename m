Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50239427AF
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 09:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A0910E2DD;
	Wed, 31 Jul 2024 07:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="efMfnLFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F9710E363
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 07:05:18 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-260e208e126so3362072fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 00:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722409517; x=1723014317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mrCAXXCSMmjbL6R33sl32ct6gbQlsIym8nsT33zM3Rc=;
 b=efMfnLFxR004XO/A75r8ni5uy0YxOOtX4TkNkKdGV8ZPafeJsRLNCddv+I5v+RB2N3
 AQpLGUgWeKuqp6StDgEcWcD3RgL+r31NtLw1HqRA5EXNi7gktrA084v4AmnxnliUS55g
 cW1zDqksNR3jRl6d5c367XwxbfLwd7vTdi0hCTbhmn7a/8A4TpKvu7GZRmGvZ0Tx+MJA
 QregqIwfhS91MI7wpsA13xLCs9fHrL0xTSx4KbOOb6q7XX30J4I+bkP3CyC+qA8FQpN/
 NNrSap6D9lJnWquSqWlFngiOSZ+Izq6p1o6NxGSfeMLalsSf6IW3QP+53EK4SK9t15I7
 ATcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722409517; x=1723014317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mrCAXXCSMmjbL6R33sl32ct6gbQlsIym8nsT33zM3Rc=;
 b=QwJjx4CKKJBlRaG+TR2Es4ON0tEhcDW81UpEpk2SGDOypgLg/Eu0dG/e90zr0Eu6O4
 LDsieDte6oW6zIq5/Gs8ZwR1k0fI2tjuQbEg/jElM7RoMtBbQLjR5pN0yXf46y2ZuzWE
 VLocBBN6JQTb9i2gpwtvJVsYW0fj7DQwj/Fu9WSR/OMBBjKVuEQ1oq87b9SMZMmvUCz2
 ggi9EDLCO0LZfybQc3NmHVCxU++qQ7LEaWsCa1m/r+cTk9lqd4mjH/jTDgEjf0a6pkG5
 sPLVP+TW/YUgzuSSJUvjLxBAGlR3JJ//+H4l3zBXrnZ9kANyBzBK5v+NjpElqRL9fjB8
 RtDA==
X-Gm-Message-State: AOJu0YwdxU4LUotbWfcaKFn28eNHW+MTu+I7BROdDdPmzCWmeLP7I3sr
 GGrULsDtzNYWxpJJVlgkQ8Mld+MdWZRjM5QqERy8if3Ao2NwLzI5UJ1NBKA27+Q=
X-Google-Smtp-Source: AGHT+IGr572fiibvBQPX2H/P2UU6sDQCN8guL81ZBr4lGrTb8rxtV2x6+RVC46jqxQD7x55AYK4KPA==
X-Received: by 2002:a05:6870:2d4:b0:261:198f:13cd with SMTP id
 586e51a60fabf-267d4ef04e5mr16428624fac.32.1722409516886; 
 Wed, 31 Jul 2024 00:05:16 -0700 (PDT)
Received: from Riyan.inspiron ([122.176.203.252])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead7120f6sm9447234b3a.50.2024.07.31.00.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 00:05:16 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: vme.h: alignment of closing parenthesis
 should match open parenthesis in function declaration
Date: Wed, 31 Jul 2024 12:35:07 +0530
Message-Id: <20240731070507.6290-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 31 Jul 2024 07:19:04 +0000
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

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/vme_user/vme.h b/drivers/staging/vme_user/vme.h
index 26aa40f78a74..7753e736f9fd 100644
--- a/drivers/staging/vme_user/vme.h
+++ b/drivers/staging/vme_user/vme.h
@@ -129,8 +129,7 @@ struct vme_driver {
 };
 
 void *vme_alloc_consistent(struct vme_resource *, size_t, dma_addr_t *);
-void vme_free_consistent(struct vme_resource *, size_t,  void *,
-	dma_addr_t);
+void vme_free_consistent(struct vme_resource *, size_t,  void *, dma_addr_t);
 
 size_t vme_get_size(struct vme_resource *);
 int vme_check_window(struct vme_bridge *bridge, u32 aspace,
@@ -138,20 +137,20 @@ int vme_check_window(struct vme_bridge *bridge, u32 aspace,
 
 struct vme_resource *vme_slave_request(struct vme_dev *, u32, u32);
 int vme_slave_set(struct vme_resource *, int, unsigned long long,
-	unsigned long long, dma_addr_t, u32, u32);
+		  unsigned long long, dma_addr_t, u32, u32);
 int vme_slave_get(struct vme_resource *, int *, unsigned long long *,
-	unsigned long long *, dma_addr_t *, u32 *, u32 *);
+		  unsigned long long *, dma_addr_t *, u32 *, u32 *);
 void vme_slave_free(struct vme_resource *);
 
 struct vme_resource *vme_master_request(struct vme_dev *, u32, u32, u32);
 int vme_master_set(struct vme_resource *, int, unsigned long long,
-	unsigned long long, u32, u32, u32);
+		   unsigned long long, u32, u32, u32);
 int vme_master_get(struct vme_resource *, int *, unsigned long long *,
-	unsigned long long *, u32 *, u32 *, u32 *);
+		   unsigned long long *, u32 *, u32 *, u32 *);
 ssize_t vme_master_read(struct vme_resource *, void *, size_t, loff_t);
 ssize_t vme_master_write(struct vme_resource *, void *, size_t, loff_t);
 unsigned int vme_master_rmw(struct vme_resource *, unsigned int, unsigned int,
-	unsigned int, loff_t);
+			    unsigned int, loff_t);
 int vme_master_mmap(struct vme_resource *resource, struct vm_area_struct *vma);
 void vme_master_free(struct vme_resource *);
 
@@ -162,13 +161,13 @@ struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t);
 struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long, u32, u32, u32);
 void vme_dma_free_attribute(struct vme_dma_attr *);
 int vme_dma_list_add(struct vme_dma_list *, struct vme_dma_attr *,
-	struct vme_dma_attr *, size_t);
+		     struct vme_dma_attr *, size_t);
 int vme_dma_list_exec(struct vme_dma_list *);
 int vme_dma_list_free(struct vme_dma_list *);
 int vme_dma_free(struct vme_resource *);
 
 int vme_irq_request(struct vme_dev *, int, int,
-	void (*callback)(int, int, void *), void *);
+		    void (*callback)(int, int, void *), void *);
 void vme_irq_free(struct vme_dev *, int, int);
 int vme_irq_generate(struct vme_dev *, int, int);
 
-- 
2.39.2

