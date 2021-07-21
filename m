Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D50993D17A0
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D9F6ED0F;
	Wed, 21 Jul 2021 20:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B956ED0E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:11:55 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id c16so4959532ybl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hwH4aTHPJ54OZuQl+3wLlO/yWIsMWsFOB97odmVgVNg=;
 b=JGFdqYdUBXgmg0b98nIPJVHl6HXvYjCg7wB6r5mOyhTEQWit9f8jZOdrTSc56gcUrY
 9C61eZSrrDHQ0IPdzTnO8LNd9+HmZCsMgfI9rx4KA3c5lLlC1Zdrg1jPx4p6qpHl77nR
 9M1rWKB09j7SaXv0yUzmzo8lLd/HdyD/GP10jt8ChnHcMLnIhWXRr2AvEeGc2+wQkVG7
 DthcKtnm6ZhhX9kuVPeQpOpt9FzegNAd/C7gJWR61r66SX+N12BlIWORNYAkyBrwfvS/
 vOuOJFIVw7PaOuTlCoA5G42gflo9pZ+JBKQEDe7dA3wrQ8cwkNasYcIkV6x5kz6I4in3
 aROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hwH4aTHPJ54OZuQl+3wLlO/yWIsMWsFOB97odmVgVNg=;
 b=e3iNIrmHhk+99AtVVeB8hbH0WPEJO0BmiFBkRNKEJW3eqSEDrc3BY9h+ldUNJ65LuA
 HPUFdHV4/JBiik2+eeGNzoL4nTTITrBhv0nJL0WupJTHj4lHRaJgub6xgqiiyarAeo3h
 RfA0AxaItmTf/yKoVvCE5F3kH+dkB6OlJYdfQAp7DMJ4bfOw49ZHNqDO2PXK2glr4MGv
 YlwFOlvf+NdTjcKwqJK4u2BJCLw/AvzFyh8nup0mAGlZbS1wJVZ0ygJMcmr5tp5z5jZF
 /rrF1EuhNSDNfMF3l3/cY85xuTY0Aim5wPAm99S1vSWJ5eahYmdeMUpIfwRhKfN7wRzq
 MkTQ==
X-Gm-Message-State: AOAM530q6QRGG0rjIckUmGaz1w4DDOPlsoABe73mqS0tNInCyi5s+0gB
 EdVRwcetrg22Bi+hIVIdE0zbkZxhGQpowIl08e8d/Q==
X-Google-Smtp-Source: ABdhPJyD/Svw5+7M5ycVheSuy0gIe5YJD8tRo4XtK711++g22QNHCH0SGy72tr3k6dwAy0Cqx6S7tEKLzOyaQgEBpbg=
X-Received: by 2002:a25:aa69:: with SMTP id s96mr48788267ybi.241.1626898314103; 
 Wed, 21 Jul 2021 13:11:54 -0700 (PDT)
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
In-Reply-To: <CAM0jSHOTjp-zSdOR1u9H_YM8ryQbA-H9N3RQh-7cQvGr0k5wjw@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 21 Jul 2021 15:11:43 -0500
Message-ID: <CAOFGe9705fJxg4L5W9y_WA5T4PaohsEzgEMJcuojg7aKWTJSfA@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
To: Matthew Auld <matthew.william.auld@gmail.com>
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 8:35 AM Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Fri, 16 Jul 2021 at 20:49, Jason Ekstrand <jason@jlekstrand.net> wrote:
> >
> > On Fri, Jul 16, 2021 at 1:45 PM Matthew Auld
> > <matthew.william.auld@gmail.com> wrote:
> > >
> > > On Fri, 16 Jul 2021 at 18:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > >
> > > > On Fri, Jul 16, 2021 at 11:00 AM Matthew Auld
> > > > <matthew.william.auld@gmail.com> wrote:
> > > > >
> > > > > On Fri, 16 Jul 2021 at 16:52, Matthew Auld
> > > > > <matthew.william.auld@gmail.com> wrote:
> > > > > >
> > > > > > On Fri, 16 Jul 2021 at 15:10, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > > >
> > > > > > > On Fri, Jul 16, 2021 at 8:54 AM Matthew Auld
> > > > > > > <matthew.william.auld@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > > > > >
> > > > > > > > > Whenever we had a user object (n_placements > 0), we were ignoring
> > > > > > > > > obj->mm.region and always putting obj->placements[0] as the requested
> > > > > > > > > region.  For LMEM+SMEM objects, this was causing them to get shoved into
> > > > > > > > > LMEM on every i915_ttm_get_pages() even when SMEM was requested by, say,
> > > > > > > > > i915_gem_object_migrate().
> > > > > > > >
> > > > > > > > i915_ttm_migrate calls i915_ttm_place_from_region() directly with the
> > > > > > > > requested region, so there shouldn't be an issue with migration right?
> > > > > > > > Do you have some more details?
> > > > > > >
> > > > > > > With i915_ttm_migrate directly, no.  But, in the last patch in the
> > > > > > > series, we're trying to migrate LMEM+SMEM buffers into SMEM on
> > > > > > > attach() and pin it there.  This blows up in a very unexpected (IMO)
> > > > > > > way.  The flow goes something like this:
> > > > > > >
> > > > > > >  - Client attempts a dma-buf import from another device
> > > > > > >  - In attach() we call i915_gem_object_migrate() which calls
> > > > > > > i915_ttm_migrate() which migrates as requested.
> > > > > > >  - Once the migration is complete, we call i915_gem_object_pin_pages()
> > > > > > > which calls i915_ttm_get_pages() which depends on
> > > > > > > i915_ttm_placement_from_obj() and so migrates it right back to LMEM.
> > > > > >
> > > > > > The mm.pages must be NULL here, otherwise it would just increment the
> > > > > > pages_pin_count?
> > > >
> > > > Given that the test is using the ____four_underscores version, it
> > > > doesn't have that check.  However, this executes after we've done the
> > > > dma-buf import which pinned pages.  So we should definitely have
> > > > pages.
> > >
> > > We shouldn't call ____four_underscores() if we might already have
> > > pages though. Under non-TTM that would leak the pages, and in TTM we
> > > might hit the WARN_ON(mm->pages) in __i915_ttm_get_pages(), if for
> > > example nothing was moved. I take it we can't just call pin_pages()?
> > > Four scary underscores usually means "don't call this in normal code".
> >
> > I've switched the ____four_underscores call to a __two_underscores in
> > the selftests and it had no effect, good or bad.  But, still, probably
> > better to call that one.
> >
> > > >
> > > > > > >
> > > > > > > Maybe the problem here is actually that our TTM code isn't respecting
> > > > > > > obj->mm.pages_pin_count?
> > > > > >
> > > > > > I think if the resource is moved, we always nuke the mm.pages after
> > > > > > being notified of the move. Also TTM is also not allowed to move
> > > > > > pinned buffers.
> > > > > >
> > > > > > I guess if we are evicted/swapped, so assuming we are not holding the
> > > > > > object lock, and it's not pinned, the future call to get_pages() will
> > > > > > see mm.pages = NULL, even though the ttm_resource is still there, and
> > > > > > because we prioritise the placements[0], instead of mm.region we end
> > > > > > up moving it for no good reason. But in your case you are holding the
> > > > > > lock, or it's pinned? Also is this just with the selftest, or
> > > > > > something real?
> > > > >
> > > > > Or at least in the selftest I see ____i915_gem_object_get_pages()
> > > > > which doesn't even consider the mm.pages AFAIK.
> > > >
> > > > The bogus migration is happening as part of the
> > > > __i915_gem_object_get_pages() (2 __underscores) call in
> > > > i915_gem_dmabuf_attach (see last patch).  That code is attempting to
> > > > migrate the BO to SMEM and then pin it there using the obvious calls
> > > > to do so.  However, in the pin_pages call, it gets implicitly migrated
> > > > back to LMEM thanks to i915_ttm_get_pages().  Why is _get_pages()
> > > > migrating things at all?
> > >
> > > Not sure yet, but __two_underscores() checks if
> > > i915_gem_object_has_pages() before actually calling into
> > > i915_ttm_get_pages(), so the mm.pages would have to be NULL here for
> > > some reason, so best guess is something to do with move_notify().
> >
> > Did a bit of experimenting along those lines and added the following
> > to the self-test BEFORE the export/import:
> >
> >     i915_gem_object_lock(obj, NULL);
> >     err = __i915_gem_object_get_pages(obj);
> >     __i915_gem_object_unpin_pages(obj);
> >     i915_gem_object_unlock(obj);
> >     if (err) {
> >         pr_err("__i915_gem_object_get_pages failed with err=%d\n", err);
> >         goto out_ret;
> >     }
> >
> > This seems to make the migration happen as expected without this
> > patch.  So it seems the problem only exists on buffers that haven't
> > gotten any backing storage yet (if I'm understanding get_pages
> > correctly).
> >
> > One potential work-around (not sure if this is a good idea or not!)
> > would be to do this inside dmabuf_attach().  Is this reliable?  Once
> > it has pages will it always have pages?  Or are there crazy races I
> > need to be worried about here?
>
> It turns out that the i915_ttm_adjust_gem_after_move() call in
> ttm_object_init will always update the mm.region to system memory(so
> that it matches the ttm resource), which seems reasonable given the
> default system placeholder thing, but does seem slightly iffy since we
> haven't actually moved/allocated anything.
>
> So effectively i915_ttm_migrate(SYSTEM) becomes a noop here since
> mm.region == mr. Which ofc means when we actually call get_pages() all
> that happens is that we allocate the pages in system memory(or without
> this patch placements[0]). Also with this patch lmem+smem, will always
> be placed in smem first, regardless of the placements ordering.
>
> For now we could maybe just split i915_ttm_adjust_gem_after_move() so
> we skip the part which updates the mm.region here in the init portion,
> since that should only happen when we try to place the object for
> real?

Doesn't that mean we would end up with obj->mm.region and
obj->mm.res->mem_type are out-of-sync?  That seems bad.  I would think
we'd want the two in sync at all times.

It seems like the fundamental problem here is that, when it's created,
the object isn't really in any memory region at all.  While I don't
think obj->mm.region == NULL is allowed or a good idea, it does seem
closer to the ground truth.

Perhaps what we really want is for i915_gem_object_migrate to
get_pages before it does the migration to ensure that pages exist.
The only call to i915_gem_object_migrate in the code-base today is in
the display code and it's immediately followed by pin_pages().  For
that matter, maybe the call we actually want is
i915_object_migrate_and_pin that does the whole lot.

Thoughts?

--Jason

P.S.  I'm going to go ahead and send another version with your other
comments addressed.  We can keep this discussion going here for now.
