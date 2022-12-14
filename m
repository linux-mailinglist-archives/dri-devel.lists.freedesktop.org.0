Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0608F64D20C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 23:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7904410E4A8;
	Wed, 14 Dec 2022 22:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A437710E4A4;
 Wed, 14 Dec 2022 22:02:29 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-142b72a728fso18529702fac.9; 
 Wed, 14 Dec 2022 14:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CHqqGiu7bjPtMDWYi9f2Odo86D5HUF5FSIG3qyrejAo=;
 b=exIywM6NmlUvni/Ejgyx7FJw2CriC3asXSWeEsZubFM42Sv7gjeLvJB3AKRAklU1Qx
 bZ9uOmM37uTOWD/DlyFDB9u4MZwWZ6n46nL8O3RVzNyDY1rYQEeahJtq5CIGFD02f2eK
 r8/Lqo6xoPBPoaISd6YO+wuvIQ8aGxybZXsXEZ6qT9nPPT1u+4+Ba8+Tpf9PfOfvBpwz
 JVEji9ZkFncSSfT1zoUGG8SPFcEJz2IgTJJspzvIQL19+C9qCleTMVIA23sNvN7+pgyx
 EqwGukNiFioMgGdnQpD7sYuK85UZcZtk/pze13nFt2BmJUmhyPzfCjtGNuh6WaMaZcEq
 akQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CHqqGiu7bjPtMDWYi9f2Odo86D5HUF5FSIG3qyrejAo=;
 b=0fQKE3kw77vVtKQL5RMkp4akBbe+7+lnGCGzpdfJnieTJgZomOpX8NQ4A7Bqr6GfId
 wuovSMlcSlWmg05tvrxa02tEEK5XHnjFIFjbY/Sqgs18iNU3azxrsJ3TF1ejeI8LVZQD
 AqrE/me6IxTRK94opHxNtT7qAnH7WEIE4icSftVbhYb5xdszN/fLnYb5kvWaY2422q7n
 CXGlTTtZgsbScZTjO8VR3ZBLgevVAzZ0PxhcXAooNb2QNTwbtfoRPgARM1gaqLShLS5t
 mssecQXipToj4DSz1ntBxjBIKWL1FWU7ySIwwCVdGtEBJXkKWn1yhg8p8GMSl9sdbkXj
 C8Cw==
X-Gm-Message-State: AFqh2kpvMxKmiRlacPvQB8p+LperVwy+hEzlyIXoxlVpp5Q0zh0Si0/E
 bxoE6bedJwvt9Dd792K0V6ps6dHr9Ttiz5C0D4HcZjlxU50=
X-Google-Smtp-Source: AMrXdXvg+TstAO0CfcycB4xtYJBzdbbKRkkM3c96vACkGyJhoLn8xgOIJT/acXdWahReLW9SfR9GEWNwqe+q8werqvs=
X-Received: by 2002:a05:6870:4687:b0:143:8a81:116c with SMTP id
 a7-20020a056870468700b001438a81116cmr426024oap.96.1671055348736; Wed, 14 Dec
 2022 14:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20221211114226.57398-1-luben.tuikov@amd.com>
 <20221212020821.8248-1-luben.tuikov@amd.com>
 <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
In-Reply-To: <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Dec 2022 17:02:17 -0500
Message-ID: <CADnq5_MoD7oEXGivWPqO0m3XpqqAhg2k=X+zXcNPePYGpq0keQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
To: Robin Murphy <robin.murphy@arm.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Mikhail Krylov <sqarert@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-12-12 02:08, Luben Tuikov wrote:
> > Fix screen corruption on older 32-bit systems using AGP chips.
> >
> > On older systems with little memory, for instance 1.5 GiB, using an AGP chip,
> > the device's DMA mask is 0xFFFFFFFF, but the memory mask is 0x7FFFFFF, and
> > subsequently dma_addressing_limited() returns 0xFFFFFFFF < 0x7FFFFFFF,
> > false. As such the result of this static inline isn't suitable for the last
> > argument to ttm_device_init()--it simply needs to now whether to use GFP_DMA32
> > when allocating DMA buffers.
>
> This sounds wrong to me. If the issues happen on systems without PAE it
> clearly can't have anything to with the actual DMA address size. Not to
> mention that AFAICS 32-bit x86 doesn't even have ZONE_DMA32, so
> GFP_DMA32 would be functionally meaningless anyway. Although the
> reported symptoms initially sounded like they could be caused by DMA
> going to the wrong place, that is also equally consistent with a loss of
> cache coherency.
>
> My (limited) understanding of AGP is that the GART can effectively alias
> memory to a second physical address, so I could well believe that
> something somewhere in the driver stack needs to perform some cache
> maintenance to avoid coherency issues, and that in these particular
> setups whatever that is might be assuming the memory is direct-mapped
> and thus going wrong for highmem pages.
>
> So as I said before, I really think this is not about using GFP_DMA32 at
> all, but about *not* using GFP_HIGHUSER.

One of the wonderful features of AGP is that it has to be used with
uncached memory.  The aperture basically just provides a remapping of
physical pages into a linear aperture that you point the GPU at.  TTM
has to jump through quite a few hoops to get uncached memory in the
first place, so it's likely that that somehow isn't compatible with
HIGHMEM.  Can you get uncached HIGHMEM?

Alex

>
> Thanks,
> Robin.
>
> > Partially reverts commit 33b3ad3788aba846fc8b9a065fe2685a0b64f713.
> >
> > v2: Amend the commit description.
> >
> > Cc: Mikhail Krylov <sqarert@gmail.com>
> > Cc: Alex Deucher <Alexander.Deucher@amd.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
> > Cc: AMD Graphics <amd-gfx@lists.freedesktop.org>
> > Fixes: 33b3ad3788aba8 ("drm/radeon: handle PCIe root ports with addressing limitations")
> > Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> > ---
> >   drivers/gpu/drm/radeon/radeon.h        | 1 +
> >   drivers/gpu/drm/radeon/radeon_device.c | 2 +-
> >   drivers/gpu/drm/radeon/radeon_ttm.c    | 2 +-
> >   3 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> > index 37dec92339b16a..4fe38fd9be3267 100644
> > --- a/drivers/gpu/drm/radeon/radeon.h
> > +++ b/drivers/gpu/drm/radeon/radeon.h
> > @@ -2426,6 +2426,7 @@ struct radeon_device {
> >       struct radeon_wb                wb;
> >       struct radeon_dummy_page        dummy_page;
> >       bool                            shutdown;
> > +     bool                            need_dma32;
> >       bool                            need_swiotlb;
> >       bool                            accel_working;
> >       bool                            fastfb_working; /* IGP feature*/
> > diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> > index 6344454a772172..3643a3cfe061bd 100644
> > --- a/drivers/gpu/drm/radeon/radeon_device.c
> > +++ b/drivers/gpu/drm/radeon/radeon_device.c
> > @@ -1370,7 +1370,7 @@ int radeon_device_init(struct radeon_device *rdev,
> >       if (rdev->family == CHIP_CEDAR)
> >               dma_bits = 32;
> >   #endif
> > -
> > +     rdev->need_dma32 = dma_bits == 32;
> >       r = dma_set_mask_and_coherent(&rdev->pdev->dev, DMA_BIT_MASK(dma_bits));
> >       if (r) {
> >               pr_warn("radeon: No suitable DMA available\n");
> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> > index bdb4c0e0736ba2..3debaeb720d173 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -696,7 +696,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
> >                              rdev->ddev->anon_inode->i_mapping,
> >                              rdev->ddev->vma_offset_manager,
> >                              rdev->need_swiotlb,
> > -                            dma_addressing_limited(&rdev->pdev->dev));
> > +                            rdev->need_dma32);
> >       if (r) {
> >               DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
> >               return r;
> >
> > base-commit: 20e03e7f6e8efd42168db6d3fe044b804e0ede8f
