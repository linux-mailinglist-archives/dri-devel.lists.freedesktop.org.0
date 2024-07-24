Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2B93AAA4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 03:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E214F10E1CC;
	Wed, 24 Jul 2024 01:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NrtgrSAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB0C10E108;
 Wed, 24 Jul 2024 01:35:51 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso115917066b.3; 
 Tue, 23 Jul 2024 18:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721784950; x=1722389750; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OMf60xVBkQ+Rjr71R7UMsE7+Wb+qK8ndvSVpStOEZpo=;
 b=NrtgrSATZXEbjev80MCBh50IdCE5BoBwsnkVV8v1pW8KvRBRm513RPXjeGwVi9EBrb
 yj6HyyZ5P7Guk5FJLm7TDQcTZz/JTZNz7oVKQR/OfmgQ2Ex2V8iThlk29cOoMg8gC3bh
 Rkg5nhvGB26dUAczHiYu1gknaAR1xLY2L9KGPS5yOY8We8ziQA/gtCM9TsBS410kdLBG
 7uCXtRoxHGXZb1VGjXZSImifgv+fs+JtEVh3Dsrl+XO2agVBvlJ3FSZEejXJaGUdyDqM
 Gb7tb8VZdOcbKoKIAsDOToxx0zV11Iaa1EcnmV+jwgfpSD658v/UFVf5ESUR+JuN6M6y
 fDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721784950; x=1722389750;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OMf60xVBkQ+Rjr71R7UMsE7+Wb+qK8ndvSVpStOEZpo=;
 b=SRkyoN97yVoLKyL0vnVBneVh1dWaVE+vOqo1NoN5jYxhNMEPCz91P02mJvi/upyxjz
 U6X0brIioNs5h7QERfmyRyo4CVxvM0ASkGASUcWEvOhJopPp5wkYXg81Hj1rQyb6NECE
 cfSLKNWkK97qkaXFr0bH6n3o/cArfzmQ/NIUQER8PV5I3+99L/DQwyC+oMTdGfVci3Yr
 P22HDgo8dO6cxWivdM3icz8B+SbfVhjnbWkGQ9DYpF9UIiUr0gh6rIg7PnGDs7glGw0G
 cYU8GSJSPyulgWabt0SZMznp2JHak5mhc7mrntQqcKADwEsWfqnow6gODSPGuW1cdcrf
 7XAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMzYfmh4rq8lleF7jwD7dFvFZMPqxRDGwRRn2tINnMEN0t12iUTvRD/NoG+XTMSHFI1crj+Fh9DAUetOERoQ2pCyxslcP2jigpohKHl0xzM+4zzfncIA6lf63ybkYJIYpeaDphlGq1ux2p0DtRdyW3Y7VCxY+mSwpwaJhUNGMMznc3BL1xf/VybEPSQY+02A==
X-Gm-Message-State: AOJu0YwzMCwQOIU/x5maWMx+Q/yBfUeEdpY2naqPQGYbvrTzH6E3mwj6
 osJa4Rst0vRnNt9XjqQIL0Bn8KJiaRA0fg+Ps/AM6M5UGae76B14L0StUEY6D+XRNw1dY2oPHau
 S/27eoyjAtLlKR5i/WUXIfXNHsDE=
X-Google-Smtp-Source: AGHT+IGgZRlF71z0isp2NsjRZNiwNywAxNZ6NqQrKN5aauMsY17d7HNmMZeJF5MnNoKgIa2LAlblHHv6KRf7mpRV92w=
X-Received: by 2002:a17:907:72c1:b0:a7a:a138:dbd4 with SMTP id
 a640c23a62f3a-a7ab10247f0mr37425566b.64.1721784949493; Tue, 23 Jul 2024
 18:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
 <0de0d6fa-64f0-4ada-89c3-c188a7ae36f8@amd.com>
 <f23ebf02-b67c-4bc6-9244-730edd49fa98@intel.com>
In-Reply-To: <f23ebf02-b67c-4bc6-9244-730edd49fa98@intel.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Tue, 23 Jul 2024 21:35:37 -0400
Message-ID: <CAAxE2A57f0DwdzWF2qk1U2HA8d3pN=8CqQaKFVihcmxXdUu3Vw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] drm/buddy: Add start address support to trim
 function
To: Matthew Auld <matthew.auld@intel.com>
Cc: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Min,
 Frank" <frank.min@amd.com>, 
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>
Content-Type: multipart/alternative; boundary="0000000000004b5a5c061df44c34"
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

--0000000000004b5a5c061df44c34
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The reason is that our DCC requires 768K alignment in some cases. I haven't
read this patch series, but one way to do that is to align to 256K,
overallocate by 512K, and then not use either 0, 256K, or 512K at the
beginning to get to 768K alignment.

Marek

On Tue, Jul 23, 2024, 11:04 Matthew Auld <matthew.auld@intel.com> wrote:

> On 23/07/2024 14:43, Paneer Selvam, Arunpravin wrote:
> > Hi Matthew,
> >
> > Can we push this version for now as we need to mainline the DCC changes
> > ASAP,
> > while we continue our discussion and proceed to implement the permanent
> > solution
> > for address alignment?
>
> Yeah, we can always merge now and circle back around later, if this for
> sure helps your usecase and is needed asap. I just didn't fully get the
> idea for needing this interface, but likely I am missing something.
>
> >
> > Thanks,
> > Arun.
> >
> > On 7/23/2024 6:55 PM, Arunpravin Paneer Selvam wrote:
> >> - Add a new start parameter in trim function to specify exact
> >>    address from where to start the trimming. This would help us
> >>    in situations like if drivers would like to do address alignment
> >>    for specific requirements.
> >>
> >> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
> >>    flag to disable the allocator trimming part. This patch enables
> >>    the drivers control trimming and they can do it themselves
> >>    based on the application requirements.
> >>
> >> v1:(Matthew)
> >>    - check new_start alignment with min chunk_size
> >>    - use range_overflows()
> >>
> >> Signed-off-by: Arunpravin Paneer Selvam <
> Arunpravin.PaneerSelvam@amd.com>
> >> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> ---
> >>   drivers/gpu/drm/drm_buddy.c          | 25 +++++++++++++++++++++++--
> >>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
> >>   include/drm/drm_buddy.h              |  2 ++
> >>   3 files changed, 26 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> >> index 6a8e45e9d0ec..103c185bb1c8 100644
> >> --- a/drivers/gpu/drm/drm_buddy.c
> >> +++ b/drivers/gpu/drm/drm_buddy.c
> >> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct
> >> drm_buddy *mm,
> >>    * drm_buddy_block_trim - free unused pages
> >>    *
> >>    * @mm: DRM buddy manager
> >> + * @start: start address to begin the trimming.
> >>    * @new_size: original size requested
> >>    * @blocks: Input and output list of allocated blocks.
> >>    * MUST contain single block as input to be trimmed.
> >> @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct
> >> drm_buddy *mm,
> >>    * 0 on success, error code on failure.
> >>    */
> >>   int drm_buddy_block_trim(struct drm_buddy *mm,
> >> +             u64 *start,
> >>                u64 new_size,
> >>                struct list_head *blocks)
> >>   {
> >>       struct drm_buddy_block *parent;
> >>       struct drm_buddy_block *block;
> >> +    u64 block_start, block_end;
> >>       LIST_HEAD(dfs);
> >>       u64 new_start;
> >>       int err;
> >> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
> >>                    struct drm_buddy_block,
> >>                    link);
> >> +    block_start =3D drm_buddy_block_offset(block);
> >> +    block_end =3D block_start + drm_buddy_block_size(mm, block);
> >> +
> >>       if (WARN_ON(!drm_buddy_block_is_allocated(block)))
> >>           return -EINVAL;
> >> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
> >>       if (new_size =3D=3D drm_buddy_block_size(mm, block))
> >>           return 0;
> >> +    new_start =3D block_start;
> >> +    if (start) {
> >> +        new_start =3D *start;
> >> +
> >> +        if (new_start < block_start)
> >> +            return -EINVAL;
> >> +
> >> +        if (!IS_ALIGNED(new_start, mm->chunk_size))
> >> +            return -EINVAL;
> >> +
> >> +        if (range_overflows(new_start, new_size, block_end))
> >> +            return -EINVAL;
> >> +    }
> >> +
> >>       list_del(&block->link);
> >>       mark_free(mm, block);
> >>       mm->avail +=3D drm_buddy_block_size(mm, block);
> >> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
> >>       parent =3D block->parent;
> >>       block->parent =3D NULL;
> >> -    new_start =3D drm_buddy_block_offset(block);
> >>       list_add(&block->tmp_link, &dfs);
> >>       err =3D  __alloc_range(mm, &dfs, new_start, new_size, blocks, NU=
LL);
> >>       if (err) {
> >> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> >>       } while (1);
> >>       /* Trim the allocated block to the required size */
> >> -    if (original_size !=3D size) {
> >> +    if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
> >> +        original_size !=3D size) {
> >>           struct list_head *trim_list;
> >>           LIST_HEAD(temp);
> >>           u64 trim_size;
> >> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> >>           }
> >>           drm_buddy_block_trim(mm,
> >> +                     NULL,
> >>                        trim_size,
> >>                        trim_list);
> >> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> >> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> >> index fe3779fdba2c..423b261ea743 100644
> >> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> >> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> >> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct
> >> ttm_resource_manager *man,
> >>       } while (remaining_size);
> >>       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> >> -        if (!drm_buddy_block_trim(mm, vres->base.size, &vres->blocks)=
)
> >> +        if (!drm_buddy_block_trim(mm, NULL, vres->base.size,
> >> &vres->blocks))
> >>               size =3D vres->base.size;
> >>       }
> >> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> >> index 2a74fa9d0ce5..9689a7c5dd36 100644
> >> --- a/include/drm/drm_buddy.h
> >> +++ b/include/drm/drm_buddy.h
> >> @@ -27,6 +27,7 @@
> >>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
> >>   #define DRM_BUDDY_CLEAR_ALLOCATION        BIT(3)
> >>   #define DRM_BUDDY_CLEARED            BIT(4)
> >> +#define DRM_BUDDY_TRIM_DISABLE            BIT(5)
> >>   struct drm_buddy_block {
> >>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> >> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
> >>                  unsigned long flags);
> >>   int drm_buddy_block_trim(struct drm_buddy *mm,
> >> +             u64 *start,
> >>                u64 new_size,
> >>                struct list_head *blocks);
> >>
> >> base-commit: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b
> >
>

--0000000000004b5a5c061df44c34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The reason is that our DCC requires 768K alignment in som=
e cases. I haven&#39;t read this patch series, but one way to do that is to=
 align to 256K, overallocate by 512K, and then not use either 0, 256K, or 5=
12K at the beginning to get to 768K alignment.<div dir=3D"auto"><div dir=3D=
"auto"><br></div><div dir=3D"auto">Marek</div></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 23, 2024, 1=
1:04 Matthew Auld &lt;<a href=3D"mailto:matthew.auld@intel.com">matthew.aul=
d@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 23/07=
/2024 14:43, Paneer Selvam, Arunpravin wrote:<br>
&gt; Hi Matthew,<br>
&gt; <br>
&gt; Can we push this version for now as we need to mainline the DCC change=
s <br>
&gt; ASAP,<br>
&gt; while we continue our discussion and proceed to implement the permanen=
t <br>
&gt; solution<br>
&gt; for address alignment?<br>
<br>
Yeah, we can always merge now and circle back around later, if this for <br=
>
sure helps your usecase and is needed asap. I just didn&#39;t fully get the=
 <br>
idea for needing this interface, but likely I am missing something.<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Arun.<br>
&gt; <br>
&gt; On 7/23/2024 6:55 PM, Arunpravin Paneer Selvam wrote:<br>
&gt;&gt; - Add a new start parameter in trim function to specify exact<br>
&gt;&gt; =C2=A0=C2=A0 address from where to start the trimming. This would =
help us<br>
&gt;&gt; =C2=A0=C2=A0 in situations like if drivers would like to do addres=
s alignment<br>
&gt;&gt; =C2=A0=C2=A0 for specific requirements.<br>
&gt;&gt;<br>
&gt;&gt; - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this<br>
&gt;&gt; =C2=A0=C2=A0 flag to disable the allocator trimming part. This pat=
ch enables<br>
&gt;&gt; =C2=A0=C2=A0 the drivers control trimming and they can do it thems=
elves<br>
&gt;&gt; =C2=A0=C2=A0 based on the application requirements.<br>
&gt;&gt;<br>
&gt;&gt; v1:(Matthew)<br>
&gt;&gt; =C2=A0=C2=A0 - check new_start alignment with min chunk_size<br>
&gt;&gt; =C2=A0=C2=A0 - use range_overflows()<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Arunpravin Paneer Selvam &lt;<a href=3D"mailto:Arun=
pravin.PaneerSelvam@amd.com" target=3D"_blank" rel=3D"noreferrer">Arunpravi=
n.PaneerSelvam@amd.com</a>&gt;<br>
&gt;&gt; Acked-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd=
.com" target=3D"_blank" rel=3D"noreferrer">alexander.deucher@amd.com</a>&gt=
;<br>
&gt;&gt; Acked-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koe=
nig@amd.com" target=3D"_blank" rel=3D"noreferrer">christian.koenig@amd.com<=
/a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 drivers/gpu/drm/drm_buddy.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 25 +++++++++++++++++++++++--<br>
&gt;&gt; =C2=A0 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |=C2=A0 2 +-<br>
&gt;&gt; =C2=A0 include/drm/drm_buddy.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++<br>
&gt;&gt; =C2=A0 3 files changed, 26 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_bud=
dy.c<br>
&gt;&gt; index 6a8e45e9d0ec..103c185bb1c8 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/drm_buddy.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/drm_buddy.c<br>
&gt;&gt; @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct <b=
r>
&gt;&gt; drm_buddy *mm,<br>
&gt;&gt; =C2=A0=C2=A0 * drm_buddy_block_trim - free unused pages<br>
&gt;&gt; =C2=A0=C2=A0 *<br>
&gt;&gt; =C2=A0=C2=A0 * @mm: DRM buddy manager<br>
&gt;&gt; + * @start: start address to begin the trimming.<br>
&gt;&gt; =C2=A0=C2=A0 * @new_size: original size requested<br>
&gt;&gt; =C2=A0=C2=A0 * @blocks: Input and output list of allocated blocks.=
<br>
&gt;&gt; =C2=A0=C2=A0 * MUST contain single block as input to be trimmed.<b=
r>
&gt;&gt; @@ -866,11 +867,13 @@ static int __alloc_contig_try_harder(struct =
<br>
&gt;&gt; drm_buddy *mm,<br>
&gt;&gt; =C2=A0=C2=A0 * 0 on success, error code on failure.<br>
&gt;&gt; =C2=A0=C2=A0 */<br>
&gt;&gt; =C2=A0 int drm_buddy_block_trim(struct drm_buddy *mm,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 u64 *start,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 u64 new_size,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct list_head *blocks)<br>
&gt;&gt; =C2=A0 {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_buddy_block *parent;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_buddy_block *block;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 u64 block_start, block_end;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LIST_HEAD(dfs);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 new_start;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err;<br>
&gt;&gt; @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_buddy_block,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 link);<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 block_start =3D drm_buddy_block_offset(block);=
<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 block_end =3D block_start + drm_buddy_block_si=
ze(mm, block);<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON(!drm_buddy_block_is_all=
ocated(block)))<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIN=
VAL;<br>
&gt;&gt; @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct drm_buddy *mm=
,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (new_size =3D=3D drm_buddy_block=
_size(mm, block))<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;<b=
r>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 new_start =3D block_start;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (start) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new_start =3D *start;<=
br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (new_start &lt; blo=
ck_start)<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EINVAL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!IS_ALIGNED(new_st=
art, mm-&gt;chunk_size))<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EINVAL;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (range_overflows(ne=
w_start, new_size, block_end))<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return -EINVAL;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_del(&amp;block-&gt;link);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mark_free(mm, block);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm-&gt;avail +=3D drm_buddy_block_s=
ize(mm, block);<br>
&gt;&gt; @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy *mm,=
<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent =3D block-&gt;parent;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 block-&gt;parent =3D NULL;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 new_start =3D drm_buddy_block_offset(block);<b=
r>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 list_add(&amp;block-&gt;tmp_link, &=
amp;dfs);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D=C2=A0 __alloc_range(mm, &am=
p;dfs, new_start, new_size, blocks, NULL);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err) {<br>
&gt;&gt; @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy =
*mm,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (1);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Trim the allocated block to the =
required size */<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0 if (original_size !=3D size) {<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (!(flags &amp; DRM_BUDDY_TRIM_DISABLE) &amp=
;&amp;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 original_size !=3D siz=
e) {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct list=
_head *trim_list;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LIST_HEAD(t=
emp);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 trim_si=
ze;<br>
&gt;&gt; @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy =
*mm,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_buddy_b=
lock_trim(mm,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trim_siz=
e,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trim_lis=
t);<br>
&gt;&gt; diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c <br>
&gt;&gt; b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c<br>
&gt;&gt; index fe3779fdba2c..423b261ea743 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c<br>
&gt;&gt; @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct <br>
&gt;&gt; ttm_resource_manager *man,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (remaining_size);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (place-&gt;flags &amp; TTM_PL_FL=
AG_CONTIGUOUS) {<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!drm_buddy_block_t=
rim(mm, vres-&gt;base.size, &amp;vres-&gt;blocks))<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!drm_buddy_block_t=
rim(mm, NULL, vres-&gt;base.size, <br>
&gt;&gt; &amp;vres-&gt;blocks))<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 size =3D vres-&gt;base.size;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h<br>
&gt;&gt; index 2a74fa9d0ce5..9689a7c5dd36 100644<br>
&gt;&gt; --- a/include/drm/drm_buddy.h<br>
&gt;&gt; +++ b/include/drm/drm_buddy.h<br>
&gt;&gt; @@ -27,6 +27,7 @@<br>
&gt;&gt; =C2=A0 #define DRM_BUDDY_CONTIGUOUS_ALLOCATION=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)<br>
&gt;&gt; =C2=A0 #define DRM_BUDDY_CLEAR_ALLOCATION=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(3)<br>
&gt;&gt; =C2=A0 #define DRM_BUDDY_CLEARED=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)<br>
&gt;&gt; +#define DRM_BUDDY_TRIM_DISABLE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(5)<br>
&gt;&gt; =C2=A0 struct drm_buddy_block {<br>
&gt;&gt; =C2=A0 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)<br>
&gt;&gt; @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *m=
m,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long flags);<br>
&gt;&gt; =C2=A0 int drm_buddy_block_trim(struct drm_buddy *mm,<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 u64 *start,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 u64 new_size,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 struct list_head *blocks);<br>
&gt;&gt;<br>
&gt;&gt; base-commit: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b<br>
&gt; <br>
</blockquote></div>

--0000000000004b5a5c061df44c34--
