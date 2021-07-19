Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C73CD5C2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252E389E03;
	Mon, 19 Jul 2021 13:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E768489E5A;
 Mon, 19 Jul 2021 13:35:11 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id m3so16637894qkm.10;
 Mon, 19 Jul 2021 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EC2ljfPhA7WIDSKlhsiohqQaEAYTTTn3yjJVmX2LV28=;
 b=bLuSQuT2M+a5nFk2Me/nOHiiVX6Orri2c+U3h9Na+XttZwglYQQDVxawe7l8K2Pegb
 XAyCMLu6b2zT3ya7BeYLPCqEqN+A0yzYirNUKGAYp3+b3U2FQJHzaHfHQonou7c4YBvi
 hEga8Rw4emRB47yZ12McgTZGS7jA9cHp5GATuMv9pORNozygUDrn1aOJJqh4/4y89BI0
 I9E6l7LIl8hANVWqqrr3IwiBggfDktqn6mvEJ0/ohMgeOKPZaMkXKBi0Zzo5us5DgX6F
 bEZ2ljXM0KtemTfVXAP9x4ann15ikMxsft7oKTn6G0OlYTmfFwRwWLcQSQiOqatknl7z
 3Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EC2ljfPhA7WIDSKlhsiohqQaEAYTTTn3yjJVmX2LV28=;
 b=mTgAv1VrsqEYL7haWt9QgBBcFyFHpRfCUDiBFq/gC6m/MhCPwQ2Ude8Vmm+u7BpYeA
 HQ+hQJYrXf+f0Cvyd8Xh/n1WXG+lMfzXyhJGXktBhLZ1mrHsYNllLZkq793WTLhswx3m
 hsUJrNZrmSvs9XePw25egu4Wv/aVK8hPOCbs8q1paC6VPJ1KLvFkqnl4iHJgqLYNCOR2
 hoDc6wNmhh5CxfOgq5QQul11CFyXtjtZ7tXBgYZCA1YrobK62BP12fkpIIjhGEaS2S0p
 8+Pj1l5N5B5DoPYFgA0DH1mopSEBKRHE9cYvAQ0vNkYibIFJGXgaUoT4P9KbWM6FbUXs
 0/SQ==
X-Gm-Message-State: AOAM531u/WHTYomgN4KadxxmoK831VZbBbLh9A+NzcxTwkRX73HCGsz9
 pwvcPee+np2mPmR+Qw0ZHJbBkMGHgplR0tuqggQ=
X-Google-Smtp-Source: ABdhPJxmlNIAov9jv6/V1smJnZGisiGgPH3TLoJDAd6Ay8dmK9t28mtcCUK3I6F1pQg3s+l6aTy2GYSSowFwKcULCEw=
X-Received: by 2002:a05:620a:1581:: with SMTP id
 d1mr23120175qkk.327.1626701710283; 
 Mon, 19 Jul 2021 06:35:10 -0700 (PDT)
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
In-Reply-To: <CAOFGe94C48djm1uWXC2Tn-ssSvGr=sTOaEDORG355s72ysfqQg@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 19 Jul 2021 14:34:44 +0100
Message-ID: <CAM0jSHOTjp-zSdOR1u9H_YM8ryQbA-H9N3RQh-7cQvGr0k5wjw@mail.gmail.com>
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

On Fri, 16 Jul 2021 at 20:49, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> On Fri, Jul 16, 2021 at 1:45 PM Matthew Auld
> <matthew.william.auld@gmail.com> wrote:
> >
> > On Fri, 16 Jul 2021 at 18:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > >
> > > On Fri, Jul 16, 2021 at 11:00 AM Matthew Auld
> > > <matthew.william.auld@gmail.com> wrote:
> > > >
> > > > On Fri, 16 Jul 2021 at 16:52, Matthew Auld
> > > > <matthew.william.auld@gmail.com> wrote:
> > > > >
> > > > > On Fri, 16 Jul 2021 at 15:10, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > >
> > > > > > On Fri, Jul 16, 2021 at 8:54 AM Matthew Auld
> > > > > > <matthew.william.auld@gmail.com> wrote:
> > > > > > >
> > > > > > > On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > > > >
> > > > > > > > Whenever we had a user object (n_placements > 0), we were ignoring
> > > > > > > > obj->mm.region and always putting obj->placements[0] as the requested
> > > > > > > > region.  For LMEM+SMEM objects, this was causing them to get shoved into
> > > > > > > > LMEM on every i915_ttm_get_pages() even when SMEM was requested by, say,
> > > > > > > > i915_gem_object_migrate().
> > > > > > >
> > > > > > > i915_ttm_migrate calls i915_ttm_place_from_region() directly with the
> > > > > > > requested region, so there shouldn't be an issue with migration right?
> > > > > > > Do you have some more details?
> > > > > >
> > > > > > With i915_ttm_migrate directly, no.  But, in the last patch in the
> > > > > > series, we're trying to migrate LMEM+SMEM buffers into SMEM on
> > > > > > attach() and pin it there.  This blows up in a very unexpected (IMO)
> > > > > > way.  The flow goes something like this:
> > > > > >
> > > > > >  - Client attempts a dma-buf import from another device
> > > > > >  - In attach() we call i915_gem_object_migrate() which calls
> > > > > > i915_ttm_migrate() which migrates as requested.
> > > > > >  - Once the migration is complete, we call i915_gem_object_pin_pages()
> > > > > > which calls i915_ttm_get_pages() which depends on
> > > > > > i915_ttm_placement_from_obj() and so migrates it right back to LMEM.
> > > > >
> > > > > The mm.pages must be NULL here, otherwise it would just increment the
> > > > > pages_pin_count?
> > >
> > > Given that the test is using the ____four_underscores version, it
> > > doesn't have that check.  However, this executes after we've done the
> > > dma-buf import which pinned pages.  So we should definitely have
> > > pages.
> >
> > We shouldn't call ____four_underscores() if we might already have
> > pages though. Under non-TTM that would leak the pages, and in TTM we
> > might hit the WARN_ON(mm->pages) in __i915_ttm_get_pages(), if for
> > example nothing was moved. I take it we can't just call pin_pages()?
> > Four scary underscores usually means "don't call this in normal code".
>
> I've switched the ____four_underscores call to a __two_underscores in
> the selftests and it had no effect, good or bad.  But, still, probably
> better to call that one.
>
> > >
> > > > > >
> > > > > > Maybe the problem here is actually that our TTM code isn't respecting
> > > > > > obj->mm.pages_pin_count?
> > > > >
> > > > > I think if the resource is moved, we always nuke the mm.pages after
> > > > > being notified of the move. Also TTM is also not allowed to move
> > > > > pinned buffers.
> > > > >
> > > > > I guess if we are evicted/swapped, so assuming we are not holding the
> > > > > object lock, and it's not pinned, the future call to get_pages() will
> > > > > see mm.pages = NULL, even though the ttm_resource is still there, and
> > > > > because we prioritise the placements[0], instead of mm.region we end
> > > > > up moving it for no good reason. But in your case you are holding the
> > > > > lock, or it's pinned? Also is this just with the selftest, or
> > > > > something real?
> > > >
> > > > Or at least in the selftest I see ____i915_gem_object_get_pages()
> > > > which doesn't even consider the mm.pages AFAIK.
> > >
> > > The bogus migration is happening as part of the
> > > __i915_gem_object_get_pages() (2 __underscores) call in
> > > i915_gem_dmabuf_attach (see last patch).  That code is attempting to
> > > migrate the BO to SMEM and then pin it there using the obvious calls
> > > to do so.  However, in the pin_pages call, it gets implicitly migrated
> > > back to LMEM thanks to i915_ttm_get_pages().  Why is _get_pages()
> > > migrating things at all?
> >
> > Not sure yet, but __two_underscores() checks if
> > i915_gem_object_has_pages() before actually calling into
> > i915_ttm_get_pages(), so the mm.pages would have to be NULL here for
> > some reason, so best guess is something to do with move_notify().
>
> Did a bit of experimenting along those lines and added the following
> to the self-test BEFORE the export/import:
>
>     i915_gem_object_lock(obj, NULL);
>     err = __i915_gem_object_get_pages(obj);
>     __i915_gem_object_unpin_pages(obj);
>     i915_gem_object_unlock(obj);
>     if (err) {
>         pr_err("__i915_gem_object_get_pages failed with err=%d\n", err);
>         goto out_ret;
>     }
>
> This seems to make the migration happen as expected without this
> patch.  So it seems the problem only exists on buffers that haven't
> gotten any backing storage yet (if I'm understanding get_pages
> correctly).
>
> One potential work-around (not sure if this is a good idea or not!)
> would be to do this inside dmabuf_attach().  Is this reliable?  Once
> it has pages will it always have pages?  Or are there crazy races I
> need to be worried about here?

It turns out that the i915_ttm_adjust_gem_after_move() call in
ttm_object_init will always update the mm.region to system memory(so
that it matches the ttm resource), which seems reasonable given the
default system placeholder thing, but does seem slightly iffy since we
haven't actually moved/allocated anything.

So effectively i915_ttm_migrate(SYSTEM) becomes a noop here since
mm.region == mr. Which ofc means when we actually call get_pages() all
that happens is that we allocate the pages in system memory(or without
this patch placements[0]). Also with this patch lmem+smem, will always
be placed in smem first, regardless of the placements ordering.

For now we could maybe just split i915_ttm_adjust_gem_after_move() so
we skip the part which updates the mm.region here in the init portion,
since that should only happen when we try to place the object for
real?

>
> --Jason
