Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A7B3E0368
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 16:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7126EA31;
	Wed,  4 Aug 2021 14:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7D16E9F8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 14:35:17 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id n16so3100643oij.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1YKmXG3sEYrWfC+00uSI9tFWY5t/fO7iBjyGET08Dl4=;
 b=SwSMS16isfxreGdIQLvE4RqRnptNEhz6l99EME5JlCspnJhkXxpJMR6Q0gEmIwDlIj
 McZOSRi6a+OwIJiGsKpgDS6fQyQ549OKcPp9q4fGr5b9Ou3IrsSUTjED0Deoxx+pEuxi
 hwa586VTI4pDgmh7ZxGTLwrA4PaSFlpd3vxb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1YKmXG3sEYrWfC+00uSI9tFWY5t/fO7iBjyGET08Dl4=;
 b=fpYZJPGmcs3N+MV1GZBjQD6y6LZ/M1rbaw0hIucRmUzILJjVjFxyt5yXxvfVlJbH/z
 7/SCcv2pT4YKZXoPB5CbZsqUmJZ8bdOmB+a4yEVy3PQ9kWXEgLaDY0Jsr5NpbpuPM0D7
 PMEGayzpzl4uD3RUHfwaAjy/f/wWSG4ymENIZ/XguIBp8z4Q62Z0nHHzqyN4yBn8bCDv
 HimkYi9SCdyYwEVKh+PsgpyjGstj1JSAGv1mmZlU9kSvXYUVPJFSkp29ox4HnroEr+sa
 JojmP5bWxmB9f4Gg0wPSW+Fm25Hw6hZU7h2oGPyJxNrstwqHHW2cyhXCWwdpqJ83gCy9
 Jl0g==
X-Gm-Message-State: AOAM530aofNbBCfIM5NVHJgA0CYfJUjawxSNFbBue0qbBeGMOnjuzv8u
 lDNPx5KO8jvfb42K7knpsdFVhY8QaZrCrFaHPCZfkQ==
X-Google-Smtp-Source: ABdhPJzR5dYeJvb3aZoFQiYP69j3Pzu7z0knLl0ybrO1DZa8p75+HsqpO+3KKTv0DG7i4JGR8CdTIu/J7FJNGIyc4/4=
X-Received: by 2002:a05:6808:2109:: with SMTP id
 r9mr5341991oiw.101.1628087716798; 
 Wed, 04 Aug 2021 07:35:16 -0700 (PDT)
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
 <CAM0jSHOXb_y-s46NUQ-jMJKfBc1FnDxC8ngkKYX29yEE+A7MVg@mail.gmail.com>
 <CAM0jSHNRE2tb4tS4q62MMAA7-WSGZE4_PryVFE7i1j13Sax1Mg@mail.gmail.com>
 <a53c7d07-15f5-0029-7e09-68c588832852@linux.intel.com>
In-Reply-To: <a53c7d07-15f5-0029-7e09-68c588832852@linux.intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 4 Aug 2021 16:35:05 +0200
Message-ID: <CAKMK7uEurFMB6PUsYCKBezQsT63=pJ3WCQ07F=V6cvfnY2+RGw@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.william.auld@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
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

On Wed, Aug 4, 2021 at 10:00 AM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi,
>
> On 7/22/21 11:59 AM, Matthew Auld wrote:
> > On Thu, 22 Jul 2021 at 10:49, Matthew Auld
> > <matthew.william.auld@gmail.com> wrote:
> >> On Wed, 21 Jul 2021 at 21:11, Jason Ekstrand <jason@jlekstrand.net> wr=
ote:
> >>> On Mon, Jul 19, 2021 at 8:35 AM Matthew Auld
> >>> <matthew.william.auld@gmail.com> wrote:
> >>>> On Fri, 16 Jul 2021 at 20:49, Jason Ekstrand <jason@jlekstrand.net> =
wrote:
> >>>>> On Fri, Jul 16, 2021 at 1:45 PM Matthew Auld
> >>>>> <matthew.william.auld@gmail.com> wrote:
> >>>>>> On Fri, 16 Jul 2021 at 18:39, Jason Ekstrand <jason@jlekstrand.net=
> wrote:
> >>>>>>> On Fri, Jul 16, 2021 at 11:00 AM Matthew Auld
> >>>>>>> <matthew.william.auld@gmail.com> wrote:
> >>>>>>>> On Fri, 16 Jul 2021 at 16:52, Matthew Auld
> >>>>>>>> <matthew.william.auld@gmail.com> wrote:
> >>>>>>>>> On Fri, 16 Jul 2021 at 15:10, Jason Ekstrand <jason@jlekstrand.=
net> wrote:
> >>>>>>>>>> On Fri, Jul 16, 2021 at 8:54 AM Matthew Auld
> >>>>>>>>>> <matthew.william.auld@gmail.com> wrote:
> >>>>>>>>>>> On Thu, 15 Jul 2021 at 23:39, Jason Ekstrand <jason@jlekstran=
d.net> wrote:
> >>>>>>>>>>>> Whenever we had a user object (n_placements > 0), we were ig=
noring
> >>>>>>>>>>>> obj->mm.region and always putting obj->placements[0] as the =
requested
> >>>>>>>>>>>> region.  For LMEM+SMEM objects, this was causing them to get=
 shoved into
> >>>>>>>>>>>> LMEM on every i915_ttm_get_pages() even when SMEM was reques=
ted by, say,
> >>>>>>>>>>>> i915_gem_object_migrate().
> >>>>>>>>>>> i915_ttm_migrate calls i915_ttm_place_from_region() directly =
with the
> >>>>>>>>>>> requested region, so there shouldn't be an issue with migrati=
on right?
> >>>>>>>>>>> Do you have some more details?
> >>>>>>>>>> With i915_ttm_migrate directly, no.  But, in the last patch in=
 the
> >>>>>>>>>> series, we're trying to migrate LMEM+SMEM buffers into SMEM on
> >>>>>>>>>> attach() and pin it there.  This blows up in a very unexpected=
 (IMO)
> >>>>>>>>>> way.  The flow goes something like this:
> >>>>>>>>>>
> >>>>>>>>>>   - Client attempts a dma-buf import from another device
> >>>>>>>>>>   - In attach() we call i915_gem_object_migrate() which calls
> >>>>>>>>>> i915_ttm_migrate() which migrates as requested.
> >>>>>>>>>>   - Once the migration is complete, we call i915_gem_object_pi=
n_pages()
> >>>>>>>>>> which calls i915_ttm_get_pages() which depends on
> >>>>>>>>>> i915_ttm_placement_from_obj() and so migrates it right back to=
 LMEM.
> >>>>>>>>> The mm.pages must be NULL here, otherwise it would just increme=
nt the
> >>>>>>>>> pages_pin_count?
> >>>>>>> Given that the test is using the ____four_underscores version, it
> >>>>>>> doesn't have that check.  However, this executes after we've done=
 the
> >>>>>>> dma-buf import which pinned pages.  So we should definitely have
> >>>>>>> pages.
> >>>>>> We shouldn't call ____four_underscores() if we might already have
> >>>>>> pages though. Under non-TTM that would leak the pages, and in TTM =
we
> >>>>>> might hit the WARN_ON(mm->pages) in __i915_ttm_get_pages(), if for
> >>>>>> example nothing was moved. I take it we can't just call pin_pages(=
)?
> >>>>>> Four scary underscores usually means "don't call this in normal co=
de".
> >>>>> I've switched the ____four_underscores call to a __two_underscores =
in
> >>>>> the selftests and it had no effect, good or bad.  But, still, proba=
bly
> >>>>> better to call that one.
> >>>>>
> >>>>>>>>>> Maybe the problem here is actually that our TTM code isn't res=
pecting
> >>>>>>>>>> obj->mm.pages_pin_count?
> >>>>>>>>> I think if the resource is moved, we always nuke the mm.pages a=
fter
> >>>>>>>>> being notified of the move. Also TTM is also not allowed to mov=
e
> >>>>>>>>> pinned buffers.
> >>>>>>>>>
> >>>>>>>>> I guess if we are evicted/swapped, so assuming we are not holdi=
ng the
> >>>>>>>>> object lock, and it's not pinned, the future call to get_pages(=
) will
> >>>>>>>>> see mm.pages =3D NULL, even though the ttm_resource is still th=
ere, and
> >>>>>>>>> because we prioritise the placements[0], instead of mm.region w=
e end
> >>>>>>>>> up moving it for no good reason. But in your case you are holdi=
ng the
> >>>>>>>>> lock, or it's pinned? Also is this just with the selftest, or
> >>>>>>>>> something real?
> >>>>>>>> Or at least in the selftest I see ____i915_gem_object_get_pages(=
)
> >>>>>>>> which doesn't even consider the mm.pages AFAIK.
> >>>>>>> The bogus migration is happening as part of the
> >>>>>>> __i915_gem_object_get_pages() (2 __underscores) call in
> >>>>>>> i915_gem_dmabuf_attach (see last patch).  That code is attempting=
 to
> >>>>>>> migrate the BO to SMEM and then pin it there using the obvious ca=
lls
> >>>>>>> to do so.  However, in the pin_pages call, it gets implicitly mig=
rated
> >>>>>>> back to LMEM thanks to i915_ttm_get_pages().  Why is _get_pages()
> >>>>>>> migrating things at all?
> >>>>>> Not sure yet, but __two_underscores() checks if
> >>>>>> i915_gem_object_has_pages() before actually calling into
> >>>>>> i915_ttm_get_pages(), so the mm.pages would have to be NULL here f=
or
> >>>>>> some reason, so best guess is something to do with move_notify().
> >>>>> Did a bit of experimenting along those lines and added the followin=
g
> >>>>> to the self-test BEFORE the export/import:
> >>>>>
> >>>>>      i915_gem_object_lock(obj, NULL);
> >>>>>      err =3D __i915_gem_object_get_pages(obj);
> >>>>>      __i915_gem_object_unpin_pages(obj);
> >>>>>      i915_gem_object_unlock(obj);
> >>>>>      if (err) {
> >>>>>          pr_err("__i915_gem_object_get_pages failed with err=3D%d\n=
", err);
> >>>>>          goto out_ret;
> >>>>>      }
> >>>>>
> >>>>> This seems to make the migration happen as expected without this
> >>>>> patch.  So it seems the problem only exists on buffers that haven't
> >>>>> gotten any backing storage yet (if I'm understanding get_pages
> >>>>> correctly).
> >>>>>
> >>>>> One potential work-around (not sure if this is a good idea or not!)
> >>>>> would be to do this inside dmabuf_attach().  Is this reliable?  Onc=
e
> >>>>> it has pages will it always have pages?  Or are there crazy races I
> >>>>> need to be worried about here?
> >>>> It turns out that the i915_ttm_adjust_gem_after_move() call in
> >>>> ttm_object_init will always update the mm.region to system memory(so
> >>>> that it matches the ttm resource), which seems reasonable given the
> >>>> default system placeholder thing, but does seem slightly iffy since =
we
> >>>> haven't actually moved/allocated anything.
> >>>>
> >>>> So effectively i915_ttm_migrate(SYSTEM) becomes a noop here since
> >>>> mm.region =3D=3D mr. Which ofc means when we actually call get_pages=
() all
> >>>> that happens is that we allocate the pages in system memory(or witho=
ut
> >>>> this patch placements[0]). Also with this patch lmem+smem, will alwa=
ys
> >>>> be placed in smem first, regardless of the placements ordering.
> >>>>
> >>>> For now we could maybe just split i915_ttm_adjust_gem_after_move() s=
o
> >>>> we skip the part which updates the mm.region here in the init portio=
n,
> >>>> since that should only happen when we try to place the object for
> >>>> real?
> >>> Doesn't that mean we would end up with obj->mm.region and
> >>> obj->mm.res->mem_type are out-of-sync?  That seems bad.  I would thin=
k
> >>> we'd want the two in sync at all times.
> >> It likely doesn't matter since all roads lead to i915_ttm_get_pages()
> >> when we need to actually use the object?
> >>
> >> Also updating the mm.region in ttm_object_init() to reflect the dummy
> >> ttm resource seems a little scary, since any existing is_lmem() check
> >> now needs to happen after we place the object. Or at least the
> >> existing callers(for kernel internal objects) might not have expected
> >> that behaviour. Not sure if we checked all the callers.
> >>
> >>> It seems like the fundamental problem here is that, when it's created=
,
> >>> the object isn't really in any memory region at all.  While I don't
> >>> think obj->mm.region =3D=3D NULL is allowed or a good idea, it does s=
eem
> >>> closer to the ground truth.
> >> Yeah, seems reasonable, especially for create_user where we don't know
> >> the placement until we actually call get_pages(). I think for internal
> >> users like with create_lmem() setting the mm.region early still makes
> >> some sense?
> >>
> >>> Perhaps what we really want is for i915_gem_object_migrate to
> >>> get_pages before it does the migration to ensure that pages exist.
> >>> The only call to i915_gem_object_migrate in the code-base today is in
> >>> the display code and it's immediately followed by pin_pages().  For
> >>> that matter, maybe the call we actually want is
> >>> i915_object_migrate_and_pin that does the whole lot.
> >> I guess the only downside is that we might end up doing a real
> >> migration, with mempy or the blitter vs just changing the preferred
> >> placement for later? I think just go with whatever you feel is the
> >> simplest for now.
> > Another cheapo could be to drop the mr =3D=3D mm.region noop, and just =
try
> > to place the object at mr anyway?
> >
> There are a number of things to consider here,
>
> First, as Jason found out what's keeping thing from working as intended
> is that we actually call into TTM get_pages() after migration, since the
> object isn't populated with pages yet. That's indeed a bug.
>
> We should probably have migrate be migrate_and_populate(): Whatever
> kernel code decides to migrate needs to hold the object lock over the
> operation where data needs to be migrated or in the worst case call
> pin() under the lock which currently needs to be the case for dma-buf
> and display.
>
> If we blindly just look at obj->mm.region() in get_pages() then if an
> object with allowable placements in lmem and smem initially gets placed
> in lmem, and then evicted to smem it will never migrate back to lmem
> unless if there is an explicit i915_gem_object_migrate(), but again,
> that's perhaps what we want? I guess we need to more clearly define the
> migration policies; for example should we attempt to migrate evicted
> buffers back to lmem on each execbuf where they are referenced, even if
> they haven't lost their pages?

Looking at amdgpu things are indeed complicated:
- mmap adds some hints that cpu access is preferred (iirc at least) so
that the unmappable vram problems aren't too awful
- execbuf adds vram to the non-evict placement list whenever that
makes sense (i.e. preferred place and no inferred hint like mmap
access countering that)
- for eviction there's a ratelimit, to make sure we're not thrashing
terribly and spending all the gpu time moving buffers around with the
copy engine

Maybe another interim strategy would be to only evict non-busy
buffers, not sure ttm supports that already. We definitely don't want
to unconditionally force all buffers into lmem on every execbuf.
-Daniel


> On region dicrepance between gem and TTM there is a short DOC: section
> in i915_gem_ttm.c
>
> /Thomas
>
>
> >>> Thoughts?
> >>>
> >>> --Jason
> >>>
> >>> P.S.  I'm going to go ahead and send another version with your other
> >>> comments addressed.  We can keep this discussion going here for now.



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
