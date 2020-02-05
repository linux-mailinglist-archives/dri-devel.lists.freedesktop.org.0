Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCF15389C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 20:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FCE6E9CC;
	Wed,  5 Feb 2020 19:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29F56E9CC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 19:02:31 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id x2so2785584ila.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 11:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NFFmVcVESEfwSn2A/244mgSc36NuR/2W0Tkvm0b+8y8=;
 b=OkchdjsZNX5fOzLnoUuy87cUuoKByubZ2zqOERnwR9hKX8hukkCmV8HCsiT0Arwhqh
 O3u9tIDy2LybmWCTmCT2t6gZkyGkqHAe44Iz/NgWrgghuk72FiEkhGsKXBwAe7MREQnP
 9O3smUse0EtCi7RJE2RRNhWI3fQMJwh3UhJhHutolJpbCE+w4TSFfGqPpxdb7kG51xYS
 W2ZpdBe8R0FeOw5HfCQLhmkt6rPo1ibCRSBEg6/O4W7XUwE6nvpNca5Whcb6Cy40v5ip
 34/JEifRWbqP0vThcUQFmYe7iD4JZsM8IbEXOmS2lfT02z3oNYd4U3NS9p3e9u99LbDr
 yI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NFFmVcVESEfwSn2A/244mgSc36NuR/2W0Tkvm0b+8y8=;
 b=YVVR3UK3pDOjIraf8R0fjrtM2DLoxvaDOEXEZEkIrzwYMGzg5I2P8NjZg0jVJe5pi5
 fK3XQiwEtk9SAuKSVuXqfIw0PLyH5JNM1tZyPphSQjH8rBWLLFQ0gQqURPfGOkOD0SPM
 wG3frmCOUrAaXDe/6GWFMGYjScLt+sVmpoa/dFBP22xCJ88BosNns8s3zH15y5gQEgUu
 80CHwaeltkjvxLgCkDKMPU4iupVXKKwDAYqtUjIGgvPGZgbSQFC6WYX+TgKlhGimNunh
 HgscFhhi6umwXMB8l55oYxupFyH5O82VkeTR7L4MJ6W+WluDXrjregVLwx6/cKgVxWCc
 XGpw==
X-Gm-Message-State: APjAAAVC5xV9R00bsQPClIFt3uM6RI6aXEo/FJgv5/dsbdGC/TRasBZZ
 IW1oq0YLt6P0bpP3ZuOubTGvHYC++adO+j+gYqzJ/c5a
X-Google-Smtp-Source: APXvYqyp9wuSn6/5IMsbRVub/R5YxR28vshgim22WfgXtRPHIQYjj4RUu6bWJWFTvDN/70errdbBVIhzy+NuDtuJv0s=
X-Received: by 2002:a92:9ac5:: with SMTP id c66mr35877612ill.232.1580929350686; 
 Wed, 05 Feb 2020 11:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20200205105955.28143-1-kraxel@redhat.com>
 <20200205105955.28143-3-kraxel@redhat.com>
In-Reply-To: <20200205105955.28143-3-kraxel@redhat.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 5 Feb 2020 11:02:19 -0800
Message-ID: <CAPaKu7SCk_3yeTtzFTTU_y-tyo8EDS7vR8i+mk829=0D-UjLQA@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/virtio: resource teardown tweaks
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 5, 2020 at 3:00 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Add new virtio_gpu_cleanup_object() helper function for object cleanup.
> Wire up callback function for resource unref, do cleanup from callback
> when we know the host stopped using the resource.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.h    |  3 ++-
>  drivers/gpu/drm/virtio/virtgpu_object.c | 19 ++++++++++----
>  drivers/gpu/drm/virtio/virtgpu_vq.c     | 35 ++++++++++++++++++++++---
>  3 files changed, 48 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
> index 7e69c06e168e..372dd248cf02 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
> @@ -262,7 +262,7 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>                                     struct virtio_gpu_object_array *objs,
>                                     struct virtio_gpu_fence *fence);
>  void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
> -                                  uint32_t resource_id);
> +                                  struct virtio_gpu_object *bo);
>  void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
>                                         uint64_t offset,
>                                         uint32_t width, uint32_t height,
> @@ -355,6 +355,7 @@ void virtio_gpu_fence_event_process(struct virtio_gpu_device *vdev,
>                                     u64 last_seq);
>
>  /* virtio_gpu_object */
> +void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo);
>  struct drm_gem_object *virtio_gpu_create_object(struct drm_device *dev,
>                                                 size_t size);
>  int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 017a9e0fc3bb..28a161af7503 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -61,6 +61,14 @@ static void virtio_gpu_resource_id_put(struct virtio_gpu_device *vgdev, uint32_t
>         }
>  }
>
> +void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
> +{
> +       struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
> +
> +       virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
> +       drm_gem_shmem_free_object(&bo->base.base);
> +}
> +
>  static void virtio_gpu_free_object(struct drm_gem_object *obj)
>  {
>         struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> @@ -68,11 +76,12 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
>
>         if (bo->pages)
>                 virtio_gpu_object_detach(vgdev, bo);
> -       if (bo->created)
> -               virtio_gpu_cmd_unref_resource(vgdev, bo->hw_res_handle);
> -       virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
> -
> -       drm_gem_shmem_free_object(obj);
> +       if (bo->created) {
> +               virtio_gpu_cmd_unref_resource(vgdev, bo);
> +               /* completion handler calls virtio_gpu_cleanup_object() */
nitpick: we don't need this comment when virtio_gpu_cmd_unref_cb is
defined by this file and passed to virtio_gpu_cmd_unref_resource.

I happen to be looking at our error handling paths.  I think we want
virtio_gpu_queue_fenced_ctrl_buffer to call vbuf->resp_cb on errors.


> +               return;
> +       }
> +       virtio_gpu_cleanup_object(bo);
>  }
>
>  static const struct drm_gem_object_funcs virtio_gpu_gem_funcs = {
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index 6d6d55dc384e..6e8097e4c214 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -152,6 +152,15 @@ static void *virtio_gpu_alloc_cmd(struct virtio_gpu_device *vgdev,
>                                          sizeof(struct virtio_gpu_ctrl_hdr), NULL);
>  }
>
> +static void *virtio_gpu_alloc_cmd_cb(struct virtio_gpu_device *vgdev,
> +                                    struct virtio_gpu_vbuffer **vbuffer_p,
> +                                    int size,
> +                                    virtio_gpu_resp_cb cb)
> +{
> +       return virtio_gpu_alloc_cmd_resp(vgdev, cb, vbuffer_p, size,
> +                                        sizeof(struct virtio_gpu_ctrl_hdr), NULL);
> +}
> +
>  static void free_vbuf(struct virtio_gpu_device *vgdev,
>                       struct virtio_gpu_vbuffer *vbuf)
>  {
> @@ -494,17 +503,37 @@ void virtio_gpu_cmd_create_resource(struct virtio_gpu_device *vgdev,
>         bo->created = true;
>  }
>
> +static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
> +                                   struct virtio_gpu_vbuffer *vbuf)
> +{
> +       struct virtio_gpu_object *bo;
> +
> +       bo = gem_to_virtio_gpu_obj(vbuf->objs->objs[0]);
> +       kfree(vbuf->objs);
> +       vbuf->objs = NULL;
> +
> +       virtio_gpu_cleanup_object(bo);
> +}
> +
>  void virtio_gpu_cmd_unref_resource(struct virtio_gpu_device *vgdev,
> -                                  uint32_t resource_id)
> +                                  struct virtio_gpu_object *bo)
>  {
>         struct virtio_gpu_resource_unref *cmd_p;
>         struct virtio_gpu_vbuffer *vbuf;
>
> -       cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
> +       cmd_p = virtio_gpu_alloc_cmd_cb(vgdev, &vbuf, sizeof(*cmd_p),
> +                                       virtio_gpu_cmd_unref_cb);
>         memset(cmd_p, 0, sizeof(*cmd_p));
>
>         cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_UNREF);
> -       cmd_p->resource_id = cpu_to_le32(resource_id);
> +       cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
> +
> +       /*
> +        * We are in the release callback and do NOT want refcount
> +        * bo, so do NOT use virtio_gpu_array_add_obj().
> +        */
> +       vbuf->objs = virtio_gpu_array_alloc(1);
> +       vbuf->objs->objs[0] = &bo->base.base
This is an abuse of obj array.  Add "void *private_data;" to
virtio_gpu_vbuffer and use that maybe?

Otherwise, simply

  // abuse objs field to pass our private data; must reset in the resp_cb
  vbuf->objs = (virtio_gpu_object_array *) bo;

makes it easier to see what is going on.


>
>         virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
>  }
> --
> 2.18.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
