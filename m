Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2A53892BE
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 17:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD546EDFF;
	Wed, 19 May 2021 15:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3506EDFF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 15:35:57 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id u21so20545347ejo.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/ZozqiaQwI5YbOVokgvidhcP0KkOlSvNykelQWyBlYA=;
 b=IHB8COcBINQ/rMDq++F3JRU6M4VoUza0m0rdMhBGXBbmNXDUH88pc6iFcQ0Xdnv2Gf
 /jIGe7knux1uvNPHBes7PoB+11b1GRlFqVu81NE/yHLCl+leq4kszjGE6wB56swpsoqy
 Q67magvmTRqs7mEODLF4CjtvHAw8vswWcaZd7QrgQAwWda1vahXnRTThRR5JJ7Auvyor
 SqBLa8eUslwaLOKo2sqB/OVm1ZY8B0Gxa/iVbajaNcnwnncM+9axMVvUxsV2knS9n4lo
 +QWsfmWcsKvxa0X8TKQG7dpWOXEv9C0Qismh020B09InyiHElg6Dow0g51OKuvTImn1h
 tgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ZozqiaQwI5YbOVokgvidhcP0KkOlSvNykelQWyBlYA=;
 b=Zt25WH+lLxip3XLkK7thdOMwWN+UaoylhmZxXKYJe4j57lhkYH3MNL57nJZdWQ5o1u
 7JPMeP++Mm65czijfH7AZ7DrZSmIJbnQtIWE/EOxMf6jIjucK+2uev3LP/Ujh6WXJJmI
 1Kij6rhKdzJLeOXW9Bdim2SMUUEXKGTkWwyBxQJtXNOk+EFZsxoXZIoa69/nIFfKTnHA
 Nj3IFQR5Dq27fZM3pr/r9DbU9mQXDwvGdhrmJBuSHv2h2/mA7xUWSePQtAfPcvkZlzfe
 3X5EqGdZXKbPzIDMPxkd9pCEJRy05RtyCgaHaQNSydsa1y0TNih7HyXDaXpvLxzAkOTI
 HNvw==
X-Gm-Message-State: AOAM530B/U++jvmdCsXPRM+SFxyKS6Xi3vRw+y8JPmD/SIyxjQlq0V0k
 MvHL/FZ75nCOVVKV5nCEqAgIfdiDRG42iVMP5dC0HQ==
X-Google-Smtp-Source: ABdhPJzhuoW6RjAvvaR+IhVwkb6pQU23dV1ixsaG4XXZdt6uKZMv1jkxCWpPtFKB6IALraGW9Nh/z0e+h4lXjoOFNvU=
X-Received: by 2002:a17:906:5fd1:: with SMTP id
 k17mr13052513ejv.78.1621438555687; 
 Wed, 19 May 2021 08:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
 <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
 <CAKMK7uF=y44e9-0-4MBj3jRBdCqMaLgKutTMeBWCbySRnPR4KQ@mail.gmail.com>
 <CAOFGe960UMe4=Xxcoha9R2Y74ma3Pp4Z0DF6PM+SJ2sjq2DBXg@mail.gmail.com>
 <CAKMK7uGtTT+59hRi3PB1WHPES3YJAPYBvbT74vo9PApNE0i7MQ@mail.gmail.com>
 <fee06c2d-27fb-1af4-6222-8f277b36c951@gmail.com>
 <CAKMK7uHLipx_oH-s5PB6pUUZ_JXCyciaY7sDLfK__-2fvSPCKA@mail.gmail.com>
 <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
 <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
 <CAOFGe97FDc7Y9APymQQZZMApDXsJkbcS0N5jh+3s-w-Ligipug@mail.gmail.com>
 <d305f41f-263d-5612-9f37-5a1442a60649@gmail.com>
In-Reply-To: <d305f41f-263d-5612-9f37-5a1442a60649@gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 19 May 2021 10:35:44 -0500
Message-ID: <CAOFGe9715WVL79st73NSi7xG53504JE97QnOdrF3dmRqpxea0Q@mail.gmail.com>
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 6:43 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 19.05.21 um 00:06 schrieb Jason Ekstrand:
> > [SNIP]
> >>> E.g. we can't add a fence which doesn't wait for the exclusive one as
> >>> shared.
> >> Ok I think that's a real problem, and  guess it's also related to all
> >> the ttm privatization tricks and all that. So essentially we'd need
> >> the opposite of ttm_bo->moving, as in you can't ignore it, but
> >> otherwise it completely ignores all the userspace implicit fence
> >> stuff.
> > Would you mind explaining it to the rest of the class?  I get the need
> > to do a TLB flush after a BO is removed from the processes address
> > space and I get that it may be super-heavy and that it has to be
> > delayed.  I also get that the driver needs to hold a reference to the
> > underlying pages until that TLB flush is done.  What I don't get is
> > what this has to do with the exclusive fence.  Why can't the driver
> > just gather up all the dma_resv fences on the current object (or,
> > better yet, just the ones from the current amdgpu process) and wait on
> > them all?  Why does it need to insert an exclusive fence that then
> > clogs up the whole works?
>
> Because we have mixed up resource management with implicit syncing.
>
> When I sum up all fences in (for example) a dma_fence_array container
> and add that as explicit fence to the dma_resv object resource
> management will do what I want and wait for everything to finish before
> moving or freeing the buffer. But implicit sync will just horrible over
> sync and wait for stuff it shouldn't wait for in the first place.
>
> When I add the fence as shared fence I can run into the problem the the
> TLB flush might finish before the exclusive fence. Which is not allowed
> according to the DMA-buf fencing rules.

I'm starting to feel a bit dense here, sorry...  So the problem is
that the TLB flush really wants to just wait on memory management
fences and not implicit sync fences?  Or is it that you need to wait
on the exclusive fence in case it actually matters but you don't want
to if it was stuffed in there for implicit sync and doesn't have any
memory implications?  Also, how bad is it for the TLB flush to come in
late?  Is other stuff blocking on it?

> We currently have some rather crude workarounds to make use cases like
> this work as expected. E.g. by using a
> dma_fence_chain()/dma_fence_array() and/or adding the explusive fence to
> the shared fences etc etc...
>
> >>>>>>> Let's say that you have a buffer which is shared between two driv=
ers A
> >>>>>>> and B and let's say driver A has thrown a fence on it just to ens=
ure
> >>>>>>> that the BO doesn't get swapped out to disk until it's at a good
> >>>>>>> stopping point.  Then driver B comes along and wants to throw a
> >>>>>>> write-fence on it.  Suddenly, your memory fence from driver A cau=
ses
> >>>>>>> driver B to have to stall waiting for a "good" time to throw in a
> >>>>>>> fence.  It sounds like this is the sort of scenario that Christia=
n is
> >>>>>>> running into.  And, yes, with certain Vulkan drivers being a bit
> >>>>>>> sloppy about exactly when they throw in write fences, I could see=
 it
> >>>>>>> being a real problem.
> >>>>>> Yes this is a potential problem, and on the i915 side we need to d=
o
> >>>>>> some shuffling here most likely. Especially due to discrete, but t=
he
> >>>>>> problem is pre-existing. tbh I forgot about the implications here
> >>>>>> until I pondered this again yesterday evening.
> >>>>>>
> >>>>>> But afaiui the amdgpu code and winsys in mesa, this isn't (yet) th=
e
> >>>>>> problem amd vk drivers have. The issue is that with amdgpu, all yo=
u
> >>>>>> supply are the following bits at CS time:
> >>>>>> - list of always mapped private buffers, which is implicit and O(1=
) in
> >>>>>> the kernel fastpath
> >>>>>> - additional list of shared buffers that are used by the current C=
S
> >>>>>>
> >>>>>> I didn't check how exactly that works wrt winsys buffer ownership,=
 but
> >>>>>> the thing is that on the kernel side _any_ buffer in there is trea=
ted
> >>>>>> as a implicit sync'ed write. Which means if you render your winsys
> >>>>>> with a bunch of command submission split over 3d and compute pipes=
,
> >>>>>> you end up with horrendous amounts of oversync.
> >>>>> What are you talking about? We have no sync at all for submissions =
from
> >>>>> the same client.
> >>>> Yes. Except when the buffer is shared with another driver, at which
> >>>> point you sync a _lot_ and feel the pain.
> >>> Yes, exactly that's the problem.
> >>>
> >>> We basically don't know during CS if a BO is shared or not.
> >>>
> >>> We do know that during importing or exporting the BO thought.
> >> No you don't. Or at least that's massively awkward, see Jason's reply.
> > Please.  In Vulkan, we know explicitly whether or not any BO will ever
> > be shared and, if a BO is ever flagged as shared even though it's not,
> > that's the app being stupid and they can eat the perf hit.
>
> Yeah, that's not a problem at all. We already have the per BO flag in
> amdgpu for this as well.
>
> > In GL, things are more wishy-washy but GL has so many stupid cases wher=
e we
> > have to throw a buffer away and re-allocate that one more isn't going
> > to be all that bad.  Even there, you could do something where you add
> > an in-fence to the BO export operation so that the driver knows when
> > to switch from the shared internal dma_resv to the external one
> > without having to create a new BO and copy.
>
> Hui what? What do you mean with in-fence here?

I could imagine wanting to have a sort of mode-switch on BO export
rather than the userspace driver creating a new exportable buffer and
copying into it.  That would get sticky if there was any outstanding
usage of said buffer that would need to be converted to from the
internal model of usage with explicit fences to a more
dma-buf-friendly model.  I was just saying that you could add
something to BO export to give amdgpu the information it needs to do
the switch.  If you're too confused, feel free to ignore this whole
idea.

> > [SNIP]
> >> Yeah but why does your userspace not know when a bo is used?
> > We always know when a BO is exported because we're the ones doing the
> > export call.  Always.  Of course, we don't know if that BO is shared
> > with another driver or re-imported back into the same one but is that
> > really the case we're optimizing for?
>
> Yes, unfortunately. Exactly that's one of the reasons we couldn't go
> with the per CS per BO flag if it should be shared or exclusive.
>
> >> Or very bluntly, why cant radv do what anv does (or amdvlk if you care
> >> more about that, it's the same)? What's missing with lots of blantant
> >> lying?
> > I'm also not buying this.  You keep claiming that userspace doesn't
> > know but GL definitely does know and Vulkan knows well enough.  You
> > say that it's motivated by Vulkan and use RADV as an example but the
> > only reason why the RADV guys haven't followed the ANV design is to
> > work around limitations in amdgpu.  We shouldn't then use RADV to
> > justify why this is the right uAPI and why i915 is wrong.
>
> Well, I never said that this is because of RADV. The main motivation we
> had is because of MM engines, e.g. VA-API, VDPAU and OpenMax.

Sorry, RADV was mentioned many e-mails ago and this is the first time
I've seen video mentioned.  I've just been going with what I read.

If this is an internal driver over-sync issue with video, that's a
whole different card game.  The ways this is tying you in knots makes
a lot more sense to me now, I think.

> And when we expose a BO with the DMA-buf functions we simply doesn't
> know in userspace if that is then re-imported into VA-API or send to a
> different process.
>
> >>> [SNIP]
> >>> Yeah, and that is exactly the reason why I will NAK this uAPI change.
> >>>
> >>> This doesn't works for amdgpu at all for the reasons outlined above.
> >> Uh that's really not how uapi works. "my driver is right, everyone
> >> else is wrong" is not how cross driver contracts are defined. If that
> >> means a perf impact until you've fixed your rules, that's on you.
> >>
> >> Also you're a few years too late with nacking this, it's already uapi
> >> in the form of the dma-buf poll() support.
> > ^^  My fancy new ioctl doesn't expose anything that isn't already
> > there.  It just lets you take a snap-shot of a wait instead of doing
> > an active wait which might end up with more fences added depending on
> > interrupts and retries.  The dma-buf poll waits on all fences for
> > POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.
>
> Well that's not the stuff I'm concerned about. But rather that you want
> to add that as exclusive fence from the shared ones once more.
>
> This prevents the TLB flush case I've outlined from working correctly.
>
> >>>> So the way I see things right now:
> >>>> - exclusive fence slot is for implicit sync. kmd should only set it
> >>>> when userspace indicates, otherwise you will suffer. Explicit syncin=
g
> >>>> userspace needs to tell the kernel with a flag in the CS ioctl when =
it
> >>>> should sync against this exclusive fence and when it should ignore i=
t,
> >>>> otherwise you'll suffer badly once more.
> >>> That is not sufficient. The explicit sync slot is for kernel internal
> >>> memory management.
> >> Then we need to split it. But what I discussed with Thomas Hellstrom
> >> is that at least for anything except p2p dma-buf ttm_bo->moving should
> >> be enough.
> > This is starting to sound like maybe roughly the right direction to me
> > but I'm still unclear on exactly what problem we're trying to solve
> > for TLB invalidates.  I'd like to understand that better before giving
> > strong opinions.  I'm also not super-familiar with ttm_bo->moving but
> > it sounds like we need some third category of fence somewhere.
>
> Well I would rather say that we should separate the use cases.
>
> E.g. clear APIs for resource management vs. implicit sync.

No arguments there.  I'm all for separating those two use-cases.  I'm
just trying to understand the problem space.  I think I may finally be
getting there. :-)

--Jason
