Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C45B0CDA1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 01:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8AB210E145;
	Mon, 21 Jul 2025 23:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YAfHi6Ln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD18910E145
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 23:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753139784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0RANPUwLK/+IsiZ6Dm52cZEYEBOxN8znQ9xRdG6vVQQ=;
 b=YAfHi6LneK6RXr+V49CyVENa+PXy8i/hZezwgabSIo9ZgKQ0MrEDwSLpVogeM8E2cTcAUB
 Mp54ZIxmlUPxp8EvSclVohLMlTw934FGlf2LMxQFjipu+BqEQIh5RgaXw8bY+HGGVtdwJ0
 eh41QCvdDVoXvu7Qe9cVxRAd73ui0Tk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-8T14QfhnNyC7kJjCypmqTw-1; Mon, 21 Jul 2025 19:16:23 -0400
X-MC-Unique: 8T14QfhnNyC7kJjCypmqTw-1
X-Mimecast-MFC-AGG-ID: 8T14QfhnNyC7kJjCypmqTw_1753139782
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-313f702d37fso5101853a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 16:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753139782; x=1753744582;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0RANPUwLK/+IsiZ6Dm52cZEYEBOxN8znQ9xRdG6vVQQ=;
 b=DUTJUoGFFjTOhzTuNJmumWyvH3sJxFAiHowCtRSX9sKj6TR2XIiKv04D8BOtWLgbti
 xwEPsDQRj25a/4nVNmDzjZWHjJ4QymsHQSz4NVy71R8EqBn7Sm7FDJvrJYtyzHiI0WgW
 a0VBd5V2B8BCY5YQqnGs9sFtf4Bc8FOIS6KN8/7GAmbzP5EMJ0XAyuKHQTCo9KrYh8jJ
 udi1yyzC1xYujCzTjFacR761KN0pNcK48v1GxnaweDHnmJVAaav2+ZUC7VdApklu0S3b
 tp1Vjp2DlNWystgg6ms2JkGew/VzwjSkwdhp+8CFpXzMhvhDXeY+9E+wQVYgnEqxrm+b
 nn8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD1XIUAX14PVXARLsiZosVI4xsjMUQ+CT11rxz+dY+lSIfH3s5NOmFRNLEUefRUEPzjSHAO4GqKZ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTixJvfaJ92s8+OsOve/AZwQZkOEviE4qKnc6SFFLscj0pDgP0
 c45MMlf2QhMlwE1nHWAQgfjrdGXKDdPqWR5sJQkKY+Z095spcRkyiWwzx938qcSDo/VAyHkMbpZ
 N/qbrtvJHpQCPNFE9l2lo0go/rSLqo/yots0xqsz75YO+sfZg0/V3V/2RiTb9rvWBJPgVAogphK
 d4m1gwA5kulTsr4VaP+fQ3EozZMHBRkOcjejd6THeSMYy/
X-Gm-Gg: ASbGncsMPqh6T1YghiNDZ3rLFN72w6uDnXyteWqLK6KqQhdnr3Kz4a0BKJrff22dNcv
 5x6R4+zx04XkbOkr3P71UYWK+3ryxZmeWVT04wxtq5s7pDXWs+vesA2nMMAn4AbasmIByAgeXBM
 +aDUfy3CSkjbtZHZo2mss=
X-Received: by 2002:a17:90a:f945:b0:31e:4112:4031 with SMTP id
 98e67ed59e1d1-31e4112423fmr346196a91.30.1753139782046; 
 Mon, 21 Jul 2025 16:16:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVllUE0kmokZ1rSFDEaxeK1PBlFYNYGMDZAa5DZKKR/0uMFkT3Ygqlo2cbqSkCQZHg5Z+MdCRteXwtLMA85Cc=
X-Received: by 2002:a17:90a:f945:b0:31e:4112:4031 with SMTP id
 98e67ed59e1d1-31e4112423fmr346163a91.30.1753139781564; Mon, 21 Jul 2025
 16:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250714052243.1149732-1-airlied@gmail.com>
 <20250714052243.1149732-14-airlied@gmail.com>
 <77949b3a-201d-4e7d-a51f-e77274e4a4be@amd.com>
 <CAMwc25qP-42wMX4UYhZWiYfvf_1dBVNL9TU9i_Wq7uZPqjQL5Q@mail.gmail.com>
In-Reply-To: <CAMwc25qP-42wMX4UYhZWiYfvf_1dBVNL9TU9i_Wq7uZPqjQL5Q@mail.gmail.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 22 Jul 2025 09:16:10 +1000
X-Gm-Features: Ac12FXyYV-2PTuPjVu6efxxbgIVKXXIhFVKn9Tqb1n6SV0qyL72jNnhdrGWhJXc
Message-ID: <CAMwc25pyqhcq-8ubGZT5UX5AYroewBYP6oFN-JmjzEkHgFLTrg@mail.gmail.com>
Subject: Re: [PATCH 13/18] ttm/pool: enable memcg tracking and shrinker. (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BAdSU_pzcF11Xp6R_stSZH65UhcolN5iwdkHr_DTO1w_1753139782
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

> > On 14.07.25 07:18, Dave Airlie wrote:
> > > From: Dave Airlie <airlied@redhat.com>
> > >
> > > This enables all the backend code to use the list lru in memcg mode,
> > > and set the shrinker to be memcg aware.
> > >
> > > It adds the loop case for when pooled pages end up being reparented
> > > to a higher memcg group, that newer memcg can search for them there
> > > and take them back.
> > >
> > > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > >
> > > ---
> > > v2: just use the proper stats.
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_pool.c | 126 ++++++++++++++++++++++++++-------
> > >  1 file changed, 102 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> > > index a4f4e27c6a1f..1e6da2cc1f06 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -142,7 +142,9 @@ static int ttm_pool_nid(struct ttm_pool *pool) {
> > >  }
> > >
> > >  /* Allocate pages of size 1 << order with the given gfp_flags */
> > > -static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> > > +static struct page *ttm_pool_alloc_page(struct ttm_pool *pool,
> > > +                                     struct obj_cgroup *objcg,
> > > +                                     gfp_t gfp_flags,
> > >                                       unsigned int order)
> > >  {
> > >       unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
> > > @@ -162,7 +164,10 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> > >               p = alloc_pages_node(pool->nid, gfp_flags, order);
> > >               if (p) {
> > >                       p->private = order;
> > > -                     mod_node_page_state(NODE_DATA(page_to_nid(p)), NR_GPU_ACTIVE, (1 << order));
> > > +                     if (!mem_cgroup_charge_gpu_page(objcg, p, order, gfp_flags, false)) {
> >
> > Thinking more about it that is way to late. At this point we can't fail the allocation any more.
> >
>
> I've tested it at least works, but there is a bit of a problem with
> it, because if we fail a 10 order allocation, it tries to fallback
> down the order hierarchy, when there is no point since it can't
> account the maximum size.
>
> > Otherwise we either completely break suspend or don't account system allocations to the correctly any more after resume.
>
> When you say suspend here, do you mean for VRAM allocations, normal
> system RAM allocations which are accounted here shouldn't have any
> effect on suspend/resume since they stay where they are. Currently it
> also doesn't try account for evictions at all.

I've just traced the global swapin/out paths as well and those seem
fine for memcg at this point, since they are called only after
populate/unpopulate. Now I haven't addressed the new xe swap paths,
because I don't have a test path, since amdgpu doesn't support those,
I was thinking I'd leave it on the list for when amdgpu goes to that
path, or I can spend some time on xe.

Dave.

> >
> > What we need is to reserve the memory on BO allocation and commit it when the TT backend is populated.
>
> I'm not sure what reserve vs commit is here, mem cgroup is really just
> reserve until you can reserve no more, it's just a single
> charge/uncharge stage. If we try and charge and we are over the limit,
> bad things will happen, either fail allocation or reclaim for the
> cgroup.
>
> Regards,
> Dave.

