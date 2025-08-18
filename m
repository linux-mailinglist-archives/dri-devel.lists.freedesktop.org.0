Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7E3B2B1DA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 21:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768C210E07B;
	Mon, 18 Aug 2025 19:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cKPybFRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89AAF10E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 19:47:01 +0000 (UTC)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-61c0a11d042so332906eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 12:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755546420; x=1756151220; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VQdRQK2xrCJNSgk4rlAaL1KBNDxU098DbOr/3KPziO0=;
 b=cKPybFRkrCADm1NQkT3wt5JMQQIW7tC95F4oGedOtTk882XZJr7xfUYuHbtjnw4ooD
 9GUyQzFTyoimaH0tV8rhfVuSz0K3J+yePASmpeEiFQNlRM0XbprodIrrVwObp10G1v0j
 Lh46UrNeAfTKcmiRhy0RSg7uRqypE4Bvqg2YYuilj76AnZgQEiD+STI0hKLfEcyjCNSD
 O+3aVN9ykDZ4b440sQ9osrHF8Nz/n4F7N4RhISDHJEkJcd54C/xBCad0kCf6re/rLMU8
 spqWIrLvGFv2nyrF4RiA0LNI9V2dUGDRQlkvIGjtfH37F4SsB5SlFH71iirUrvQuQuRu
 UkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755546420; x=1756151220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VQdRQK2xrCJNSgk4rlAaL1KBNDxU098DbOr/3KPziO0=;
 b=Yhlq0xI3PIO1LDaQMVdLf1SRnp4yR0N4AVHTc79v+WZZXUQMo28MG5ChmYFXQ3+b+O
 erTJk53zAamLz6yKdeWd3PgF120GK5MPvilCSmJUUx3K+8Q7ewIhSKYDvgk5AjtSzLmG
 ZAM77fMohDsUv7CxYJj2K2Li+PpxYwqfSrnfgzcwCnu6yYurzm2S/ZuWTV/Fnrb2y2K/
 E6TiHEc2pHqInBbeo9KY/l7IyKJ0OETuL7r/SUuJ6tMDeoGTglvWWmAQ+qKwI5Vwh0gs
 x++JGSSItD1s9kqsW26grni2UpailFu4sqnSqhGzUCrxRbFxo4lwzUwsulvRhbj/KqMB
 tQAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWms4bB0WgiFiKsmLIZW0MTzAx1s8XfPlUEt8DZJHCJ446TfLKSiM6K+k9lemwwxyYGOQ3Cy8vcCYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX2+KpVm67XgRkIorUDFuQTI90uxy+q32W/KCg3V+ugSuUAEXN
 l38ERRjYn/CFOKgHRTjaVl8A3dfPU/NbWyF5Aan4baKvi8g75SC4NZ5o4LsjEsPRvbCMn9iAU7y
 0UAS9Wf2rxT7F52GmEZkUrBXHC+kx/Yk=
X-Gm-Gg: ASbGncsmBwzToMErOR8Ksl2/YajkBTpVFyGQ/w2HOwkthIHciED3CRfdSQyoU0RFKBj
 rIrei+rghcucIFXMoQOkVHAvR+thju9VkWarEkM4/zhqj2BQh3p9hT19/sSKW4klbxPQMgHEieD
 lA8OZqr6hsE0fpYyhfoPHL+KzpJeqjyuq0NkmfrQUWI6bqFOtDbIfgYuwMIuxMEdmRlWzaYy6HQ
 T4T+qfeJex3eKJUi368jTfvAf3b8W1aEkTWWt4=
X-Google-Smtp-Source: AGHT+IGmPwDhs/ALH0s3WZ5UWEAII3RrvlSzfAhsrt+GGT0u1+KKTSWuKMp5nMZqHb6V6RwyaSnmvspBexfCuL32MQU=
X-Received: by 2002:a05:6870:b494:b0:30b:7fd0:893e with SMTP id
 586e51a60fabf-3110c2c792fmr74599fac.36.1755546420433; Mon, 18 Aug 2025
 12:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <f94151b4-893a-4758-a118-153076a20d3c@suse.de>
 <20250818192247.58322-1-krathul3152@gmail.com>
In-Reply-To: <20250818192247.58322-1-krathul3152@gmail.com>
From: Athul Raj K <krathul3152@gmail.com>
Date: Tue, 19 Aug 2025 01:16:48 +0530
X-Gm-Features: Ac12FXyAwGVkIIs9xFCJcRBza2SPyqtD2bM4zjcoqiohAK4LVjwZszVoWlZ2vUA
Message-ID: <CAPZGEKyhn1LLZQ7z04_u6pjTf9Uqy+ycH4t7xYMRe5dDR9Vg2Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm: Replace the deprecated DRM_* logging macros in
 gem helper files
To: tzimmermann@suse.de
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch, 
 skhan@linuxfoundation.org
Content-Type: multipart/alternative; boundary="000000000000c6d874063ca9005b"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000c6d874063ca9005b
Content-Type: text/plain; charset="UTF-8"

> @@ -858,7 +860,7 @@ long drm_gem_dma_resv_wait(struct drm_file *filep,
u32 handle,
>
>         obj = drm_gem_object_lookup(filep, handle);
>         if (!obj) {
> -               DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> +               drm_dbg_core(NULL, "Failed to look up GEM BO %d\n",
handle);
>                 return -EINVAL;
>        }
I missed this in the initial patch. Not sure if I should replace the NULL
with dev here by changing the function to accept dev from the caller.
I guess it will require changes to be made to the lima driver [1], Its not
a lot though.


[1] https://elixir.bootlin.com/linux/v6.17-rc1/A/ident/lima_gem_wait

On Tue, 19 Aug 2025 at 00:53, Athul Raj Kollareth <krathul3152@gmail.com>
wrote:

> Replace the DRM_* logging macros used in gem helper files with the
> appropriate
> ones specified in /include/drm/drm_print.h.
>
> Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
> ---
> Changes in v2:
>     - Change drm_gem_objects_lookup() to take a drm_device* argument.
>     - Make appropriate changes to all calls of drm_gem_objects_lookup().
> ---
>  drivers/accel/rocket/rocket_job.c       |  4 ++--
>  drivers/gpu/drm/drm_gem.c               | 12 +++++++-----
>  drivers/gpu/drm/drm_gem_dma_helper.c    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c |  2 +-
>  drivers/gpu/drm/v3d/v3d_submit.c        |  2 +-
>  drivers/gpu/drm/vc4/vc4_gem.c           |  2 +-
>  include/drm/drm_gem.h                   |  5 +++--
>  7 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/accel/rocket/rocket_job.c
> b/drivers/accel/rocket/rocket_job.c
> index 5d4afd692306..db7c50c9ab90 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -560,14 +560,14 @@ static int rocket_ioctl_submit_job(struct drm_device
> *dev, struct drm_file *file
>         if (ret)
>                 goto out_cleanup_job;
>
> -       ret = drm_gem_objects_lookup(file,
> u64_to_user_ptr(job->in_bo_handles),
> +       ret = drm_gem_objects_lookup(dev, file,
> u64_to_user_ptr(job->in_bo_handles),
>                                      job->in_bo_handle_count,
> &rjob->in_bos);
>         if (ret)
>                 goto out_cleanup_job;
>
>         rjob->in_bo_count = job->in_bo_handle_count;
>
> -       ret = drm_gem_objects_lookup(file,
> u64_to_user_ptr(job->out_bo_handles),
> +       ret = drm_gem_objects_lookup(dev, file,
> u64_to_user_ptr(job->out_bo_handles),
>                                      job->out_bo_handle_count,
> &rjob->out_bos);
>         if (ret)
>                 goto out_cleanup_job;
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 4a89b6acb6af..ee1e5ded6dd6 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
>         vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
>                                           GFP_KERNEL);
>         if (!vma_offset_manager) {
> -               DRM_ERROR("out of memory\n");
> +               drm_err(dev, "out of memory\n");
>                 return -ENOMEM;
>         }
>
> @@ -764,6 +764,7 @@ static int objects_lookup(struct drm_file *filp, u32
> *handle, int count,
>
>  /**
>   * drm_gem_objects_lookup - look up GEM objects from an array of handles
> + * @dev: corresponding drm_device
>   * @filp: DRM file private date
>   * @bo_handles: user pointer to array of userspace handle
>   * @count: size of handle array
> @@ -780,8 +781,9 @@ static int objects_lookup(struct drm_file *filp, u32
> *handle, int count,
>   * failure. 0 is returned on success.
>   *
>   */
> -int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> -                          int count, struct drm_gem_object ***objs_out)
> +int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
> +                          void __user *bo_handles, int count,
> +                          struct drm_gem_object ***objs_out)
>  {
>         int ret;
>         u32 *handles;
> @@ -805,7 +807,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void
> __user *bo_handles,
>
>         if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
>                 ret = -EFAULT;
> -               DRM_DEBUG("Failed to copy in GEM handles\n");
> +               drm_dbg_core(dev, "Failed to copy in GEM handles\n");
>                 goto out;
>         }
>
> @@ -858,7 +860,7 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32
> handle,
>
>         obj = drm_gem_object_lookup(filep, handle);
>         if (!obj) {
> -               DRM_DEBUG("Failed to look up GEM BO %d\n", handle);
> +               drm_dbg_core(NULL, "Failed to look up GEM BO %d\n",
> handle);
>                 return -EINVAL;
>         }
>
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c
> b/drivers/gpu/drm/drm_gem_dma_helper.c
> index 4f0320df858f..a507cf517015 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct
> drm_device *dev,
>
>         ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
>         if (ret) {
> -               DRM_ERROR("Failed to vmap PRIME buffer\n");
> +               drm_err(dev, "Failed to vmap PRIME buffer\n");
>                 return ERR_PTR(ret);
>         }
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
> b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 1ea6c509a5d5..3ffd9d5a9056 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -188,7 +188,7 @@ panfrost_lookup_bos(struct drm_device *dev,
>         if (!job->bo_count)
>                 return 0;
>
> -       ret = drm_gem_objects_lookup(file_priv,
> +       ret = drm_gem_objects_lookup(dev, file_priv,
>                                      (void __user
> *)(uintptr_t)args->bo_handles,
>                                      job->bo_count, &job->bos);
>         if (ret)
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
> b/drivers/gpu/drm/v3d/v3d_submit.c
> index 5171ffe9012d..a3ac8e6a4a72 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -79,7 +79,7 @@ v3d_lookup_bos(struct drm_device *dev,
>                 return -EINVAL;
>         }
>
> -       return drm_gem_objects_lookup(file_priv,
> +       return drm_gem_objects_lookup(dev, file_priv,
>                                       (void __user *)(uintptr_t)bo_handles,
>                                       job->bo_count, &job->bo);
>  }
> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> index 255e5817618e..6ce65611231b 100644
> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> @@ -692,7 +692,7 @@ vc4_cl_lookup_bos(struct drm_device *dev,
>                 return -EINVAL;
>         }
>
> -       ret = drm_gem_objects_lookup(file_priv,
> u64_to_user_ptr(args->bo_handles),
> +       ret = drm_gem_objects_lookup(dev, file_priv,
> u64_to_user_ptr(args->bo_handles),
>                                      exec->bo_count, &exec->bo);
>
>         if (ret)
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index d3a7b43e2c63..03cb03f46524 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -544,8 +544,9 @@ void drm_gem_unlock(struct drm_gem_object *obj);
>  int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
>  void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>
> -int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> -                          int count, struct drm_gem_object ***objs_out);
> +int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,
> +                          void __user *bo_handles, int count,
> +                          struct drm_gem_object ***objs_out);
>  struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32
> handle);
>  long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,
>                                     bool wait_all, unsigned long timeout);
> --
> 2.50.1
>
>

--000000000000c6d874063ca9005b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; @@ -858,7 +860,7 @@ long drm_gem_dma_resv_wait(s=
truct drm_file *filep, u32 handle,<br>&gt;=C2=A0<br>&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0obj =3D drm_gem_object_lookup(filep, handle);<br>&gt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj) {<br>&gt; -=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;Failed to look up GEM BO =
%d\n&quot;, handle);<br>&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_dbg_core(NULL, &quot;Failed to look up GEM BO %d\n&quot;, han=
dle);<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
return -EINVAL;<br>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></div>I missed this=
 in the initial patch. Not sure if I should replace the NULL with dev here =
by changing the function to accept dev from the caller.<br>I guess it will =
require changes to be made to the lima driver [1], Its not a lot though.<br=
><br><br><div>[1]=C2=A0<a href=3D"https://elixir.bootlin.com/linux/v6.17-rc=
1/A/ident/lima_gem_wait">https://elixir.bootlin.com/linux/v6.17-rc1/A/ident=
/lima_gem_wait</a></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 19 Aug 2025 at 00:53,=
 Athul Raj Kollareth &lt;<a href=3D"mailto:krathul3152@gmail.com">krathul31=
52@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Replace the DRM_* logging macros used in gem helper files with =
the appropriate<br>
ones specified in /include/drm/drm_print.h.<br>
<br>
Signed-off-by: Athul Raj Kollareth &lt;<a href=3D"mailto:krathul3152@gmail.=
com" target=3D"_blank">krathul3152@gmail.com</a>&gt;<br>
---<br>
Changes in v2:<br>
=C2=A0 =C2=A0 - Change drm_gem_objects_lookup() to take a drm_device* argum=
ent.<br>
=C2=A0 =C2=A0 - Make appropriate changes to all calls of drm_gem_objects_lo=
okup().<br>
---<br>
=C2=A0drivers/accel/rocket/rocket_job.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4=
 ++--<br>
=C2=A0drivers/gpu/drm/drm_gem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 12 +++++++-----<br>
=C2=A0drivers/gpu/drm/drm_gem_dma_helper.c=C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0drivers/gpu/drm/panfrost/panfrost_drv.c |=C2=A0 2 +-<br>
=C2=A0drivers/gpu/drm/v3d/v3d_submit.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2=
 +-<br>
=C2=A0drivers/gpu/drm/vc4/vc4_gem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0include/drm/drm_gem.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++--<br>
=C2=A07 files changed, 16 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocke=
t_job.c<br>
index 5d4afd692306..db7c50c9ab90 100644<br>
--- a/drivers/accel/rocket/rocket_job.c<br>
+++ b/drivers/accel/rocket/rocket_job.c<br>
@@ -560,14 +560,14 @@ static int rocket_ioctl_submit_job(struct drm_device =
*dev, struct drm_file *file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_cleanup_jo=
b;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_objects_lookup(file, u64_to_use=
r_ptr(job-&gt;in_bo_handles),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_objects_lookup(dev, file, u64_t=
o_user_ptr(job-&gt;in_bo_handles),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0job-&gt;in_bo_ha=
ndle_count, &amp;rjob-&gt;in_bos);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_cleanup_jo=
b;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rjob-&gt;in_bo_count =3D job-&gt;in_bo_handle_c=
ount;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_objects_lookup(file, u64_to_use=
r_ptr(job-&gt;out_bo_handles),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_objects_lookup(dev, file, u64_t=
o_user_ptr(job-&gt;out_bo_handles),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0job-&gt;out_bo_h=
andle_count, &amp;rjob-&gt;out_bos);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_cleanup_jo=
b;<br>
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c<br>
index 4a89b6acb6af..ee1e5ded6dd6 100644<br>
--- a/drivers/gpu/drm/drm_gem.c<br>
+++ b/drivers/gpu/drm/drm_gem.c<br>
@@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vma_offset_manager =3D drmm_kzalloc(dev, sizeof=
(*vma_offset_manager),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 G=
FP_KERNEL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!vma_offset_manager) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;out=
 of memory\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dev, &quot;=
out of memory\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -764,6 +764,7 @@ static int objects_lookup(struct drm_file *filp, u32 *h=
andle, int count,<br>
<br>
=C2=A0/**<br>
=C2=A0 * drm_gem_objects_lookup - look up GEM objects from an array of hand=
les<br>
+ * @dev: corresponding drm_device<br>
=C2=A0 * @filp: DRM file private date<br>
=C2=A0 * @bo_handles: user pointer to array of userspace handle<br>
=C2=A0 * @count: size of handle array<br>
@@ -780,8 +781,9 @@ static int objects_lookup(struct drm_file *filp, u32 *h=
andle, int count,<br>
=C2=A0 * failure. 0 is returned on success.<br>
=C2=A0 *<br>
=C2=A0 */<br>
-int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int count, struct drm_gem_object ***objs_out)<br>
+int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 void __user *bo_handles, int count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct drm_gem_object ***objs_out)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 *handles;<br>
@@ -805,7 +807,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void =
__user *bo_handles,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (copy_from_user(handles, bo_handles, count *=
 sizeof(u32))) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EFAULT;<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;Fai=
led to copy in GEM handles\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_core(dev, &=
quot;Failed to copy in GEM handles\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -858,7 +860,7 @@ long drm_gem_dma_resv_wait(struct drm_file *filep, u32 =
handle,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 obj =3D drm_gem_object_lookup(filep, handle);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!obj) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;Fai=
led to look up GEM BO %d\n&quot;, handle);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_core(NULL, =
&quot;Failed to look up GEM BO %d\n&quot;, handle);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem=
_dma_helper.c<br>
index 4f0320df858f..a507cf517015 100644<br>
--- a/drivers/gpu/drm/drm_gem_dma_helper.c<br>
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c<br>
@@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_devic=
e *dev,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dma_buf_vmap_unlocked(attach-&gt;dmabuf=
, &amp;map);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Fai=
led to vmap PRIME buffer\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_err(dev, &quot;=
Failed to vmap PRIME buffer\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ERR_PTR(ret)=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panf=
rost/panfrost_drv.c<br>
index 1ea6c509a5d5..3ffd9d5a9056 100644<br>
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c<br>
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c<br>
@@ -188,7 +188,7 @@ panfrost_lookup_bos(struct drm_device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!job-&gt;bo_count)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_objects_lookup(file_priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_objects_lookup(dev, file_priv,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void __user *)(=
uintptr_t)args-&gt;bo_handles,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0job-&gt;bo_count=
, &amp;job-&gt;bos);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_sub=
mit.c<br>
index 5171ffe9012d..a3ac8e6a4a72 100644<br>
--- a/drivers/gpu/drm/v3d/v3d_submit.c<br>
+++ b/drivers/gpu/drm/v3d/v3d_submit.c<br>
@@ -79,7 +79,7 @@ v3d_lookup_bos(struct drm_device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_gem_objects_lookup(file_priv,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return drm_gem_objects_lookup(dev, file_priv,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void __user *)=
(uintptr_t)bo_handles,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 job-&gt;bo_coun=
t, &amp;job-&gt;bo);<br>
=C2=A0}<br>
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c<=
br>
index 255e5817618e..6ce65611231b 100644<br>
--- a/drivers/gpu/drm/vc4/vc4_gem.c<br>
+++ b/drivers/gpu/drm/vc4/vc4_gem.c<br>
@@ -692,7 +692,7 @@ vc4_cl_lookup_bos(struct drm_device *dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_objects_lookup(file_priv, u64_t=
o_user_ptr(args-&gt;bo_handles),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D drm_gem_objects_lookup(dev, file_priv, =
u64_to_user_ptr(args-&gt;bo_handles),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec-&gt;bo_coun=
t, &amp;exec-&gt;bo);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h<br>
index d3a7b43e2c63..03cb03f46524 100644<br>
--- a/include/drm/drm_gem.h<br>
+++ b/include/drm/drm_gem.h<br>
@@ -544,8 +544,9 @@ void drm_gem_unlock(struct drm_gem_object *obj);<br>
=C2=A0int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);<=
br>
=C2=A0void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map=
);<br>
<br>
-int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int count, struct drm_gem_object ***objs_out);<br>
+int drm_gem_objects_lookup(struct drm_device *dev, struct drm_file *filp,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 void __user *bo_handles, int count,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct drm_gem_object ***objs_out);<br>
=C2=A0struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u=
32 handle);<br>
=C2=A0long drm_gem_dma_resv_wait(struct drm_file *filep, u32 handle,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool wait_all, unsigne=
d long timeout);<br>
-- <br>
2.50.1<br>
<br>
</blockquote></div>

--000000000000c6d874063ca9005b--
