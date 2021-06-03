Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD16E39983D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 04:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB346EF3F;
	Thu,  3 Jun 2021 02:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 544 seconds by postgrey-1.36 at gabe;
 Thu, 03 Jun 2021 02:51:02 UTC
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1236EF3F;
 Thu,  3 Jun 2021 02:51:02 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown
 [58.250.176.229])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id AD808AC034F;
 Thu,  3 Jun 2021 10:41:54 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 John Clements <john.clements@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Huang Rui <ray.huang@amd.com>,
 Jinzhou Su <Jinzhou.Su@amd.com>, Wenhui Sheng <Wenhui.Sheng@amd.com>,
 Liu ChengZhe <ChengZhe.Liu@amd.com>, Victor Zhao <Victor.Zhao@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Oak Zeng <Oak.Zeng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: amdgpu: Remove duplicate include of drm_drv.h
Date: Thu,  3 Jun 2021 10:41:45 +0800
Message-Id: <1622688107-20340-1-git-send-email-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGR9OSFYdHUtDSEtPTElDSU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hOSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ME06Ejo4Ez8UHRUvGDBITTQ3
 L1EwFBJVSlVKTUlJTUNDSkpOTE5JVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlO
 Q1VJTktVSkxNVUlJQllXWQgBWUFJTEtPNwY+
X-HM-Tid: 0a79cfbfaac1b039kuuuad808ac034f
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
Cc: Wan Jiabing <wanjiabing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_drv.h is included at line 28, remove the duplicate here.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 3ff76cb..131cff0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -41,8 +41,6 @@
 #include "amdgpu_securedisplay.h"
 #include "amdgpu_atomfirmware.h"
 
-#include <drm/drm_drv.h>
-
 static int psp_sysfs_init(struct amdgpu_device *adev);
 static void psp_sysfs_fini(struct amdgpu_device *adev);
 
-- 
2.7.4

