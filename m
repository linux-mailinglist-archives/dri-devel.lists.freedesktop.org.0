Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6C41683BA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 17:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221676F4D0;
	Fri, 21 Feb 2020 16:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965A26E2B2;
 Fri, 21 Feb 2020 13:24:49 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EBBF3C503326C0296B72;
 Fri, 21 Feb 2020 21:24:45 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Fri, 21 Feb 2020
 21:24:38 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <tony.cheng@amd.com>, <Rodrigo.Siqueira@amd.com>, <Eric.Yang2@amd.com>,
 <yongqiang.sun@amd.com>, <joseph.gravenor@amd.com>, <jaehyun.chung@amd.com>,
 <yuehaibing@huawei.com>, <Bhawanpreet.Lakha@amd.com>
Subject: [PATCH -next] drm/amd/display: remove set but not used variable
 'mc_vm_apt_default'
Date: Fri, 21 Feb 2020 21:24:33 +0800
Message-ID: <20200221132433.16532-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 21 Feb 2020 16:38:28 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hubp.c:
 In function hubp21_set_vm_system_aperture_settings:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hubp.c:343:23:
 warning: variable mc_vm_apt_default set but not used [-Wunused-but-set-variable]

It is never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
index aa7b0e7..d285ba6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
@@ -340,13 +340,9 @@ void hubp21_set_vm_system_aperture_settings(struct hubp *hubp,
 {
 	struct dcn21_hubp *hubp21 = TO_DCN21_HUBP(hubp);
 
-	PHYSICAL_ADDRESS_LOC mc_vm_apt_default;
 	PHYSICAL_ADDRESS_LOC mc_vm_apt_low;
 	PHYSICAL_ADDRESS_LOC mc_vm_apt_high;
 
-	// The format of default addr is 48:12 of the 48 bit addr
-	mc_vm_apt_default.quad_part = apt->sys_default.quad_part >> 12;
-
 	// The format of high/low are 48:18 of the 48 bit addr
 	mc_vm_apt_low.quad_part = apt->sys_low.quad_part >> 18;
 	mc_vm_apt_high.quad_part = apt->sys_high.quad_part >> 18;
-- 
2.7.4


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
