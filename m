Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA623D182B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192376EA00;
	Wed, 21 Jul 2021 20:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A3B6E9F0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:33:00 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 o72-20020a9d224e0000b02904bb9756274cso3268744ota.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=46Qdae24Vgkuhx56bZ3VWMjLyH/YIQlC+F7+AFhkaxQ=;
 b=ZsWREFoXPv06ifgo8GX5lT6mIieYWWxukyZiH7X7l1/ShtwGM8tb3i4stNteoWU0rX
 HKxPB7VvpHBvmPjXd0oqLrRMFoc9b3Eae2GVGK3Phr0YUubGQFS9ax0NqyWrrIwwgU7n
 Wzw4At/KYkPZUzA9FgR35NvvULpD/47+gz6j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46Qdae24Vgkuhx56bZ3VWMjLyH/YIQlC+F7+AFhkaxQ=;
 b=KNJufomAXaE+ycJigXksMf1d7dk/9GaKdwo3T8+u86op46nKHEha9/CBGuzA0Ov/Ir
 L1zoQ83Ly9tHWosW9bniJ9a2bkZ9o9SOnc4Nd83el9PU5ovLSoY1Nu+87uwGGae6Uxh/
 RktH3jLSeHv4l/94E8/ked1IABHgdIZg7V8iuL5PaMFsNfUIfZcAWf7w/sAtdK7iTFYW
 KMfU99Pd9wexg+n5BewqNfEIQBs7hGicaXPX8s9j+2SnpktYhHbuZJxlfZxQgER2dXCF
 FUB1BFWbZ/fnvyoFX5950b9C4Catejsru/GEaM9g9M9Fg9RGnmIzw3H3G5/T4ZvXF+vB
 xwIw==
X-Gm-Message-State: AOAM533XMKRveu7fIUV9Av6Vx9DadeFPEMjwDRRTkswbXinlsOM0KmQU
 Uo7KglpQzN4pNjUGVk2EKcoVZnHpJv1zg690bWinsA==
X-Google-Smtp-Source: ABdhPJxrT4+hkvnqU87Dptr4gYHGI+LP2RtiDpxqj5mSBTbIXrkG/1IgmrjRhRziikKJzpum8VuE7LS0uUuu2+FJ8+g=
X-Received: by 2002:a9d:6d86:: with SMTP id x6mr13479183otp.188.1626899579849; 
 Wed, 21 Jul 2021 13:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210715223900.1840576-1-jason@jlekstrand.net>
 <20210715223900.1840576-6-jason@jlekstrand.net>
 <CAM0jSHPu1EBfnAJ06Dp51a1Qbg+9QnmP=EyUfYXS0fZnJzxR8g@mail.gmail.com>
 <CAOFGe95gEUNsjCh+30AXhrQLz8_OKbHwwxv=_OhaGKQxGpvcew@mail.gmail.com>
 <CAM0jSHO4EU_gBXo-56GtDJffezfVHYoUhCeOnb97ZgBj5vyA7Q@mail.gmail.com>
 <CAM0jSHOHCr6ppLhUBVSd_JUnBDFAcsYEYtma01benzs_nkhtGg@mail.gmail.com>
 <CAOFGe95YYjS=k9SnQg0EuOR02FWGPyCAvJH7Ymm6ZhiHq5iNCw@mail.gmail.com>
 <CAM0jSHP8vS9FeEjKx9sQqek2-eGVEK+=6y03eNnf0zpnxmmP6w@mail.gmail.com>
 <CAOFGe94C48djm1uWXC2Tn-ssSvGr=sTOaEDORG355s72ysfqQg@mail.gmail.com>
 <CAM0jSHOTjp-zSdOR1u9H_YM8ryQbA-H9N3RQh-7cQvGr0k5wjw@mail.gmail.com>
 <CAOFGe9705fJxg4L5W9y_WA5T4PaohsEzgEMJcuojg7aKWTJSfA@mail.gmail.com>
In-Reply-To: <CAOFGe9705fJxg4L5W9y_WA5T4PaohsEzgEMJcuojg7aKWTJSfA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jul 2021 22:32:48 +0200
Message-ID: <CAKMK7uFRPb0rim3ZhZv2FGvc=7A5ShOjz-s=BNaq_7r=zEMjBA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915/gem/ttm: Respect the objection
 region in placement_from_obj
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.william.auld@gmail.com>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 21, 2021 at 10:11 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Mon, Jul 19, 2021 at 8:35 AM Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Fri, 16 Jul 2021 at 20:49, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > >
> > > On Fri, Jul 16, 2021 at 1:45 PM Matthew Auld
> > > <matthew.william.auld@gmail.com> wrote:
> > > >
> > > > On Fri, 16 Jul 2021 at 18:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > >
> > > > > On Fri, Jul 16, 2021 at 11:00 AM Matthew Auld
> > > > > <matthew.william.auld@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, 16 Jul 2021 at 16:52, Matthew Auld
> > > > > > <matthew.william.auld@gmail.com> wrote:
> > > > > > >
> > > > > > > On Fri, 16 Jul 2021 at 15:10, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > > > >
> > > > > > > > On Fri, Jul 16, 2021 at 8:54 AM Matthew Auld
> > > > > > > > <matthew.william.auld@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > > > > > >
> > > > > > > > > > Whenever we had a user object (n_placements > 0), we were ignoring
> > > > > > > > > > obj->mm.region and always putting obj->placements[0] as the requested
> > > > > > > > > > region.  For LMEM+SMEM objects, this was causing them to get shoved into
> > > > > > > > > > LMEM on every i915_ttm_get_pages() even when SMEM was requested by, say,
> > > > > > > > > > i915_gem_object_migrate().
> > > > > > > > >
> > > > > > > > > i915_ttm_migrate calls i915_ttm_place_from_region() directly with the
> > > > > > > > > requested region, so there shouldn't be an issue with migration right?
> > > > > > > > > Do you have some more details?
> > > > > > > >
> > > > > > > > With i915_ttm_migrate directly, no.  But, in the last patch in the
> > > > > > > > series, we're trying to migrate LMEM+SMEM buffers into SMEM on
> > > > > > > > attach() and pin it there.  This blows up in a very unexpected (IMO)
> > > > > > > > way.  The flow goes something like this:
> > > > > > > >
> > > > > > > >  - Client attempts a dma-buf import from another device
> > > > > > > >  - In attach() we call i915_gem_object_migrate() which calls
> > > > > > > > i915_ttm_migrate() which migrates as requested.
> > > > > > > >  - Once the migration is complete, we call i915_gem_object_pin_pages()
> > > > > > > > which calls i915_ttm_get_pages() which depends on
> > > > > > > > i915_ttm_placement_from_obj() and so migrates it right back to LMEM.
> > > > > > >
> > > > > > > The mm.pages must be NULL here, otherwise it would just increment the
> > > > > > > pages_pin_count?
> > > > >
> > > > > Given that the test is using the ____four_underscores version, it
> > > > > doesn't have that check.  However, this executes after we've done the
> > > > > dma-buf import which pinned pages.  So we should definitely have
> > > > > pages.
> > > >
> > > > We shouldn't call ____four_underscores() if we might already have
> > > > pages though. Under non-TTM that would leak the pages, and in TTM we
> > > > might hit the WARN_ON(mm->pages) in __i915_ttm_get_pages(), if for
> > > > example nothing was moved. I take it we can't just call pin_pages()?
> > > > Four scary underscores usually means "don't call this in normal code".
> > >
> > > I've switched the ____four_underscores call to a __two_underscores in
> > > the selftests and it had no effect, good or bad.  But, still, probably
> > > better to call that one.
> > >
> > > > >
> > > > > > > >
> > > > > > > > Maybe the problem here is actually that our TTM code isn't respecting
> > > > > > > > obj->mm.pages_pin_count?
> > > > > > >
> > > > > > > I think if the resource is moved, we always nuke the mm.pages after
> > > > > > > being notified of the move. Also TTM is also not allowed to move
> > > > > > > pinned buffers.
> > > > > > >
> > > > > > > I guess if we are evicted/swapped, so assuming we are not holding the
> > > > > > > object lock, and it's not pinned, the future call to get_pages() will
> > > > > > > see mm.pages = NULL, even though the ttm_resource is still there, and
> > > > > > > because we prioritise the placements[0], instead of mm.region we end
> > > > > > > up moving it for no good reason. But in your case you are holding the
> > > > > > > lock, or it's pinned? Also is this just with the selftest, or
> > > > > > > something real?
> > > > > >
> > > > > > Or at least in the selftest I see ____i915_gem_object_get_pages()
> > > > > > which doesn't even consider the mm.pages AFAIK.
> > > > >
> > > > > The bogus migration is happening as part of the
> > > > > __i915_gem_object_get_pages() (2 __underscores) call in
> > > > > i915_gem_dmabuf_attach (see last patch).  That code is attempting to
> > > > > migrate the BO to SMEM and then pin it there using the obvious calls
> > > > > to do so.  However, in the pin_pages call, it gets implicitly migrated
> > > > > back to LMEM thanks to i915_ttm_get_pages().  Why is _get_pages()
> > > > > migrating things at all?
> > > >
> > > > Not sure yet, but __two_underscores() checks if
> > > > i915_gem_object_has_pages() before actually calling into
> > > > i915_ttm_get_pages(), so the mm.pages would have to be NULL here for
> > > > some reason, so best guess is something to do with move_notify().
> > >
> > > Did a bit of experimenting along those lines and added the following
> > > to the self-test BEFORE the export/import:
> > >
> > >     i915_gem_object_lock(obj, NULL);
> > >     err = __i915_gem_object_get_pages(obj);
> > >     __i915_gem_object_unpin_pages(obj);
> > >     i915_gem_object_unlock(obj);
> > >     if (err) {
> > >         pr_err("__i915_gem_object_get_pages failed with err=%d\n", err);
> > >         goto out_ret;
> > >     }
> > >
> > > This seems to make the migration happen as expected without this
> > > patch.  So it seems the problem only exists on buffers that haven't
> > > gotten any backing storage yet (if I'm understanding get_pages
> > > correctly).
> > >
> > > One potential work-around (not sure if this is a good idea or not!)
> > > would be to do this inside dmabuf_attach().  Is this reliable?  Once
> > > it has pages will it always have pages?  Or are there crazy races I
> > > need to be worried about here?
> >
> > It turns out that the i915_ttm_adjust_gem_after_move() call in
> > ttm_object_init will always update the mm.region to system memory(so
> > that it matches the ttm resource), which seems reasonable given the
> > default system placeholder thing, but does seem slightly iffy since we
> > haven't actually moved/allocated anything.
> >
> > So effectively i915_ttm_migrate(SYSTEM) becomes a noop here since
> > mm.region == mr. Which ofc means when we actually call get_pages() all
> > that happens is that we allocate the pages in system memory(or without
> > this patch placements[0]). Also with this patch lmem+smem, will always
> > be placed in smem first, regardless of the placements ordering.
> >
> > For now we could maybe just split i915_ttm_adjust_gem_after_move() so
> > we skip the part which updates the mm.region here in the init portion,
> > since that should only happen when we try to place the object for
> > real?
>
> Doesn't that mean we would end up with obj->mm.region and
> obj->mm.res->mem_type are out-of-sync?  That seems bad.  I would think
> we'd want the two in sync at all times.
>
> It seems like the fundamental problem here is that, when it's created,
> the object isn't really in any memory region at all.  While I don't
> think obj->mm.region == NULL is allowed or a good idea, it does seem
> closer to the ground truth.
>
> Perhaps what we really want is for i915_gem_object_migrate to
> get_pages before it does the migration to ensure that pages exist.
> The only call to i915_gem_object_migrate in the code-base today is in
> the display code and it's immediately followed by pin_pages().  For
> that matter, maybe the call we actually want is
> i915_object_migrate_and_pin that does the whole lot.

I think long term at least we should track the curren region in the
ttm_resource struct (which can now be subclassed, yay, so we can stuff
anything we want into that one). And maybe make our regions proper
subclassss of ttm_resource_manager.

Even on platforms where ttm isn't used, where we will simply use the
same fields until the code is more unified.

With that there should be only the invairant placement list from
create_ext and the current region allocation left, and nothing else.
Also this would give us a very clear design for the objects which
change their type on igfx (like the shmem->phys_object stuff, which
currently just punches out the ->ops table and hopes for the best).

Also, get_pages is just a transition crutch too, we really want to
more explicit manage placement:
- for migration in dma-buf or display and other places where we must
limit the list of placements beyond what the user specified (and fail
it the intersection is empty)
- for execbuf, where we want to limit migration to avoid thrashing,
i.e. get_pages shouldn't just blindly try to move the buffer (but also
should not just never try to move the buffer, either is suboptimal).

All of this should be orthogonal to pin, which just nails something in
place wherever it is. Which is also extremely not what we currently
have, because right now pin is what allows to to say where you need
the object to be - in the old design only holding a pin prevented the
object from slipping away, now we'll move over to dma_resv_lock and
explicit migration, instead of smashing it all into the one pin
function call.

> Thoughts?

I think aside from starting to embed the ttm objects in the right
places and starting to use only those fields were we duplicate I think
we should leave things as-is for now. It's not pretty, but we need a
pile more ttm things in place first.
-Daniel

>
> --Jason
>
> P.S.  I'm going to go ahead and send another version with your other
> comments addressed.  We can keep this discussion going here for now.
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
