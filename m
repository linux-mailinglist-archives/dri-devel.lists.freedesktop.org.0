Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DD6A1DD5C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 21:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A8310E305;
	Mon, 27 Jan 2025 20:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vIB9YwjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D9810E5B4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 20:28:40 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-215740b7fb8so31915ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 12:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1738009720; x=1738614520;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d5OAdXw40aZ4dT7REZL8UkCNLdOIipIEDQD+Nm1Wqv8=;
 b=vIB9YwjMpNRWl9MqOQ0i+Tg505nJq9H3UR8ype5S3l+XwuJX4miFNZL7elPBoFD5KB
 9r3Oaw3IDThaPUF/XNpnfutRcpZ2C/gECijXztpTriD5iOazA3TjV2cRmGfhtZO3aBy2
 8lvwJ/5465tcpJLElm6eVY1t6fTgm/va05swzpCgP/OMp2x3cia1JbeB/DC2nsFK3TKh
 iKe8XYJWK3btXC8We2GPtcOZ3DbnBmERno9cFjnX+Fw7+jCQSg6sOaf/72bwawUb1iiE
 HZmZfIaSrF6s83Ct4Prc2ZBRladVya+A4tcxczSDRf2lYObt2q/b7j4kSlaODdF+v12O
 wA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738009720; x=1738614520;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d5OAdXw40aZ4dT7REZL8UkCNLdOIipIEDQD+Nm1Wqv8=;
 b=g767JIaD5TSu1jiRqZWOJlzsgVSXxIqcTKPd07ppWCkZYcTIzLCVRZ3FWp15aIZTGy
 iqtyT6x88Ul7FbO2OS3lK9ROZcnBfhWKOH6p9n5w8T8SYhvgKe3jXIiiS9AI8kbSNGZZ
 Fbz9JtbtePEY3Ss73fzVnlC8oDr6aYQKR+3QXty76VvWQk/UrlOpcm7OIil7kXsGpQpH
 Wp3D5laXZMcGWbhyHo+G5OzGSADLIv5Ssd9lCAlneCxdCOTACOlONzoLAvgittQgLjLW
 JOudrv5IXcfkmrHX3scmuiurZuQLUwpJDnVdZt0WwTZx/1lrZzIxkmjbvg/3De0KALI2
 BTag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiCotlRZaJt5puRCzrb1R3QjUveCLIUNt1wCzATsRCKq68MgymrlJh7X08YpG1tF+TaHudLtnMoYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmKOP+eIZE11iRIZn54y36EpbyKh9U0UnWHYjs47pEFWCcoHeh
 uGSMtf6QXev9qo0t2vdNck03GEg8Ij8t77JHVICcFuIQM204SQ5IBhWoHlsfCtC3w2i0CGI2sGW
 e6yu3dfe52XQmDUGNsj9ccPgHJzG6gdGTupK4
X-Gm-Gg: ASbGnctfR6ohnTtXVy3bam+YVU5bWtZk/G83E1x1J0tkNcQ4yFlNIradAZU7WkzWCWL
 sTjTeYO4DVT4VzOgF874RrjSyEpxI8HtKwnXP54qarhux7SO/H3D6XOveczP9
X-Google-Smtp-Source: AGHT+IHQQWlj9A5Y+oU1MNKOjRz24HDoHDlGL9yFwzCrpFh7hRMi1+6J5hAZDLP/0s8perABjyvTuA6qZzS+Lt5CfPM=
X-Received: by 2002:a17:902:d54d:b0:215:7ced:9d66 with SMTP id
 d9443c01a7336-21dcce27897mr433355ad.10.1738009719528; Mon, 27 Jan 2025
 12:28:39 -0800 (PST)
MIME-Version: 1.0
References: <20250116155340.533180-1-bgeffon@google.com>
 <Z5fUu6XwUrZESb5H@intel.com>
In-Reply-To: <Z5fUu6XwUrZESb5H@intel.com>
From: Brian Geffon <bgeffon@google.com>
Date: Mon, 27 Jan 2025 15:28:03 -0500
X-Gm-Features: AWEUYZmrdWBrpeOq77qUt8ll3RhZFOiic5MYZqwb2Iuf8OL_KV5fC51sJr6Th5M
Message-ID: <CADyq12weg0ydT90Nc62AYE6w45oY4onU19C2MWU6nT6SWr7PSA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/i915: Fix page cleanup on DMA remap failure
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com, 
 jani.saarinen@intel.com, tomasz.mistat@intel.com, vidya.srinivas@intel.com, 
 jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, stable@vger.kernel.org, 
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

On Mon, Jan 27, 2025 at 1:47=E2=80=AFPM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Jan 16, 2025 at 10:53:40AM -0500, Brian Geffon wrote:
> > When converting to folios the cleanup path of shmem_get_pages() was
> > missed. When a DMA remap fails and the max segment size is greater than
> > PAGE_SIZE it will attempt to retry the remap with a PAGE_SIZEd segment
> > size. The cleanup code isn't properly using the folio apis and as a
> > result isn't handling compound pages correctly.
> >
> > v1 -> v2:
> >   (Ville) Fixed locations where we were not clearing mapping unevictabl=
e.
> >
> > Cc: stable@vger.kernel.org
> > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13487
> > Link: https://lore.kernel.org/lkml/20250116135636.410164-1-bgeffon@goog=
le.com/
> > Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a foli=
o_batch")
> > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > Suggested-by: Tomasz Figa <tfiga@google.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_object.h |  3 +--
> >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 23 +++++++++-------------
> >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  7 ++++---
> >  3 files changed, 14 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/d=
rm/i915/gem/i915_gem_object.h
> > index 3dc61cbd2e11..0f122a12d4a5 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> > @@ -843,8 +843,7 @@ int shmem_sg_alloc_table(struct drm_i915_private *i=
915, struct sg_table *st,
> >                        size_t size, struct intel_memory_region *mr,
> >                        struct address_space *mapping,
> >                        unsigned int max_segment);
> > -void shmem_sg_free_table(struct sg_table *st, struct address_space *ma=
pping,
> > -                      bool dirty, bool backup);
> > +void shmem_sg_free_table(struct sg_table *st, bool dirty, bool backup)=
;
> >  void __shmem_writeback(size_t size, struct address_space *mapping);
> >
> >  #ifdef CONFIG_MMU_NOTIFIER
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_shmem.c
> > index fe69f2c8527d..b320d9dfd6d3 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > @@ -29,16 +29,13 @@ static void check_release_folio_batch(struct folio_=
batch *fbatch)
> >       cond_resched();
> >  }
> >
> > -void shmem_sg_free_table(struct sg_table *st, struct address_space *ma=
pping,
> > -                      bool dirty, bool backup)
> > +void shmem_sg_free_table(struct sg_table *st, bool dirty, bool backup)
>
> This still makes the alloc vs. free completely asymmetric.
> This is not what we want because it just makes it very easy
> to make it mistake in the caller.
>
> I think the correct fix is to simply call the current
> shmem_sg_free_table() from the now broken failure path.
> mapping_{set,clear}_unevictable() just seems to be some
> bit operation so AFAICS the slight ping-pong should be
> inconsequential.

Ok, I guess that's true, it'll be set unevictable again in the call to
shmem_sg_alloc_table() after it jumps back to rebuild_st. I'll send a
v3 which should then become a 1 line change.

>
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
> >               struct folio *folio =3D page_folio(page);
> > @@ -180,10 +177,10 @@ int shmem_sg_alloc_table(struct drm_i915_private =
*i915, struct sg_table *st,
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
> > @@ -209,8 +206,6 @@ static int shmem_get_pages(struct drm_i915_gem_obje=
ct *obj)
> >       struct address_space *mapping =3D obj->base.filp->f_mapping;
> >       unsigned int max_segment =3D i915_sg_segment_size(i915->drm.dev);
> >       struct sg_table *st;
> > -     struct sgt_iter sgt_iter;
> > -     struct page *page;
> >       int ret;
> >
> >       /*
> > @@ -239,9 +234,8 @@ static int shmem_get_pages(struct drm_i915_gem_obje=
ct *obj)
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
> > @@ -265,7 +259,8 @@ static int shmem_get_pages(struct drm_i915_gem_obje=
ct *obj)
> >       return 0;
> >
> >  err_pages:
> > -     shmem_sg_free_table(st, mapping, false, false);
> > +     mapping_clear_unevictable(mapping);
> > +     shmem_sg_free_table(st, false, false);
> >       /*
> >        * shmemfs first checks if there is enough memory to allocate the=
 page
> >        * and reports ENOSPC should there be insufficient, along with th=
e usual
> > @@ -402,8 +397,8 @@ void i915_gem_object_put_pages_shmem(struct drm_i91=
5_gem_object *obj, struct sg_
> >       if (i915_gem_object_needs_bit17_swizzle(obj))
> >               i915_gem_object_save_bit_17_swizzle(obj, pages);
> >
> > -     shmem_sg_free_table(pages, file_inode(obj->base.filp)->i_mapping,
> > -                         obj->mm.dirty, obj->mm.madv =3D=3D I915_MADV_=
WILLNEED);
> > +     mapping_clear_unevictable(file_inode(obj->base.filp)->i_mapping);
> > +     shmem_sg_free_table(pages, obj->mm.dirty, obj->mm.madv =3D=3D I91=
5_MADV_WILLNEED);
> >       kfree(pages);
> >       obj->mm.dirty =3D false;
> >  }
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/=
i915/gem/i915_gem_ttm.c
> > index 10d8673641f7..37f51a04b838 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > @@ -232,7 +232,8 @@ static int i915_ttm_tt_shmem_populate(struct ttm_de=
vice *bdev,
> >       return 0;
> >
> >  err_free_st:
> > -     shmem_sg_free_table(st, filp->f_mapping, false, false);
> > +     mapping_clear_unevictable(filp->f_mapping);
> > +     shmem_sg_free_table(st, false, false);
> >
> >       return err;
> >  }
> > @@ -243,8 +244,8 @@ static void i915_ttm_tt_shmem_unpopulate(struct ttm=
_tt *ttm)
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
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel

Thanks,
Brian
