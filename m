Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A25E805A94
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7615110E59A;
	Tue,  5 Dec 2023 16:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6704A10E59A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 16:56:54 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-548f853fc9eso7538515a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 08:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701795413; x=1702400213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+tSnatXurhj334T7o40bU3YRBBZ1jj+JdLiwdM1Rc8A=;
 b=HoxA3rxJnVoHYF3tp7xYn4UYpLsHHPpNIjGSiiEpJQ8sa5vWEVtaiX8n8g+q3r8gyx
 YK2o8UVWEnoojxD6XluTUg1917W58PS1yOVIwkA5+eRBzcMmn9xQPlHwwKQY98m0wJWQ
 TRiOHU/sNembRYZfS3k8aOmC5Io9M2XyljSOViaC0v3l7IU1P4TczO7mg5+R4iT1ZSt+
 4hEFDKr/ifQsPJ026uV0yEnR+ievGnV54/LtXubnyQQ/Sb6FL8DuPEcX8CQmpx6cH7Lf
 1eqkkzAeH+KjfkwD5jPUryWxErTXyzpqjdpm7DTCt2gpEpA+n7ck6V7DaKWrrVa+PS0N
 i/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701795413; x=1702400213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+tSnatXurhj334T7o40bU3YRBBZ1jj+JdLiwdM1Rc8A=;
 b=Kof3bmiOGqmG8roKz/YBS30Gby2t+ZKgXGyNXOgE7rWi5RONSDeBj4d9XPweHkhQM4
 Lf/jQNdEPjRQ3ELHft2C5zVLcMwRCcDZFW+kgdep2xTxk5cIJaBTD5MRdVGOURuYLj3+
 +X2cgno4mzbV4cniuUQlPf48SvIHFyCZj0U1ShjOzqjoGwXHXUap0fooev4gkNSUsK7s
 7V5prwSp3KA2xmO7twmWUfHT7Arn3uRyopeMxK9l9FioI5hNr2WvNZ7pfbgUe1pzWwzn
 30SqDzOWS5QWWHqvEUic99asJyJOvbFqovC8MZhGdVK980YcotfLeWWJMiCZzmrVy1qJ
 RrJQ==
X-Gm-Message-State: AOJu0YyYxNDuGjkwISn9zlh9sgo1RXv/E6n2G0LB4H50XWYF0ckL99NM
 L1x3SDBldSRMUjPWW1vhxRRh4ZjNMDbZXH7YkJ51wuSzfPo=
X-Google-Smtp-Source: AGHT+IG307431IBWpNwuH08PWlep5xdN2M+f8DdbRLW+6MXm7xqgNtrg1jTJxQcWJN9R5yjh3KsY+lrJAMtzbsnUfPc=
X-Received: by 2002:a50:b412:0:b0:54b:67a7:efe5 with SMTP id
 b18-20020a50b412000000b0054b67a7efe5mr2421516edh.1.1701795412571; Tue, 05 Dec
 2023 08:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20230322224403.35742-1-robdclark@gmail.com>
 <b9fb81f1-ac9e-cf3f-5cf4-f2d972d3ed3d@amd.com>
 <CAF6AEGvMwZCLntfYeH3Vg_Z7kYynqdVrinp+pmcbREksK1WGMA@mail.gmail.com>
 <e2fa296b-9b71-a41b-d37d-33f0fac2cd4e@amd.com>
 <CAF6AEGvdVca_mnZVo9He9oKVfYp84e_kOPWaxX+K5aV4Es9kcQ@mail.gmail.com>
 <CAF6AEGt2D6Ei6OkUK5osz+jWzmkX8tmB1KGi305HaNd=bnQSoA@mail.gmail.com>
 <69d66b9e-5810-4844-a53f-08b7fd8eeccf@amd.com>
 <CAF6AEGuSexYVL2RF4yVCJptfJgN9vvTgzGWn3CminbsYvctTaw@mail.gmail.com>
 <96665cc5-01ab-4446-af37-e0f456bfe093@amd.com>
In-Reply-To: <96665cc5-01ab-4446-af37-e0f456bfe093@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 5 Dec 2023 08:56:40 -0800
Message-ID: <CAF6AEGtyUsARUTJb=+LwRQ96665tdcLLBxXH--18FDECuYOP6Q@mail.gmail.com>
Subject: Re: [RFC] drm/scheduler: Unwrap job dependencies
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 5, 2023 at 7:58=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 05.12.23 um 16:41 schrieb Rob Clark:
> > On Mon, Dec 4, 2023 at 10:46=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 04.12.23 um 22:54 schrieb Rob Clark:
> >>> On Thu, Mar 23, 2023 at 2:30=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> >>>> [SNIP]
> >>> So, this patch turns out to blow up spectacularly with dma_fence
> >>> refcnt underflows when I enable DRIVER_SYNCOBJ_TIMELINE .. I think,
> >>> because it starts unwrapping fence chains, possibly in parallel with
> >>> fence signaling on the retire path.  Is it supposed to be permissible
> >>> to unwrap a fence chain concurrently?
> >> The DMA-fence chain object and helper functions were designed so that
> >> concurrent accesses to all elements are always possible.
> >>
> >> See dma_fence_chain_walk() and dma_fence_chain_get_prev() for example.
> >> dma_fence_chain_walk() starts with a reference to the current fence (t=
he
> >> anchor of the walk) and tries to grab an up to date reference on the
> >> previous fence in the chain. Only after that reference is successfully
> >> acquired we drop the reference to the anchor where we started.
> >>
> >> Same for dma_fence_array_first(), dma_fence_array_next(). Here we hold=
 a
> >> reference to the array which in turn holds references to each fence
> >> inside the array until it is destroyed itself.
> >>
> >> When this blows up we have somehow mixed up the references somewhere.
> > That's what it looked like to me, but wanted to make sure I wasn't
> > overlooking something subtle.  And in this case, the fence actually
> > should be the syncobj timeline point fence, not the fence chain.
> > Virtgpu has essentially the same logic (there we really do want to
> > unwrap fences so we can pass host fences back to host rather than
> > waiting in guest), I'm not sure if it would blow up in the same way.
>
> Well do you have a backtrace of what exactly happens?
>
> Maybe we have some _put() before _get() or something like this.

I hacked up something to store the backtrace in dma_fence_release()
(and leak the block so the backtrace would still be around later when
dma_fence_get/put was later called) and ended up with:

[  152.811360] freed at:
[  152.813718]  dma_fence_release+0x30/0x134
[  152.817865]  dma_fence_put+0x38/0x98 [gpu_sched]
[  152.822657]  drm_sched_job_add_dependency+0x160/0x18c [gpu_sched]
[  152.828948]  drm_sched_job_add_syncobj_dependency+0x58/0x88 [gpu_sched]
[  152.835770]  msm_ioctl_gem_submit+0x580/0x1160 [msm]
[  152.841070]  drm_ioctl_kernel+0xec/0x16c
[  152.845132]  drm_ioctl+0x2e8/0x3f4
[  152.848646]  vfs_ioctl+0x30/0x50
[  152.851982]  __arm64_sys_ioctl+0x80/0xb4
[  152.856039]  invoke_syscall+0x8c/0x120
[  152.859919]  el0_svc_common.constprop.0+0xc0/0xdc
[  152.864777]  do_el0_svc+0x24/0x30
[  152.868207]  el0_svc+0x8c/0xd8
[  152.871365]  el0t_64_sync_handler+0x84/0x12c
[  152.875771]  el0t_64_sync+0x190/0x194

I suppose that doesn't guarantee that this was the problematic put.
But dropping this patch to unwrap the fence makes the problem go
away..

BR,
-R

> Thanks,
> Christian.
>
> >
> > BR,
> > -R
> >
> >> Regards,
> >> Christian.
> >>
> >>> BR,
> >>> -R
>
