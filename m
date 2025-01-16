Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C226EA13CB0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 15:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3428010E991;
	Thu, 16 Jan 2025 14:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EHR/XjN6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA0910E991
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 14:49:32 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21625b4f978so128915ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 06:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1737038972; x=1737643772;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vmbhmXrEcyGo2D5DqzmnLa71MmIT85zAP83gX/RAoWg=;
 b=EHR/XjN6sJsXwFcCN5cvKydgovPsVED9ah7XIkmooxAZIS4RuyXS1TwEdsFlsX+/S+
 H/vJ+uU8TFWfU/7Y0qTUSQeO2vthIwqQ6arrGnoloMK6VFHQ+nmJV2JfoxMki+A6vazF
 m3gWm29kVxB0v2XqXsTS6F56NPuMr99k97AEGyNlK0QWylf02NdlkUPO51HYVP2Cd2bG
 f+SNNb1qELibpJp12C1MB8ogs+KxeaJaVS94yKTn0tbttO/MXxBizVXWKbr2tFgg7/NM
 LtHKoy+ZwP06RyQ63GQh9Nf/qSIPHpdo7Qm/JnnOmrq32D+W71M3tx65O5sDS5EgExUG
 fgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737038972; x=1737643772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vmbhmXrEcyGo2D5DqzmnLa71MmIT85zAP83gX/RAoWg=;
 b=V1vfKIX0gDtRfmPLS3XTBPQAVt3gpPdGIHwQa/c6pLu2vtHi8Xq7Kf7fg+/ssayQDR
 uhRO9JI76L7QQHOR7y8/Pp8HYxoET/XxNv3xlirY+4I/54smHLuwtxLLaN7Vkp+XwOb6
 I1+wDT9zzTatX7zei+5SFNQkoZQOZYCnbludTqCEH8RJR9PHKc8r0JvV+aAipaACuxvm
 sUHqvzQZWKVM97ApCC43QVZe0BpUCIJQyNLIQ6EQS/+EO0YrYCeALezjIddDem5krkjW
 59X3+boHUPWVFuZn6vxI2v+pbAPdADiaLFe+LGcvRsK9zMc3bJp1E0MEAcsjtegSOlaQ
 JFiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn1IoF0UV/iVvKW84loZKL0owX04GtpdHXI9Qm2Nm5h1Jt/FSIIMBF7+VD6qSEwqvxN5gSY8Map34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS85pGBAfyY/3eoZeevV82SRTwNsZBnna4UuPQeklSZgxwvMAC
 t9fq/EevxDfO70m8STvSg9NPcnLsLcjI/eApXgkWEoqtNwQnWNeheRMSD2c/xYWnnbY1XRYKp8X
 C6sqNeCMA0mqpra28qVz6WQWaMbwcLQ5cC4ko
X-Gm-Gg: ASbGncuixTqET4ZHSjyG/KkXQpeo1RIt5OaqCUN+NhAglcTsS0WOf09zhQ04bdTIjz6
 1iXOYGW0CqMukd16RjA+JziC3Y3PuTapM0PZK
X-Google-Smtp-Source: AGHT+IEkayqXP9hVA/niwuSQtpw1znZXwKf2ghaQUNEQNb2CeseyINjv/0ruuJ1Hlxy2ZlTpmwMNGlAkIe4M2i8Qneo=
X-Received: by 2002:a17:903:2594:b0:215:42a3:e844 with SMTP id
 d9443c01a7336-21c15ec7849mr2181575ad.17.1737038972154; Thu, 16 Jan 2025
 06:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20250116135636.410164-1-bgeffon@google.com>
 <Z4kWms-eFWxddspp@intel.com> <Z4kZx1q2JLsdjjzY@intel.com>
In-Reply-To: <Z4kZx1q2JLsdjjzY@intel.com>
From: Brian Geffon <bgeffon@google.com>
Date: Thu, 16 Jan 2025 09:48:55 -0500
X-Gm-Features: AbW1kvZDg7V_mWfE6yJK3vQ2k0-mQrlnKoQiXZtoJd8QbbsMGVsJHS3V6fCHOLk
Message-ID: <CADyq12zbwJAGdZO1=SQvAGE9+cEeeWEAE=DXzDz_a_8n9mUrPw@mail.gmail.com>
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

On Thu, Jan 16, 2025 at 9:38=E2=80=AFAM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Thu, Jan 16, 2025 at 04:24:26PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Thu, Jan 16, 2025 at 08:56:36AM -0500, Brian Geffon wrote:
> > > When converting to folios the cleanup path of shmem_get_pages() was
> > > missed. When a DMA remap fails and the max segment size is greater th=
an
> > > PAGE_SIZE it will attempt to retry the remap with a PAGE_SIZEd segmen=
t
> > > size. The cleanup code isn't properly using the folio apis and as a
> > > result isn't handling compound pages correctly.
> > >
> > > Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13487
> > > Fixes: 0b62af28f249 ("i915: convert shmem_sg_free_table() to use a fo=
lio_batch")
> > > Signed-off-by: Brian Geffon <bgeffon@google.com>
> > > Suggested-by: Tomasz Figa <tfiga@google.com>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 13 +++++--------
> > >  1 file changed, 5 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/=
drm/i915/gem/i915_gem_shmem.c
> > > index fe69f2c8527d..02ddab5bf5c0 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> > > @@ -37,8 +37,6 @@ void shmem_sg_free_table(struct sg_table *st, struc=
t address_space *mapping,
> > >     struct folio *last =3D NULL;
> > >     struct page *page;
> > >
> > > -   mapping_clear_unevictable(mapping);
> > > -
> >
> > The assymmetry here between the alloc vs. free is a bit annoying.
> > Maybe we can just keep this here?
>
> Actually, I guess it's a bit more than just annoying since
> shmem_sg_free_table() is actually used from outside i915_gem_shmem.c
> as well.

You're correct, this was a bad oversight on my part. This patch is
going to require a v2 regardless, how do you feel about just changing
shmem_sg_free_table() to not accept a mapping given that managing the
mapping is really orthogonal to cleaning up the sg table.

>
> >
> > Or if avoiding the ping-pong actually mattes in the gtt prepare
> > error case, then maybe we should rename this guy into
> > __shmem_sg_free_table() without the mapping_clear_unevictable()
> > and wrap it in a higher level shmem_sg_free_table() that does
> > everything?
> >
> > >     folio_batch_init(&fbatch);
> > >     for_each_sgt_page(page, sgt_iter, st) {
> > >             struct folio *folio =3D page_folio(page);
> > > @@ -180,10 +178,10 @@ int shmem_sg_alloc_table(struct drm_i915_privat=
e *i915, struct sg_table *st,
> > >     return 0;
> > >  err_sg:
> > >     sg_mark_end(sg);
> > > +   mapping_clear_unevictable(mapping);
> > >     if (sg !=3D st->sgl) {
> > >             shmem_sg_free_table(st, mapping, false, false);
> > >     } else {
> > > -           mapping_clear_unevictable(mapping);
> > >             sg_free_table(st);
> > >     }
> > >
> > > @@ -209,8 +207,6 @@ static int shmem_get_pages(struct drm_i915_gem_ob=
ject *obj)
> > >     struct address_space *mapping =3D obj->base.filp->f_mapping;
> > >     unsigned int max_segment =3D i915_sg_segment_size(i915->drm.dev);
> > >     struct sg_table *st;
> > > -   struct sgt_iter sgt_iter;
> > > -   struct page *page;
> > >     int ret;
> > >
> > >     /*
> > > @@ -239,9 +235,8 @@ static int shmem_get_pages(struct drm_i915_gem_ob=
ject *obj)
> > >              * for PAGE_SIZE chunks instead may be helpful.
> > >              */
> > >             if (max_segment > PAGE_SIZE) {
> > > -                   for_each_sgt_page(page, sgt_iter, st)
> > > -                           put_page(page);
> > > -                   sg_free_table(st);
> > > +                   /* Leave the mapping unevictable while we retry *=
/
> > > +                   shmem_sg_free_table(st, mapping, false, false);
> > >                     kfree(st);
> > >
> > >                     max_segment =3D PAGE_SIZE;
> > > @@ -265,6 +260,7 @@ static int shmem_get_pages(struct drm_i915_gem_ob=
ject *obj)
> > >     return 0;
> > >
> > >  err_pages:
> > > +   mapping_clear_unevictable(mapping);
> > >     shmem_sg_free_table(st, mapping, false, false);
> > >     /*
> > >      * shmemfs first checks if there is enough memory to allocate the=
 page
> > > @@ -402,6 +398,7 @@ void i915_gem_object_put_pages_shmem(struct drm_i=
915_gem_object *obj, struct sg_
> > >     if (i915_gem_object_needs_bit17_swizzle(obj))
> > >             i915_gem_object_save_bit_17_swizzle(obj, pages);
> > >
> > > +   mapping_clear_unevictable(file_inode(obj->base.filp)->i_mapping);
> > >     shmem_sg_free_table(pages, file_inode(obj->base.filp)->i_mapping,
> > >                         obj->mm.dirty, obj->mm.madv =3D=3D I915_MADV_=
WILLNEED);
> > >     kfree(pages);
> > > --
> > > 2.48.0.rc2.279.g1de40edade-goog
> >
> > --
> > Ville Syrj=C3=A4l=C3=A4
> > Intel
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
