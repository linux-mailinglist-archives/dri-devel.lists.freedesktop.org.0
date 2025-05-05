Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B84AA8EB2
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE72910E30F;
	Mon,  5 May 2025 09:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y19vJ3Rc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9064410E30F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 09:00:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so35318045e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 02:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746435599; x=1747040399; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ran6W4sJDMQBCxVZgAL/1b0rzUGuXX9AnOQzXDraEE8=;
 b=y19vJ3Rcl0NQH+bIjRV2s77Zt/xuw/SGqeAYqVlKS9x8817A5V84x+TV6qLpNv8xBc
 68fWpHBI3O2AL9x8mKu+hNwD08JfnCprZFUl5+XcdMjJS6IQWsstxlP5ZT4dUAFSiGPa
 4BdQGNJqFOa8yiFXm1Zn0Jp8JCwWFq32ItYcjwc2bUZ37HTf8TJT7w2Xe14A37DsmfB2
 D4d3f/DNSEdt40gZ2+rp4bJ9XO2ra4ACc9UCl6mZoGzpeJTYj/FhYSWK+Pv/1evISk6Y
 JvDRj4dSuUDocVz/hhmMoGZwMFFQTXKUCCRmkPNebaxwFynru+1mQXwUEmKuWlCMCFTI
 GKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746435599; x=1747040399;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ran6W4sJDMQBCxVZgAL/1b0rzUGuXX9AnOQzXDraEE8=;
 b=fbI6QOq8S+VY0+OpxhoONiVL5i0wjckbkDlcBb+ivOYsFM3SA7StrbNFHhzONUvsCh
 BGGsd/opf0vnNzZ9SASvnoPSdfq2zuoZJ0D6/t9C8jSFUitGUbLMzQGkuU1Nwqm7ymhl
 SF5mgB0pyomVRmWw+l1r3kGcVG/UP39dF2ch/k3I9SeFIb4Q7MVbvysNXulXK8BD3PtC
 BblaGi3Eps+hFOy15hNeExqansdFtJX58023FX/hCeqUexYIpvnSHDckw28LERktT4JU
 QFDo81Lo+guk/aEvb6LKKh5ovLSCEOhKjCkGPpTn1XBla2k3ocwO9obEKQ6qYVG1ckRP
 IO+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYZoKnCvdQmzcUXw5Dtt1diybv3cKGhiLKPcR6L8JOKZE++IdhO5OZALQGmTkETdoqlDGW/8j5jJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwE9WiK6IO5b8V7oDIea5r9GPjD5HlqAiznJybVqWdbLYSe9aP
 p39fpn0TlplnnTrT8zbSRYlrOjKGcc+BHSv/QMo3psxU8lKF6bboQl24Lx2G6qE=
X-Gm-Gg: ASbGncvBzdmJaSBoTNM0bll+Gll6EPpiq5chDG6X55nGb10zNZU0HtHbEqZ5nTDz0Eh
 5KcTaqMSzBtdzmYV3nn+6u8U6W+MBj712zLZWniXwrpEoJayzXKaY3foc/ms9qiJVzQvPO8vWoZ
 kDWJLVhGiKuXM9EL1Zqk8g7JE3v5T0yYdqqqTeK945vWfkcit8DO279ZWOz1GC4+9s9C4uDYqmj
 say/GxS0cm7wntmyO4rASDsWLn73fEXyFZd/70ZBarty5w6PDuRoIGJtOyqulybqjL8FYciHX5H
 oD5l0kO11aydVmHOb3eeLnOZT/JpsXgRlUpqcL5Oxqkimphi+bJLJ+VsLq0H03W8NTvXXHvaoBe
 hB6AB
X-Google-Smtp-Source: AGHT+IHu1aFkaGJDMuAfmjtWFpiOlbSYtoQaF7Z8xjJBAeiyk95dcMoYAZNA/8ikLK7E9LhC6iGaVw==
X-Received: by 2002:a05:600c:698c:b0:439:8878:5029 with SMTP id
 5b1f17b1804b1-441bb8483d2mr99825685e9.2.1746435599128; 
 Mon, 05 May 2025 01:59:59 -0700 (PDT)
Received: from [127.0.1.1] (adsl-186.37.6.163.tellas.gr. [37.6.163.186])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2b28045sm170432475e9.35.2025.05.05.01.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 01:59:58 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 05 May 2025 11:59:14 +0300
Subject: [PATCH 1/3] virtgpu: add virtio_gpu_queue_cleanup()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-virtgpu-queue-cleanup-v1-v1-1-810923da2b1e@linaro.org>
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
In-Reply-To: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>
Cc: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6535;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=OYk5xWoiYBD7378UCy/vdTy18gxwYbd0oasIs8ZX39M=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9HSDRMQVdPRnJuMjFRazVtV01uOEp3ZVUrVG5jClZhdDFDV0dpTFlZdFBLK3BT
 ZnFKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUJoK0N3QUt
 DUkIzS2Nkd2YzNEowSlBrRC8wVkNaa0JaV0dDNVhEV2dlSi9EMitpaEdaTWJNR2FiOVBjenE0cA
 o4eUd3VCtGcFVyY3hYU0R5d055MlFoazFKNmhFaHlnM3ZhMFBHelU2OVQ5NXRJM3ZWNHZBelRzb
 lhhSFdJSmpwCndaQlhqNjlJQzFpTFBrM3IrZkhpaWVPakU0UHZxOUpIZDcvY3pmSVhLRWlBNXNJ
 bW1DYTRkZHI0YTFBb2JOR3cKaXhDbDlPb2lFb0Z5aGJrQzJWUDVWV0R3T2REeDk2LzkzeUxmVkx
 HL2h0NWxrOUN6Y09zMUNycmRMbyt6cE9rNQptMXBOVGxBNis0WDF2UjJlWnZRclVRdStmN2ZGQl
 QySmhEeXh3WjhYZXoxelNSSG4zSGZGVjFzVXNDSUZhK0hsCkhKWTJSemlVYTdLUUoxQm9wRFg5Q
 TNKWEVHNXQ5K09vMzlZRkQ4c0J6UmgyRTAySUxSZkVhaUV5MDdqbEtKaXEKMEs1b1JhcHdneTZu
 MWIzQjJ6WmpUbjVNcVFjUUVGTSt1dGVnbUpJM2tYMjNBMnB2a3l3c0c0L0pWRnZUeENBMApQbzA
 rOGNZRzU5NklENVdUN2U1czVCcHhUK2lMV2hMMzJZNXpWNDhiN3UvU3dHWmxsbFd2a25LUVZyZE
 szZXMyClM1b2RSbnhwMjlLN1oxMEJSS3BFSzZ2NExrWGR4NHZ2VHRtMThkRUhKamYxdklhSy92K
 1E2eFdwU2duRGpOMzUKMkR2bUdWeWRPWjNYZW54dzd6UElVTCtpdEdOQkVqdnZ3M0sza2FmaDBW
 NVJzd1RJZ2UzcUVHVmg3Y2o2MXZUYQpOL3R6L04yd0QvRTJ2SUpnK3p5MHpodG0rTXc1RTJUNys
 rNlpQK1B4REFlb3JIQ1Q5Qkt2VnM0U0NJT0J2dW1yCkl0RzcwUT09Cj04Nkx6Ci0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
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

When virtio_gpu_remove() is called, the queues are flushed and used
buffers from the virtqueues are freed. However, the VIRTIO device might
have left unused buffers in the avail rings, resulting in memory leaks.
KASAN, slab debug and drm_mm_takedown all report the errors:

 BUG virtio-gpu-vbufs: Objects remaining in virtio-gpu-vbufs on
 __kmem_cache_shutdown()
 <- Snipped backtrace ->
 Object 0xffffff801b07c008 @offset=8
 Allocated in virtio_gpu_get_vbuf.isra.0+0x38/0xb0 age=4314 cpu=3
 pid=540
  kmem_cache_alloc+0x330/0x3a8
  virtio_gpu_get_vbuf.isra.0+0x38/0xb0
  virtio_gpu_cmd_resource_create_3d+0x60/0x1f0
  virtio_gpu_object_create+0x388/0x468
  virtio_gpu_resource_create_ioctl+0x1f0/0x420
  drm_ioctl_kernel+0x170/0x248
  drm_ioctl+0x33c/0x680
  __arm64_sys_ioctl+0xdc/0x128
  invoke_syscall+0x84/0x1c8
  el0_svc_common.constprop.0+0x11c/0x150
  do_el0_svc+0x38/0x50
  el0_svc+0x38/0x70
  el0t_64_sync_handler+0x120/0x130
  el0t_64_sync+0x190/0x198

 ------------[ cut here ]------------
 kmem_cache_destroy virtio-gpu-vbufs: Slab cache still has objects when
 called from virtio_gpu_free_vbufs+0x48/0x70
 WARNING: CPU: 0 PID: 483 at mm/slab_common.c:498
 kmem_cache_destroy+0x114/0x178
 <- Snipped info ->

 ------------[ cut here ]------------
 Memory manager not clean during takedown.
 <- Snipped info ->
 ---[ end trace 0000000000000000 ]---
 [drm:drm_mm_takedown] *ERROR* node [001000eb + 00000080]: inserted at
  drm_mm_insert_node_in_range+0x48c/0x6a8
  drm_vma_offset_add+0x84/0xb0
  drm_gem_create_mmap_offset+0x50/0x70
  __drm_gem_shmem_create+0x94/0x1d8
  drm_gem_shmem_create+0x1c/0x30
  virtio_gpu_object_create+0x68/0x468
  virtio_gpu_resource_create_ioctl+0x1f0/0x420
  drm_ioctl_kernel+0x170/0x248
  drm_ioctl+0x33c/0x680
  __arm64_sys_ioctl+0xdc/0x128
  invoke_syscall+0x84/0x1c8
  el0_svc_common.constprop.0+0x11c/0x150
  do_el0_svc+0x38/0x50
  el0_svc+0x38/0x70
  el0t_64_sync_handler+0x120/0x130
  el0t_64_sync+0x190/0x198
 [drm:drm_mm_takedown] *ERROR* node [0010016b + 000000eb]: inserted at
 <- Snipped info ->

The leaked objects are also reported in /sys/kernel/debug/kmemleak.

This commit adds a cleanup function that is called from
virtio_gpu_deinit().

The function cleans up any unused buffers from the virtqueues and calls
the appropriate freeing functions. This is safe to do so because
virtio_gpu_deinit() calls virtio_reset_device() before calling the
cleanup function, ensuring no one is going to read from the virtqueues.

The cleanup function checks for used buffers on the queues, and
additionally calls virtqueue_detach_unused_buf on each queue to get any
buffers that did not have time to be processed by the VIRTIO backend.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h |  1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c |  1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 55 ++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index f17660a71a3e7a22b5d4fefa6b754c227a294037..b3d367be6f204dbc98bf1c6e5c43a37ac8c0d8b3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -419,6 +419,7 @@ void virtio_gpu_cursor_ack(struct virtqueue *vq);
 void virtio_gpu_dequeue_ctrl_func(struct work_struct *work);
 void virtio_gpu_dequeue_cursor_func(struct work_struct *work);
 void virtio_gpu_panic_notify(struct virtio_gpu_device *vgdev);
+void virtio_gpu_queue_cleanup(struct virtio_gpu_device *vgdev);
 void virtio_gpu_notify(struct virtio_gpu_device *vgdev);
 
 int
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 7dfb2006c561ca13b15d979ddb8bf2d753e35dad..da70d9248072b64786a5d48b71bccaa80b8aae8f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -286,6 +286,7 @@ void virtio_gpu_deinit(struct drm_device *dev)
 	flush_work(&vgdev->cursorq.dequeue_work);
 	flush_work(&vgdev->config_changed_work);
 	virtio_reset_device(vgdev->vdev);
+	virtio_gpu_queue_cleanup(vgdev);
 	vgdev->vdev->config->del_vqs(vgdev->vdev);
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 55a15e247dd1ad53a2b43b19fca8879b956f0e1a..fd150827e413cedcec4d82b0da8d792cb67e243f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -299,6 +299,61 @@ void virtio_gpu_dequeue_cursor_func(struct work_struct *work)
 	wake_up(&vgdev->cursorq.ack_queue);
 }
 
+/* deallocate all in-flight virtqueue elements */
+void virtio_gpu_queue_cleanup(struct virtio_gpu_device *vgdev)
+{
+	struct list_head reclaim_list;
+	struct virtio_gpu_vbuffer *entry, *tmp;
+
+	INIT_LIST_HEAD(&reclaim_list);
+	spin_lock(&vgdev->ctrlq.qlock);
+	do {
+		virtqueue_disable_cb(vgdev->ctrlq.vq);
+		reclaim_vbufs(vgdev->ctrlq.vq, &reclaim_list);
+	} while (!virtqueue_enable_cb(vgdev->ctrlq.vq));
+	/* detach unused buffers */
+	while ((entry = virtqueue_detach_unused_buf(vgdev->ctrlq.vq)) != NULL) {
+		if (entry->resp_cb)
+			entry->resp_cb(vgdev, entry);
+		if (entry->objs)
+			virtio_gpu_array_put_free(entry->objs);
+		free_vbuf(vgdev, entry);
+	}
+	spin_unlock(&vgdev->ctrlq.qlock);
+
+	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
+		if (entry->resp_cb)
+			entry->resp_cb(vgdev, entry);
+		if (entry->objs)
+			virtio_gpu_array_put_free(entry->objs);
+		list_del(&entry->list);
+		free_vbuf(vgdev, entry);
+	}
+
+	spin_lock(&vgdev->cursorq.qlock);
+	do {
+		virtqueue_disable_cb(vgdev->cursorq.vq);
+		reclaim_vbufs(vgdev->cursorq.vq, &reclaim_list);
+	} while (!virtqueue_enable_cb(vgdev->cursorq.vq));
+	spin_unlock(&vgdev->cursorq.qlock);
+	while ((entry = virtqueue_detach_unused_buf(vgdev->cursorq.vq)) != NULL) {
+		if (entry->resp_cb)
+			entry->resp_cb(vgdev, entry);
+		if (entry->objs)
+			virtio_gpu_array_put_free(entry->objs);
+		free_vbuf(vgdev, entry);
+	}
+
+	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
+		if (entry->resp_cb)
+			entry->resp_cb(vgdev, entry);
+		if (entry->objs)
+			virtio_gpu_array_put_free(entry->objs);
+		list_del(&entry->list);
+		free_vbuf(vgdev, entry);
+	}
+}
+
 /* Create sg_table from a vmalloc'd buffer. */
 static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
 {

-- 
2.47.2

