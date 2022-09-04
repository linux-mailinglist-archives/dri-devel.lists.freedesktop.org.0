Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2AA5ACA9B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFAE10E175;
	Mon,  5 Sep 2022 06:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id 961BE10E004;
 Sun,  4 Sep 2022 09:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=e072z
 4VQxm65ywSD356w2FUZqlt2NwgtGY3qZldyc5k=; b=Qo5fxiQweQpZlZDTpNWjZ
 jn48cwb8HCghjgqFKdXkrdPu+LIBgBcLr/KIiVaTUZN43Yk7nvvdhSSM7h6vsgVq
 YfZStYEQKM7r4N1FvV1GKYQ1tMRogvD5ks+7aWHMlm1/D6yh1l2jXzaSDJZymYru
 lVYKDkhLpyY8yBiXnYtt0Y=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp12 (Coremail) with SMTP id EMCowABnt49DbxRjQYBnJg--.28508S4;
 Sun, 04 Sep 2022 17:26:42 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Felix.Kuehling@amd.com
Subject: [PATCH] amd: amdgpu: fix coding style issue
Date: Sun,  4 Sep 2022 17:26:25 +0800
Message-Id: <20220904092625.1007393-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowABnt49DbxRjQYBnJg--.28508S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jw1kJryDJF1xXF1UZF4fKrg_yoW8JF18pr
 1fGr15Kr45ZFWSk39rZ3WkuFyft3WxXFy8KrW7Zw4Y9ws8XF98Jry5tr4jvF9rWrsxCF47
 tryqqay5uFnFvr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE6RRZUUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/1tbishJyF1UMWQCYBwAAsa
X-Mailman-Approved-At: Mon, 05 Sep 2022 06:28:39 +0000
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a patch to the amdgpu_sync.c file that fixes some warnings found by the checkpatch.pl tool

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 504af1b93bfa..dfc787b749b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -1,5 +1,6 @@
-/*
- * Copyright 2014 Advanced Micro Devices, Inc.
+// SPDX-License-Identifier: GPL-2.0
+
+/* Copyright 2014 Advanced Micro Devices, Inc.
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -315,6 +316,7 @@ struct dma_fence *amdgpu_sync_get_fence(struct amdgpu_sync *sync)
 	struct hlist_node *tmp;
 	struct dma_fence *f;
 	int i;
+
 	hash_for_each_safe(sync->fences, i, tmp, e, node) {
 
 		f = e->fence;
@@ -392,7 +394,7 @@ void amdgpu_sync_free(struct amdgpu_sync *sync)
 {
 	struct amdgpu_sync_entry *e;
 	struct hlist_node *tmp;
-	unsigned i;
+	unsigned int i;
 
 	hash_for_each_safe(sync->fences, i, tmp, e, node) {
 		hash_del(&e->node);
-- 
2.34.1

