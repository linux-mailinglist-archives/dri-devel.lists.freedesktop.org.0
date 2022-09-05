Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974935ACDEA
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1EE610E216;
	Mon,  5 Sep 2022 08:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 951E410E21C;
 Mon,  5 Sep 2022 08:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=n8jim
 TPIu9UZqmJ995DXsFwWDfsZzJcQTg3Vl6nj2zY=; b=YlwtPGXQv/fCjAYEgE3qn
 urPQTVYmWyEt5HtUOdQD0y3rOzZpf35gQaJckJlw8xhrht87fpDqc8tL1kkQYIpx
 WVBFsBvA13MGslON0XvwmZ+tAgP3o7sPPHLWb3au9QbWLp9ru/peDRXAmgAjOFce
 FxI59KcN9owrcxsj3zUDjY=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown
 [1.203.67.201])
 by smtp11 (Coremail) with SMTP id D8CowAB3RIGEtRVjxaMXAA--.4936S4;
 Mon, 05 Sep 2022 16:38:48 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: Felix.Kuehling@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdkfd_gpuvm.c
Date: Mon,  5 Sep 2022 16:38:25 +0800
Message-Id: <20220905083825.23429-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowAB3RIGEtRVjxaMXAA--.4936S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww4UZr1kGry5GF4DArWrXwb_yoW8GF1xpF
 4fAr12gFWUZr12y347Ca95Xa4YyayxW3WUGrW7Wrya9345JF95Aa4rtrWUCr97XF4DCFs7
 ta9rt3yUZFyI9r7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEsXonUUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/xtbBaRpzF1Xly1cDCgAAsy
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

Fix everything checkpatch.pl complained about in amdgpu_amdkfd_gpuvm.c

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index cbd593f7d553..eff596c60c89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright 2014-2018 Advanced Micro Devices, Inc.
  *
@@ -1612,6 +1613,7 @@ size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev)
 	uint64_t reserved_for_pt =
 		ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);
 	size_t available;
+
 	spin_lock(&kfd_mem_limit.mem_limit_lock);
 	available = adev->gmc.real_vram_size
 		- adev->kfd.vram_used_aligned
@@ -2216,7 +2218,7 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
 {
 	if (atomic_read(&adev->gmc.vm_fault_info_updated) == 1) {
 		*mem = *adev->gmc.vm_fault_info;
-		mb();
+		mb(); /* make sure read happened */
 		atomic_set(&adev->gmc.vm_fault_info_updated, 0);
 	}
 	return 0;

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
-- 
2.34.1

