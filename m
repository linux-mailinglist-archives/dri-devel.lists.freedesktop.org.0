Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50340A1B8D7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 16:20:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5359010E9AD;
	Fri, 24 Jan 2025 15:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="woBRRGQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8691310E9AD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 15:20:25 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-215740b7fb8so162205ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 07:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737732025; x=1738336825;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SYPf2LUjlgrOWAVceU7WuHio67CjjBc5MKyrd+YyW78=;
 b=woBRRGQUZQ9tXAsMejaDhVoEhaGekjl6VQQoKtDt4GoMrhRCR05m4whJlmA9kg0DXV
 jpAxzhADBy5Guuy31gztz13xPdrrKabf8In51AsndX7zvwmCaa0k0McONv0qqy8YXUkF
 F7dwR9wDv+qBRRCbyvAHYYnQ0L+Kikq41IueISDeliO6Pzvo/vZMPHnODR1AcfDQ5bXo
 4ebLxB0PayFzR2vbaa9W0RPng0PXIUR3nAhJeBfTwwk9hiO3DNHkD1xvmvuIKn6DFxYA
 0mzLCK8cUpy6x/K8Ljc/RKokSq0W+9mYKN3XAUkCXHruBkcK1rPHevNtDOpruEgJvHEF
 3PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737732025; x=1738336825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SYPf2LUjlgrOWAVceU7WuHio67CjjBc5MKyrd+YyW78=;
 b=ZsYAQ1zaNPjn3JAuzQkiRsxUXt7McuIxXntincjAiOpFIzpI1I291NINJpNWyHCzp+
 IeZikafzkeTmW2zI6OL1HNWg+iTru3Sjs58A8jlbYDjOfldClDIOu2DHRXZ9T3HSd8R7
 tla2tSXSyrdGjdbCIK4jXd1xmytF4m/nmwnMbCA6tTD9486vA+B1pUa2rSfpxDPmb/AN
 XAss5gyCXbHw28f3N2esvHfcH1uy7rnzosKut1uyYgNkzVHL/uIHhgZ+CPGLwKh35T2D
 ok619oU5J9ONSvEJdn7SUQF+mhLusFNdvt7EcGXAKuezTlszCd2tqjRIkRPZ7ABNZK2l
 Av+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUny0Q4bhJHbsHfE8llvIBNBg94/EEnfixy6twSOOG1LkqP6UidVNQsPlVMkmddBj+YnY2IBDn/XTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweK8fUQgN4cR/mUxP8VFWTaB0YwooMsDkwLPIHkAwqf2aAmmH5
 JhqJc1oR6uSjdbrHF3dSAfNA6G4t8k7j7WR6V7mwuA/nD4mTbpuAPnGe56tbgIRyvNuTJIwBFp/
 scpCjsE+b58F0TElbUxLuRQcRrS7EE5Oa0Kwi
X-Gm-Gg: ASbGncsR33NzMqhP+LX12iP3rKQkv3NH6Y1Xs9N0DFe3tDnfpOJtQtWcdNdqwmRyXqt
 +/qdxvEQCWOwPQw5OeAndZIOoGqdXFpGN1Xx3hUJ3M/wGvzXqBp9VcXiZZvr1
X-Google-Smtp-Source: AGHT+IG9ohQRM9HL76Qi+3nwEdd3Es5b/Nm30tErg2OwJ7Xs9TmLtXt37CZs7X0OMbTwlvFUfx+bMx0Iwf++I1DvJmw=
X-Received: by 2002:a17:903:320a:b0:20b:5e34:1850 with SMTP id
 d9443c01a7336-21d9ad2f38amr5652575ad.23.1737732023343; Fri, 24 Jan 2025
 07:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20250116155340.533180-1-bgeffon@google.com>
 <PH7PR11MB8252B7BF1D1B6ADE94839F8F89E02@PH7PR11MB8252.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB8252B7BF1D1B6ADE94839F8F89E02@PH7PR11MB8252.namprd11.prod.outlook.com>
From: Brian Geffon <bgeffon@google.com>
Date: Fri, 24 Jan 2025 10:19:47 -0500
X-Gm-Features: AWEUYZl6QulbUxISxp6-vL7i1ZnPpkKwqUg007rJfLqh0Cih4D1oUBq_JzuWIIw
Message-ID: <CADyq12xLorH1kzH6ezp2Z_SYv-AVbrp+h98FeYP+hbt2R1_1Nw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Fix page cleanup on DMA remap failure
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "Wilson, Chris P" <chris.p.wilson@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, 
 "Mistat, Tomasz" <tomasz.mistat@intel.com>, 
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Tomasz Figa <tfiga@google.com>
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

On Wed, Jan 22, 2025 at 10:07=E2=80=AFPM Srinivas, Vidya
<vidya.srinivas@intel.com> wrote:
>
> Hello Brian, Many thanks for the fix. I am adding my tested-by.
> Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>

Thanks for testing Vidya.

Can we get a maintainer to take a look?

>
>
> > -----Original Message-----
> > From: Brian Geffon <bgeffon@google.com>
> > Sent: 16 January 2025 21:24
> > To: intel-gfx@lists.freedesktop.org
> > Cc: Wilson, Chris P <chris.p.wilson@intel.com>; Saarinen, Jani
> > <jani.saarinen@intel.com>; Mistat, Tomasz <tomasz.mistat@intel.com>;
> > Srinivas, Vidya <vidya.srinivas@intel.com>; ville.syrjala@linux.intel.c=
om;
> > jani.nikula@linux.intel.com; linux-kernel@vger.kernel.org; dri-
> > devel@lists.freedesktop.org; Joonas Lahtinen
> > <joonas.lahtinen@linux.intel.com>; Brian Geffon <bgeffon@google.com>;
> > stable@vger.kernel.org; Tomasz Figa <tfiga@google.com>
> > Subject: [PATCH v2] drm/i915: Fix page cleanup on DMA remap failure
> >
> > When converting to folios the cleanup path of shmem_get_pages() was
> > missed. When a DMA remap fails and the max segment size is greater than
> > PAGE_SIZE it will attempt to retry the remap with a PAGE_SIZEd segment =
size.
> > The cleanup code isn't properly using the folio apis and as a result is=
n't
> > handling compound pages correctly.
> >
> > v1 -> v2:
> >   (Ville) Fixed locations where we were not clearing mapping unevictabl=
e.
> >
> > Cc: stable@vger.kernel.org
> > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13487
> > Link: https://lore.kernel.org/lkml/20250116135636.410164-1-
> > bgeffon@google.com/
> > Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a
> > folio_batch")
> > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > Suggested-by: Tomasz Figa <tfiga@google.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h |  3 +--
> > drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 23 +++++++++-------------
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  7 ++++---
> >  3 files changed, 14 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > index 3dc61cbd2e11..0f122a12d4a5 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > @@ -843,8 +843,7 @@ int shmem_sg_alloc_table(struct drm_i915_private
> > *i915, struct sg_table *st,
> >                        size_t size, struct intel_memory_region *mr,
> >                        struct address_space *mapping,
> >                        unsigned int max_segment);
> > -void shmem_sg_free_table(struct sg_table *st, struct address_space
> > *mapping,
> > -                      bool dirty, bool backup);
> > +void shmem_sg_free_table(struct sg_table *st, bool dirty, bool backup)=
;
> >  void __shmem_writeback(size_t size, struct address_space *mapping);
> >
> >  #ifdef CONFIG_MMU_NOTIFIER
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > index fe69f2c8527d..b320d9dfd6d3 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > @@ -29,16 +29,13 @@ static void check_release_folio_batch(struct
> > folio_batch *fbatch)
> >       cond_resched();
> >  }
> >
> > -void shmem_sg_free_table(struct sg_table *st, struct address_space
> > *mapping,
> > -                      bool dirty, bool backup)
> > +void shmem_sg_free_table(struct sg_table *st, bool dirty, bool backup)
> >  {
> >       struct sgt_iter sgt_iter;
> >       struct folio_batch fbatch;
> >       struct folio *last =3D NULL;
> >       struct page *page;
> >
> > -     mapping_clear_unevictable(mapping);
> > -
> >       folio_batch_init(&fbatch);
> >       for_each_sgt_page(page, sgt_iter, st) {
> >               struct folio *folio =3D page_folio(page); @@ -180,10 +177=
,10
> > @@ int shmem_sg_alloc_table(struct drm_i915_private *i915, struct sg_ta=
ble
> > *st,
> >       return 0;
> >  err_sg:
> >       sg_mark_end(sg);
> > +     mapping_clear_unevictable(mapping);
> >       if (sg !=3D st->sgl) {
> > -             shmem_sg_free_table(st, mapping, false, false);
> > +             shmem_sg_free_table(st, false, false);
> >       } else {
> > -             mapping_clear_unevictable(mapping);
> >               sg_free_table(st);
> >       }
> >
> > @@ -209,8 +206,6 @@ static int shmem_get_pages(struct
> > drm_i915_gem_object *obj)
> >       struct address_space *mapping =3D obj->base.filp->f_mapping;
> >       unsigned int max_segment =3D i915_sg_segment_size(i915->drm.dev);
> >       struct sg_table *st;
> > -     struct sgt_iter sgt_iter;
> > -     struct page *page;
> >       int ret;
> >
> >       /*
> > @@ -239,9 +234,8 @@ static int shmem_get_pages(struct
> > drm_i915_gem_object *obj)
> >                * for PAGE_SIZE chunks instead may be helpful.
> >                */
> >               if (max_segment > PAGE_SIZE) {
> > -                     for_each_sgt_page(page, sgt_iter, st)
> > -                             put_page(page);
> > -                     sg_free_table(st);
> > +                     /* Leave the mapping unevictable while we retry *=
/
> > +                     shmem_sg_free_table(st, false, false);
> >                       kfree(st);
> >
> >                       max_segment =3D PAGE_SIZE;
> > @@ -265,7 +259,8 @@ static int shmem_get_pages(struct
> > drm_i915_gem_object *obj)
> >       return 0;
> >
> >  err_pages:
> > -     shmem_sg_free_table(st, mapping, false, false);
> > +     mapping_clear_unevictable(mapping);
> > +     shmem_sg_free_table(st, false, false);
> >       /*
> >        * shmemfs first checks if there is enough memory to allocate the
> > page
> >        * and reports ENOSPC should there be insufficient, along with th=
e
> > usual @@ -402,8 +397,8 @@ void
> > i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj,
> > struct sg_
> >       if (i915_gem_object_needs_bit17_swizzle(obj))
> >               i915_gem_object_save_bit_17_swizzle(obj, pages);
> >
> > -     shmem_sg_free_table(pages, file_inode(obj->base.filp)->i_mapping,
> > -                         obj->mm.dirty, obj->mm.madv =3D=3D
> > I915_MADV_WILLNEED);
> > +     mapping_clear_unevictable(file_inode(obj->base.filp)->i_mapping);
> > +     shmem_sg_free_table(pages, obj->mm.dirty, obj->mm.madv =3D=3D
> > +I915_MADV_WILLNEED);
> >       kfree(pages);
> >       obj->mm.dirty =3D false;
> >  }
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > index 10d8673641f7..37f51a04b838 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -232,7 +232,8 @@ static int i915_ttm_tt_shmem_populate(struct
> > ttm_device *bdev,
> >       return 0;
> >
> >  err_free_st:
> > -     shmem_sg_free_table(st, filp->f_mapping, false, false);
> > +     mapping_clear_unevictable(filp->f_mapping);
> > +     shmem_sg_free_table(st, false, false);
> >
> >       return err;
> >  }
> > @@ -243,8 +244,8 @@ static void i915_ttm_tt_shmem_unpopulate(struct
> > ttm_tt *ttm)
> >       bool backup =3D ttm->page_flags & TTM_TT_FLAG_SWAPPED;
> >       struct sg_table *st =3D &i915_tt->cached_rsgt.table;
> >
> > -     shmem_sg_free_table(st, file_inode(i915_tt->filp)->i_mapping,
> > -                         backup, backup);
> > +     mapping_clear_unevictable(file_inode(i915_tt->filp)->i_mapping);
> > +     shmem_sg_free_table(st, backup, backup);
> >  }
> >
> >  static void i915_ttm_tt_release(struct kref *ref)
> > --
> > 2.48.0.rc2.279.g1de40edade-goog
>

Thanks
Brian
