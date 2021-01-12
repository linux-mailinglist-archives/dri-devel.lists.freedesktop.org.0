Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB742F2A56
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5646E14B;
	Tue, 12 Jan 2021 08:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E92A6E14B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:50:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t30so1601916wrb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Xpz8sj4WOd/W/CFyAWWf6Xd+ry7M8WVYVN2610D0eIk=;
 b=Ptm6VXhCA6mFfP99YPGMDcHCbUi21z8PYR35bDn9g5oi1ByAahcNcAzP/m/wv5wjBK
 pZw7mfIZWqlGkgi2lzUmzaB7mn8eq7IvB3W/lUZrHFqBr56Fa8Y356R7fPDafVMT10on
 ZkCVfs6bjfQM6qJEZRLBPHyA7BlSh7gI1qgwgXG0mX2WPI38IOu5H5lpafJwTr3Xi1Bk
 s1rwiEYbA5OARE8/rW8Nf0esCXCRBbt5+SUd/R6N7sjv7p1KbJk/UQMcwcHazlnP/RyB
 lm1C+OgG3h0g6cRp5oPfEICcl+TtdtwBrrZvchkxbeJwGY8tdKL5k4T42F6WuB96vS1H
 wlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Xpz8sj4WOd/W/CFyAWWf6Xd+ry7M8WVYVN2610D0eIk=;
 b=jW/Yxm7oGiW4oLasSpDiSZ4mzZDaYzoA+qvQoZVXn6nRSofPyi0WuKYVHr8FIHofad
 mnlnDQwhi5TAfCh2Z53hQFFlWwLKLAE5yEiLA0FuQ1YKbJqeP6n0EliM48cew9JlwYb/
 7nQ6sTj0dbVt0p87xWZ3hvUQd4dzmACFL2ewUWz3XotcEuMB4g0t1wa9dfHvowtSrb+h
 vunKiWdqSJeDG4wsCs2DSLIvNL1JuorY7MVW/nj4RId1luU0q1HtLN3faE/7WxMem0gw
 91Gqnphs7LM4lgUfSBU7uKz2Qmd+U6aPZqKCACKgfXJqqy3ExJyeh101iEPgm2cKkZKP
 kHKQ==
X-Gm-Message-State: AOAM531inGtaH4vXae6vHQqZQfTdwshEEbfBtl6uaeY3NA7m3wrLztEC
 8rwO7fmWwQ7n1JM57kKkZ3UYL25ZHOM=
X-Google-Smtp-Source: ABdhPJxveptv45kLQOxPKcEOL7pIq5aZ0wi8LNSbyW7kHFKiHlI4TiUxRiByPjDvcyvh3UqGhjWtkQ==
X-Received: by 2002:adf:a543:: with SMTP id j3mr2965603wrb.175.1610441457885; 
 Tue, 12 Jan 2021 00:50:57 -0800 (PST)
Received: from gmail.com ([2a01:e35:2fb2:a0d0:3697:f6ff:fe76:2bcd])
 by smtp.gmail.com with ESMTPSA id o3sm3498051wrc.93.2021.01.12.00.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:50:57 -0800 (PST)
Date: Tue, 12 Jan 2021 09:50:52 +0100
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: make sure context is created in gem open
Message-ID: <20210112085052.GA59439@gmail.com>
References: <20210107210726.269584-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107210726.269584-1-olvaffe@gmail.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 07, 2021 at 01:07:26PM -0800, Chia-I Wu wrote:
>The context might still be missing when DRM_IOCTL_PRIME_FD_TO_HANDLE is
>the first ioctl on the drm_file.
>
>Fixes: 72b48ae800da ("drm/virtio: enqueue virtio_gpu_create_context after the first 3D ioctl")
>Cc: Gurchetan Singh <gurchetansingh@chromium.org>
>Cc: Gerd Hoffmann <kraxel@redhat.com>
>Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

>---
> drivers/gpu/drm/virtio/virtgpu_gem.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
>index c30c75ee83fc..8502400b2f9c 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_gem.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
>@@ -39,9 +39,6 @@ static int virtio_gpu_gem_create(struct drm_file *file,
> 	int ret;
> 	u32 handle;
>
>-	if (vgdev->has_virgl_3d)
>-		virtio_gpu_create_context(dev, file);
>-
> 	ret = virtio_gpu_object_create(vgdev, params, &obj, NULL);
> 	if (ret < 0)
> 		return ret;
>@@ -119,6 +116,11 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
> 	if (!vgdev->has_virgl_3d)
> 		goto out_notify;
>
>+	/* the context might still be missing when the first ioctl is
>+	 * DRM_IOCTL_MODE_CREATE_DUMB or DRM_IOCTL_PRIME_FD_TO_HANDLE
>+	 */
>+	virtio_gpu_create_context(obj->dev, file);
>+
> 	objs = virtio_gpu_array_alloc(1);
> 	if (!objs)
> 		return -ENOMEM;
>-- 
>2.29.2.729.g45daf8777d-goog
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
