Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D782D53588E
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 06:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D7A10E28C;
	Fri, 27 May 2022 04:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07B810E28C;
 Fri, 27 May 2022 04:44:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so3892388wme.5; 
 Thu, 26 May 2022 21:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fJNm7ixmWwLrx0f9ri8FeFPBsjqtPYRN+qD5pi3kNI4=;
 b=n702XXGYnB7Ab4e+wrUOK9V/3e08brtsUjJ0xGzixtoRxUYZV2JU2VNhp6+UeY+fTI
 cmy7WXFGsa3KmIR4LeMhQ9gE57tTQ3gS6u89WX97rY4l46l/kvAissogC3oIe5Z8uORK
 4vMMoxoX9JPsoouHeyMV23lfB6W5NilaYEAMPe+qd9M9x1lcYUPztPMmN4K4QNkNESZP
 exWrUybz6A5EAXLHbQLnxOfkTOkNcx/mVZHxiLSU6AN487B18zxk67cY5epNZaMg1t0e
 aMU7w6Hp+fi3pPQr0yLbG1QIdVRUW9fb3trkLXnm8tUwieDfkgPa5hpnknNg5KmOb4A3
 gCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fJNm7ixmWwLrx0f9ri8FeFPBsjqtPYRN+qD5pi3kNI4=;
 b=TAZZa2L+Ji43VygY0SP0uX8m+s8/4Qq1fmBCyy1tDSE8ljwKNijvaLmaXkgYTcUHxd
 5zeYInqqAS4/TpkLFUi2fZ1P5XDYvs+h61038gMuSnfObYArOBnlXxR2E5echlihyUgB
 tfwxfJP2odT+mOgnbVKF5XvHvfT3GxpqB+59S4wrnImBXJ4V+ga2dhjq1L41SID58ssl
 gGRetD3IPfBsTQRFAVxSJCi+UtaxHWYTQSGky1igtTtzK9qfruCsIJeId1TJj76YPC6N
 0+Eh47TWKzgQ+QxE4HeW5kkrfo42uG0cc4JngF64rdpDUWL1CPpJuLwtlXhTUJRRHYB9
 x7AA==
X-Gm-Message-State: AOAM530b8QvHqQEZjQNRYKTlY5L5xbSm8h7TldBxmJeKJxBqmN/xb/Ty
 XjsxqdG64iWTo+mBWITC6VhuaGaF7QWRRXB0wW8=
X-Google-Smtp-Source: ABdhPJxnQ7P4GWSwhd0fJWlUiOOLjcblbqPvopZQXdaZqoX0ibmoroj904PTx1r6TvH5Z71MmGQkZWbJwFP8PQF65xQ=
X-Received: by 2002:a05:600c:4f95:b0:397:82a5:dcf8 with SMTP id
 n21-20020a05600c4f9500b0039782a5dcf8mr4297532wmq.84.1653626679357; Thu, 26
 May 2022 21:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com>
 <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com>
 <CAF6AEGuVhXuX63Od+kcJ0QtfAZ2-wqZsN0KOuEzKbivJdouzog@mail.gmail.com>
 <1972f50b-d71a-9e2e-d10b-cc4f13bb208f@linux.intel.com>
 <CAF6AEGsvmQYjzoFgEMTer3oDmb62y2Hq_unDbq2UEoZ6CA3CSw@mail.gmail.com>
 <d15cccd3-4b77-992e-23f7-0c4808592a9f@linux.intel.com>
In-Reply-To: <d15cccd3-4b77-992e-23f7-0c4808592a9f@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 26 May 2022 21:44:36 -0700
Message-ID: <CAF6AEGuFZ_TRHiEB5S_HORbTQahhc3DoSmQkP56jws8cLr0bPA@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] drm/msm: Utilize gpu scheduler priorities
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 26, 2022 at 6:29 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 26/05/2022 04:15, Rob Clark wrote:
> > On Wed, May 25, 2022 at 9:11 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 24/05/2022 15:57, Rob Clark wrote:
> >>> On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>
> >>>> On 23/05/2022 23:53, Rob Clark wrote:
> >>>>>
> >>>>> btw, one fun (but unrelated) issue I'm hitting with scheduler... I'm
> >>>>> trying to add an igt test to stress shrinker/eviction, similar to the
> >>>>> existing tests/i915/gem_shrink.c.  But we hit an unfortunate
> >>>>> combination of circumstances:
> >>>>> 1. Pinning memory happens in the synchronous part of the submit ioctl,
> >>>>> before enqueuing the job for the kthread to handle.
> >>>>> 2. The first run_job() callback incurs a slight delay (~1.5ms) while
> >>>>> resuming the GPU
> >>>>> 3. Because of that delay, userspace has a chance to queue up enough
> >>>>> more jobs to require locking/pinning more than the available system
> >>>>> RAM..
> >>>>
> >>>> Is that one or multiple threads submitting jobs?
> >>>
> >>> In this case multiple.. but I think it could also happen with a single
> >>> thread (provided it didn't stall on a fence, directly or indirectly,
> >>> from an earlier submit), because of how resume and actual job
> >>> submission happens from scheduler kthread.
> >>>
> >>>>> I'm not sure if we want a way to prevent userspace from getting *too*
> >>>>> far ahead of the kthread.  Or maybe at some point the shrinker should
> >>>>> sleep on non-idle buffers?
> >>>>
> >>>> On the direct reclaim path when invoked from the submit ioctl? In i915
> >>>> we only shrink idle objects on direct reclaim and leave active ones for
> >>>> the swapper. It depends on how your locking looks like whether you could
> >>>> do them, whether there would be coupling of locks and fs-reclaim context.
> >>>
> >>> I think the locking is more or less ok, although lockdep is unhappy
> >>> about one thing[1] which is I think a false warning (ie. not
> >>> recognizing that we'd already successfully acquired the obj lock via
> >>> trylock).  We can already reclaim idle bo's in this path.  But the
> >>> problem with a bunch of submits queued up in the scheduler, is that
> >>> they are already considered pinned and active.  So at some point we
> >>> need to sleep (hopefully interruptabley) until they are no longer
> >>> active, ie. to throttle userspace trying to shove in more submits
> >>> until some of the enqueued ones have a chance to run and complete.
> >>
> >> Odd I did not think trylock could trigger that. Looking at your code it
> >> indeed seems two trylocks. I am pretty sure we use the same trylock
> >> trick to avoid it. I am confused..
> >
> > The sequence is,
> >
> > 1. kref_get_unless_zero()
> > 2. trylock, which succeeds
> > 3. attempt to evict or purge (which may or may not have succeeded)
> > 4. unlock
> >
> >   ... meanwhile this has raced with submit (aka execbuf) finishing and
> > retiring and dropping *other* remaining reference to bo...
> >
> > 5. drm_gem_object_put() which triggers drm_gem_object_free()
> > 6. in our free path we acquire the obj lock again and then drop it.
> > Which arguably is unnecessary and only serves to satisfy some
> > GEM_WARN_ON(!msm_gem_is_locked(obj)) in code paths that are also used
> > elsewhere
> >
> > lockdep doesn't realize the previously successful trylock+unlock
> > sequence so it assumes that the code that triggered recursion into
> > shrinker could be holding the objects lock.
>
> Ah yes, missed that lock after trylock in msm_gem_shrinker/scan(). Well
> i915 has the same sequence in our shrinker, but the difference is we use
> delayed work to actually free, _and_ use trylock in the delayed worker.
> It does feel a bit inelegant (objects with no reference count which
> cannot be trylocked?!), but as this is the code recently refactored by
> Maarten so I think best try and sync with him for the full story.

ahh, we used to use delayed work for free, but realized that was
causing janks where we'd get a bunch of bo's queued up to free and at
some point that would cause us to miss deadlines

I suppose instead we could have used an unbound wq for free instead of
the same one we used (at the time, since transitioned to kthread
worker to avoid being preempted by RT SF threads) for retiring submits

> >> Otherwise if you can afford to sleep you can of course throttle
> >> organically via direct reclaim. Unless I am forgetting some key gotcha -
> >> it's been a while I've been active in this area.
> >
> > So, one thing that is awkward about sleeping in this path is that
> > there is no way to propagate back -EINTR, so we end up doing an
> > uninterruptible sleep in something that could be called indirectly
> > from userspace syscall.. i915 seems to deal with this by limiting it
> > to shrinker being called from kswapd.  I think in the shrinker we want
> > to know whether it is ok to sleep (ie. not syscall trigggered
> > codepath, and whether we are under enough memory pressure to justify
> > sleeping).  For the syscall path, I'm playing with something that lets
> > me pass __GFP_RETRY_MAYFAIL | __GFP_NOWARN to
> > shmem_read_mapping_page_gfp(), and then stall after the shrinker has
> > failed, somewhere where we can make it interruptable.  Ofc, that
> > doesn't help with all the other random memory allocations which can
> > fail, so not sure if it will turn out to be a good approach or not.
> > But I guess pinning the GEM bo's is the single biggest potential
> > consumer of pages in the submit path, so maybe it will be better than
> > nothing.
>
> We play similar games, although by a quick look I am not sure we quite
> manage to honour/propagate signals. This has certainly been a
> historically fiddly area. If you first ask for no reclaim allocations
> and invoke the shrinker manually first, then falling back to a bigger
> hammer, you should be able to do it.

yeah, I think it should.. but I've been fighting a bit today with the
fact that the state of bo wrt. shrinkable state has grown a bit
complicated (ie. is it purgeable, evictable, evictable if we are
willing to wait a short amount of time, vs things that are pinned for
scanout and we shouldn't bother waiting on, etc.. plus I managed to
make it a bit worse recently with fenced un-pin of the vma for dealing
with the case that userspace notices that, for userspace allocated
iova, it can release the virtual address before the kernel has a
chance to retire the submit) ;-)

BR,
-R

> Regards,
>
> Tvrtko
