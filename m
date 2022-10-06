Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECD85F707A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 23:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2079A10E4FF;
	Thu,  6 Oct 2022 21:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E99C10E4FF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 21:41:26 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g27so4611245edf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 14:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t+BFfG9yghXPurL6NLe/D4YtZuRs9YqZY2gHzJt8FhE=;
 b=jLrZe1SovfLM4D+6+aoKJUrnQr/D3YdaBT0jWcQsx1tRRtJmcXAERvt+FCQm0xkzzE
 bPu13fjvf+mkVolvK8pzrEECPJ00aoH04dkcY9nrbXGj+HHGzhXk89hchQUrcohMypBW
 Kpp2UpDMmSk/w3F0Pof4cFLqHPJ9uVeS4NB+0FGhXUaxgN7ZDNu2Hx1EKKQkQqhnMv4F
 nYB6MMV5ddoJSfvi1/C41sbXb84s6gJGoHvnJ59JW3ewu1ladLC0q2Ufp7QV4kj7xfvh
 CFfmAQFPZbtNDq7F07kyv4ZvUoK9dCsP2W2GEqMNnJ9q1YZrUcdELqoEuBxSmD1LcABO
 0OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t+BFfG9yghXPurL6NLe/D4YtZuRs9YqZY2gHzJt8FhE=;
 b=EXXtHfHUwSp+eBGycwEpymVu71v4UOHA9CNs9K71mlp/wa5f8996nt9iuQgtZbCiUV
 dGMxURgtN6AmZLMK3nNm+v/Lo4PRilKBjsgO6cCal2P8o56RnhtxAfRKLfGDJX/1bI7N
 sqvHNHO1VWT7tQQfGMeFqLFbQG/vE1ohyRuDT8beHAUi2t1pfZYG4vkV4sipIrs+FsKc
 byFyhvRO/HcB+pzUsCyppdJGRiqrYYNg1SL3wvHU6ZBzhEJj3oCv0E1SGptsD6T+/QnS
 TTt73mJqOttQH4DPUfr+3tToSFVb0cHNpyMEze2MUVMOco2GEtC3tPItqzWMNFVEtihV
 PZbQ==
X-Gm-Message-State: ACrzQf0KXRnFJlgwF9NIIRRlZM+oskNKLvgmnkOVXdKc+866Z9DWgcYO
 3F193mFY+S0jWulmOnAFmcGVEGh5bzW7vBmhYa0=
X-Google-Smtp-Source: AMsMyM4uRknQwBd24MUgt2cGgmDnI1lRLbQ9FeMEosCjl5yBMVmNtwOI2sxATbsixLzVUV4oRip3wWrEc/JTJvnXT/Y=
X-Received: by 2002:a05:6402:51cb:b0:459:f3f9:2a20 with SMTP id
 r11-20020a05640251cb00b00459f3f92a20mr1709129edd.74.1665092483560; Thu, 06
 Oct 2022 14:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
 <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
 <CADnq5_N0Ef+1VUoDLdpHfJXqZFuPYbx5Lq+94NWciHcQC+VrMg@mail.gmail.com>
 <CAPM=9tyAOnzwXyyPuoceZ1mimAkzxR-63YmKfVtcQX=swywNvg@mail.gmail.com>
In-Reply-To: <CAPM=9tyAOnzwXyyPuoceZ1mimAkzxR-63YmKfVtcQX=swywNvg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Oct 2022 07:41:11 +1000
Message-ID: <CAPM=9tyL=J26aHdhSSK0jwYQLHBf8jjTMvJmj1cQheUF=wpd-Q@mail.gmail.com>
Subject: Re: [git pull] drm for 6.1-rc1
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 Oct 2022 at 06:24, Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 7 Oct 2022 at 06:14, Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Thu, Oct 6, 2022 at 3:48 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > On Thu, Oct 6, 2022 at 12:28 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > >
> > > > Maybe you are seeing this which is an issue with GPU TLB flushes which
> > > > is kind of sporadic:
> > > > https://gitlab.freedesktop.org/drm/amd/-/issues/2113
> > >
> > > Well, that seems to be 5.19, and while timing changes (or whatever
> > > other software updates) could have made it start trigger, this machine
> > > has been pretty solid otgerwise.
> > >
> > > > Are you seeing any GPU page faults in your kernel log?
> > >
> > > Nothing even remotely like that "no-retry page fault" in that issue
> > > report. Of course, if it happens just before the whole thing locks
> > > up...
> >
> > Your chip is too old to support retry faults so it's likely you could
> > be just seeing a GPU page fault followed by a hang.  Your chip also
> > lacks a paging queue, so you would be affected by the TLB issue.
>
>
> Okay I got my FIJI running Linus tree and netconsole to blow up like
> this, running fedora 36 desktop, steam, firefox, and then I ran
> poweroff over ssh.
>
> [ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000000000088
> [ 1234.778782] #PF: supervisor read access in kernel mode
> [ 1234.778787] #PF: error_code(0x0000) - not-present page
> [ 1234.778791] PGD 0 P4D 0
> [ 1234.778798] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [ 1234.778803] CPU: 7 PID: 805 Comm: systemd-journal Not tainted 6.0.0+ #2
> [ 1234.778809] Hardware name: System manufacturer System Product
> Name/PRIME X370-PRO, BIOS 5603 07/28/2020
> [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sched]
> [ 1234.778828] Code: aa 0f 1d ce e9 57 ff ff ff 48 89 d7 e8 9d 8f 3f
> ce e9 4a ff ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 54 55 53
> 48 89 fb <48> 8b af 88 00 00 00 f0 ff 8d f0 00 00 00 48 8b 85 80 01 00
> 00 f0
> [ 1234.778834] RSP: 0000:ffffabe680380de0 EFLAGS: 00010087
> [ 1234.778839] RAX: ffffffffc04e9230 RBX: 0000000000000000 RCX: 0000000000000018
> [ 1234.778897] RDX: 00000ba278e8977a RSI: ffff953fb288b460 RDI: 0000000000000000
> [ 1234.778901] RBP: ffff953fb288b598 R08: 00000000000000e0 R09: ffff953fbd98b808
> [ 1234.778905] R10: 0000000000000000 R11: ffffabe680380ff8 R12: ffffabe680380e00
> [ 1234.778908] R13: 0000000000000001 R14: 00000000ffffffff R15: ffff953fbd9ec458
> [ 1234.778912] FS:  00007f35e7008580(0000) GS:ffff95428ebc0000(0000)
> knlGS:0000000000000000
> [ 1234.778916] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1234.778919] CR2: 0000000000000088 CR3: 000000010147c000 CR4: 00000000003506e0
> [ 1234.778924] Call Trace:
> [ 1234.778981]  <IRQ>
> [ 1234.778989]  dma_fence_signal_timestamp_locked+0x6a/0xe0
> [ 1234.778999]  dma_fence_signal+0x2c/0x50
> [ 1234.779005]  amdgpu_fence_process+0xc8/0x140 [amdgpu]
> [ 1234.779234]  sdma_v3_0_process_trap_irq+0x70/0x80 [amdgpu]
> [ 1234.779395]  amdgpu_irq_dispatch+0xa9/0x1d0 [amdgpu]
> [ 1234.779609]  amdgpu_ih_process+0x80/0x100 [amdgpu]
> [ 1234.779783]  amdgpu_irq_handler+0x1f/0x60 [amdgpu]
> [ 1234.779940]  __handle_irq_event_percpu+0x46/0x190
> [ 1234.779946]  handle_irq_event+0x34/0x70
> [ 1234.779949]  handle_edge_irq+0x9f/0x240
> [ 1234.779954]  __common_interrupt+0x66/0x100
> [ 1234.779960]  common_interrupt+0xa0/0xc0
> [ 1234.779965]  </IRQ>
> [ 1234.779968]  <TASK>
> [ 1234.779971]  asm_common_interrupt+0x22/0x40
> [ 1234.779976] RIP: 0010:finish_mkwrite_fault+0x22/0x110
> [ 1234.779981] Code: 1f 84 00 00 00 00 00 90 0f 1f 44 00 00 41 55 41
> 54 55 48 89 fd 53 48 8b 07 f6 40 50 08 0f 84 eb 00 00 00 48 8b 45 30
> 48 8b 18 <48> 89 df e8 66 bd ff ff 48 85 c0 74 0d 48 89 c2 83 e2 01 48
> 83 ea
> [ 1234.779985] RSP: 0000:ffffabe680bcfd78 EFLAGS: 00000202
>
> I'll see if I can dig any.

I'm kicking the tires on the drm-next tree just prior to submission,
and in an attempt to make myself look foolish and to tempt fate, it
seems stable.

This might mean a silent merge conflict/regression, I'll bash on the
drm-next tree a lot more and see if I can play spot the difference.

Dave.
