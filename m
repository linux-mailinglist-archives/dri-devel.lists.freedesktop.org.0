Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4E692AA69
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 22:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA0310E3FF;
	Mon,  8 Jul 2024 20:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jAZtb8j3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4052210E406;
 Mon,  8 Jul 2024 20:12:22 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2c927152b4bso2975187a91.2; 
 Mon, 08 Jul 2024 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720469542; x=1721074342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yzafkm5mkmKvzuSXY/SPyzLGzyO6gnrISbVK7dcBMos=;
 b=jAZtb8j3LX20GvAV5FR0GJjelkAR+EI6nWwnRiTkwYfRxm1chKMCOc0MsUwD+ikQP/
 bafVUztay+BPpvTYufB6m0+y4SRuIZ0ncX20xcN5/m0rucdNK+xqX1i+A+BJT6F/ilDA
 m4/uU83hWWE/+aWAHpBPHK3hVWQ2VvWIPaCtFkgltGaSOHE2u4PKjN9utNMg1sz8svy6
 KGrakSVFWUniJ4p0KW+cZ+GzyiLOCVBgMrw6Z7F2oDszk4IAQX9eWqxqubUUeW8I+6OO
 sSbebL6QR0nsalhDUErL3d23vMysUXfu2UwQzcmZhA6bxJzSvy0ljFK/jctPemhqg+2z
 S8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720469542; x=1721074342;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yzafkm5mkmKvzuSXY/SPyzLGzyO6gnrISbVK7dcBMos=;
 b=Kic6IQW4zY0QXhbTgQQ8ppxaSHYbWcCh+D8NTb10xO8I2CX2W35IxWm4VLriHCW6LQ
 lZ4zyx2hq3MorYNxC0T8EdaQ+dOqJYU79uphZGaW9mbsJ5cG0tFwELEm53tsizdAV6m9
 FaP4PnawGcJ5BL5Q4AdvkOTLQlFnGEAt8STSACSO0tvm+ljj8iN2lNfqxqv3vNKZ50mJ
 2dVNknwlO5AvmziHHoTuIr/biJunN/Aoi36aunXrZUnMt0uvYwsjxdjt+0uMgrheX+cD
 owQ7omP4zX85mEKTyEvSK7N8V2Haj/W8ILtDwFCK3IG569HoGfIb50T8fqU7cyI/6tzu
 bOuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOuBVLxNsJIwosgeEUcs2loyX3Jro3SUx4J76ip1k0iSbiOlIFsl9j4Bu4yZBlHTxnkUW7Qx8Qai5mLaZAAnv1z4RKfBSKEKMtodTXqw==
X-Gm-Message-State: AOJu0YxBJWZ8AChX9rMf5xwfuPWbQrF93rlckio9JGiiJPWd+2qgB5Qa
 cMd1I8yz8iiFivS8Z4K0PqgzwXN/6CY6cjmUl/NhnH0ETxmBFV8IYfq1dnUJs2oNJNLwyB+Ol0x
 MnOwHrAB6W+F09d+8Th/83doK1Y0=
X-Google-Smtp-Source: AGHT+IEpKE793N62IJYqsTndOl2Ev7riOj5UZboqX14BS5hlSOPGppfWcTvU0UtFD1Yfmagea3RNPWVTsms+DSt5Y0M=
X-Received: by 2002:a17:90a:43c6:b0:2c8:660d:cc2 with SMTP id
 98e67ed59e1d1-2ca35be1c8dmr666706a91.4.1720469541582; Mon, 08 Jul 2024
 13:12:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20240704083008.870021-1-Arunpravin.PaneerSelvam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2024 16:12:10 -0400
Message-ID: <CADnq5_OcuKoZYizbeU_RGPaWYvTpxGMPWg6xOXaPASBMYb5kig@mail.gmail.com>
Subject: Re: [PATCH] drm/buddy: Add start address support to trim function
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 matthew.auld@intel.com, christian.koenig@amd.com, alexander.deucher@amd.com, 
 frank.min@amd.com, marek.olsak@amd.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 4, 2024 at 4:40=E2=80=AFAM Arunpravin Paneer Selvam
<Arunpravin.PaneerSelvam@amd.com> wrote:
>
> - Add a new start parameter in trim function to specify exact
>   address from where to start the trimming. This would help us
>   in situations like if drivers would like to do address alignment
>   for specific requirements.
>
> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>   flag to disable the allocator trimming part. This patch enables
>   the drivers control trimming and they can do it themselves
>   based on the application requirements.
>
> v1:(Matthew)
>   - check new_start alignment with min chunk_size
>   - use range_overflows()
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

I'd like to take this series through the amdgpu tree if there are no
objections as it's required for display buffers on some chips and I'd
like to make sure it lands in 6.11.

Thanks,

Alex

> ---
>  drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>  include/drm/drm_buddy.h              |  2 ++
>  3 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 94f8c34fc293..8cebe1fa4e9d 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct drm_buddy=
 *mm,
>   * drm_buddy_block_trim - free unused pages
>   *
>   * @mm: DRM buddy manager
> + * @start: start address to begin the trimming.
>   * @new_size: original size requested
>   * @blocks: Input and output list of allocated blocks.
>   * MUST contain single block as input to be trimmed.
> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct drm_bud=
dy *mm,
>   * 0 on success, error code on failure.
>   */
>  int drm_buddy_block_trim(struct drm_buddy *mm,
> +                        u64 *start,
>                          u64 new_size,
>                          struct list_head *blocks)
>  {
>         struct drm_buddy_block *parent;
>         struct drm_buddy_block *block;
> +       u64 block_start, block_end;
>         LIST_HEAD(dfs);
>         u64 new_start;
>         int err;
> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>                                  struct drm_buddy_block,
>                                  link);
>
> +       block_start =3D drm_buddy_block_offset(block);
> +       block_end =3D block_start + drm_buddy_block_size(mm, block);
> +
>         if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>                 return -EINVAL;
>
> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>         if (new_size =3D=3D drm_buddy_block_size(mm, block))
>                 return 0;
>
> +       new_start =3D block_start;
> +       if (start) {
> +               new_start =3D *start;
> +
> +               if (new_start < block_start)
> +                       return -EINVAL;
> +
> +               if (!IS_ALIGNED(new_start, mm->chunk_size))
> +                       return -EINVAL;
> +
> +               if (range_overflows(new_start, new_size, block_end))
> +                       return -EINVAL;
> +       }
> +
>         list_del(&block->link);
>         mark_free(mm, block);
>         mm->avail +=3D drm_buddy_block_size(mm, block);
> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>         parent =3D block->parent;
>         block->parent =3D NULL;
>
> -       new_start =3D drm_buddy_block_offset(block);
>         list_add(&block->tmp_link, &dfs);
>         err =3D  __alloc_range(mm, &dfs, new_start, new_size, blocks, NUL=
L);
>         if (err) {
> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>         } while (1);
>
>         /* Trim the allocated block to the required size */
> -       if (original_size !=3D size) {
> +       if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
> +           original_size !=3D size) {
>                 struct list_head *trim_list;
>                 LIST_HEAD(temp);
>                 u64 trim_size;
> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>                 }
>
>                 drm_buddy_block_trim(mm,
> +                                    NULL,
>                                      trim_size,
>                                      trim_list);
>
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.c
> index fe3779fdba2c..423b261ea743 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_ma=
nager *man,
>         } while (remaining_size);
>
>         if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -               if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blo=
cks))
> +               if (!drm_buddy_block_trim(mm, NULL, vres->base.size, &vre=
s->blocks))
>                         size =3D vres->base.size;
>         }
>
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 82570f77e817..0c2f735f0265 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -27,6 +27,7 @@
>  #define DRM_BUDDY_CONTIGUOUS_ALLOCATION                BIT(2)
>  #define DRM_BUDDY_CLEAR_ALLOCATION             BIT(3)
>  #define DRM_BUDDY_CLEARED                      BIT(4)
> +#define DRM_BUDDY_TRIM_DISABLE                 BIT(5)
>
>  struct drm_buddy_block {
>  #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>                            unsigned long flags);
>
>  int drm_buddy_block_trim(struct drm_buddy *mm,
> +                        u64 *start,
>                          u64 new_size,
>                          struct list_head *blocks);
>
> --
> 2.25.1
>
