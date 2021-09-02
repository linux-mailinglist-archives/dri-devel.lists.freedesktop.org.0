Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA03FF5C4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 23:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B7A6E81B;
	Thu,  2 Sep 2021 21:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 005F56E81B;
 Thu,  2 Sep 2021 21:45:13 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id ECE8F3FE71; 
 Thu,  2 Sep 2021 21:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630619112;
 bh=s9p5QLB1+aDHhWrCWaZs6bVSkWVQnpCvcnaOFCjNF1w=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=uqdIoGDigSHGeux/F/gdDe1/0r9C8ZJjDg/Zssuiyaf7iStZADcs8G1Agx+zAG0Zz
 DavD3If6UqRelNJ7Iyu3VYe4DxH/B5WA/JhdMMOoWqblbAs0ideETSSn2WfrtcCmEg
 PQKlH8kp5ziQ+8jNGWGV/KsHB6TQpsi4h2C7voTwuCBigjptd8reBUmcjWdo1HDL83
 xgQ+AEE2pNYMB5ceNhLrugjnODd1AkQOPa47EKmWfAviEipmR1aQkIL4Hgh1vTH5Hr
 bvLNmiZJ0p0KseS3Bkd2I9mPoACChBoB9/6UajHNv1c4yL6MjC9OlccsaMZJyjMsAE
 iZpzC0q9yQ7/A==
From: Colin King <colin.king@canonical.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: clean up inconsistent indenting
Date: Thu,  2 Sep 2021 22:45:10 +0100
Message-Id: <20210902214510.55070-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

From: Colin Ian King <colin.king@canonical.com>

There are a couple of statements that are indented one character
too deeply, clean these up.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index d6aa032890ee..a573424a6e0b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -60,10 +60,9 @@ static vm_fault_t amdgpu_gem_fault(struct vm_fault *vmf)
 			goto unlock;
 		}
 
-		 ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-						TTM_BO_VM_NUM_PREFAULT, 1);
-
-		 drm_dev_exit(idx);
+		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+					       TTM_BO_VM_NUM_PREFAULT, 1);
+		drm_dev_exit(idx);
 	} else {
 		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
 	}
-- 
2.32.0

