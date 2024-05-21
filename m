Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A236F8CA5EA
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 03:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 856E710E13D;
	Tue, 21 May 2024 01:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uLm5NDcy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F2110E13D;
 Tue, 21 May 2024 01:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1716255777; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=3bb0F+rW2A9d/TPFvZuKQflLMyVtWyJLrNl20e+QGcY=;
 b=uLm5NDcyepwzAPAnGmu6qAhNweFb/7APag8KWkLoECP85Z1TlP0+0wOy7o7OzV3Wjh/aRfCSWz28ojTTAUrbokYXuRO3GRRIlADKvHjqyUhsyBvYnEwchg6kJos1ElQ9/iS+VFN2RnJnHv/PNTOqeJBJxula5MmHytBhIOQjxj8=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R941e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033037067113;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0W6vwJNX_1716255775; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0W6vwJNX_1716255775) by smtp.aliyun-inc.com;
 Tue, 21 May 2024 09:42:56 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] drm/amdgpu: Fix kernel-doc param for
 amdgpu_vm_is_bo_always_valid
Date: Tue, 21 May 2024 09:42:53 +0800
Message-Id: <20240521014253.125836-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make @abo to @bo to silence the kernel-doc warning.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index b9cca51356b1..3abfa66d72a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -3008,7 +3008,7 @@ void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
  * amdgpu_vm_is_bo_always_valid - check if the BO is VM always valid
  *
  * @vm: VM to test against.
- * @abo: BO to be tested.
+ * @bo: BO to be tested.
  *
  * Returns true if the BO shares the dma_resv object with the root PD and is
  * always guaranteed to be valid inside the VM.
-- 
2.20.1.7.g153144c

