Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81FC3D2132
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE986E811;
	Thu, 22 Jul 2021 09:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3616E122;
 Thu, 22 Jul 2021 09:49:30 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id k3so3828429qtq.7;
 Thu, 22 Jul 2021 02:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhifNXRXk7NO/ZuZiFMIdAZx9g2tFuSF9fvsJd5pQHA=;
 b=iY4x3IF34jzNRVbHXkwZAy6icov84Uzkxkaq74ivlqkCbLQHqwOpnr3qfYlzfp9xJ3
 3yY4ZhUMAPxmvj2eQqNAGdXnyrLqb5jCYi8KMPkkkBvh9/Xv2KyFOWbJvjxn7EgjIK7H
 2z1RXbtLKcvpvklBBkJs8B3X0tVCoGS/ip4+qdI4lvNO3cFl0+tIZhfkXCTyiTA9eDtD
 5S31M39ALT6ziGmPYstp0PRxRdLgeRFYhdUK15uEM7oN6sIemf6MyLt7/CDw7FXe+Rtn
 Xs4JjEsJmPrzeETfw8jvP9Y9+7QedlnhYsqJ9xdZnCTflYPuDGGZ/abd0XA+IqBTxxPy
 96IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhifNXRXk7NO/ZuZiFMIdAZx9g2tFuSF9fvsJd5pQHA=;
 b=R8EY6GTILHYspJ7de+4dL5cTZ1sKckIv6H29WD+hiySrVLXBWxftCmAoHW9zVeKB/g
 uhoiO/BYZ7vhq+cv0sxqaxNsZqkBsqs1M0cOr4T+7gRZf8xasD2+/ZTPDvbsjWPFYYJp
 3iUNBK2XesCghbR2aZOH9oV9fIW8kL1L+Ady27JnixPj8IzYtRjlqQp5SBhU1tJfCyuZ
 dzPJMpYZqg1OaGIxp/KcThrTEIWyiwhJ7EEAUggwsguudzYxJFICvXpri7N7gf9d5z8y
 tpgQrRVI5PrMOVMtt27w2fvs4MTEdfMz8RMSv7VJTSXnY8uqDk5IqX3qJKIESf4YeB4v
 o2nA==
X-Gm-Message-State: AOAM532qZgzAFyWkelHIYOuBbiT8gWviS6TbQffUcuxmrVE0IwQRZnDF
 mwZb/u3yxJL6opwHSVEzZw2qx+8i9yAHua1Cz0Y=
X-Google-Smtp-Source: ABdhPJwragVR0fL/iaLDB/hQy83rgt6xlYYJUpcgLDBpryKqJ0EUjmfD50Qoslm3Bg/iXog7LjvA6+DigjHi1tdpORI=
X-Received: by 2002:ac8:5991:: with SMTP id e17mr15239978qte.265.1626947369913; 
 Thu, 22 Jul 2021 02:49:29 -0700 (PDT)
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
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 22 Jul 2021 10:49:03 +0100
Message-ID: <CAM0jSHOXb_y-s46NUQ-jMJKfBc1FnDxC8ngkKYX29yEE+A7MVg@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
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
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Jul 2021 at 21:11, Jason Ekstrand <jason@jlekstrand.net> wrote:
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

It likely doesn't matter since all roads lead to i915_ttm_get_pages()
when we need to actually use the object?

Also updating the mm.region in ttm_object_init() to reflect the dummy
ttm resource seems a little scary, since any existing is_lmem() check
now needs to happen after we place the object. Or at least the
existing callers(for kernel internal objects) might not have expected
that behaviour. Not sure if we checked all the callers.

>
> It seems like the fundamental problem here is that, when it's created,
> the object isn't really in any memory region at all.  While I don't
> think obj->mm.region == NULL is allowed or a good idea, it does seem
> closer to the ground truth.

Yeah, seems reasonable, especially for create_user where we don't know
the placement until we actually call get_pages(). I think for internal
users like with create_lmem() setting the mm.region early still makes
some sense?

>
> Perhaps what we really want is for i915_gem_object_migrate to
> get_pages before it does the migration to ensure that pages exist.
> The only call to i915_gem_object_migrate in the code-base today is in
> the display code and it's immediately followed by pin_pages().  For
> that matter, maybe the call we actually want is
> i915_object_migrate_and_pin that does the whole lot.

I guess the only downside is that we might end up doing a real
migration, with mempy or the blitter vs just changing the preferred
placement for later? I think just go with whatever you feel is the
simplest for now.

>
> Thoughts?
>
> --Jason
>
> P.S.  I'm going to go ahead and send another version with your other
> comments addressed.  We can keep this discussion going here for now.
