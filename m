Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868B42BA5FB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 10:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE256E892;
	Fri, 20 Nov 2020 09:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A396E892
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:23:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so9264719wrg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 01:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q0kZ+rifawVw01qcjUSFKKAfQlftzHF+zmI0dR0Z9l0=;
 b=DrSO0f0yKvdHuwtPuuIu8P2QrwtxwYTeELg8rSO680ZpE5r8UQTmZ/eX7lCc5UzcYZ
 9uJjKcb7mACGX3EO7DCvHz0wOtB+rk6e19th7E+gQUs7mDpbLZRPmURipYz6Y3e+iURb
 6nG2pbN/UFD82FqL9W2miIhDVsmRl1FAfAcxBkIwKahs3+IuVadSQqKXjres1MeXtf/o
 OTIt0tmhpkq8XNKgRK1uyRoV9wxhjZsKS+no0d9FoQ5fsWDgbm1nhoOaN3RkSQaOdfTc
 AHbpcMx9GNdg4R9iiWZ0kiftFCwR0g34ME3+iBzYGOue5VAE9zygjjWAk/OofmDwELGW
 b5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q0kZ+rifawVw01qcjUSFKKAfQlftzHF+zmI0dR0Z9l0=;
 b=Fve7Gv4TuF2dBEwKh+/ASfSDy2+IN1sO2pDCez9eZlhMaQ3NXGSrsiNNY+pguvsRI0
 jbnXfnd9DgNIIlpbsjLZ7+IoFaRGLDczJ3XcKaGzmN+LGilQgJEZDiw3yzZnkAf8T1aI
 Dx/Dv0IxK2sd6eaHtAll4gCEmY6Eme4CfgSBoQtMsW4Xt8Q8XUbKxGVy05+Bzh/P3JgO
 7LSoitvdJyU0UULF6+lX1Yy9J9MasPESmDiqeHRBd6oo38kyCQutQDmzleEDtSBYuDZc
 f4bzt3u2z9NTG55M/cZGdX6qH0n06/xvJxcNAhMIXUxQnfHmp7LGEzJiNbcBvsf58bGH
 ObPA==
X-Gm-Message-State: AOAM532M3o5g/+QE3LO9WptG/ua/uqCQiitNAS27vAXr7vjd0zB6QVAX
 GUh2fTd5L8Z3xjgo+v9zMq8=
X-Google-Smtp-Source: ABdhPJz212Ac4yTMw99nbhJJHNy34s2OCyqMPqltJ0tGuPLdQpEI1kOEWwTFabrYRMQNml0dszwlww==
X-Received: by 2002:adf:e481:: with SMTP id i1mr6598852wrm.282.1605864208196; 
 Fri, 20 Nov 2020 01:23:28 -0800 (PST)
Received: from gmail.com (lns-bzn-36-82-251-42-13.adsl.proxad.net.
 [82.251.42.13])
 by smtp.gmail.com with ESMTPSA id w21sm3616491wmi.29.2020.11.20.01.23.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 01:23:27 -0800 (PST)
Date: Fri, 20 Nov 2020 10:23:21 +0100
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 4/5] drm/virtio: use fence_id when processing fences
Message-ID: <20201120092321.GA12906@gmail.com>
References: <20201119010809.528-1-gurchetansingh@chromium.org>
 <20201119010809.528-4-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119010809.528-4-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 05:08:08PM -0800, Gurchetan Singh wrote:
>Currently, the fence ID, which can be used to identify a
>virtgpu fence, is the same as the fence sequence number.
>
>Let's use the fence_id name to clearly signal this.
>
>Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>

Reviewed-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

>---
> drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 +-
> drivers/gpu/drm/virtio/virtgpu_fence.c | 6 +++---
> 2 files changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>index c94052376d18..7c7967a2eb84 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>@@ -420,7 +420,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
> 			  struct virtio_gpu_ctrl_hdr *cmd_hdr,
> 			  struct virtio_gpu_fence *fence);
> void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
>-				    u64 last_seq);
>+				    u64 fence_id);
>
> /* virtgpu_object.c */
> void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
>diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
>index 5b2a4146c5bd..2fe9c7ebcbd4 100644
>--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
>+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
>@@ -112,16 +112,16 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
> }
>
> void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
>-				    u64 last_seq)
>+				    u64 fence_id)
> {
> 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
> 	struct virtio_gpu_fence *fence, *tmp;
> 	unsigned long irq_flags;
>
> 	spin_lock_irqsave(&drv->lock, irq_flags);
>-	atomic64_set(&vgdev->fence_drv.last_seq, last_seq);
>+	atomic64_set(&vgdev->fence_drv.last_seq, fence_id);
> 	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
>-		if (last_seq < fence->f.seqno)
>+		if (fence_id < fence->f.seqno)
> 			continue;
> 		dma_fence_signal_locked(&fence->f);
> 		list_del(&fence->node);
>-- 
>2.29.2.299.gdc1121823c-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
