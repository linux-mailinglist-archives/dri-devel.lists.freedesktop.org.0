Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E72862C5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBA76E93D;
	Wed,  7 Oct 2020 15:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652566E93D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 15:57:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h7so2814730wre.4
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vg1Ws4MhWlXYgvk+kefwrXUh9VaXt42EseA9bfGKUbM=;
 b=diOROvvwdYnAd8wA/PEnrM60ZVg1NmnpdTNOp7H4TP4pZBPtw41R+NjYYvG/hXN5fF
 YPGLcsA4z4C4HK9BNR4gq/rkUKs2Sv0wQCKGAnIhKXKCTQte1gR4JtcSwc3yZ6pSFg9p
 qbpIG2L5DNF2QExBYKd8bWxB0t9irR3EYrcep9eVM0Lb9S0kqwtN0akxVwL+RVhF5/Ty
 CWzdfoW3Nl3/rxVFLEBVq0bPXcUZW5BGLWwb8gSKqx+KnEVELJHHgpAra38UlG5rChuW
 2Vo+JTEQ6pa4oQRwg5PCVKBXNEFz3+5Pk8n6jnShbfzd4k7jY96HtjgMUxo54oG9xMY/
 3oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vg1Ws4MhWlXYgvk+kefwrXUh9VaXt42EseA9bfGKUbM=;
 b=RijtFQHbhGNdqiEydKQsbSLepW5VmM8Z5u9h0Vb8/0U29ANfHBOFKlG5YEAizI6mFF
 vkMz+rmczHOGNm2+7XGjBplnHBA7IQQfSUr0mbEFWXkBGnwHg1i4NRhwb/oWEvW7yQQZ
 kObGi9CjRniQAtcfl56y9kZdshqNtEOKSsLuDIclvnF6RZJAm45e6LKgqXJVTOvOnA+o
 CpSzZY/YkqPv9Hgz6FmILbH2es2raPnmg16l2ElLOzip7ZYraaUwOOt2XqFbRwu1p1NU
 zJMUU/O+Wk7ftNANybxMWnGCNdLfj6MKkP6z61x3QryE7NE7oNaR1032MhO5yDdmItvn
 9/bg==
X-Gm-Message-State: AOAM532npgeJ3DmFtg5adTiC6H94EUlbhEN2h1AMFGYSgqbTxoCQ/rm5
 pEfj9sH8NL08sVfTfNJ0cJaKMomBVlgvPFuC3fg=
X-Google-Smtp-Source: ABdhPJz74La7h4YyXBy45Dd6qntLkIjhIMG3fnYeWli9l6jfM32hUHr94RFHZr5ziyzq0yaav3Wyi1YBU0kmKtQ6QDI=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr4340936wrg.83.1602086252872; 
 Wed, 07 Oct 2020 08:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com>
 <20201002110105.e56qrvzoqfioi4hs@e107158-lin.cambridge.arm.com>
 <CAF6AEGvWMvZuy7CcGhzUSbwGtEkrNkzWHu_BN1cbdBJdZtvevA@mail.gmail.com>
 <20201005150024.mchfdtd62rlkuh4s@e107158-lin.cambridge.arm.com>
 <CAF6AEGs7NmCPyLdg+gg5jTTe-wgi2myRQ80tum6odv6tLLQ0DQ@mail.gmail.com>
 <20201006105918.v3xspb6xasjyy5ky@e107158-lin.cambridge.arm.com>
 <CAF6AEGu_V_EGcPQ+F_Z73cMCAcFPoM-GuiGWUPr+=6GD4Om=zg@mail.gmail.com>
 <20201007103653.qjohhta7douhlb22@e107158-lin.cambridge.arm.com>
In-Reply-To: <20201007103653.qjohhta7douhlb22@e107158-lin.cambridge.arm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 7 Oct 2020 08:57:20 -0700
Message-ID: <CAF6AEGsA_enFOUkV4Rw=Sxyjf=_oFLjwbz-Y4jTO=TUraOCzVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
To: Qais Yousef <qais.yousef@arm.com>
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
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Tim Murray <timmurray@google.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 7, 2020 at 3:36 AM Qais Yousef <qais.yousef@arm.com> wrote:
>
> On 10/06/20 13:04, Rob Clark wrote:
> > On Tue, Oct 6, 2020 at 3:59 AM Qais Yousef <qais.yousef@arm.com> wrote:
> > >
> > > On 10/05/20 16:24, Rob Clark wrote:
> > >
> > > [...]
> > >
> > > > > RT planning and partitioning is not easy task for sure. You might want to
> > > > > consider using affinities too to get stronger guarantees for some tasks and
> > > > > prevent cross-talking.
> > > >
> > > > There is some cgroup stuff that is pinning SF and some other stuff to
> > > > the small cores, fwiw.. I think the reasoning is that they shouldn't
> > > > be doing anything heavy enough to need the big cores.
> > >
> > > Ah, so you're on big.LITTLE type of system. I have done some work which enables
> > > biasing RT tasks towards big cores and control the default boost value if you
> > > have util_clamp and schedutil enabled. You can use util_clamp in general to
> > > help with DVFS related response time delays.
> > >
> > > I haven't done any work to try our best to pick a small core first but fallback
> > > to big if there's no other alternative.
> > >
> > > It'd be interesting to know how often you end up on a big core if you remove
> > > the affinity. The RT scheduler picks the first cpu in the lowest priority mask.
> > > So it should have this bias towards picking smaller cores first if they're
> > > in the lower priority mask (ie: not running higher priority RT tasks).
> >
> > fwiw, the issue I'm looking at is actually at the opposite end of the
> > spectrum, less demanding apps that let cpus throttle down to low
> > OPPs.. which stretches out the time taken at each step in the path
> > towards screen (which seems to improve the odds that we hit priority
> > inversion scenarios with SCHED_FIFO things stomping on important CFS
> > things)
>
> So you do have the problem of RT task preempting an important CFS task.
>
> >
> > There is a *big* difference in # of cpu cycles per frame between
> > highest and lowest OPP..
>
> To combat DVFS related delays, you can use util clamp.
>
> Hopefully this article helps explain it if you didn't come across it before
>
>         https://lwn.net/Articles/762043/
>
> You can use sched_setattr() to set SCHED_FLAG_UTIL_CLAMP_MIN for a task. This
> will guarantee everytime this task is running it'll appear it has at least
> this utilization value, so schedutil governor (which must be used for this to
> work) will pick up the right performance point (OPP).
>
> The scheduler will try its best to make sure that the task will run on a core
> that meets the minimum requested performance point (hinted by setting
> uclamp_min).

Yeah, I think we will end up making some use of uclamp.. there is
someone else working on that angle

But without it, this is a case that exposes legit prioritization
problems with commit_work which we should fix ;-)

BR,
-R

>
> Thanks
>
> --
> Qais Yousef
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
