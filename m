Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6FA05E8B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 15:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB6710E8C1;
	Wed,  8 Jan 2025 14:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nUqe4NUk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEF410E8C1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 14:27:24 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2f45244a81fso3350172a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736346384; x=1736951184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TsqA36vBJ8+Wn0ZKm6NU71Jfq0aRMEF+66QnH98WXwI=;
 b=nUqe4NUkqVmxiE2JfPBRi8Zzn4gJ5jGb9wvp5xUGxE9KtPZdNWWS968k6A6dIx5BlR
 1ZWpE4H+LhPnjfodqBgYDr1JreZnaoJlKXeiSiHz+UjGQyj8PYvO0p+qkuRkpxJzYKtb
 HHHPJr+3mBZksaN59NGvfy+ddTOPy2hZK5IhGVnezsZzoIRL/KhNUOIVVaCFf4Dar7x2
 wURRorhq4+xIbo042hJjb/zdVV/nUhk5eMtrSGnIbwfLyjVjChmGIhzKZ8WFKAeLwaMF
 6FvIZR8IdRKMVfU5AFe38UmDoBl3GIzP3ErS20TJpSvkYUOERSBQKg7oMaxZ9AnH1uFA
 rKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736346384; x=1736951184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TsqA36vBJ8+Wn0ZKm6NU71Jfq0aRMEF+66QnH98WXwI=;
 b=VZJF6rIu7OwQfftbALSgUxC5qdeSbsd5U7j8RVV2R8JeddvcaGXq8ivnm0LMewcZD+
 gGO1Y//Gv0cO/JUJ0U44uCcE+f4LNpEmDS8d5W4PgPq7VfdKKRaKi7I7WJ3IwqEAkjqG
 XNlB7zIrrA/kUKWhzMlU83fy+sjsfAZz0j84tuz9sWt+j5Lxo/UkVpkbzvt9Sm74TWNQ
 h/zDeVF+jc1GZaDMOSyyobWkqnAI6RYLi60FKY948W/UxSSa/NTU6Szt2i66FLn30wWY
 m5aVMvpQ6G9hp2qgJPGVgdIoEk5+0fOZCjVaGPUGXmAYUDNOYv7Q0QmX3h5ozph2V9tI
 gyZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcxrqLc+1E51f0JlaokrDGzDDZAcTy8cIa+aDoVekf9SM//H76GbNXjp7ngZ9lg6BlLGGIf5pvPuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyN9wTHO2f/agcY4v6Xzb4babxje9kSBGfGxvYQfGGpU3fjarky
 7T/uWED82vgWMiOo3PTalnK/mtrzTpXPpJby6gnfxZ1FZmOWiGndQjLbokKgH8F10mJ2IJPCbWx
 zHbiQ9fnVxEdGv37xORkmzzUN8z0=
X-Gm-Gg: ASbGncuj4Y9AnW8T2HCb4ipngAig/HaBMXfWrvlnP8De5K9lZxIo3BMuvzHS1my/rsH
 j7w9PxbdkR7/maY6n+5mteThG1O6qt+5vzja3ww==
X-Google-Smtp-Source: AGHT+IHpq471zYii9KF1Zb3SeXcpf018rsOYGS3/6Yqw9jvzdfLXs7Nkd9ye1CUZBfYxvhWRc7hALnBLOKgcDijXcuQ=
X-Received: by 2002:a17:90a:f945:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-2f548eb3faamr1618582a91.3.1736346383657; Wed, 08 Jan 2025
 06:26:23 -0800 (PST)
MIME-Version: 1.0
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
In-Reply-To: <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Jan 2025 09:26:12 -0500
X-Gm-Features: AbW1kvbafrTcQR6QDbtV1tY0G9EkixNc4CiwFkloE7CvT2WzXlr-_1CpDZrKi0g
Message-ID: <CADnq5_PAG662SODmS8cSg7jcyh8ZQRgcWMtgjx5RZbuUE7j3Og@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Nirmoy Das <nirmoy.das@amd.com>, 
 Simona Vetter <simona@ffwll.ch>
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

On Tue, Jan 7, 2025 at 9:09=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 07.01.25 um 15:02 schrieb Philipp Reisner:
> > The following OOPS plagues me on about every 10th suspend and resume:
> >
> > [160640.791304] BUG: kernel NULL pointer dereference, address: 00000000=
00000008
> > [160640.791309] #PF: supervisor read access in kernel mode
> > [160640.791311] #PF: error_code(0x0000) - not-present page
> > [160640.791313] PGD 0 P4D 0
> > [160640.791316] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> > [160640.791320] CPU: 12 UID: 1001 PID: 648526 Comm: kscreenloc:cs0 Tain=
ted: G           OE      6.11.7-300.fc41.x86_64 #1
> > [160640.791324] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
> > [160640.791325] Hardware name: Micro-Star International Co., Ltd. MS-7A=
38/B450M PRO-VDH MAX (MS-7A38), BIOS B.B0 02/03/2021
> > [160640.791327] RIP: 0010:drm_sched_job_arm+0x23/0x60 [gpu_sched]
> > [160640.791337] Code: 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 5=
5 53 48 8b 6f 60 48 85 ed 74 3f 48 89 fb 48 89 ef e8 31 39 00 00 48 8b 45 1=
0 <48> 8b 50 08 48 89 53 18 8b 45 24 89 43 5c b8 01 00 00 00 f0 48 0f
> > [160640.791340] RSP: 0018:ffffb2ef5e6cb9b8 EFLAGS: 00010206
> > [160640.791342] RAX: 0000000000000000 RBX: ffff9d804cc62800 RCX: ffff9d=
784020f0d0
> > [160640.791344] RDX: 0000000000000000 RSI: ffff9d784d3b9cd0 RDI: ffff9d=
784020f638
> > [160640.791345] RBP: ffff9d784020f610 R08: ffff9d78414e4268 R09: 207265=
6c75646568
> > [160640.791346] R10: 686373205d6d7264 R11: 632072656c756465 R12: 000000=
0000000000
> > [160640.791347] R13: 0000000000000001 R14: ffffb2ef5e6cba38 R15: 000000=
0000000000
> > [160640.791349] FS:  00007f8f30aca6c0(0000) GS:ffff9d873ec00000(0000) k=
nlGS:0000000000000000
> > [160640.791351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [160640.791352] CR2: 0000000000000008 CR3: 000000069de82000 CR4: 000000=
0000350ef0
> > [160640.791354] Call Trace:
> > [160640.791357]  <TASK>
> > [160640.791360]  ? __die_body.cold+0x19/0x27
> > [160640.791367]  ? page_fault_oops+0x15a/0x2f0
> > [160640.791372]  ? exc_page_fault+0x7e/0x180
> > [160640.791376]  ? asm_exc_page_fault+0x26/0x30
> > [160640.791380]  ? drm_sched_job_arm+0x23/0x60 [gpu_sched]
> > [160640.791384]  ? drm_sched_job_arm+0x1f/0x60 [gpu_sched]
> > [160640.791390]  amdgpu_cs_ioctl+0x170c/0x1e40 [amdgpu]
> > [160640.792011]  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
> > [160640.792341]  drm_ioctl_kernel+0xb0/0x100
> > [160640.792346]  drm_ioctl+0x28b/0x540
> > [160640.792349]  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
> > [160640.792673]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
> > [160640.792994]  __x64_sys_ioctl+0x94/0xd0
> > [160640.792999]  do_syscall_64+0x82/0x160
> > [160640.793006]  ? __count_memcg_events+0x75/0x130
> > [160640.793009]  ? count_memcg_events.constprop.0+0x1a/0x30
> > [160640.793014]  ? handle_mm_fault+0x21b/0x330
> > [160640.793016]  ? do_user_addr_fault+0x55a/0x7b0
> > [160640.793020]  ? exc_page_fault+0x7e/0x180
> > [160640.793023]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >
> > The OOPS happens because the rq member of entity is NULL in
> > drm_sched_job_arm() after the call to drm_sched_entity_select_rq().
> >
> > In drm_sched_entity_select_rq(), the code considers that
> > drb_sched_pick_best() might return a NULL value. When NULL, it assigns
> > NULL to entity->rq even if it had a non-NULL value before.
> >
> > drm_sched_job_arm() does not deal with entities having a rq of NULL.
> >
> > Fix this by leaving the entity on the engine it was instead of
> > assigning a NULL to its run queue member.
>
> Well that is clearly not the correct approach to fixing this. So clearly
> a NAK from my side.
>
> The real question is why is amdgpu_cs_ioctl() called when all of
> userspace should be frozen?
>

Could this be due to amdgpu setting sched->ready when the rings are
finished initializing from long ago rather than when the scheduler has
been armed?

Alex


> Regards,
> Christian.
>
> >
> > Link: https://retrace.fedoraproject.org/faf/reports/1038619/
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3746
> > Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
> > ---
> >   drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++++----
> >   1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index a75eede8bf8d..495bc087588b 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -557,10 +557,12 @@ void drm_sched_entity_select_rq(struct drm_sched_=
entity *entity)
> >
> >       spin_lock(&entity->rq_lock);
> >       sched =3D drm_sched_pick_best(entity->sched_list, entity->num_sch=
ed_list);
> > -     rq =3D sched ? sched->sched_rq[entity->priority] : NULL;
> > -     if (rq !=3D entity->rq) {
> > -             drm_sched_rq_remove_entity(entity->rq, entity);
> > -             entity->rq =3D rq;
> > +     if (sched) {
> > +             rq =3D sched->sched_rq[entity->priority];
> > +             if (rq !=3D entity->rq) {
> > +                     drm_sched_rq_remove_entity(entity->rq, entity);
> > +                     entity->rq =3D rq;
> > +             }
> >       }
> >       spin_unlock(&entity->rq_lock);
> >
>
