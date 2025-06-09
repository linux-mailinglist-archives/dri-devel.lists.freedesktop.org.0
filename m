Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A24AD29CE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 00:53:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2B310E42F;
	Mon,  9 Jun 2025 22:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=foxmail.com header.i=@foxmail.com header.b="idtq2HgY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 384 seconds by postgrey-1.36 at gabe;
 Mon, 09 Jun 2025 09:49:46 UTC
Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com
 [203.205.221.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D703B10E09B;
 Mon,  9 Jun 2025 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1749462568;
 bh=SmniMHqvZWFuqEmiIWWjPLL01AF0Q8ESLGE7t/Sogxg=;
 h=From:To:Cc:Subject:Date;
 b=idtq2HgYxd2w3wWn39SQiGj+xATdRhVT2L58cSCsy6mKHSGdiwDV9gZqGQmHjp3q8
 EUi4oer1gkAZhf5NH0k3Q/eod+0ZULAlqBYfcWsut7+TgOsl7VGqgVOWw4ulk4gp3e
 QLvLOZKQ8kiElIB7YqXwmh2RAz7TVyneiVa+VZIY=
Received: from localhost.localdomain ([58.208.27.5])
 by newxmesmtplogicsvrszgpuc5-0.qq.com (NewEsmtp) with SMTP
 id 927B7009; Mon, 09 Jun 2025 17:36:39 +0800
X-QQ-mid: xmsmtpt1749461799troe02dud
Message-ID: <tencent_03FB073FD3015AE02485DD6839D6571EBC06@qq.com>
X-QQ-XMAILINFO: OQac6g2KrvnW0ceRmcxfNhsHzSagz0pC/3jPClfdEiuQtKjOS6oANK6zvhUWk/
 LLSKJVCrZ6/6JoYrzqUQeapXBgQRtSEOJ6n45Jx7YyP1M2C5E/7JeofNz2sOtaZwV04TUaN34dl1
 gs7YJ1SxiXd0FKjsIv/8XY3oziX7d1P3ByA8jdrvS+wKwdkX+A4HwhtO0mhyJK75pJzUxKAHbOsE
 0YaZIctyDxYHbpUezRVLEX976dZbq1+8z4Z9ZfaOrU5CwRYW6Y0x8C1gLw4Wou+QT4MU/szYo2WT
 4Vtl66SEGapUzYSrBhN35ilWNFyUrFYYUHLrK1YAd7EMJP7tk9LazG4vg8aBUOoHOIg0dYmkbaWt
 B//3HxX469PmAp7bdKXNsfkin02icxGi0NT/ySA2P9LOEHSaPl0HA71DCw+wVj/bq6RhP5408HkN
 tPkIUnbs6Y3uyYEPvceq0gs9MGbx+vgcaeehpLPTfz0i6fyfJy67TAEex0FX1KVvjiAzewc8uztW
 HbvGV4h90ENMNrgHgW/jmVIyZcKmOSCalS1KNQTT90g10AIKgPILhom8RqD8cJM99rB3Vrh80bRo
 UaZFxe2IlZWf4BoWhNic8SFxEwZntV7GZMQncsSbz83XAZW6vtkd71rCHXOzzCmL24kTfcG7eTC4
 PKl29XLCBgf81ERGjSss78Gtl31WN60s2tRNNv+9Hfzbmng5ef8Pa+ZpqhUkV66l3uRxSJY+6g7j
 IBJmdDYjWasW6LbzngAnBib234Tr5S+0cOWOBB7R9dmy6rxgPSLaeRoNsU2ARay2DG9CrxDtIynt
 8YIPRhrjYJz5zez1snIO+Oxm9+3tlnLuSkKnXswad8cOm6gf3woJvsNXC0HFu+r2RSJlfJaGEy/Z
 EJ1LOi2wJmFlzSj4s3ETCPDDDZBbXHcf23zBoSRb+Moftn386HhN26AXN1d++kHhgzZkgEXrgZ3d
 V1EHKU3BZj4yAD5vLus8dHJ4GkEmzgaMBK+fB1TZVmvdtnbxbAW12FMJXB25QV6JrBb5MtiSAkJ1
 kBuMO/nBcORzUtCWnlS/SOtofPEhJ6/5yXcJgXPn6Psd3OSmnB
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: francisco_flynn <francisco_flynn@foxmail.com>
To: Felix.Kuehling@amd.com
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 francisco_flynn <francisco_flynn@foxmail.com>
Subject: [PATCH] drm/amdkfd: register HMM dev memory to DMA-able range first
Date: Mon,  9 Jun 2025 17:36:23 +0800
X-OQ-MSGID: <20250609093623.964017-1-francisco_flynn@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Jun 2025 22:53:28 +0000
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

HMM device memory is allocated at the top of
iomem_resource, when iomem_resource is larger than
GPU device's dma mask, after devm_memremap_pages,
max_pfn will also be update and exceed device's
dma mask, when there are multiple card on system
need to be init, ttm_device_init would be called
with use_dma32=true, and this is not necessary at
all. let's request dev memory region at DMA-able
range first.

Signed-off-by: francisco_flynn <francisco_flynn@foxmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
index 79251f22b702..3856b9fd2a70 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
@@ -1020,6 +1020,7 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 	struct amdgpu_kfd_dev *kfddev = &adev->kfd;
 	struct dev_pagemap *pgmap;
 	struct resource *res = NULL;
+	struct resource temp_res = iomem_resource;
 	unsigned long size;
 	void *r;
 
@@ -1042,7 +1043,10 @@ int kgd2kfd_init_zone_device(struct amdgpu_device *adev)
 		pgmap->range.end = adev->gmc.aper_base + adev->gmc.aper_size - 1;
 		pgmap->type = MEMORY_DEVICE_COHERENT;
 	} else {
-		res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
+		temp_res.end = dma_get_mask(adev->dev);
+		res = devm_request_free_mem_region(adev->dev, &temp_res, size);
+		if (IS_ERR(res))
+			res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
 		if (IS_ERR(res))
 			return PTR_ERR(res);
 		pgmap->range.start = res->start;
-- 
2.25.1

