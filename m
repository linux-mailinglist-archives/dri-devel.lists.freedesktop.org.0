Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C73D85141EB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 07:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E3210FB2A;
	Fri, 29 Apr 2022 05:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A7110FB2A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 05:49:18 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id f14so5049892qtq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zlsCs+x0DoSzsNw/NRm1xCc/AUcSv2O7P/MFQ0HV3jM=;
 b=WPvzeyMCxQq+nyaYg6JoXj2g141ThYO8ykqXrGAh6WJbIeGAdJlGjxTttbNhJ5Ci/5
 hUMIkDwQ6IVgwgwt48IoAIvKUoEHt/hPKZim6SnYZdJSaEN9/7WhgeGdrHTcHYrMU3pN
 oXj18MJ95T3QHg3PHaO/tm8rBt6eqKEkmSwhq/F+inkgqVLD3KM/4gU/eBvjjbJbP4pV
 /HftgeXlypiOi2XPOEZm76QbRwJQH+H4f901hN83cHteRfoGGv8XE33nh6AwPXv9Y4J+
 0NTzEsV6Nd8KFi0FDJeGsuZbRL1tfOOi54+dBYir5WbPYCPGlIzveUs2t9djyHwfYbj0
 8SJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zlsCs+x0DoSzsNw/NRm1xCc/AUcSv2O7P/MFQ0HV3jM=;
 b=tkUYzg9Q89zG9aga+11sfW3HTMfRzYftR1fVV2o8EwHIz70dYZ7K8375E2u26hCUV5
 JwVRDQCTA4/r9z6tHJVgzymDQnhwIFPLNnkCQ7d/UqjX/59b5/U3hXL44TYQbB9PwJGR
 fibSI9loAQROfLRbw94FhHtU4TZwXLXAKwblnMbODjjEYAiEyHXrSDu87vaC4jVE/5Ob
 jYz9Ytnx4AJDYzdwZFs2Xw7DO8o4xQl0FzzOVhBrJ1vbvqEr+jzz/XhD6HQFDqWHNvLk
 94VCndy3e24Htn3NG/qBtWFqZPR5twdpd589NRph8OgtFZZRfNZdRW0KWlt/SRRKKhh7
 hFbw==
X-Gm-Message-State: AOAM533mmWlBG1bBp+BkOUArhBqTGJ833o7dwt9fo+rRCXqmgVCstpDo
 9YvoCQ3zc+Xlr8NpMmXLHXE=
X-Google-Smtp-Source: ABdhPJzmlNPH5wsdYHzUvy/XFcXzD0gwvs8dgEJ4del5pjnf1RgkLakypwFzuwMeEGO7YaBUniCMng==
X-Received: by 2002:ac8:5551:0:b0:2f1:ea20:40a with SMTP id
 o17-20020ac85551000000b002f1ea20040amr25493636qtr.139.1651211357222; 
 Thu, 28 Apr 2022 22:49:17 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a05622a170500b002f3818c7b92sm1136547qtk.49.2022.04.28.22.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 22:49:16 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: airlied@linux.ie
Subject: [PATCH] drm/virtio: simplify the return expression
Date: Fri, 29 Apr 2022 05:49:11 +0000
Message-Id: <20220429054911.3851977-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 virtualization@lists.linux-foundation.org, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 55d80b77d9b0..44425f20d91a 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -90,7 +90,6 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
 int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 				    struct virtio_gpu_object *bo)
 {
-	int ret;
 	struct virtio_gpu_object_array *objs;
 
 	objs = virtio_gpu_array_alloc(1);
@@ -98,11 +97,8 @@ int virtio_gpu_resource_assign_uuid(struct virtio_gpu_device *vgdev,
 		return -ENOMEM;
 
 	virtio_gpu_array_add_obj(objs, &bo->base.base);
-	ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, objs);
-	if (ret)
-		return ret;
 
-	return 0;
+	return virtio_gpu_cmd_resource_assign_uuid(vgdev, objs);
 }
 
 struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
-- 
2.25.1


