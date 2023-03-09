Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B087E6B286D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 16:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A56010E84C;
	Thu,  9 Mar 2023 15:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2EF810E84F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 15:10:34 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 q11-20020a056830440b00b00693c1a62101so1298882otv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 07:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1678374634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q7CeKN4Wunqw4X3QcJ1aktQhOnYUrNkoQuNXegHmGzQ=;
 b=Nr0pTMqzJJwJefL9Nzy0BQB1oPcQs/IczJfN4AvCCGJZBBw9GqQiUDkDpoYI+VRMJJ
 g1PNdHaKrQBOq/MmmWZ/wIUHA2ecHNDIKnWwKEIT9SwZFwB/BYv23B0ALfPfd1jlCpZh
 woSRt1MrnFFdUeZlHyupaUalzTg54s8UjRS7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678374634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q7CeKN4Wunqw4X3QcJ1aktQhOnYUrNkoQuNXegHmGzQ=;
 b=WHybGK5Hcp2ncr+5dtzGMDCxwOq1a1rkvpgZnkNTpZvYrEnbsOtoFwUze8z8nQycEA
 D5Sy7M6gwpjUegfB+GdLAaHu1nTzVAoQnLuWy2jid1rr39Vdo9S9JIXvHvl94G9psCjE
 L7ZsI2M8sdlFkH2pV9050IGFbGKkNEJZm1iaatbJwt8eElB72BEaaBozFAtIwOCEeoLL
 byvpWr3OGsIsN9OLm8PPB45r+llOI7LprLcGAitrY+VgUgxqUU3GxzdaeqEh7wO49PuD
 DMFinCt7qCL1qlonykLrwqAIZKh5L5L047M5HCpwHxQUSQFF78cODpzA6FyrvyAPP4/T
 fAfg==
X-Gm-Message-State: AO0yUKVEtlLzzRrfmPBIe2AG6BISxn5yCsAelh5UVK159yyU8c5kZjNf
 kHwD3MIjZZ3km/yFpl/s3L8qXGF15IA9YxYuC7r0CGkYNNHDW3L6
X-Google-Smtp-Source: AK7set/Z4E3Os1oqTO/DquwpsiAODX8Fc2ZHo3s3nHWw+P6nAdRjMt4vRH4J+d1GlCiTVsKHLF7AvfhFoy4Ybvblv2o=
X-Received: by 2002:a05:6830:40b0:b0:694:3ac6:712 with SMTP id
 x48-20020a05683040b000b006943ac60712mr6993470ott.6.1678374633812; Thu, 09 Mar
 2023 07:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <Y+/o2a21Eym3ee/a@phenom.ffwll.local> <Y//Y8mKezn8oCejK@intel.com>
In-Reply-To: <Y//Y8mKezn8oCejK@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 9 Mar 2023 16:10:20 +0100
Message-ID: <CAKMK7uHgRQfisi02Y5T8DSjOrP5YqjFwv=9H16hfOhqu7JNWVw@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 00/20] Initial Xe driver submission
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Mar 2023 at 00:00, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Fri, Feb 17, 2023 at 09:51:37PM +0100, Daniel Vetter wrote:
> > Hi all,
> >
> > [I thought I've sent this out earlier this week, but alas got stuck, ki=
nda
> > bad timing now since I'm out next week but oh well]
> >
> > So xe is a quite substantial thing, and I think we need a clear plan ho=
w to land
> > this or it will take forever, and managers will panic. Also I'm not a b=
ig fan of
> > "Dave/me reviews everything", we defacto had that for amd's dc/dal and =
it was
> > not fun. The idea here is how to get everything reviewed without having=
 two
> > people end up somewhat arbitrary as deciders.
>
> Thank you so much for taking time to write it down. We need to get alignm=
ent
> on the critical topics to see how we can move this forward.

Sorry for the delay on my side, last week was carneval and this week
big team meeting.

> > I've compiled a bunch of topics on what I think the important areas are=
, first
> > code that should be consistent about new-style render drivers that are =
aimed for
> > vk/compute userspace as the primary feature driver:
> >
> > - figure out consensus solution for fw scheduler and drm/sched frontend=
 among
> >   interested driver parties (probably xe, amdgpu, nouveau, new panfrost=
)
>
> Yeap. We do need to figure this out. But just to ensure that we are in th=
e same
> page here. What I had in mind was that Matt would upstream the 5 or 6 drm=
_sched
> related patches that we have underneath Xe patches on drm-misc with addre=
ssing
> the community feedback, then we would merge Xe with the current schedule =
solution
> (or modifications based on the modifications of these mentioned patches) =
and
> then we would continue to work with the other drivers to improve the drm =
sched
> frontend while we are already in tree. Possible? or do you want to see
> fundamental changes before we can even consider to get in? Like the ones =
below?

The trouble with that is that then you'll have a lot more driver
changes and big renames in drivers after they landed. Which might be
too painful, and why I suggested the below minimal-most driver-api
wrapping to decouple that. My worry is that if you don't do that, then
the driver merging will be bogged down in endless discussions about
what the refactoring should look like exactly (the discussions here
and elsewhere kinda gave a preview), and it'll make driver merging
actually slower. Hence my suggestion to just decouple things enough so
that people agree to merge now and refactor later as the reasonable
thing.

Now if there would be consensus that this here is already perfect and
nothing more needed for fw scheduling, then I think just going ahead
with that would be perfectly fine, but I'm kinda not seeing that.

Given that there is so much discussion here I don't want to step in
with an arbitrary maintainer verdict, that's largely the approach
we've done with amd's dal and I don't think it was the best way
forward really.

> > - for the interface itself it might be good to have the drm_gpu_schedul=
er as the
> >   single per-hw-engine driver api object (but internally a new structur=
e), while
> >   renaming the current drm_gpu_scheduler to drm_gpu_sched_internal. Tha=
t way I
> >   think we can address the main critique of the current xe scheduler pl=
an
> >   - keep the drm_gpu_sched_internal : drm_sched_entity 1:1 relationship=
 for fw
> >     scheduler
> >   - keep the driver api relationship of drm_gpu_scheduler : drm_sched_e=
ntity
> >     1:n, the api functions simply iterate over a mutex protect list of =
internal
> >     schedulers. this should also help drivers with locking mistakes aro=
und
> >     setup/teardown and gpu reset.
> >   - drivers select with a flag or something between the current mode (w=
here the
> >     drm_gpu_sched_internal is attached to the drm_gpu_scheduler api obj=
ect) or
> >     the new fw scheduler mode (where drm_gpu_sched_internal is attached=
 to the
> >     drm_sched_entity)
> >   - overall still no fundamental changes (like the current patches) to =
drm/sched
> >     data structures and algorithms. But unlike the current patches we k=
eep the
> >     possibility open for eventual refactoring without having to again r=
efactor
> >     all the drivers. Even better, we can delay such refactoring until w=
e have a
> >     handful of real-word drivers test-driving this all so we know we ac=
tually do
> >     the right thing. This should allow us to address all the
> >     fairness/efficiency/whatever concerns that have been floating aroun=
d without
> >     having to fix them all up upfront, before we actually know what nee=
ds to be
> >     fixed.
>
> do you believe this has to be decided and moved towards one of this befor=
e we
> get merged?

I think either clear consensus by stakeholders that refactoring
afterwards is the right thing, or something like the above to decouple
fw scheduling drivers from drm/sched is I think needed. And my gut
feeling is that the 2nd option is a much faster and less risky path to
xe, but if you want to do the big dri-devel arguing championship, you
can do that too :-)

> > - the generic scheduler code should also including the handling of endl=
ess
> >   compute contexts, with the minimal scaffolding for preempt-ctx fences
> >   (probably on the drm_sched_entity) and making sure drm/sched can cope=
 with the
> >   lack of job completion fence. This is very minimal amounts of code, b=
ut it
> >   helps a lot for cross-driver review if this works the same (with the =
same
> >   locking and all that) for everyone. Ideally this gets extracted from =
amdkfd,
> >   but as long as it's going to be used by all drivers supporting
> >   endless/compute context going forward it's good enough.
>
> On this one I'm a bit clueless to be honest. I thought the biggest proble=
m with
> the long running context or even endless were due to the hangcheck prempt=
ion or
> migrations that would end in some pagefaults.
> But yeap, it looks that there are opens to get these kind of workloads pr=
operly
> supported. But with this in mind do you see any real blocker on Xe? or an=
y must-have
> thing?

Yeah hangcheck is the architectural issue, this here is just my
suggestion for how to solve it technically in code in a consistent way
across drivers. From a subsystem maintainer pov the important stuff is
really that drivers share key concepts as much as possible, and I
think this is one such key concept. E.g. for amd's dal we didn't ask
them to rewrite the entire thing to our taste, but to properly
integrate key drm display concepts and structs directly into their
driver so that when you want to look for all crtc related code across
all drivers you just have to chase drm_crtc, and not figure out what a
crtc is in each driver (e.g. in i915 display speak crtc =3D pipe).

Same here, just minimal data structure and scaffolding for
long-running context and preempt ctx fences would be really good I
think.

> > - I'm assuming this also means Matt Brost will include a patch to add h=
imself as
> >   drm/sched reviewer in MAINTAINERS, or at least something like that
>
> +1 on this idea!
> This enforces our engagement and commitment with the drm_sched imho.
>
> >
> > - adopt the gem_exec/vma helpers. again we probably want consensus here=
 among
> >   the same driver projects. I don't care whether these helpers specify =
the ioctl
> >   structs or not, but they absolutely need to enforce the overall locki=
ng scheme
> >   for all major structs and list (so vm and vma).
>
> On this front I thought we would need to align on a common drm_vm_bind ba=
sed on
> the common parts of xe vm_bind and nouveau one. And also some engagement =
that
> I thought it would be easier after we are integrated and part of the drm-=
next.
> Do we need to do this earlier? Could you please open it a bit more on wha=
t
> exactly you want to see before we can be considered to get merged or afte=
r?

Again, I don't really want to do the maintainer verdict here and just
dictate, I think much better if these discussions are done directly
among the involved people. I do generally think that the refactoring
should happen upfront for xe, simply due to past track record. Which
yes sucks a bit and is a special requirement, but I think a bit a
stricter barrier but a really clear one is much better for everyone
than some very, very handwaving "enough to make Dave&me happy" super
vague thing that will guarantee heated arguments like we've had plenty
with amd's dal.

> > - we also should have cross-driver consensus on async vm_bind support. =
I think
> >   everyone added in-syncobj support, the real fun is probably more in/o=
ut
> >   userspace memory fences (and personally I'm still not sure that's a g=
ood idea
> >   but ... *eh*). I think cross driver consensus on how this should work=
 (ideally
> >   with helper support so people don't get it wrong in all the possible =
ways)
> >   would be best.
>
> Should the consensus API come first? should this block the nouveau implem=
entation
> and move us all towards the drm_vm_bind? or can we sync in-tree?

Same as above.

Since async isn't a requirement (it's optional for both vk and I guess
also for compute since current compute still works on i915-gem, which
doesn't have this?) this shouldn't block merging the xe driver. So I
think it's not too horrendous to make this a blocker. Of course if the
vulkan folks disagree then maybe do some other merge order (and record
all that with appropriate amounts of acks).

> > - this also means some userptr integration and some consensus how userp=
tr should
> >   work for vm_bind across drivers. I don't think allowing drivers to re=
invent
> >   that wheel is a bright idea, there's just a bit too much to get wrong=
 here.
>
> ack. but kind of same question. is it a blocker to align before? or easie=
r to
> align in tree?

Still same as above, I think best is to make them all as clear
per-merge goals so that we avoid endless "is this now good enough"
discussions with all the frustration and arbitrary delays this would
bring. And yes again I realize this sucks a bit and is a bit special.
Kinda the same idea like we've tried doing with the
refactoring/feature-landing documents in Documenation/gpu/rfc.rst.

Actually maybe the entire xe merge plan should perhaps become
Documentation/gpu/rfc/xe.rst?

> > - for some of these the consensus might land on more/less shared code t=
han what
> >   I sketched out above, the important part really is that we have conse=
nsus on
> >   these. Kinda similar to how the atomic kms infrastructure move a _lot=
_ more of
> >   the code back into drivers, because they really just needed the flexi=
bility to
> >   program the hw correctly. Right now we definitely don't have enough s=
hared
> >   code, for sure with i915-gem, but we also need to make sure we're not
> >   overcorrecting too badly (a bit of overcorrecting generally doesn't h=
urt).
>
> +1 on this. We need to work more in the drm layers like display has done =
successfully!
>
> >
> > All the above will make sure that the driver overall is in concepts and=
 design
> > aligned with the overall community direction, but I think it'd still be=
 good if
> > someone outside of the intel gpu group reviews the driver code itself. =
Last time
> > we had a huge driver submission (amd's DC/DAL) this fell on Dave&me, bu=
t this
> > time around I think we have a perfect candidate with Oded:
> >
> > - Oded needs/wants to spend some time on ramping up on how drm render d=
rivers
> >   work anyway, and xe is probably the best example of a driver that's b=
oth
> >   supposed to be full-featured, but also doesn't contain an entire disp=
lay
> >   driver on the side.
> >
> > - Oded is in Habana, which is legally part of Intel. Bean counter budge=
t
> >   shuffling to make this happen should be possible.
> >
> > - Habana is still fairly distinct entity within Intel, so that is proba=
bly the
> >   best approach for some independent review, without making the xe team
> >   beholden to some non-Intel people.
>
> +1 on this entire idea here as well.
>
> >
> > The above should yield some pretty clear road towards landing xe, witho=
ut any
> > big review fights with Dave/me like we had with amd's DC/DAL, which too=
k a
> > rather long time to land unfortunately :-(
>
> As I wrote already, I really agree with you that we should work more with=
 the
> drm and more with the other drivers. But for the logistics of the work an=
d
> the rebase pains and to avoid a situation where we have a totally diverge=
nt
> driver, I believe the fastest way is to solve any blockers and big issues
> before, then merge, then work towards more collaboration on the next step=
.
>
> Specially when with Xe we are not planning to remove the force_probe
> flag for a while, what puts us in a "staging" situation.
> We could even make use of the CONFIG_STAGING if needed.

I general, I agree with this.

But also, I've acked a bunch of these plans for intel-gem (like the
i915 guc scheduler), and then we had to backtrack those because
everyone realize that "refactor in-tree" was actually impossible.

It's definitely a bit "burned too many times on this" reaction, but
I'd like to make sure we don't end up in that situation again with the
next big pile of intel-gem code.

> Thoughts?
> And most than that, any already know big blockers?
>
> >
> > These are just my thoughts, let the bikeshed commence!
>
> :)
>
> >
> > Ideally we put them all into a TODO like we've done for DC/DAL, once we=
 have
> > some consensus.
>
> I like the TODO list idea.
> And also we need to use more the RFC doc section as well, like
> i915-vmbind used.
>
> On the TODO part, where do you recommend to add in the doc?

See above, I think we have the right place with the rfc section already.

Cheers, Daniel

>
> Again, thank you so much,
> Rodrigo.
>
> >
> > Cheers, Daniel
> >
> > On Thu, Dec 22, 2022 at 02:21:07PM -0800, Matthew Brost wrote:
> > > Hello,
> > >
> > > This is a submission for Xe, a new driver for Intel GPUs that support=
s both
> > > integrated and discrete platforms starting with Tiger Lake (first pla=
tform with
> > > Intel Xe Architecture). The intention of this new driver is to have a=
 fresh base
> > > to work from that is unencumbered by older platforms, whilst also tak=
ing the
> > > opportunity to rearchitect our driver to increase sharing across the =
drm
> > > subsystem, both leveraging and allowing us to contribute more towards=
 other
> > > shared components like TTM and drm/scheduler. The memory model is bas=
ed on VM
> > > bind which is similar to the i915 implementation. Likewise the execbu=
f
> > > implementation for Xe is very similar to execbuf3 in the i915 [1].
> > >
> > > The code is at a stage where it is already functional and has experim=
ental
> > > support for multiple platforms starting from Tiger Lake, with initial=
 support
> > > implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers)=
, as well
> > > as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and =
NEO
> > > implementation will be released publicly early next year. We also hav=
e a suite
> > > of IGTs for XE that will appear on the IGT list shortly.
> > >
> > > It has been built with the assumption of supporting multiple architec=
tures from
> > > the get-go, right now with tests running both on X86 and ARM hosts. A=
nd we
> > > intend to continue working on it and improving on it as part of the k=
ernel
> > > community upstream.
> > >
> > > The new Xe driver leverages a lot from i915 and work on i915 continue=
s as we
> > > ready Xe for production throughout 2023.
> > >
> > > As for display, the intent is to share the display code with the i915=
 driver so
> > > that there is maximum reuse there. Currently this is being done by co=
mpiling the
> > > display code twice, but alternatives to that are under consideration =
and we want
> > > to have more discussion on what the best final solution will look lik=
e over the
> > > next few months. Right now, work is ongoing in refactoring the displa=
y codebase
> > > to remove as much as possible any unnecessary dependencies on i915 sp=
ecific data
> > > structures there..
> > >
> > > We currently have 2 submission backends, execlists and GuC. The execl=
ist is
> > > meant mostly for testing and is not fully functional while GuC backen=
d is fully
> > > functional. As with the i915 and GuC submission, in Xe the GuC firmwa=
re is
> > > required and should be placed in /lib/firmware/xe.
> > >
> > > The GuC firmware can be found in the below location:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmwa=
re.git/tree/i915
> > >
> > > The easiest way to setup firmware is:
> > > cp -r /lib/firmware/i915 /lib/firmware/xe
> > >
> > > The code has been organized such that we have all patches that touch =
areas
> > > outside of drm/xe first for review, and then the actual new driver in=
 a separate
> > > commit. The code which is outside of drm/xe is included in this RFC w=
hile
> > > drm/xe is not due to the size of the commit. The drm/xe is code is av=
ailable in
> > > a public repo listed below.
> > >
> > > Xe driver commit:
> > > https://cgit.freedesktop.org/drm/drm-xe/commit/?h=3Ddrm-xe-next&id=3D=
9cb016ebbb6a275f57b1cb512b95d5a842391ad7
> > >
> > > Xe kernel repo:
> > > https://cgit.freedesktop.org/drm/drm-xe/
> > >
> > > There's a lot of work still to happen on Xe but we're very excited ab=
out it and
> > > wanted to share it early and welcome feedback and discussion.
> > >
> > > Cheers,
> > > Matthew Brost
> > >
> > > [1] https://patchwork.freedesktop.org/series/105879/
> > > [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20418
> > >
> > > Maarten Lankhorst (12):
> > >   drm/amd: Convert amdgpu to use suballocation helper.
> > >   drm/radeon: Use the drm suballocation manager implementation.
> > >   drm/i915: Remove gem and overlay frontbuffer tracking
> > >   drm/i915/display: Neuter frontbuffer tracking harder
> > >   drm/i915/display: Add more macros to remove all direct calls to unc=
ore
> > >   drm/i915/display: Remove all uncore mmio accesses in favor of intel=
_de
> > >   drm/i915: Rename find_section to find_bdb_section
> > >   drm/i915/regs: Set DISPLAY_MMIO_BASE to 0 for xe
> > >   drm/i915/display: Fix a use-after-free when intel_edp_init_connecto=
r
> > >     fails
> > >   drm/i915/display: Remaining changes to make xe compile
> > >   sound/hda: Allow XE as i915 replacement for sound
> > >   mei/hdcp: Also enable for XE
> > >
> > > Matthew Brost (5):
> > >   drm/sched: Convert drm scheduler to use a work queue rather than
> > >     kthread
> > >   drm/sched: Add generic scheduler message interface
> > >   drm/sched: Start run wq before TDR in drm_sched_start
> > >   drm/sched: Submit job before starting TDR
> > >   drm/sched: Add helper to set TDR timeout
> > >
> > > Thomas Hellstr=C3=B6m (3):
> > >   drm/suballoc: Introduce a generic suballocation manager
> > >   drm: Add a gpu page-table walker helper
> > >   drm/ttm: Don't print error message if eviction was interrupted
> > >
> > >  drivers/gpu/drm/Kconfig                       |   5 +
> > >  drivers/gpu/drm/Makefile                      |   4 +
> > >  drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  14 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  12 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |   5 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  23 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   3 +-
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c        | 320 +---------------=
--
> > >  drivers/gpu/drm/drm_pt_walk.c                 | 159 +++++++++
> > >  drivers/gpu/drm/drm_suballoc.c                | 301 ++++++++++++++++
> > >  drivers/gpu/drm/i915/Makefile                 |   2 +-
> > >  drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
> > >  drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 +
> > >  drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +
> > >  .../gpu/drm/i915/display/intel_atomic_plane.c |  25 +-
> > >  .../gpu/drm/i915/display/intel_backlight.c    |   2 +-
> > >  drivers/gpu/drm/i915/display/intel_bios.c     |  71 ++--
> > >  drivers/gpu/drm/i915/display/intel_bw.c       |  36 +-
> > >  drivers/gpu/drm/i915/display/intel_cdclk.c    |  68 ++--
> > >  drivers/gpu/drm/i915/display/intel_color.c    |   1 +
> > >  drivers/gpu/drm/i915/display/intel_crtc.c     |  14 +-
> > >  drivers/gpu/drm/i915/display/intel_cursor.c   |  14 +-
> > >  drivers/gpu/drm/i915/display/intel_de.h       |  38 +++
> > >  drivers/gpu/drm/i915/display/intel_display.c  | 155 +++++++--
> > >  drivers/gpu/drm/i915/display/intel_display.h  |   9 +-
> > >  .../gpu/drm/i915/display/intel_display_core.h |   5 +-
> > >  .../drm/i915/display/intel_display_debugfs.c  |   8 +
> > >  .../drm/i915/display/intel_display_power.c    |  40 ++-
> > >  .../drm/i915/display/intel_display_power.h    |   6 +
> > >  .../i915/display/intel_display_power_map.c    |   7 +
> > >  .../i915/display/intel_display_power_well.c   |  24 +-
> > >  .../drm/i915/display/intel_display_reg_defs.h |   4 +
> > >  .../drm/i915/display/intel_display_trace.h    |   6 +
> > >  .../drm/i915/display/intel_display_types.h    |  32 +-
> > >  drivers/gpu/drm/i915/display/intel_dmc.c      |  17 +-
> > >  drivers/gpu/drm/i915/display/intel_dp.c       |  11 +-
> > >  drivers/gpu/drm/i915/display/intel_dp_aux.c   |   6 +
> > >  drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
> > >  drivers/gpu/drm/i915/display/intel_dpio_phy.h |  15 +
> > >  drivers/gpu/drm/i915/display/intel_dpll.c     |   8 +-
> > >  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 +
> > >  drivers/gpu/drm/i915/display/intel_drrs.c     |   1 +
> > >  drivers/gpu/drm/i915/display/intel_dsb.c      | 124 +++++--
> > >  drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  26 +-
> > >  drivers/gpu/drm/i915/display/intel_fb.c       | 108 ++++--
> > >  drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 -
> > >  drivers/gpu/drm/i915/display/intel_fbc.c      |  49 ++-
> > >  drivers/gpu/drm/i915/display/intel_fbdev.c    | 108 +++++-
> > >  .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 +-----
> > >  .../gpu/drm/i915/display/intel_frontbuffer.h  |  67 +---
> > >  drivers/gpu/drm/i915/display/intel_gmbus.c    |   2 +-
> > >  drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
> > >  drivers/gpu/drm/i915/display/intel_hdmi.c     |   1 -
> > >  .../gpu/drm/i915/display/intel_lpe_audio.h    |   8 +
> > >  .../drm/i915/display/intel_modeset_setup.c    |  11 +-
> > >  drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
> > >  drivers/gpu/drm/i915/display/intel_overlay.c  |  14 -
> > >  .../gpu/drm/i915/display/intel_pch_display.h  |  16 +
> > >  .../gpu/drm/i915/display/intel_pch_refclk.h   |   8 +
> > >  drivers/gpu/drm/i915/display/intel_pipe_crc.c |   1 +
> > >  .../drm/i915/display/intel_plane_initial.c    |   3 +-
> > >  drivers/gpu/drm/i915/display/intel_psr.c      |   1 +
> > >  drivers/gpu/drm/i915/display/intel_sprite.c   |  21 ++
> > >  drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
> > >  drivers/gpu/drm/i915/display/intel_vga.c      |   5 +
> > >  drivers/gpu/drm/i915/display/skl_scaler.c     |   2 +
> > >  .../drm/i915/display/skl_universal_plane.c    |  52 ++-
> > >  drivers/gpu/drm/i915/display/skl_watermark.c  |  25 +-
> > >  drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 -
> > >  drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 -
> > >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 -
> > >  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 --
> > >  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 --
> > >  drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 -
> > >  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +-
> > >  drivers/gpu/drm/i915/i915_driver.c            |   1 +
> > >  drivers/gpu/drm/i915/i915_gem.c               |   8 -
> > >  drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 -
> > >  drivers/gpu/drm/i915/i915_reg_defs.h          |   8 +
> > >  drivers/gpu/drm/i915/i915_vma.c               |  12 -
> > >  drivers/gpu/drm/radeon/radeon.h               |  55 +--
> > >  drivers/gpu/drm/radeon/radeon_ib.c            |  12 +-
> > >  drivers/gpu/drm/radeon/radeon_object.h        |  25 +-
> > >  drivers/gpu/drm/radeon/radeon_sa.c            | 314 ++--------------=
-
> > >  drivers/gpu/drm/radeon/radeon_semaphore.c     |   6 +-
> > >  drivers/gpu/drm/scheduler/sched_main.c        | 182 +++++++---
> > >  drivers/gpu/drm/ttm/ttm_bo.c                  |   3 +-
> > >  drivers/misc/mei/hdcp/Kconfig                 |   2 +-
> > >  drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
> > >  include/drm/drm_pt_walk.h                     | 161 +++++++++
> > >  include/drm/drm_suballoc.h                    | 112 ++++++
> > >  include/drm/gpu_scheduler.h                   |  41 ++-
> > >  sound/hda/hdac_i915.c                         |  17 +-
> > >  sound/pci/hda/hda_intel.c                     |  56 +--
> > >  sound/soc/intel/avs/core.c                    |  13 +-
> > >  sound/soc/sof/intel/hda.c                     |   7 +-
> > >  98 files changed, 2076 insertions(+), 1325 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/drm_pt_walk.c
> > >  create mode 100644 drivers/gpu/drm/drm_suballoc.c
> > >  create mode 100644 include/drm/drm_pt_walk.h
> > >  create mode 100644 include/drm/drm_suballoc.h
> > >
> > > --
> > > 2.37.3
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
