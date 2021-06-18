Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A58F3ACE79
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 17:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B8F6EA37;
	Fri, 18 Jun 2021 15:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5B66EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 15:18:04 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id s17so2143217oij.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IziyHqd3ymBUaYPDj2gXxSndSLvv0oXN4pCzhkrliiE=;
 b=LiFRgTXcJNVzjKlBSV9aYnO5k/iFzFmeFmZzH0qMYep3pEDa1QCgwqNEgPzwqE+H2p
 mjL3txCeKSAiE9EWiGle0DJuZ1wgcHsrGVUyYdxdm6ModfOf9T6Obs9lp3XMurkkvN6U
 qNtvm3Hkuots7OZWbpIzTvcms3EDtWXbDSwVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IziyHqd3ymBUaYPDj2gXxSndSLvv0oXN4pCzhkrliiE=;
 b=bCPJ+TMnE50hou8joF7ioM7QKwSOafic+nGPGvqXCy/oO4hSv/IwvBE8Fm9NhrT6m7
 7Je9Pl0SbN5DFvBr978JKgdSmn+itlbfX1xJji42eW3Ezcyii1hR8M4mCyW1rg7c1QNc
 2tSxmhY02O48MbToyDGOdPdlg+oVPG6XsLeayRVjuJ8h6T//uKvqO7E+lSOxUEXo689g
 X+LmczyHGA0ri12S4fO80palvnxO1cbJ88g9w+51L/RmmKtip6TpmLaUAoOnRFfpIbuh
 hi3ZImegpfkCfOMrAUcc3BHVASQxjrftspTEnNH8IQMKtLtNYnBHSLkk3dnvYljwl67h
 2jKQ==
X-Gm-Message-State: AOAM530sznNM/MDfmyiU0nl8XjCBzslSODDKix78lTXHxziZPb3KUVn2
 tdvvWqgvyhB1AG+IeK6+VSFXo3TYy6gbmpkz9SjhQg==
X-Google-Smtp-Source: ABdhPJyX/g8CXJod1c5Eb8UddmVMBuUXCD+lgoojNlULerp+C2DbHHZ5lFIs0ssol9F4NHYs/z0ALhxG8cXghCTKdpI=
X-Received: by 2002:aca:afc5:: with SMTP id y188mr5905945oie.14.1624029484016; 
 Fri, 18 Jun 2021 08:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210610210925.642582-1-jason@jlekstrand.net>
 <29e9795e-8ec7-282c-c8ec-413eaed2e4d4@gmail.com>
 <CAOFGe94oFA9=vy56--hm=9=232+Npnxrpn+6gGFpRM2dmJZh3w@mail.gmail.com>
 <84135114-71d4-77f0-7a6b-69bb81b7f73c@amd.com>
 <YMupgTffAfw8xw51@phenom.ffwll.local>
 <e8fc12a3-42eb-30f9-c6ac-772fbc675678@amd.com>
 <CAKMK7uH5oW3icBPOPsumRv+LJ-5qCVKgfniXd-J8mnA+JuRq+Q@mail.gmail.com>
 <53c1c0c2-5e17-a54f-155b-66f3cd4b48a3@amd.com>
In-Reply-To: <53c1c0c2-5e17-a54f-155b-66f3cd4b48a3@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 18 Jun 2021 17:17:52 +0200
Message-ID: <CAKMK7uHng_beNWeYa50Nxrz2SQVmjTuuN-cAYz-SQtAymGdH3Q@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH 0/6] dma-buf: Add an API for exporting sync
 files (v12)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, ML mesa-dev <mesa-dev@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 18, 2021 at 4:42 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.06.21 um 16:31 schrieb Daniel Vetter:
> > [SNIP]
> >> And that drivers choose to ignore the exclusive fence is an absolutely
> >> no-go from a memory management and security point of view. Exclusive
> >> access means exclusive access. Ignoring that won't work.
> > Yeah, this is why I've been going all over the place about lifting
> > ttm_bo->moving to dma_resv. And also that I flat out don't trust your
> > audit, if you havent found these drivers then very clearly you didn't
> > audit much at all :-)
>
> I just didn't though that anybody could be so stupid to allow such a
> thing in.
>
> >> The only thing which saved us so far is the fact that drivers doing th=
is
> >> are not that complex.
> >>
> >> BTW: How does it even work? I mean then you would run into the same
> >> problem as amdgpu with its page table update fences, e.g. that your
> >> shared fences might signal before the exclusive one.
> > So we don't ignore any fences when we rip out the backing storage.
> >
> > And yes there's currently a bug in all these drivers that if you set
> > both the "ignore implicit fences" and the "set the exclusive fence"
> > flag, then we just break this. Which is why I think we want to have a
> > dma_fence_add_shared_exclusive() helper extracted from your amdgpu
> > code, which we can then use everywhere to plug this.
>
> Daniel are you realizing what you are talking about here? Does that also
> apply for imported DMA-bufs?
>
> If yes than that is a security hole you can push an elephant through.
>
> Can you point me to the code using that?
>
> >>> For dma-buf this isn't actually a problem, because dma-buf are pinned=
. You
> >>> can't move them while other drivers are using them, hence there's not
> >>> actually a ttm_bo->moving fence we can ignore.
> >>>
> >>> p2p dma-buf aka dynamic dma-buf is a different beast, and i915 (and f=
wiw
> >>> these other drivers) need to change before they can do dynamic dma-bu=
f.
> >>>
> >>>> Otherwise we have an information leak worth a CVE and that is certai=
nly not
> >>>> something we want.
> >>> Because yes otherwise we get a CVE. But right now I don't think we ha=
ve
> >>> one.
> >> Yeah, agree. But this is just because of coincident and not because of
> >> good engineering :)
> > Well the good news is that I think we're now talking slightly less
> > past each another than the past few weeks :-)
> >
> >>> We do have a quite big confusion on what exactly the signaling orderi=
ng is
> >>> supposed to be between exclusive and the collective set of shared fen=
ces,
> >>> and there's some unifying that needs to happen here. But I think what
> >>> Jason implements here in the import ioctl is the most defensive versi=
on
> >>> possible, so really can't break any driver. It really works like you =
have
> >>> an ad-hoc gpu engine that does nothing itself, but waits for the curr=
ent
> >>> exclusive fence and then sets the exclusive fence with its "CS" compl=
etion
> >>> fence.
> >>>
> >>> That's imo perfectly legit use-case.
> >> The use case is certainly legit, but I'm not sure if merging this at t=
he
> >> moment is a good idea.
> >>
> >> Your note that drivers are already ignoring the exclusive fence in the
> >> dma_resv object was eye opening to me. And I now have the very strong
> >> feeling that the synchronization and the design of the dma_resv object
> >> is even more messy then I thought it is.
> >>
> >> To summarize we can be really lucky that it didn't blow up into our
> >> faces already.
> > I don't think there was that much luck involved (ok I did find a
> > possible bug in i915 already around cpu cache flushing) - for SoC the
> > exclusive slot in dma_resv really is only used for implicit sync and
> > nothing else. The fun only starts when you throw in pipelined backing
> > storage movement.
> >
> > I guess this also explains why you just seemed to ignore me when I was
> > asking for a memory management exclusive fence for the p2p stuff, or
> > some other way to specifically handling movements (like ttm_bo->moving
> > or whatever it is). From my pov we clearly needed that to make p2p
> > dma-buf work well enough, mixing up the memory management exclusive
> > slot with the implicit sync exclusive slot never looked like a bright
> > idea to me.
> >
> > I think at least we now have some understanding here.
>
> Well to be honest what you have just told me means that i915 is
> seriously broken.
>
> Ignoring the exclusive fence on an imported DMA-buf is an absolutely
> *NO-GO* even without P2P.
>
> What you have stitched together here allows anybody to basically read
> any memory on the system with both i915 and nouveau, radeon or amdgpu.
>
> We need to fix that ASAP!

Ignoring _all_ fences is officially ok for pinned dma-buf. This is
what v4l does. Aside from it's definitely not just i915 that does this
even on the drm side, we have a few more drivers nowadays.

The rules are that after you've called dma_buf_map_attachment the
memory exists, and is _not_ allowed to move, or be uncleared data, or
anything else. This must be guaranteed until dma_buf_unmap_attachment
is called.

Also drivers are not required to even set a dma_fence in the dma_resv
object for their dma access. Again v4l works like this by design, but
we've had plenty of drivers who totally ignored dma_resv beforehand
too.

So if there's a problem, I think you first need to explain what it is.
Also if you wonder how we got here, that part is easy: dma-buf
predates dma-resv extraction from ttm by quite some time (years even
iirc). So the og dma-buf rules really are "fences don't matter, do
whatever you feel with them". Well you're not allowed to just remove
them if their not your own, since that could break other drivers :-)

If amdgpu now e.g. pipelines the clearing/moving of
dma_buf_map_attachment behind an exclusive fence, that would be
broken. That is _only_ allowed if both exporter and all importers are
dynamic. I don't think you've done that, but if that's the case then
the dma_buf_ops->pin callback would need to have a
dma_fence_wait(exclusive_fence) or something like that to plug that
gap.

If it's something else, then please walk me through the scenario
because I'm not seeing a problem here.
-Daniel

> Regards,
> Christian.
>
> >>> Same for the export one. Waiting for a previous snapshot of implicit
> >>> fences is imo perfectly ok use-case and useful for compositors - clie=
nt
> >>> might soon start more rendering, and on some drivers that always resu=
lts
> >>> in the exclusive slot being set, so if you dont take a snapshot you
> >>> oversync real bad for your atomic flip.
> >> The export use case is unproblematic as far as I can see.
> >>
> >>>>> Those changes are years in the past.  If we have a real problem her=
e (not sure on
> >>>>> that yet), then we'll have to figure out how to fix it without nuki=
ng
> >>>>> uAPI.
> >>>> Well, that was the basic idea of attaching flags to the fences in th=
e
> >>>> dma_resv object.
> >>>>
> >>>> In other words you clearly denote when you have to wait for a fence =
before
> >>>> accessing a buffer or you cause a security issue.
> >>> Replied somewhere else, and I do kinda like the flag idea. But the pr=
oblem
> >>> is we first need a ton more encapsulation and review of drivers befor=
e we
> >>> can change the internals. One thing at a time.
> >> Ok how should we then proceed?
> >>
> >> The large patch set I've send out to convert all users of the shared
> >> fence list to a for_each API is a step into the right direction I thin=
k,
> >> but there is still a bit more todo.
> > Yeah I had noted that as "need to review". But I think we should be
> > even more aggressive with encapsulation (at least where it doesn't
> > matter that much from a perf pov). Like my suggestion for dma_buf_poll
> > to not open-code the entire dance, but just use a snapshot thing. But
> > I'll check out next week what you cooked up with the iterator.
> >
> >>> And yes for amdgpu this gets triple-hard because you both have the
> >>> ttm_bo->moving fence _and_ the current uapi of using fence ownership =
_and_
> >>> you need to figure out how to support vulkan properly with true opt-i=
n
> >>> fencing.
> >> Well I have been pondering on that for a bit and I came to the
> >> conclusion that it is actually not a problem at all.
> >>
> >> See radeon, nouveau, msm etc... all implement functions that they don'=
t
> >> wait for fences from the same timeline, context, engine. That amdgpu
> >> doesn't wait for fences from the same process can be seen as just a
> >> special case of this.
> > Oh that part isn't a fundamental design issue, internally you can do
> > whatever uapi you want. All I meant to say is because you currently
> > have this uapi, but not yet flags to control things more explicitly,
> > it's going to be more tricky code for amdgpu than for other drivers to
> > keep it all working. But not impossible, just more code.
> >
> >>>    I'm pretty sure it's doable, I'm just not finding any time
> >>> anywhere to hack on these patches - too many other fires :-(
> >> Well I'm here. Let's just agree on the direction and I can do the codi=
ng.
> >>
> >> What I need help with is all the auditing. For example I still haven't
> >> wrapped my head around how i915 does the synchronization.
> > Yeah the auditing is annoying, and i915 is definitely butchered in
> > some ways. I'm currently screaming at silly bugs in the i915
> > relocation code (it was tuned a bit more than makes sense, and
> > acquired a pile of bugs due to that), but after that I should have
> > time to refresh the old series. That one audits the setting of
> > dma_resv fences fully, and I half-started with the
> > dependency/scheduler side too. There's going to be a few fixed needed
> > there.
> > -Daniel
> >
> >> Best regards,
> >> Christian.
> >>
> >>> Cheers, Daniel
> >>>
> >>>> Christian.
> >>>>
> >>>>> --Jason
> >>>>>
> >>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>> Am 10.06.21 um 23:09 schrieb Jason Ekstrand:
> >>>>>>> Modern userspace APIs like Vulkan are built on an explicit
> >>>>>>> synchronization model.  This doesn't always play nicely with the
> >>>>>>> implicit synchronization used in the kernel and assumed by X11 an=
d
> >>>>>>> Wayland.  The client -> compositor half of the synchronization is=
n't too
> >>>>>>> bad, at least on intel, because we can control whether or not i91=
5
> >>>>>>> synchronizes on the buffer and whether or not it's considered wri=
tten.
> >>>>>>>
> >>>>>>> The harder part is the compositor -> client synchronization when =
we get
> >>>>>>> the buffer back from the compositor.  We're required to be able t=
o
> >>>>>>> provide the client with a VkSemaphore and VkFence representing th=
e point
> >>>>>>> in time where the window system (compositor and/or display) finis=
hed
> >>>>>>> using the buffer.  With current APIs, it's very hard to do this i=
n such
> >>>>>>> a way that we don't get confused by the Vulkan driver's access of=
 the
> >>>>>>> buffer.  In particular, once we tell the kernel that we're render=
ing to
> >>>>>>> the buffer again, any CPU waits on the buffer or GPU dependencies=
 will
> >>>>>>> wait on some of the client rendering and not just the compositor.
> >>>>>>>
> >>>>>>> This new IOCTL solves this problem by allowing us to get a snapsh=
ot of
> >>>>>>> the implicit synchronization state of a given dma-buf in the form=
 of a
> >>>>>>> sync file.  It's effectively the same as a poll() or I915_GEM_WAI=
T only,
> >>>>>>> instead of CPU waiting directly, it encapsulates the wait operati=
on, at
> >>>>>>> the current moment in time, in a sync_file so we can check/wait o=
n it
> >>>>>>> later.  As long as the Vulkan driver does the sync_file export fr=
om the
> >>>>>>> dma-buf before we re-introduce it for rendering, it will only con=
tain
> >>>>>>> fences from the compositor or display.  This allows to accurately=
 turn
> >>>>>>> it into a VkFence or VkSemaphore without any over- synchronizatio=
n.
> >>>>>>>
> >>>>>>> This patch series actually contains two new ioctls.  There is the=
 export
> >>>>>>> one mentioned above as well as an RFC for an import ioctl which p=
rovides
> >>>>>>> the other half.  The intention is to land the export ioctl since =
it seems
> >>>>>>> like there's no real disagreement on that one.  The import ioctl,=
 however,
> >>>>>>> has a lot of debate around it so it's intended to be RFC-only for=
 now.
> >>>>>>>
> >>>>>>> Mesa MR: https://nam11.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fmerge_requests%2F403=
7&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C841231ea3c6e43f2141208d=
93265bfe7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637596234879170817%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;sdata=3DkDEQr7d7fbba6938tZoERXN6hlOyKMdVjgY5U4ux4=
iI%3D&amp;reserved=3D0
> >>>>>>> IGT tests: https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fpatchwork.freedesktop.org%2Fseries%2F90490%2F&amp;data=3D04%7=
C01%7Cchristian.koenig%40amd.com%7C841231ea3c6e43f2141208d93265bfe7%7C3dd89=
61fe4884e608e11a82d994e183d%7C0%7C0%7C637596234879170817%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;sdata=3DMM5c55nspWbUxzajqBv1iNHdz2TYAImG2XPOSnDE6qQ%3D&amp;reserve=
d=3D0
> >>>>>>>
> >>>>>>> v10 (Jason Ekstrand, Daniel Vetter):
> >>>>>>>      - Add reviews/acks
> >>>>>>>      - Add a patch to rename _rcu to _unlocked
> >>>>>>>      - Split things better so import is clearly RFC status
> >>>>>>>
> >>>>>>> v11 (Daniel Vetter):
> >>>>>>>      - Add more CCs to try and get maintainers
> >>>>>>>      - Add a patch to document DMA_BUF_IOCTL_SYNC
> >>>>>>>      - Generally better docs
> >>>>>>>      - Use separate structs for import/export (easier to document=
)
> >>>>>>>      - Fix an issue in the import patch
> >>>>>>>
> >>>>>>> v12 (Daniel Vetter):
> >>>>>>>      - Better docs for DMA_BUF_IOCTL_SYNC
> >>>>>>>
> >>>>>>> v12 (Christian K=C3=B6nig):
> >>>>>>>      - Drop the rename patch in favor of Christian's series
> >>>>>>>      - Add a comment to the commit message for the dma-buf sync_f=
ile export
> >>>>>>>        ioctl saying why we made it an ioctl on dma-buf
> >>>>>>>
> >>>>>>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>>> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> >>>>>>> Cc: Dave Airlie <airlied@redhat.com>
> >>>>>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >>>>>>> Cc: Daniel Stone <daniels@collabora.com>
> >>>>>>> Cc: mesa-dev@lists.freedesktop.org
> >>>>>>> Cc: wayland-devel@lists.freedesktop.org
> >>>>>>> Test-with: 20210524205225.872316-1-jason@jlekstrand.net
> >>>>>>>
> >>>>>>> Christian K=C3=B6nig (1):
> >>>>>>>       dma-buf: Add dma_fence_array_for_each (v2)
> >>>>>>>
> >>>>>>> Jason Ekstrand (5):
> >>>>>>>       dma-buf: Add dma_resv_get_singleton (v6)
> >>>>>>>       dma-buf: Document DMA_BUF_IOCTL_SYNC (v2)
> >>>>>>>       dma-buf: Add an API for exporting sync files (v12)
> >>>>>>>       RFC: dma-buf: Add an extra fence to dma_resv_get_singleton_=
unlocked
> >>>>>>>       RFC: dma-buf: Add an API for importing sync files (v7)
> >>>>>>>
> >>>>>>>      Documentation/driver-api/dma-buf.rst |   8 ++
> >>>>>>>      drivers/dma-buf/dma-buf.c            | 103 +++++++++++++++++=
++++++++
> >>>>>>>      drivers/dma-buf/dma-fence-array.c    |  27 +++++++
> >>>>>>>      drivers/dma-buf/dma-resv.c           | 110 +++++++++++++++++=
++++++++++
> >>>>>>>      include/linux/dma-fence-array.h      |  17 +++++
> >>>>>>>      include/linux/dma-resv.h             |   2 +
> >>>>>>>      include/uapi/linux/dma-buf.h         | 103 +++++++++++++++++=
+++++++-
> >>>>>>>      7 files changed, 369 insertions(+), 1 deletion(-)
> >>>>>>>
> >>>> _______________________________________________
> >>>> mesa-dev mailing list
> >>>> mesa-dev@lists.freedesktop.org
> >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
lists.freedesktop.org%2Fmailman%2Flistinfo%2Fmesa-dev&amp;data=3D04%7C01%7C=
christian.koenig%40amd.com%7C841231ea3c6e43f2141208d93265bfe7%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637596234879170817%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DiA%2B3ZezHwlfjMMpkf3bVX8M0HUk3lVDm%2F476G1S8yZI%3D&amp;reserved=
=3D0
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
