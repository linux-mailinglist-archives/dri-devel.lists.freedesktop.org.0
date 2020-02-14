Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8C15F6D5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 20:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01866E860;
	Fri, 14 Feb 2020 19:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC116E860
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 19:27:21 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k24so11745959ioc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 11:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KwG7gc+HChVIvlkoCsqTd7F3FLxciloywFskiepQK/A=;
 b=KZp9yQy7BMrk66sbgZXeAVaS0/ksiX0nFzD72TscuHHXqGJMtpnqVOgVrh1a55RhqN
 UEkZfTyl3HS2Qkyoom0gAi6QL/NI8JKBY2htcQoqbFjcKRwncDj701olhB7obhDYBUiU
 XLMMYjNJx2krwT/uWYPXnb++a8+g7FX9nyfcCXABFev9XBVabfDU8Mg1330Adbtytg6R
 PMmvvHar25axlhpbaAm4ccx2UXoJA2Gsl/eddKVkQRqw2Q4HuBrNNdlIfel0ECAgYpiH
 /wsfch+iBv4ZnWqHbwUIW6akp1WthjYpMUds1VaCxqJa9Me51yVPcniwt+L8F/CvGsGG
 70FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KwG7gc+HChVIvlkoCsqTd7F3FLxciloywFskiepQK/A=;
 b=iuHxSfJ+EzEteoO2pRAJUJuTtj7H36ng40lj0SExMZTj/sh+D7MlJ5CYVWmXbJnf9/
 iA3bHJSHXRAz2OZlJFIHNKj4NbVFwgPu7RDh/gcXgHULH1Rscs4gDuUiGSqzowRCJTIz
 1gFxAnIGB5apch8x69vcVnyqkkTtz32XL6ckS9mnjCyxdelKK8gb8qANd7F5Ijo2qMkL
 svHWPrZrwgkwZSeL7HRy/OBfW/Ra08ci+4mA0EuNtM0K67uxun1N88INPgEihqGfw3qW
 FYeJIw937QmbrzRi2hXMuh4OGVlxQogWgsxOc3RQFyQTyJTTz5LK/VIrAqxyg7afG+un
 cBKQ==
X-Gm-Message-State: APjAAAX7PhIHwJL1/8nk5nvhOLlv6bAdl83Age5NctuIhQ2BvBogxMXz
 6z9Iq9+q3P78HDwLPpVsO09a0RKkVlxCcbRZ5n8=
X-Google-Smtp-Source: APXvYqybOF2JKye5pfDtRRLVUUpEXdb4H0tVaQ74fas8PNrWC5DUDAKaak/GhEZOqxzAMP19HmKx8taC6wtUAu6e5+0=
X-Received: by 2002:a5d:8146:: with SMTP id f6mr3394068ioo.93.1581708441173;
 Fri, 14 Feb 2020 11:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20200213231805.622-1-gurchetansingh@chromium.org>
 <20200213231805.622-4-gurchetansingh@chromium.org>
In-Reply-To: <20200213231805.622-4-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 14 Feb 2020 11:27:10 -0800
Message-ID: <CAPaKu7QTTSWmts2embnRrfNcnHqnPrK9dGuLNpuiQx82MX0nNQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/virtio: track whether or not a context has been
 initiated
To: Gurchetan Singh <gurchetansingh@chromium.org>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 3:18 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> Use an atomic variable to track whether a context has been
> initiated.
>
> v2: Fix possible race (@olv)
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 3 +++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   | 1 +
>  3 files changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 72c1d9b59dfe..ca505984f8ab 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -209,6 +209,7 @@ struct virtio_gpu_device {
>
>  struct virtio_gpu_fpriv {
>         uint32_t ctx_id;
> +       atomic_t context_initiated;
>  };
>
>  /* virtio_ioctl.c */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 896c3f419a6d..a98884462944 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -44,6 +44,9 @@ void virtio_gpu_create_context(struct drm_device *dev,
>         if (!vgdev->has_virgl_3d)
>                 return;
>
> +       if (!atomic_add_unless(&vfpriv->context_initiated, 1, 1))
> +               return;
> +
How does this work?  When thread A and B enter this function at the
same time, and thread B returns early, it is possible that thread B
queues other commands before thread A has the chance to queue
virtio_gpu_cmd_context_create.

>         get_task_comm(dbgname, current);
>         virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
>                                       strlen(dbgname), dbgname);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index 282558576527..25248bad3fc4 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -263,6 +263,7 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
>         }
>
>         vfpriv->ctx_id = handle + 1;
> +       atomic_set(&vfpriv->context_initiated, 0);
>         file->driver_priv = vfpriv;
>         virtio_gpu_create_context(dev, file);
>         return 0;
> --
> 2.25.0.265.gbab2e86ba0-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
