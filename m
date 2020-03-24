Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4D191C91
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 23:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2116C6E554;
	Tue, 24 Mar 2020 22:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669B76E554
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 22:12:08 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id m15so274380iob.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 15:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FfcUHcKUWVmr/dweXEKolVPZzaetwT2OKe2IXqIoduA=;
 b=gXFcu/PrqxIVt845F+o4CnyML1Z5XntuU3ZHcwZbvr25BA5tsf2mAuYuQXXdnFGfw+
 PPzO9aTltI8gUoQlHwCoL7+PdiSiAzRgY1ERPuZkf1eFVTiQCGVu8LIHnS9ObllWKVeG
 3dgvwu3uHleC59WQqNrvmovOEEGYOxCDGq3EglJPiRHgBcgKXIDejhbLvl4S+xnqD5KN
 7Ws0qJJaBZh8P8CuJoxCrt+1zVNOKm3vKZr5KtxPm69tTbxdEcStrwdT1pyV599Wbzuf
 KPXUSA1pMqbVh5dTsrDp1G384jH6RyQu6bQcCKUNf/jymPDE6Xul7vuG6s4ztkqjg7rO
 OTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FfcUHcKUWVmr/dweXEKolVPZzaetwT2OKe2IXqIoduA=;
 b=BX0FsL6EYM+bwle/BRA5Op77qYs0bJnP/Gjc7utP/vYujuXmgkfsviJIqimZFAAxzS
 0Fxrn5TKYeNVZFpeDsbLbz9ofK6GvCVaC99ZNkl5QVxjArp1Cr9h2lOykNejYVkawDn+
 kwewQbFZJHAOJclg0LqdxkBO6VPLWu922vMg6D8OUnOum5La2iwQ3bnudBsSepezUcd3
 Y67b3xdDpjIqdtCqXw0f5Bz8lNAaPog+Z5I5gMazaUmkjvtD/FOvtHjvdExGeezcKq5l
 vVEGEQJmLrKposjqUlGRyrjkJ5QN35fOVKO+0YwgJnugW42dwUaTqoNJrQUtCgqUKVnT
 hajg==
X-Gm-Message-State: ANhLgQ2gfejSI9WqwkZJdrve8dA09yQ7GdU4WT/3dUtDqMRyHBfqo+rU
 Al2qdu4WNVeodZvOSIPfiD4VHUYDQDp/WrOrlmo=
X-Google-Smtp-Source: ADFU+vu2t8O00otMTUWsuuuaKbSlKGmJvt7DuER7Femw2weZtD6t1wak8n3DtO1f6etmq1vLZ0DFjtx2onOFGVRTa1M=
X-Received: by 2002:a02:94cb:: with SMTP id x69mr279237jah.19.1585087927566;
 Tue, 24 Mar 2020 15:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200324164400.30013-1-gurchetansingh@chromium.org>
 <20200324164400.30013-3-gurchetansingh@chromium.org>
In-Reply-To: <20200324164400.30013-3-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 25 Mar 2020 06:11:56 +0800
Message-ID: <CAPaKu7SLyEdbzqDXxU7+Gm1Gjh2Q4C1buudmBCEHgsk6sJ5L8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/virtio: delete notify in virtio_gpu_object_create
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

On Wed, Mar 25, 2020 at 12:44 AM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> - For dumb buffers, virtio_gpu_gem_create can notify.
> - For 3D buffers, virtio_gpu_gem_object_open can notify.
Hmm, I feel this is a bit complex.  virtio_gpu_gem_object_open may not
notify, and the caller needs to know about it.

Can we change it to virtio_gpu_object_create never notifies and
virtio_gpu_gem_object_open always notifies?

>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c    | 1 +
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 90c0a8ea1708..aa14dd12928e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -49,6 +49,7 @@ static int virtio_gpu_gem_create(struct drm_file *file,
>                 return ret;
>         }
>
> +       virtio_gpu_notify(vgdev);
>         *obj_p = &obj->base.base;
>
>         /* drop reference from allocate - handle holds it now */
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index d9039bb7c5e3..51a8da7d5ef3 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -241,7 +241,6 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>                 return ret;
>         }
>
> -       virtio_gpu_notify(vgdev);
>         *bo_ptr = bo;
>         return 0;
>
> --
> 2.25.1.696.g5e7596f4ac-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
