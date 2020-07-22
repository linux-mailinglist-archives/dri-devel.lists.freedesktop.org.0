Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F222918F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA7F88503;
	Wed, 22 Jul 2020 07:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6637D6E108;
 Wed, 22 Jul 2020 01:52:35 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 46135F10C8CAD54FD757;
 Wed, 22 Jul 2020 09:52:30 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Jul 2020
 09:52:22 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <Jack.Zhang1@amd.com>
Subject: [PATCH -next] drm/amdgpu/vcn3.0: Remove set but not used variable
 'direct_poll'
Date: Wed, 22 Jul 2020 09:52:10 +0800
Message-ID: <20200722015210.29488-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 22 Jul 2020 07:02:50 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c: In function vcn_v3_0_start_sriov:
drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1235:3:
 warning: variable direct_poll set but not used [-Wunused-but-set-variable]

It is never used, so can remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 910a4a32ff78..53f680134c40 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -1231,8 +1231,6 @@ static int vcn_v3_0_start_sriov(struct amdgpu_device *adev)
 		direct_wt = { {0} };
 	struct mmsch_v3_0_cmd_direct_read_modify_write
 		direct_rd_mod_wt = { {0} };
-	struct mmsch_v3_0_cmd_direct_polling
-		direct_poll = { {0} };
 	struct mmsch_v3_0_cmd_end end = { {0} };
 	struct mmsch_v3_0_init_header header;
 
@@ -1240,8 +1238,6 @@ static int vcn_v3_0_start_sriov(struct amdgpu_device *adev)
 		MMSCH_COMMAND__DIRECT_REG_WRITE;
 	direct_rd_mod_wt.cmd_header.command_type =
 		MMSCH_COMMAND__DIRECT_REG_READ_MODIFY_WRITE;
-	direct_poll.cmd_header.command_type =
-		MMSCH_COMMAND__DIRECT_REG_POLLING;
 	end.cmd_header.command_type =
 		MMSCH_COMMAND__END;
 
-- 
2.17.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
