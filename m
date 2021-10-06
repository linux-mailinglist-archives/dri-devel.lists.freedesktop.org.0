Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E9B424E14
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 09:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6AF6F39D;
	Thu,  7 Oct 2021 07:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAB96EE65;
 Wed,  6 Oct 2021 20:22:06 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g8so14339283edt.7;
 Wed, 06 Oct 2021 13:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eDub8eH+T0FGGXCo6yfeGfJ6YqWnTRGI/yA4UgLkRz8=;
 b=kzpaV5LuhHsG8wpdKws61cbnBXVnLeSVOdVO+kinpV9VcvNbKc1kr224zlvq9LVQj+
 Sx6cBexDIALtWv+0V2OAFlQCA+Mn9T0lOWa75wNlioAtOn7t3tsBKseu9nTnM2up1OmR
 qhXpgwFTCtYaEqXEGlMT4UOYnwOb4MGXcGniqrWo+5E8I0MNShqTovYZYTsuba14eT1/
 N+4EbUjRY1Z3r17bRRBgOvF15jqWG1a2yQfsnIxfBmedfdBKBh+qCU8uJkc1tra/lwqX
 NzS+wiOcu0awQdrHJbdc2JAuKJqmiJjoW9QNdafUX1JNVh6oTJl0EQ/+KBEaTcTX3LlG
 aOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eDub8eH+T0FGGXCo6yfeGfJ6YqWnTRGI/yA4UgLkRz8=;
 b=rCRZ8wvd0EMHfkSuXJANs89bQjDwNjQjFLQrAYB0aZqiLEAcxweNeya7wNFe0jX50w
 SBePsJB4C/97MA8UXOktgutKWPWDz99Rmgy7Vk+b4tJwSppA6aTtarxu8EH8LKhNnWQk
 wOIfA5Va/uZm/0TSi0FaSCuu/fKy/CE7pUOshAQVIyFwPZXeAHUoqZf3HXnc2lJsoHqq
 knXxJ7FMmS+yZejkDxkTkAMIL4dD8S078Z8Ycza1tH1Keu4URhUR12Kg86BA1PUCGq51
 hJM4GsyRsNaMADjYxnaXOi78Zvo/FhqY1o1bADVgty7NLGMa+n9fUjj4PoQ6wutdJ+TB
 AsjA==
X-Gm-Message-State: AOAM533W8sKRvqDMgtzAN6u8S0w6dLfDjzNqoreiLdENKsOs8pjDWa2o
 EKDQCgvwN/08NBGIvKSuQyishDhMbFg0vLxNlQQ=
X-Google-Smtp-Source: ABdhPJxgPXZl9MwohSbQf1ii3BbLP5RORN2+VhjeZXA3IwsjTiPAzL7sGdva5j0+lrnyga/D7BnEgxYJx6AefoCmDVk=
X-Received: by 2002:a17:906:713:: with SMTP id
 y19mr374790ejb.506.1633551725020; 
 Wed, 06 Oct 2021 13:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211004143650.699120-1-tvrtko.ursulin@linux.intel.com>
 <20211004143650.699120-2-tvrtko.ursulin@linux.intel.com>
 <562d45e1-4a27-3252-f615-3ab1ef531f2b@huawei.com>
 <CAGsJ_4w5Y4=v93YmTrXJ6hDgjKshxiAZ-ox-Nz_7uRwe4ECtdw@mail.gmail.com>
 <8381e87d-ef7f-4759-569b-f6dabeb02939@linux.intel.com>
In-Reply-To: <8381e87d-ef7f-4759-569b-f6dabeb02939@linux.intel.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 7 Oct 2021 09:21:53 +1300
Message-ID: <CAGsJ_4wF1SmDL6eoEXRB-NwGLALkwhj9wLC5JKaQJpaQx1=5ZA@mail.gmail.com>
Subject: Re: [RFC 1/8] sched: Add nice value change notifier
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: "Wanghui (John)" <john.wanghui@huawei.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, 
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 07 Oct 2021 07:28:22 +0000
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

On Thu, Oct 7, 2021 at 2:44 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> Hi,
>
> On 06/10/2021 08:58, Barry Song wrote:
> > On Wed, Oct 6, 2021 at 5:15 PM Wanghui (John) <john.wanghui@huawei.com>=
 wrote:
> >>
> >> HI Tvrtko
> >>
> >> On 2021/10/4 22:36, Tvrtko Ursulin wrote:
> >>>    void set_user_nice(struct task_struct *p, long nice)
> >>>    {
> >>>        bool queued, running;
> >>> -     int old_prio;
> >>> +     int old_prio, ret;
> >>>        struct rq_flags rf;
> >>>        struct rq *rq;
> >>>
> >>> @@ -6915,6 +6947,9 @@ void set_user_nice(struct task_struct *p, long =
nice)
> >>>
> >>>    out_unlock:
> >>>        task_rq_unlock(rq, p, &rf);
> >>> +
> >>> +     ret =3D atomic_notifier_call_chain(&user_nice_notifier_list, ni=
ce, p);
> >>> +     WARN_ON_ONCE(ret !=3D NOTIFY_DONE);
> >>>    }
> >> How about adding a new "io_nice" to task_struct=EF=BC=8Cand move the c=
all chain to
> >> sched_setattr/getattr, there are two benefits:
> >
> > We already have an ionice for block io scheduler. hardly can this new i=
o_nice
> > be generic to all I/O. it seems the patchset is trying to link
> > process' nice with
> > GPU's scheduler, to some extent, it makes more senses than having a
> > common ionice because we have a lot of IO devices in the systems, we do=
n't
> > know which I/O the ionice of task_struct should be applied to.
> >
> > Maybe we could have an ionice dedicated for GPU just like ionice for CF=
Q
> > of bio/request scheduler.
>
> Thought crossed my mind but I couldn't see the practicality of a 3rd
> nice concept. I mean even to start with I struggle a bit with the
> usefulness of existing ionice vs nice. Like coming up with practical
> examples of usecases where it makes sense to decouple the two priorities.
>
>  From a different angle I did think inheriting CPU nice makes sense for
> GPU workloads. This is because today, and more so in the future,
> computations on a same data set do flow from one to the other.
>
> Like maybe a simple example of batch image processing where CPU decodes,
> GPU does a transform and then CPU encodes. Or a different mix, doesn't
> really matter, since the main point it is one computing pipeline from
> users point of view.
>

I am on it. but I am also seeing two problems here:
1. nice is not global in linux. For example, if you have two cgroups, cgrou=
p A
has more quota then cgroup B. Tasks in B won't win even if it has a lower n=
ice.
cgroups will run proportional-weight time-based division of CPU.

2. Historically, we had dynamic nice which was adjusted based on the averag=
e
sleep/running time; right now, we don't have dynamic nice, but virtual time
still make tasks which sleep more preempt other tasks with the same nice
or even lower nice.
virtual time +=3D physical time/weight by nice
so, static nice number doesn't always make sense to decide preemption.

So it seems your patch only works under some simple situation for example
no cgroups, tasks have similar sleep/running time.

> In this example perhaps everything could be handled in userspace so
> that's another argument to be had. Userspace could query the current
> scheduling attributes before submitting work to the processing pipeline
> and adjust using respective uapi.
>
> Downside would be inability to react to changes after the work is
> already running which may not be too serious limitation outside the
> world of multi-minute compute workloads. And latter are probably special
> case enough that would be configured explicitly.
>
> >>
> >> 1. Decoupled with fair scheduelr. In our use case, high priority tasks=
 often
> >>      use rt scheduler.
> >
> > Is it possible to tell GPU RT as we are telling them CFS nice?
>
> Yes of course. We could create a common notification "data packet" which
> would be sent from both entry points and provide more data than just the
> nice value. Consumers (of the notifier chain) could then decide for
> themselves what they want to do with the data.

RT should have the same problem with CFS once we have cgroups.

>
> Regards,
>
> Tvrtko
>
> >
> >> 2. The range of value don't need to be bound to -20~19 or 0~139
> >>
> >
> > could build a mapping between the priorities of process and GPU. It see=
ms
> > not a big deal.
> >
> > Thanks
> > barry
> >

Thanks
barry
