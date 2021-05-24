Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1B38E1E7
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 09:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCF26E10A;
	Mon, 24 May 2021 07:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 916 seconds by postgrey-1.36 at gabe;
 Mon, 24 May 2021 07:32:06 UTC
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1DBA6E10A;
 Mon, 24 May 2021 07:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=S/NJiZJqmVPfl6uxv/
 pDPbwRzT0YuAz/dwnGWeYRgNA=; b=jlMHEbG8bKV22JULJbr/sC/blYN/tiWYdT
 PWtciqU3n8ub5EFcOkMTp6gq2rzkjzvr8P4em+Gp6Ly0V0H1zVIpY+anPmCrDPGV
 veiGUdVR4/jKWvrIcd1A0VR96ftzGPYn8GnzxaE09LKaQ4Y+4RKe55KCREWWoDGN
 4BcNHdsG8=
Received: from huangwentao.ccdomain.com (unknown [218.17.89.92])
 by smtp11 (Coremail) with SMTP id D8CowAA3POi0UqtgIqI3CA--.65S2;
 Mon, 24 May 2021 15:16:27 +0800 (CST)
From: nswdhpyhwt@163.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, sonny.jiang@amd.com, leo.liu@amd.com,
 lee.jones@linaro.org
Subject: [PATCH] drm/amdgpu: fix typo
Date: Mon, 24 May 2021 15:15:54 +0800
Message-Id: <20210524071554.12344-1-nswdhpyhwt@163.com>
X-Mailer: git-send-email 2.15.0.windows.1
X-CM-TRANSID: D8CowAA3POi0UqtgIqI3CA--.65S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr18ZrWxAFyfXF1rXw47urg_yoWDGrc_Cr
 48XrnrXw43uFsrtryjv39xX34jvr15CF4kXa4FqFZ5try7Ar43X3y7Zr98Xr48uFy2kF15
 Wa9Ygr1Sqa98GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUe6Hq7UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: hqvzvxps1k43i6rwjhhfrp/1tbi7wuc8Vr79hwCdQAAs1
X-Mailman-Approved-At: Mon, 24 May 2021 07:44:57 +0000
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
Cc: "tony.huang_cp" <huangwentao@yulong.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "tony.huang_cp" <huangwentao@yulong.com>

change 'interupt' to 'interrupt'

Signed-off-by: tony.huang_cp <huangwentao@yulong.com>
---
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 284447d..6c0e914 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -340,7 +340,7 @@ static int uvd_v3_1_start(struct amdgpu_device *adev)
 	/* enable VCPU clock */
 	WREG32(mmUVD_VCPU_CNTL,  1 << 9);
 
-	/* disable interupt */
+	/* disable interrupt */
 	WREG32_P(mmUVD_MASTINT_EN, 0, ~(1 << 1));
 
 #ifdef __BIG_ENDIAN
@@ -405,7 +405,7 @@ static int uvd_v3_1_start(struct amdgpu_device *adev)
 		return r;
 	}
 
-	/* enable interupt */
+	/* enable interrupt */
 	WREG32_P(mmUVD_MASTINT_EN, 3<<1, ~(3 << 1));
 
 	WREG32_P(mmUVD_STATUS, 0, ~(1<<2));
-- 
1.9.1

