Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CD5104CA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4773510E67D;
	Tue, 26 Apr 2022 17:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9298F10E67D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:00:48 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 m22-20020a05600c3b1600b00393ed50777aso1977934wms.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRXpIchH9YdU1da8XhTk+Hd+H0itPA9JgyDMdUY39zI=;
 b=ICCfinvqRuhEMo1acsCySqoZ+mt2J78Zb9sjoGr7/JCExf7fi9cFYhJj50I2iwgWFa
 3+XLYBGwijNpxZSCtt1FSMsoc+uM8RROF4ZTNspD5K2TQuDQ8EQrvGHARKVo8PDgoSos
 66tozFAwCRKLgb2/kkhN/LXBp1BON5nf+4fwvc9UIngYuoD/iC5i7tOaoi92qqqJfiHv
 UwrJCa6vE9HDxhZ7P/b0MdLJwEBhSrndqGgLp0c95U04+0NAt2hrrHfPrXkVEOJSNuw9
 uGJ6yLQpqnugEge67ohBY2B4UBq9YQs5gS7XKCwSAKucheI5sk6nKI2hSaFnDaaThY2D
 BRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VRXpIchH9YdU1da8XhTk+Hd+H0itPA9JgyDMdUY39zI=;
 b=ysYwaGBafaGiWgNRvQP98HthDaOd/xV2woofCNazXjmFFf93qED3HEw0Vsgu9LDxyl
 Cg/lBMTBue1CbtmYnffYgRrswcFqBxYgDQkvmvW9iJ5YMr1ajP5TlkSUizU2EQgX0hws
 vB8lpp/bkD8Dqp0XwFBjfoWsf+JwEc1NK0icO8ZOxszUXdcvaEC0UZkjtcz5DC0VOmbj
 IS5VCKPXP74jl5iAohAKd1L7YjfPmxiL9/JhJlgI1yUxyXT33jBXHwpqHsEJyC0Wx/kV
 tkXAEA84XFzWavXYqUF/sStXBkchFUBsliPupCvme5l1D1tMW2ZADEZIUGIymWRF1iPC
 rhMQ==
X-Gm-Message-State: AOAM531Ylelsqr69TxpQgfL7x2XUtmO6Q+pHI+uFXcfLIQLL10CUowIM
 4Qeo7vKbVSMK0YR7ZUeybT0=
X-Google-Smtp-Source: ABdhPJwrVU+Hbo3q1YlzZcaTM3Yc9CkRjM+fZxbLxmsyCZjWxmYNt4TxRPNfn9p+uDRKyiOVUe7w6w==
X-Received: by 2002:a05:600c:4e01:b0:392:aa5d:6093 with SMTP id
 b1-20020a05600c4e0100b00392aa5d6093mr31183928wmq.114.1650992447065; 
 Tue, 26 Apr 2022 10:00:47 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 o9-20020adf8b89000000b0020adeb916d8sm4685957wra.30.2022.04.26.10.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 10:00:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Subject: [PATCH] dma-buf: remove trace_dma_fence_emit
Date: Tue, 26 Apr 2022 19:00:44 +0200
Message-Id: <20220426170044.29454-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: gustavo@padovan.org, sumit.semwal@linaro.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There was never any significant difference between trace_dma_fence_emit()
and trace_dma_fence_init() and the only place where it would made a
significant difference was never implemented.

So remove trace_dma_fence_emit() since we have an repeating issue that
people are trying to use it for visualization and are surprised that
it actually doesn't work for most drivers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence.c             | 1 -
 drivers/gpu/drm/nouveau/nouveau_fence.c | 1 -
 drivers/gpu/drm/qxl/qxl_release.c       | 1 -
 drivers/gpu/drm/virtio/virtgpu_fence.c  | 2 --
 include/trace/events/dma_fence.h        | 7 -------
 5 files changed, 12 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index 066400ed8841..d0d704f3edae 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -20,7 +20,6 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/dma_fence.h>
 
-EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
 EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 7f01dcf81fab..abcac7db4347 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -224,7 +224,6 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 			       &fctx->lock, fctx->context, ++fctx->sequence);
 	kref_get(&fctx->fence_ref);
 
-	trace_dma_fence_emit(&fence->base);
 	ret = fctx->emit(fence);
 	if (!ret) {
 		dma_fence_get(&fence->base);
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..cb9f27771f32 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -424,7 +424,6 @@ void qxl_release_fence_buffer_objects(struct qxl_release *release)
 	 */
 	dma_fence_init(&release->base, &qxl_fence_ops, &qdev->release_lock,
 		       release->id | 0xf0000000, release->base.seqno);
-	trace_dma_fence_emit(&release->base);
 
 	list_for_each_entry(entry, &release->bos, head) {
 		bo = entry->bo;
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index f28357dbde35..e8b6dec37977 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -111,8 +111,6 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 	list_add_tail(&fence->node, &drv->fences);
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
 
-	trace_dma_fence_emit(&fence->f);
-
 	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
 	cmd_hdr->fence_id = cpu_to_le64(fence->fence_id);
 
diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
index 3963e79ca7b4..eb744a6aca49 100644
--- a/include/trace/events/dma_fence.h
+++ b/include/trace/events/dma_fence.h
@@ -34,13 +34,6 @@ DECLARE_EVENT_CLASS(dma_fence,
 		  __entry->seqno)
 );
 
-DEFINE_EVENT(dma_fence, dma_fence_emit,
-
-	TP_PROTO(struct dma_fence *fence),
-
-	TP_ARGS(fence)
-);
-
 DEFINE_EVENT(dma_fence, dma_fence_init,
 
 	TP_PROTO(struct dma_fence *fence),
-- 
2.25.1

