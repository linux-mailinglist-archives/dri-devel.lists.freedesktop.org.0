Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8F28C48B0
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 23:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09E110E059;
	Mon, 13 May 2024 21:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W6NKBJm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA5410E059;
 Mon, 13 May 2024 21:15:36 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a59a9d66a51so1131972966b.2; 
 Mon, 13 May 2024 14:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715634934; x=1716239734; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kqf3/RkFcCeagvXcs34YdWY8ncSVvQ1CYNZLYS3IS6c=;
 b=W6NKBJm+jaMs2pw7EWwhUs1ghWpFzRdSWkXrMqPjcP50sdjy8PS/zN5dQex75ItZAG
 PXyiNrqebvWQwalleirgcoV0c/yfO6UgfWsiu73CJ93emOdQP3xClRriN34nmtOChu/U
 rBoesFBWyNEbaXLoKvhJDMZF7rxAZBRXIeQLwxeMKHshSBF3KvJoPOH8h+pGSaM/Xapm
 lYNX6o2Nzk+f6p4N99wvrrlYSQvx1AQGPVyTPZcXtLtSwtws9yCdA2PFliW+JDpFXncz
 Ju6x+2Tull8fun9oRmTs57weY3G2UtmTuVzuItYMcpHo0xQEOppGt03ROQqBuRpbupRe
 LyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715634934; x=1716239734;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kqf3/RkFcCeagvXcs34YdWY8ncSVvQ1CYNZLYS3IS6c=;
 b=vIy1V3JNqH31FdQK6UV2h7MOy9DSZZHjFBRAJAa5bvTSyu8YZ/oTJDGVJH6Id08ist
 W22v8Tr+QSZ0NgjcciWHS1qvAbXmyF2QJqv0A/UDH334jZjwIiBXVg3t17Gv3KtlsPE/
 lgoF+9KuP16InwzG4VwPhjM2MsAOcGUePeoOb/CNICRxQUCQbVkCTwffLKytJGZHxbf+
 UuGyhPubf1Stovb4slCFRiTx/t9xDa1QDOOxcU7mLifGUylt8+d+1NUEJm/gM0KIPFPt
 y4Dutrrt7SGU1/h1/rMROvP3OqL4H8SW5VGwd8xBX7EwO6WCNxwcUgjQcY5PItjSwGrj
 Cb9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwq14EQTnsiGokbCEcgYoXZVOKcHwd0168CXjnzNhaLz4/3wKGPMYKgKrIrGw0wwhZFn4gov5DyE/4WZiyKnd5LpkJiO/69S9VgAAXW9Pq8H1VKs3RAuCJ12HfjBYPE4aaYYV6S0a3ZZEeDIDIVw==
X-Gm-Message-State: AOJu0YzaDnj5mR3mFUQM6Teqv0WzNZWfPqxpXeu53qsndXjaZwR3M5g8
 Er2fYGL9Orj9Ym0KjCcBd/oPFj8UYIrE21LVAJIPJLcWGr9U1igR8YKysNOnpIa3LMRm2qSkgbU
 sjWq7qM1Yf0NPsZspgwBYSNu3Xfk=
X-Google-Smtp-Source: AGHT+IEnpEt59oIV+5tmPBrzPxUwg4IkvyrqBQeh7AxcHElswbiXvwvGIWbmDTQSnqTpbiHHZMHIzmNSUVe2plUo2l0=
X-Received: by 2002:a17:906:daca:b0:a59:bae0:b12f with SMTP id
 a640c23a62f3a-a5a2d6656c5mr920846866b.57.1715634934076; Mon, 13 May 2024
 14:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240509204352.7597-1-mohamedahmedegypt2001@gmail.com>
 <3c074a02-15ad-4d16-a21b-39af24ffadc6@redhat.com>
In-Reply-To: <3c074a02-15ad-4d16-a21b-39af24ffadc6@redhat.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Tue, 14 May 2024 00:15:20 +0300
Message-ID: <CAA+WOBtYuC5HOzf7wuiiJvsn0cpZy7cKXyqE38txygd3XxrsVQ@mail.gmail.com>
Subject: Re: [PATCH v4] drm/nouveau: use tile_mode and pte_kind for VM_BIND bo
 allocations
To: Danilo Krummrich <dakr@redhat.com>
Cc: airlied@redhat.com, Faith Ekstrand <faith@gfxstrand.net>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000cf5f4f06185c628f"
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

--000000000000cf5f4f06185c628f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Understood. Thanks a lot and sorry for any inconvenience.

Mohamed

On Mon, May 13, 2024 at 11:28=E2=80=AFPM Danilo Krummrich <dakr@redhat.com>=
 wrote:

> Hi Mohamed,
>
> Thank you for fixing this up!
>
> On 5/9/24 22:43, Mohamed Ahmed wrote:
> > Allows PTE kind and tile mode on BO create with VM_BIND,
> > and adds a GETPARAM to indicate this change. This is needed to support
>
> It's usually better to use imperative verb form for commit messages. No
> need to send a new version though.
>
> > modifiers in NVK and ensure correctness when dealing with the nouveau
> > GL driver.
> >
> > The userspace modifiers implementation this is for can be found here:
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/24795
> >
> > Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> > Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
>
> Applied to drm-misc-next-fixes.
>
> Generally, please make sure to use scripts/get_maintainer.pl before
> sending
> patches.
>
> - Danilo
>
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_abi16.c |  3 ++
> >   drivers/gpu/drm/nouveau/nouveau_bo.c    | 44 +++++++++++-------------=
-
> >   include/uapi/drm/nouveau_drm.h          |  7 ++++
> >   3 files changed, 29 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > index 80f74ee0f..47e53e17b 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> > @@ -272,6 +272,9 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> >               getparam->value =3D
> (u64)ttm_resource_manager_usage(vram_mgr);
> >               break;
> >       }
> > +     case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:
> > +             getparam->value =3D 1;
> > +             break;
> >       default:
> >               NV_PRINTK(dbg, cli, "unknown parameter %lld\n",
> getparam->param);
> >               return -EINVAL;
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index db8cbf615..186add400 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -241,28 +241,28 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64
> *size, int *align, u32 domain,
> >       }
> >
> >       nvbo->contig =3D !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
> > -     if (!nouveau_cli_uvmm(cli) || internal) {
> > -             /* for BO noVM allocs, don't assign kinds */
> > -             if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_FERMI)=
 {
> > -                     nvbo->kind =3D (tile_flags & 0x0000ff00) >> 8;
> > -                     if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> > -                             kfree(nvbo);
> > -                             return ERR_PTR(-EINVAL);
> > -                     }
> >
> > -                     nvbo->comp =3D mmu->kind[nvbo->kind] !=3D nvbo->k=
ind;
> > -             } else if (cli->device.info.family >=3D
> NV_DEVICE_INFO_V0_TESLA) {
> > -                     nvbo->kind =3D (tile_flags & 0x00007f00) >> 8;
> > -                     nvbo->comp =3D (tile_flags & 0x00030000) >> 16;
> > -                     if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> > -                             kfree(nvbo);
> > -                             return ERR_PTR(-EINVAL);
> > -                     }
> > -             } else {
> > -                     nvbo->zeta =3D (tile_flags & 0x00000007);
> > +     if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_FERMI) {
> > +             nvbo->kind =3D (tile_flags & 0x0000ff00) >> 8;
> > +             if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> > +                     kfree(nvbo);
> > +                     return ERR_PTR(-EINVAL);
> > +             }
> > +
> > +             nvbo->comp =3D mmu->kind[nvbo->kind] !=3D nvbo->kind;
> > +     } else if (cli->device.info.family >=3D NV_DEVICE_INFO_V0_TESLA) =
{
> > +             nvbo->kind =3D (tile_flags & 0x00007f00) >> 8;
> > +             nvbo->comp =3D (tile_flags & 0x00030000) >> 16;
> > +             if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
> > +                     kfree(nvbo);
> > +                     return ERR_PTR(-EINVAL);
> >               }
> > -             nvbo->mode =3D tile_mode;
> > +     } else {
> > +             nvbo->zeta =3D (tile_flags & 0x00000007);
> > +     }
> > +     nvbo->mode =3D tile_mode;
> >
> > +     if (!nouveau_cli_uvmm(cli) || internal) {
> >               /* Determine the desirable target GPU page size for the
> buffer. */
> >               for (i =3D 0; i < vmm->page_nr; i++) {
> >                       /* Because we cannot currently allow VMM maps to
> fail
> > @@ -304,12 +304,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64
> *size, int *align, u32 domain,
> >               }
> >               nvbo->page =3D vmm->page[pi].shift;
> >       } else {
> > -             /* reject other tile flags when in VM mode. */
> > -             if (tile_mode)
> > -                     return ERR_PTR(-EINVAL);
> > -             if (tile_flags & ~NOUVEAU_GEM_TILE_NONCONTIG)
> > -                     return ERR_PTR(-EINVAL);
> > -
> >               /* Determine the desirable target GPU page size for the
> buffer. */
> >               for (i =3D 0; i < vmm->page_nr; i++) {
> >                       /* Because we cannot currently allow VMM maps to
> fail
> > diff --git a/include/uapi/drm/nouveau_drm.h
> b/include/uapi/drm/nouveau_drm.h
> > index cd84227f1..5402f77ee 100644
> > --- a/include/uapi/drm/nouveau_drm.h
> > +++ b/include/uapi/drm/nouveau_drm.h
> > @@ -68,6 +68,13 @@ extern "C" {
> >    */
> >   #define NOUVEAU_GETPARAM_VRAM_USED 19
> >
> > +/*
> > + * NOUVEAU_GETPARAM_HAS_VMA_TILEMODE
> > + *
> > + * Query whether tile mode and PTE kind are accepted with VM allocs or
> not.
> > + */
> > +#define NOUVEAU_GETPARAM_HAS_VMA_TILEMODE 20
> > +
> >   struct drm_nouveau_getparam {
> >       __u64 param;
> >       __u64 value;
>
>

--000000000000cf5f4f06185c628f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey,<div><br></div><div>Understood. Thanks a lot and sorry=
 for any inconvenience.</div><div><br></div><div>Mohamed</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 1=
3, 2024 at 11:28=E2=80=AFPM Danilo Krummrich &lt;<a href=3D"mailto:dakr@red=
hat.com">dakr@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi Mohamed,<br>
<br>
Thank you for fixing this up!<br>
<br>
On 5/9/24 22:43, Mohamed Ahmed wrote:<br>
&gt; Allows PTE kind and tile mode on BO create with VM_BIND,<br>
&gt; and adds a GETPARAM to indicate this change. This is needed to support=
<br>
<br>
It&#39;s usually better to use imperative verb form for commit messages. No=
<br>
need to send a new version though.<br>
<br>
&gt; modifiers in NVK and ensure correctness when dealing with the nouveau<=
br>
&gt; GL driver.<br>
&gt; <br>
&gt; The userspace modifiers implementation this is for can be found here:<=
br>
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2=
4795" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/m=
esa/mesa/-/merge_requests/24795</a><br>
&gt; <br>
&gt; Fixes: b88baab82871 (&quot;drm/nouveau: implement new VM_BIND uAPI&quo=
t;)<br>
&gt; Signed-off-by: Mohamed Ahmed &lt;<a href=3D"mailto:mohamedahmedegypt20=
01@gmail.com" target=3D"_blank">mohamedahmedegypt2001@gmail.com</a>&gt;<br>
<br>
Applied to drm-misc-next-fixes.<br>
<br>
Generally, please make sure to use scripts/<a href=3D"http://get_maintainer=
.pl" rel=3D"noreferrer" target=3D"_blank">get_maintainer.pl</a> before send=
ing<br>
patches.<br>
<br>
- Danilo<br>
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c |=C2=A0 3 ++<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/nouveau/nouveau_bo.c=C2=A0 =C2=A0 | 44 +++=
++++++++--------------<br>
&gt;=C2=A0 =C2=A0include/uapi/drm/nouveau_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 7 ++++<br>
&gt;=C2=A0 =C2=A03 files changed, 29 insertions(+), 25 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm=
/nouveau/nouveau_abi16.c<br>
&gt; index 80f74ee0f..47e53e17b 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c<br>
&gt; @@ -272,6 +272,9 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getparam-&gt;val=
ue =3D (u64)ttm_resource_manager_usage(vram_mgr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getparam-&gt;value =
=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NV_PRINTK(dbg, c=
li, &quot;unknown parameter %lld\n&quot;, getparam-&gt;param);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt; diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/no=
uveau/nouveau_bo.c<br>
&gt; index db8cbf615..186add400 100644<br>
&gt; --- a/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
&gt; +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c<br>
&gt; @@ -241,28 +241,28 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *s=
ize, int *align, u32 domain,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;contig =3D !(tile_flags &amp; NOUVE=
AU_GEM_TILE_NONCONTIG);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!nouveau_cli_uvmm(cli) || internal) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* for BO noVM allocs=
, don&#39;t assign kinds */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cli-&gt;device.in=
fo.family &gt;=3D NV_DEVICE_INFO_V0_FERMI) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0nvbo-&gt;kind =3D (tile_flags &amp; 0x0000ff00) &gt;&gt; 8;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!nvif_mmu_kind_valid(mmu, nvbo-&gt;kind)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(nvbo);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINVAL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0nvbo-&gt;comp =3D mmu-&gt;kind[nvbo-&gt;kind] !=3D nvbo-&gt;kind;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (cli-&gt;de=
vice.info.family &gt;=3D NV_DEVICE_INFO_V0_TESLA) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0nvbo-&gt;kind =3D (tile_flags &amp; 0x00007f00) &gt;&gt; 8;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0nvbo-&gt;comp =3D (tile_flags &amp; 0x00030000) &gt;&gt; 16;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!nvif_mmu_kind_valid(mmu, nvbo-&gt;kind)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(nvbo);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINVAL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0nvbo-&gt;zeta =3D (tile_flags &amp; 0x00000007);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (cli-&gt;device.info.family &gt;=3D NV_DEVICE_=
INFO_V0_FERMI) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;kind =3D (ti=
le_flags &amp; 0x0000ff00) &gt;&gt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nvif_mmu_kind_va=
lid(mmu, nvbo-&gt;kind)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kfree(nvbo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(-EINVAL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;comp =3D mmu=
-&gt;kind[nvbo-&gt;kind] !=3D nvbo-&gt;kind;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (cli-&gt;device.info.family &gt;=3D NV_=
DEVICE_INFO_V0_TESLA) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;kind =3D (ti=
le_flags &amp; 0x00007f00) &gt;&gt; 8;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;comp =3D (ti=
le_flags &amp; 0x00030000) &gt;&gt; 16;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!nvif_mmu_kind_va=
lid(mmu, nvbo-&gt;kind)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kfree(nvbo);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(-EINVAL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;mode =3D til=
e_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;zeta =3D (ti=
le_flags &amp; 0x00000007);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0nvbo-&gt;mode =3D tile_mode;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!nouveau_cli_uvmm(cli) || internal) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Determine the=
 desirable target GPU page size for the buffer. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i =
&lt; vmm-&gt;page_nr; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Because we cannot currently allow VMM maps to fail<br>
&gt; @@ -304,12 +304,6 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *si=
ze, int *align, u32 domain,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvbo-&gt;page =
=3D vmm-&gt;page[pi].shift;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* reject other tile =
flags when in VM mode. */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tile_mode)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(-EINVAL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (tile_flags &amp; =
~NOUVEAU_GEM_TILE_NONCONTIG)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ERR_PTR(-EINVAL);<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Determine the=
 desirable target GPU page size for the buffer. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i =
&lt; vmm-&gt;page_nr; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Because we cannot currently allow VMM maps to fail<br>
&gt; diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau=
_drm.h<br>
&gt; index cd84227f1..5402f77ee 100644<br>
&gt; --- a/include/uapi/drm/nouveau_drm.h<br>
&gt; +++ b/include/uapi/drm/nouveau_drm.h<br>
&gt; @@ -68,6 +68,13 @@ extern &quot;C&quot; {<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0#define NOUVEAU_GETPARAM_VRAM_USED 19<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/*<br>
&gt; + * NOUVEAU_GETPARAM_HAS_VMA_TILEMODE<br>
&gt; + *<br>
&gt; + * Query whether tile mode and PTE kind are accepted with VM allocs o=
r not.<br>
&gt; + */<br>
&gt; +#define NOUVEAU_GETPARAM_HAS_VMA_TILEMODE 20<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0struct drm_nouveau_getparam {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 param;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 value;<br>
<br>
</blockquote></div>

--000000000000cf5f4f06185c628f--
