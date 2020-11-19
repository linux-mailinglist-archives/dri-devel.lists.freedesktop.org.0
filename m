Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863B82B8946
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 02:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2720E89FD1;
	Thu, 19 Nov 2020 01:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876FA89FCA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:08:14 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id v12so2795591pfm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 17:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aXyaxqpuXOCrWcF5Z4oG3lL2Xp82TSlm8ifpPTO/aow=;
 b=S91Naq5c2eriZiWSnHIiwuQ2qkFI0P0kqZIAyFYD91vrzhZJYkkGOiaxkKLHpI8L7j
 LXzhYLj/xKXLV+eCuuaw6Uc87rhuuIEgg5ecBx+xzpBEZhGFVoxz0liqcg+LALJB6Rli
 eVeX6bRFotSFTF+KkzMZMOd8iwkTkg2UYyk8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXyaxqpuXOCrWcF5Z4oG3lL2Xp82TSlm8ifpPTO/aow=;
 b=gqh00RrvdfxviM+gxreHiwuRCoqlUI0IOmyh0y84YFsAwosH/yFfl5/g0FlCoVIhvH
 /J8TjioG5ZCXJwmw14vzBorxB7XhfC1FHCFXsGtHX3CW7jVgRmaqGEAcrmpcC+RaVpi8
 h9oby3Wi1Et30eBvjJ6Id6gscALBvYLMR54vZHWcV/j9Awi4oRlb7cfEM2VEz+0RC9t4
 6LnDDNyOW8UM/P4uXO+p8heL+s6r2N9LLjjbsqV6V1bv3sM5vm4vzqgs+2CsKDaQBTp4
 IgJHRBB0i4kPpbv1CLho4P+Sp7sF64sfcfTU4vFkWfPEX8DC3VrTcUT4H6JSAHmQ3XzU
 jA9A==
X-Gm-Message-State: AOAM531+iUrlPIaRt1w1Yhbb/RGPJEeG8zDFc41dGLnTaWVlwsslacXx
 AJqXx7wrKGnMJYe0Ee3B8MLHKpYPOC7qTw==
X-Google-Smtp-Source: ABdhPJyYySS3j25q047oIkT28lbxFl+anJQyA9gKhPdHcAqXflWu+WJsPT+XSJ130LL8t9sUxwWkcA==
X-Received: by 2002:a63:1514:: with SMTP id v20mr11088613pgl.203.1605748093896; 
 Wed, 18 Nov 2020 17:08:13 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m8sm24188574pgg.1.2020.11.18.17.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 17:08:13 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/virtio: fix a file name comment reference
Date: Wed, 18 Nov 2020 17:08:06 -0800
Message-Id: <20201119010809.528-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119010809.528-1-gurchetansingh@chromium.org>
References: <20201119010809.528-1-gurchetansingh@chromium.org>
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

From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

Easier to find where declarations are implemented.

Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 3c0e17212c33..c94052376d18 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -257,7 +257,7 @@ struct virtio_gpu_fpriv {
 	struct mutex context_lock;
 };
 
-/* virtio_ioctl.c */
+/* virtgpu_ioctl.c */
 #define DRM_VIRTIO_NUM_IOCTLS 11
 extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
-- 
2.29.2.299.gdc1121823c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
