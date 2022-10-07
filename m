Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9E5F751D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 10:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F6A10E427;
	Fri,  7 Oct 2022 08:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D04F10E34F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 08:16:42 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 m11-20020a4aab8b000000b00476743c0743so3020017oon.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 01:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Di7HyMkQ1E5qdHPfa+7YWbbUBvN3xbsSG/cDo7IAkDM=;
 b=MrjLo8ie8GdfLRNcCwYP5fd4Q8VT22NK7ZwfJ17iLQAZJ9+7gATFex7M0FKKDUuR3p
 HZ0+65Ulq5X9CkhVjYINZ3IBF2bxUszQxbX2jltmOe0Q1T2gQZU9tCILNTD04E5H24AA
 LZtUbWi6BPJgVwbdob0xrdtB2q7zk3bTa75xQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Di7HyMkQ1E5qdHPfa+7YWbbUBvN3xbsSG/cDo7IAkDM=;
 b=5Z3qdGtDankq8xyJ35bM/cD34nboowzPtLf1DphMb3tDMxOoV4iCCLJmFA8ZbfPBf/
 YgMUSJLHaW+loP7ZoxcYqYeEJyINqBtiZvIGy0posk2yGOqjmJsYLNbvvmLiZUUfjyg3
 2GryivIbFvf1UCXfjsipSUsPYubg83euRU5yoixCBfYmZCIw3RPv2RSX/2gN4EnScSdN
 o1mA4fZw2cBpKFHZTu8BWuotAVP0XFogRU3OPyKI/rGz19HJRl1TCVcj4tudZM2P3fnk
 elvUIN0ivXYsNIYqUxK574fWbtZiaBp/+EQHsUgzIoSu43VpAfoF4qLWraaEOQ+6XzLo
 X+RQ==
X-Gm-Message-State: ACrzQf3/mWVmFoTA2nm2jB9cbyHeESjLNyQRwIIMMOpbygd3CT+vB7TQ
 l7DvpjafnNMKSKwcMTyqVIw1NMXUPtBD5VviWZQPuA==
X-Google-Smtp-Source: AMsMyM6D/ujZCVrCawKe24O9hlJkW/1k8D/yf07qQC8qmpaJMrLx21hxKX6v+Ob9BOFyfWPYZ+C5z3wKbop+/7TtMbo=
X-Received: by 2002:a9d:7f14:0:b0:659:2de8:2148 with SMTP id
 j20-20020a9d7f14000000b006592de82148mr1575777otq.321.1665130601752; Fri, 07
 Oct 2022 01:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
 <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
 <CADnq5_N0Ef+1VUoDLdpHfJXqZFuPYbx5Lq+94NWciHcQC+VrMg@mail.gmail.com>
 <CAPM=9tyAOnzwXyyPuoceZ1mimAkzxR-63YmKfVtcQX=swywNvg@mail.gmail.com>
 <CAHk-=wgghR4N-4XWjoK18NDkvjBL7i00ab8+otQg955pNGG_dQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgghR4N-4XWjoK18NDkvjBL7i00ab8+otQg955pNGG_dQ@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 7 Oct 2022 10:16:30 +0200
Message-ID: <CAKMK7uF_fKs=Ge5b3sCxa3YgWFaJsLBdCQVj+fDn6ukh9GvKKA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Oct 2022 at 01:45, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Oct 6, 2022 at 1:25 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> >
> > [ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000000000088
> > [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sched]
>
> As far as I can tell, that's the line
>
>         struct drm_gpu_scheduler *sched = s_fence->sched;
>
> where 's_fence' is NULL. The code is
>
>    0: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
>    5: 41 54                push   %r12
>    7: 55                    push   %rbp
>    8: 53                    push   %rbx
>    9: 48 89 fb              mov    %rdi,%rbx
>    c:* 48 8b af 88 00 00 00 mov    0x88(%rdi),%rbp <-- trapping instruction
>   13: f0 ff 8d f0 00 00 00 lock decl 0xf0(%rbp)
>   1a: 48 8b 85 80 01 00 00 mov    0x180(%rbp),%rax
>
> and that next 'lock decl' instruction would have been the
>
>         atomic_dec(&sched->hw_rq_count);
>
> at the top of drm_sched_job_done().
>
> Now, as to *why* you'd have a NULL s_fence, it would seem that
> drm_sched_job_cleanup() was called with an active job. Looking at that
> code, it does
>
>         if (kref_read(&job->s_fence->finished.refcount)) {
>                 /* drm_sched_job_arm() has been called */
>                 dma_fence_put(&job->s_fence->finished);
>         ...
>
> but then it does
>
>         job->s_fence = NULL;
>
> anyway, despite the job still being active. The logic of that kind of
> "fake refcount" escapes me. The above looks fundamentally racy, not to
> say pointless and wrong (a refcount is a _count_, not a flag, so there
> could be multiple references to it, what says that you can just
> decrement one of them and say "I'm done").

Just figured I'll clarify this, because it's indeed a bit wtf and the
comment doesn't explain much. drm_sched_job_cleanup can be called both
when a real job is being cleaned up (which holds a full reference on
job->s_fence and needs to drop it) and to simplify error path in job
constructions (and the "is this refcount initialized already" signals
what exactly needs to be cleaned up or not). So no race, because the
only times this check goes different is when job construction has
failed before the job struct is visible by any other thread.

But yeah the comment could actually explain what's going on here :-)

And yeah the patch Dave reverted screws up the cascade of references
that ensures this all stays alive until drm_sched_job_cleanup is
called on active jobs, so looks all reasonable to me. Some Kunit tests
maybe to exercise these corners? Not the first time pure scheduler
code blew up, so proably worth the effort.
-Daniel

>
> Now, _why_ any of that happens, I have no idea. I'm just looking at
> the immediate "that pointer is NULL" thing, and reacting to what looks
> like a completely bogus refcount pattern.
>
> But that odd refcount pattern isn't new, so it's presumably some user
> on the amd gpu side that changed.
>
> The problem hasn't happened again for me, but that's not saying a lot,
> since it was very random to begin with.
>
>                  Linus



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
