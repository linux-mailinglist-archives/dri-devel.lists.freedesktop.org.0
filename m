Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F5015B026
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 19:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6746EAE6;
	Wed, 12 Feb 2020 18:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE116EAE6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 18:50:56 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id g12so2680446ild.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 10:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=orrhDOq2Ct5o8RZnYBrIxwuMS+kkI7j4QVUqJV/ovQ0=;
 b=KozCJv+c5ZA0bYhQnHmZjYtpZIUnaoxz5NJhK0+DkVi9Xqsn1A4XQxzOXbCV8fYmHF
 kXmyUF8j3nKG4XlB4cZPrs9vKlelYxMztIkGci8YCk3lx8MfImJ15ZS0mg/E3CexvwhW
 yKkE7bR4npY1q7DzI8Cf9UM/U/4msO49GkCS+3Fvd1LXC83vtjNSoXSE9PTQOZZXJV3j
 DoGjpbA3cosA+HNNr6p7yvNC7EmCdlAzao/tZnKeDPHHJz+QhGLZvBqN9qM0i70E7lw+
 ilTIi0kH4M13//ij9KprX4OuYgjOykkzU+C7Jwkjb38X968Hme4a9Lh45DOMd1s3b1KG
 rZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=orrhDOq2Ct5o8RZnYBrIxwuMS+kkI7j4QVUqJV/ovQ0=;
 b=uGK5DSGNWpBjtuK5Isf0gOed00GsiWFeS2AzePqXdOzxTR55BOFBcNlCpUEQ5JH2XG
 pAzc0WVP1H0XgVb3RzDQ7id+C2cG6ILL11Ds+dsmG+GTBgGH/hpywl5E9V3pPwf2OIle
 marz/LBEPVETHHt3wREnK79uSalU38wmJHGcirK56mhdIOn+IFSYRIQYzSR9SF/nuCVL
 Q1DFJrhqQvF+aGV1hLizvsEeLjb1VMCrScQJUUnDIeunCzQ4YJd47CZmG9Z+Y3NpmZQC
 mCxSv+gboqidUBVWxGKA8aZSh2lf2+evBEuwvVrUSFMnokcGFYIV5G/5/aJ+eGvUE2Dk
 xmUg==
X-Gm-Message-State: APjAAAXu04ytDjmgCQa4F40x4p8SCxOWhhmpKynR8loPzVo4W8PVCtSI
 lwKiNqNF2sZwNDj480MM/WnRWdvLj/48z71eSdI=
X-Google-Smtp-Source: APXvYqxvAeEUAU+31qmWPUeuhlC4Em3yjX/AMc5QFe1sayogMv3NWxv7gUD512VPWZ8WXHyykwdFJ9SzF2RoK4xVWUs=
X-Received: by 2002:a92:9ac5:: with SMTP id c66mr13056233ill.232.1581533456139; 
 Wed, 12 Feb 2020 10:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20200211235635.488-1-gurchetansingh@chromium.org>
 <20200211235635.488-4-gurchetansingh@chromium.org>
In-Reply-To: <20200211235635.488-4-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 12 Feb 2020 10:50:45 -0800
Message-ID: <CAPaKu7QrK9PKaLdtmLd657-vnAPbisCr7EoYS9QyiQZSqevKQQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/virtio: track whether or not a context has been
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 3:56 PM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> We only want create a new virglrenderer context after the first
> 3D ioctl.
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 1 +
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   | 2 ++
>  3 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index edaa7b8224a8..93ce69c0d9be 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -209,6 +209,7 @@ struct virtio_gpu_device {
>
>  struct virtio_gpu_fpriv {
>         uint32_t ctx_id;
> +       atomic_t context_initiated;
>  };
>  /* virtio_ioctl.c */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index f1afabaa3a08..858ee153fb18 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -44,9 +44,14 @@ void virtio_gpu_create_context(struct drm_device *dev,
>         if (!vgdev->has_virgl_3d)
>                 return;
>
> +       if (atomic_read(&vfpriv->context_initiated))
> +               return;
> +
>         get_task_comm(dbgname, current);
>         virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
>                                       strlen(dbgname), dbgname);
> +
> +       atomic_inc(&vfpriv->context_initiated);
>  }
This needs to be protected with a lock.  ctx_id can probably be
generated here as well.


>
>  static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index e1e1c0821a35..64fe5fcbedfd 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -270,7 +270,9 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
>                 return id;
>         }
>
> +
>         vfpriv->ctx_id = id;
> +       atomic_set(&vfpriv->context_initiated, 0);
>         file->driver_priv = vfpriv;
>         virtio_gpu_create_context(dev, file);
>
> --
> 2.25.0.225.g125e21ebc7-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
