Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C55B1386D34
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 00:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9406E536;
	Mon, 17 May 2021 22:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFC16E536
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 22:49:53 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id n25so8773980edr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 15:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FfN/2Mi0HRDFC6EcT/2HzbJq8vcoDCjGaPGIy5f9OlI=;
 b=TwsiRRwF91DYCpbjrSGgqbuncSX8VvLiTg/EddrRXgwxFV3A9XkLNhECfxWQNJIpg2
 jwMxdfeL+VfyRm8/RR1qkYLqmLrD09B2T6JZxHjHEs8Km92vcDLZdsmEHEfL8ZTLLpO1
 srhasYyKAramtjsolfdz9KsjVXCuh4f0DiQQycDVVOZKEs8gXpOjufOkwnkJKkm8JPe/
 yjW8HC5wDQ00Vc3FKXdo7xStvXQ67oVvswIvuUKzBDLSMeeT7FojbGtj+uQWQznaaLJP
 iLXjUyd3yPZw+gwxZwYA9y0ksLkSnQuGOD+yLp01rbL2JAjjOf7Y3gZDmmS3QmDuzAE2
 ejqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FfN/2Mi0HRDFC6EcT/2HzbJq8vcoDCjGaPGIy5f9OlI=;
 b=O3+oSwiiULrKS3vf8pVxgcXt6TpMNpynPHoWYJlBbJti2iKD3wCcRT1Ee1CGpo77pK
 ZHAo5YShBnFeRm9EX8c8fPpddAzcDXIDAfxl9CzTXJvJPULS8DB0OYpv7x6A0yFJqDHa
 mOUO16u+5728WDAa2BMJBNbg/Qdw+vJc+HnXtmJ9mHXInQvL7sJAg9AvyHDpBc0+1RjX
 Mk4iz9Rrq7qBUTmsbABA26nMIJJo9ObIDN2AOyc3TepjTefD/MSBR++jFZ2HlKak2eLB
 EeNoT9CeKLWcuTt73eETbAxjbvR9ONmy/A96RVjtoMC0+1c0sQTDFh5bZ9qt6YVY6t8w
 45sQ==
X-Gm-Message-State: AOAM533amQgMeWxkix8H5s3hKd9EJpUs4QSCEvaeILUiH3h16vav3aTU
 k2qa7Qf3NpIYPWuFmiEAlGmyvO5V1WIX1Ff8OHFVig==
X-Google-Smtp-Source: ABdhPJy+3AX1EpVk6S7Us9IzRrfs36wmkkM7zygAPj7vtrca192H9qMwpdUzQxoWAnw3KhEdoSuYzamfGmjnNTbqNtU=
X-Received: by 2002:a05:6402:1719:: with SMTP id
 y25mr2936222edu.304.1621291792163; 
 Mon, 17 May 2021 15:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
In-Reply-To: <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 17 May 2021 17:49:40 -0500
Message-ID: <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 3:15 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, May 17, 2021 at 9:38 PM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 17.05.21 um 17:04 schrieb Daniel Vetter:
> > > On Mon, May 17, 2021 at 04:11:18PM +0200, Christian K=C3=B6nig wrote:
> > >> We had a long outstanding problem in amdgpu that buffers exported to
> > >> user drivers by DMA-buf serialize all command submissions using them=
.
> > >>
> > >> In other words we can't compose the buffer with different engines an=
d
> > >> then send it to another driver for display further processing.
> > >>
> > >> This was added to work around the fact that i915 didn't wanted to wa=
it
> > >> for shared fences in the dma_resv objects before displaying a buffer=
.
> > >>
> > >> Since this problem is now causing issues with Vulkan we need to find=
 a
> > >> better solution for that.
> > >>
> > >> The patch set here tries to do this by adding an usage flag to the
> > >> shared fences noting when and how they should participate in implici=
t
> > >> synchronization.
> > > So the way this is fixed in every other vulkan driver is that vulkan
> > > userspace sets flags in the CS ioctl when it wants to synchronize wit=
h
> > > implicit sync. This gets you mostly there. Last time I checked amdgpu
> > > isn't doing this, and yes that's broken.
> >
> > And exactly that is a really bad approach as far as I can see. The
> > Vulkan stack on top simply doesn't know when to set this flag during CS=
.
>
> Adding Jason for the Vulkan side of things, because this isn't how I
> understand this works.
>
> But purely form a kernel pov your patches are sketchy for two reasons:
>
> - we reinstate the amdgpu special case of not setting exclusive fences
>
> - you only fix the single special case of i915 display, nothing else
>
> That's not how a cross driver interface works. And if you'd do this
> properly, you'd be back to all the same sync fun you've orignally had,
> with all the same fallout.

I think I'm starting to see what Christian is trying to do here and I
think there likely is a real genuine problem here.  I'm not convinced
this is 100% of a solution but there might be something real.  Let me
see if I can convince you or if I just make a hash of things. :-)

The problem, once again, comes down to memory fencing vs. execution
fencing and the way that we've unfortunately tied them together in the
kernel.  With the current architecture, the only way to get proper
write-fence semantics for implicit sync is to take an exclusive fence
on the buffer.  This implies two things:

 1. You have to implicitly wait on EVERY fence on the buffer before
you can start your write-fenced operation

 2. No one else can start ANY operation which accesses that buffer
until you're done.

Let's say that you have a buffer which is shared between two drivers A
and B and let's say driver A has thrown a fence on it just to ensure
that the BO doesn't get swapped out to disk until it's at a good
stopping point.  Then driver B comes along and wants to throw a
write-fence on it.  Suddenly, your memory fence from driver A causes
driver B to have to stall waiting for a "good" time to throw in a
fence.  It sounds like this is the sort of scenario that Christian is
running into.  And, yes, with certain Vulkan drivers being a bit
sloppy about exactly when they throw in write fences, I could see it
being a real problem.

The solution I *think* Christian is proposing is basically to have
four categories of fences instead of two: exclusive, weak (shared with
no r/w), read, and write.  (No, I didn't include r/w but that's the
same as write-only when it comes to hazards.)  Then a bunch of flags
and helpers to be able to handle the interactions between the three
types of shared fences.  Honestly, this is something I've considered
as I've wrestled with these problems in the past.  That said....

 1. In GL, we can make the read/write information accurate and never
over/under sync.

 2. In the future ANV model I described earlier, this isn't a problem.
It throws in a write-fence exactly once per frame.  It actually
under-synchronizes but in a safe way.  I think that mostly makes the
problem go away in practice.

 3. If the core issue here really is memory vs. execution sync as I've
said, maybe we really are papering over something by continuing to mix
them.  Do we really want four fence types or do we want two orthogonal
fence types?

I think I've convinced myself that the problem is real, but not that
this solution is correct.

--Jason


> > That's also the reason the Valve guys came up with a solution where eac=
h
> > BO gets a flag for explicit sync, but that only works for exports and
> > not for imports.
> >
> > > I915 and iirc msm has explicit flags for this, panfrost was designed =
to
> > > support this correctly from the start (also with flags I think). That=
's at
> > > least what I remember from all the discussions at XDC and #dri-devel,=
 but
> > > didn't check the code again to give you the list of uapi flags you ne=
ed
> > > for each driver.
> > >
> > > The other piece is making sure you're only picking up implicit fences=
 when
> > > you should, and not any later ones, for which Jason has a solution:
> > >
> > > https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jason@jlek=
strand.net/
> >
> > Yes, I helped with that as well. But I think that this is just another
> > workaround without really addressing the underlying problem.
> >
> > > If amdgpu isn't using those, then you will suffer from
> > > over-synchronization in vulkan and pay a price. The entire point of v=
ulkan
> > > is that you pick up sync points very explicitly, and we also need to =
have
> > > very explicit uapi for userspace to pick up/set the implicit fences.
> > >
> > > Trying to paper over this with more implicit magic is imo just wrong,=
 and
> > > definitely not the long term explicit sync model we want.
> >
> > I completely disagree.
> >
> > In my opinion the implicit sync model we have for dma_resv currently is
> > just not well designed at all, since it always requires cooperation fro=
m
> > userspace.
> >
> > In other words you need to know when to enable implicit sync in
> > userspace and that information is simply not present all of the time.
> >
> > What we have done here is just keeping the old reader/writer flags i915=
,
> > radeon and nouveau once had and pushed that out to everybody else makin=
g
> > the assumption that everybody would follow that without documenting the
> > actual rules of engagement you need to follow here.
> >
> > That was a really big mistake and we should try to fix that sooner or
> > later. The only other clean alternative I see is to use a flag on the
> > exporter to tell the importer if it should sync to shared fences or not=
.
> >
> > Additional to that I'm perfectly fine with implicit sync. Explicit sync
> > certainly has some use cases as well, but I don't see it as an absolute
> > advantage over the implicit model.
>
> Ok this stops making sense. Somehow you claim userspace doesn't know
> when to sync, but somehow the kernel does? By guessing, and getting it
> wrong mostly, except for the one case that you benchmarked?
>
> Aside from silly userspace which exports a buffer to a dma-buf, but
> then never imports it anywhere else, there isn't a case I know of
> where the kernel actually knows more than userspace. But there's lots
> of cases where the kernel definitely knows less, especially if
> userspace doesn't tell it about what's going on with each rendering
> and buffer.
>
> So here's the 2 things you need to make this work like every other driver=
:
>
> 1. A way to set the explicit fence on a buffer. CS ioctl is perfectly
> fine, but also can be seperate. Userspace uses this only on a) shared
> buffers b) when there's a flush/swap on that shared buffer. Not when
> rendering any of the interim stuff, that only leads to oversync.
> Anything non-shared is handled explicitly in userspace (at least for
> modern-ish drivers). This is the only thing that ever sets an
> exclusive fence (aside from ttm moving buffers around ofc).
>
> 2. A way to sync with the implicit fences, either all of them (for
> upcoming write access) or just the write fence (for read access). At
> first we thought it's good enough to do this in the CS ioctl, but
> that's a wee bit too late, hence the patches from Jason. My
> understanding is that vulkan converts this into an vk syncobj/fence of
> some sorts, so really can't make this more explicit and intentional
> than that.
>
> None of this is something the kernel has the slightest idea about when
> it happens, so you have to have explicit uapi for it. Trying to fake
> it in the kernel just doesn't work.
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
