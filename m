Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC882A9AB
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 09:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E3E10E817;
	Thu, 11 Jan 2024 08:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.6])
 by gabe.freedesktop.org (Postfix) with ESMTP id A691E10E028;
 Thu, 11 Jan 2024 02:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=zK0YN430fRG/wJDkOy
 RLzq+lusy5pMsnDcFSbdS1ltM=; b=AcDNtnxK4AP42mE+SXzZ2l0GbvwP18wR6/
 XVmquiHVemvyVfdD8n0uqW8iOq0kVpxy6Nrz6ZjN80zLSPsHRnoJhUoLcbn67xRa
 YUEGL7Jy5w+6Xve7AuSO1hltSBVyfMcnPqkueti9Sb4tPs0SELsKrf/p2x3Fg1om
 m5UJ5n5ec=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-4 (Coremail) with SMTP id _____wD3P7u1UZ9lyIUtAA--.14199S2;
 Thu, 11 Jan 2024 10:25:57 +0800 (CST)
From: chenxuebing <chenxb_99091@126.com>
To: christian.koenig@amd.com, daniel@ffwll.ch, Xinhui.Pan@amd.com,
 alexander.deucher@amd.com, airlied@gmail.com
Subject: [PATCH] drm/amdgpu: Clean up errors in amdgpu_gmc.c
Date: Thu, 11 Jan 2024 02:25:56 +0000
Message-Id: <20240111022556.6327-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3P7u1UZ9lyIUtAA--.14199S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurW8Zw17Wry7Kr1ruw4UJwb_yoWDurX_Cr
 W7Xwn5Kr13AF92qF13Z3yYqw1DtFy5ur4kWr12yFn3t343Z348AryjgryfXay8u3WxGFyD
 uw1YgrWYya9xWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRt8nDUUUUU==
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiOhpixWVEuXoZjAAAsw
X-Mailman-Approved-At: Thu, 11 Jan 2024 08:50:44 +0000
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
Cc: chenxuebing <chenxb_99091@126.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: need consistent spacing around '-' (ctx:WxV)

Signed-off-by: chenxuebing <chenxb_99091@126.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index d2f273d77e59..a5d2cda33266 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -52,7 +52,7 @@ int amdgpu_gmc_pdb0_alloc(struct amdgpu_device *adev)
 	struct amdgpu_bo_param bp;
 	u64 vram_size = adev->gmc.xgmi.node_segment_size * adev->gmc.xgmi.num_physical_nodes;
 	uint32_t pde0_page_shift = adev->gmc.vmid0_page_table_block_size + 21;
-	uint32_t npdes = (vram_size + (1ULL << pde0_page_shift) -1) >> pde0_page_shift;
+	uint32_t npdes = (vram_size + (1ULL << pde0_page_shift) - 1) >> pde0_page_shift;
 
 	memset(&bp, 0, sizeof(bp));
 	bp.size = PAGE_ALIGN((npdes + 1) * 8);
-- 
2.17.1

