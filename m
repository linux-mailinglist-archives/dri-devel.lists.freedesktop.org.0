Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE339335C6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 05:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4905210E038;
	Wed, 17 Jul 2024 03:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A2YKLbOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F271210E004;
 Wed, 17 Jul 2024 03:44:19 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-58f9874aeb4so7819601a12.0; 
 Tue, 16 Jul 2024 20:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721187858; x=1721792658; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kmDi238YhWGWK04q2Hyu5eu6XtQigpfpZw0KlhWZQgo=;
 b=A2YKLbOLGO/MB46qAALQy76JU9vKcQuSL35XQPCmUv0M0jOy1tUM4QPPCY3pBLafUp
 BU4dyjjNunJCJXfbw+aZQNNZSmK3uULyZ1MVm9vHQgybtocwDz8c106DeiNpjkSqldJX
 r3Z/bdP3StGdN0hNpuREg71IAw03rB9oJ040h9zGzck/bhuBquocdgpWPXvO8neomKmk
 DKTKLHLjT9qIcAFlbLAJOxR2tTgOUdOzWrQqDcqWoetZAj2AxiW7LLJjq+7nmmddPL4X
 32JIiPI0q+0zqJNU0md9z9cC2rROTs1uvo4YpO1QBki8P0ZHpye4KpPaEayDNT/A1Vzs
 T1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721187858; x=1721792658;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kmDi238YhWGWK04q2Hyu5eu6XtQigpfpZw0KlhWZQgo=;
 b=LNe5OBPfaMg0P7W7AgfIw6/a7rMISwG61dveG/u8kexCK2z6pw9jq4YXXsKqXBCLGI
 +2YYJbIL2z+G+Qzf1fhnDgpiEa27fxsaXeo/cHd73kKJLT3Z0rGSorRFql9IvcT0qfWR
 PJoE9oQVWBgVrCefFuLINcnkR2nQS83lvL+HdG1qBPUOP9ZOLCF0RlVBZ7m/H2Wrh4Y0
 h7ZLRW0Vq8GgfWbMWSPAPlQE5wchmuuWa2GsdYqq1K5L4MU32goqsFb3RKNIKJUuNyVY
 TQn1NHRwmsP3XLwFT9gWMzGPHlVFqTGe1D5KBqioK2OOmOVWL7uOxzyZ3CLQ+knelgve
 2P7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX16oiF5jCEc3AVhN8rJrGImC/jMxvtTh4LUgN4dwOh0OG65DsNdWEgbCcLI13Qcw7apzNO5Vn9XcGtqvpNCXr2NmYo3MLLTv8b5F04lgVmt20HNWdiHnyPAP5otR4tIxxGKEQ0mq6W8ParJYntXg==
X-Gm-Message-State: AOJu0YzzjXT8cLrHpnh0sbcqqgcgW5pzfsdmVkk3A0b/0P0jxWNDIohd
 in+Q72GRGrpAobyn0vHe3mCEvGx4wFmgpZ9lzYIfeir0rT7LjhZ1G8psygmr4zd44WIluKcPNnt
 Cu3Aba2ZDA/rSgObvvZxLsDJDqEji1g==
X-Google-Smtp-Source: AGHT+IHPWmcYwYUdUEfyWICKgANy8mljBI2cAcWK9gvLLyHtwpz9N6A9KDkSClUC9r600dyxV5xjVXlPEkXvwwKrSqk=
X-Received: by 2002:a50:9fac:0:b0:57c:60e8:c519 with SMTP id
 4fb4d7f45d1cf-5a05badbbb3mr320106a12.16.1721187858056; Tue, 16 Jul 2024
 20:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240716152104.377039-1-Arunpravin.PaneerSelvam@amd.com>
 <20240716152104.377039-2-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20240716152104.377039-2-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 16 Jul 2024 23:44:06 -0400
Message-ID: <CAAxE2A6gpvLcq7zDhTDgV1BiBZdbK6t7147ESpq0ufYqW-6gzQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] drm/amdgpu: Add address alignment support to DCC
 buffers
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, matthew.auld@intel.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Min,
 Frank" <frank.min@amd.com>, 
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Content-Type: multipart/alternative; boundary="000000000000df0da9061d6946bc"
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

--000000000000df0da9061d6946bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AMDGPU_GEM_CREATE_GFX12_DCC is set on 90% of all memory allocations, and
almost all of them are not displayable. Shouldn't we use a different way to
indicate that we need a non-power-of-two alignment, such as looking at the
alignment field directly?

Marek

On Tue, Jul 16, 2024, 11:45 Arunpravin Paneer Selvam <
Arunpravin.PaneerSelvam@amd.com> wrote:

> Add address alignment support to the DCC VRAM buffers.
>
> v2:
>   - adjust size based on the max_texture_channel_caches values
>     only for GFX12 DCC buffers.
>   - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply change only
>     for DCC buffers.
>   - roundup non power of two DCC buffer adjusted size to nearest
>     power of two number as the buddy allocator does not support non
>     power of two alignments. This applies only to the contiguous
>     DCC buffers.
>
> v3:(Alex)
>   - rewrite the max texture channel caches comparison code in an
>     algorithmic way to determine the alignment size.
>
> v4:(Alex)
>   - Move the logic from amdgpu_vram_mgr_dcc_alignment() to gmc_v12_0.c
>     and add a new gmc func callback for dcc alignment. If the callback
>     is non-NULL, call it to get the alignment, otherwise, use the default=
.
>
> v5:(Alex)
>   - Set the Alignment to a default value if the callback doesn't exist.
>   - Add the callback to amdgpu_gmc_funcs.
>
> v6:
>   - Fix checkpatch error reported by Intel CI.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Frank Min <Frank.Min@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  6 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36 ++++++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 15 ++++++++
>  3 files changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> index febca3130497..654d0548a3f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> @@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {
>                                       uint64_t addr, uint64_t *flags);
>         /* get the amount of memory used by the vbios for pre-OS console =
*/
>         unsigned int (*get_vbios_fb_size)(struct amdgpu_device *adev);
> +       /* get the DCC buffer alignment */
> +       u64 (*get_dcc_alignment)(struct amdgpu_device *adev);
>
>         enum amdgpu_memory_partition (*query_mem_partition_mode)(
>                 struct amdgpu_device *adev);
> @@ -363,6 +365,10 @@ struct amdgpu_gmc {
>         (adev)->gmc.gmc_funcs->override_vm_pte_flags                    \
>                 ((adev), (vm), (addr), (pte_flags))
>  #define amdgpu_gmc_get_vbios_fb_size(adev)
> (adev)->gmc.gmc_funcs->get_vbios_fb_size((adev))
> +#define amdgpu_gmc_get_dcc_alignment(_adev) ({                 \
> +       typeof(_adev) (adev) =3D (_adev);                         \
> +       ((adev)->gmc.gmc_funcs->get_dcc_alignment((adev)));     \
> +})
>
>  /**
>   * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible through
> the BAR
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index f91cc149d06c..aa9dca12371c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -512,6 +512,16 @@ static int amdgpu_vram_mgr_new(struct
> ttm_resource_manager *man,
>                 vres->flags |=3D DRM_BUDDY_RANGE_ALLOCATION;
>
>         remaining_size =3D (u64)vres->base.size;
> +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> +           bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
> +               u64 adjust_size;
> +
> +               if (adev->gmc.gmc_funcs->get_dcc_alignment) {
> +                       adjust_size =3D amdgpu_gmc_get_dcc_alignment(adev=
);
> +                       remaining_size =3D roundup_pow_of_two(remaining_s=
ize
> + adjust_size);
> +                       vres->flags |=3D DRM_BUDDY_TRIM_DISABLE;
> +               }
> +       }
>
>         mutex_lock(&mgr->lock);
>         while (remaining_size) {
> @@ -521,8 +531,12 @@ static int amdgpu_vram_mgr_new(struct
> ttm_resource_manager *man,
>                         min_block_size =3D mgr->default_page_size;
>
>                 size =3D remaining_size;
> -               if ((size >=3D (u64)pages_per_block << PAGE_SHIFT) &&
> -                   !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
> +
> +               if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> +                   bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC)
> +                       min_block_size =3D size;
> +               else if ((size >=3D (u64)pages_per_block << PAGE_SHIFT) &=
&
> +                        !(size & (((u64)pages_per_block << PAGE_SHIFT) -
> 1)))
>                         min_block_size =3D (u64)pages_per_block <<
> PAGE_SHIFT;
>
>                 BUG_ON(min_block_size < mm->chunk_size);
> @@ -553,6 +567,24 @@ static int amdgpu_vram_mgr_new(struct
> ttm_resource_manager *man,
>         }
>         mutex_unlock(&mgr->lock);
>
> +       if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> +           bo->flags & AMDGPU_GEM_CREATE_GFX12_DCC) {
> +               struct drm_buddy_block *dcc_block;
> +               u64 dcc_start, alignment;
> +
> +               dcc_block =3D amdgpu_vram_mgr_first_block(&vres->blocks);
> +               dcc_start =3D amdgpu_vram_mgr_block_start(dcc_block);
> +
> +               if (adev->gmc.gmc_funcs->get_dcc_alignment) {
> +                       alignment =3D amdgpu_gmc_get_dcc_alignment(adev);
> +                       /* Adjust the start address for DCC buffers only =
*/
> +                       dcc_start =3D roundup(dcc_start, alignment);
> +                       drm_buddy_block_trim(mm, &dcc_start,
> +                                            (u64)vres->base.size,
> +                                            &vres->blocks);
> +               }
> +       }
> +
>         vres->base.start =3D 0;
>         size =3D max_t(u64, amdgpu_vram_mgr_blocks_size(&vres->blocks),
>                      vres->base.size);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> index fd3ac483760e..4259edcdec8a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> @@ -542,6 +542,20 @@ static unsigned gmc_v12_0_get_vbios_fb_size(struct
> amdgpu_device *adev)
>         return 0;
>  }
>
> +static u64 gmc_v12_0_get_dcc_alignment(struct amdgpu_device *adev)
> +{
> +       u64 max_tex_channel_caches, alignment;
> +
> +       max_tex_channel_caches =3D
> adev->gfx.config.max_texture_channel_caches;
> +       if (is_power_of_2(max_tex_channel_caches))
> +               alignment =3D (max_tex_channel_caches / SZ_4) *
> max_tex_channel_caches;
> +       else
> +               alignment =3D roundup_pow_of_two(max_tex_channel_caches) =
*
> +                               max_tex_channel_caches;
> +
> +       return (u64)alignment * SZ_1K;
> +}
> +
>  static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs =3D {
>         .flush_gpu_tlb =3D gmc_v12_0_flush_gpu_tlb,
>         .flush_gpu_tlb_pasid =3D gmc_v12_0_flush_gpu_tlb_pasid,
> @@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs
> gmc_v12_0_gmc_funcs =3D {
>         .get_vm_pde =3D gmc_v12_0_get_vm_pde,
>         .get_vm_pte =3D gmc_v12_0_get_vm_pte,
>         .get_vbios_fb_size =3D gmc_v12_0_get_vbios_fb_size,
> +       .get_dcc_alignment =3D gmc_v12_0_get_dcc_alignment,
>  };
>
>  static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)
> --
> 2.25.1
>
>

--000000000000df0da9061d6946bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>AMDGPU_GEM_CREATE_GFX12_DCC is set on 90% of all mem=
ory allocations, and almost all of them are not displayable. Shouldn&#39;t =
we use a different way to indicate that we need a non-power-of-two alignmen=
t, such as looking at the alignment field directly?=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Marek<br><br><div class=3D"gmail_quote" d=
ir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 16, 2024, 11:=
45 Arunpravin Paneer Selvam &lt;<a href=3D"mailto:Arunpravin.PaneerSelvam@a=
md.com">Arunpravin.PaneerSelvam@amd.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">Add address alignment support to the DCC VRAM buffers.<=
br>
<br>
v2:<br>
=C2=A0 - adjust size based on the max_texture_channel_caches values<br>
=C2=A0 =C2=A0 only for GFX12 DCC buffers.<br>
=C2=A0 - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply change only<br>
=C2=A0 =C2=A0 for DCC buffers.<br>
=C2=A0 - roundup non power of two DCC buffer adjusted size to nearest<br>
=C2=A0 =C2=A0 power of two number as the buddy allocator does not support n=
on<br>
=C2=A0 =C2=A0 power of two alignments. This applies only to the contiguous<=
br>
=C2=A0 =C2=A0 DCC buffers.<br>
<br>
v3:(Alex)<br>
=C2=A0 - rewrite the max texture channel caches comparison code in an<br>
=C2=A0 =C2=A0 algorithmic way to determine the alignment size.<br>
<br>
v4:(Alex)<br>
=C2=A0 - Move the logic from amdgpu_vram_mgr_dcc_alignment() to gmc_v12_0.c=
<br>
=C2=A0 =C2=A0 and add a new gmc func callback for dcc alignment. If the cal=
lback<br>
=C2=A0 =C2=A0 is non-NULL, call it to get the alignment, otherwise, use the=
 default.<br>
<br>
v5:(Alex)<br>
=C2=A0 - Set the Alignment to a default value if the callback doesn&#39;t e=
xist.<br>
=C2=A0 - Add the callback to amdgpu_gmc_funcs.<br>
<br>
v6:<br>
=C2=A0 - Fix checkpatch error reported by Intel CI.<br>
<br>
Signed-off-by: Arunpravin Paneer Selvam &lt;<a href=3D"mailto:Arunpravin.Pa=
neerSelvam@amd.com" target=3D"_blank" rel=3D"noreferrer">Arunpravin.PaneerS=
elvam@amd.com</a>&gt;<br>
Acked-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" tar=
get=3D"_blank" rel=3D"noreferrer">alexander.deucher@amd.com</a>&gt;<br>
Acked-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.c=
om" target=3D"_blank" rel=3D"noreferrer">christian.koenig@amd.com</a>&gt;<b=
r>
Reviewed-by: Frank Min &lt;<a href=3D"mailto:Frank.Min@amd.com" target=3D"_=
blank" rel=3D"noreferrer">Frank.Min@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 6=
 ++++<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 36 ++++++++++++++++++-=
-<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 15=
 ++++++++<br>
=C2=A03 files changed, 55 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gmc.h<br>
index febca3130497..654d0548a3f8 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h<br>
@@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t addr, =
uint64_t *flags);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* get the amount of memory used by the vbios f=
or pre-OS console */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int (*get_vbios_fb_size)(struct amdgpu=
_device *adev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* get the DCC buffer alignment */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 (*get_dcc_alignment)(struct amdgpu_device *=
adev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 enum amdgpu_memory_partition (*query_mem_partit=
ion_mode)(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct amdgpu_devic=
e *adev);<br>
@@ -363,6 +365,10 @@ struct amdgpu_gmc {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (adev)-&gt;gmc.gmc_funcs-&gt;override_vm_pte_fl=
ags=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((adev), (vm), (add=
r), (pte_flags))<br>
=C2=A0#define amdgpu_gmc_get_vbios_fb_size(adev) (adev)-&gt;gmc.gmc_funcs-&=
gt;get_vbios_fb_size((adev))<br>
+#define amdgpu_gmc_get_dcc_alignment(_adev) ({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0typeof(_adev) (adev) =3D (_adev);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0((adev)-&gt;gmc.gmc_funcs-&gt;get_dcc_alignment=
((adev)));=C2=A0 =C2=A0 =C2=A0\<br>
+})<br>
<br>
=C2=A0/**<br>
=C2=A0 * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible throu=
gh the BAR<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vram_mgr.c<br>
index f91cc149d06c..aa9dca12371c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
@@ -512,6 +512,16 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_man=
ager *man,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vres-&gt;flags |=3D=
 DRM_BUDDY_RANGE_ALLOCATION;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 remaining_size =3D (u64)vres-&gt;base.size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;flags &amp; AMDGPU_GEM_CREATE_VRAM_C=
ONTIGUOUS &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;flags &amp; AMDGPU_GEM_CRE=
ATE_GFX12_DCC) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 adjust_size;<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (adev-&gt;gmc.gm=
c_funcs-&gt;get_dcc_alignment) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0adjust_size =3D amdgpu_gmc_get_dcc_alignment(adev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0remaining_size =3D roundup_pow_of_two(remaining_size + adjust_siz=
e);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vres-&gt;flags |=3D DRM_BUDDY_TRIM_DISABLE;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&amp;mgr-&gt;lock);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (remaining_size) {<br>
@@ -521,8 +531,12 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_man=
ager *man,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 min_block_size =3D mgr-&gt;default_page_size;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D remaining_=
size;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((size &gt;=3D (=
u64)pages_per_block &lt;&lt; PAGE_SHIFT) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!(siz=
e &amp; (((u64)pages_per_block &lt;&lt; PAGE_SHIFT) - 1)))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;flags &a=
mp; AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&g=
t;flags &amp; AMDGPU_GEM_CREATE_GFX12_DCC)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0min_block_size =3D size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if ((size &gt;=
=3D (u64)pages_per_block &lt;&lt; PAGE_SHIFT) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 !(size &amp; (((u64)pages_per_block &lt;&lt; PAGE_SHIFT) - 1)))<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 min_block_size =3D (u64)pages_per_block &lt;&lt; PAGE_SHIFT;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG_ON(min_block_si=
ze &lt; mm-&gt;chunk_size);<br>
@@ -553,6 +567,24 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_man=
ager *man,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;mgr-&gt;lock);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo-&gt;flags &amp; AMDGPU_GEM_CREATE_VRAM_C=
ONTIGUOUS &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo-&gt;flags &amp; AMDGPU_GEM_CRE=
ATE_GFX12_DCC) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_buddy_bl=
ock *dcc_block;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u64 dcc_start, alig=
nment;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dcc_block =3D amdgp=
u_vram_mgr_first_block(&amp;vres-&gt;blocks);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dcc_start =3D amdgp=
u_vram_mgr_block_start(dcc_block);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (adev-&gt;gmc.gm=
c_funcs-&gt;get_dcc_alignment) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0alignment =3D amdgpu_gmc_get_dcc_alignment(adev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Adjust the start address for DCC buffers only */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dcc_start =3D roundup(dcc_start, alignment);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_buddy_block_trim(mm, &amp;dcc_start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (u64)vres-&gt;base.size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;vres-&gt;blocks);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vres-&gt;base.start =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D max_t(u64, amdgpu_vram_mgr_blocks_size=
(&amp;vres-&gt;blocks),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0vres-&gt;base.size);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gmc_v12_0.c<br>
index fd3ac483760e..4259edcdec8a 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c<br>
@@ -542,6 +542,20 @@ static unsigned gmc_v12_0_get_vbios_fb_size(struct amd=
gpu_device *adev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
+static u64 gmc_v12_0_get_dcc_alignment(struct amdgpu_device *adev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 max_tex_channel_caches, alignment;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0max_tex_channel_caches =3D adev-&gt;gfx.config.=
max_texture_channel_caches;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_power_of_2(max_tex_channel_caches))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alignment =3D (max_=
tex_channel_caches / SZ_4) * max_tex_channel_caches;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alignment =3D round=
up_pow_of_two(max_tex_channel_caches) *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_tex_channel_caches;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return (u64)alignment * SZ_1K;<br>
+}<br>
+<br>
=C2=A0static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flush_gpu_tlb =3D gmc_v12_0_flush_gpu_tlb,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flush_gpu_tlb_pasid =3D gmc_v12_0_flush_gpu_tl=
b_pasid,<br>
@@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_func=
s =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .get_vm_pde =3D gmc_v12_0_get_vm_pde,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .get_vm_pte =3D gmc_v12_0_get_vm_pte,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .get_vbios_fb_size =3D gmc_v12_0_get_vbios_fb_s=
ize,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.get_dcc_alignment =3D gmc_v12_0_get_dcc_alignm=
ent,<br>
=C2=A0};<br>
<br>
=C2=A0static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div></div>

--000000000000df0da9061d6946bc--
