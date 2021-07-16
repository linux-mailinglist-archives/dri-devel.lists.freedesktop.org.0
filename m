Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6DA3CBC05
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 20:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3202E6E9CD;
	Fri, 16 Jul 2021 18:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEE46E9CC;
 Fri, 16 Jul 2021 18:45:25 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id z12so7831118qtj.3;
 Fri, 16 Jul 2021 11:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hdAetSsj+mXNeCALKxIX/QxUu8l+/9bBqxTHRGIfaiE=;
 b=LM1nxvqLIClMOsGqQbVLezpHTcQfpkbqykygAWXOLoe0r9XScWmEhTJBg7rfu8gkZc
 C02vylXkNrqtAqayWqeKkqYKPostmRiuwL0zyb/XK6nGx7qtBmWEBF1nnNW6lPO99II5
 T/iHbrtmhNchyaRmobthtCGngSiVvL/HePz56TbrT34W23ORv1/ap3WUMK9/FYfwafaU
 Fd10LgA8LUCvltMev+LV2HLTkwsU4zlYk2Ej+2eXubx6GIXOoJi2zJLfaJzEN0a8c+xv
 YH8j55vYD5IQGLYWe9M9Ul1WfdITkMtrTxIN+KtnQvzGhOdZh+bv+04NsmGwi7CcsGXK
 G48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hdAetSsj+mXNeCALKxIX/QxUu8l+/9bBqxTHRGIfaiE=;
 b=Ojg8EcHh8LbG/WuKefuaMXG0LZxG6sN9HJvPlOYI4webng2ZFhWkkA0Dy1WTGGUJcp
 /9xwXTYxxY9BA/FuLMv0dwpWgOwWW56TtbdK1CyQDIINKRiYbQwv+vFgCKqS/4zp22UB
 jaVWLIS+VnnX9PrPJIHgSxPFA2SJK6ZRUDEJW7L9Ro9OY6jGHQf5wdON6w1ubqrl64qr
 O4onQNGeo2yz3q2Xpg8v1Q+v7gIf5XHpjoRoTA9FOAiVmSk01rJrUb5xlHxQ61dTV54d
 JIrqQEn2mQeJ/G1KGtJz8pl+rhIcDqe3Bnv5sGnjING1lFa1vQjZG6xOT6B4eP9RNn/s
 1k3A==
X-Gm-Message-State: AOAM5313U+UM5g9bqaEFZcR5j2PTARHjaBNEyzbwN+SABP/QXQbV1YfQ
 kVJAxAmSrggpMbW3MXqJlrBgrGK/pFKGkDT1iYA=
X-Google-Smtp-Source: ABdhPJzJ/m0y2dTwz7Y0jERFu3HVdben8ugbGRr6RRJITjB/GmouXx0FwWUNZyBB7ygi18yurL6pzHaYnSLzHBVY1lg=
X-Received: by 2002:a05:622a:448:: with SMTP id
 o8mr10500252qtx.341.1626461124861; 
 Fri, 16 Jul 2021 11:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-6-jason@jlekstrand.net>
 <CAM0jSHPu1EBfnAJ06Dp51a1Qbg+9QnmP=EyUfYXS0fZnJzxR8g@mail.gmail.com>
 <CAOFGe95gEUNsjCh+30AXhrQLz8_OKbHwwxv=_OhaGKQxGpvcew@mail.gmail.com>
 <CAM0jSHO4EU_gBXo-56GtDJffezfVHYoUhCeOnb97ZgBj5vyA7Q@mail.gmail.com>
 <CAM0jSHOHCr6ppLhUBVSd_JUnBDFAcsYEYtma01benzs_nkhtGg@mail.gmail.com>
 <CAOFGe95YYjS=k9SnQg0EuOR02FWGPyCAvJH7Ymm6ZhiHq5iNCw@mail.gmail.com>
In-Reply-To: <CAOFGe95YYjS=k9SnQg0EuOR02FWGPyCAvJH7Ymm6ZhiHq5iNCw@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 16 Jul 2021 19:44:58 +0100
Message-ID: <CAM0jSHP8vS9FeEjKx9sQqek2-eGVEK+=6y03eNnf0zpnxmmP6w@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jul 2021 at 18:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Fri, Jul 16, 2021 at 11:00 AM Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Fri, 16 Jul 2021 at 16:52, Matthew Auld
> > <matthew.william.auld@gmail.com> wrote:
> > >
> > > On Fri, 16 Jul 2021 at 15:10, Jason Ekstrand <jason@jlekstrand.net> w=
rote:
> > > >
> > > > On Fri, Jul 16, 2021 at 8:54 AM Matthew Auld
> > > > <matthew.william.auld@gmail.com> wrote:
> > > > >
> > > > > On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.ne=
t> wrote:
> > > > > >
> > > > > > Whenever we had a user object (n_placements > 0), we were ignor=
ing
> > > > > > obj->mm.region and always putting obj->placements[0] as the req=
uested
> > > > > > region.  For LMEM+SMEM objects, this was causing them to get sh=
oved into
> > > > > > LMEM on every i915_ttm_get_pages() even when SMEM was requested=
 by, say,
> > > > > > i915_gem_object_migrate().
> > > > >
> > > > > i915_ttm_migrate calls i915_ttm_place_from_region() directly with=
 the
> > > > > requested region, so there shouldn't be an issue with migration r=
ight?
> > > > > Do you have some more details?
> > > >
> > > > With i915_ttm_migrate directly, no.  But, in the last patch in the
> > > > series, we're trying to migrate LMEM+SMEM buffers into SMEM on
> > > > attach() and pin it there.  This blows up in a very unexpected (IMO=
)
> > > > way.  The flow goes something like this:
> > > >
> > > >  - Client attempts a dma-buf import from another device
> > > >  - In attach() we call i915_gem_object_migrate() which calls
> > > > i915_ttm_migrate() which migrates as requested.
> > > >  - Once the migration is complete, we call i915_gem_object_pin_page=
s()
> > > > which calls i915_ttm_get_pages() which depends on
> > > > i915_ttm_placement_from_obj() and so migrates it right back to LMEM=
.
> > >
> > > The mm.pages must be NULL here, otherwise it would just increment the
> > > pages_pin_count?
>
> Given that the test is using the ____four_underscores version, it
> doesn't have that check.  However, this executes after we've done the
> dma-buf import which pinned pages.  So we should definitely have
> pages.

We shouldn't call ____four_underscores() if we might already have
pages though. Under non-TTM that would leak the pages, and in TTM we
might hit the WARN_ON(mm->pages) in __i915_ttm_get_pages(), if for
example nothing was moved. I take it we can't just call pin_pages()?
Four scary underscores usually means "don't call this in normal code".

>
> > > >
> > > > Maybe the problem here is actually that our TTM code isn't respecti=
ng
> > > > obj->mm.pages_pin_count?
> > >
> > > I think if the resource is moved, we always nuke the mm.pages after
> > > being notified of the move. Also TTM is also not allowed to move
> > > pinned buffers.
> > >
> > > I guess if we are evicted/swapped, so assuming we are not holding the
> > > object lock, and it's not pinned, the future call to get_pages() will
> > > see mm.pages =3D NULL, even though the ttm_resource is still there, a=
nd
> > > because we prioritise the placements[0], instead of mm.region we end
> > > up moving it for no good reason. But in your case you are holding the
> > > lock, or it's pinned? Also is this just with the selftest, or
> > > something real?
> >
> > Or at least in the selftest I see ____i915_gem_object_get_pages()
> > which doesn't even consider the mm.pages AFAIK.
>
> The bogus migration is happening as part of the
> __i915_gem_object_get_pages() (2 __underscores) call in
> i915_gem_dmabuf_attach (see last patch).  That code is attempting to
> migrate the BO to SMEM and then pin it there using the obvious calls
> to do so.  However, in the pin_pages call, it gets implicitly migrated
> back to LMEM thanks to i915_ttm_get_pages().  Why is _get_pages()
> migrating things at all?

Not sure yet, but __two_underscores() checks if
i915_gem_object_has_pages() before actually calling into
i915_ttm_get_pages(), so the mm.pages would have to be NULL here for
some reason, so best guess is something to do with move_notify().

>
> --Jason
>
> > >
> > > >
> > > > In case you can't tell, I really have no clue what I'm doing here.
> > > > I'm really stumbling around in the dark finding things that make my
> > > > bug go away.  I'm happy for the feedback.
> > > >
> > > > --Jason
> > > >
> > > > >
> > > > > >
> > > > > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > > > > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 +--
> > > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/=
gpu/drm/i915/gem/i915_gem_ttm.c
> > > > > > index d30f274c329c7..5985e994d56cf 100644
> > > > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > > > > @@ -150,8 +150,7 @@ i915_ttm_placement_from_obj(const struct dr=
m_i915_gem_object *obj,
> > > > > >         unsigned int i;
> > > > > >
> > > > > >         placement->num_placement =3D 1;
> > > > > > -       i915_ttm_place_from_region(num_allowed ? obj->mm.placem=
ents[0] :
> > > > > > -                                  obj->mm.region, requested, f=
lags);
> > > > > > +       i915_ttm_place_from_region(obj->mm.region, requested, f=
lags);
> > > > > >
> > > > > >         /* Cache this on object? */
> > > > > >         placement->num_busy_placement =3D num_allowed;
> > > > > > --
> > > > > > 2.31.1
> > > > > >
