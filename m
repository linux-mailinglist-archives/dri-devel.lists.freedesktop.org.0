Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8AD5AF521
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0F610EA6A;
	Tue,  6 Sep 2022 19:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C93810EA6A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:58:04 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so8634195wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=xVv6Xk9+wtMMfK0r4PHpL32bnpTEGeAraL/Ln7EwJ6w=;
 b=FqALK1B1koxUpfn3CBl/o09mWhuXsU3wEOBxoLi7YRXkpVDN9o4nPdDy4NwXjTKB9q
 X2UiJCF8suFvzUWlvyrF+oG1CV1jm8UGVicYgy5j275bSjJsqpWhNYtYu5YcpjfNJlHX
 qHM/ja6RpAwokCUCwrDSAvu26c9/9k8+eZrhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xVv6Xk9+wtMMfK0r4PHpL32bnpTEGeAraL/Ln7EwJ6w=;
 b=q0LLv5O379WPwIYj1ngDVGJeT97XZpRNm8jX428L6WyUgTtaa/UgT25kurtenjuBxH
 741gW4ZcbfKZeGR1AUN16xtNZwkeZx9Lo1KKcT2MgH1C1FpFRk7RihIp+cLiPe5CPkCb
 3TnWGbAsoJKoYW8WfyRETqa8qDqj/cAAP9hC9NYK9rAKxk30ld9B6jd08Bym3ZAA8GOn
 SE8IrtVMnCMmH8kc6X4giX0etr3c4p1Ku9qFN8je9c30H/e5yXutBq9CCB0Tg8M12Wwr
 87QKGeunkagyArpAwS3sC7G5zHACTNvGct/JMxgU8qk5XaSghnE0df1g/OPCjQHhycGC
 V9Kw==
X-Gm-Message-State: ACgBeo2TsWEsAXf6O6WbJ+WTs7Nw9Gw3XXe5DW89q4kShhMGv2yr9618
 0RpMwyrky7jr+r2plv/UDtW+wQ==
X-Google-Smtp-Source: AA6agR479IxBARDkBX4e8PfOBv7gCdnQ+hVCFZp7AZ2YxgTRsusFAKKc9Zin0/w1csvhZxeNERUOKw==
X-Received: by 2002:a05:600c:3482:b0:3a6:e09:1ebf with SMTP id
 a2-20020a05600c348200b003a60e091ebfmr31815wmq.173.1662494282484; 
 Tue, 06 Sep 2022 12:58:02 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b0020e6ce4dabdsm13769526wro.103.2022.09.06.12.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:58:02 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:58:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
Subject: Re: [PATCH v6 1/6] drm/ttm: Add new callbacks to ttm res mgr
Message-ID: <YxemSP4IrQQtmHps@phenom.ffwll.local>
References: <20220812133048.2814-1-Arunpravin.PaneerSelvam@amd.com>
 <b6ade0fe-367a-21f3-1942-a9d7eefcf1d3@amd.com>
 <b0b4f3a0-0df5-8d2a-c1a0-ad6d721e9cba@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b0b4f3a0-0df5-8d2a-c1a0-ad6d721e9cba@amd.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 10:33:16AM +0530, Arunpravin Paneer Selvam wrote:
> 
> 
> On 8/15/2022 4:35 PM, Christian König wrote:
> > Am 12.08.22 um 15:30 schrieb Arunpravin Paneer Selvam:
> > > We are adding two new callbacks to ttm resource manager
> > > function to handle intersection and compatibility of
> > > placement and resources.
> > > 
> > > v2: move the amdgpu and ttm_range_manager changes to
> > >      separate patches (Christian)
> > > v3: rename "intersect" to "intersects" (Matthew)
> > > v4: move !place check to the !res if and return false
> > >      in ttm_resource_compatible() function (Christian)
> > > v5: move bits of code from patch number 6 to avoid
> > >      temporary driver breakup (Christian)
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > Signed-off-by: Arunpravin Paneer Selvam
> > > <Arunpravin.PaneerSelvam@amd.com>
> > 
> > Patch #6 could still be cleaned up more now that we have the workaround
> > code in patch #1, but that not really a must have.
> > 
> > Reviewed-by: Christian König <christian.koenig@amd.com> for the entire
> > series.
> > 
> > Do you already have commit rights?
> 
> Hi Christian,
> I applied for drm-misc commit rights, waiting for the project maintainers to
> approve my request.

Why do all drivers have to implement the current behaviour? Can we have a
default implementation, which gets called if nothing is set instead?

I'm a bit confused why the bloat here ...

Also please document new callbacks precisely with inline kerneldoc. I know
ttm docs aren't great yet, but they don't get better if we don't start
somewhere. I think the in-depth comments for modeset vfuncs (e.g. in
drm_modeset_helper_vtables.h) are a good standard here.
-Daniel

> 
> Thanks,
> Arun
> > 
> > Regards,
> > Christian.
> > 
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_bo.c       |  9 ++--
> > >   drivers/gpu/drm/ttm/ttm_resource.c | 77 +++++++++++++++++++++++++++++-
> > >   include/drm/ttm/ttm_resource.h     | 40 ++++++++++++++++
> > >   3 files changed, 119 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > > index c1bd006a5525..f066e8124c50 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > > @@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object
> > > *bo,
> > >   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
> > >                     const struct ttm_place *place)
> > >   {
> > > +    struct ttm_resource *res = bo->resource;
> > > +    struct ttm_device *bdev = bo->bdev;
> > > +
> > >       dma_resv_assert_held(bo->base.resv);
> > >       if (bo->resource->mem_type == TTM_PL_SYSTEM)
> > >           return true;
> > > @@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct
> > > ttm_buffer_object *bo,
> > >       /* Don't evict this BO if it's outside of the
> > >        * requested placement range
> > >        */
> > > -    if (place->fpfn >= (bo->resource->start +
> > > bo->resource->num_pages) ||
> > > -        (place->lpfn && place->lpfn <= bo->resource->start))
> > > -        return false;
> > > -
> > > -    return true;
> > > +    return ttm_resource_intersects(bdev, res, place, bo->base.size);
> > >   }
> > >   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
> > >   diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
> > > b/drivers/gpu/drm/ttm/ttm_resource.c
> > > index 20f9adcc3235..0d1f862a582b 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_resource.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> > > @@ -253,10 +253,84 @@ void ttm_resource_free(struct
> > > ttm_buffer_object *bo, struct ttm_resource **res)
> > >   }
> > >   EXPORT_SYMBOL(ttm_resource_free);
> > >   +/**
> > > + * ttm_resource_intersects - test for intersection
> > > + *
> > > + * @bdev: TTM device structure
> > > + * @res: The resource to test
> > > + * @place: The placement to test
> > > + * @size: How many bytes the new allocation needs.
> > > + *
> > > + * Test if @res intersects with @place and @size. Used for testing
> > > if evictions
> > > + * are valueable or not.
> > > + *
> > > + * Returns true if the res placement intersects with @place and @size.
> > > + */
> > > +bool ttm_resource_intersects(struct ttm_device *bdev,
> > > +                 struct ttm_resource *res,
> > > +                 const struct ttm_place *place,
> > > +                 size_t size)
> > > +{
> > > +    struct ttm_resource_manager *man;
> > > +
> > > +    if (!res)
> > > +        return false;
> > > +
> > > +    if (!place)
> > > +        return true;
> > > +
> > > +    man = ttm_manager_type(bdev, res->mem_type);
> > > +    if (!man->func->intersects) {
> > > +        if (place->fpfn >= (res->start + res->num_pages) ||
> > > +            (place->lpfn && place->lpfn <= res->start))
> > > +            return false;
> > > +
> > > +        return true;
> > > +    }
> > > +
> > > +    return man->func->intersects(man, res, place, size);
> > > +}
> > > +
> > > +/**
> > > + * ttm_resource_compatible - test for compatibility
> > > + *
> > > + * @bdev: TTM device structure
> > > + * @res: The resource to test
> > > + * @place: The placement to test
> > > + * @size: How many bytes the new allocation needs.
> > > + *
> > > + * Test if @res compatible with @place and @size.
> > > + *
> > > + * Returns true if the res placement compatible with @place and @size.
> > > + */
> > > +bool ttm_resource_compatible(struct ttm_device *bdev,
> > > +                 struct ttm_resource *res,
> > > +                 const struct ttm_place *place,
> > > +                 size_t size)
> > > +{
> > > +    struct ttm_resource_manager *man;
> > > +
> > > +    if (!res || !place)
> > > +        return false;
> > > +
> > > +    man = ttm_manager_type(bdev, res->mem_type);
> > > +    if (!man->func->compatible) {
> > > +        if (res->start < place->fpfn ||
> > > +            (place->lpfn && (res->start + res->num_pages) >
> > > place->lpfn))
> > > +            return false;
> > > +
> > > +        return true;
> > > +    }
> > > +
> > > +    return man->func->compatible(man, res, place, size);
> > > +}
> > > +
> > >   static bool ttm_resource_places_compat(struct ttm_resource *res,
> > >                          const struct ttm_place *places,
> > >                          unsigned num_placement)
> > >   {
> > > +    struct ttm_buffer_object *bo = res->bo;
> > > +    struct ttm_device *bdev = bo->bdev;
> > >       unsigned i;
> > >         if (res->placement & TTM_PL_FLAG_TEMPORARY)
> > > @@ -265,8 +339,7 @@ static bool ttm_resource_places_compat(struct
> > > ttm_resource *res,
> > >       for (i = 0; i < num_placement; i++) {
> > >           const struct ttm_place *heap = &places[i];
> > >   -        if (res->start < heap->fpfn || (heap->lpfn &&
> > > -            (res->start + res->num_pages) > heap->lpfn))
> > > +        if (!ttm_resource_compatible(bdev, res, heap, bo->base.size))
> > >               continue;
> > >             if ((res->mem_type == heap->mem_type) &&
> > > diff --git a/include/drm/ttm/ttm_resource.h
> > > b/include/drm/ttm/ttm_resource.h
> > > index ca89a48c2460..5afc6d664fde 100644
> > > --- a/include/drm/ttm/ttm_resource.h
> > > +++ b/include/drm/ttm/ttm_resource.h
> > > @@ -88,6 +88,38 @@ struct ttm_resource_manager_func {
> > >       void (*free)(struct ttm_resource_manager *man,
> > >                struct ttm_resource *res);
> > >   +    /**
> > > +     * struct ttm_resource_manager_func member intersects
> > > +     *
> > > +     * @man: Pointer to a memory type manager.
> > > +     * @res: Pointer to a struct ttm_resource to be checked.
> > > +     * @place: Placement to check against.
> > > +     * @size: Size of the check.
> > > +     *
> > > +     * Test if @res intersects with @place + @size. Used to judge if
> > > +     * evictions are valueable or not.
> > > +     */
> > > +    bool (*intersects)(struct ttm_resource_manager *man,
> > > +               struct ttm_resource *res,
> > > +               const struct ttm_place *place,
> > > +               size_t size);
> > > +
> > > +    /**
> > > +     * struct ttm_resource_manager_func member compatible
> > > +     *
> > > +     * @man: Pointer to a memory type manager.
> > > +     * @res: Pointer to a struct ttm_resource to be checked.
> > > +     * @place: Placement to check against.
> > > +     * @size: Size of the check.
> > > +     *
> > > +     * Test if @res compatible with @place + @size. Used to check of
> > > +     * the need to move the backing store or not.
> > > +     */
> > > +    bool (*compatible)(struct ttm_resource_manager *man,
> > > +               struct ttm_resource *res,
> > > +               const struct ttm_place *place,
> > > +               size_t size);
> > > +
> > >       /**
> > >        * struct ttm_resource_manager_func member debug
> > >        *
> > > @@ -329,6 +361,14 @@ int ttm_resource_alloc(struct ttm_buffer_object
> > > *bo,
> > >                  const struct ttm_place *place,
> > >                  struct ttm_resource **res);
> > >   void ttm_resource_free(struct ttm_buffer_object *bo, struct
> > > ttm_resource **res);
> > > +bool ttm_resource_intersects(struct ttm_device *bdev,
> > > +                 struct ttm_resource *res,
> > > +                 const struct ttm_place *place,
> > > +                 size_t size);
> > > +bool ttm_resource_compatible(struct ttm_device *bdev,
> > > +                 struct ttm_resource *res,
> > > +                 const struct ttm_place *place,
> > > +                 size_t size);
> > >   bool ttm_resource_compat(struct ttm_resource *res,
> > >                struct ttm_placement *placement);
> > >   void ttm_resource_set_bo(struct ttm_resource *res,
> > > 
> > > base-commit: 730c2bf4ad395acf0aa0820535fdb8ea6abe5df1
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
