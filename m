Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA618761E39
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 18:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAA710E0FE;
	Tue, 25 Jul 2023 16:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02FB10E152
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 16:16:25 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5222c5d71b8so3352703a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 09:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1690301784; x=1690906584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+SMjkWSDuRcE4EWQkehN6B+0pDWq7fEh9SRxYaHpZ5A=;
 b=hhpgXYdPoCjkdZHBtKDK5s9TNeNm2Bjigj2gUEuMVwhMHWUmqt9ZYyR150tIDIrJG5
 Bxf4IpCo0RUVcGR2rotn/pDySUTrkDpOVNxqQ3wekI1ewJmaBi2FNl+/WZEbq+pLSrUc
 o8w4m1m09kWUQb41KUBvhoMgxq9G5ewZq4Mhzxb8AMxUR9BwHlAn+ksmrUR9Rlr+rlp5
 83vSjR/2OujmzAFK7ddm7kgShkHJAoyjzw0Xy/Q61iGql/cATqEwbh+fGU9T5itDFfje
 zOgDVfefRsnXdPpkvomdr/UoHmm0eTl63Gxe15R2qu1J89fAUw9DEO3YnTaYwfuNbKd2
 ybgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690301784; x=1690906584;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+SMjkWSDuRcE4EWQkehN6B+0pDWq7fEh9SRxYaHpZ5A=;
 b=W5sEl+aoVXF3BQBAM1ZsV23S4v7G59Q5yTMrDWQLdid3I2kW2ketR3DLQ523x4//XL
 KJhqgEQfco002+UC7twxnUA5aTABYt7FCYLZssPmrxAYIsiaQ1SzmL677i5UjwIk/TYL
 8r+9H2dhsAa3VFmXktABTG6VlWTEtYenAlk5ffnSOdsGE/rmTqfz0895WzGlVo+5YxiM
 swqxPOtIXTTLTXKkNWT6ot61BV5GqO+B3o2iUPzFA/chjitAxd36zPyUIQeFIBhrYN83
 jhPvchIlR39kpt0yzmSfU8EI6pCvlKFbGHEc2s+v6hSYNKgJFcRgtKIWex0WqEDIf1Pj
 +DIQ==
X-Gm-Message-State: ABy/qLZ2MJr7A7g3ImwiTFPg8IXwvp2KWzCPAPSDk/jHRcKfQULDrEYt
 we11ryRsluLQnhfIgT6KOY+XWBcRfgJdOiYGdaSbRw==
X-Google-Smtp-Source: APBJJlFA13OA+4GBmodo4NDvvj6eKgn1kc9m/aBuTLd+Bar+At4wsmMp6gU8GY8EKfIQzvvqTOb/xStRIwTVBTXl/VE=
X-Received: by 2002:a17:907:1dd4:b0:99b:5445:10d5 with SMTP id
 og20-20020a1709071dd400b0099b544510d5mr13386665ejc.51.1690301784071; Tue, 25
 Jul 2023 09:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230720001443.2380-1-dakr@redhat.com>
 <20230720001443.2380-12-dakr@redhat.com>
 <CAOFGe945tp344=g-++=EAT89t0qJHZ=3yeW-k9OTbGNJodvwAg@mail.gmail.com>
 <542203c6-781a-dc44-6fa1-13cd20ab9e21@redhat.com>
In-Reply-To: <542203c6-781a-dc44-6fa1-13cd20ab9e21@redhat.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Tue, 25 Jul 2023 11:16:12 -0500
Message-ID: <CAOFGe94sG5==GM+spcTihcAtMCoj2xZYpN8NsYE6CEckdHJ8rQ@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v8 11/12] drm/nouveau: implement new VM_BIND
 uAPI
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006736190601520d5c"
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006736190601520d5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2023 at 9:04=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:

> On 7/22/23 17:12, Faith Ekstrand wrote:
> > On Wed, Jul 19, 2023 at 7:15=E2=80=AFPM Danilo Krummrich <dakr@redhat.c=
om
> > <mailto:dakr@redhat.com>> wrote:
> >
> >     This commit provides the implementation for the new uapi motivated
> >     by the
> >     Vulkan API. It allows user mode drivers (UMDs) to:
> >
> >     1) Initialize a GPU virtual address (VA) space via the new
> >         DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion
> >     of VA
> >         space managed by the kernel and userspace, respectively.
> >
> >     2) Allocate and free a VA space region as well as bind and unbind
> memory
> >         to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioct=
l.
> >         UMDs can request the named operations to be processed either
> >         synchronously or asynchronously. It supports DRM syncobjs
> >         (incl. timelines) as synchronization mechanism. The management
> >     of the
> >         GPU VA mappings is implemented with the DRM GPU VA manager.
> >
> >     3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
> The
> >         execution happens asynchronously. It supports DRM syncobj (incl=
.
> >         timelines) as synchronization mechanism. DRM GEM object locking
> is
> >         handled with drm_exec.
> >
> >     Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the
> DRM
> >     GPU scheduler for the asynchronous paths.
> >
> >
> > IDK where the best place to talk about this is but this seems as good a=
s
> > any.
> >
> > I've been looking into why the Vulkan CTS runs about 2x slower for me o=
n
> > the new UAPI and I created a little benchmark to facilitate testing:
> >
> > https://gitlab.freedesktop.org/mesa/crucible/-/merge_requests/141
> > <https://gitlab.freedesktop.org/mesa/crucible/-/merge_requests/141>
> >
> > The test, roughly, does the following:
> >   1. Allocates and binds 1000 BOs
> >   2. Constructs a pushbuf that executes a no-op compute shader.
> >   3. Does a single EXEC/wait combo to warm up the kernel
> >   4. Loops 10,000 times, doing SYNCOBJ_RESET (fast), EXEC, and then
> > SYNCOBJ_WAIT and times the loop
> >
> > Of course, there's a bit of userspace driver overhead but that's
> > negledgable.
> >
> > If you drop the top patch which allocates 1k buffers, the submit time o=
n
> > the old uAPI is 54 us/exec vs. 66 us/exec on the new UAPI. This include=
s
> > the time to do a SYNCOBJ_RESET (fast), EXEC, and SYNCOBJ_WAIT.The Intel
> > driver, by comparison, is 33us/exec so it's not syncobj overhead. This
> > is a bit concerning (you'd think the new thing would be faster) but wha=
t
> > really has me concerned is the 1k buffer case.
> >
> > If you include the top patch in the crucible MR, it allocates 1000 BOs
> > and VM_BINDs them. All the binding is done before the warmup EXEC.
> > Suddenly, the submit time jumps to 257 us/exec with the new UAPI. The
> > old UAPI is much worse (1134 us/exec) but that's not the point. Once
> > we've done the first EXEC and created our VM bindings, the cost per EXE=
C
> > shouldn't change at all based on the number of BOs bound.  Part of the
> > point of VM_BIND is to get all that binding logic and BO walking off th=
e
> > EXEC path.
> >
> > Normally, I wouldn't be too worried about a little performance problem
> > like this. This is the first implementation and we can improve it later=
.
> > I get that. However, I suspect the solution to this problem involves
> > more UAPI and I want to make sure we have it all before we call this al=
l
> > done and dusted and land it.
> >
> > The way AMD solves this problem as well as the new Xe driver for Intel
> > is to have a concept of internal vs. external BOs. Basically, there's a=
n
> > INTERNAL bit specified somewhere in BO creation that has a few userspac=
e
> > implications:
> >   1. In the Xe world where VMs are objects, INTERNAL BOs are assigned a
> > VM on creation and can never be bound to any other VM.
> >   2. Any attempt to export an INTERNAL BO via prime or a similar
> > mechanism will fail with -EINVAL (I think?).
> >
> > Inside the kernel driver, all the internal BOs on a VM (or DRM file in
> > the case of nouveau/AMD since they don't have VM objects) share a singl=
e
> > dma_resv which allows you to avoid having to walk lists of BOs and take
> > locks on every exec. Instead, you can just look at the fences on the
> > dma_resv for the VM. There's still a BO list associated with the VM for
> > external BOs but, in most Vulkan applications, there are less than a
> > half dozen external BOs total.  Meanwhile, the hundreds or thousands of
> > BOs used entirely internally to the application basically count as one
> > BO when it comes to locking overhead.
>
> I am aware of that and I have some WIP patches [1] to generalize a
> common dma-resv within the GPUVA manager which basically represents a
> GPU-VM. It also keeps track of external GEM objects and evicted objects,
> such that on EXEC we only need to validate objects needing validation,
> rather than all of them. Hence, it should be faster than with Daves
> patch having a common dma-resv only.
>
> In [1] I also picked up Daves code to allow for noop jobs to be
> submitted as well as the NOUVEAU_GEM_DOMAIN_NO_SHARE flag.
>
> This seems to work fine with yours and Daves latest mesa work
> (670c301a9845a3fc795fd48a1e6714e75b388245).
>
> Your crucible bench.submit-latency test goes down to 51us on my machine
> with those patches.
>
> I am unsure though, if we should aim for a common solution within the
> GPUVA manager directly or if we should do it driver specific in a first
> shot. I discussed this patch with Matt and I know that XE looks for
> having a generalized solution as well. However, it surely needs some
> more care and polish and feedback from other drivers perspective.
>
> [1]
>
> https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-=
vm-resv
>
> >
> > I'm not actually trying to dictate kernel driver design here. If one
> > dma_resv doesn't work, fine. I don't care as long as EXEC scales.
> > However, given that the solution in all the other drivers involves a BO
> > create flag nouveau doesn't have, we need to either add that or prove
> > that we can get EXEC to scale without it.
>
>  From #nouveau:
>
> <gfxstrand> CTSing now
> <gfxstrand> It looks like it's still going to take 1.5 hours.
>
> I may have an idea what could be the issue, let me explain.
>
> Currently, there is a single drm_gpu_scheduler having a drm_sched_entity
> per client (for VM_BIND jobs) and a drm_sched_entity per channel (for
> EXEC jobs).
>
> For VM_BIND jobs the corresponding PT[E]s are allocated before the job
> is pushed to the corresponding drm_sched_entity. The PT[E]s are freed by
> the schedulers free() callback pushing work to a single threaded
> workqueue doing the actual free. (We can't do it in the free() callback
> directly, since to free PT[E]s we need to hold a mutex we also need to
> hold while allocating them.)
>
> Because of how the page table handling in Nouveau is implemented
> currently there are some ordering restrictions when it comes to
> allocating and freeing PT[E]s. For instance, we can't allocate PT[E]s
> for sparse regions before the PT[E]s of previously removed memory backed
> mappings *within the same address range* aren't freed. The same applies
> vice versa and for sparse mapping replacing sparse mapping. For memory
> backed mappings (also for those within sparse regions) we do *not* have
> such ordering requirements.
>
> So, let's assume userspace removes a sparse region A[0x0, 0x8000000] and
> asks for a couple of new memory backed mappings within or crossing this
> range; the kernel needs to wait for A not only to be unmapped, but also
> the backing PT[E]s to be freed before it can even allocate the PT[E]s
> for the new memory backed mappings.
>
> Now, let's have a look what the gpu schedulers main loop does. Before
> picking the next entity to schedule a job for, it tries to fetch the
> first job from the pending_list and checks whether its dma-fence is
> signaled already and whether the job can be cleaned up. Subsequent jobs
> on the pending_list are not taken into consideration. Hence, it might
> well be that the first job on the pending_list isn't signaled yet, but
> subsequent jobs are and hence *could* be cleaned up.
>
> Normally, this shouldn't be a problem, since we wouldn't really care
> *when* resources are cleaned up as long as they are eventually. However,
> with the ordering restrictions the page table handling gives us we might
> actually care about the "when".
>
> For instance, it could happen that the first job on the pending list is
> a rather long running EXEC job (1) scheduled from client A on some
> channel. The next job on the pending list could be a VM_BIND job (2)
> from client B removing a sparse region, which is finished already but is
> blocked to be cleaned up until the EXEC job (1) from client A is
> finished and cleaned up. Now, a subsequent VM_BIND job (3) from client B
> creating a new memory backed mapping in the same address range as the
> sparse region removed by job (2) would need to wait for (2) to be
> cleaned up. Ultimately, we can expect client B to submit an EXEC job
> that needs to wait for the corresponding mappings to be created, namely
> the VM_BIND job (3).
>
> Clearly in order to address this we need to rework the page table
> handling in Nouveau to get rid of those ordering restrictions.
>
> Temporarily, we could also try to run a secondary drm_gpu_scheduler
> instance, one for VM_BINDs and one for EXECs maybe...
>
> However, I would not expect this to be an issue in real applications,
> especially if mesa takes a little care not to re-use certain address
> space areas right away to avoid running into such wait conditions.
>
> For parallel VK CTS runs I could imagine that we run into such cases
> from time to time though.
>

Thanks for the detailed write-up! That would definitely explain it. If I
remember, I'll try to do a single-threaded run or two. If your theory is
correct, there should be no real perf difference when running
single-threaded. Those runs will take a long time, though, so I'll have to
run them over night. I'll let you know in a few days once I have the
results.

If this theory holds, then I'm not concerned about the performance of the
API itself. It would still be good to see if we can find a way to reduce
the cross-process drag in the implementation but that's a perf optimization
we can do later.

Does it actually matter? Yes, it kinda does. No, it probably doesn't matter
for games because you're typically only running one game at a time. From a
development PoV, however, if it makes CI take longer then that slows down
development and that's not good for the users, either.

~Faith


> - Danilo
>
> >
> > ~Faith
> >
>
>

--0000000000006736190601520d5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Jul 24, 2023 at 9:04=E2=80=AFPM Danilo Krummrich &lt;<a href=
=3D"mailto:dakr@redhat.com">dakr@redhat.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On 7/22/23 17:12, Faith Ekstrand=
 wrote:<br>
&gt; On Wed, Jul 19, 2023 at 7:15=E2=80=AFPM Danilo Krummrich &lt;<a href=
=3D"mailto:dakr@redhat.com" target=3D"_blank">dakr@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:dakr@redhat.com" target=3D"_blank">dakr@r=
edhat.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This commit provides the implementation for the new=
 uapi motivated<br>
&gt;=C2=A0 =C2=A0 =C2=A0by the<br>
&gt;=C2=A0 =C2=A0 =C2=A0Vulkan API. It allows user mode drivers (UMDs) to:<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A01) Initialize a GPU virtual address (VA) space via =
the new<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_IOCTL_NOUVEAU_VM_INIT ioctl for U=
MDs to specify the portion<br>
&gt;=C2=A0 =C2=A0 =C2=A0of VA<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0space managed by the kernel and users=
pace, respectively.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02) Allocate and free a VA space region as well as b=
ind and unbind memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to the GPUs VA space via the new DRM_=
IOCTL_NOUVEAU_VM_BIND ioctl.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UMDs can request the named operations=
 to be processed either<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0synchronously or asynchronously. It s=
upports DRM syncobjs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(incl. timelines) as synchronization =
mechanism. The management<br>
&gt;=C2=A0 =C2=A0 =C2=A0of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPU VA mappings is implemented with t=
he DRM GPU VA manager.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A03) Execute push buffers with the new DRM_IOCTL_NOUV=
EAU_EXEC ioctl. The<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execution happens asynchronously. It =
supports DRM syncobj (incl.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timelines) as synchronization mechani=
sm. DRM GEM object locking is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handled with drm_exec.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVE=
AU_EXEC, use the DRM<br>
&gt;=C2=A0 =C2=A0 =C2=A0GPU scheduler for the asynchronous paths.<br>
&gt; <br>
&gt; <br>
&gt; IDK where the best place to talk about this is but this seems as good =
as <br>
&gt; any.<br>
&gt; <br>
&gt; I&#39;ve been looking into why the Vulkan CTS runs about 2x slower for=
 me on <br>
&gt; the new UAPI and I created a little benchmark to facilitate testing:<b=
r>
&gt; <br>
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/crucible/-/merge_reques=
ts/141" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org=
/mesa/crucible/-/merge_requests/141</a> <br>
&gt; &lt;<a href=3D"https://gitlab.freedesktop.org/mesa/crucible/-/merge_re=
quests/141" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop=
.org/mesa/crucible/-/merge_requests/141</a>&gt;<br>
&gt; <br>
&gt; The test, roughly, does the following:<br>
&gt;=C2=A0 =C2=A01. Allocates and binds 1000 BOs<br>
&gt;=C2=A0 =C2=A02. Constructs a pushbuf that executes a no-op compute shad=
er.<br>
&gt;=C2=A0 =C2=A03. Does a single EXEC/wait combo to warm up the kernel<br>
&gt;=C2=A0 =C2=A04. Loops 10,000 times, doing SYNCOBJ_RESET (fast), EXEC, a=
nd then <br>
&gt; SYNCOBJ_WAIT and times the loop<br>
&gt; <br>
&gt; Of course, there&#39;s a bit of userspace driver overhead but that&#39=
;s <br>
&gt; negledgable.<br>
&gt; <br>
&gt; If you drop the top patch which allocates 1k buffers, the submit time =
on <br>
&gt; the old uAPI is 54 us/exec vs. 66 us/exec on the new UAPI. This includ=
es <br>
&gt; the time to do a SYNCOBJ_RESET (fast), EXEC, and SYNCOBJ_WAIT.The Inte=
l <br>
&gt; driver, by comparison, is 33us/exec so it&#39;s not syncobj overhead. =
This <br>
&gt; is a bit concerning (you&#39;d think the new thing would be faster) bu=
t what <br>
&gt; really has me concerned is the 1k buffer case.<br>
&gt; <br>
&gt; If you include the top patch in the crucible MR, it allocates 1000 BOs=
 <br>
&gt; and VM_BINDs them. All the binding is done before the warmup EXEC. <br=
>
&gt; Suddenly, the submit time jumps to 257 us/exec with the new UAPI. The =
<br>
&gt; old UAPI is much worse (1134 us/exec) but that&#39;s not the point. On=
ce <br>
&gt; we&#39;ve done the first EXEC and created our VM bindings, the cost pe=
r EXEC <br>
&gt; shouldn&#39;t change at all based on the number of BOs bound.=C2=A0 Pa=
rt of the <br>
&gt; point of VM_BIND is to get all that binding logic and BO walking off t=
he <br>
&gt; EXEC path.<br>
&gt; <br>
&gt; Normally, I wouldn&#39;t be too worried about a little performance pro=
blem <br>
&gt; like this. This is the first implementation and we can improve it late=
r. <br>
&gt; I get that. However, I suspect the solution to this problem involves <=
br>
&gt; more UAPI and I want to make sure we have it all before we call this a=
ll <br>
&gt; done and dusted and land it.<br>
&gt; <br>
&gt; The way AMD solves this problem as well as the new Xe driver for Intel=
 <br>
&gt; is to have a concept of internal vs. external BOs. Basically, there&#3=
9;s an <br>
&gt; INTERNAL bit specified somewhere in BO creation that has a few userspa=
ce <br>
&gt; implications:<br>
&gt;=C2=A0 =C2=A01. In the Xe world where VMs are objects, INTERNAL BOs are=
 assigned a <br>
&gt; VM on creation and can never be bound to any other VM.<br>
&gt;=C2=A0 =C2=A02. Any attempt to export an INTERNAL BO via prime or a sim=
ilar <br>
&gt; mechanism will fail with -EINVAL (I think?).<br>
&gt; <br>
&gt; Inside the kernel driver, all the internal BOs on a VM (or DRM file in=
 <br>
&gt; the case of nouveau/AMD since they don&#39;t have VM objects) share a =
single <br>
&gt; dma_resv which allows you to avoid having to walk lists of BOs and tak=
e <br>
&gt; locks on every exec. Instead, you can just look at the fences on the <=
br>
&gt; dma_resv for the VM. There&#39;s still a BO list associated with the V=
M for <br>
&gt; external BOs but, in most Vulkan applications, there are less than a <=
br>
&gt; half dozen external BOs total.=C2=A0 Meanwhile, the hundreds or thousa=
nds of <br>
&gt; BOs used entirely internally to the application basically count as one=
 <br>
&gt; BO when it comes to locking overhead.<br>
<br>
I am aware of that and I have some WIP patches [1] to generalize a <br>
common dma-resv within the GPUVA manager which basically represents a <br>
GPU-VM. It also keeps track of external GEM objects and evicted objects, <b=
r>
such that on EXEC we only need to validate objects needing validation, <br>
rather than all of them. Hence, it should be faster than with Daves <br>
patch having a common dma-resv only.<br>
<br>
In [1] I also picked up Daves code to allow for noop jobs to be <br>
submitted as well as the NOUVEAU_GEM_DOMAIN_NO_SHARE flag.<br>
<br>
This seems to work fine with yours and Daves latest mesa work <br>
(670c301a9845a3fc795fd48a1e6714e75b388245).<br>
<br>
Your crucible bench.submit-latency test goes down to 51us on my machine <br=
>
with those patches.<br>
<br>
I am unsure though, if we should aim for a common solution within the <br>
GPUVA manager directly or if we should do it driver specific in a first <br=
>
shot. I discussed this patch with Matt and I know that XE looks for <br>
having a generalized solution as well. However, it surely needs some <br>
more care and polish and feedback from other drivers perspective.<br>
<br>
[1] <br>
<a href=3D"https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-=
drm-next-vm-resv" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freed=
esktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-vm-resv</a><br>
<br>
&gt; <br>
&gt; I&#39;m not actually trying to dictate kernel driver design here. If o=
ne <br>
&gt; dma_resv doesn&#39;t work, fine. I don&#39;t care as long as EXEC scal=
es. <br>
&gt; However, given that the solution in all the other drivers involves a B=
O <br>
&gt; create flag nouveau doesn&#39;t have, we need to either add that or pr=
ove <br>
&gt; that we can get EXEC to scale without it.<br>
<br>
=C2=A0From #nouveau:<br>
<br>
&lt;gfxstrand&gt; CTSing now<br>
&lt;gfxstrand&gt; It looks like it&#39;s still going to take 1.5 hours.<br>
<br>
I may have an idea what could be the issue, let me explain.<br>
<br>
Currently, there is a single drm_gpu_scheduler having a drm_sched_entity <b=
r>
per client (for VM_BIND jobs) and a drm_sched_entity per channel (for <br>
EXEC jobs).<br>
<br>
For VM_BIND jobs the corresponding PT[E]s are allocated before the job <br>
is pushed to the corresponding drm_sched_entity. The PT[E]s are freed by <b=
r>
the schedulers free() callback pushing work to a single threaded <br>
workqueue doing the actual free. (We can&#39;t do it in the free() callback=
 <br>
directly, since to free PT[E]s we need to hold a mutex we also need to <br>
hold while allocating them.)<br>
<br>
Because of how the page table handling in Nouveau is implemented <br>
currently there are some ordering restrictions when it comes to <br>
allocating and freeing PT[E]s. For instance, we can&#39;t allocate PT[E]s <=
br>
for sparse regions before the PT[E]s of previously removed memory backed <b=
r>
mappings *within the same address range* aren&#39;t freed. The same applies=
 <br>
vice versa and for sparse mapping replacing sparse mapping. For memory <br>
backed mappings (also for those within sparse regions) we do *not* have <br=
>
such ordering requirements.<br>
<br>
So, let&#39;s assume userspace removes a sparse region A[0x0, 0x8000000] an=
d <br>
asks for a couple of new memory backed mappings within or crossing this <br=
>
range; the kernel needs to wait for A not only to be unmapped, but also <br=
>
the backing PT[E]s to be freed before it can even allocate the PT[E]s <br>
for the new memory backed mappings.<br>
<br>
Now, let&#39;s have a look what the gpu schedulers main loop does. Before <=
br>
picking the next entity to schedule a job for, it tries to fetch the <br>
first job from the pending_list and checks whether its dma-fence is <br>
signaled already and whether the job can be cleaned up. Subsequent jobs <br=
>
on the pending_list are not taken into consideration. Hence, it might <br>
well be that the first job on the pending_list isn&#39;t signaled yet, but =
<br>
subsequent jobs are and hence *could* be cleaned up.<br>
<br>
Normally, this shouldn&#39;t be a problem, since we wouldn&#39;t really car=
e <br>
*when* resources are cleaned up as long as they are eventually. However, <b=
r>
with the ordering restrictions the page table handling gives us we might <b=
r>
actually care about the &quot;when&quot;.<br>
<br>
For instance, it could happen that the first job on the pending list is <br=
>
a rather long running EXEC job (1) scheduled from client A on some <br>
channel. The next job on the pending list could be a VM_BIND job (2) <br>
from client B removing a sparse region, which is finished already but is <b=
r>
blocked to be cleaned up until the EXEC job (1) from client A is <br>
finished and cleaned up. Now, a subsequent VM_BIND job (3) from client B <b=
r>
creating a new memory backed mapping in the same address range as the <br>
sparse region removed by job (2) would need to wait for (2) to be <br>
cleaned up. Ultimately, we can expect client B to submit an EXEC job <br>
that needs to wait for the corresponding mappings to be created, namely <br=
>
the VM_BIND job (3).<br>
<br>
Clearly in order to address this we need to rework the page table <br>
handling in Nouveau to get rid of those ordering restrictions.<br>
<br>
Temporarily, we could also try to run a secondary drm_gpu_scheduler <br>
instance, one for VM_BINDs and one for EXECs maybe...<br>
<br>
However, I would not expect this to be an issue in real applications, <br>
especially if mesa takes a little care not to re-use certain address <br>
space areas right away to avoid running into such wait conditions.<br>
<br>
For parallel VK CTS runs I could imagine that we run into such cases <br>
from time to time though.<br></blockquote><div><br></div><div>Thanks for th=
e detailed write-up! That would definitely explain it. If I remember, I&#39=
;ll try to do a single-threaded run or two. If your theory is correct, ther=
e should be no real perf difference when running single-threaded. Those run=
s will take a long time, though, so I&#39;ll have to run them over night. I=
&#39;ll let you know in a few days once I have the results.</div><div><br><=
/div><div>If this theory holds, then I&#39;m not concerned about the perfor=
mance of the API itself. It would still be good to see if we can find a way=
 to reduce the cross-process drag in the implementation but that&#39;s a pe=
rf optimization we can do later.</div><div><br></div><div>Does it actually =
matter? Yes, it kinda does. No, it probably doesn&#39;t matter for games be=
cause you&#39;re typically only running one game at a time. From a developm=
ent PoV, however, if it makes CI take longer then that slows down developme=
nt and that&#39;s not good for the users, either.</div><div><br></div><div>=
~Faith<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
- Danilo<br>
<br>
&gt; <br>
&gt; ~Faith<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000006736190601520d5c--
