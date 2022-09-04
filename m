Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC24A5ACA96
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F4E10E16B;
	Mon,  5 Sep 2022 06:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id DEED010E11F;
 Sun,  4 Sep 2022 18:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0Cixm
 +IIyxb326ssYKv/Au9Yv7Sc+F7nhziOB8Ue01o=; b=opPn+ZhzMSd99l1shlpjA
 xKjFwDqQuroq9cM9LAUu4Si5L6Jo3oc7IkFafdc6j/lP0VoDgBeIuFzFZ+bn3iHB
 eSRbVuZy1upto6hd0uD+Cag31oS8+0xI/Dee/hyFrBQVbtuw/nURcaliZ7RB//CN
 BRFEO8R5tAJ2Zk6//qmjRA=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp9 (Coremail) with SMTP id DcCowADXz7Vm7xRjeH6ieQ--.9485S4;
 Mon, 05 Sep 2022 02:33:23 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Felix.Kuehling@amd.com
Subject: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_sync.c file
Date: Mon,  5 Sep 2022 02:33:07 +0800
Message-Id: <20220904183307.14550-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowADXz7Vm7xRjeH6ieQ--.9485S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Jw1kJryDJFyrAFyrCr43GFg_yoW8JF1UpF
 1fJr4jgr45ZFWa93srAF1kZF93t3W7XFyxKr17Zw4Fqws8ZF15JF1FyrW0vFyDWrs8CF42
 yrWqqayrZFnIvF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEsXonUUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/xtbCoA5yF1zmWD1eTwABsE
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 504af1b93bfa..090e66a1b284 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright 2014 Advanced Micro Devices, Inc.
  * All Rights Reserved.
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

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
prerequisite-patch-id: fefd0009b468430bb223fc92e4abe9710518b1ea
-- 
2.34.1

