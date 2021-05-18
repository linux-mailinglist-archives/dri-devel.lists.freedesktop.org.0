Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 349013881FC
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 23:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F206ECA9;
	Tue, 18 May 2021 21:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78166ECA9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 21:17:12 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so9921192otp.4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SksGZRV5XpzbqV8NAzZlEm/Rmnm6uYsyOwpeOuYsCoI=;
 b=h8+GIhHquoRmmq0JglcFucqyozORkXETBDh/wXpWTSnJlGAOxXhR9/C/0NG/o98oVb
 MnurmhTUuc3+IHHphorcmHSi879zvm8Ojc9Ew6eq70NRXNqXq8aeq92Jj7jjXya8kGV7
 5jQGJOF8yeex5rQNvF36kMaVDnCTD9CEFCHfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SksGZRV5XpzbqV8NAzZlEm/Rmnm6uYsyOwpeOuYsCoI=;
 b=N3u0hUTCKtVX2FIyvRl1hJERflXHbH7VV0CU/K0q33qd6/JcG2Cfr/Q0+QdRTCER7c
 vlM6WVmZxjGDW595dZjxghUYA2ARUIa44Yx/7CnvCh6zTd9iDasbJAPUkDAeEwLNI88b
 WZx+WKgo78kEAU2GKrZapPKUKb33qNB0Z2iNa+C8i5uQF4U1H+9CZ5xGW10qE4xDwXPY
 4WPFQsf/9fFY3tBcP1sensvalAc8fIEyhi2YQQ1CJMR+34tBd8MwfjL2LPK1hEqp34/P
 t3kX5KX+rUh7/A/wflmLqb1ef/t3ax3ti6jTfB9fgCJUTj3c/L4CZf6wcWH5HyXJATOC
 FcJA==
X-Gm-Message-State: AOAM532nUgVz6LUaY2evWxzqbgWy+ElySU9YPuXqM1p0OFTgCifA3hrB
 6yPJAsH0+KD48G8BZTUEMCjz+8rvITlJmZBx6pU/rQ==
X-Google-Smtp-Source: ABdhPJyLY8dJHGqu59roG8xHWtCd7GnvWt4lGqbRn/NvFBexsKvATgf68P+cKjBoJ+u3fHHOT3N2kIrWHZxK8gYkCv4=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr5666120otq.303.1621372631821; 
 Tue, 18 May 2021 14:17:11 -0700 (PDT)
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
In-Reply-To: <f2eb6751-2f82-9b23-f57e-548de5b729de@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 18 May 2021 23:17:00 +0200
Message-ID: <CAKMK7uHdsGjADQ9zwgrYsuhHdxFGkuH--DdOsaqej6OD1AbX-w@mail.gmail.com>
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
 <linaro-mm-sig@lists.linaro.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 7:40 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 18.05.21 um 18:48 schrieb Daniel Vetter:
> > On Tue, May 18, 2021 at 2:49 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Hi Jason & Daniel,
> >>
> >> Am 18.05.21 um 07:59 schrieb Daniel Vetter:
> >>> On Tue, May 18, 2021 at 12:49 AM Jason Ekstrand <jason@jlekstrand.net=
> wrote:
> >>>> On Mon, May 17, 2021 at 3:15 PM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
> >>>>> On Mon, May 17, 2021 at 9:38 PM Christian K=C3=B6nig
> >>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>>>> Am 17.05.21 um 17:04 schrieb Daniel Vetter:
> >>>>>>> On Mon, May 17, 2021 at 04:11:18PM +0200, Christian K=C3=B6nig wr=
ote:
> >>>>>>>> We had a long outstanding problem in amdgpu that buffers exporte=
d to
> >>>>>>>> user drivers by DMA-buf serialize all command submissions using =
them.
> >>>>>>>>
> >>>>>>>> In other words we can't compose the buffer with different engine=
s and
> >>>>>>>> then send it to another driver for display further processing.
> >>>>>>>>
> >>>>>>>> This was added to work around the fact that i915 didn't wanted t=
o wait
> >>>>>>>> for shared fences in the dma_resv objects before displaying a bu=
ffer.
> >>>>>>>>
> >>>>>>>> Since this problem is now causing issues with Vulkan we need to =
find a
> >>>>>>>> better solution for that.
> >>>>>>>>
> >>>>>>>> The patch set here tries to do this by adding an usage flag to t=
he
> >>>>>>>> shared fences noting when and how they should participate in imp=
licit
> >>>>>>>> synchronization.
> >>>>>>> So the way this is fixed in every other vulkan driver is that vul=
kan
> >>>>>>> userspace sets flags in the CS ioctl when it wants to synchronize=
 with
> >>>>>>> implicit sync. This gets you mostly there. Last time I checked am=
dgpu
> >>>>>>> isn't doing this, and yes that's broken.
> >>>>>> And exactly that is a really bad approach as far as I can see. The
> >>>>>> Vulkan stack on top simply doesn't know when to set this flag duri=
ng CS.
> >>>>> Adding Jason for the Vulkan side of things, because this isn't how =
I
> >>>>> understand this works.
> >>>>>
> >>>>> But purely form a kernel pov your patches are sketchy for two reaso=
ns:
> >>>>>
> >>>>> - we reinstate the amdgpu special case of not setting exclusive fen=
ces
> >>>>>
> >>>>> - you only fix the single special case of i915 display, nothing els=
e
> >>>>>
> >>>>> That's not how a cross driver interface works. And if you'd do this
> >>>>> properly, you'd be back to all the same sync fun you've orignally h=
ad,
> >>>>> with all the same fallout.
> >>>> I think I'm starting to see what Christian is trying to do here and =
I
> >>>> think there likely is a real genuine problem here.  I'm not convince=
d
> >>>> this is 100% of a solution but there might be something real.  Let m=
e
> >>>> see if I can convince you or if I just make a hash of things. :-)
> >>>>
> >>>> The problem, once again, comes down to memory fencing vs. execution
> >>>> fencing and the way that we've unfortunately tied them together in t=
he
> >>>> kernel.  With the current architecture, the only way to get proper
> >>>> write-fence semantics for implicit sync is to take an exclusive fenc=
e
> >>>> on the buffer.  This implies two things:
> >>>>
> >>>>    1. You have to implicitly wait on EVERY fence on the buffer befor=
e
> >>>> you can start your write-fenced operation
> >>>>
> >>>>    2. No one else can start ANY operation which accesses that buffer
> >>>> until you're done.
> >> Yes, exactly that. You absolutely nailed it.
> >>
> >> I unfortunately also have a 3rd use case:
> >>
> >> 3. Operations which shouldn't participate in any syncing, but only
> >> affect the memory management.
> >>
> >> This is basically our heavyweight TLB flush after unmapping the BO fro=
m
> >> somebodies page tables. Nobody should ever be concerned about it for a=
ny
> >> form of synchronization, but memory managment is not allowed to reuse =
or
> >> move the buffer before the operation is completed.
> > Isn't that just another case of 2? Or I'm not getting it.
>
> The problem in this case is not starting a new CS, but synchronizing to
> the existing ones.
>
> See a heavy TLB flush is made completely out of sync. E.g. it doesn't
> want to wait for any previous operation.
>
> In other words imagine the following example:
> 1. Both process A and B have a BO mapped.
> 2. Process A is heavily using the BO and doing all kind of rendering.
> 3. Process B is unmapping the BO.
>
> Now that process B unmaps the BO needs to trigger page table updates and
> a heavy TLB flush, but since this can take really long we want to do it
> asynchronously on the hardware.
>
> With the current approach you basically can't do that because you can't
> note that a fence should not participate in synchronization at all.
>
> E.g. we can't add a fence which doesn't wait for the exclusive one as
> shared.

Ok I think that's a real problem, and  guess it's also related to all
the ttm privatization tricks and all that. So essentially we'd need
the opposite of ttm_bo->moving, as in you can't ignore it, but
otherwise it completely ignores all the userspace implicit fence
stuff.

> >>>> Let's say that you have a buffer which is shared between two drivers=
 A
> >>>> and B and let's say driver A has thrown a fence on it just to ensure
> >>>> that the BO doesn't get swapped out to disk until it's at a good
> >>>> stopping point.  Then driver B comes along and wants to throw a
> >>>> write-fence on it.  Suddenly, your memory fence from driver A causes
> >>>> driver B to have to stall waiting for a "good" time to throw in a
> >>>> fence.  It sounds like this is the sort of scenario that Christian i=
s
> >>>> running into.  And, yes, with certain Vulkan drivers being a bit
> >>>> sloppy about exactly when they throw in write fences, I could see it
> >>>> being a real problem.
> >>> Yes this is a potential problem, and on the i915 side we need to do
> >>> some shuffling here most likely. Especially due to discrete, but the
> >>> problem is pre-existing. tbh I forgot about the implications here
> >>> until I pondered this again yesterday evening.
> >>>
> >>> But afaiui the amdgpu code and winsys in mesa, this isn't (yet) the
> >>> problem amd vk drivers have. The issue is that with amdgpu, all you
> >>> supply are the following bits at CS time:
> >>> - list of always mapped private buffers, which is implicit and O(1) i=
n
> >>> the kernel fastpath
> >>> - additional list of shared buffers that are used by the current CS
> >>>
> >>> I didn't check how exactly that works wrt winsys buffer ownership, bu=
t
> >>> the thing is that on the kernel side _any_ buffer in there is treated
> >>> as a implicit sync'ed write. Which means if you render your winsys
> >>> with a bunch of command submission split over 3d and compute pipes,
> >>> you end up with horrendous amounts of oversync.
> >> What are you talking about? We have no sync at all for submissions fro=
m
> >> the same client.
> > Yes. Except when the buffer is shared with another driver, at which
> > point you sync a _lot_ and feel the pain.
>
> Yes, exactly that's the problem.
>
> We basically don't know during CS if a BO is shared or not.
>
> We do know that during importing or exporting the BO thought.

No you don't. Or at least that's massively awkward, see Jason's reply.

> > Or I'm not understanding at all what your patch series does and why
> > it's improving anything, specifically the last patch for amdgpu.
> >
> > So please explain how this all adds up.
> >
> >>> The reason for this is that amdgpu decided to go with a different
> >>> implicit sync model than everyone else:
> >>> - within an drm file everything is unsynced and left to userspace to
> >>> handle, amdgpu.ko only ever sets the shared fence slots.
> >>> - this means the exclusive slot really is exclusive to memory manage
> >>> issues, which side-steps the issue you point out above
> >>> - for anything cross-device they unconditionally wait for any shared
> >>> fence which is by another process
> >>>
> >>> Works, except it's incompatible with what everyone else is doing, so
> >>> had to be papered over by the current massive oversync solution.
> >> Well actually it is only i915 I care of which is working differently.
> > It's also anything that uses the atomic commit helpers. They _all_
> > expect the exclusive fence to be set for the last write. i915 is the
> > odd one out here by having its own commit helpers still, most other
> > atomic drivers moved over to the helper version. But since I wrote
> > both I think you can trust me that they work the same :-)
> >
> >> Radeon works the same way as amdgpu by waiting for everything before
> >> doing command submission or pageflip.
> > The thing is, we don't want to wait for everything. We only want to
> > wait for the last writer, not for maybe a readback job or something
> > else. And this isn't just about atomic flip, it's for any
> > cross-device/process dma-buf sharing.
>
> Well exactly that's the problem. In amdgpu we do want to wait for
> multiple fences, but not for page table updates (for example).
>
> That also one of the reasons why the approach with adding an exclusive
> fence was never an option here.

Lying to the kernel is ok. That's the entire point I'm trying to get
across. And amdgpu needs to gain some uapi to make that lying
possible.

Also it's not lying, it's how this stuff works:
- For anything you don't share, you _never_ set the write flag.
Userspace takes care of any fencing needs itself. You alos tell the
kernel to _always_ ignore any exclusive fence it sets.
- For sharing you set the write flag, but _only_ only handover points.
Same when you synchronize with other access, you do that once at the
handover point, and then you tell the kernel to ignore the exclusive
fence everywhere else.

Essentially you treat implicit sync not as something magic, but as a
very screwed up IPC mechanism for explicit fences.

Again this isn't lying, it's how it works. The kernel cannot and must
not rely on userspace telling the truth (couldn't check it without a
cmd parser), so the only thing you can use the write flag respectively
exclusive fence is as an IPC slot for fences.

Use it like IPC, not like a shotgun approach of "maybe we should set a
fence and let the kernel sort out the mess".

> > There's essentially two worlds we have here:
> > - drivers which work like i915, where exclusive slot is for implicit
> > sync, and shared is just for "I'm using this"
> > - amdgpu (you claim more, I'm honestly not so sure since you only
> > fixed amdgpu and i915 display), where all access is in the shard
> > slots, and then on cross-* sync you want to sync with all of them.
>
> Well we also have radeon and nouveau which are basically lying to the
> kernel when they say that a BO is only read accessed to allow different
> submissions to the MM and graphics engine to run in parallel.

Again, lying is how this works. amdgpu needs to learn to lie too.

> > These two aren't compatible.
> >
> > Also please keep in mind that neither radeon nor nouveau have a vulkan
> > driver, so pretty sure they haven't had to solve this problem much
> > yet.
>
> Not the Vulkan problem, but the MM engine and GFX engine need to access
> the same BO with both reads and writes at the same time problem.
>
> > Also I just reviewed nouveau, nouveau_bo_fence() says your wrong with
> > your claim, it sets the exclusive fence when userspace indicates a
> > write domain.
> >
> > Also I looked at radeon, assuming I didn't get lost this seems to
> > indicate radeon also works like I think it should:
> >
> >          p->relocs[i].tv.num_shared =3D !r->write_domain;
> >
> > ttm_eu_fence_buffer_objects() then picks that up and sets the right
> > fence for radeon_cs.c code.
>
> Yes, your observation is correct. The problem is only that both nouveau
> and radeon are lying to the kernel (or at least they used to).
>
> We just never ran into problems because neither driver can share BOs
> containing NV12 pictures directly with other drivers.

Hm care to explain? Why is NV12 special?

> >>> First step in fixing that is (and frankly was since years) to fix the
> >>> amdgpu CS so winsys can pass along a bunch of flags about which CS
> >>> should actually set the exclusive fence, so that you stop oversyncing
> >>> so badly. Ofc old userspace needs to keep oversyncing forever, no way
> >>> to fix that.
> >> Exactly that is what we don't want to do because the winsys has no ide=
a
> >> when to sync and when not to sync.
> > Uh ... so why exactly can anv do it? And turnip and a few others?
> > What's the precise case where the winsys can't do the sync itself,
> > because it has no idea what's going on, but somehow the kernel can?
> > Can you please explain this, because we're definitely talking past
> > each another here. I really don't see any case where the kernel has
> > additional information than the userspace drivers here. But there's
> > lots of cases where userspace definitely knows more.
>
> The kernel knows when a BO is used by a different process and can add
> the proper inter process synchronization there.

Yeah but why does your userspace not know when a bo is used?

Or very bluntly, why cant radv do what anv does (or amdvlk if you care
more about that, it's the same)? What's missing with lots of blantant
lying?

> >> The kernel on the other hand perfectly knows that.
> >>
> >>> Instead what Christian patch set here does is move amdgpu back to the
> >>> dma_resv contract it prefers, break everything else and then fix up
> >>> i915 atomic path so that the one use case that originally highlighted
> >>> the mismatch here works again. Which hrm .... no :-)
> >>>
> >>> I think the reason this wasn't ever a pressing issue is that amdgpu.k=
o
> >>> only does this for buffers shared across devices, so in most cases yo=
u
> >>> don't suffer from the terribly oversync. Conceptually it's still all
> >>> there.
> >>>
> >>>> The solution I *think* Christian is proposing is basically to have
> >>>> four categories of fences instead of two: exclusive, weak (shared wi=
th
> >>>> no r/w), read, and write.  (No, I didn't include r/w but that's the
> >>>> same as write-only when it comes to hazards.)  Then a bunch of flags
> >>>> and helpers to be able to handle the interactions between the three
> >>>> types of shared fences.  Honestly, this is something I've considered
> >>>> as I've wrestled with these problems in the past.  That said....
> >>>>
> >>>>    1. In GL, we can make the read/write information accurate and nev=
er
> >>>> over/under sync.
> >>>>
> >>>>    2. In the future ANV model I described earlier, this isn't a prob=
lem.
> >>>> It throws in a write-fence exactly once per frame.  It actually
> >>>> under-synchronizes but in a safe way.  I think that mostly makes the
> >>>> problem go away in practice.
> >>>>
> >>>>    3. If the core issue here really is memory vs. execution sync as =
I've
> >>>> said, maybe we really are papering over something by continuing to m=
ix
> >>>> them.  Do we really want four fence types or do we want two orthogon=
al
> >>>> fence types?
> >>> Now once amdgpu.ko is fixed, we still have the problem of mixing up
> >>> the exclusive fence for implicit sync with the exclusive fence for
> >>> memory management. And for that we can and probably should figure out
> >>> what to do there. But that still requires that amdgpu CS first learns
> >>> what's actually going on from userspace, and secondly, that we do thi=
s
> >>> addition in a way which is compatible with current dma_resv users
> >>> (i.e. all drivers currently asking for an exclusive fence need to pic=
k
> >>> up both types of exclusive fences if we decide to split them).
> >>>> I think I've convinced myself that the problem is real, but not that
> >>>> this solution is correct.
> >>> Yeah there's definitely some problems here, but Christian hasn't
> >>> really explained which one he's trying to solve, so we're also runnin=
g
> >>> a bit in a circle trying to guess what's what :-/
> >> Well how can I help with that?
> >>
> >> Jason seems to have the perfect understanding why we have those proble=
ms.
> > See my other reply. I think aside from dma-buf p2p we don't actually
> > have a problem?
> >
> >> And as long as we are all inside amdgpu we also don't have any oversyn=
c,
> >> the issue only happens when we share dma-bufs with i915 (radeon and
> >> AFAIK nouveau does the right thing as well).
> > Yeah because then you can't use the amdgpu dma_resv model anymore and
> > have to use the one atomic helpers use. Which is also the one that
> > e.g. Jason is threathening to bake in as uapi with his dma_buf ioctl,
> > so as soon as that lands and someone starts using it, something has to
> > adapt _anytime_ you have a dma-buf hanging around. Not just when it's
> > shared with another device.
>
> Yeah, and that is exactly the reason why I will NAK this uAPI change.
>
> This doesn't works for amdgpu at all for the reasons outlined above.

Uh that's really not how uapi works. "my driver is right, everyone
else is wrong" is not how cross driver contracts are defined. If that
means a perf impact until you've fixed your rules, that's on you.

Also you're a few years too late with nacking this, it's already uapi
in the form of the dma-buf poll() support.

> > So the way I see things right now:
> > - exclusive fence slot is for implicit sync. kmd should only set it
> > when userspace indicates, otherwise you will suffer. Explicit syncing
> > userspace needs to tell the kernel with a flag in the CS ioctl when it
> > should sync against this exclusive fence and when it should ignore it,
> > otherwise you'll suffer badly once more.
>
> That is not sufficient. The explicit sync slot is for kernel internal
> memory management.

Then we need to split it. But what I discussed with Thomas Hellstrom
is that at least for anything except p2p dma-buf ttm_bo->moving should
be enough.

> E.g. every access needs to sync to it and we can't allow to ignore it by
> specifying an userspace flag.
>
> > - no funny tricks with not doing this when it's just internally in
> > your driver, because the more uapi we build on top of dma-buf fd the
> > harder this will break. amdgpu gets to keep some nasty tricks going
> > here until appropriate uapi is finally rolled out, but should stop
> > this asap.
>
> That is really not going to happen. The kernel is the only place where
> you can do proper implicit synchronization between processes.

I think you need to refute Jason's mail here with a bit more detail
than just a claim that this is so.

> > - ttm_bo->moving is the fence for stuff you're not allowed to ignore.
> > Probably need to move that to dma_resv for p2p dma-buf, not sure on
> > that yet.
>
> Well that's at least some possibility. But I would do it the other way
> around, the exclusive fence stays what it is and you add another
> implicit sync fence.

Can we please stop with the "amdgpu is right, everyone else is wrong" appro=
ach?

Like I'm pretty much going to type up the patch that does a full drm
subsytem audit of everything and whack amdgpu into compliance. Perf
hit be damned, you had a few years to fix this with better uapi. Or I
find out that there's a giant inconsistent mess, but at least we'd
gain some clarity about where exactly we are here and maybe what to do
next.
-Daniel

>
> Regards,
> Christian.
>
> >
> > After that I think we can look at what exact oversync issue remains
> > and why and solve it, but until we have this this just feels like
> > another rehash of "amgpu insist its own dma_resv interpration is the
> > right one and everyone else should move one over".
> >
> > Or maybe I've just become real garbage at reading random driver code,
> > wouldn't be the first time :-)
> >
> > Cheers, Daniel
> >
> >> Regards,
> >> Christian.
> >>
> >>> Cheers, Daniel
> >>>
> >>>> --Jason
> >>>>
> >>>>
> >>>>>> That's also the reason the Valve guys came up with a solution wher=
e each
> >>>>>> BO gets a flag for explicit sync, but that only works for exports =
and
> >>>>>> not for imports.
> >>>>>>
> >>>>>>> I915 and iirc msm has explicit flags for this, panfrost was desig=
ned to
> >>>>>>> support this correctly from the start (also with flags I think). =
That's at
> >>>>>>> least what I remember from all the discussions at XDC and #dri-de=
vel, but
> >>>>>>> didn't check the code again to give you the list of uapi flags yo=
u need
> >>>>>>> for each driver.
> >>>>>>>
> >>>>>>> The other piece is making sure you're only picking up implicit fe=
nces when
> >>>>>>> you should, and not any later ones, for which Jason has a solutio=
n:
> >>>>>>>
> >>>>>>> https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jason@=
jlekstrand.net/
> >>>>>> Yes, I helped with that as well. But I think that this is just ano=
ther
> >>>>>> workaround without really addressing the underlying problem.
> >>>>>>
> >>>>>>> If amdgpu isn't using those, then you will suffer from
> >>>>>>> over-synchronization in vulkan and pay a price. The entire point =
of vulkan
> >>>>>>> is that you pick up sync points very explicitly, and we also need=
 to have
> >>>>>>> very explicit uapi for userspace to pick up/set the implicit fenc=
es.
> >>>>>>>
> >>>>>>> Trying to paper over this with more implicit magic is imo just wr=
ong, and
> >>>>>>> definitely not the long term explicit sync model we want.
> >>>>>> I completely disagree.
> >>>>>>
> >>>>>> In my opinion the implicit sync model we have for dma_resv current=
ly is
> >>>>>> just not well designed at all, since it always requires cooperatio=
n from
> >>>>>> userspace.
> >>>>>>
> >>>>>> In other words you need to know when to enable implicit sync in
> >>>>>> userspace and that information is simply not present all of the ti=
me.
> >>>>>>
> >>>>>> What we have done here is just keeping the old reader/writer flags=
 i915,
> >>>>>> radeon and nouveau once had and pushed that out to everybody else =
making
> >>>>>> the assumption that everybody would follow that without documentin=
g the
> >>>>>> actual rules of engagement you need to follow here.
> >>>>>>
> >>>>>> That was a really big mistake and we should try to fix that sooner=
 or
> >>>>>> later. The only other clean alternative I see is to use a flag on =
the
> >>>>>> exporter to tell the importer if it should sync to shared fences o=
r not.
> >>>>>>
> >>>>>> Additional to that I'm perfectly fine with implicit sync. Explicit=
 sync
> >>>>>> certainly has some use cases as well, but I don't see it as an abs=
olute
> >>>>>> advantage over the implicit model.
> >>>>> Ok this stops making sense. Somehow you claim userspace doesn't kno=
w
> >>>>> when to sync, but somehow the kernel does? By guessing, and getting=
 it
> >>>>> wrong mostly, except for the one case that you benchmarked?
> >>>>>
> >>>>> Aside from silly userspace which exports a buffer to a dma-buf, but
> >>>>> then never imports it anywhere else, there isn't a case I know of
> >>>>> where the kernel actually knows more than userspace. But there's lo=
ts
> >>>>> of cases where the kernel definitely knows less, especially if
> >>>>> userspace doesn't tell it about what's going on with each rendering
> >>>>> and buffer.
> >>>>>
> >>>>> So here's the 2 things you need to make this work like every other =
driver:
> >>>>>
> >>>>> 1. A way to set the explicit fence on a buffer. CS ioctl is perfect=
ly
> >>>>> fine, but also can be seperate. Userspace uses this only on a) shar=
ed
> >>>>> buffers b) when there's a flush/swap on that shared buffer. Not whe=
n
> >>>>> rendering any of the interim stuff, that only leads to oversync.
> >>>>> Anything non-shared is handled explicitly in userspace (at least fo=
r
> >>>>> modern-ish drivers). This is the only thing that ever sets an
> >>>>> exclusive fence (aside from ttm moving buffers around ofc).
> >>>>>
> >>>>> 2. A way to sync with the implicit fences, either all of them (for
> >>>>> upcoming write access) or just the write fence (for read access). A=
t
> >>>>> first we thought it's good enough to do this in the CS ioctl, but
> >>>>> that's a wee bit too late, hence the patches from Jason. My
> >>>>> understanding is that vulkan converts this into an vk syncobj/fence=
 of
> >>>>> some sorts, so really can't make this more explicit and intentional
> >>>>> than that.
> >>>>>
> >>>>> None of this is something the kernel has the slightest idea about w=
hen
> >>>>> it happens, so you have to have explicit uapi for it. Trying to fak=
e
> >>>>> it in the kernel just doesn't work.
> >>>>> -Daniel
> >>>>> --
> >>>>> Daniel Vetter
> >>>>> Software Engineer, Intel Corporation
> >>>>> http://blog.ffwll.ch
> >>>
> >>> --
> >>> Daniel Vetter
> >>> Software Engineer, Intel Corporation
> >>> http://blog.ffwll.ch
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
