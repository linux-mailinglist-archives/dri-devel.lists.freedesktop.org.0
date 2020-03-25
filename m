Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFAF1934AE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Mar 2020 00:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFED882DF;
	Wed, 25 Mar 2020 23:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB336E873
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 23:36:11 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id m15so4225541iob.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 16:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HHZWK9vFPI+sK26Btzw9E6TD63f8JkCAZ8TtkY/kF6A=;
 b=M1pWQpthe4pLh6vkzJ3gq+ceajz2UzTh6rVU2iMZT70JD34kZ9uVtLBVomyhH5qt+F
 1CpRLZ36XNprLuNLY2mrwPsDW9d4dkwCS8MSjlynpW+LpbP+SD5XPgzFELVSz25snwEd
 nlngp+cAg+lrKWga9OgoNpD5m9orHE+IF6L27pzpnmvenqMs7Tn6leekSfQ8CTeBEsFP
 4DIJ694kkcDGsF/vxO/kc6S7DyWsl1Fasl97kOSWQY5X9AgJy0oGY8L4BRE0AzwnoiEV
 RkvVs2C9RiNU6BjwBazlbPqrur4l0kHqetbbpyYfD7AIo1u1tc8ID6qN4Jt8qYeLWDG0
 dMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HHZWK9vFPI+sK26Btzw9E6TD63f8JkCAZ8TtkY/kF6A=;
 b=bUWBn76IN1xwd+A8uW6fzo3fAKpknN9/AE2SKduESZA0eqmX7Hdk41zZD1P2UKshxa
 zbvedSEBS1NH/EwT90pKk4RtlWMR4BTgu5u2szbJpuEIsSAyCf0m8BAqPTVShGeoWDof
 hGfj2kJn1FU5h6N1ss3RJnIyyirz/LupWH+5YWrzhlHSAyYDINTu78nHaPY/LBKjWmYu
 ib3hlvKU8B5fmMRPwtmxJsdCeM/sDkc4236DTeOA+vTBhV2kmHnKVW2HvnW7EY5A/r//
 T5VUFEZzlRwkkpveUDa8A9+PgTqNlCb0jh1oOTd2M3fDv8Dmf/3iEZ1x4QCDTEZ2mQ5D
 4B2g==
X-Gm-Message-State: ANhLgQ0JlfzsVs9Igq42ARNSfbe+4aVbnqoL4up609uuluM3DZE8seOd
 mY0xTrXFneFL4uHbyB8QKsnXZ3dMw5P01WWHabDbwXmMdAkYRw==
X-Google-Smtp-Source: ADFU+vuWhP7fAcCyieBRlIQ7q8KwmlJxM1oYKlFhDgfpyzodvmnfLul9bwjnTlhTc1ukHcPe0Z6HvAKYOxwJVuSLrxM=
X-Received: by 2002:a6b:8fd8:: with SMTP id r207mr5315947iod.158.1585179370844; 
 Wed, 25 Mar 2020 16:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAPaKu7ScaEefALSxqqugaUT+pLdQXcH5KupgqH1ZH5kzNJn3Vw@mail.gmail.com>
 <20200325231009.41152-1-gurchetansingh@chromium.org>
In-Reply-To: <20200325231009.41152-1-gurchetansingh@chromium.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 26 Mar 2020 07:35:59 +0800
Message-ID: <CAPaKu7SG5ad+ohtXRg+8dmEt4LVq=BLbRMVmy+J_pUvnd5UTEA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: delete notify in virtio_gpu_object_create
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 26, 2020 at 7:10 AM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
> For 3D buffers, virtio_gpu_gem_object_open notifies.
> We can have the same behavior for dumb buffer.
>
> v2: virtio_gpu_gem_object_open always notifies
> v3: avoid boolean variable
Series is

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c    | 3 ++-
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 -
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 90c0a8ea1708c..1025658be4df2 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -114,7 +114,7 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
>         struct virtio_gpu_object_array *objs;
>
>         if (!vgdev->has_virgl_3d)
> -               return 0;
> +               goto out_notify;
>
>         objs = virtio_gpu_array_alloc(1);
>         if (!objs)
> @@ -123,6 +123,7 @@ int virtio_gpu_gem_object_open(struct drm_gem_object *obj,
>
>         virtio_gpu_cmd_context_attach_resource(vgdev, vfpriv->ctx_id,
>                                                objs);
> +out_notify:
>         virtio_gpu_notify(vgdev);
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index d9039bb7c5e37..51a8da7d5ef3b 100644
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
> 2.24.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
