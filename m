Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46638A13C6A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:37:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046FC10E996;
	Thu, 16 Jan 2025 14:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="vzhLtDVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798BC10E990
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 14:37:19 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2163affd184so124795ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 06:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737038239; x=1737643039;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqSgv/8H0DBTYN+rPAt0t3RCgZqbNKAsy8uCTkwRxsM=;
 b=vzhLtDVXQHUmcyCMWreRtFqB3WO3I7lzSSdXtHqyt4hCSAqN2ZEOY/k2qDUVsw7ACb
 Dq4PWho9QHU+AY+IRpnAkdvq27XlIGIxlhCyo2PocgKCr/jfOMzZmQTZq5nX7c5BGAOo
 7Np0DG64QWP7jhSY9Op36yedye2jyFNg5Ni6M+VKKUqCWESN6/GJ+TA0LuhjHmOKBWAg
 ZgqzBKeFrvAPlG+GssWGeE7JHWNAkOSfqjICR8vmba4XkZVtRkeRqrQ/ZOMy5dNfFzvm
 SMf6Ot80X+Xc/F54e+ktZo+I/rbqLQIlrxhn9SZDyz1Ij2JyGRHWlkOtnLfuEXFN+Qyl
 GpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737038239; x=1737643039;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WqSgv/8H0DBTYN+rPAt0t3RCgZqbNKAsy8uCTkwRxsM=;
 b=gKkQTjZEf/uNYyEXdzFcq2mDlao3RvMbHxvLZd6qfKDYirAPnKFgAG2TsshcMXFQ3l
 yGvLUysXrxWnjqRyXP5kkSW2bXJ/VCx5sC+LVERwGmvDk6ANfBfpWY2e1Pmu6Dg/vhuT
 ynbGXODHJ5kDgdrJH+tanIVOnigZwH+3wPaov8ujlWaJP5s4sKJFVyB4B6skEvcUkleI
 kfUtQnDrogmY3e7gAOSjtdWfT9ssrTVyjUw/7J6SfJjqju0Zz+70cXxvWYK6TbEg05nX
 Kdvip80qLf0axjDy52HkRkTXNuB1MMyWz4bAyzWaBPb9npP0HJfjmPBoZzn2hEreYJCd
 fQsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7b2KrTcC7HH3K3oXIkpYsW3zz1+9HUGxfNlZBpMFN1bzMxxaD8kZ62FLNAROhTG3uz82MkZWQ7C8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAN+wI81Lk4Md6JN5wiSHEQoAphDm/O9ifdZpk9bIt/Bf9ZmaP
 cyD3rhOgfhgzWWc9xTue2xk/Yp3gCY2/aPREH2mM9vRxng+cd0Bbeyf8hPj1Z8lHLCbShOr0D/Z
 FsmMgdwxhqlead2X0Rg/ti+t328SY4PNaccRZ
X-Gm-Gg: ASbGncuAfwBVrhTOzIeMD2kSNDADjcEmqjsuhi2K9TmEvWdnGMDIvJwOaZXf3TC2NH5
 AfL/0E+4DPYJCLQ3+RcqCOB5OQC4KOZGcLSza
X-Google-Smtp-Source: AGHT+IHNxuBsIf1VhpjWSMSCtN/9MLnHe1BuB71hKtcL11gAHX7vxBhTputYamr3u4o2ohHVjPSSBpwdaVoTDkbE3vI=
X-Received: by 2002:a17:903:584:b0:216:7aaa:4c5f with SMTP id
 d9443c01a7336-21c15d778a8mr2086825ad.3.1737038238721; Thu, 16 Jan 2025
 06:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20250116135636.410164-1-bgeffon@google.com>
 <Z4kWms-eFWxddspp@intel.com>
In-Reply-To: <Z4kWms-eFWxddspp@intel.com>
From: Brian Geffon <bgeffon@google.com>
Date: Thu, 16 Jan 2025 09:36:42 -0500
X-Gm-Features: AbW1kvan9wa_quwd9k7dPslWgumViXqMYcXm_4zX7AA5ru3QFuCA9hCIgJjBWR0
Message-ID: <CADyq12yAG6fgnaaKLoKic+BU5qNBcbsNZxd6Cg+tNjQx2xxjWg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Fix page cleanup on DMA remap failure
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, chris.p.wilson@intel.com, 
 jani.saarinen@intel.com, tomasz.mistat@intel.com, vidya.srinivas@intel.com, 
 jani.nikula@linux.intel.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
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

On Thu, Jan 16, 2025 at 9:24=E2=80=AFAM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Jan 16, 2025 at 08:56:36AM -0500, Brian Geffon wrote:
> > When converting to folios the cleanup path of shmem_get_pages() was
> > missed. When a DMA remap fails and the max segment size is greater than
> > PAGE_SIZE it will attempt to retry the remap with a PAGE_SIZEd segment
> > size. The cleanup code isn't properly using the folio apis and as a
> > result isn't handling compound pages correctly.
> >
> > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13487
> > Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a foli=
o_batch")
> > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > Suggested-by: Tomasz Figa <tfiga@google.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_shmem.c
> > index fe69f2c8527d..02ddab5bf5c0 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > @@ -37,8 +37,6 @@ void shmem_sg_free_table(struct sg_table *st, struct =
address_space *mapping,
> >       struct folio *last =3D NULL;
> >       struct page *page;
> >
> > -     mapping_clear_unevictable(mapping);
> > -
>
> The assymmetry here between the alloc vs. free is a bit annoying.
> Maybe we can just keep this here?

If you want, I think this can also be fixed by something like the
following I believe.
Ultimately we don't want to put page on non-head pages in a compound
page. What do you think? If you like this better I can test and mail a v2.

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index fe69f2c8527d..b79cd396e878 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -239,8 +239,14 @@ static int shmem_get_pages(struct drm_i915_gem_object =
*obj)
                 * for PAGE_SIZE chunks instead may be helpful.
                 */
                if (max_segment > PAGE_SIZE) {
-                       for_each_sgt_page(page, sgt_iter, st)
+                       struct folio *last =3D NULL;
+                       for_each_sgt_page(page, sgt_iter, st) {
+                               struct folio *folio =3D page_folio(page);
+                               if (folio =3D=3D last)
+                                       continue;
+                               last =3D folio;
                                put_page(page);
+                       }
                        sg_free_table(st);
                        kfree(st);


--
2.48.0.rc2.279.g1de40edade-goog


>
> Or if avoiding the ping-pong actually mattes in the gtt prepare
> error case, then maybe we should rename this guy into
> __shmem_sg_free_table() without the mapping_clear_unevictable()
> and wrap it in a higher level shmem_sg_free_table() that does
> everything?
>
> >       folio_batch_init(&fbatch);
> >       for_each_sgt_page(page, sgt_iter, st) {
> >               struct folio *folio =3D page_folio(page);
> > @@ -180,10 +178,10 @@ int shmem_sg_alloc_table(struct drm_i915_private =
*i915, struct sg_table *st,
> >       return 0;
> >  err_sg:
> >       sg_mark_end(sg);
> > +     mapping_clear_unevictable(mapping);
> >       if (sg !=3D st->sgl) {
> >               shmem_sg_free_table(st, mapping, false, false);
> >       } else {
> > -             mapping_clear_unevictable(mapping);
> >               sg_free_table(st);
> >       }
> >
> > @@ -209,8 +207,6 @@ static int shmem_get_pages(struct drm_i915_gem_obje=
ct *obj)
> >       struct address_space *mapping =3D obj->base.filp->f_mapping;
> >       unsigned int max_segment =3D i915_sg_segment_size(i915->drm.dev);
> >       struct sg_table *st;
> > -     struct sgt_iter sgt_iter;
> > -     struct page *page;
> >       int ret;
> >
> >       /*
> > @@ -239,9 +235,8 @@ static int shmem_get_pages(struct drm_i915_gem_obje=
ct *obj)
> >                * for PAGE_SIZE chunks instead may be helpful.
> >                */
> >               if (max_segment > PAGE_SIZE) {
> > -                     for_each_sgt_page(page, sgt_iter, st)
> > -                             put_page(page);
> > -                     sg_free_table(st);
> > +                     /* Leave the mapping unevictable while we retry *=
/
> > +                     shmem_sg_free_table(st, mapping, false, false);
> >                       kfree(st);
> >
> >                       max_segment =3D PAGE_SIZE;
> > @@ -265,6 +260,7 @@ static int shmem_get_pages(struct drm_i915_gem_obje=
ct *obj)
> >       return 0;
> >
> >  err_pages:
> > +     mapping_clear_unevictable(mapping);
> >       shmem_sg_free_table(st, mapping, false, false);
> >       /*
> >        * shmemfs first checks if there is enough memory to allocate the=
 page
> > @@ -402,6 +398,7 @@ void i915_gem_object_put_pages_shmem(struct drm_i91=
5_gem_object *obj, struct sg_
> >       if (i915_gem_object_needs_bit17_swizzle(obj))
> >               i915_gem_object_save_bit_17_swizzle(obj, pages);
> >
> > +     mapping_clear_unevictable(file_inode(obj->base.filp)->i_mapping);
> >       shmem_sg_free_table(pages, file_inode(obj->base.filp)->i_mapping,
> >                           obj->mm.dirty, obj->mm.madv =3D=3D I915_MADV_=
WILLNEED);
> >       kfree(pages);
> > --
> > 2.48.0.rc2.279.g1de40edade-goog
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
