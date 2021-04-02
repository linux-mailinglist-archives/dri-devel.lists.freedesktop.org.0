Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1B235279A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 10:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493C76EE29;
	Fri,  2 Apr 2021 08:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17635.qiye.163.com (mail-m17635.qiye.163.com
 [59.111.176.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF76C6EE29
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 08:55:00 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 9B78C40047D;
 Fri,  2 Apr 2021 16:54:55 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Aaron Liu <aaron.liu@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: remove not needed conversion to bool
Date: Fri,  2 Apr 2021 01:54:02 -0700
Message-Id: <20210402085454.76864-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSEhKQk0ZSx0ZSUNPVkpNSkxITkhNQk5CT09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6FAw6HT8OGioiKzpDCh05
 DxUwClZVSlVKTUpMSE5ITUJNSUhLVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFJT09DNwY+
X-HM-Tid: 0a7891cae284d991kuws9b78c40047d
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
Cc: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix coccicheck warning:
drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c:573:39-44: WARNING: conversion to bool not needed here
drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c:575:39-44: WARNING: conversion to bool not needed here

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
index ab9be5ad5a5f..0734e8ef5e41 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
@@ -570,9 +570,9 @@ static int mmhub_v2_3_set_clockgating(struct amdgpu_device *adev,
 		return 0;
 
 	mmhub_v2_3_update_medium_grain_clock_gating(adev,
-			state == AMD_CG_STATE_GATE ? true : false);
+			(state == AMD_CG_STATE_GATE));
 	mmhub_v2_3_update_medium_grain_light_sleep(adev,
-			state == AMD_CG_STATE_GATE ? true : false);
+			(state == AMD_CG_STATE_GATE));
 
 	return 0;
 }
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
