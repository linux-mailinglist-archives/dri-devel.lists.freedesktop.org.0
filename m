Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 367B45A6982
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 19:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6354410E248;
	Tue, 30 Aug 2022 17:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2578210E241;
 Tue, 30 Aug 2022 17:19:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 77F23B81D0F;
 Tue, 30 Aug 2022 17:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8BDFC433D6;
 Tue, 30 Aug 2022 17:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661879962;
 bh=avKLgB8ycs/5i5FbGLyyAohN1rYc0v6FmHyhCFQT7ME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sRlvWlT5viU3x2g5frNT5ictw8td/yUS/qL9Nnx3euq7b7jy680tctkvJckRUGne3
 8S4jKl9dK34vIOI9ajmHpgGDs6B53+Udn43I5dBZ4vRt/jm4ojsMPcisY2gfi2g5cy
 uRuzldrz2ADdtCJH3YQeR+nt17N27/iFGRwzbVnm3kPETtoyFrWn9rYtYjtcMJ7/2i
 r4rhl3F4jzDw++BHOGncFXHH6FWY4tPk8Uumugkf5a//WegfU/CkdQNVjHWukbZqgy
 37MAxraDgEhAkZ7cdvzfbNI7BM9xugs/sWYsqAZOS4L+1wjkymhXvpo3fr5uQYtJGS
 0T19wwDub5zHw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 12/33] drm/amdgpu: Remove the additional kfd pre
 reset call for sriov
Date: Tue, 30 Aug 2022 13:18:03 -0400
Message-Id: <20220830171825.580603-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830171825.580603-1-sashal@kernel.org>
References: <20220830171825.580603-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Amaranath.Somalapuram@amd.com,
 guchun.chen@amd.com, airlied@linux.ie, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 lang.yu@amd.com, christian.koenig@amd.com, shaoyunl <shaoyun.liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: shaoyunl <shaoyun.liu@amd.com>

[ Upstream commit 06671734881af2bcf7f453661b5f8616e32bb3fc ]

The additional call is caused by merge conflict

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: shaoyunl <shaoyun.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ea2b74c0fd229..67d4a3c13ed19 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4475,8 +4475,6 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 retry:
 	amdgpu_amdkfd_pre_reset(adev);
 
-	amdgpu_amdkfd_pre_reset(adev);
-
 	if (from_hypervisor)
 		r = amdgpu_virt_request_full_gpu(adev, true);
 	else
-- 
2.35.1

