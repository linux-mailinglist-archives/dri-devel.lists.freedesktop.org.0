Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669AAA49E7D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4811310ECE7;
	Fri, 28 Feb 2025 16:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a32jXtvo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1C310ECE7
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740759326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tJBP22NIQKLsoInra8kyAa+PT8kmIgVTjleT7qAY5Sk=;
 b=a32jXtvoBUgPqgq4/RncTQBwONDg9zkNZ0Uj0YE/z+qF6qDrYBT7LhWz4sl58NS5XtEbvB
 SW3iEhk0/stJU99vNw8Zdl8FvUJo8TCBaZmLV99wfftRJOYBZ5xiXKhmvqQ3pNzpD8yxXi
 PH+dRVVbl1tLbPSRh2Ct4nod5X0bZ4k=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-DaLIKTJrNleTBLe56xo-PQ-1; Fri, 28 Feb 2025 11:15:25 -0500
X-MC-Unique: DaLIKTJrNleTBLe56xo-PQ-1
X-Mimecast-MFC-AGG-ID: DaLIKTJrNleTBLe56xo-PQ_1740759325
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6f4348c854eso32023247b3.2
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740759324; x=1741364124;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tJBP22NIQKLsoInra8kyAa+PT8kmIgVTjleT7qAY5Sk=;
 b=vzMN3HdIp5oLkUj/vN9bFHarKluUwPH9lD4t9Xcyn5RZmO2xJwzHVNBwKTx4px7B1C
 YdkAagAa/UfpeoKBzreWJMOV7eqMjftAD03Zz5fftD2ZpTX/cP9bRNYKkCPwLdCHI6z+
 6TiU2AFxHjzznjYpC4adgzNc7xX6DkOHYuycALrJiq6cB2dkoyyOq/8u7BHST0JzuB1M
 0u6zG4ebir0m5dWy2KDgorqpM3upe6YDVX3Zrdp4Lyt3F4BunkH5zT8fiyKHZO6wGfvp
 /8GEOl7ZuPHkgRJrr5fa0SPjBhoz+s/TyzXqoFEm9HeVXgpl135dyQ0rLROIOmGQYE2L
 oG4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUegDrU2CTP6hRqHeH5LA3cTb1ehmOtLbeZId0Iptg2vLCqbseDVZYMRh1LzSv/mJLUTxmKQZjQDXc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbaNeIIXkvK939+Kp8TqDo9OcHHxbckGtsed5fAZJqYhDHM1+S
 HyrZsYEAXfvBzifVdVw4varDHNids6qxxToh9aJt8mAIJ1jGirbQC8zy2e3NBrFvHB8sy6P9H7e
 OsfVYIbW2aJ3LpZ9002uBLz+BKQVOKYpPAzbreAZvPHiFcXVK9eSJTrM1TjMuGbvTRDLZ4l7s/E
 jME/5h6Jbx7Ysw/oA+9DByZmYm7qna4nBpPGsOjA8q
X-Gm-Gg: ASbGncvxB9dHLgrWSRmzR6Z3sZn1zTxFX46hmjgGYabXmz9lT+e8JjpK3LiyZCj1oBd
 HfMDtW6ETCUsJ0roBRfgxH6Mq/+rcagRAKfeaRkzbpa3dVRHuLUqdVxL/TJJrsxZg9H1CRPQ=
X-Received: by 2002:a05:690c:680f:b0:6ef:4fba:8137 with SMTP id
 00721157ae682-6fd49f8699amr56138737b3.6.1740759324473; 
 Fri, 28 Feb 2025 08:15:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoe/J1J/k5BWL3KYy0DXkg4gwMNc8T5aPKNAccJCkW742k+tWqdlqWrBUSCKxxg0DoVUmgdyW3iGzujrWX/+Y=
X-Received: by 2002:a05:690c:680f:b0:6ef:4fba:8137 with SMTP id
 00721157ae682-6fd49f8699amr56138187b3.6.1740759323952; Fri, 28 Feb 2025
 08:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-5-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-5-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:15:13 -0500
X-Gm-Features: AQ5f1JrPoU2VXVFxT4_KITyLicSr2KxGk9RtVzUYV6_Y7tsMfUsD8QwkUeKvWgE
Message-ID: <CAN9Xe3Rtao-K-QQ4T2twoF5VCd6rhxiiepmBT5CnDwbVYK-CbQ@mail.gmail.com>
Subject: Re: [PATCH 04/10] drm/gem-shmem: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mbLPRqD920LcbIdKe13efcrphCdz88mg2JCW5odfL_0_1740759325
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000024e2f3062f361d86"
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

--00000000000024e2f3062f361d86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de>
wrote:

> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 24 ++++++++++++------------
>  include/drm/drm_gem_shmem_helper.h     |  2 +-
>  2 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
> b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 5ab351409312..7722cd720248 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -160,7 +160,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object
> *shmem)
>  {
>         struct drm_gem_object *obj =3D &shmem->base;
>
> -       if (obj->import_attach) {
> +       if (drm_gem_is_imported(obj)) {
>                 drm_prime_gem_destroy(obj, shmem->sgt);
>         } else {
>                 dma_resv_lock(shmem->base.resv, NULL);
> @@ -255,7 +255,7 @@ int drm_gem_shmem_pin_locked(struct
> drm_gem_shmem_object *shmem)
>
>         dma_resv_assert_held(shmem->base.resv);
>
> -       drm_WARN_ON(shmem->base.dev, shmem->base.import_attach);
> +       drm_WARN_ON(shmem->base.dev, drm_gem_is_imported(&shmem->base));
>
>         ret =3D drm_gem_shmem_get_pages(shmem);
>
> @@ -286,7 +286,7 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object
> *shmem)
>         struct drm_gem_object *obj =3D &shmem->base;
>         int ret;
>
> -       drm_WARN_ON(obj->dev, obj->import_attach);
> +       drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
>
>         ret =3D dma_resv_lock_interruptible(shmem->base.resv, NULL);
>         if (ret)
> @@ -309,7 +309,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object
> *shmem)
>  {
>         struct drm_gem_object *obj =3D &shmem->base;
>
> -       drm_WARN_ON(obj->dev, obj->import_attach);
> +       drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
>
>         dma_resv_lock(shmem->base.resv, NULL);
>         drm_gem_shmem_unpin_locked(shmem);
> @@ -338,7 +338,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object
> *shmem,
>         struct drm_gem_object *obj =3D &shmem->base;
>         int ret =3D 0;
>
> -       if (obj->import_attach) {
> +       if (drm_gem_is_imported(obj)) {
>                 ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
>                 if (!ret) {
>                         if (drm_WARN_ON(obj->dev, map->is_iomem)) {
> @@ -378,7 +378,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object
> *shmem,
>         return 0;
>
>  err_put_pages:
> -       if (!obj->import_attach)
> +       if (!drm_gem_is_imported(obj))
>                 drm_gem_shmem_put_pages(shmem);
>  err_zero_use:
>         shmem->vmap_use_count =3D 0;
> @@ -404,7 +404,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object
> *shmem,
>  {
>         struct drm_gem_object *obj =3D &shmem->base;
>
> -       if (obj->import_attach) {
> +       if (drm_gem_is_imported(obj)) {
>                 dma_buf_vunmap(obj->import_attach->dmabuf, map);
>         } else {
>                 dma_resv_assert_held(shmem->base.resv);
> @@ -566,7 +566,7 @@ static void drm_gem_shmem_vm_open(struct
> vm_area_struct *vma)
>         struct drm_gem_object *obj =3D vma->vm_private_data;
>         struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
>
> -       drm_WARN_ON(obj->dev, obj->import_attach);
> +       drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
>
>         dma_resv_lock(shmem->base.resv, NULL);
>
> @@ -618,7 +618,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object
> *shmem, struct vm_area_struct
>         struct drm_gem_object *obj =3D &shmem->base;
>         int ret;
>
> -       if (obj->import_attach) {
> +       if (drm_gem_is_imported(obj)) {
>                 /* Reset both vm_ops and vm_private_data, so we don't end
> up with
>                  * vm_ops pointing to our implementation if the dma-buf
> backend
>                  * doesn't set those fields.
> @@ -663,7 +663,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);
>  void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
>                               struct drm_printer *p, unsigned int indent)
>  {
> -       if (shmem->base.import_attach)
> +       if (drm_gem_is_imported(&shmem->base))
>                 return;
>
>         drm_printf_indent(p, indent, "pages_use_count=3D%u\n",
> shmem->pages_use_count);
> @@ -690,7 +690,7 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct
> drm_gem_shmem_object *shmem)
>  {
>         struct drm_gem_object *obj =3D &shmem->base;
>
> -       drm_WARN_ON(obj->dev, obj->import_attach);
> +       drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
>
>         return drm_prime_pages_to_sg(obj->dev, shmem->pages, obj->size >>
> PAGE_SHIFT);
>  }
> @@ -705,7 +705,7 @@ static struct sg_table
> *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>         if (shmem->sgt)
>                 return shmem->sgt;
>
> -       drm_WARN_ON(obj->dev, obj->import_attach);
> +       drm_WARN_ON(obj->dev, drm_gem_is_imported(obj));
>
>         ret =3D drm_gem_shmem_get_pages(shmem);
>         if (ret)
> diff --git a/include/drm/drm_gem_shmem_helper.h
> b/include/drm/drm_gem_shmem_helper.h
> index d22e3fb53631..cef5a6b5a4d6 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -120,7 +120,7 @@ static inline bool drm_gem_shmem_is_purgeable(struct
> drm_gem_shmem_object *shmem
>  {
>         return (shmem->madv > 0) &&
>                 !shmem->vmap_use_count && shmem->sgt &&
> -               !shmem->base.dma_buf && !shmem->base.import_attach;
> +               !shmem->base.dma_buf && !drm_gem_is_imported(&shmem->base=
);
>  }
>
> Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

>  void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);
> --
> 2.48.1
>
>

--00000000000024e2f3062f361d86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26,=
 2025 at 12:28=E2=80=AFPM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmerma=
nn@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Instead of testing import_attach for impor=
ted GEM buffers, invoke<br>
drm_gem_is_imported() to do the test.<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de"=
 target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_gem_shmem_helper.c | 24 ++++++++++++------------<=
br>
=C2=A0include/drm/drm_gem_shmem_helper.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br=
>
=C2=A02 files changed, 13 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_g=
em_shmem_helper.c<br>
index 5ab351409312..7722cd720248 100644<br>
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c<br>
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c<br>
@@ -160,7 +160,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *sh=
mem)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D &amp;shmem-&gt;b=
ase;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj-&gt;import_attach) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_gem_is_imported(obj)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_prime_gem_destr=
oy(obj, shmem-&gt;sgt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_resv_lock(shmem=
-&gt;base.resv, NULL);<br>
@@ -255,7 +255,7 @@ int drm_gem_shmem_pin_locked(struct drm_gem_shmem_objec=
t *shmem)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_resv_assert_held(shmem-&gt;base.resv);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(shmem-&gt;<a href=3D"http://base.de=
v" rel=3D"noreferrer" target=3D"_blank">base.dev</a>, shmem-&gt;base.import=
_attach);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(shmem-&gt;<a href=3D"http://base.de=
v" rel=3D"noreferrer" target=3D"_blank">base.dev</a>, drm_gem_is_imported(&=
amp;shmem-&gt;base));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D drm_gem_shmem_get_pages(shmem);<br>
<br>
@@ -286,7 +286,7 @@ int drm_gem_shmem_pin(struct drm_gem_shmem_object *shme=
m)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D &amp;shmem-&gt;b=
ase;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, obj-&gt;import_attach)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, drm_gem_is_imported(ob=
j));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dma_resv_lock_interruptible(shmem-&gt;b=
ase.resv, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
@@ -309,7 +309,7 @@ void drm_gem_shmem_unpin(struct drm_gem_shmem_object *s=
hmem)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D &amp;shmem-&gt;b=
ase;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, obj-&gt;import_attach)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, drm_gem_is_imported(ob=
j));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_resv_lock(shmem-&gt;base.resv, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_gem_shmem_unpin_locked(shmem);<br>
@@ -338,7 +338,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shm=
em,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D &amp;shmem-&gt;b=
ase;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj-&gt;import_attach) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_gem_is_imported(obj)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dma_buf_vma=
p(obj-&gt;import_attach-&gt;dmabuf, map);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (drm_WARN_ON(obj-&gt;dev, map-&gt;is_iomem)) {<br>
@@ -378,7 +378,7 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shm=
em,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
=C2=A0err_put_pages:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!obj-&gt;import_attach)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_gem_is_imported(obj))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_gem_shmem_put_p=
ages(shmem);<br>
=C2=A0err_zero_use:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 shmem-&gt;vmap_use_count =3D 0;<br>
@@ -404,7 +404,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *=
shmem,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D &amp;shmem-&gt;b=
ase;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj-&gt;import_attach) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_gem_is_imported(obj)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_buf_vunmap(obj-=
&gt;import_attach-&gt;dmabuf, map);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_resv_assert_hel=
d(shmem-&gt;base.resv);<br>
@@ -566,7 +566,7 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct=
 *vma)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D vma-&gt;vm_priva=
te_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_shmem_object *shmem =3D to_drm_g=
em_shmem_obj(obj);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, obj-&gt;import_attach)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, drm_gem_is_imported(ob=
j));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_resv_lock(shmem-&gt;base.resv, NULL);<br>
<br>
@@ -618,7 +618,7 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shm=
em, struct vm_area_struct<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D &amp;shmem-&gt;b=
ase;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj-&gt;import_attach) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_gem_is_imported(obj)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Reset both vm_op=
s and vm_private_data, so we don&#39;t end up with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* vm_ops poin=
ting to our implementation if the dma-buf backend<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* doesn&#39;t=
 set those fields.<br>
@@ -663,7 +663,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_mmap);<br>
=C2=A0void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shme=
m,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_printer *p, unsigned int indent)=
<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (shmem-&gt;base.import_attach)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_gem_is_imported(&amp;shmem-&gt;base))<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_printf_indent(p, indent, &quot;pages_use_co=
unt=3D%u\n&quot;, shmem-&gt;pages_use_count);<br>
@@ -690,7 +690,7 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_=
gem_shmem_object *shmem)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D &amp;shmem-&gt;b=
ase;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, obj-&gt;import_attach)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, drm_gem_is_imported(ob=
j));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return drm_prime_pages_to_sg(obj-&gt;dev, shmem=
-&gt;pages, obj-&gt;size &gt;&gt; PAGE_SHIFT);<br>
=C2=A0}<br>
@@ -705,7 +705,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_loc=
ked(struct drm_gem_shmem_<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (shmem-&gt;sgt)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return shmem-&gt;sg=
t;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, obj-&gt;import_attach)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_WARN_ON(obj-&gt;dev, drm_gem_is_imported(ob=
j));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D drm_gem_shmem_get_pages(shmem);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem=
_helper.h<br>
index d22e3fb53631..cef5a6b5a4d6 100644<br>
--- a/include/drm/drm_gem_shmem_helper.h<br>
+++ b/include/drm/drm_gem_shmem_helper.h<br>
@@ -120,7 +120,7 @@ static inline bool drm_gem_shmem_is_purgeable(struct dr=
m_gem_shmem_object *shmem<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (shmem-&gt;madv &gt; 0) &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !shmem-&gt;vmap_use=
_count &amp;&amp; shmem-&gt;sgt &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!shmem-&gt;base.dma=
_buf &amp;&amp; !shmem-&gt;base.import_attach;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!shmem-&gt;base.dma=
_buf &amp;&amp; !drm_gem_is_imported(&amp;shmem-&gt;base);<br>
=C2=A0}<br>
<br></blockquote><div>Reviewed-by: Anusha Srivatsa &lt;<a href=3D"mailto:as=
rivats@redhat.com">asrivats@redhat.com</a>&gt; <br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A0void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem);<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--00000000000024e2f3062f361d86--

