Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6AA8C17FA
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 22:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48AB10E4D2;
	Thu,  9 May 2024 20:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="RG6urzO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300C610E432
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 20:53:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51f1b378ca5so2361962e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1715288019; x=1715892819;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hsdKLyFRXi0PhE0lQ+OD+VKcW2Zb/orGxaFKrvllOX0=;
 b=RG6urzO5edyAA53/27KNtmNyXBDXTD8vYhZdfvlrM72uE3Hd+3fQ02f3DrCXdvICyy
 Z+JFpjhqH7ljXB0r3DgPjeboyoiQNksW/sKqKWmEyqU9OmrI7YlTtOg3iN+vnwwxb0F5
 G5j+j64Dj5b9N+wV0aEE48KyrluqoeTXcVLIcRem/ve/naSuC0WRUm6hDe7s/7bHDIGb
 tAsNUcHP+0UJCCt4n6g1rEVH3KjxczHzyKYiAfXJj/UDiMraYQaCHhu7bkXWzsX0yeQt
 pfGWno1Ig2ZpyS2SLwfmyNTiSCzTdgvaB7inre3HiTFaBlhT2PuLS3ZuYXL0R1iKd0Jz
 jBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715288019; x=1715892819;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hsdKLyFRXi0PhE0lQ+OD+VKcW2Zb/orGxaFKrvllOX0=;
 b=EFhWjgEEhUKrVk7pnI91MlofbfDo/VeWqM2rlWHoDr/tQt6UG76UcqFAhoM004jwpy
 Atc3/eHRPr+7T+1NaDeiW8mCejEE3a5/zwR1DGN7GICkchrhrdKHYTz5Uos9Fv06meNb
 rOHPPeMY7aEgOnm7sCF+mYINiPH3Yp7o8rN9ugxeFdYHwsRRQsorBHpRg4N4UGnJqBox
 O5nQdGtGdiiNaDUCrQXrTNg8twWTUx36ySeap9Ja0smh9OXPUoqEX33C9kD4iAsbqSca
 gAGxNrV1hNTOk+kU/24ecHwHfXZSKjhasJLAn7gWQ93ZRsEd/7Lrg7/ETv8o0sbPLGy7
 JDZw==
X-Gm-Message-State: AOJu0Yys16Y/OFtkbdGYHDHzx15eBSlQm33QACgIbJK+S+0y2Mwp93N9
 4I7KApxE4h8IwqAjmY4OeSD46JhxE6Ungy1QufGB8bjzeu3Jrx/T8GLlIZip3W6QQSS0Owa/2Xa
 kmtDBTHUBtoiQTdzrSUJDYKB6Pht2B+2tvlZYiQ==
X-Google-Smtp-Source: AGHT+IEC8tzqcPtgphmfPUrpMIcWB3dSK5vB5ED/4H07T0QVM7Cna/CN2ebl23JvKdXa/awQk+mbAnL+++Ta7ktHZb0=
X-Received: by 2002:ac2:495a:0:b0:51f:3f6c:7463 with SMTP id
 2adb3069b0e04-522102783f4mr438368e87.52.1715288018695; Thu, 09 May 2024
 13:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240509204352.7597-1-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20240509204352.7597-1-mohamedahmedegypt2001@gmail.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Thu, 9 May 2024 15:53:27 -0500
Message-ID: <CAOFGe97AipxnCQwWaWxckGwEEbCK1fr+NN4gFx7j07nzpRzkBA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com, 
 nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000000ad99606180b9da8"
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

--0000000000000ad99606180b9da8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 3:44=E2=80=AFPM Mohamed Ahmed <
mohamedahmedegypt2001@gmail.com> wrote:

> Allows PTE kind and tile mode on BO create with VM_BIND,
> and adds a GETPARAM to indicate this change. This is needed to support
> modifiers in NVK and ensure correctness when dealing with the nouveau
> GL driver.
>
> The userspace modifiers implementation this is for can be found here:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24795
>
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
>

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>


> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c |  3 ++
>  drivers/gpu/drm/nouveau/nouveau_bo.c    | 44 +++++++++++--------------
>  include/uapi/drm/nouveau_drm.h          |  7 ++++
>  3 files changed, 29 insertions(+), 25 deletions(-)
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
> index db8cbf615..186add400 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -241,28 +241,28 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size=
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
> @@ -304,12 +304,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size,
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

--0000000000000ad99606180b9da8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, May 9, 2024 at 3:44=E2=80=AFPM Mohamed Ahmed &lt;<a href=3D"=
mailto:mohamedahmedegypt2001@gmail.com">mohamedahmedegypt2001@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Allo=
ws PTE kind and tile mode on BO create with VM_BIND,<br>
and adds a GETPARAM to indicate this change. This is needed to support<br>
modifiers in NVK and ensure correctness when dealing with the nouveau<br>
GL driver.<br>
<br>
The userspace modifiers implementation this is for can be found here:<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24795"=
 rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/m=
esa/-/merge_requests/24795</a><br>
<br>
Fixes: b88baab82871 (&quot;drm/nouveau: implement new VM_BIND uAPI&quot;)<b=
r>
Signed-off-by: Mohamed Ahmed &lt;<a href=3D"mailto:mohamedahmedegypt2001@gm=
ail.com" target=3D"_blank">mohamedahmedegypt2001@gmail.com</a>&gt;<br></blo=
ckquote><div><br></div><div>Reviewed-by: Faith Ekstrand &lt;<a href=3D"mail=
to:faith.ekstrand@collabora.com">faith.ekstrand@collabora.com</a>&gt;<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c |=C2=A0 3 ++<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_bo.c=C2=A0 =C2=A0 | 44 +++++++++++---=
-----------<br>
=C2=A0include/uapi/drm/nouveau_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 7 ++++<br>
=C2=A03 files changed, 29 insertions(+), 25 deletions(-)<br>
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
index db8cbf615..186add400 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
@@ -241,28 +241,28 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, =
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
@@ -304,12 +304,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, i=
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

--0000000000000ad99606180b9da8--
