Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03E81FA3D6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 01:05:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107696E542;
	Mon, 15 Jun 2020 23:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FA16E550
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 23:05:03 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id m2so601084pjv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+9ERbJjBaYxuvioF3+ainKkICtpbZdlxe6xKJ6ztwi0=;
 b=TVIZHC57TvWVbGpiIT7z1f69iOsI+fTtQfyHOX03OqQAuiXP0mQNmlALKbqH89qmq3
 AA3jmkNYZ59LfJgOiF/RAfo+bfk7LHla7JerMqAgbgZJ7hHvpDYmi2zbmVmwtTNzFpki
 xJZHDHIxtU8LYTqeHDlLhmlTNW6yQ9jVWOYfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+9ERbJjBaYxuvioF3+ainKkICtpbZdlxe6xKJ6ztwi0=;
 b=fEGrAdFg1NKX8KUBtUveIzenczN4Sjiu+wCMsVVfh3QwIeNqtwVV8qJaen5JzQX+Tz
 e8XhZSqr4CZF1MSPSIGe3z5Cvh8Uz5kSVd8T37aMogpHyoyMkmihX2MHQhAQxR4G+k0z
 bXJibH0e/2oA6RXDlFw2fOfaVBU8rXRUmvOBD7EYIHxtqV57+v9SmSvHUTl3oF0LngSk
 3XKGNhi7bFPqjMkIK4FYaiBTVSjBEOaLUDUIRJyzP5ab6+PlBJDB9OFMr4yrZ1rRByIa
 oNUidAvrKsijuhouyjiWDJ9PdCsZRPyJXIZwlgRLfMttt1plAZ/RalEM7Gm6YqKRLuvU
 cpcA==
X-Gm-Message-State: AOAM5300aYYkxvEe2SWLXDXg4XzPeLQ7VpXYcKvRsCg1+cbbcYfIEOxw
 flIlgfbcPFc3V6WaBQVWxrSzJhr8pk4=
X-Google-Smtp-Source: ABdhPJyeyEG/Z55/fT1S4mWTmA6dhMCbNbzzkwIfPc3uLLkXhGSYuU4EjeCrIpEfgoj4ISXC/VfNqA==
X-Received: by 2002:a17:90a:9f81:: with SMTP id
 o1mr1484595pjp.139.1592262302917; 
 Mon, 15 Jun 2020 16:05:02 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w24sm14777156pfn.11.2020.06.15.16.05.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 15 Jun 2020 16:05:02 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/virtio: Revert "drm/virtio: Call the right shmem helpers"
Date: Mon, 15 Jun 2020 16:05:00 -0700
Message-Id: <20200615230500.551-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
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
Cc: kraxel@redhat.com
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
