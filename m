Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5328C0786
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 01:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87969113259;
	Wed,  8 May 2024 23:10:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="BZv/L40z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8362F10EF83
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 23:10:06 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a59b49162aeso57696766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 16:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1715209805; x=1715814605;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L7h/LLjAhtUKsGcFMQEShp70Fa7v2+0gdvzYPKKzz8g=;
 b=BZv/L40zjYhKdd+iKjCiscinWwqiXarlSBgdRD2GMu9HSFOMMbGqZC+iBI3/zXF53+
 lPHFreEbVTeMQ59nAnP57YsWB+F+eihfqmnVTJO6cUdKclwSSkkGavNWv8ronSyMpqWA
 NaXvQQsrmBswPcr82Y8h9RN0tEZ/g3XAHUk72YvoTKFk/AklFNWbgeRvU/jv6ec1GuaC
 7rlVhmsjiam0YCNQWIJcDhryfw3uD02fK7O2ul5BkS0jrk23I+ZeB4H+jra1oRuUjCtJ
 KnXHX4XMeP+num4Bcx3FlK74KMGIp+231UWj2pmV9ZjQz+EgOn3kRqkGgFr6JtEKvkUA
 bKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715209805; x=1715814605;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7h/LLjAhtUKsGcFMQEShp70Fa7v2+0gdvzYPKKzz8g=;
 b=QO7EqwMFBsqI6hd9s7kczEi8WnMlLbYxCJnAWyIGEsXhMTvzOaEDtOd0mxNT6T0z2Z
 vyZTPVLPgAjunliPAXpAdWJYjXQKpuK6qNRvrY5+BSOunDSkFUPV+7SwE2EDr7VFHFoP
 my6SoAxL03e1jkqDTe1FbWfQgkOoiyxoVMNWRj1f3YgqXfz5l2BlnBUd6eXmqIRsZOXO
 hw4Ml/HFQ/FwhAtE1auDxbr58wlVz1GI4rLkTlHwBMKgajmTbrStQttswc8Q94YoJLIR
 n3LjzqDzLJMCwUygS4ghssAl9mInPKAXQBWjOu2K68YG6lrtdc61ZYfaeOvuexTN81Pb
 +Hhg==
X-Gm-Message-State: AOJu0YxP8yZRQcEpyBE7PeXv39USPHVqKeKKaSUNTz0vrBCig4o2GeIL
 wEFX9cUXocp6HDj2AQjuTYgDnwOhon5pb8Ep1habaCqok8HN+KL6Y7rwyel84jcqDy3cAr8eRYT
 LfeLU9eJZmEm8MU7tiNRL5ik8x7XzuEECfKBMqw==
X-Google-Smtp-Source: AGHT+IHsyqqvQqXypKQlDBlSjCWPnNJkUonWEkNimtmnlBo0wg9zfFgGS4fGdYgZoXKpR9cq+1NFpiJSVWjgSRPJ3GA=
X-Received: by 2002:a50:8ac8:0:b0:572:9b20:fa with SMTP id
 4fb4d7f45d1cf-5731da6b2d5mr2813802a12.33.1715209804360; 
 Wed, 08 May 2024 16:10:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240508230624.7598-1-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20240508230624.7598-1-mohamedahmedegypt2001@gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Wed, 8 May 2024 18:09:52 -0500
Message-ID: <CAOFGe96aGP=kkyCr+Fy-N4_uXNLb-raLARLG7GMiicfyAkhn-w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com, 
 nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000001ac80b0617f96742"
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

--0000000000001ac80b0617f96742
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 6:06=E2=80=AFPM Mohamed Ahmed <
mohamedahmedegypt2001@gmail.com> wrote:

> Allows PTE kind and tile mode on BO create with VM_BIND,
> and adds a GETPARAM to indicate this change. This is needed to support
> modifiers in NVK and ensure correctness when dealing with the nouveau
> GL driver.
>
> The userspace modifiers implementation this is for can be found here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28843
>
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c |  3 ++
>  drivers/gpu/drm/nouveau/nouveau_bo.c    | 45 +++++++++++--------------
>  include/uapi/drm/nouveau_drm.h          |  7 ++++
>  3 files changed, 30 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 80f74ee0f..47e53e17b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -272,6 +272,9 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>                 getparam->value =3D
> (u64)ttm_resource_manager_usage(vram_mgr);
>                 break;
>         }
> +       case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:
> +               getparam->value =3D 1;
> +               break;
>         default:
>                 NV_PRINTK(dbg, cli, "unknown parameter %lld\n",
> getparam->param);
>                 return -EINVAL;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index db8cbf615..583c962ef 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -241,28 +241,29 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size=
,
> int *align, u32 domain,
>         }
>
>         nvbo->contig =3D !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
> -       if (!nouveau_cli_uvmm(cli) || internal) {
> -               /* for BO noVM allocs, don't assign kinds */
> -               if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_FERMI)=
 {
> -                       nvbo->kind =3D (tile_flags & 0x0000ff00) >> 8;
> -                       if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> -                               kfree(nvbo);
> -                               return ERR_PTR(-EINVAL);
> -                       }
>
> -                       nvbo->comp =3D mmu->kind[nvbo->kind] !=3D nvbo->k=
ind;
> -               } else if (cli->device.info.family >=3D
> NV_DEVICE_INFO_V0_TESLA) {
> -                       nvbo->kind =3D (tile_flags & 0x00007f00) >> 8;
> -                       nvbo->comp =3D (tile_flags & 0x00030000) >> 16;
> -                       if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> -                               kfree(nvbo);
> -                               return ERR_PTR(-EINVAL);
> -                       }
> -               } else {
> -                       nvbo->zeta =3D (tile_flags & 0x00000007);
> +       /* for BO allocs, don't assign kinds */
>

I think this comment is stale. We're now assigning them in both cases.


> +       if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_FERMI) {
> +               nvbo->kind =3D (tile_flags & 0x0000ff00) >> 8;
> +               if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +                       kfree(nvbo);
> +                       return ERR_PTR(-EINVAL);
> +               }
> +
> +               nvbo->comp =3D mmu->kind[nvbo->kind] !=3D nvbo->kind;
> +       } else if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_TESLA) =
{
> +               nvbo->kind =3D (tile_flags & 0x00007f00) >> 8;
> +               nvbo->comp =3D (tile_flags & 0x00030000) >> 16;
> +               if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> +                       kfree(nvbo);
> +                       return ERR_PTR(-EINVAL);
>                 }
> -               nvbo->mode =3D tile_mode;
> +       } else {
> +               nvbo->zeta =3D (tile_flags & 0x00000007);
> +       }
> +       nvbo->mode =3D tile_mode;
>
> +       if (!nouveau_cli_uvmm(cli) || internal) {
>                 /* Determine the desirable target GPU page size for the
> buffer. */
>                 for (i =3D 0; i < vmm->page_nr; i++) {
>                         /* Because we cannot currently allow VMM maps to
> fail
> @@ -304,12 +305,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size,
> int *align, u32 domain,
>                 }
>                 nvbo->page =3D vmm->page[pi].shift;
>         } else {
> -               /* reject other tile flags when in VM mode. */
> -               if (tile_mode)
> -                       return ERR_PTR(-EINVAL);
> -               if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
> -                       return ERR_PTR(-EINVAL);
> -
>                 /* Determine the desirable target GPU page size for the
> buffer. */
>                 for (i =3D 0; i < vmm->page_nr; i++) {
>                         /* Because we cannot currently allow VMM maps to
> fail
> diff --git a/include/uapi/drm/nouveau_drm.h
> b/include/uapi/drm/nouveau_drm.h
> index cd84227f1..5402f77ee 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -68,6 +68,13 @@ extern "C" {
>   */
>  #define NOUVEAU_GETPARAM_VRAM_USED 19
>
> +/*
> + * NOUVEAU_GETPARAM_HAS_VMA_TILEMODE
> + *
> + * Query whether tile mode and PTE kind are accepted with VM allocs or
> not.
> + */
> +#define NOUVEAU_GETPARAM_HAS_VMA_TILEMODE 20
> +
>  struct drm_nouveau_getparam {
>         __u64 param;
>         __u64 value;
> --
> 2.44.0
>
>

--0000000000001ac80b0617f96742
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, May 8, 2024 at 6:06=E2=80=AFPM Mohamed Ahmed &lt;<a href=3D"=
mailto:mohamedahmedegypt2001@gmail.com">mohamedahmedegypt2001@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Allo=
ws PTE kind and tile mode on BO create with VM_BIND,<br>
and adds a GETPARAM to indicate this change. This is needed to support<br>
modifiers in NVK and ensure correctness when dealing with the nouveau<br>
GL driver.<br>
<br>
The userspace modifiers implementation this is for can be found here:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28843"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/m=
esa/-/merge_requests/28843</a><br>
<br>
Fixes: b88baab82871 (&quot;drm/nouveau: implement new VM_BIND uAPI&quot;)<b=
r>
Signed-off-by: Mohamed Ahmed &lt;<a href=3D"mailto:mohamedahmedegypt2001@gm=
ail.com" target=3D"_blank">mohamedahmedegypt2001@gmail.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c |=C2=A0 3 ++<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_bo.c=C2=A0 =C2=A0 | 45 +++++++++++---=
-----------<br>
=C2=A0include/uapi/drm/nouveau_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 7 ++++<br>
=C2=A03 files changed, 30 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouv=
eau/nouveau_abi16.c<br>
index 80f74ee0f..47e53e17b 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c<br>
@@ -272,6 +272,9 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getparam-&gt;value =
=3D (u64)ttm_resource_manager_usage(vram_mgr);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getparam-&gt;value =
=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NV_PRINTK(dbg, cli,=
 &quot;unknown parameter %lld\n&quot;, getparam-&gt;param);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau=
/nouveau_bo.c<br>
index db8cbf615..583c962ef 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
@@ -241,28 +241,29 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, =
int *align, u32 domain,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nvbo-&gt;contig =3D !(tile_flags &amp; NOUVEAU_=
GEM_TILE_NONCONTIG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nouveau_cli_uvmm(cli) || internal) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* for BO noVM allo=
cs, don&#39;t assign kinds */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cli-&gt;device.=
info.family &gt;=3D NV_DEVICE_INFO_V0_FERMI) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nvbo-&gt;kind =3D (tile_flags &amp; 0x0000ff00) &gt;&gt; 8;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!nvif_mmu_kind_valid(mmu, nvbo-&gt;kind)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(nvbo);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINVAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nvbo-&gt;comp =3D mmu-&gt;kind[nvbo-&gt;kind] !=3D nvbo-&gt;kind;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (cli-&gt;=
device.info.family &gt;=3D NV_DEVICE_INFO_V0_TESLA) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nvbo-&gt;kind =3D (tile_flags &amp; 0x00007f00) &gt;&gt; 8;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nvbo-&gt;comp =3D (tile_flags &amp; 0x00030000) &gt;&gt; 16;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!nvif_mmu_kind_valid(mmu, nvbo-&gt;kind)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(nvbo);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINVAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nvbo-&gt;zeta =3D (tile_flags &amp; 0x00000007);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* for BO allocs, don&#39;t assign kinds */<br>=
</blockquote><div><br></div><div>I think this comment is stale. We&#39;re n=
ow assigning them in both cases.<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (cli-&gt;device.info.family &gt;=3D NV_DEVIC=
E_INFO_V0_FERMI) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;kind =3D (=
tile_flags &amp; 0x0000ff00) &gt;&gt; 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nvif_mmu_kind_=
valid(mmu, nvbo-&gt;kind)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kfree(nvbo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ERR_PTR(-EINVAL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;comp =3D m=
mu-&gt;kind[nvbo-&gt;kind] !=3D nvbo-&gt;kind;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (cli-&gt;device.info.family &gt;=3D N=
V_DEVICE_INFO_V0_TESLA) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;kind =3D (=
tile_flags &amp; 0x00007f00) &gt;&gt; 8;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;comp =3D (=
tile_flags &amp; 0x00030000) &gt;&gt; 16;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nvif_mmu_kind_=
valid(mmu, nvbo-&gt;kind)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kfree(nvbo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ERR_PTR(-EINVAL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;mode =3D t=
ile_mode;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;zeta =3D (=
tile_flags &amp; 0x00000007);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;mode =3D tile_mode;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nouveau_cli_uvmm(cli) || internal) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Determine the de=
sirable target GPU page size for the buffer. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; vmm-&gt;page_nr; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Because we cannot currently allow VMM maps to fail<br>
@@ -304,12 +305,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, i=
nt *align, u32 domain,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvbo-&gt;page =3D v=
mm-&gt;page[pi].shift;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* reject other til=
e flags when in VM mode. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tile_mode)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ERR_PTR(-EINVAL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tile_flags &amp=
; ~NOUVEAU_GEM_TILE_NONCONTIG)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ERR_PTR(-EINVAL);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Determine the de=
sirable target GPU page size for the buffer. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; vmm-&gt;page_nr; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Because we cannot currently allow VMM maps to fail<br>
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.=
h<br>
index cd84227f1..5402f77ee 100644<br>
--- a/include/uapi/drm/nouveau_drm.h<br>
+++ b/include/uapi/drm/nouveau_drm.h<br>
@@ -68,6 +68,13 @@ extern &quot;C&quot; {<br>
=C2=A0 */<br>
=C2=A0#define NOUVEAU_GETPARAM_VRAM_USED 19<br>
<br>
+/*<br>
+ * NOUVEAU_GETPARAM_HAS_VMA_TILEMODE<br>
+ *<br>
+ * Query whether tile mode and PTE kind are accepted with VM allocs or not=
.<br>
+ */<br>
+#define NOUVEAU_GETPARAM_HAS_VMA_TILEMODE 20<br>
+<br>
=C2=A0struct drm_nouveau_getparam {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 param;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 value;<br>
-- <br>
2.44.0<br>
<br>
</blockquote></div></div>

--0000000000001ac80b0617f96742--
