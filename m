Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C98B5F708D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 23:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A54110E680;
	Thu,  6 Oct 2022 21:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E6710E680
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 21:52:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id ot12so7545391ejb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8+A+zIRy16QFTg+cmAx3TJyR+vU5d527KfHF2GB4dYI=;
 b=RIXXgpbKNH2W/Yc9juS3FkGjTsnvHzENyObFcZmjVP/qG2cZQgr+SOdUoivIdKIreq
 GDYswOUP6UjobhIrUX1wihL03F5iWROBKC6MtjT0olnERcVnPOCpltKwXbiFo5c09i9X
 nTL5V2YpMBliT6zZ5R+ww6+QSdseqbquKtUaXqLwYsKje4+mGFgcmYHTowhEOs8y22ly
 AN887D4pOL0u3g+z+XejxJcYy5YJmK9bx+7kL4aJNVQKjdDaRmP93zLwYLzJQXNoWVDs
 kn8+tsHtTBDWmeLIoIx7Z0WMDxfgZ/Q96Ehu4l13SgyQ7b6y0OZiJ8yEvkU6L8/wDEfp
 azeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+A+zIRy16QFTg+cmAx3TJyR+vU5d527KfHF2GB4dYI=;
 b=AIhO2T3s1Ga4gvtl9u5mgqaXl169YaGRVLxTQXRokBtJIyLeIYFipTG4ESPLglL3Ae
 BesgJMmpm3VJb+0C+8oahcNV120m9KvH4xgOji2XfhlWDcjLW74GZjBoys2SR9rqAAPY
 B2CjTPPpzCYfIgBg3K6jhgAA/S0cuTFe1lCerLIAnFd1kTxD7HoJQpLtTEU+Uu4Vpqea
 LrYyxzn/e3hX01nFFr9vcTIYJ0A51o88w1t/ELeI6M7I/vQ2HXbBp+y1yMQHSVH6MIYz
 ab3D+wLqwfM+SiiIufC6tknjZWSO+MNdOKq4EaUy+TvFTFKXYc3ihiFyZ9NZmUNts+3v
 H8hA==
X-Gm-Message-State: ACrzQf3cSEvFuHDZCBOKG4k2V8VuUpiA6T5YkJxD4aybLPlk9rCOfZaF
 6c4+VQRqlegnKuol9UcCqr6Qb1fZI0VKy2/uCeM=
X-Google-Smtp-Source: AMsMyM6MrbuBaIzviWyIpo7LEtpXE8fYeSpkcuj1C5cQ6/GCjFgxYdxwQbGI17FJ2cBGZAbYznxSdPocQac1QxRdPlo=
X-Received: by 2002:a17:907:980a:b0:78d:282f:1607 with SMTP id
 ji10-20020a170907980a00b0078d282f1607mr1526388ejc.511.1665093167478; Thu, 06
 Oct 2022 14:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
 <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
 <CADnq5_N0Ef+1VUoDLdpHfJXqZFuPYbx5Lq+94NWciHcQC+VrMg@mail.gmail.com>
 <CAPM=9tyAOnzwXyyPuoceZ1mimAkzxR-63YmKfVtcQX=swywNvg@mail.gmail.com>
 <CAPM=9tyL=J26aHdhSSK0jwYQLHBf8jjTMvJmj1cQheUF=wpd-Q@mail.gmail.com>
In-Reply-To: <CAPM=9tyL=J26aHdhSSK0jwYQLHBf8jjTMvJmj1cQheUF=wpd-Q@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 7 Oct 2022 07:52:35 +1000
Message-ID: <CAPM=9tx8tjzz5q4gkLbh=R+xO5x-8QQOB9E=GAXrV6=-r844-A@mail.gmail.com>
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

On Fri, 7 Oct 2022 at 07:41, Dave Airlie <airlied@gmail.com> wrote:
>
> On Fri, 7 Oct 2022 at 06:24, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Fri, 7 Oct 2022 at 06:14, Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Thu, Oct 6, 2022 at 3:48 PM Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > >
> > > > On Thu, Oct 6, 2022 at 12:28 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > >
> > > > > Maybe you are seeing this which is an issue with GPU TLB flushes which
> > > > > is kind of sporadic:
> > > > > https://gitlab.freedesktop.org/drm/amd/-/issues/2113
> > > >
> > > > Well, that seems to be 5.19, and while timing changes (or whatever
> > > > other software updates) could have made it start trigger, this machine
> > > > has been pretty solid otgerwise.
> > > >
> > > > > Are you seeing any GPU page faults in your kernel log?
> > > >
> > > > Nothing even remotely like that "no-retry page fault" in that issue
> > > > report. Of course, if it happens just before the whole thing locks
> > > > up...
> > >
> > > Your chip is too old to support retry faults so it's likely you could
> > > be just seeing a GPU page fault followed by a hang.  Your chip also
> > > lacks a paging queue, so you would be affected by the TLB issue.
> >
> >
> > Okay I got my FIJI running Linus tree and netconsole to blow up like
> > this, running fedora 36 desktop, steam, firefox, and then I ran
> > poweroff over ssh.
> >
> > [ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000000000088
> > [ 1234.778782] #PF: supervisor read access in kernel mode
> > [ 1234.778787] #PF: error_code(0x0000) - not-present page
> > [ 1234.778791] PGD 0 P4D 0
> > [ 1234.778798] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > [ 1234.778803] CPU: 7 PID: 805 Comm: systemd-journal Not tainted 6.0.0+ #2
> > [ 1234.778809] Hardware name: System manufacturer System Product
> > Name/PRIME X370-PRO, BIOS 5603 07/28/2020
> > [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sched]
> > [ 1234.778828] Code: aa 0f 1d ce e9 57 ff ff ff 48 89 d7 e8 9d 8f 3f
> > ce e9 4a ff ff ff 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41 54 55 53
> > 48 89 fb <48> 8b af 88 00 00 00 f0 ff 8d f0 00 00 00 48 8b 85 80 01 00
> > 00 f0
> > [ 1234.778834] RSP: 0000:ffffabe680380de0 EFLAGS: 00010087
> > [ 1234.778839] RAX: ffffffffc04e9230 RBX: 0000000000000000 RCX: 0000000000000018
> > [ 1234.778897] RDX: 00000ba278e8977a RSI: ffff953fb288b460 RDI: 0000000000000000
> > [ 1234.778901] RBP: ffff953fb288b598 R08: 00000000000000e0 R09: ffff953fbd98b808
> > [ 1234.778905] R10: 0000000000000000 R11: ffffabe680380ff8 R12: ffffabe680380e00
> > [ 1234.778908] R13: 0000000000000001 R14: 00000000ffffffff R15: ffff953fbd9ec458
> > [ 1234.778912] FS:  00007f35e7008580(0000) GS:ffff95428ebc0000(0000)
> > knlGS:0000000000000000
> > [ 1234.778916] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [ 1234.778919] CR2: 0000000000000088 CR3: 000000010147c000 CR4: 00000000003506e0
> > [ 1234.778924] Call Trace:
> > [ 1234.778981]  <IRQ>
> > [ 1234.778989]  dma_fence_signal_timestamp_locked+0x6a/0xe0
> > [ 1234.778999]  dma_fence_signal+0x2c/0x50
> > [ 1234.779005]  amdgpu_fence_process+0xc8/0x140 [amdgpu]
> > [ 1234.779234]  sdma_v3_0_process_trap_irq+0x70/0x80 [amdgpu]
> > [ 1234.779395]  amdgpu_irq_dispatch+0xa9/0x1d0 [amdgpu]
> > [ 1234.779609]  amdgpu_ih_process+0x80/0x100 [amdgpu]
> > [ 1234.779783]  amdgpu_irq_handler+0x1f/0x60 [amdgpu]
> > [ 1234.779940]  __handle_irq_event_percpu+0x46/0x190
> > [ 1234.779946]  handle_irq_event+0x34/0x70
> > [ 1234.779949]  handle_edge_irq+0x9f/0x240
> > [ 1234.779954]  __common_interrupt+0x66/0x100
> > [ 1234.779960]  common_interrupt+0xa0/0xc0
> > [ 1234.779965]  </IRQ>
> > [ 1234.779968]  <TASK>
> > [ 1234.779971]  asm_common_interrupt+0x22/0x40
> > [ 1234.779976] RIP: 0010:finish_mkwrite_fault+0x22/0x110
> > [ 1234.779981] Code: 1f 84 00 00 00 00 00 90 0f 1f 44 00 00 41 55 41
> > 54 55 48 89 fd 53 48 8b 07 f6 40 50 08 0f 84 eb 00 00 00 48 8b 45 30
> > 48 8b 18 <48> 89 df e8 66 bd ff ff 48 85 c0 74 0d 48 89 c2 83 e2 01 48
> > 83 ea
> > [ 1234.779985] RSP: 0000:ffffabe680bcfd78 EFLAGS: 00000202
> >
> > I'll see if I can dig any.
>
> I'm kicking the tires on the drm-next tree just prior to submission,
> and in an attempt to make myself look foolish and to tempt fate, it
> seems stable.

Yay it worked, crashed drm-next. will start reverting down the rabbit hole.

Dave.
