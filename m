Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C2E6D2681
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 19:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6AC10E212;
	Fri, 31 Mar 2023 17:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64F910E212
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 17:19:51 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-177b78067ffso23890549fac.7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 10:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680283191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GuD9zsUXJqtpwSnwgSTtCKCUKriUXpO/tqNoKk33Pc=;
 b=OkUeja7Zwe36kts2msy+0j9QJahOAgyGUXxKXUWGahxycSfeEras5iPq4SWa+leQij
 U3j+94FXtxe+ejx7aA5iWG/+4V92ppkLVFaHRNimNENoAXukhBWRnrIZKqP8LuA2nrHl
 8ypLQwasaf63Hq/Q+l/V6gXiP7+XFquJVrFRbBYiJBHA1wsr1JTWgQ7OKXEBKHx1wfwW
 2+f6YjQ6TO+dXfhOfaJ+xSvTX0Riq/GBCXQRJdNIFAhnE/Vc+Ka2F74Mfk44chSr/nZF
 0MeBK1I4bI/72BOxiHFpcW7c+PeUpP1pPuQvp0EwaVG9b54P968ar1HCGoIELVJUBqN/
 lemw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680283191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GuD9zsUXJqtpwSnwgSTtCKCUKriUXpO/tqNoKk33Pc=;
 b=G5LXLDD8z4L79mXVc1Afx9diAxQdflLB0HDsjt9QWhnzAZFWyBT3/Hg3PVDjjwyQ1b
 8s1zIApU2uVW1LPVJEZ+zZgXl68b4Y1NJinrA1vycDhb+TwDnBofSK+wIx62b3Pu2PHt
 +4FVImjg5CzqzuVCMwhxdQTMOxnWAiAbQZr8YtZMA1jVjhlCCSdORbAE0kA99cEPlpI7
 /O6vswjZmfah+asUX8dv2wSlwkvB4mH8wJIPX1PLgTTePG/DjmMAy5h9j3ghpnr+lUe1
 9ZIIPuw3tqUmoCKf5fVk5N7HAavnQW1T3he+n5lC/Br4j5330hpdsyD9zLeeOrUdBY0c
 y3jg==
X-Gm-Message-State: AAQBX9epit4+mxDb7cQPz+HoZxWHW+jMM7rPdUSBaiSlWGFRsMI76pka
 RVa/CslV6H6CkeGi1jnCH7xDFf84Kd/oyfGdaqo=
X-Google-Smtp-Source: AKy350bK/Pmuk7UtqvB6dq0XLjV0luCrILqaslMdUZlyqKdkdm74sn1cQcUTUrLYJGu2FCppDmobxtDi81/OgpgeOgo=
X-Received: by 2002:a05:6870:4f:b0:17e:8d4b:da49 with SMTP id
 15-20020a056870004f00b0017e8d4bda49mr7116664oaz.5.1680283190771; Fri, 31 Mar
 2023 10:19:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221202172330.39219-1-Arvind.Yadav@amd.com>
In-Reply-To: <20221202172330.39219-1-Arvind.Yadav@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 31 Mar 2023 10:19:39 -0700
Message-ID: <CAF6AEGvc7J=sEa0WeuCPcb9HrX=DJwz9yeaVgHZHsUhVX_7AZQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/sched: Use parent fence instead of finished"
To: Arvind Yadav <Arvind.Yadav@amd.com>
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
Cc: andrey.grodzovsky@amd.com, Andy.Dong@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 2, 2022 at 9:24=E2=80=AFAM Arvind Yadav <Arvind.Yadav@amd.com> =
wrote:
>
> This reverts commit e4dc45b1848bc6bcac31eb1b4ccdd7f6718b3c86.
>
>     This is causing instability on Linus' desktop, and Observed System
>     hung  when running MesaGL benchmark or VK CTS runs.
>
>     netconsole got me the following oops:
>     [ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000=
000000088
>     [ 1234.778782] #PF: supervisor read access in kernel mode
>     [ 1234.778787] #PF: error_code(0x0000) - not-present page
>     [ 1234.778791] PGD 0 P4D 0
>     [ 1234.778798] Oops: 0000 [#1] PREEMPT SMP NOPTI
>     [ 1234.778803] CPU: 7 PID: 805 Comm: systemd-journal Not tainted 6.0.=
0+ #2
>     [ 1234.778809] Hardware name: System manufacturer System Product
>     Name/PRIME X370-PRO, BIOS 5603 07/28/2020
>     [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sch=
ed]
>     [ 1234.778828] Code: aa 0f 1d ce e9 57 ff ff ff 48 89 d7 e8 9d 8f 3f
>     ce e9 4a ff ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 54 55 53
>     48 89 fb <48> 8b af 88 00 00 00 f0 ff 8d f0 00 00 00 48 8b 85 80 01 0=
0
>     00 f0
>     [ 1234.778834] RSP: 0000:ffffabe680380de0 EFLAGS: 00010087
>     [ 1234.778839] RAX: ffffffffc04e9230 RBX: 0000000000000000 RCX: 00000=
00000000018
>     [ 1234.778897] RDX: 00000ba278e8977a RSI: ffff953fb288b460 RDI: 00000=
00000000000
>     [ 1234.778901] RBP: ffff953fb288b598 R08: 00000000000000e0 R09: ffff9=
53fbd98b808
>     [ 1234.778905] R10: 0000000000000000 R11: ffffabe680380ff8 R12: ffffa=
be680380e00
>     [ 1234.778908] R13: 0000000000000001 R14: 00000000ffffffff R15: ffff9=
53fbd9ec458
>     [ 1234.778912] FS:  00007f35e7008580(0000) GS:ffff95428ebc0000(0000)
>     knlGS:0000000000000000
>     [ 1234.778916] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     [ 1234.778919] CR2: 0000000000000088 CR3: 000000010147c000 CR4: 00000=
000003506e0
>     [ 1234.778924] Call Trace:
>     [ 1234.778981]  <IRQ>
>     [ 1234.778989]  dma_fence_signal_timestamp_locked+0x6a/0xe0
>     [ 1234.778999]  dma_fence_signal+0x2c/0x50
>     [ 1234.779005]  amdgpu_fence_process+0xc8/0x140 [amdgpu]
>     [ 1234.779234]  sdma_v3_0_process_trap_irq+0x70/0x80 [amdgpu]
>     [ 1234.779395]  amdgpu_irq_dispatch+0xa9/0x1d0 [amdgpu]
>     [ 1234.779609]  amdgpu_ih_process+0x80/0x100 [amdgpu]
>     [ 1234.779783]  amdgpu_irq_handler+0x1f/0x60 [amdgpu]
>     [ 1234.779940]  __handle_irq_event_percpu+0x46/0x190
>     [ 1234.779946]  handle_irq_event+0x34/0x70
>     [ 1234.779949]  handle_edge_irq+0x9f/0x240
>     [ 1234.779954]  __common_interrupt+0x66/0x100
>     [ 1234.779960]  common_interrupt+0xa0/0xc0
>     [ 1234.779965]  </IRQ>
>     [ 1234.779968]  <TASK>
>     [ 1234.779971]  asm_common_interrupt+0x22/0x40
>     [ 1234.779976] RIP: 0010:finish_mkwrite_fault+0x22/0x110
>     [ 1234.779981] Code: 1f 84 00 00 00 00 00 90 0f 1f 44 00 00 41 55 41
>     54 55 48 89 fd 53 48 8b 07 f6 40 50 08 0f 84 eb 00 00 00 48 8b 45 30
>     48 8b 18 <48> 89 df e8 66 bd ff ff 48 85 c0 74 0d 48 89 c2 83 e2 01 4=
8
>     83 ea
>     [ 1234.779985] RSP: 0000:ffffabe680bcfd78 EFLAGS: 00000202
>
>     Revert it for now and figure it out later.

Just fwiw, the issue here is a race against sched_main observing that
the hw fence is signaled and doing job_cleanup and the driver retiring
the job.  I don't think there is a sane way to use the parent fence
without having this race condition so the "figure it out later" is
"don't do that" ;-)

BR,
-R

> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 820c0c5544e1..ea7bfa99d6c9 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -790,7 +790,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *s=
ched)
>         job =3D list_first_entry_or_null(&sched->pending_list,
>                                        struct drm_sched_job, list);
>
> -       if (job && dma_fence_is_signaled(job->s_fence->parent)) {
> +       if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>                 /* remove job from pending_list */
>                 list_del_init(&job->list);
>
> @@ -802,7 +802,7 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *s=
ched)
>
>                 if (next) {
>                         next->s_fence->scheduled.timestamp =3D
> -                               job->s_fence->parent->timestamp;
> +                               job->s_fence->finished.timestamp;
>                         /* start TO timer for next job */
>                         drm_sched_start_timeout(sched);
>                 }
> --
> 2.25.1
>
