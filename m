Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 796086EFF10
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 03:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE96D10E19E;
	Thu, 27 Apr 2023 01:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18A610E19E;
 Thu, 27 Apr 2023 01:56:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-956ff2399c9so1401019266b.3; 
 Wed, 26 Apr 2023 18:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682560597; x=1685152597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4eYpWibg8DDeEkRxE2QPBuzRLHmGsijjVo2AbkwEo8=;
 b=araHOYlhX7YbHT+ufxC6kKT3XzVrydmJVVMaKB94Uy59yyLVo3yBRLjtRzDXegsjDe
 jMfD3YXq1gt4IzTJxaEGiNWKw2qLVK9vf0GvgK4T/13nImBSykKnM6eqeL6yL+ZO3uyq
 vDShy117E3rd3VVgmW1YqV/KhlNRFTeTABa7Cv34e/ZVQwqkJqkwOoK+Bg6IhP0AgIwD
 8MrfdFiExL6EwCgPDHut43q7BM2I4jJ/rDTq0C000zaARa0yyBxCPvdjaQXKXyjL3sEl
 79nnHRuKAJwlAOJOnh+FeSkZTqPk4tmTGmT6I+o70/QmAvzau2QL7SbMvUa+a4KAUgSU
 8fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682560597; x=1685152597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4eYpWibg8DDeEkRxE2QPBuzRLHmGsijjVo2AbkwEo8=;
 b=IQYvZJF+sH9UggjJSGIT+RrKx8xKlpJgRhBJHh4pyHRLDxHiIEpJFu2k1d5V0jcm61
 U5jJ3Ogihj8qkiAogJ3ePrIdcZWCYh9ObKp1luSuLw5O3yqNUxFqjQjAWwdnZXE2Wkor
 TbTZ7aTWfrS+jK+JiZQSmR+DYRTRFGLLbvpayhu+mhis2yKGwsi92f+GkEvre1guydDt
 xogxuP/3g85hEi9Y52X/CNtv09h317lJez5vAetRuB8s96O8QDETVoTwbGB7QOx1d+fa
 j3cxb9KBhkXtnlIze3U7SZr774bhNrcQHBfmLqMGfCsKscApFNLSXuxGrnbYvYF75cgz
 LtBg==
X-Gm-Message-State: AAQBX9fW44AK9cvoX09TXKhDiEvMkbn8sv8Eg/d+dWNGZbdyaROAx+bV
 quERE46nTAzpsOQhAPC3Rh0L508+oGysU9iO5fs=
X-Google-Smtp-Source: AKy350aM/xinppWJO1WCeBFk8lQpEZO8DUwV60x0SveqffiWXTV99zu/llY/v7esPymjJP8OZGfAGDKx+BKw7O/scUw=
X-Received: by 2002:a17:906:6c1:b0:94e:8559:b5c5 with SMTP id
 v1-20020a17090606c100b0094e8559b5c5mr19354183ejb.64.1682560596521; Wed, 26
 Apr 2023 18:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230418133133.80434-1-rodrigo.vivi@intel.com>
 <20230419191913.158807-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230419191913.158807-1-rodrigo.vivi@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 27 Apr 2023 11:56:22 +1000
Message-ID: <CAPM=9twezi635ZYA+TvZfWc9Dc7RyMhACfcT=DZ1nA3nAenynA@mail.gmail.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Francois Dugast <francois.dugast@intel.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, intel-xe@lists.freedesktop.org,
 Luis Strano <luis.strano@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Apr 2023 at 05:19, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> Let=E2=80=99s establish a merge plan for Xe, by writing down clear pre-me=
rge goals, in
> order to avoid unnecessary delays.

LGTM,

Acked-by: Dave Airlie <airlied@redhat.com>

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
> Besides of the items that are highlighted in this document, it is importa=
nt
> to highlight that Oded, has been volunteered to give the overall ack on X=
e
> driver as the way to confirm that it looks good for upstream.
>
> v2: Incorporated Daniel's feedback:
>     - Do not make long-running compute a blocker.
>     - Add a mention to drm-exec that that ties to vm_bind and long-runnin=
g
>       compute jobs. Then I also added GPUVA since I recently noticed that=
 this
>       ties also to the work Matt is doing on that front.
>     - Added the devcoredump section.
>     - Add the mention to Oded being volunteered for the overall ack.
>
> v3: Reword a bit the Async VM_BIND to incorporate Daniel's feedback on en=
suring
>     the async vmbind consensus explicitly include Mesa, besides other ker=
nel
>     drivers.
>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Luis Strano <luis.strano@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  Documentation/gpu/rfc/index.rst |   4 +
>  Documentation/gpu/rfc/xe.rst    | 235 ++++++++++++++++++++++++++++++++
>  2 files changed, 239 insertions(+)
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
> index 000000000000..2516fe141db6
> --- /dev/null
> +++ b/Documentation/gpu/rfc/xe.rst
> @@ -0,0 +1,235 @@
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
> +Xe merged, it is mandatory to have a consensus with other drivers and Me=
sa.
> +It needs to be clear how to handle async VM_BIND and interactions with u=
serspace
> +memory fences. Ideally with helper support so people don't get it wrong =
in all
> +possible ways.
> +
> +As a key measurable result, the benefits of ASYNC VM_BIND and a discussi=
on of
> +various flavors, error handling and a sample API should be documented he=
re or in
> +a separate document pointed to by this document.
> +
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
> +This is a non-blocker item since the driver without the support for the =
long
> +running compute enabled is not a showstopper.
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
> +
> +This item ties into the GPUVA, VM_BIND, and even long-running compute su=
pport.
> +
> +As a key measurable result, we need to have a community consensus docume=
nted in
> +this document and the Xe driver prepared for the changes, if necessary.
> +
> +Dev_coredump
> +------------
> +
> +Xe needs to align with other drivers on the way that the error states ar=
e
> +dumped, avoiding a Xe only error_state solution. The goal is to use devc=
oredump
> +infrastructure to report error states, since it produces a standardized =
way
> +by exposing a virtual and temporary /sys/class/devcoredump device.
> +
> +As the key measurable result, Xe driver needs to provide GPU snapshots c=
aptured
> +at hang time through devcoredump, but without depending on any core modi=
fication
> +of devcoredump infrastructure itself.
> +
> +Later, when we are in-tree, the goal is to collaborate with devcoredump
> +infrastructure with overall possible improvements, like multiple file su=
pport
> +for better organization of the dumps, snapshot support, dmesg extra prin=
t,
> +and whatever may make sense and help the overall infrastructure.
> +
> +Xe =E2=80=93 uAPI high level overview
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +...Warning: To be done in follow up patches after/when/where the main co=
nsensus in various items are individually reached.
> --
> 2.39.2
>
