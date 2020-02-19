Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F39F164DAB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 19:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B072A6EC6D;
	Wed, 19 Feb 2020 18:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41BF6EC6D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:30:31 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z193so1683996iof.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zk5JaL3OdvrZn7ySp0uGZ0H404VLWFcPmsn+jdRMZiw=;
 b=hrneDyDq/cA/9916u9SMdQpw452ImMxouQ2VSOQJyNPOnkXuT4BsP4Z4WecV05fga/
 HQ/8bjz5MDjzZt5WBMRs2UursI1NegEZK2Ukfqvv7ReXoXvglhqNQEWwoI2PdvoEodB5
 5iO01Naqy3oDje7WZXTOMFf73txlFgD/0UyVPmCXcLEZ181y4LMaGGMRqA5XR3Ft3Hvj
 7cQFh3ZZMqpLRCjadC9ir3Q3sC4CGkB00u/czF0Tk6vKU6JrgUtQf1dw5U29eoJgtnTP
 vJB78dT7QUfhM3fKqyri4zaRrnSlCmApo4bZ+gEWKo8xj9EIYeOuAmW/VmXF8uQk03cL
 OODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zk5JaL3OdvrZn7ySp0uGZ0H404VLWFcPmsn+jdRMZiw=;
 b=EAVunUeH43bMC7Ie4Igee41eE0U+MHmWjiZD1L5pIju1LZi2GOufG4vtn24WkgOIyv
 OfTM8+D2XbnWAQ/D0g6IyNGOXgsqUYbBHAtlCtRwbT1IM3d1/lUNEMIrLfktUNlbdJ/8
 xMSzNA691tHMR89V4B1gxVzQinW2EEzC/qtNYoxDxxWN7kdgFiv7W3Ku10WsE0HfA44O
 I049bOFPajorfjrqWzEyIvuNwMTzdhaCl9VodJK6f0wgSnYIqO2PbDoQfHsXQEDSnv1e
 a9s1uM1mkOKk6LDTBvqtbRAVejyWAechNyVmprJc19iLohMhiO3QorZ7uzeHRboJED1v
 zfRw==
X-Gm-Message-State: APjAAAUu47J0D+AtinURmwG1xhQUABzGUTCZo1noj75M6W/dIxLZR2Sl
 e3bE5E6y3rao0rGiHUB3eO/HMdpM4ULkpT+l9j86eSSD
X-Google-Smtp-Source: APXvYqyH8MN2p7eFzOCovdYkF9BZxtE3YA+PCnmUhPEEXdu9oe3iR8gv4G7O2gMJCfjJl+okQoYBib8QgNw9OaSKnzo=
X-Received: by 2002:a6b:e705:: with SMTP id b5mr22060938ioh.139.1582137030979; 
 Wed, 19 Feb 2020 10:30:30 -0800 (PST)
MIME-Version: 1.0
References: <20200219175640.809-1-gurchetansingh@chromium.org>
 <20200219175640.809-3-gurchetansingh@chromium.org>
In-Reply-To: <20200219175640.809-3-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 19 Feb 2020 10:30:20 -0800
Message-ID: <CAPaKu7QDRJx0auB7eKvLTx17Wio28eXU1urhsVJSfeua28OYhg@mail.gmail.com>
Subject: Re: [PATCH 3/5 v5] drm/virtio: track whether or not a context has
 been initiated
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

Patch 1-4 are

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

I think we can drop patch 5 for now.


On Wed, Feb 19, 2020 at 9:56 AM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> Use an atomic variable to track whether a context has been
> initiated.
>
> v5: Fix possible race and sleep via mutex (@olv)
>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h   | 2 ++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 8 ++++++++
>  drivers/gpu/drm/virtio/virtgpu_kms.c   | 3 +++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 72c1d9b59dfe..0596d9618554 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -209,6 +209,8 @@ struct virtio_gpu_device {
>
>  struct virtio_gpu_fpriv {
>         uint32_t ctx_id;
> +       bool context_initiated;
ctx_id and context_initialized are named hw_res_handle and created
respectively in virtio_gpu_object.  I think we should use "hw",
"id"/"handle", "initialized"/"created" more consistently.

This is just a nitpick, and does not need to be a part of this series.

> +       struct mutex context_lock;
>  };
>
>  /* virtio_ioctl.c */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index de04f80f737d..c1a6cb4ec375 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -44,10 +44,18 @@ void virtio_gpu_create_context(struct drm_device *dev,
>         if (!vgdev->has_virgl_3d)
>                 return;
>
> +       mutex_lock(&vfpriv->context_lock);
> +       if (vfpriv->context_initiated)
> +               goto out_unlock;
> +
>         get_task_comm(dbgname, current);
>         virtio_gpu_cmd_context_create(vgdev, vfpriv->ctx_id,
>                                       strlen(dbgname), dbgname);
>         virtio_gpu_notify(vgdev);
> +       vfpriv->context_initiated = true;
> +
> +out_unlock:
> +       mutex_unlock(&vfpriv->context_lock);
>  }
>
>  static int virtio_gpu_map_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> index f7e3712502ca..424729cb81d1 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> @@ -258,6 +258,8 @@ int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file)
>         if (!vfpriv)
>                 return -ENOMEM;
>
> +       mutex_init(&vfpriv->context_lock);
> +
>         handle = ida_alloc(&vgdev->ctx_id_ida, GFP_KERNEL);
>         if (handle < 0) {
>                 kfree(vfpriv);
> @@ -281,6 +283,7 @@ void virtio_gpu_driver_postclose(struct drm_device *dev, struct drm_file *file)
>         vfpriv = file->driver_priv;
>
>         virtio_gpu_context_destroy(vgdev, vfpriv->ctx_id);
> +       mutex_destroy(&vfpriv->context_lock);
>         kfree(vfpriv);
>         file->driver_priv = NULL;
>  }
> --
> 2.25.0.265.gbab2e86ba0-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
