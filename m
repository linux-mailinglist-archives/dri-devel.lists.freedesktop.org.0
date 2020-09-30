Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF9527E588
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 11:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A822589CFA;
	Wed, 30 Sep 2020 09:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59CB89CF4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 09:47:17 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x23so982773wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mk/10QMoJ+o57Gs0uKBi5jqLBb5COb+Y9kF4IXUlM/Q=;
 b=YslZyjVoOldROC3jA1fPKGoa2j+xP9ZMNK4SZUeZjFZmxDgc83XfrocubX8z+Ghi0i
 mxxZbyYhvNo/yzlGV7M9TYWiI6ebmWI5MPFUrLdFH5HEq/1glgvLqigSOT2sZCqvNTzQ
 5j2dQDwMw2raEHsSORmptJcNQAmWyQj8NQX/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mk/10QMoJ+o57Gs0uKBi5jqLBb5COb+Y9kF4IXUlM/Q=;
 b=CofjudcnNt+LwfCZ3SwOGGyWnUVXs9cMd2v9agm1Qb4ImHm+SEgun3GXiI7735An2p
 LxyrnPGXDdeQRD4YsLNoe6HVoXlKjX9M4sCJOXzx+9IBpCPan10mn+ePlxfP98fINDD2
 2bb9On5HASLjGO4izXw6uaWAn2LGaSl8gfrtHq2up6Nh/RWKeEl4sLm10BBPLS+nI/BV
 hh/gvtCgNsdofxEvUL6MwIBtP2F5Yh7btvoU0rsi7NBcGOxF/JiR5SKnjv2GSmk9V7oF
 XV1LYP0yTKSrkKRYqO35+WdBfGEH/Z1ddq9WNTesufCuvqgeSJFyTGF2+GVnvXFL0T9H
 G16g==
X-Gm-Message-State: AOAM533q7LRBxvbXiWCsBXsZ494a7cRUyChLrvGa/0gbzV2kem9wvk9H
 MEWl4pjpOnbwbK865QfTOqjwuA==
X-Google-Smtp-Source: ABdhPJy8QqpQoBX6MWQ3S7YZuW9WMNYB4GRIEped2k61Hp3lacYf00Zpjbck3DpWjhDxW2rcxoc68Q==
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr1952908wme.157.1601459236371; 
 Wed, 30 Sep 2020 02:47:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm1769842wmd.22.2020.09.30.02.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 02:47:15 -0700 (PDT)
Date: Wed, 30 Sep 2020 11:47:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
Message-ID: <20200930094712.GW438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: luben.tuikov@amd.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, ray.huang@amd.com, kraxel@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, lima@lists.freedesktop.org,
 oleksandr_andrushchenko@epam.com, krzk@kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 linux+etnaviv@armlinux.org.uk, spice-devel@lists.freedesktop.org,
 alyssa.rosenzweig@collabora.com, etnaviv@lists.freedesktop.org,
 hdegoede@redhat.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, tomeu.vizoso@collabora.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, yuq825@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian K=F6nig wrote:
> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
> > Hi
> > =

> > Am 30.09.20 um 10:05 schrieb Christian K=F6nig:
> > > Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
> > > > Hi Christian
> > > > =

> > > > Am 29.09.20 um 17:35 schrieb Christian K=F6nig:
> > > > > Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
> > > > > > The new helper ttm_kmap_obj_to_dma_buf() extracts address and l=
ocation
> > > > > > from and instance of TTM's kmap_obj and initializes struct dma_=
buf_map
> > > > > > with these values. Helpful for TTM-based drivers.
> > > > > We could completely drop that if we use the same structure inside=
 TTM as
> > > > > well.
> > > > > =

> > > > > Additional to that which driver is going to use this?
> > > > As Daniel mentioned, it's in patch 3. The TTM-based drivers will
> > > > retrieve the pointer via this function.
> > > > =

> > > > I do want to see all that being more tightly integrated into TTM, b=
ut
> > > > not in this series. This one is about fixing the bochs-on-sparc64
> > > > problem for good. Patch 7 adds an update to TTM to the DRM TODO lis=
t.
> > > I should have asked which driver you try to fix here :)
> > > =

> > > In this case just keep the function inside bochs and only fix it ther=
e.
> > > =

> > > All other drivers can be fixed when we generally pump this through TT=
M.
> > Did you take a look at patch 3? This function will be used by VRAM
> > helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, we
> > have to duplicate the functionality in each if these drivers. Bochs
> > itself uses VRAM helpers and doesn't touch the function directly.
> =

> Ah, ok can we have that then only in the VRAM helpers?
> =

> Alternative you could go ahead and use dma_buf_map in ttm_bo_kmap_obj
> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
> =

> What I want to avoid is to have another conversion function in TTM because
> what happens here is that we already convert from ttm_bus_placement to
> ttm_bo_kmap_obj and then to dma_buf_map.

Hm I'm not really seeing how that helps with a gradual conversion of
everything over to dma_buf_map and assorted helpers for access? There's
too many places in ttm drivers where is_iomem and related stuff is used to
be able to convert it all in one go. An intermediate state with a bunch of
conversions seems fairly unavoidable to me.
-Daniel

> =

> Thanks,
> Christian.
> =

> > =

> > Best regards
> > Thomas
> > =

> > > Regards,
> > > Christian.
> > > =

> > > > Best regards
> > > > Thomas
> > > > =

> > > > > Regards,
> > > > > Christian.
> > > > > =

> > > > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > ---
> > > > > >  =A0 include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
> > > > > >  =A0 include/linux/dma-buf-map.h=A0 | 20 ++++++++++++++++++++
> > > > > >  =A0 2 files changed, 44 insertions(+)
> > > > > > =

> > > > > > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm=
_bo_api.h
> > > > > > index c96a25d571c8..62d89f05a801 100644
> > > > > > --- a/include/drm/ttm/ttm_bo_api.h
> > > > > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > > > > @@ -34,6 +34,7 @@
> > > > > >  =A0 #include <drm/drm_gem.h>
> > > > > >  =A0 #include <drm/drm_hashtab.h>
> > > > > >  =A0 #include <drm/drm_vma_manager.h>
> > > > > > +#include <linux/dma-buf-map.h>
> > > > > >  =A0 #include <linux/kref.h>
> > > > > >  =A0 #include <linux/list.h>
> > > > > >  =A0 #include <linux/wait.h>
> > > > > > @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(s=
truct
> > > > > > ttm_bo_kmap_obj *map,
> > > > > >  =A0=A0=A0=A0=A0 return map->virtual;
> > > > > >  =A0 }
> > > > > >  =A0 +/**
> > > > > > + * ttm_kmap_obj_to_dma_buf_map
> > > > > > + *
> > > > > > + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
> > > > > > + * @map: Returns the mapping as struct dma_buf_map
> > > > > > + *
> > > > > > + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If t=
he memory
> > > > > > + * is not mapped, the returned mapping is initialized to NULL.
> > > > > > + */
> > > > > > +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_k=
map_obj
> > > > > > *kmap,
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 struct dma_buf_map *map)
> > > > > > +{
> > > > > > +=A0=A0=A0 bool is_iomem;
> > > > > > +=A0=A0=A0 void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_iomem=
);
> > > > > > +
> > > > > > +=A0=A0=A0 if (!vaddr)
> > > > > > +=A0=A0=A0=A0=A0=A0=A0 dma_buf_map_clear(map);
> > > > > > +=A0=A0=A0 else if (is_iomem)
> > > > > > +=A0=A0=A0=A0=A0=A0=A0 dma_buf_map_set_vaddr_iomem(map, (void _=
_force __iomem *)vaddr);
> > > > > > +=A0=A0=A0 else
> > > > > > +=A0=A0=A0=A0=A0=A0=A0 dma_buf_map_set_vaddr(map, vaddr);
> > > > > > +}
> > > > > > +
> > > > > >  =A0 /**
> > > > > >  =A0=A0 * ttm_bo_kmap
> > > > > >  =A0=A0 *
> > > > > > diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-bu=
f-map.h
> > > > > > index fd1aba545fdf..2e8bbecb5091 100644
> > > > > > --- a/include/linux/dma-buf-map.h
> > > > > > +++ b/include/linux/dma-buf-map.h
> > > > > > @@ -45,6 +45,12 @@
> > > > > >  =A0=A0 *
> > > > > >  =A0=A0 *=A0=A0=A0 dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> > > > > >  =A0=A0 *
> > > > > > + * To set an address in I/O memory, use dma_buf_map_set_vaddr_=
iomem().
> > > > > > + *
> > > > > > + * .. code-block:: c
> > > > > > + *
> > > > > > + *=A0=A0=A0 dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> > > > > > + *
> > > > > >  =A0=A0 * Test if a mapping is valid with either dma_buf_map_is=
_set() or
> > > > > >  =A0=A0 * dma_buf_map_is_null().
> > > > > >  =A0=A0 *
> > > > > > @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(s=
truct
> > > > > > dma_buf_map *map, void *vaddr)
> > > > > >  =A0=A0=A0=A0=A0 map->is_iomem =3D false;
> > > > > >  =A0 }
> > > > > >  =A0 +/**
> > > > > > + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping struct=
ure to
> > > > > > an address in I/O memory
> > > > > > + * @map:=A0=A0=A0=A0=A0=A0=A0 The dma-buf mapping structure
> > > > > > + * @vaddr_iomem:=A0=A0=A0 An I/O-memory address
> > > > > > + *
> > > > > > + * Sets the address and the I/O-memory flag.
> > > > > > + */
> > > > > > +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_=
map *map,
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 void __iomem *vaddr_iomem)
> > > > > > +{
> > > > > > +=A0=A0=A0 map->vaddr_iomem =3D vaddr_iomem;
> > > > > > +=A0=A0=A0 map->is_iomem =3D true;
> > > > > > +}
> > > > > > +
> > > > > >  =A0 /**
> > > > > >  =A0=A0 * dma_buf_map_is_equal - Compares two dma-buf mapping s=
tructures
> > > > > > for equality
> > > > > >  =A0=A0 * @lhs:=A0=A0=A0 The dma-buf mapping structure
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > _______________________________________________
> > > > amd-gfx mailing list
> > > > amd-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> > > =

> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > =

> > =

> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
