Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02062B8945
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 02:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4D289FCA;
	Thu, 19 Nov 2020 01:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7293F89FCA
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:08:13 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 62so2648656pgg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 17:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pTYuHQ3iIWCra003R2Aqiup8jYhFP+fKxLhQWTWFh1U=;
 b=Hy2clGNtH2ZCn3+ANSf9qi0Z+PyrTBSryZdL7Vhwru62yRoc8EHzXp9pROMzfdadH4
 ZCgppVT1D6Dv5wXJ4IgFBcOQzKRmmM8mSPP9mCrH+SB9ptCUS6ZWqZwAY7BPOJp45JIW
 +6eTxxWJV3NcTOC1Np2bbNbFGXCjQj7yQmNwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pTYuHQ3iIWCra003R2Aqiup8jYhFP+fKxLhQWTWFh1U=;
 b=UgpJnqRZBb2i265bV11bgfIeua03e3fsEGGIECIjLSJ3yI9INvn3APwXiw3JGAy0HU
 chLUExz3Ivy++WJjjErhnaFn0W98Ti+2M8BGEFCYSFMNJot3b6ptuwi0IPuu151hi8FQ
 K9yEPxpbd/rWrP+0B/fBmJKVzhbna5ltM/rRt8a5oKPHhuGteJqu2R/U+uWcs/DjO2Jl
 JKKd/R6gMqj7yFFYZ6Zxq5WtNtvCPX2wiQRbUd5EB/vhbOq7xBgSruWqf6wJXGDHy4kC
 X1oy1/+bXVdsnInuU4rttjpLGIrpcLCldIociKLX8m9ZNnn5jsFmsCDkBEYN7Q6NA0Jz
 H2Nw==
X-Gm-Message-State: AOAM5301QIOWxVadRqZ3TZaaJM8VWcqpZLn67NQrmj4IhR+j40e95w+y
 FmGlqiHrzUAGy9/JgHJh5iJju0BjNpTulA==
X-Google-Smtp-Source: ABdhPJylKuCNauCFz5izUTGz50jmK8H6K0cDsERs5PPovHhpJMCoAr3vGMx1Ke16wFDpTt25nSASzQ==
X-Received: by 2002:a63:f64c:: with SMTP id u12mr11273040pgj.325.1605748092776; 
 Wed, 18 Nov 2020 17:08:12 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m8sm24188574pgg.1.2020.11.18.17.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 17:08:12 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/virtio: suffix create blob call with _ioctl like any
 ioctl
Date: Wed, 18 Nov 2020 17:08:05 -0800
Message-Id: <20201119010809.528-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
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

For coherency, all ioctls are suffixed

Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 5417f365d1a3..23eb6d772e40 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -591,8 +591,9 @@ static int verify_blob(struct virtio_gpu_device *vgdev,
 	return 0;
 }
 
-static int virtio_gpu_resource_create_blob(struct drm_device *dev,
-					   void *data, struct drm_file *file)
+static int virtio_gpu_resource_create_blob_ioctl(struct drm_device *dev,
+						 void *data,
+						 struct drm_file *file)
 {
 	int ret = 0;
 	uint32_t handle = 0;
@@ -696,6 +697,6 @@ struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS] = {
 			  DRM_RENDER_ALLOW),
 
 	DRM_IOCTL_DEF_DRV(VIRTGPU_RESOURCE_CREATE_BLOB,
-			  virtio_gpu_resource_create_blob,
+			  virtio_gpu_resource_create_blob_ioctl,
 			  DRM_RENDER_ALLOW),
 };
-- 
2.29.2.299.gdc1121823c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
