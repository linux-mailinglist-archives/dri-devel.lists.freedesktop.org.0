Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D8F388296
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 00:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731CF6E856;
	Tue, 18 May 2021 22:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FAB6E856
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 22:06:23 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id n2so16924881ejy.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 15:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7ooZa5Bq2Xex4YEqTkpc9lYCyYnnFlU4PkqaRZTA86E=;
 b=pcODyaPBlxCW9ThAaf2ZCIWc+dsg5TS8Vur3TJNooG4mG/SFmN0v4O+wngiHipUXaS
 3dJkXukZUyYtiwM1tJJ5rrg6B48Nm0tcfSpuX6n0FKkbLkg/rneZoSgq+imsC+utp94e
 O2JAXc2zWIdVtIcVguy/AnT6tlhQQp1wb/8QwyOXJXOpRF0EF5G6IM6JWEk8+qN7VPjg
 5M19pQNWRLu8SOBGRE2L0Ie4IVWdcvQYVc357+agsOkVbD+KG+y+3hGl6R+OVvmOme/1
 FlLmXnwniPigfB27/lUTEyu7k42EdchwYSHK7wth4r0TFpE6HTiMm3PtvG7y28u3XwOa
 ahew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7ooZa5Bq2Xex4YEqTkpc9lYCyYnnFlU4PkqaRZTA86E=;
 b=V2VaQujLgDq3XPMY90RMmKXwuCcJgYdfVtpn2GqVTCyZAZCYFCLPzYTl1ty3exfmzh
 jgIN9VrJb85OvzygM1nYScqK2LohQqpDRs7B59QIbua9Av3whEq7c3xktRQFqB47GIF+
 vwdYjJBV6fG4M9pSbAgv5wiOPczHdkIaf7olXfsFcnUzpGvIjY3wEWeAC21fBijBWUhJ
 Xe52DxJjVn5ZY3Lt+cmIboHgwIq6MwzR7zyZ8IHvVx1irjcDyDFhybHsf11hIueELMn0
 FgdSTMKrtBQE45dPkOV9Wj0eVGdXK0VjGg6Ak9pTvUAxCHRXQj8QBWZTvWsJ9IZkHhpX
 TMKA==
X-Gm-Message-State: AOAM5325kD0he06vXmU/PU6loLyf4GRVdV8TK/Sp7MBK3nMBcF0tnTA/
 NMb3gpccmhAGQImJwSC8VzBO4xhhZv6AkkgNHxAZrtFJkxc=
X-Google-Smtp-Source: ABdhPJzBb3c5rufxIG5nWfyBdY6xPzFZukl0qk+6X47JOBjooq6LAjxIrUiBtjUfRlhiM4RhU9w9IiIPuJesedTF8V4=
X-Received: by 2002:a17:907:781a:: with SMTP id
 la26mr8196734ejc.435.1621375581845; 
 Tue, 18 May 2021 15:06:21 -0700 (PDT)
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
In-Reply-To: <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 18 May 2021 17:06:10 -0500
Message-ID: <CAOFGe97FDc7Y9APymQQZZMApDXsJkbcS0N5jh+3s-w-Ligipug@mail.gmail.com>
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

On Tue, May 18, 2021 at 4:17 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, May 18, 2021 at 7:40 PM Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 18.05.21 um 18:48 schrieb Daniel Vetter:
> > > On Tue, May 18, 2021 at 2:49 PM Christian K=C3=B6nig
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >> Hi Jason & Daniel,
> > >>
> > >> Am 18.05.21 um 07:59 schrieb Daniel Vetter:
> > >>> On Tue, May 18, 2021 at 12:49 AM Jason Ekstrand <jason@jlekstrand.n=
et> wrote:
> > >>>> On Mon, May 17, 2021 at 3:15 PM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
> > >>>>> On Mon, May 17, 2021 at 9:38 PM Christian K=C3=B6nig
> > >>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> > >>>>>> Am 17.05.21 um 17:04 schrieb Daniel Vetter:
> > >>>>>>> On Mon, May 17, 2021 at 04:11:18PM +0200, Christian K=C3=B6nig =
wrote:
> > >>>>>>>> We had a long outstanding problem in amdgpu that buffers expor=
ted to
> > >>>>>>>> user drivers by DMA-buf serialize all command submissions usin=
g them.
> > >>>>>>>>
> > >>>>>>>> In other words we can't compose the buffer with different engi=
nes and
> > >>>>>>>> then send it to another driver for display further processing.
> > >>>>>>>>
> > >>>>>>>> This was added to work around the fact that i915 didn't wanted=
 to wait
> > >>>>>>>> for shared fences in the dma_resv objects before displaying a =
buffer.
> > >>>>>>>>
> > >>>>>>>> Since this problem is now causing issues with Vulkan we need t=
o find a
> > >>>>>>>> better solution for that.
> > >>>>>>>>
> > >>>>>>>> The patch set here tries to do this by adding an usage flag to=
 the
> > >>>>>>>> shared fences noting when and how they should participate in i=
mplicit
> > >>>>>>>> synchronization.
> > >>>>>>> So the way this is fixed in every other vulkan driver is that v=
ulkan
> > >>>>>>> userspace sets flags in the CS ioctl when it wants to synchroni=
ze with
> > >>>>>>> implicit sync. This gets you mostly there. Last time I checked =
amdgpu
> > >>>>>>> isn't doing this, and yes that's broken.
> > >>>>>> And exactly that is a really bad approach as far as I can see. T=
he
> > >>>>>> Vulkan stack on top simply doesn't know when to set this flag du=
ring CS.
> > >>>>> Adding Jason for the Vulkan side of things, because this isn't ho=
w I
> > >>>>> understand this works.
> > >>>>>
> > >>>>> But purely form a kernel pov your patches are sketchy for two rea=
sons:
> > >>>>>
> > >>>>> - we reinstate the amdgpu special case of not setting exclusive f=
ences
> > >>>>>
> > >>>>> - you only fix the single special case of i915 display, nothing e=
lse
> > >>>>>
> > >>>>> That's not how a cross driver interface works. And if you'd do th=
is
> > >>>>> properly, you'd be back to all the same sync fun you've orignally=
 had,
> > >>>>> with all the same fallout.
> > >>>> I think I'm starting to see what Christian is trying to do here an=
d I
> > >>>> think there likely is a real genuine problem here.  I'm not convin=
ced
> > >>>> this is 100% of a solution but there might be something real.  Let=
 me
> > >>>> see if I can convince you or if I just make a hash of things. :-)
> > >>>>
> > >>>> The problem, once again, comes down to memory fencing vs. executio=
n
> > >>>> fencing and the way that we've unfortunately tied them together in=
 the
> > >>>> kernel.  With the current architecture, the only way to get proper
> > >>>> write-fence semantics for implicit sync is to take an exclusive fe=
nce
> > >>>> on the buffer.  This implies two things:
> > >>>>
> > >>>>    1. You have to implicitly wait on EVERY fence on the buffer bef=
ore
> > >>>> you can start your write-fenced operation
> > >>>>
> > >>>>    2. No one else can start ANY operation which accesses that buff=
er
> > >>>> until you're done.
> > >> Yes, exactly that. You absolutely nailed it.
> > >>
> > >> I unfortunately also have a 3rd use case:
> > >>
> > >> 3. Operations which shouldn't participate in any syncing, but only
> > >> affect the memory management.
> > >>
> > >> This is basically our heavyweight TLB flush after unmapping the BO f=
rom
> > >> somebodies page tables. Nobody should ever be concerned about it for=
 any
> > >> form of synchronization, but memory managment is not allowed to reus=
e or
> > >> move the buffer before the operation is completed.
> > > Isn't that just another case of 2? Or I'm not getting it.
> >
> > The problem in this case is not starting a new CS, but synchronizing to
> > the existing ones.
> >
> > See a heavy TLB flush is made completely out of sync. E.g. it doesn't
> > want to wait for any previous operation.
> >
> > In other words imagine the following example:
> > 1. Both process A and B have a BO mapped.
> > 2. Process A is heavily using the BO and doing all kind of rendering.
> > 3. Process B is unmapping the BO.
> >
> > Now that process B unmaps the BO needs to trigger page table updates an=
d
> > a heavy TLB flush, but since this can take really long we want to do it
> > asynchronously on the hardware.
> >
> > With the current approach you basically can't do that because you can't
> > note that a fence should not participate in synchronization at all.
> >
> > E.g. we can't add a fence which doesn't wait for the exclusive one as
> > shared.
>
> Ok I think that's a real problem, and  guess it's also related to all
> the ttm privatization tricks and all that. So essentially we'd need
> the opposite of ttm_bo->moving, as in you can't ignore it, but
> otherwise it completely ignores all the userspace implicit fence
> stuff.

Would you mind explaining it to the rest of the class?  I get the need
to do a TLB flush after a BO is removed from the processes address
space and I get that it may be super-heavy and that it has to be
delayed.  I also get that the driver needs to hold a reference to the
underlying pages until that TLB flush is done.  What I don't get is
what this has to do with the exclusive fence.  Why can't the driver
just gather up all the dma_resv fences on the current object (or,
better yet, just the ones from the current amdgpu process) and wait on
them all?  Why does it need to insert an exclusive fence that then
clogs up the whole works?

> > >>>> Let's say that you have a buffer which is shared between two drive=
rs A
> > >>>> and B and let's say driver A has thrown a fence on it just to ensu=
re
> > >>>> that the BO doesn't get swapped out to disk until it's at a good
> > >>>> stopping point.  Then driver B comes along and wants to throw a
> > >>>> write-fence on it.  Suddenly, your memory fence from driver A caus=
es
> > >>>> driver B to have to stall waiting for a "good" time to throw in a
> > >>>> fence.  It sounds like this is the sort of scenario that Christian=
 is
> > >>>> running into.  And, yes, with certain Vulkan drivers being a bit
> > >>>> sloppy about exactly when they throw in write fences, I could see =
it
> > >>>> being a real problem.
> > >>> Yes this is a potential problem, and on the i915 side we need to do
> > >>> some shuffling here most likely. Especially due to discrete, but th=
e
> > >>> problem is pre-existing. tbh I forgot about the implications here
> > >>> until I pondered this again yesterday evening.
> > >>>
> > >>> But afaiui the amdgpu code and winsys in mesa, this isn't (yet) the
> > >>> problem amd vk drivers have. The issue is that with amdgpu, all you
> > >>> supply are the following bits at CS time:
> > >>> - list of always mapped private buffers, which is implicit and O(1)=
 in
> > >>> the kernel fastpath
> > >>> - additional list of shared buffers that are used by the current CS
> > >>>
> > >>> I didn't check how exactly that works wrt winsys buffer ownership, =
but
> > >>> the thing is that on the kernel side _any_ buffer in there is treat=
ed
> > >>> as a implicit sync'ed write. Which means if you render your winsys
> > >>> with a bunch of command submission split over 3d and compute pipes,
> > >>> you end up with horrendous amounts of oversync.
> > >> What are you talking about? We have no sync at all for submissions f=
rom
> > >> the same client.
> > > Yes. Except when the buffer is shared with another driver, at which
> > > point you sync a _lot_ and feel the pain.
> >
> > Yes, exactly that's the problem.
> >
> > We basically don't know during CS if a BO is shared or not.
> >
> > We do know that during importing or exporting the BO thought.
>
> No you don't. Or at least that's massively awkward, see Jason's reply.

Please.  In Vulkan, we know explicitly whether or not any BO will ever
be shared and, if a BO is ever flagged as shared even though it's not,
that's the app being stupid and they can eat the perf hit.  In GL,
things are more wishy-washy but GL has so many stupid cases where we
have to throw a buffer away and re-allocate that one more isn't going
to be all that bad.  Even there, you could do something where you add
an in-fence to the BO export operation so that the driver knows when
to switch from the shared internal dma_resv to the external one
without having to create a new BO and copy.

> > > Or I'm not understanding at all what your patch series does and why
> > > it's improving anything, specifically the last patch for amdgpu.
> > >
> > > So please explain how this all adds up.
> > >
> > >>> The reason for this is that amdgpu decided to go with a different
> > >>> implicit sync model than everyone else:
> > >>> - within an drm file everything is unsynced and left to userspace t=
o
> > >>> handle, amdgpu.ko only ever sets the shared fence slots.
> > >>> - this means the exclusive slot really is exclusive to memory manag=
e
> > >>> issues, which side-steps the issue you point out above
> > >>> - for anything cross-device they unconditionally wait for any share=
d
> > >>> fence which is by another process
> > >>>
> > >>> Works, except it's incompatible with what everyone else is doing, s=
o
> > >>> had to be papered over by the current massive oversync solution.
> > >> Well actually it is only i915 I care of which is working differently=
.
> > > It's also anything that uses the atomic commit helpers. They _all_
> > > expect the exclusive fence to be set for the last write. i915 is the
> > > odd one out here by having its own commit helpers still, most other
> > > atomic drivers moved over to the helper version. But since I wrote
> > > both I think you can trust me that they work the same :-)
> > >
> > >> Radeon works the same way as amdgpu by waiting for everything before
> > >> doing command submission or pageflip.
> > > The thing is, we don't want to wait for everything. We only want to
> > > wait for the last writer, not for maybe a readback job or something
> > > else. And this isn't just about atomic flip, it's for any
> > > cross-device/process dma-buf sharing.
> >
> > Well exactly that's the problem. In amdgpu we do want to wait for
> > multiple fences, but not for page table updates (for example).
> >
> > That also one of the reasons why the approach with adding an exclusive
> > fence was never an option here.
>
> Lying to the kernel is ok. That's the entire point I'm trying to get
> across. And amdgpu needs to gain some uapi to make that lying
> possible.
>
> Also it's not lying, it's how this stuff works:
> - For anything you don't share, you _never_ set the write flag.
> Userspace takes care of any fencing needs itself. You alos tell the
> kernel to _always_ ignore any exclusive fence it sets.
> - For sharing you set the write flag, but _only_ only handover points.
> Same when you synchronize with other access, you do that once at the
> handover point, and then you tell the kernel to ignore the exclusive
> fence everywhere else.
>
> Essentially you treat implicit sync not as something magic, but as a
> very screwed up IPC mechanism for explicit fences.
>
> Again this isn't lying, it's how it works. The kernel cannot and must
> not rely on userspace telling the truth (couldn't check it without a
> cmd parser), so the only thing you can use the write flag respectively
> exclusive fence is as an IPC slot for fences.
>
> Use it like IPC, not like a shotgun approach of "maybe we should set a
> fence and let the kernel sort out the mess".
>
> > > There's essentially two worlds we have here:
> > > - drivers which work like i915, where exclusive slot is for implicit
> > > sync, and shared is just for "I'm using this"
> > > - amdgpu (you claim more, I'm honestly not so sure since you only
> > > fixed amdgpu and i915 display), where all access is in the shard
> > > slots, and then on cross-* sync you want to sync with all of them.
> >
> > Well we also have radeon and nouveau which are basically lying to the
> > kernel when they say that a BO is only read accessed to allow different
> > submissions to the MM and graphics engine to run in parallel.
>
> Again, lying is how this works. amdgpu needs to learn to lie too.

If that's lying then ANV has been lying since the dawn of time.

> > > These two aren't compatible.
> > >
> > > Also please keep in mind that neither radeon nor nouveau have a vulka=
n
> > > driver, so pretty sure they haven't had to solve this problem much
> > > yet.
> >
> > Not the Vulkan problem, but the MM engine and GFX engine need to access
> > the same BO with both reads and writes at the same time problem.
> >
> > > Also I just reviewed nouveau, nouveau_bo_fence() says your wrong with
> > > your claim, it sets the exclusive fence when userspace indicates a
> > > write domain.
> > >
> > > Also I looked at radeon, assuming I didn't get lost this seems to
> > > indicate radeon also works like I think it should:
> > >
> > >          p->relocs[i].tv.num_shared =3D !r->write_domain;
> > >
> > > ttm_eu_fence_buffer_objects() then picks that up and sets the right
> > > fence for radeon_cs.c code.
> >
> > Yes, your observation is correct. The problem is only that both nouveau
> > and radeon are lying to the kernel (or at least they used to).
> >
> > We just never ran into problems because neither driver can share BOs
> > containing NV12 pictures directly with other drivers.
>
> Hm care to explain? Why is NV12 special?
>
> > >>> First step in fixing that is (and frankly was since years) to fix t=
he
> > >>> amdgpu CS so winsys can pass along a bunch of flags about which CS
> > >>> should actually set the exclusive fence, so that you stop oversynci=
ng
> > >>> so badly. Ofc old userspace needs to keep oversyncing forever, no w=
ay
> > >>> to fix that.
> > >> Exactly that is what we don't want to do because the winsys has no i=
dea
> > >> when to sync and when not to sync.
> > > Uh ... so why exactly can anv do it? And turnip and a few others?
> > > What's the precise case where the winsys can't do the sync itself,
> > > because it has no idea what's going on, but somehow the kernel can?
> > > Can you please explain this, because we're definitely talking past
> > > each another here. I really don't see any case where the kernel has
> > > additional information than the userspace drivers here. But there's
> > > lots of cases where userspace definitely knows more.
> >
> > The kernel knows when a BO is used by a different process and can add
> > the proper inter process synchronization there.
>
> Yeah but why does your userspace not know when a bo is used?

We always know when a BO is exported because we're the ones doing the
export call.  Always.  Of course, we don't know if that BO is shared
with another driver or re-imported back into the same one but is that
really the case we're optimizing for?

> Or very bluntly, why cant radv do what anv does (or amdvlk if you care
> more about that, it's the same)? What's missing with lots of blantant
> lying?

I'm also not buying this.  You keep claiming that userspace doesn't
know but GL definitely does know and Vulkan knows well enough.  You
say that it's motivated by Vulkan and use RADV as an example but the
only reason why the RADV guys haven't followed the ANV design is to
work around limitations in amdgpu.  We shouldn't then use RADV to
justify why this is the right uAPI and why i915 is wrong.

> > >> The kernel on the other hand perfectly knows that.
> > >>
> > >>> Instead what Christian patch set here does is move amdgpu back to t=
he
> > >>> dma_resv contract it prefers, break everything else and then fix up
> > >>> i915 atomic path so that the one use case that originally highlight=
ed
> > >>> the mismatch here works again. Which hrm .... no :-)
> > >>>
> > >>> I think the reason this wasn't ever a pressing issue is that amdgpu=
.ko
> > >>> only does this for buffers shared across devices, so in most cases =
you
> > >>> don't suffer from the terribly oversync. Conceptually it's still al=
l
> > >>> there.
> > >>>
> > >>>> The solution I *think* Christian is proposing is basically to have
> > >>>> four categories of fences instead of two: exclusive, weak (shared =
with
> > >>>> no r/w), read, and write.  (No, I didn't include r/w but that's th=
e
> > >>>> same as write-only when it comes to hazards.)  Then a bunch of fla=
gs
> > >>>> and helpers to be able to handle the interactions between the thre=
e
> > >>>> types of shared fences.  Honestly, this is something I've consider=
ed
> > >>>> as I've wrestled with these problems in the past.  That said....
> > >>>>
> > >>>>    1. In GL, we can make the read/write information accurate and n=
ever
> > >>>> over/under sync.
> > >>>>
> > >>>>    2. In the future ANV model I described earlier, this isn't a pr=
oblem.
> > >>>> It throws in a write-fence exactly once per frame.  It actually
> > >>>> under-synchronizes but in a safe way.  I think that mostly makes t=
he
> > >>>> problem go away in practice.
> > >>>>
> > >>>>    3. If the core issue here really is memory vs. execution sync a=
s I've
> > >>>> said, maybe we really are papering over something by continuing to=
 mix
> > >>>> them.  Do we really want four fence types or do we want two orthog=
onal
> > >>>> fence types?
> > >>> Now once amdgpu.ko is fixed, we still have the problem of mixing up
> > >>> the exclusive fence for implicit sync with the exclusive fence for
> > >>> memory management. And for that we can and probably should figure o=
ut
> > >>> what to do there. But that still requires that amdgpu CS first lear=
ns
> > >>> what's actually going on from userspace, and secondly, that we do t=
his
> > >>> addition in a way which is compatible with current dma_resv users
> > >>> (i.e. all drivers currently asking for an exclusive fence need to p=
ick
> > >>> up both types of exclusive fences if we decide to split them).
> > >>>> I think I've convinced myself that the problem is real, but not th=
at
> > >>>> this solution is correct.
> > >>> Yeah there's definitely some problems here, but Christian hasn't
> > >>> really explained which one he's trying to solve, so we're also runn=
ing
> > >>> a bit in a circle trying to guess what's what :-/
> > >> Well how can I help with that?
> > >>
> > >> Jason seems to have the perfect understanding why we have those prob=
lems.
> > > See my other reply. I think aside from dma-buf p2p we don't actually
> > > have a problem?
> > >
> > >> And as long as we are all inside amdgpu we also don't have any overs=
ync,
> > >> the issue only happens when we share dma-bufs with i915 (radeon and
> > >> AFAIK nouveau does the right thing as well).
> > > Yeah because then you can't use the amdgpu dma_resv model anymore and
> > > have to use the one atomic helpers use. Which is also the one that
> > > e.g. Jason is threathening to bake in as uapi with his dma_buf ioctl,
> > > so as soon as that lands and someone starts using it, something has t=
o
> > > adapt _anytime_ you have a dma-buf hanging around. Not just when it's
> > > shared with another device.
> >
> > Yeah, and that is exactly the reason why I will NAK this uAPI change.
> >
> > This doesn't works for amdgpu at all for the reasons outlined above.
>
> Uh that's really not how uapi works. "my driver is right, everyone
> else is wrong" is not how cross driver contracts are defined. If that
> means a perf impact until you've fixed your rules, that's on you.
>
> Also you're a few years too late with nacking this, it's already uapi
> in the form of the dma-buf poll() support.

^^  My fancy new ioctl doesn't expose anything that isn't already
there.  It just lets you take a snap-shot of a wait instead of doing
an active wait which might end up with more fences added depending on
interrupts and retries.  The dma-buf poll waits on all fences for
POLLOUT and only the exclusive fence for POLLIN.  It's already uAPI.

> > > So the way I see things right now:
> > > - exclusive fence slot is for implicit sync. kmd should only set it
> > > when userspace indicates, otherwise you will suffer. Explicit syncing
> > > userspace needs to tell the kernel with a flag in the CS ioctl when i=
t
> > > should sync against this exclusive fence and when it should ignore it=
,
> > > otherwise you'll suffer badly once more.
> >
> > That is not sufficient. The explicit sync slot is for kernel internal
> > memory management.
>
> Then we need to split it. But what I discussed with Thomas Hellstrom
> is that at least for anything except p2p dma-buf ttm_bo->moving should
> be enough.

This is starting to sound like maybe roughly the right direction to me
but I'm still unclear on exactly what problem we're trying to solve
for TLB invalidates.  I'd like to understand that better before giving
strong opinions.  I'm also not super-familiar with ttm_bo->moving but
it sounds like we need some third category of fence somewhere.

--Jason


> > E.g. every access needs to sync to it and we can't allow to ignore it b=
y
> > specifying an userspace flag.
> >
> > > - no funny tricks with not doing this when it's just internally in
> > > your driver, because the more uapi we build on top of dma-buf fd the
> > > harder this will break. amdgpu gets to keep some nasty tricks going
> > > here until appropriate uapi is finally rolled out, but should stop
> > > this asap.
> >
> > That is really not going to happen. The kernel is the only place where
> > you can do proper implicit synchronization between processes.
>
> I think you need to refute Jason's mail here with a bit more detail
> than just a claim that this is so.
>
> > > - ttm_bo->moving is the fence for stuff you're not allowed to ignore.
> > > Probably need to move that to dma_resv for p2p dma-buf, not sure on
> > > that yet.
> >
> > Well that's at least some possibility. But I would do it the other way
> > around, the exclusive fence stays what it is and you add another
> > implicit sync fence.
>
> Can we please stop with the "amdgpu is right, everyone else is wrong" app=
roach?
>
> Like I'm pretty much going to type up the patch that does a full drm
> subsytem audit of everything and whack amdgpu into compliance. Perf
> hit be damned, you had a few years to fix this with better uapi. Or I
> find out that there's a giant inconsistent mess, but at least we'd
> gain some clarity about where exactly we are here and maybe what to do
> next.
> -Daniel
>
> >
> > Regards,
> > Christian.
> >
> > >
> > > After that I think we can look at what exact oversync issue remains
> > > and why and solve it, but until we have this this just feels like
> > > another rehash of "amgpu insist its own dma_resv interpration is the
> > > right one and everyone else should move one over".
> > >
> > > Or maybe I've just become real garbage at reading random driver code,
> > > wouldn't be the first time :-)
> > >
> > > Cheers, Daniel
> > >
> > >> Regards,
> > >> Christian.
> > >>
> > >>> Cheers, Daniel
> > >>>
> > >>>> --Jason
> > >>>>
> > >>>>
> > >>>>>> That's also the reason the Valve guys came up with a solution wh=
ere each
> > >>>>>> BO gets a flag for explicit sync, but that only works for export=
s and
> > >>>>>> not for imports.
> > >>>>>>
> > >>>>>>> I915 and iirc msm has explicit flags for this, panfrost was des=
igned to
> > >>>>>>> support this correctly from the start (also with flags I think)=
. That's at
> > >>>>>>> least what I remember from all the discussions at XDC and #dri-=
devel, but
> > >>>>>>> didn't check the code again to give you the list of uapi flags =
you need
> > >>>>>>> for each driver.
> > >>>>>>>
> > >>>>>>> The other piece is making sure you're only picking up implicit =
fences when
> > >>>>>>> you should, and not any later ones, for which Jason has a solut=
ion:
> > >>>>>>>
> > >>>>>>> https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jaso=
n@jlekstrand.net/
> > >>>>>> Yes, I helped with that as well. But I think that this is just a=
nother
> > >>>>>> workaround without really addressing the underlying problem.
> > >>>>>>
> > >>>>>>> If amdgpu isn't using those, then you will suffer from
> > >>>>>>> over-synchronization in vulkan and pay a price. The entire poin=
t of vulkan
> > >>>>>>> is that you pick up sync points very explicitly, and we also ne=
ed to have
> > >>>>>>> very explicit uapi for userspace to pick up/set the implicit fe=
nces.
> > >>>>>>>
> > >>>>>>> Trying to paper over this with more implicit magic is imo just =
wrong, and
> > >>>>>>> definitely not the long term explicit sync model we want.
> > >>>>>> I completely disagree.
> > >>>>>>
> > >>>>>> In my opinion the implicit sync model we have for dma_resv curre=
ntly is
> > >>>>>> just not well designed at all, since it always requires cooperat=
ion from
> > >>>>>> userspace.
> > >>>>>>
> > >>>>>> In other words you need to know when to enable implicit sync in
> > >>>>>> userspace and that information is simply not present all of the =
time.
> > >>>>>>
> > >>>>>> What we have done here is just keeping the old reader/writer fla=
gs i915,
> > >>>>>> radeon and nouveau once had and pushed that out to everybody els=
e making
> > >>>>>> the assumption that everybody would follow that without document=
ing the
> > >>>>>> actual rules of engagement you need to follow here.
> > >>>>>>
> > >>>>>> That was a really big mistake and we should try to fix that soon=
er or
> > >>>>>> later. The only other clean alternative I see is to use a flag o=
n the
> > >>>>>> exporter to tell the importer if it should sync to shared fences=
 or not.
> > >>>>>>
> > >>>>>> Additional to that I'm perfectly fine with implicit sync. Explic=
it sync
> > >>>>>> certainly has some use cases as well, but I don't see it as an a=
bsolute
> > >>>>>> advantage over the implicit model.
> > >>>>> Ok this stops making sense. Somehow you claim userspace doesn't k=
now
> > >>>>> when to sync, but somehow the kernel does? By guessing, and getti=
ng it
> > >>>>> wrong mostly, except for the one case that you benchmarked?
> > >>>>>
> > >>>>> Aside from silly userspace which exports a buffer to a dma-buf, b=
ut
> > >>>>> then never imports it anywhere else, there isn't a case I know of
> > >>>>> where the kernel actually knows more than userspace. But there's =
lots
> > >>>>> of cases where the kernel definitely knows less, especially if
> > >>>>> userspace doesn't tell it about what's going on with each renderi=
ng
> > >>>>> and buffer.
> > >>>>>
> > >>>>> So here's the 2 things you need to make this work like every othe=
r driver:
> > >>>>>
> > >>>>> 1. A way to set the explicit fence on a buffer. CS ioctl is perfe=
ctly
> > >>>>> fine, but also can be seperate. Userspace uses this only on a) sh=
ared
> > >>>>> buffers b) when there's a flush/swap on that shared buffer. Not w=
hen
> > >>>>> rendering any of the interim stuff, that only leads to oversync.
> > >>>>> Anything non-shared is handled explicitly in userspace (at least =
for
> > >>>>> modern-ish drivers). This is the only thing that ever sets an
> > >>>>> exclusive fence (aside from ttm moving buffers around ofc).
> > >>>>>
> > >>>>> 2. A way to sync with the implicit fences, either all of them (fo=
r
> > >>>>> upcoming write access) or just the write fence (for read access).=
 At
> > >>>>> first we thought it's good enough to do this in the CS ioctl, but
> > >>>>> that's a wee bit too late, hence the patches from Jason. My
> > >>>>> understanding is that vulkan converts this into an vk syncobj/fen=
ce of
> > >>>>> some sorts, so really can't make this more explicit and intention=
al
> > >>>>> than that.
> > >>>>>
> > >>>>> None of this is something the kernel has the slightest idea about=
 when
> > >>>>> it happens, so you have to have explicit uapi for it. Trying to f=
ake
> > >>>>> it in the kernel just doesn't work.
> > >>>>> -Daniel
> > >>>>> --
> > >>>>> Daniel Vetter
> > >>>>> Software Engineer, Intel Corporation
> > >>>>> http://blog.ffwll.ch
> > >>>
> > >>> --
> > >>> Daniel Vetter
> > >>> Software Engineer, Intel Corporation
> > >>> http://blog.ffwll.ch
> > >
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
