Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8BF244312
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86A96E2C7;
	Fri, 14 Aug 2020 02:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A970F6E162
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:04 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id i92so5032135pje.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2R7vh9cYX9MFjLZnfWvIahUr4mvJTxs481h7pc0DZn8=;
 b=ACaAoMLA2Xh9/1m3vB85iVuwUlbXrnmLKUTh5weMOoY8lqF2h8xBh2MaHtAO4dH2fh
 u7qNCWs2tZlV2LUtBmA++DzvspZzRODeAk5yS/5+Kz98QrY24AtDfsvL2wgT1a1YNuCS
 /LU+7RIh9aDnrMtTpq1qrxUYVq4Baj2DEocCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2R7vh9cYX9MFjLZnfWvIahUr4mvJTxs481h7pc0DZn8=;
 b=Slz6LhlJygFp8Qi/eLx5zJZQwmD3wanz/P62Y48iWWSnDFrxODAvtAK7BYr3cZjlVq
 gp9ZPg/+s6CWbwu7qDmhKlDZuzGxJBZuB8uPhSVmEneVcOZupNUiga7CmMiXulVvGgcF
 1bGkApaVPx2/VqAWPADPJV7NTWzS/fWB8Eu0ftZy0ejl94l3551DNf6efTWKkj8zncVY
 exZIzX/KytCpoNXEAzE4T7sdFTJ9HYOdg06fzbijXrHRRkv/GCe96d5dRbk45t1dSpp1
 h+N3W4EIL31VuUkf8j5xAP7v5MydT8K/ECPXrdKKFim+csvXb1ZDs1oQkjoGs1r8gyts
 6TFw==
X-Gm-Message-State: AOAM531tKlZTivA5Bsndsgh3LG0JxqkaMC3q8xKzJZ32K6G4QXPmS+L7
 ZwfUE9fpxNo+ncRLzIdUXk2VO2qK9IOy+A==
X-Google-Smtp-Source: ABdhPJwTthZu3Peu/7IgjxISNpGvoSy+XgYTbfn1158BAyrNLW4ReEn9wMQVkfg1FmscOZJOg2mJIw==
X-Received: by 2002:a17:90a:6f61:: with SMTP id
 d88mr497105pjk.219.1597372803976; 
 Thu, 13 Aug 2020 19:40:03 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:03 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 01/24] drm/virtio: Revert "drm/virtio: Call the right shmem
 helpers"
Date: Thu, 13 Aug 2020 19:39:37 -0700
Message-Id: <20200814024000.2485-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit d323bb44e4d23802eb25d13de1f93f2335bd60d0.

Fixes a double-free regression:

[    4.357928]  drm_gem_shmem_free_object+0xb4/0x100
[    4.358983]  virtio_gpu_dequeue_ctrl_func+0xd9/0x290
[    4.360343]  process_one_work+0x1d2/0x3a0
[    4.361581]  worker_thread+0x45/0x3c0
[    4.362645]  kthread+0xf6/0x130
[    4.363543]  ? process_one_work+0x3a0/0x3a0
[    4.364770]  ? kthread_park+0x80/0x80
[    4.365799]  ret_from_fork+0x35/0x40
[    4.367103] Modules linked in:
[    4.367958] CR2: 0000000000000018
[    4.368857] ---[ end trace db84f7a2974d5c79 ]---
[    4.370118] RIP: 0010:dma_direct_unmap_sg+0x1f/0x60

In addition, virtio has it's own set of dma-ops so there's not an
obviously clean way to transition to shmem helpers.

Fixes: d323bb44e4d2 ("drm/virtio: Call the right shmem helpers")
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 346cef5ce251..1359eb8f1a02 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -150,7 +150,13 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	if (ret < 0)
 		return -EINVAL;
 
-	shmem->pages = drm_gem_shmem_get_pages_sgt(&bo->base.base);
+	/*
+	 * virtio_gpu uses drm_gem_shmem_get_sg_table instead of
+	 * drm_gem_shmem_get_pages_sgt because virtio has it's own set of
+	 * dma-ops. This is discouraged for other drivers, but should be fine
+	 * since virtio_gpu doesn't support dma-buf import from other devices.
+	 */
+	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
 	if (!shmem->pages) {
 		drm_gem_shmem_unpin(&bo->base.base);
 		return -EINVAL;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
