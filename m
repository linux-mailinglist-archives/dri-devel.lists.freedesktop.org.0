Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72BCDBF76
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 11:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE7310E9DA;
	Wed, 24 Dec 2025 10:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="WPQ54Fn4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Tue, 23 Dec 2025 04:51:24 UTC
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ABC410E155;
 Tue, 23 Dec 2025 04:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1766465481;
 bh=u9HK5WkS2fcFuxe+k5UcXPAlCrGB6EX0UgNVnyzoysU=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=WPQ54Fn4fj0BxQ76Ci1KGvMxZMGgol0UIVNjCUr9GKxYLTYh69TNJNRO9QPB07W01
 P/39GQNxjbckxGaVieViDuoAVsyTeBOGa+na7hGDmRKX8J3MCvNHYisPehOnbXsMZ1
 LCE5K+yPP0hRwCHUnLJh+o3yWsfNQ2FblG37fSsY=
X-QQ-mid: zesmtpsz2t1766464959taa0020f0
X-QQ-Originating-IP: E18NMKDrD7Pu2x7Z/L1l19pXDbCjjkSolU/I/GflKgQ=
Received: from localhost.localdomain ( [123.114.60.34])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 23 Dec 2025 12:42:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7113700151840439031
EX-QQ-RecipientCnt: 8
From: Ding Yihan <dingyihan@uniontech.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ding Yihan <dingyihan@uniontech.com>
Subject: [PATCH] drm/amdgpu: Fix typos in amdgpu_vm_bo_update comments
Date: Tue, 23 Dec 2025 12:41:20 +0800
Message-Id: <20251223044120.1574243-1-dingyihan@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: NJRsSVeNb6U+qIECb1WDAcne+2jVMzNmHyCCjS3Qt8vLHPtTFSxfAOH7
 iSyCoV/rg2bcNe+4vfrULhc9+Mr61KO8zmGjxrkEM4nqCAhM3HTf9a4H3X1qU+BWkONlAW2
 LoHsxLZFKwZJBwMRSr4GwGNBvST6lSRmEndfTHaKnuN254xyI6XkdOZaxhQLKx3XwmPQYgX
 vRUbCcxWHNvUX3c4TI39zXzsujFxz5PAWZjeXYKv9mhndn1ilV4oJnHIUAzTJ0rZECGXFG6
 4ksDJx/hOZiYmRtOGTP1mwA4dg8y0Bs6KkmuNzcdH3loCdXIXVnLAzOwqUUEtnBQ4Y6Cfgx
 wdZLh57gkfoym0BQw+Z+KVqj03QFlW2aqpTptFFGXoXuditivlQgX2D2SJ7xSgrPweoMh6A
 R+3Z58douQgomPGd5F03DAliynm6t5+Fs9dRiUhQn3458odQ5fdcRDOeF7NqnRDA2WFOGjR
 fVyBtWcreMiQjtUY6Sg/1t6YdB4CCzbO/j38PotmN9u6RbMsNyOPC7QhaDL/rBQcHUlIAQu
 n1MP8sCF8g2NdMQrqHJZT2Q0iGJI/uGl4BiM7LC/ToKP+BWkGJmNXAAoBaT4pEagjK2voIy
 0uq4ubPL9VPCKN/gJsMXmZvmFD1u7pPUhgsjxdJlk1bMD19VDw90f8Sa0z1VfXyLF5nKq09
 /QSCSWDP8mbzb+iNEwCmaw6I1riFZ+5YQFYhxzEoNMprcZETrA2W30U0+no0DvbYgz0FDpx
 tYlq7oZQfWAcQCGlqYOYsMp+Kle0NcsBsziRRY+m97uWTOkqsEiCxg8SJ1yOCillpLWffOK
 BWXTC+rmqS11y7jaDqGRESoYrhnq/ka9qvve2trgpIUk0dnHNbNprcz9i6+rps3TOqI1HJ8
 K/MpdtiqoqySSvUXVzua+ZUN25Y4C3/zPazNwVfaRAhxJ5OQ7yo2QRC5OVLSBCJIdnH7/2a
 ermEuHdfNMeEBl7n8r/PdbOiaDn0m+8Jrbg66C1DWqRwQSUMI//Cs3cvUP2DtPFb+XwjFSK
 U8qnzSCiDuq4obcTcytRoSLabp/fSdzfLxmZ5IXJpoQPlpwME6lKHPT0Ptj6M=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Wed, 24 Dec 2025 10:21:59 +0000
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

Fix spelling mistakes in the comment block within amdgpu_vm_bo_update().
Specifically, correct "contians" to "contains" and "WIRTEABLE" to
"WRITEABLE".

Additionally, improve the grammar, capitalization, and punctuation of
the comment for better readability.

Signed-off-by: Ding Yihan <dingyihan@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index c362d4dfb5bb..502d32728008 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1352,8 +1352,8 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 	list_for_each_entry(mapping, &bo_va->invalids, list) {
 		uint64_t update_flags = flags;
 
-		/* normally,bo_va->flags only contians READABLE and WIRTEABLE bit go here
-		 * but in case of something, we filter the flags in first place
+		/* Normally,bo_va->flags only contains READABLE and WRITEABLE bits here.
+		 * But in case of something, we filter the flags in first place.
 		 */
 		if (!(mapping->flags & AMDGPU_VM_PAGE_READABLE))
 			update_flags &= ~AMDGPU_PTE_READABLE;
-- 
2.20.1

