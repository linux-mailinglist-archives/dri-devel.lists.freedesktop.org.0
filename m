Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DC6DE33A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 19:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4717A10E5F5;
	Tue, 11 Apr 2023 17:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C0710E5F5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 17:54:56 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1842df7cb53so10751018fac.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 10:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681235696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dEmhq6StNBANIzyvzC5EtsmO79k4eP1w7agQCFvyQ6I=;
 b=ZbeWSwGnpqtXii2alIsHudZn7NgE2rLbD4EIPGKhG23rUanuICQ0uk0RGsvMqA/p+W
 I+3N1Zg218rXegeLmbBc2vyA350SjbVbeuKh8RAcubDR2fCmVmp9GJKLGggo2tXdM9na
 FcJbbkjmct4kjaGzLfblfJqV3KOfyQcEOXCgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681235696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dEmhq6StNBANIzyvzC5EtsmO79k4eP1w7agQCFvyQ6I=;
 b=trCwnIQMgy+Xq2PZSzvdV+KfStco2d29FjL9RQzKgoN2FhGkShiS5IYo4FlH8jyUff
 ynpWqvr94jrzkrcDAL+3y5scPdRnB7Hq2LauuiXmSf4UESzRSX40h8E0P+w+QGL90glG
 gp1oKWlEpoxsAx72AT6CroE3UOLWsf/RziUyIWJWtGiBv/5SW7CGeM/kYSXCSp8Py2GD
 b0y9LUfI00fxJ0KtfZ4X4lahxC1H6VHdtWhLfuZ6c46ACRHBQLAk7Fz077+BKDiHQlCq
 1zopErrQMuUdzxDE2/IC5HogQD1w/cBJzO28t4tYEaNK39vd0OTah63RFqMjSNQ76uTd
 PIpg==
X-Gm-Message-State: AAQBX9dCA17n5kfHrxvfNyRBJnbk80PqaKUl3yGhm7yJCQW3GlgyEe0g
 ANfC+BriDkTHImUCbea0L44A3F77C9k/v8suAGH2OA==
X-Google-Smtp-Source: AKy350a2dyr6Z51YMtW5ze/Xz4s/YMtjvwSXRMtJ/rdFcf6usPGlsAVXim4qq92VVm85nfI/25tvTd+ApkaX9G6uTqo=
X-Received: by 2002:a05:6870:fba1:b0:184:5cd2:9f9c with SMTP id
 kv33-20020a056870fba100b001845cd29f9cmr2419157oab.8.1681235695897; Tue, 11
 Apr 2023 10:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230405195205.1674844-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230405195205.1674844-1-rodrigo.vivi@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 11 Apr 2023 19:54:44 +0200
Message-ID: <CAKMK7uGSByfvxHnY3omh7S_XV2RShnG9nBan4374Kv90bVN5sQ@mail.gmail.com>
Subject: Re: [PATCH] drm/doc/rfc: Introduce the merge plan for the Xe driver.
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Francois Dugast <francois.dugast@intel.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Luis Strano <luis.strano@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 at 21:52, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> Let=E2=80=99s establish a merge plan for Xe, by writing down clear pre-me=
rge goals, in
> order to avoid unnecessary delays.
>
> This initial document starts with a TODO list containing items with clear=
 and
> measurable key results. Xe=E2=80=99s initial pull request should only be =
sent to
> dri-devel after all the items are clearly resolved.
>
> Since many of them involve some level of a community consensus, in many c=
ases,
> the consensus will be reached in follow-up patches to this document with =
more
> details of the API or helpers that will be developed or modified.
>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Luis Strano <luis.strano@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  Documentation/gpu/rfc/index.rst |   4 +
>  Documentation/gpu/rfc/xe.rst    | 216 ++++++++++++++++++++++++++++++++
>  2 files changed, 220 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/xe.rst
>
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/inde=
x.rst
> index 476719771eef..e4f7b005138d 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -31,3 +31,7 @@ host such documentation:
>  .. toctree::
>
>      i915_vm_bind.rst
> +
> +.. toctree::
> +
> +   xe.rst
> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> new file mode 100644
> index 000000000000..1e3e7e9c67c3
> --- /dev/null
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -0,0 +1,216 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +Xe =E2=80=93 Merge Acceptance Plan
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +Xe is a new driver for Intel GPUs that supports both integrated and
> +discrete platforms starting with Tiger Lake (first Intel Xe Architecture=
).
> +
> +This document aims to establish a merge plan for the Xe, by writing down=
 clear
> +pre-merge goals, in order to avoid unnecessary delays.
> +
> +Xe =E2=80=93 Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The main motivation of Xe is to have a fresh base to work from that is
> +unencumbered by older platforms, whilst also taking the opportunity to
> +rearchitect our driver to increase sharing across the drm subsystem, bot=
h
> +leveraging and allowing us to contribute more towards other shared compo=
nents
> +like TTM and drm/scheduler.
> +
> +This is also an opportunity to start from the beginning with a clean uAP=
I that is
> +extensible by design and already aligned with the modern userspace needs=
. For
> +this reason, the memory model is solely based on GPU Virtual Address spa=
ce
> +bind/unbind (=E2=80=98VM_BIND=E2=80=99) of GEM buffer objects (BOs) and =
execution only supporting
> +explicit synchronization. With persistent mapping across the execution, =
the
> +userspace does not need to provide a list of all required mappings durin=
g each
> +submission.
> +
> +The new driver leverages a lot from i915. As for display, the intent is =
to share
> +the display code with the i915 driver so that there is maximum reuse the=
re.
> +
> +As for the power management area, the goal is to have a much-simplified =
support
> +for the system suspend states (S-states), PCI device suspend states (D-s=
tates),
> +GPU/Render suspend states (R-states) and frequency management. It should=
 leverage
> +as much as possible all the existent PCI-subsystem infrastructure (pm an=
d
> +runtime_pm) and underlying firmware components such PCODE and GuC for th=
e power
> +states and frequency decisions.
> +
> +Repository:
> +
> +https://gitlab.freedesktop.org/drm/xe/kernel (branch drm-xe-next)
> +
> +Xe =E2=80=93 Platforms
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Currently, Xe is already functional and has experimental support for mul=
tiple
> +platforms starting from Tiger Lake, with initial support in userspace im=
plemented
> +in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well as in=
 NEO
> +(for OpenCL and Level0).
> +
> +During a transition period, platforms will be supported by both Xe and i=
915.
> +However, the force_probe mechanism existent in both drivers will allow o=
nly one
> +official and by-default probe at a given time.
> +
> +For instance, in order to probe a DG2 which PCI ID is 0x5690 by Xe inste=
ad of
> +i915, the following set of parameters need to be used:
> +
> +```
> +i915.force_probe=3D!5690 xe.force_probe=3D5690
> +```
> +
> +In both drivers, the =E2=80=98.require_force_probe=E2=80=99 protection f=
orces the user to use the
> +force_probe parameter while the driver is under development. This protec=
tion is
> +only removed when the support for the platform and the uAPI are stable. =
Stability
> +which needs to be demonstrated by CI results.
> +
> +In order to avoid user space regressions, i915 will continue to support =
all the
> +current platforms that are already out of this protection. Xe support wi=
ll be
> +forever experimental and dependent on the usage of force_probe for these
> +platforms.
> +
> +When the time comes for Xe, the protection will be lifted on Xe and kept=
 in i915.
> +
> +Xe driver will be protected with both STAGING Kconfig and force_probe. C=
hanges in
> +the uAPI are expected while the driver is behind these protections. STAG=
ING will
> +be removed when the driver uAPI gets to a mature state where we can guar=
antee the
> +=E2=80=98no regression=E2=80=99 rule. Then force_probe will be lifted on=
ly for future platforms
> +that will be productized with Xe driver, but not with i915.
> +
> +Xe =E2=80=93 Pre-Merge Goals
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Drm_scheduler
> +-------------
> +Xe primarily uses Firmware based scheduling (GuC FW). However, it will u=
se
> +drm_scheduler as the scheduler =E2=80=98frontend=E2=80=99 for userspace =
submission in order to
> +resolve syncobj and dma-buf implicit sync dependencies. However, drm_sch=
eduler is
> +not yet prepared to handle the 1-to-1 relationship between drm_gpu_sched=
uler and
> +drm_sched_entity.
> +
> +Deeper changes to drm_scheduler should *not* be required to get Xe accep=
ted, but
> +some consensus needs to be reached between Xe and other community driver=
s that
> +could also benefit from this work, for coupling FW based/assisted submis=
sion such
> +as the ARM=E2=80=99s new Mali GPU driver, and others.
> +
> +As a key measurable result, the patch series introducing Xe itself shall=
 not
> +depend on any other patch touching drm_scheduler itself that was not yet=
 merged
> +through drm-misc. This, by itself, already includes the reach of an agre=
ement for
> +uniform 1 to 1 relationship implementation / usage across drivers.
> +
> +GPU VA
> +------
> +Two main goals of Xe are meeting together here:
> +
> +1) Have an uAPI that aligns with modern UMD needs.
> +
> +2) Early upstream engagement.
> +
> +RedHat engineers working on Nouveau proposed a new DRM feature to handle=
 keeping
> +track of GPU virtual address mappings. This is still not merged upstream=
, but
> +this aligns very well with our goals and with our VM_BIND. The engagemen=
t with
> +upstream and the port of Xe towards GPUVA is already ongoing.
> +
> +As a key measurable result, Xe needs to be aligned with the GPU VA and w=
orking in
> +our tree. Missing Nouveau patches should *not* block Xe and any needed G=
PUVA
> +related patch should be independent and present on dri-devel or acked by
> +maintainers to go along with the first Xe pull request towards drm-next.
> +
> +DRM_VM_BIND
> +-----------
> +Nouveau, and Xe are all implementing =E2=80=98VM_BIND=E2=80=99 and new =
=E2=80=98Exec=E2=80=99 uAPIs in order to
> +fulfill the needs of the modern uAPI. Xe merge should *not* be blocked o=
n the
> +development of a common new drm_infrastructure. However, the Xe team nee=
ds to
> +engage with the community to explore the options of a common API.
> +
> +As a key measurable result, the DRM_VM_BIND needs to be documented in th=
is file
> +below, or this entire block deleted if the consensus is for independent =
drivers
> +vm_bind ioctls.
> +
> +Although having a common DRM level IOCTL for VM_BIND is not a requiremen=
t to get
> +Xe merged, it is mandatory to enforce the overall locking scheme for all=
 major
> +structs and list (so vm and vma). So, a consensus is needed, and possibl=
y some
> +common helpers. If helpers are needed, they should be also documented in=
 this
> +document.
> +
> +ASYNC VM_BIND
> +-------------
> +Although having a common DRM level IOCTL for VM_BIND is not a requiremen=
t to get
> +Xe merged, it is mandatory to have a cross-driver consensus and understa=
nding how
> +to handle async VM_BIND and interactions with userspace memory fences. I=
deally
> +with helper support so people don't get it wrong in all possible ways.
> +
> +As a key measurable result, the benefits of ASYNC VM_BIND and a discussi=
on of
> +various flavors, error handling and a sample API should be documented he=
re or in
> +a separate document pointed to by this document.

I think it'd be good to explicit mention mesa as stakeholder here,
since there's already a pile of worker infra in mesa, and vulkan
binding engines (or whatever they're called again) are a primary user
for all this. If it doesn't fit for vulkan, it's pretty much no-go :-)

But also fine as-is.

> +Userptr integration and vm_bind
> +-------------------------------
> +Different drivers implement different ways of dealing with execution of =
userptr.
> +With multiple drivers currently introducing support to VM_BIND, the goal=
 is to
> +aim for a DRM consensus on what=E2=80=99s the best way to have that supp=
ort. To some
> +extent this is already getting addressed itself with the GPUVA where lik=
ely the
> +userptr will be a GPUVA with a NULL GEM call VM bind directly on the use=
rptr.
> +However, there are more aspects around the rules for that and the usage =
of
> +mmu_notifiers, locking and other aspects.
> +
> +This task here has the goal of introducing a documentation of the basic =
rules.
> +
> +The documentation *needs* to first live in this document (API session be=
low) and
> +then moved to another more specific document or at Xe level or at DRM le=
vel.
> +
> +Documentation should include:
> +
> + * The userptr part of the VM_BIND api.
> +
> + * Locking, including the page-faulting case.
> +
> + * O(1) complexity under VM_BIND.
> +
> +Some parts of userptr like mmu_notifiers should become GPUVA or DRM help=
ers when
> +the second driver supporting VM_BIND+userptr appears. Details to be defi=
ned when
> +the time comes.

Yeah I think this here is a good compromise to not hold up Xe
unecessarily until every bit of shared infra is in place.

> +
> +Long running compute: minimal data structure/scaffolding
> +--------------------------------------------------------
> +The generic scheduler code needs to include the handling of endless comp=
ute
> +contexts, with the minimal scaffolding for preempt-ctx fences (probably =
on the
> +drm_sched_entity) and making sure drm_scheduler can cope with the lack o=
f job
> +completion fence.
> +
> +The goal is to achieve a consensus ahead of Xe initial pull-request, ide=
ally with
> +this minimal drm/scheduler work, if needed, merged to drm-misc in a way =
that any
> +drm driver, including Xe, could re-use and add their own individual need=
s on top
> +in a next stage. However, this should not block the initial merge.
> +
> +As a key measurable result, the handling of the long running jobs and th=
e minimal
> +scaffolding should be documented here or in a separate document pointed =
to by
> +this document.

This is up to you, but given that i915 does not (at least in upstream)
support long-running compute workloads, you might want to think about
delaying this to post-merge work. It would remove a substantial
discussion topic where reaching consensus could take a while out of
the merge critical path.

Of course still needs to be done eventually, so good to keep this
here. Just saying that from drm maintainer perspective an xe driver
without long-running compute enabled doesn't look like a showstopper
for merging to me.

> +
> +Display integration with i915
> +-----------------------------
> +In order to share the display code with the i915 driver so that there is=
 maximum
> +reuse, the i915/display/ code is built twice, once for i915.ko and then =
for
> +xe.ko. Currently, the i915/display code in Xe tree is polluted with many=
 'ifdefs'
> +depending on the build target. The goal is to refactor both Xe and i915/=
display
> +code simultaneously in order to get a clean result before they land upst=
ream, so
> +that display can already be part of the initial pull request towards drm=
-next.
> +
> +However, display code should not gate the acceptance of Xe in upstream. =
Xe
> +patches will be refactored in a way that display code can be removed, if=
 needed,
> +from the first pull request of Xe towards drm-next. The expectation is t=
hat when
> +both drivers are part of the drm-tip, the introduction of cleaner patche=
s will be
> +easier and speed up.

Would be good to have Jani's ack on this :-) I don't really have
opinions on how to best do this all.

> +
> +Drm_exec
> +--------
> +Helper to make dma_resv locking for a big number of buffers is getting r=
emoved in
> +the drm_exec series proposed in https://patchwork.freedesktop.org/patch/=
524376/
> +If that happens, Xe needs to change and incorporate the changes in the d=
river.
> +The goal is to engage with the Community to understand if the best appro=
ach is to
> +move that to the drivers that are using it or if we should keep the help=
ers in
> +place waiting for Xe to get merged.

Maybe mention that this ties into vm_bind too and long-running compute
support, since that's also places that probably benefit from these
drm_exec helpers.

> +
> +As a key measurable result, we need to have a community consensus docume=
nted in
> +this document and the Xe driver prepared for the changes, if necessary.
> +
> +Xe =E2=80=93 uAPI high level overview
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +...Warning: To be done in follow up patches after/when/where the main co=
nsensus in various items are individually reached.

I think the only missing piece (maybe better in the commit message) is
that Oded is volunteer to shoulder the "does this look good for
upstream" responsibility as his trial-by-fire for accel maintainer. Or
whatever Oded wants to put there for his Ack.

Dave is back next week if you want his ack, but maybe an ack from
nouveau or amd folks might be more useful. Otoh all that feedback will
kick in for each of these topics.

One tiny thing: devcoredump instead of hand-rolling for gpu crash
dumps please - every driver in drm that added support for this after
i915 uses this. New sysfs uabi for this is no-go, we have a standard
one now :-)

Anyway all kinda details: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
