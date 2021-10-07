Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E27425097
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73E66E86A;
	Thu,  7 Oct 2021 10:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65356E86A;
 Thu,  7 Oct 2021 10:00:28 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id dj4so20934362edb.5;
 Thu, 07 Oct 2021 03:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NhTwke3cjte7Q3JaE9315Dm9DORgiyRheed7dlQcA5k=;
 b=YEvw3uf0kuSFOYZXk/LhkZId/z8jm7kiMEyq8Hsjs8jEdsRu8N17mjVwUl01DQNQSW
 2LQXFr7cTVmbPPetCmESbNPv4IrHmUSJADoAqW/PVx5YYvY2SjDCAiOC9WKeKXBJsn+m
 vncyO7Tgq5gzaU4sSd4MgaVDdAtzKSrT6+XyFuGxkxAKFlPYweWtSHvwWwV0cwKRaZU2
 zzXlMw+AXt2ok4gZZi3ky1eghYnVLij9phuiZGAF7e3aLYYV1XdSFQ+UH2sRHnP9hPEH
 1wiGbcMJDwK0eBkFFUDsAXFtcxgguEbEMOB8Yu+cg13Y5SYe52o39o56t3xGu1qx7Z01
 o8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NhTwke3cjte7Q3JaE9315Dm9DORgiyRheed7dlQcA5k=;
 b=1lxGHwK7uhkYpMF6AeWg+Gl20Pv0kD6xrMjb0BrOo7Y6Z8rAxl2F9xSAIDB6RFoWkH
 RFErJ0a8miy8P5g7dD5OQb1/P5Crjahd6pYLXC2uA0c5G2bIwKt+E/pjPwebXhB25FLr
 KGrALbJJK2rRwUdIq1J0DY00yhz4NfKVJlAqxs85onFgba1PNn3Wj8VSHXw+QUeVITV8
 sIHP+MwMHighCo5/vlCjMAf3p9o650AYy+WZ3KAeQEMA14P6YytbO+viSlJ/rl0jjicX
 +lU698wm9FFFrjDKdwIJkyIWj8CBI1XFxEPkj4YmMr0v56cj/XRS4nZg29cac5u+Vd6c
 DSYg==
X-Gm-Message-State: AOAM531qXxLFuz6edr6IxMMAvF9GQHlfJ2P1mS5/vGu5Qb7KDUq7R+JC
 DKN8a1r0Moi9oVCFsJJq1T6qqbgXS5SEhkT66CDtju8Z6Rsi/A==
X-Google-Smtp-Source: ABdhPJy3fEYEnFVIoHwOYfSV4ZicID4dTC0aDt6NA0cHi71Cx6Nk5betWseW3wPPuggsizOS1YwDJSlM/crjwUXRsTk=
X-Received: by 2002:a17:906:7c4:: with SMTP id
 m4mr4503713ejc.553.1633600827094; 
 Thu, 07 Oct 2021 03:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
 <20211004143650.699120-2-tvrtko.ursulin@linux.intel.com>
 <562d45e1-4a27-3252-f615-3ab1ef531f2b@huawei.com>
 <CAGsJ_4w5Y4=v93YmTrXJ6hDgjKshxiAZ-ox-Nz_7uRwe4ECtdw@mail.gmail.com>
 <8381e87d-ef7f-4759-569b-f6dabeb02939@linux.intel.com>
 <CAGsJ_4wF1SmDL6eoEXRB-NwGLALkwhj9wLC5JKaQJpaQx1=5ZA@mail.gmail.com>
 <382a4bd5-bb74-5928-be67-afbdc7aa3663@linux.intel.com>
 <6818e34e-d41c-67b7-85dd-76d2e47bc078@linux.intel.com>
In-Reply-To: <6818e34e-d41c-67b7-85dd-76d2e47bc078@linux.intel.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 7 Oct 2021 23:00:15 +1300
Message-ID: <CAGsJ_4zr7JAMCqgw7PqvRzc=haCzDVpsi7cyWXKHRG2H4MdPfw@mail.gmail.com>
Subject: Re: [RFC 1/8] sched: Add nice value change notifier
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: "Wanghui (John)" <john.wanghui@huawei.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 7, 2021 at 10:09 PM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 07/10/2021 09:50, Tvrtko Ursulin wrote:
> >
> > On 06/10/2021 21:21, Barry Song wrote:
> >> On Thu, Oct 7, 2021 at 2:44 AM Tvrtko Ursulin
> >> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>
> >>>
> >>> Hi,
> >>>
> >>> On 06/10/2021 08:58, Barry Song wrote:
> >>>> On Wed, Oct 6, 2021 at 5:15 PM Wanghui (John)
> >>>> <john.wanghui@huawei.com> wrote:
> >>>>>
> >>>>> HI Tvrtko
> >>>>>
> >>>>> On 2021/10/4 22:36, Tvrtko Ursulin wrote:
> >>>>>>     void set_user_nice(struct task_struct *p, long nice)
> >>>>>>     {
> >>>>>>         bool queued, running;
> >>>>>> -     int old_prio;
> >>>>>> +     int old_prio, ret;
> >>>>>>         struct rq_flags rf;
> >>>>>>         struct rq *rq;
> >>>>>>
> >>>>>> @@ -6915,6 +6947,9 @@ void set_user_nice(struct task_struct *p,
> >>>>>> long nice)
> >>>>>>
> >>>>>>     out_unlock:
> >>>>>>         task_rq_unlock(rq, p, &rf);
> >>>>>> +
> >>>>>> +     ret =3D atomic_notifier_call_chain(&user_nice_notifier_list,
> >>>>>> nice, p);
> >>>>>> +     WARN_ON_ONCE(ret !=3D NOTIFY_DONE);
> >>>>>>     }
> >>>>> How about adding a new "io_nice" to task_struct=EF=BC=8Cand move th=
e call
> >>>>> chain to
> >>>>> sched_setattr/getattr, there are two benefits:
> >>>>
> >>>> We already have an ionice for block io scheduler. hardly can this
> >>>> new io_nice
> >>>> be generic to all I/O. it seems the patchset is trying to link
> >>>> process' nice with
> >>>> GPU's scheduler, to some extent, it makes more senses than having a
> >>>> common ionice because we have a lot of IO devices in the systems, we
> >>>> don't
> >>>> know which I/O the ionice of task_struct should be applied to.
> >>>>
> >>>> Maybe we could have an ionice dedicated for GPU just like ionice for
> >>>> CFQ
> >>>> of bio/request scheduler.
> >>>
> >>> Thought crossed my mind but I couldn't see the practicality of a 3rd
> >>> nice concept. I mean even to start with I struggle a bit with the
> >>> usefulness of existing ionice vs nice. Like coming up with practical
> >>> examples of usecases where it makes sense to decouple the two
> >>> priorities.
> >>>
> >>>   From a different angle I did think inheriting CPU nice makes sense =
for
> >>> GPU workloads. This is because today, and more so in the future,
> >>> computations on a same data set do flow from one to the other.
> >>>
> >>> Like maybe a simple example of batch image processing where CPU decod=
es,
> >>> GPU does a transform and then CPU encodes. Or a different mix, doesn'=
t
> >>> really matter, since the main point it is one computing pipeline from
> >>> users point of view.
> >>>
> >>
> >> I am on it. but I am also seeing two problems here:
> >> 1. nice is not global in linux. For example, if you have two cgroups,
> >> cgroup A
> >> has more quota then cgroup B. Tasks in B won't win even if it has a
> >> lower nice.
> >> cgroups will run proportional-weight time-based division of CPU.
> >>
> >> 2. Historically, we had dynamic nice which was adjusted based on the
> >> average
> >> sleep/running time; right now, we don't have dynamic nice, but virtual
> >> time
> >> still make tasks which sleep more preempt other tasks with the same ni=
ce
> >> or even lower nice.
> >> virtual time +=3D physical time/weight by nice
> >> so, static nice number doesn't always make sense to decide preemption.
> >>
> >> So it seems your patch only works under some simple situation for exam=
ple
> >> no cgroups, tasks have similar sleep/running time.
> >
> > Yes, I broadly agree with your assessment. Although there are plans for
> > adding cgroup support to i915 scheduling, I doubt as fine grained
> > control and exact semantics as there are on the CPU side will happen.
> >
> > Mostly because the drive seems to be for more micro-controller managed
> > scheduling which adds further challenges in connecting the two sides
> > together.
> >
> > But when you say it is a problem, I would characterize it more a
> > weakness in terms of being only a subset of possible control. It is
> > still richer (better?) than what currently exists and as demonstrated
> > with benchmarks in my cover letter it can deliver improvements in user
> > experience. If in the mid term future we can extend it with cgroup
> > support then the concept should still apply and get closer to how you
> > described nice works in the CPU world.
> >
> > Main question in my mind is whether the idea of adding the
> > sched_attr/priority notifier to the kernel can be justified. Because as
> > mentioned before, everything apart from adjusting currently running GPU
> > jobs could be done purely in userspace. Stack changes would be quite
> > extensive and all, but that is not usually a good enough reason to put
> > something in the kernel. That's why it is an RFC an invitation to discu=
ss.
> >
> > Even ionice inherits from nice (see task_nice_ioprio()) so I think
> > argument can be made for drivers as well.
>
> Now that I wrote this, I had a little bit of a light bulb moment. If I
> abandon the idea of adjusting the priority of already submitted work
> items, then I can do much of what I want purely from within the confines
> of i915.
>
> I simply add code to inherit from current task nice on every new work
> item submission. This should probably bring the majority of the benefit
> I measured.

I think the idea makes sense to link the process's priority with the GPU's
scheduler. I have no doubt about this.
My question is more of what is the best way to implement this.

Android has bg_non_interactive cgroup with much lower weight for
background processes. interactive tasks, on the other hand, are placed
in another cgroup with much higer weight. So Android depends on
cgroup to improve user experience.

Chrome browser in your cover-letter uses nice to de-prioritise background
tabs.  this works perfectly as the whole chrome should be in the same
cgroup, so changing nice will improve/decrease the resource gotten by
tasks in this cgroup. But once we have two cgroups,  bringing this nice
belonging to the cgroup  to the global scheduler of GPU will somehow
break the aim.

For example, if we have two cgroup A and B
/sys/fs/cgroup/cpu$ sudo sh -c 'echo 4096 > A/cpu.shares'
/sys/fs/cgroup/cpu$ sudo sh -c 'echo 512 > B/cpu.shares'

task in B with lower nice will get more GPU than task in A. But actually A =
group
has 8X weight of B. So the result seems wrong. especially real users like
Android does depend on cgroup.
I don't know how to overcome this "weakness", it seems not easy.

>
> Regards,
>
> Tvrtko

Thanks
barry
