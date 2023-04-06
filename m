Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BBE6D9D76
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 18:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3270210EC51;
	Thu,  6 Apr 2023 16:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CC9A10EC51
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 16:23:47 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id bi31so29427173oib.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680798226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pB1qJ3LZ1A55OdQdO8S1x9lniD0brm9NJ+eVpn/YnKQ=;
 b=Yo5UGEkIEpu4LqTGEvbiXo4pGNAS19BY4RYhrzyOSJucemY/CJMi04vavFdlJIMU0d
 wYCz91gCSov1Vv7jIs4NtzC7nfHyV2SmU2nHRlJXjMoSNnUWn1b1YDCrMkTSkAwTq54z
 w90n4sEfHM1ZX4dqNSbSk5L7N/Y4wrtwo44Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680798226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pB1qJ3LZ1A55OdQdO8S1x9lniD0brm9NJ+eVpn/YnKQ=;
 b=xZMshPR1PgE5G2vXpooaa9FG0v4hNQHvfooavuYW/vZudvESixlmTVVUbhaKYgrUiD
 Pcs0V2oxoqZDhXOCW+I1eCO56aLrlks59ZbOmYBjk+WDqQ2k5PK6DAQBXHjSumGpDaGh
 6rovqxZAQAciQknYKXfK8kDbZ+JzVaSGU61JL4bnYRwj57mggL0Z+k6+YBeshhhgsa3M
 jYcr+HYqNkYVGzXjucDO3AOnqXxdHlnUz57cGTBJbcGDC34RHvDntzejZmOIBt0EGYOy
 Jq18J9ICs320svlSDQHO8OPN2hivDQBcnBW8CfCZoc/Lfw/Xa6/lENdHS8+5Kt8vknAH
 zvIA==
X-Gm-Message-State: AAQBX9d2qVQfqfoGkmb75TDLKf8SI96GbSm1EtfujQOgP8T05Wl2FGyB
 ZTxd7AUF+0BWjia6IA9qeNiRw6JTo4WezTXiVGyrSg==
X-Google-Smtp-Source: AKy350b45/Sn4kAyudyAUXbsRPEhUPtRvAZSDnWC4hm/0+AEz+ofhqNq01ITegGggYqcu2JjZf15T/H5CR7MkiBSu/Q=
X-Received: by 2002:a05:6808:280a:b0:389:2b9b:fe5f with SMTP id
 et10-20020a056808280a00b003892b9bfe5fmr3647337oib.8.1680798226336; Thu, 06
 Apr 2023 09:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
 <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
 <31f03135-40e4-a6ad-37e0-3b434a37922d@amd.com>
 <9ac69b11802331f9e024ab837b85214c4243e3fd.camel@pengutronix.de>
 <cdc29af8-8c04-cf46-1872-3feab954bc55@amd.com>
 <ZC7sZfn9XJpqN7ni@phenom.ffwll.local>
In-Reply-To: <ZC7sZfn9XJpqN7ni@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 6 Apr 2023 18:23:35 +0200
Message-ID: <CAKMK7uE=m3sSTQrLCeDg0vG8viODOecUsYDK1oC++f5pQi0e8Q@mail.gmail.com>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
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
Cc: Matthew Brost <matthew.brost@intel.com>, andrey.grodzovsky@amd.com,
 tvrtko.ursulin@linux.intel.com, lina@asahilina.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 yuq825@gmail.com, Bagas Sanjaya <bagasdotme@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 Apr 2023 at 17:59, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Apr 06, 2023 at 05:33:18PM +0200, Christian K=C3=B6nig wrote:
> > Am 06.04.23 um 17:24 schrieb Lucas Stach:
> > > Am Donnerstag, dem 06.04.2023 um 16:21 +0200 schrieb Christian K=C3=
=B6nig:
> > > > Am 06.04.23 um 12:45 schrieb Lucas Stach:
> > > > > Am Donnerstag, dem 06.04.2023 um 10:27 +0200 schrieb Daniel Vette=
r:
> > > > > > On Thu, 6 Apr 2023 at 10:22, Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:
> > > > > > > Am 05.04.23 um 18:09 schrieb Luben Tuikov:
> > > > > > > > On 2023-04-05 10:05, Danilo Krummrich wrote:
> > > > > > > > > On 4/4/23 06:31, Luben Tuikov wrote:
> > > > > > > > > > On 2023-03-28 04:54, Lucas Stach wrote:
> > > > > > > > > > > Hi Danilo,
> > > > > > > > > > >
> > > > > > > > > > > Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Da=
nilo Krummrich:
> > > > > > > > > > > > Hi all,
> > > > > > > > > > > >
> > > > > > > > > > > > Commit df622729ddbf ("drm/scheduler: track GPU acti=
ve time per entity")
> > > > > > > > > > > > tries to track the accumulated time that a job was =
active on the GPU
> > > > > > > > > > > > writing it to the entity through which the job was =
deployed to the
> > > > > > > > > > > > scheduler originally. This is done within drm_sched=
_get_cleanup_job()
> > > > > > > > > > > > which fetches a job from the schedulers pending_lis=
t.
> > > > > > > > > > > >
> > > > > > > > > > > > Doing this can result in a race condition where the=
 entity is already
> > > > > > > > > > > > freed, but the entity's newly added elapsed_ns fiel=
d is still accessed
> > > > > > > > > > > > once the job is fetched from the pending_list.
> > > > > > > > > > > >
> > > > > > > > > > > > After drm_sched_entity_destroy() being called it sh=
ould be safe to free
> > > > > > > > > > > > the structure that embeds the entity. However, a jo=
b originally handed
> > > > > > > > > > > > over to the scheduler by this entity might still re=
side in the
> > > > > > > > > > > > schedulers pending_list for cleanup after drm_sched=
_entity_destroy()
> > > > > > > > > > > > already being called and the entity being freed. He=
nce, we can run into
> > > > > > > > > > > > a UAF.
> > > > > > > > > > > >
> > > > > > > > > > > Sorry about that, I clearly didn't properly consider =
this case.
> > > > > > > > > > >
> > > > > > > > > > > > In my case it happened that a job, as explained abo=
ve, was just picked
> > > > > > > > > > > > from the schedulers pending_list after the entity w=
as freed due to the
> > > > > > > > > > > > client application exiting. Meanwhile this freed up=
 memory was already
> > > > > > > > > > > > allocated for a subsequent client applications job =
structure again.
> > > > > > > > > > > > Hence, the new jobs memory got corrupted. Luckily, =
I was able to
> > > > > > > > > > > > reproduce the same corruption over and over again b=
y just using
> > > > > > > > > > > > deqp-runner to run a specific set of VK test cases =
in parallel.
> > > > > > > > > > > >
> > > > > > > > > > > > Fixing this issue doesn't seem to be very straightf=
orward though (unless
> > > > > > > > > > > > I miss something), which is why I'm writing this ma=
il instead of sending
> > > > > > > > > > > > a fix directly.
> > > > > > > > > > > >
> > > > > > > > > > > > Spontaneously, I see three options to fix it:
> > > > > > > > > > > >
> > > > > > > > > > > > 1. Rather than embedding the entity into driver spe=
cific structures
> > > > > > > > > > > > (e.g. tied to file_priv) we could allocate the enti=
ty separately and
> > > > > > > > > > > > reference count it, such that it's only freed up on=
ce all jobs that were
> > > > > > > > > > > > deployed through this entity are fetched from the s=
chedulers pending list.
> > > > > > > > > > > >
> > > > > > > > > > > My vote is on this or something in similar vain for t=
he long term. I
> > > > > > > > > > > have some hope to be able to add a GPU scheduling alg=
orithm with a bit
> > > > > > > > > > > more fairness than the current one sometime in the fu=
ture, which
> > > > > > > > > > > requires execution time tracking on the entities.
> > > > > > > > > > Danilo,
> > > > > > > > > >
> > > > > > > > > > Using kref is preferable, i.e. option 1 above.
> > > > > > > > > I think the only real motivation for doing that would be =
for generically
> > > > > > > > > tracking job statistics within the entity a job was deplo=
yed through. If
> > > > > > > > > we all agree on tracking job statistics this way I am hap=
py to prepare a
> > > > > > > > > patch for this option and drop this one:
> > > > > > > > > https://lore.kernel.org/all/20230331000622.4156-1-dakr@re=
dhat.com/T/#u
> > > > > > > > Hmm, I never thought about "job statistics" when I preferre=
d using kref above.
> > > > > > > > The reason kref is attractive is because one doesn't need t=
o worry about
> > > > > > > > it--when the last user drops the kref, the release is calle=
d to do
> > > > > > > > housekeeping. If this never happens, we know that we have a=
 bug to debug.
> > > > > > > Yeah, reference counting unfortunately have some traps as wel=
l. For
> > > > > > > example rarely dropping the last reference from interrupt con=
text or
> > > > > > > with some unexpected locks help when the cleanup function doe=
sn't expect
> > > > > > > that is a good recipe for problems as well.
> > > > > > >
> > > > > Fully agreed.
> > > > >
> > > > > > > > Regarding the patch above--I did look around the code, and =
it seems safe,
> > > > > > > > as per your analysis, I didn't see any reference to entity =
after job submission,
> > > > > > > > but I'll comment on that thread as well for the record.
> > > > > > > Reference counting the entities was suggested before. The int=
entionally
> > > > > > > avoided that so far because the entity might be the tip of th=
e iceberg
> > > > > > > of stuff you need to keep around.
> > > > > > >
> > > > > > > For example for command submission you also need the VM and w=
hen you
> > > > > > > keep the VM alive you also need to keep the file private aliv=
e....
> > > > > > Yeah refcounting looks often like the easy way out to avoid
> > > > > > use-after-free issue, until you realize you've just made lifeti=
mes
> > > > > > unbounded and have some enourmous leaks: entity keeps vm alive,=
 vm
> > > > > > keeps all the bo alives, somehow every crash wastes more memory
> > > > > > because vk_device_lost means userspace allocates new stuff for
> > > > > > everything.
> > > > > >
> > > > > > If possible a lifetime design where lifetimes have hard bounds =
and you
> > > > > > just borrow a reference under a lock (or some other ownership r=
ule) is
> > > > > > generally much more solid. But also much harder to design corre=
ctly
> > > > > > :-/
> > > > > >
> > > > > The use we are discussing here is to keep the entity alive as lon=
g as
> > > > > jobs from that entity are still active on the HW. While there are=
 no
> > > > > hard bounds on when a job will get inactive, at least it's not
> > > > > unbounded. On a crash/fault the job will be removed from the hard=
ware
> > > > > pretty soon.
> > > > >
> > > > > Well behaved jobs after a application shutdown might take a littl=
e
> > > > > longer, but I don't really see the new problem with keeping the e=
ntity
> > > > > alive? As long as a job is active on the hardware, we can't throw=
 out
> > > > > the VM or BOs, no difference whether the entity is kept alive or =
not.
> > > > Exactly that's the problem. VM & BOs are dropped as soon as the pro=
cess
> > > > is destroyed, we *don't* wait for the hw to finish before doing so.
> > > >
> > > > Just the backing store managed by all the house keeping objects isn=
't
> > > > freed until the hw is idle preventing a crash or accessing freed me=
mory.
> > > >
> > > > This behavior is rather important for the OOM killer since we need =
to be
> > > > able to tear down the process as fast as possible in that case.
> > > >
> > > Are you talking about the dropping of pending jobs in
> > > drm_sched_entity_kill? I'm certainly not trying to change that in any
> > > way. Those aren't put onto the hardware yet, so we can always safely
> > > drop them and do so as fast as possible.
> > >
> > > What I'm concerned about are the jobs that are already scheduled on t=
he
> > > HW. At least with Vivante hardware there is no race free way to get r=
id
> > > of jobs once they are put on the ring. So whatever the scheduler or D=
RM
> > > core is doing, we have to hold on to the BOs and GPU memory managemen=
t
> > > structures to keep the hardware from operating on freed memory.
> > >
> > > That's already a lot of memory, so I don't really see the issue with
> > > keeping the entity around in a quiescent state until all the currentl=
y
> > > queued jobs have left the HW.
> > >
> > > > Changing that is possible, but that's quite a huge change I'm not r=
eally
> > > > willing to do just for tracking the time spend.
> > > >
> > > Yea, it's a big change and whether it's a good idea really depends on
> > > what we a gaining from it. You seem to see quite low value in "just
> > > tracking the time spent" and that might be true, but it also forces a=
ll
> > > drivers that want to implement fdinfo to roll their own time tracking=
.
> > > I would rather see more of this moved to the scheduler and thus share=
d
> > > between drivers.
> >
> > That's generally a good idea, but if that means that we need to restruc=
ture
> > the whole entity handling then I would object. That's simply not worth =
it
> > when we can implement it differently.
> >
> > What we could do is to keep the submitted fences around in the entity.
> > Similar to the tracking amdgpu does, see struct amdgpu_ctx_entity.
> >
> > This way the entity doesn't needs to stay around after it delivered the=
 job
> > to the hw.
>
> I've done a _very_ cursory look, but from that the design seems to be tha=
t
> we only keep something very small around to avoid oopsing (just
> drm_sched_entity) and the overall gpu ctx goes away synchronously (more o=
r
> less) when userspace destroys it.
>
> And then the actual fdinfo reporting or any reporting is a pure pull mode=
l
> where you come from drm_file -> gpu ctx -> amdgpu_ctx_entity and have
> borrowed references by holding enough locks.
>
> The push model, where the scheduler job actively pushes the stats all the
> way to the userspace/uapi ctx object is imo impossible to get right.
> i915-gem tried a few times, and solutions start with sprinkling rcu
> everywhere and only get worse. Imo absolute no-go.
>
> If I understand this right then yes I think extracting the
> amgpu_ctx_entity split into a bit of helper. Might want to extract the
> context xarray and lookup too and put it into drm_file, including the
> amdgpu_ctx_mgr->lock and iterating over stats for fdinfo maybe too to mak=
e
> this really worth it.
>
> Of all the failed attempts I've seen for exposing ctx stats this (amdgpu
> push model) is imo the only solid one.

amdgpu _pull_ model. Yay for me introducing some concepts and then
mixing them up in the same email :-/

>
> Cheers, Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
