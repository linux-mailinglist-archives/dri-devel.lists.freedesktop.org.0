Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8D96C723A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 22:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8268210E00B;
	Thu, 23 Mar 2023 21:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F7110E00B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 21:18:33 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id bf30so10681965oib.12
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 14:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679606312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v4xYkg94aW7mOvwdHMLFD/HOVWTkOTnTBr9DxtYM8pU=;
 b=OT/g8x3kC1h4WbiTNhFkqLk9Umy7HUK3Qmxi8mw4kgrv9WAxJy2ueS3sq/iOUNfiyP
 G6g1ds3z7BQyXVtaYJVpuDPqNTctXWVefar+Jm1V/Qse0VZNETE+hw9oOsjbu+AwGJeC
 wHlJ9E2u2U2HHZ0c3SmHlwHWMEQlVA1VkrYUszf0Rm8WkETNRY0KM7O/K8Ex5mSR3MDn
 b7JeAowXBkumDsR02SV3/IL+aJO7lvfxdR8xnaovAkJlND2/ioHRP65hGSA6aWb+fBgM
 heYeaDfCKVKD7x/o7gbt9KzEHYfBy55Vsgl2tWnZgQXVMLlCIsrSLIjRsW5xzFTOBMO6
 1JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679606312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v4xYkg94aW7mOvwdHMLFD/HOVWTkOTnTBr9DxtYM8pU=;
 b=I+3uMARJ7cP19rN8dMPNauFfEzTkZGXK1znxI1L8HZi/MLV02hsIFbfhDDRes/NUe4
 ldtb0sI7xAqXIRCQtxjbKi2aVJktt4o7Uswwle22UhYt7l+P54Et8nmgWCt8hwAwAeFh
 GNyv7OD0Mo7E5OUV7PedsTUm6GsKktIwVRadEQtOOzynzO6/5qyn2LWQ89sSoEvG6rIq
 hmRauGew7ZmISTxT1NDOP0r8yheUFq6LiW/xoLfj5MzQfulktXBfd83X2ygKFeOieta3
 M7G6VlmNAX3my/vTunTvakEQSMDN/hsZyEZIW92SDj5it4LbpVof4zzHTb/LMM7eLFpi
 gXgA==
X-Gm-Message-State: AO0yUKWpnadJ3yAoJqKjd8NSbR+IKg0oq5CSaDvWjdZ++EDjc7lEmL+g
 Yu0oPFqHiATstQk099kLZgtt4LCgIgBqvhAjokU=
X-Google-Smtp-Source: AK7set8jY446IH6p6mHp1ba5OkPGyg2Zcs2qhKucO8I30/S+qexfrKxW6Y/Vnvc+vn2stcIhs0KKPJp7G1z6NNAg/OI=
X-Received: by 2002:a05:6808:659:b0:378:30dc:ae5b with SMTP id
 z25-20020a056808065900b0037830dcae5bmr28539oih.5.1679606312499; Thu, 23 Mar
 2023 14:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230323190340.950875-1-dmitry.osipenko@collabora.com>
 <20230323190340.950875-3-dmitry.osipenko@collabora.com>
In-Reply-To: <20230323190340.950875-3-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 23 Mar 2023 14:18:21 -0700
Message-ID: <CAF6AEGs28wzuXc3w+qYvcUH+dT271w=dtxmzKfR6zgHqXqjMzQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/virtio: Support sync objects
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org,
 Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 12:05=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Add sync object DRM UAPI support to VirtIO-GPU driver. It's required
> for enabling a full-featured Vulkan fencing by Venus and native context
> VirtIO-GPU Mesa drivers.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c    |   3 +-
>  drivers/gpu/drm/virtio/virtgpu_submit.c | 211 ++++++++++++++++++++++++
>  include/uapi/drm/virtgpu_drm.h          |  16 +-
>  3 files changed, 228 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virti=
o/virtgpu_drv.c
> index add075681e18..a22155577152 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -176,7 +176,8 @@ static const struct drm_driver driver =3D {
>          * If KMS is disabled DRIVER_MODESET and DRIVER_ATOMIC are masked
>          * out via drm_device::driver_features:
>          */
> -       .driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER =
| DRIVER_ATOMIC,
> +       .driver_features =3D DRIVER_MODESET | DRIVER_GEM | DRIVER_RENDER =
| DRIVER_ATOMIC |
> +                          DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
>         .open =3D virtio_gpu_driver_open,
>         .postclose =3D virtio_gpu_driver_postclose,
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm/vi=
rtio/virtgpu_submit.c
> index 2ce2459c6bc2..9ea4390948bf 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> @@ -14,11 +14,26 @@
>  #include <linux/uaccess.h>
>
>  #include <drm/drm_file.h>
> +#include <drm/drm_syncobj.h>
>  #include <drm/virtgpu_drm.h>
>
>  #include "virtgpu_drv.h"
>
> +struct virtio_gpu_submit_post_dep {
> +       struct drm_syncobj *syncobj;
> +       struct dma_fence_chain *chain;
> +       uint64_t point;
> +};
> +
>  struct virtio_gpu_submit {
> +       struct virtio_gpu_submit_post_dep *post_deps;
> +       unsigned int num_out_syncobjs;
> +
> +       struct drm_syncobj **in_syncobjs;
> +       unsigned int num_in_syncobjs;
> +       uint64_t *in_fence_ids;
> +       unsigned int num_in_fence_ids;
> +
>         struct virtio_gpu_object_array *buflist;
>         struct drm_virtgpu_execbuffer *exbuf;
>         struct virtio_gpu_fence *out_fence;
> @@ -58,6 +73,186 @@ static int virtio_gpu_dma_fence_wait(struct virtio_gp=
u_submit *submit,
>         return 0;
>  }
>
> +static void virtio_gpu_free_syncobjs(struct drm_syncobj **syncobjs,
> +                                    uint32_t nr_syncobjs)
> +{
> +       uint32_t i =3D nr_syncobjs;
> +
> +       while (syncobjs && i--) {

Checking syncobjs!=3DNULL here does at least look a bit funny, as the
condition doesn't change in the loop body.  It is not incorrect, it
protects you against the cleanup path where submit->in_syncobjs is
NULL.  But if (!syncobjs)\nreturn seems a bit more clear


> +               if (syncobjs[i])
> +                       drm_syncobj_put(syncobjs[i]);
> +       }
> +
> +       kfree(syncobjs);
> +}
> +
> +static int
> +virtio_gpu_parse_deps(struct virtio_gpu_submit *submit)
> +{
> +       struct drm_virtgpu_execbuffer *exbuf =3D submit->exbuf;
> +       struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
> +       size_t syncobj_stride =3D exbuf->syncobj_stride;
> +       struct drm_syncobj **syncobjs;
> +       int ret =3D 0, i;
> +
> +       if (!submit->num_in_syncobjs)
> +               return 0;
> +
> +       syncobjs =3D kcalloc(submit->num_in_syncobjs, sizeof(*syncobjs),
> +                          GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);

I *think*, assuming I'm reading where this is called correctly (kinda
wish git would show more lines of context by default) that these don't
need to be NOWARN|NORETRY (same for post_deps).  I guess you inherited
this from drm/msm, where I appear to have forgotten to update the
syncobj path in commit f0de40a131d9 ("drm/msm: Reorder lock vs submit
alloc").  I don't see anything obvious that would require NORETRY, but
lockdep should be able to tell you otherwise if needed..

BR,
-R

> +       if (!syncobjs)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < submit->num_in_syncobjs; i++) {
> +               uint64_t address =3D exbuf->in_syncobjs + i * syncobj_str=
ide;
> +               struct dma_fence *fence;
> +
> +               if (copy_from_user(&syncobj_desc,
> +                                  u64_to_user_ptr(address),
> +                                  min(syncobj_stride, sizeof(syncobj_des=
c)))) {
> +                       ret =3D -EFAULT;
> +                       break;
> +               }
> +
> +               if (syncobj_desc.flags & ~VIRTGPU_EXECBUF_SYNCOBJ_FLAGS) =
{
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +
> +               ret =3D drm_syncobj_find_fence(submit->file, syncobj_desc=
.handle,
> +                                            syncobj_desc.point, 0, &fenc=
e);
> +               if (ret)
> +                       break;
> +
> +               ret =3D virtio_gpu_dma_fence_wait(submit, fence);
> +
> +               dma_fence_put(fence);
> +               if (ret)
> +                       break;
> +
> +               if (syncobj_desc.flags & VIRTGPU_EXECBUF_SYNCOBJ_RESET) {
> +                       syncobjs[i] =3D
> +                               drm_syncobj_find(submit->file, syncobj_de=
sc.handle);
> +                       if (!syncobjs[i]) {
> +                               ret =3D -EINVAL;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       if (ret) {
> +               virtio_gpu_free_syncobjs(syncobjs, i);
> +               return ret;
> +       }
> +
> +       submit->in_syncobjs =3D syncobjs;
> +
> +       return ret;
> +}
> +
> +static void virtio_gpu_reset_syncobjs(struct drm_syncobj **syncobjs,
> +                                     uint32_t nr_syncobjs)
> +{
> +       uint32_t i;
> +
> +       for (i =3D 0; syncobjs && i < nr_syncobjs; i++) {
> +               if (syncobjs[i])
> +                       drm_syncobj_replace_fence(syncobjs[i], NULL);
> +       }
> +}
> +
> +static void
> +virtio_gpu_free_post_deps(struct virtio_gpu_submit_post_dep *post_deps,
> +                         uint32_t nr_syncobjs)
> +{
> +       uint32_t i =3D nr_syncobjs;
> +
> +       while (post_deps && i--) {
> +               kfree(post_deps[i].chain);
> +               drm_syncobj_put(post_deps[i].syncobj);
> +       }
> +
> +       kfree(post_deps);
> +}
> +
> +static int virtio_gpu_parse_post_deps(struct virtio_gpu_submit *submit)
> +{
> +       struct drm_virtgpu_execbuffer *exbuf =3D submit->exbuf;
> +       struct drm_virtgpu_execbuffer_syncobj syncobj_desc;
> +       struct virtio_gpu_submit_post_dep *post_deps;
> +       size_t syncobj_stride =3D exbuf->syncobj_stride;
> +       int ret =3D 0, i;
> +
> +       if (!submit->num_out_syncobjs)
> +               return 0;
> +
> +       post_deps =3D kcalloc(submit->num_out_syncobjs, sizeof(*post_deps=
),
> +                           GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
> +       if (!post_deps)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < submit->num_out_syncobjs; i++) {
> +               uint64_t address =3D exbuf->out_syncobjs + i * syncobj_st=
ride;
> +
> +               if (copy_from_user(&syncobj_desc,
> +                                  u64_to_user_ptr(address),
> +                                  min(syncobj_stride, sizeof(syncobj_des=
c)))) {
> +                       ret =3D -EFAULT;
> +                       break;
> +               }
> +
> +               post_deps[i].point =3D syncobj_desc.point;
> +
> +               if (syncobj_desc.flags) {
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +
> +               if (syncobj_desc.point) {
> +                       post_deps[i].chain =3D dma_fence_chain_alloc();
> +                       if (!post_deps[i].chain) {
> +                               ret =3D -ENOMEM;
> +                               break;
> +                       }
> +               }
> +
> +               post_deps[i].syncobj =3D
> +                       drm_syncobj_find(submit->file, syncobj_desc.handl=
e);
> +               if (!post_deps[i].syncobj) {
> +                       ret =3D -EINVAL;
> +                       break;
> +               }
> +       }
> +
> +       if (ret) {
> +               virtio_gpu_free_post_deps(post_deps, i);
> +               return ret;
> +       }
> +
> +       submit->post_deps =3D post_deps;
> +
> +       return 0;
> +}
> +
> +static void
> +virtio_gpu_process_post_deps(struct virtio_gpu_submit *submit)
> +{
> +       struct virtio_gpu_submit_post_dep *post_deps =3D submit->post_dep=
s;
> +       struct dma_fence *fence =3D &submit->out_fence->f;
> +       uint32_t i;
> +
> +       for (i =3D 0; post_deps && i < submit->num_out_syncobjs; i++) {
> +               if (post_deps[i].chain) {
> +                       drm_syncobj_add_point(post_deps[i].syncobj,
> +                                             post_deps[i].chain,
> +                                             fence, post_deps[i].point);
> +                       post_deps[i].chain =3D NULL;
> +               } else {
> +                       drm_syncobj_replace_fence(post_deps[i].syncobj, f=
ence);
> +               }
> +       }
> +}
> +
>  static int virtio_gpu_fence_event_create(struct drm_device *dev,
>                                          struct drm_file *file,
>                                          struct virtio_gpu_fence *fence,
> @@ -121,6 +316,11 @@ static int virtio_gpu_init_submit_buflist(struct vir=
tio_gpu_submit *submit)
>
>  static void virtio_gpu_cleanup_submit(struct virtio_gpu_submit *submit)
>  {
> +       virtio_gpu_reset_syncobjs(submit->in_syncobjs, submit->num_in_syn=
cobjs);
> +       virtio_gpu_free_syncobjs(submit->in_syncobjs, submit->num_in_sync=
objs);
> +       virtio_gpu_free_post_deps(submit->post_deps, submit->num_out_sync=
objs);
> +       kfree(submit->in_fence_ids);
> +
>         if (!IS_ERR(submit->buf))
>                 kvfree(submit->buf);
>
> @@ -173,6 +373,8 @@ static int virtio_gpu_init_submit(struct virtio_gpu_s=
ubmit *submit,
>                 return err;
>         }
>
> +       submit->num_out_syncobjs =3D exbuf->num_out_syncobjs;
> +       submit->num_in_syncobjs =3D exbuf->num_in_syncobjs;
>         submit->out_fence =3D out_fence;
>         submit->fence_ctx =3D fence_ctx;
>         submit->ring_idx =3D ring_idx;
> @@ -285,6 +487,14 @@ int virtio_gpu_execbuffer_ioctl(struct drm_device *d=
ev, void *data,
>         if (ret)
>                 goto cleanup;
>
> +       ret =3D virtio_gpu_parse_deps(&submit);
> +       if (ret)
> +               goto cleanup;
> +
> +       ret =3D virtio_gpu_parse_post_deps(&submit);
> +       if (ret)
> +               goto cleanup;
> +
>         ret =3D virtio_gpu_install_out_fence_fd(&submit);
>         if (ret)
>                 goto cleanup;
> @@ -294,6 +504,7 @@ int virtio_gpu_execbuffer_ioctl(struct drm_device *de=
v, void *data,
>                 goto cleanup;
>
>         virtio_gpu_submit(&submit);
> +       virtio_gpu_process_post_deps(&submit);
>         virtio_gpu_complete_submit(&submit);
>  cleanup:
>         virtio_gpu_cleanup_submit(&submit);
> diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_dr=
m.h
> index 7b158fcb02b4..ce4948aacafd 100644
> --- a/include/uapi/drm/virtgpu_drm.h
> +++ b/include/uapi/drm/virtgpu_drm.h
> @@ -64,6 +64,16 @@ struct drm_virtgpu_map {
>         __u32 pad;
>  };
>
> +#define VIRTGPU_EXECBUF_SYNCOBJ_RESET          0x01
> +#define VIRTGPU_EXECBUF_SYNCOBJ_FLAGS ( \
> +               VIRTGPU_EXECBUF_SYNCOBJ_RESET | \
> +               0)
> +struct drm_virtgpu_execbuffer_syncobj {
> +       __u32 handle;
> +       __u32 flags;
> +       __u64 point;
> +};
> +
>  /* fence_fd is modified on success if VIRTGPU_EXECBUF_FENCE_FD_OUT flag =
is set. */
>  struct drm_virtgpu_execbuffer {
>         __u32 flags;
> @@ -73,7 +83,11 @@ struct drm_virtgpu_execbuffer {
>         __u32 num_bo_handles;
>         __s32 fence_fd; /* in/out fence fd (see VIRTGPU_EXECBUF_FENCE_FD_=
IN/OUT) */
>         __u32 ring_idx; /* command ring index (see VIRTGPU_EXECBUF_RING_I=
DX) */
> -       __u32 pad;
> +       __u32 syncobj_stride;
> +       __u32 num_in_syncobjs;
> +       __u32 num_out_syncobjs;
> +       __u64 in_syncobjs;
> +       __u64 out_syncobjs;
>  };
>
>  #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw =
*/
> --
> 2.39.2
>
