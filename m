Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C3B6D2896
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 21:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229C010F2DB;
	Fri, 31 Mar 2023 19:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AE310F2DB;
 Fri, 31 Mar 2023 19:17:51 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id bi31so17439410oib.9;
 Fri, 31 Mar 2023 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680290270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyUK9GE+quS5Hgwf5w2XMS5JC5zRXhYFpXjWFPP6RP8=;
 b=nJ5Fv5nX0WXNS4A8UEr5XTitzzM3A9uac9Xsb/j6+qCsiC1L7IKY1zKhLU2D6XfPLH
 6pmEKmgJDjUGKqKgmdOFb9OZMTcuAB4+9klV50H2mN2gyTAFR97deoOKuUooQznComz+
 J24BWLbKiw2nf3DSGB/NB/8rpG2DfLoNkjKWy6JZr+t31NqMsdUe40rYcGtVCjms/CDZ
 C/srtSFx880KA2IL+clSzAYNk/o4sfKxcdzAkV8IRoOC8FNocDEtt2YcDI1y5gKf8eUa
 4P0FBMCXzwZJIS+YJoZ+09SxOD0sG6vZkSDwbEPLmUlcmf522bKeH0btK3uZUss0wxk6
 PZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680290270;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyUK9GE+quS5Hgwf5w2XMS5JC5zRXhYFpXjWFPP6RP8=;
 b=NIQDP4qb+DuGl/37X9+WlaiHnwIfuw6OBCGI58YxnW5AAQi8WZRhBS84UEMIsEi/a7
 6zfvuoo73A8wMpX4rhZdryN11ttCGfPZShHMAaqNk3SvBx1ahSgNyPR9Xf8CSGfIvy39
 JJEqZss/QNzKU+OIhpiVMlWZtYDZ96sTi5GbAdR4EiH3BSSOQAFWuIfY8bCrD76h74t5
 7ihSV3QbOHMVfebVxh6vsusngOnLFzI8Zh22OZkMp18v2kagwLJBHXNNjzUZN+WI7su/
 NP5Qe8Bkj+Vn5aj4vN6iRkegSm0fy/Z268yHZIBmRoUf4VDNjnlYSARX3JtkJNE4GplJ
 z3ow==
X-Gm-Message-State: AAQBX9fBceHL7TmPGPcjMUhs6zrSIgxwWvTdLjZrp3KloSzCnWAzunYt
 8UIZcwd5tqZh4vN3N3eQv/BaeJMinp56U1BdrdPY5Ui/
X-Google-Smtp-Source: AKy350Z5Lw4lsx5IxbABdcfN0xax1adbEntwD2wG99oDjFQNyPVyWpYtOmpiMhr29+0LoYM1Hu8nGF3dIDfHzgwKji0=
X-Received: by 2002:a54:4019:0:b0:386:a2d0:2814 with SMTP id
 x25-20020a544019000000b00386a2d02814mr5024050oie.4.1680290270559; Fri, 31 Mar
 2023 12:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230330195043.1136322-1-alexander.deucher@amd.com>
 <aeb5c27e-121d-f666-249c-898e98d5ec2f@gmail.com>
In-Reply-To: <aeb5c27e-121d-f666-249c-898e98d5ec2f@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 31 Mar 2023 15:17:39 -0400
Message-ID: <CADnq5_MSAWnK18rbST28iJKTDM2Tr58wL7ak2CGoeJ845HTOqg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: add NUMA node id to the pool
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Felix Kuehling <felix.kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Graham Sider <graham.sider@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 2:54=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Should I push this to drm-misc-next or do we take it through
> amd-staging-drm-next?

I think either way is fine.  We can carry it internally as needed for
testing if you want to commit it to drm-misc-next.  I don't think
there are any direct code dependencies, but you or Rajneesh can
correct me if I'm wrong.

Alex

>
> Christian.
>
> Am 30.03.23 um 21:50 schrieb Alex Deucher:
> > From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> >
> > This allows backing ttm_tt structure with pages from different NUMA
> > pools.
> >
> > Tested-by: Graham Sider <graham.sider@amd.com>
> > Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_device.c |  2 +-
> >   drivers/gpu/drm/ttm/ttm_pool.c   | 13 ++++++++-----
> >   include/drm/ttm/ttm_pool.h       |  4 +++-
> >   3 files changed, 12 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm=
_device.c
> > index e7147e304637..4a8164a5320f 100644
> > --- a/drivers/gpu/drm/ttm/ttm_device.c
> > +++ b/drivers/gpu/drm/ttm/ttm_device.c
> > @@ -218,7 +218,7 @@ int ttm_device_init(struct ttm_device *bdev, struct=
 ttm_device_funcs *funcs,
> >       bdev->funcs =3D funcs;
> >
> >       ttm_sys_man_init(bdev);
> > -     ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
> > +     ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_=
dma32);
> >
> >       bdev->vma_manager =3D vma_manager;
> >       INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_p=
ool.c
> > index 9f6764bf3b15..1068a41cded1 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -92,7 +92,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_po=
ol *pool, gfp_t gfp_flags,
> >                       __GFP_KSWAPD_RECLAIM;
> >
> >       if (!pool->use_dma_alloc) {
> > -             p =3D alloc_pages(gfp_flags, order);
> > +             p =3D alloc_pages_node(pool->nid, gfp_flags, order);
> >               if (p)
> >                       p->private =3D order;
> >               return p;
> > @@ -286,7 +286,7 @@ static struct ttm_pool_type *ttm_pool_select_type(s=
truct ttm_pool *pool,
> >                                                 enum ttm_caching cachin=
g,
> >                                                 unsigned int order)
> >   {
> > -     if (pool->use_dma_alloc)
> > +     if (pool->use_dma_alloc || pool->nid !=3D NUMA_NO_NODE)
> >               return &pool->caching[caching].orders[order];
> >
> >   #ifdef CONFIG_X86
> > @@ -523,29 +523,32 @@ EXPORT_SYMBOL(ttm_pool_free);
> >    *
> >    * @pool: the pool to initialize
> >    * @dev: device for DMA allocations and mappings
> > + * @nid: NUMA node to use for allocations
> >    * @use_dma_alloc: true if coherent DMA alloc should be used
> >    * @use_dma32: true if GFP_DMA32 should be used
> >    *
> >    * Initialize the pool and its pool types.
> >    */
> >   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> > -                bool use_dma_alloc, bool use_dma32)
> > +                int nid, bool use_dma_alloc, bool use_dma32)
> >   {
> >       unsigned int i, j;
> >
> >       WARN_ON(!dev && use_dma_alloc);
> >
> >       pool->dev =3D dev;
> > +     pool->nid =3D nid;
> >       pool->use_dma_alloc =3D use_dma_alloc;
> >       pool->use_dma32 =3D use_dma32;
> >
> > -     if (use_dma_alloc) {
> > +     if (use_dma_alloc || nid !=3D NUMA_NO_NODE) {
> >               for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> >                       for (j =3D 0; j < MAX_ORDER; ++j)
> >                               ttm_pool_type_init(&pool->caching[i].orde=
rs[j],
> >                                                  pool, i, j);
> >       }
> >   }
> > +EXPORT_SYMBOL(ttm_pool_init);
> >
> >   /**
> >    * ttm_pool_fini - Cleanup a pool
> > @@ -559,7 +562,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
> >   {
> >       unsigned int i, j;
> >
> > -     if (pool->use_dma_alloc) {
> > +     if (pool->use_dma_alloc || pool->nid !=3D NUMA_NO_NODE) {
> >               for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> >                       for (j =3D 0; j < MAX_ORDER; ++j)
> >                               ttm_pool_type_fini(&pool->caching[i].orde=
rs[j]);
> > diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> > index ef09b23d29e3..23bd8be6d4f8 100644
> > --- a/include/drm/ttm/ttm_pool.h
> > +++ b/include/drm/ttm/ttm_pool.h
> > @@ -61,12 +61,14 @@ struct ttm_pool_type {
> >    * struct ttm_pool - Pool for all caching and orders
> >    *
> >    * @dev: the device we allocate pages for
> > + * @nid: which numa node to use
> >    * @use_dma_alloc: if coherent DMA allocations should be used
> >    * @use_dma32: if GFP_DMA32 should be used
> >    * @caching: pools for each caching/order
> >    */
> >   struct ttm_pool {
> >       struct device *dev;
> > +     int nid;
> >
> >       bool use_dma_alloc;
> >       bool use_dma32;
> > @@ -81,7 +83,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_=
tt *tt,
> >   void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
> >
> >   void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> > -                bool use_dma_alloc, bool use_dma32);
> > +                int nid, bool use_dma_alloc, bool use_dma32);
> >   void ttm_pool_fini(struct ttm_pool *pool);
> >
> >   int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>
