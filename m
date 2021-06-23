Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E353B1CF6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 16:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99676E922;
	Wed, 23 Jun 2021 14:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F233A6E921
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 14:58:33 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id i189so3795014ioa.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 07:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iVG90Gm6VH5cp7IKv4JJsrGYbdR308M65YWgZkCSYFo=;
 b=f++YeeMg+O/i1XOzhHEPDTXDcSzO9EytSwAiWc5r3indLmz/JHoIw0X0/oEwJhkXED
 am9EgdBAyLx80OdiwNMM+HGi0x78C54UDVa/oBjm5dVg9O9uik6xHeH22T0VxOBWiu2Z
 YmYVbfg/tjEy7+mZo7Z3JJpMGhYR24QNJZ5MK5t8XkI2reeo36YdxwH/MrM5ZALeeYq9
 qjWs59fqTlKpljMH4BimJUd04c9wN5U3HUe/34RASsgHaulQtZ3zUnz2hNSXKjPJxq3j
 ajt13zpLOdgdw8YhcEtokREEfYiurp9XeWibA62NO9EXCRwTbpyeYiTFkp4BGdkynrQ9
 /3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iVG90Gm6VH5cp7IKv4JJsrGYbdR308M65YWgZkCSYFo=;
 b=LCwFvCN21VGFXkre4t6Uk0eLw7cY3c9jGn3tgBmYGwz9pDbz/XisT3ChLTj0A1uiDm
 vTuuS3d2mBq5s9lmw6Vbr9/7GYy12cQuTIMd8m5Mv4Qc0bKMQ0UaExbrDc6QFoi20KzL
 d8UTxDW+8SBwulk4pg322qgkvHxxkRxXMIt55zBqx1unhcO1/y4Elichr8bkLWdN8Nir
 kzyg5dgvZcytp0NzkHTpC/ZXUMBqC3chnMBiA+sVpUXXMGriUBFbVN26p/LhtylDk7pm
 nWbTKKiy4svNqWAFZj3HrBMLA8tQVBZGUHErGZol8ZMOL1Vxxy84NHKEo4nl8bYPebse
 WedA==
X-Gm-Message-State: AOAM530h/KiUWScjNThA2nHztjUBhKwBTMd7jm0cUBvA7bMfvYF3x6d/
 xNJ3ePe7g1cBQVU7P/l3vL3MjjowAc6aKE6oLyhuSA==
X-Google-Smtp-Source: ABdhPJx8M/Z4r7RCO6ftTSQFXX4odKJcPHEMFzeaXxliSV2FbIuHqPu4AeYZThNgUYOX3+OtP7SQJoES7OrUsJhL90w=
X-Received: by 2002:a6b:3119:: with SMTP id j25mr4145ioa.64.1624460313109;
 Wed, 23 Jun 2021 07:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-16-daniel.vetter@ffwll.ch>
 <CAP+8YyHPLpe6jM7gz3ZNL3QqdHiCdL0P5cVMS7ddNgBSJmutSA@mail.gmail.com>
 <CAKMK7uGOrro7-2+OVJse3CcuZO66kreq-XjL45Ay5vhL=2TZvQ@mail.gmail.com>
 <3bf45006-4256-763d-601b-3a25a7057820@amd.com>
 <CAP+8YyH1xyYVfEkYVudCn+=jyiWxoZgDndrcSLM0Qq=E9_GDKg@mail.gmail.com>
 <421cb10d-92a7-0780-3d38-d4cabd008c0c@amd.com>
 <CAKMK7uEjc+tZCKB8Yu3_zAjOgYLPBhnYebHOXgxpFaSunuPCfA@mail.gmail.com>
 <682d2f3b-8ba3-cccb-1385-1f74f0b06ada@amd.com>
 <CAKMK7uGNNJZBMLvqXE9GkXESf-uZDWVxA5y+J2eKX9giNPXdZw@mail.gmail.com>
In-Reply-To: <CAKMK7uGNNJZBMLvqXE9GkXESf-uZDWVxA5y+J2eKX9giNPXdZw@mail.gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 23 Jun 2021 16:58:27 +0200
Message-ID: <CAP+8YyEGZFFVOaRW+AB4iTX_4qjqg-Wo9K21N2y1ScWK2Stzmg@mail.gmail.com>
Subject: Re: [PATCH 15/15] RFC: drm/amdgpu: Implement a proper implicit
 fencing uapi
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Daniel Stone <daniels@collabora.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 4:50 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> On Wed, Jun 23, 2021 at 4:02 PM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 23.06.21 um 15:49 schrieb Daniel Vetter:
> > > On Wed, Jun 23, 2021 at 3:44 PM Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > >> Am 23.06.21 um 15:38 schrieb Bas Nieuwenhuizen:
> > >>> On Wed, Jun 23, 2021 at 2:59 PM Christian K=C3=B6nig
> > >>> <christian.koenig@amd.com> wrote:
> > >>>> Am 23.06.21 um 14:18 schrieb Daniel Vetter:
> > >>>>> On Wed, Jun 23, 2021 at 11:45 AM Bas Nieuwenhuizen
> > >>>>> <bas@basnieuwenhuizen.nl> wrote:
> > >>>>>> On Tue, Jun 22, 2021 at 6:55 PM Daniel Vetter <daniel.vetter@ffw=
ll.ch> wrote:
> > >>>>>>> WARNING: Absolutely untested beyond "gcc isn't dying in agony".
> > >>>>>>>
> > >>>>>>> Implicit fencing done properly needs to treat the implicit fenc=
ing
> > >>>>>>> slots like a funny kind of IPC mailbox. In other words it needs=
 to be
> > >>>>>>> explicitly. This is the only way it will mesh well with explici=
t
> > >>>>>>> fencing userspace like vk, and it's also the bare minimum requi=
red to
> > >>>>>>> be able to manage anything else that wants to use the same buff=
er on
> > >>>>>>> multiple engines in parallel, and still be able to share it thr=
ough
> > >>>>>>> implicit sync.
> > >>>>>>>
> > >>>>>>> amdgpu completely lacks such an uapi. Fix this.
> > >>>>>>>
> > >>>>>>> Luckily the concept of ignoring implicit fences exists already,=
 and
> > >>>>>>> takes care of all the complexities of making sure that non-opti=
onal
> > >>>>>>> fences (like bo moves) are not ignored. This support was added =
in
> > >>>>>>>
> > >>>>>>> commit 177ae09b5d699a5ebd1cafcee78889db968abf54
> > >>>>>>> Author: Andres Rodriguez <andresx7@gmail.com>
> > >>>>>>> Date:   Fri Sep 15 20:44:06 2017 -0400
> > >>>>>>>
> > >>>>>>>        drm/amdgpu: introduce AMDGPU_GEM_CREATE_EXPLICIT_SYNC v2
> > >>>>>>>
> > >>>>>>> Unfortuantely it's the wrong semantics, because it's a bo flag =
and
> > >>>>>>> disables implicit sync on an allocated buffer completely.
> > >>>>>>>
> > >>>>>>> We _do_ want implicit sync, but control it explicitly. For this=
 we
> > >>>>>>> need a flag on the drm_file, so that a given userspace (like vu=
lkan)
> > >>>>>>> can manage the implicit sync slots explicitly. The other side o=
f the
> > >>>>>>> pipeline (compositor, other process or just different stage in =
a media
> > >>>>>>> pipeline in the same process) can then either do the same, or f=
ully
> > >>>>>>> participate in the implicit sync as implemented by the kernel b=
y
> > >>>>>>> default.
> > >>>>>>>
> > >>>>>>> By building on the existing flag for buffers we avoid any issue=
s with
> > >>>>>>> opening up additional security concerns - anything this new fla=
g here
> > >>>>>>> allows is already.
> > >>>>>>>
> > >>>>>>> All drivers which supports this concept of a userspace-specific
> > >>>>>>> opt-out of implicit sync have a flag in their CS ioctl, but in =
reality
> > >>>>>>> that turned out to be a bit too inflexible. See the discussion =
below,
> > >>>>>>> let's try to do a bit better for amdgpu.
> > >>>>>>>
> > >>>>>>> This alone only allows us to completely avoid any stalls due to
> > >>>>>>> implicit sync, it does not yet allow us to use implicit sync as=
 a
> > >>>>>>> strange form of IPC for sync_file.
> > >>>>>>>
> > >>>>>>> For that we need two more pieces:
> > >>>>>>>
> > >>>>>>> - a way to get the current implicit sync fences out of a buffer=
. Could
> > >>>>>>>      be done in a driver ioctl, but everyone needs this, and ge=
nerally a
> > >>>>>>>      dma-buf is involved anyway to establish the sharing. So an=
 ioctl on
> > >>>>>>>      the dma-buf makes a ton more sense:
> > >>>>>>>
> > >>>>>>>      https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-4-jason%40jle=
kstrand.net%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C83dbdd0a1e=
b8442cbf7108d9364db51e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376005=
29684040802%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DfbdwtutEj93anZp6Pshs277QoMTH=
ZxIy0Yl54T95rCw%3D&amp;reserved=3D0
> > >>>>>>>
> > >>>>>>>      Current drivers in upstream solves this by having the opt-=
out flag
> > >>>>>>>      on their CS ioctl. This has the downside that very often t=
he CS
> > >>>>>>>      which must actually stall for the implicit fence is run a =
while
> > >>>>>>>      after the implicit fence point was logically sampled per t=
he api
> > >>>>>>>      spec (vk passes an explicit syncobj around for that afaiui=
), and so
> > >>>>>>>      results in oversync. Converting the implicit sync fences i=
nto a
> > >>>>>>>      snap-shot sync_file is actually accurate.
> > >>>>>>>
> > >>>>>>> - Simillar we need to be able to set the exclusive implicit fen=
ce.
> > >>>>>>>      Current drivers again do this with a CS ioctl flag, with a=
gain the
> > >>>>>>>      same problems that the time the CS happens additional depe=
ndencies
> > >>>>>>>      have been added. An explicit ioctl to only insert a sync_f=
ile (while
> > >>>>>>>      respecting the rules for how exclusive and shared fence sl=
ots must
> > >>>>>>>      be update in struct dma_resv) is much better. This is prop=
osed here:
> > >>>>>>>
> > >>>>>>>      https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-5-jason%40jle=
kstrand.net%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C83dbdd0a1e=
b8442cbf7108d9364db51e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376005=
29684040802%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dvv%2BREnWorjoTOwrD1jH1GHVQcj=
Py1oesaophsz056aI%3D&amp;reserved=3D0
> > >>>>>>>
> > >>>>>>> These three pieces together allow userspace to fully control im=
plicit
> > >>>>>>> fencing and remove all unecessary stall points due to them.
> > >>>>>>>
> > >>>>>>> Well, as much as the implicit fencing model fundamentally allow=
s:
> > >>>>>>> There is only one set of fences, you can only choose to sync ag=
ainst
> > >>>>>>> only writers (exclusive slot), or everyone. Hence suballocating
> > >>>>>>> multiple buffers or anything else like this is fundamentally no=
t
> > >>>>>>> possible, and can only be fixed by a proper explicit fencing mo=
del.
> > >>>>>>>
> > >>>>>>> Aside from that caveat this model gets implicit fencing as clos=
ely to
> > >>>>>>> explicit fencing semantics as possible:
> > >>>>>>>
> > >>>>>>> On the actual implementation I opted for a simple setparam ioct=
l, no
> > >>>>>>> locking (just atomic reads/writes) for simplicity. There is a n=
ice
> > >>>>>>> flag parameter in the VM ioctl which we could use, except:
> > >>>>>>> - it's not checked, so userspace likely passes garbage
> > >>>>>>> - there's already a comment that userspace _does_ pass garbage =
in the
> > >>>>>>>      priority field
> > >>>>>>> So yeah unfortunately this flag parameter for setting vm flags =
is
> > >>>>>>> useless, and we need to hack up a new one.
> > >>>>>>>
> > >>>>>>> v2: Explain why a new SETPARAM (Jason)
> > >>>>>>>
> > >>>>>>> v3: Bas noticed I forgot to hook up the dependency-side shortcu=
t. We
> > >>>>>>> need both, or this doesn't do much.
> > >>>>>>>
> > >>>>>>> v4: Rebase over the amdgpu patch to always set the implicit syn=
c
> > >>>>>>> fences.
> > >>>>>> So I think there is still a case missing in this implementation.
> > >>>>>> Consider these 3 cases
> > >>>>>>
> > >>>>>> (format: a->b: b waits on a. Yes, I know arrows are hard)
> > >>>>>>
> > >>>>>> explicit->explicit: This doesn't wait now, which is good
> > >>>>>> Implicit->explicit: This doesn't wait now, which is good
> > >>>>>> explicit->implicit : This still waits as the explicit submission=
 still
> > >>>>>> adds shared fences and most things that set an exclusive fence f=
or
> > >>>>>> implicit sync will hence wait on it.
> > >>>>>>
> > >>>>>> This is probably good enough for what radv needs now but also so=
unds
> > >>>>>> like a risk wrt baking in new uapi behavior that we don't want t=
o be
> > >>>>>> the end result.
> > >>>>>>
> > >>>>>> Within AMDGPU this is probably solvable in two ways:
> > >>>>>>
> > >>>>>> 1) Downgrade AMDGPU_SYNC_NE_OWNER to AMDGPU_SYNC_EXPLICIT for sh=
ared fences.
> > >>>>> I'm not sure that works. I think the right fix is that radeonsi a=
lso
> > >>>>> switches to this model, with maybe a per-bo CS flag to set indica=
te
> > >>>>> write access, to cut down on the number of ioctls that are needed
> > >>>>> otherwise on shared buffers. This per-bo flag would essentially s=
elect
> > >>>>> between SYNC_NE_OWNER and SYNC_EXPLICIT on a per-buffer basis.
> > >>>> Yeah, but I'm still not entirely sure why that approach isn't suff=
icient?
> > >>>>
> > >>>> Problem with the per context or per vm flag is that you then don't=
 get
> > >>>> any implicit synchronization any more when another process starts =
using
> > >>>> the buffer.
> > >>> That is exactly what I want for Vulkan :)
> > >> Yeah, but as far as I know this is not something we can do.
> > >>
> > >> See we have use cases like screen capture and debug which rely on th=
at
> > >> behavior.
> > > They will keep working, if (and only if) the vulkan side sets the
> > > winsys fences correctly. Also, everything else in vulkan aside from
> > > winsys is explicitly not synced at all, you have to import drm syncob=
j
> > > timeline on the gl side.
> > >
> > >> The only thing we can do is to say on a per buffer flag that a buffe=
r
> > >> should not participate in implicit sync at all.
> > > Nah, this doesn't work. Because it's not a global decision, is a loca=
l
> > > decision for the rendered. Vulkan wants to control implicit sync
> > > explicitly, and the kernel can't force more synchronization. If a
> > > buffer is shared as a winsys buffer between vulkan client and gl usin=
g
> > > compositor, then you _have_ to use implicit sync on it. But vk needs
> > > to set the fences directly (and if the app gets it wrong, you get
> > > misrendering, but that is the specified behavour of vulkan).
> >
> > Yeah, but that's exactly what we tried to avoid.
> >
> > Mhm, when we attach the flag to the process/VM then this would break th=
e
> > use case of VA-API and Vulkan in the same process.
> >
> > But I think if you attach the flag to the context that should indeed
> > work fine.
>
> Yeah that's a question I have, whether the drm_file is shared within
> one process among everything, or whether radeonsi/libva/vk each have
> their own. If each have their own drm_file, then we should be fine,
> otherwise we need to figure out another place to put this (worst case
> as a CS extension that vk just sets on every submit).

libdrm_amdgpu dedupes it all so we mostly end up with one drm_file per
process (modulo minigbm on chromeos and modulo a master fd).

That said the current proposal is for the context right? And on the
context this should pretty much work? So I'm not sure why this is the
part we are discussing?

>
> Also yes this risks that a vk app which was violationing the winsys
> spec will now break, which is why I think we should do this sooner
> than later. Otherwise the list of w/a we might need to apply in vk
> userspace will become very long :-( At least since this is purely
> opt-in from userspace, we only need to have the w/a list in userspace,
> where mesa has the infrastructure for that already.
> -Daniel
>
> >
> > Christian.
> >
> > > -Daniel
> > >
> > >> Regards,
> > >> Christian.
> > >>
> > >>>>> The current amdgpu uapi just doesn't allow any other model withou=
t an
> > >>>>> explicit opt-in. So current implicit sync userspace just has to
> > >>>>> oversync, there's not much choice.
> > >>>>>
> > >>>>>> 2) Have an EXPLICIT fence owner that is used for explicit submis=
sions
> > >>>>>> that is ignored by AMDGPU_SYNC_NE_OWNER.
> > >>>>>>
> > >>>>>> But this doesn't solve cross-driver interactions here.
> > >>>>> Yeah cross-driver is still entirely unsolved, because
> > >>>>> amdgpu_bo_explicit_sync() on the bo didn't solve that either.
> > >>>> Hui? You have lost me. Why is that still unsolved?
> > >>> The part we're trying to solve with this patch is Vulkan should not
> > >>> participate in any implicit sync at all wrt submissions (and then
> > >>> handle the implicit sync for WSI explicitly using the fence
> > >>> import/export stuff that Jason wrote). As long we add shared fences=
 to
> > >>> the dma_resv we participate in implicit sync (at the level of an
> > >>> implicit sync read) still, at least from the perspective of later j=
obs
> > >>> waiting on these fences.
> > >>>
> > >>>> Regards,
> > >>>> Christian.
> > >>>>
> > >>>>> -Daniel
> > >>>>>
> > >>>>>>> Cc: mesa-dev@lists.freedesktop.org
> > >>>>>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > >>>>>>> Cc: Dave Airlie <airlied@gmail.com>
> > >>>>>>> Cc: Rob Clark <robdclark@chromium.org>
> > >>>>>>> Cc: Kristian H. Kristensen <hoegsberg@google.com>
> > >>>>>>> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> > >>>>>>> Cc: Daniel Stone <daniels@collabora.com>
> > >>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > >>>>>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > >>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> > >>>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > >>>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> > >>>>>>> Cc: Chen Li <chenli@uniontech.com>
> > >>>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
> > >>>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
> > >>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> > >>>>>>> Cc: linaro-mm-sig@lists.linaro.org
> > >>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > >>>>>>> ---
> > >>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  7 +++++--
> > >>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 21 ++++++++++++++=
+++++++
> > >>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  6 ++++++
> > >>>>>>>     include/uapi/drm/amdgpu_drm.h           | 10 ++++++++++
> > >>>>>>>     4 files changed, 42 insertions(+), 2 deletions(-)
> > >>>>>>>
> > >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_cs.c
> > >>>>>>> index 65df34c17264..c5386d13eb4a 100644
> > >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > >>>>>>> @@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdg=
pu_cs_parser *p,
> > >>>>>>>            struct amdgpu_bo *gds;
> > >>>>>>>            struct amdgpu_bo *gws;
> > >>>>>>>            struct amdgpu_bo *oa;
> > >>>>>>> +       bool no_implicit_sync =3D READ_ONCE(fpriv->vm.no_implic=
it_sync);
> > >>>>>>>            int r;
> > >>>>>>>
> > >>>>>>>            INIT_LIST_HEAD(&p->validated);
> > >>>>>>> @@ -577,7 +578,8 @@ static int amdgpu_cs_parser_bos(struct amdg=
pu_cs_parser *p,
> > >>>>>>>
> > >>>>>>>                    e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
> > >>>>>>>
> > >>>>>>> -               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit=
_sync(bo)) {
> > >>>>>>> +               if (bo->tbo.base.dma_buf &&
> > >>>>>>> +                   !(no_implicit_sync || amdgpu_bo_explicit_sy=
nc(bo))) {
> > >>>>>>>                            e->chain =3D dma_fence_chain_alloc()=
;
> > >>>>>>>                            if (!e->chain) {
> > >>>>>>>                                    r =3D -ENOMEM;
> > >>>>>>> @@ -649,6 +651,7 @@ static int amdgpu_cs_sync_rings(struct amdg=
pu_cs_parser *p)
> > >>>>>>>     {
> > >>>>>>>            struct amdgpu_fpriv *fpriv =3D p->filp->driver_priv;
> > >>>>>>>            struct amdgpu_bo_list_entry *e;
> > >>>>>>> +       bool no_implicit_sync =3D READ_ONCE(fpriv->vm.no_implic=
it_sync);
> > >>>>>>>            int r;
> > >>>>>>>
> > >>>>>>>            list_for_each_entry(e, &p->validated, tv.head) {
> > >>>>>>> @@ -656,7 +659,7 @@ static int amdgpu_cs_sync_rings(struct amdg=
pu_cs_parser *p)
> > >>>>>>>                    struct dma_resv *resv =3D bo->tbo.base.resv;
> > >>>>>>>                    enum amdgpu_sync_mode sync_mode;
> > >>>>>>>
> > >>>>>>> -               sync_mode =3D amdgpu_bo_explicit_sync(bo) ?
> > >>>>>>> +               sync_mode =3D no_implicit_sync || amdgpu_bo_exp=
licit_sync(bo) ?
> > >>>>>>>                            AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_N=
E_OWNER;
> > >>>>>>>                    r =3D amdgpu_sync_resv(p->adev, &p->job->syn=
c, resv, sync_mode,
> > >>>>>>>                                         &fpriv->vm);
> > >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/=
gpu/drm/amd/amdgpu/amdgpu_drv.c
> > >>>>>>> index c080ba15ae77..f982626b5328 100644
> > >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > >>>>>>> @@ -1724,6 +1724,26 @@ int amdgpu_file_to_fpriv(struct file *fi=
lp, struct amdgpu_fpriv **fpriv)
> > >>>>>>>            return 0;
> > >>>>>>>     }
> > >>>>>>>
> > >>>>>>> +int amdgpu_setparam_ioctl(struct drm_device *dev, void *data,
> > >>>>>>> +                         struct drm_file *filp)
> > >>>>>>> +{
> > >>>>>>> +       struct drm_amdgpu_setparam *setparam =3D data;
> > >>>>>>> +       struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
> > >>>>>>> +
> > >>>>>>> +       switch (setparam->param) {
> > >>>>>>> +       case AMDGPU_SETPARAM_NO_IMPLICIT_SYNC:
> > >>>>>>> +               if (setparam->value)
> > >>>>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, =
true);
> > >>>>>>> +               else
> > >>>>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, =
false);
> > >>>>>>> +               break;
> > >>>>>>> +       default:
> > >>>>>>> +               return -EINVAL;
> > >>>>>>> +       }
> > >>>>>>> +
> > >>>>>>> +       return 0;
> > >>>>>>> +}
> > >>>>>>> +
> > >>>>>>>     const struct drm_ioctl_desc amdgpu_ioctls_kms[] =3D {
> > >>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_crea=
te_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> > >>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_=
AUTH|DRM_RENDER_ALLOW),
> > >>>>>>> @@ -1742,6 +1762,7 @@ const struct drm_ioctl_desc amdgpu_ioctls=
_kms[] =3D {
> > >>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl=
, DRM_AUTH|DRM_RENDER_ALLOW),
> > >>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl=
, DRM_AUTH|DRM_RENDER_ALLOW),
> > >>>>>>>            DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_use=
rptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
> > >>>>>>> +       DRM_IOCTL_DEF_DRV(AMDGPU_SETPARAM, amdgpu_setparam_ioct=
l, DRM_AUTH|DRM_RENDER_ALLOW),
> > >>>>>>>     };
> > >>>>>>>
> > >>>>>>>     static const struct drm_driver amdgpu_kms_driver =3D {
> > >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_vm.h
> > >>>>>>> index ddb85a85cbba..0e8c440c6303 100644
> > >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> > >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> > >>>>>>> @@ -321,6 +321,12 @@ struct amdgpu_vm {
> > >>>>>>>            bool                    bulk_moveable;
> > >>>>>>>            /* Flag to indicate if VM is used for compute */
> > >>>>>>>            bool                    is_compute_context;
> > >>>>>>> +       /*
> > >>>>>>> +        * Flag to indicate whether implicit sync should always=
 be skipped on
> > >>>>>>> +        * this context. We do not care about races at all, use=
rspace is allowed
> > >>>>>>> +        * to shoot itself with implicit sync to its fullest li=
king.
> > >>>>>>> +        */
> > >>>>>>> +       bool no_implicit_sync;
> > >>>>>>>     };
> > >>>>>>>
> > >>>>>>>     struct amdgpu_vm_manager {
> > >>>>>>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/a=
mdgpu_drm.h
> > >>>>>>> index 0cbd1540aeac..9eae245c14d6 100644
> > >>>>>>> --- a/include/uapi/drm/amdgpu_drm.h
> > >>>>>>> +++ b/include/uapi/drm/amdgpu_drm.h
> > >>>>>>> @@ -54,6 +54,7 @@ extern "C" {
> > >>>>>>>     #define DRM_AMDGPU_VM                  0x13
> > >>>>>>>     #define DRM_AMDGPU_FENCE_TO_HANDLE     0x14
> > >>>>>>>     #define DRM_AMDGPU_SCHED               0x15
> > >>>>>>> +#define DRM_AMDGPU_SETPARAM            0x16
> > >>>>>>>
> > >>>>>>>     #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND=
_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
> > >>>>>>>     #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND=
_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> > >>>>>>> @@ -71,6 +72,7 @@ extern "C" {
> > >>>>>>>     #define DRM_IOCTL_AMDGPU_VM            DRM_IOWR(DRM_COMMAND=
_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
> > >>>>>>>     #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMA=
ND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
> > >>>>>>>     #define DRM_IOCTL_AMDGPU_SCHED         DRM_IOW(DRM_COMMAND_=
BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
> > >>>>>>> +#define DRM_IOCTL_AMDGPU_SETPARAM      DRM_IOW(DRM_COMMAND_BAS=
E + DRM_AMDGPU_SETPARAM, struct drm_amdgpu_setparam)
> > >>>>>>>
> > >>>>>>>     /**
> > >>>>>>>      * DOC: memory domains
> > >>>>>>> @@ -306,6 +308,14 @@ union drm_amdgpu_sched {
> > >>>>>>>            struct drm_amdgpu_sched_in in;
> > >>>>>>>     };
> > >>>>>>>
> > >>>>>>> +#define AMDGPU_SETPARAM_NO_IMPLICIT_SYNC       1
> > >>>>>>> +
> > >>>>>>> +struct drm_amdgpu_setparam {
> > >>>>>>> +       /* AMDGPU_SETPARAM_* */
> > >>>>>>> +       __u32   param;
> > >>>>>>> +       __u32   value;
> > >>>>>>> +};
> > >>>>>>> +
> > >>>>>>>     /*
> > >>>>>>>      * This is not a reliable API and you should expect it to f=
ail for any
> > >>>>>>>      * number of reasons and have fallback path that do not use=
 userptr to
> > >>>>>>> --
> > >>>>>>> 2.32.0.rc2
> > >>>>>>>
> > >
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
