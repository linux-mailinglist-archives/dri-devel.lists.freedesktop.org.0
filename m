Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8334517AD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 23:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7006E10C;
	Mon, 15 Nov 2021 22:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864F86E10C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 22:38:04 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id p18so5916362wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I4iSlBSK1hD4R1ojVYNsa9j12bGxWBPvCni9UhOZi7g=;
 b=TOm5CS+8FVjliw98bcU5ohkWnrViqM4ak/2eU5p5DsYptfOGs6xDKHNfbn9Myb0C9V
 QhMWEH+nmZqRM5UpM3yZZQhnP02zidrz74PyVJPt2jis/eEEEL4/VdCMAcMmNXgPz0S3
 RE+hP1lx/ju9TB5PPf4m1M7kO2/nqs1mw+pgHqxgDpQBIG0ER6cDPhj2AY8DyF527e1c
 1KZbXuRe1j4X0RlbBJUVZgDr8owrk0Ud9GsT+2XircFh4lJQoMnhUX63PcVW1S2T7pYT
 9LC79RJ8Q4YKUmh9w9M3wQKuqwXz90wXaKt14T9D+jYFIE37mJoXWsNsWpl1CdwS2y3z
 uLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I4iSlBSK1hD4R1ojVYNsa9j12bGxWBPvCni9UhOZi7g=;
 b=ldlCkXOnhyyTEADb1xGxFeMS9C10kD58GQEZIJ5XgI5OHC4xlum4swvozVpXbXIo3r
 3zBbh5m+EDsE3TNVeI7SEhlmzeTe4WEywzrXhlPnAZj0CDni2SiW0p0WzlbXbDUEScRU
 d4q9M6Q/O4R5xd+E4cuCReHCBjtQpqqxxagCCfGh20+uziPge05clPx1cfuC2LeiiwTm
 qG3foz7r10WVDHUi2E3gWu2wDIdDCaDbxaZ2pr+5wLts8qlaQpmha46Wwv/C9dGsd9rW
 dM7zU8VTnUNZ1+p72mFsfrMdP7yer0W7QXp6RvpNzYAaBHsmCrq/gPjZlRVxaMySdHtO
 K7pA==
X-Gm-Message-State: AOAM533tUeAnRCFgSDApovSFxI0sOKVG/PCbkQt5WiJmh9/fNS4OPBQG
 mO/Wh4fT9jRm191R87pC/9IlBzzUc8wGwRJQrz8=
X-Google-Smtp-Source: ABdhPJy6/+M4xDKVZCyVzVkdLEsjVG/c6uqgba+lpgeYkHA8t57g/qoD8n2yhAkmu9N/nCV8pWmsMPGhUiISSa285EI=
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr2185892wmq.168.1637015882952; 
 Mon, 15 Nov 2021 14:38:02 -0800 (PST)
MIME-Version: 1.0
References: <20211114234045.cc5tearljna2ywij@core>
 <CAPj87rPxtQVQnrs0BiXy0H1viF-oMNeCCP_Aptsxt_sgeK+CpA@mail.gmail.com>
 <CAKMK7uGd+W3yOr2wGRREW08pcX=g1UPvkX4n13dVo7YdQ4dpxg@mail.gmail.com>
 <20211115160436.llmlb3j6quts2frz@core> <20211115161634.jkgfmknuvlkbzkbp@core>
In-Reply-To: <20211115161634.jkgfmknuvlkbzkbp@core>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 15 Nov 2021 14:43:06 -0800
Message-ID: <CAF6AEGs7ncX8O78_R5sr3pr=z1H3gUTNSJdQOF22_Qr_VY5hTQ@mail.gmail.com>
Subject: Re: Panic with linus/master and panfrost
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 8:16 AM Ond=C5=99ej Jirman <megi@xff.cz> wrote:
>
> On Mon, Nov 15, 2021 at 05:04:36PM +0100, megi xff wrote:
> > On Mon, Nov 15, 2021 at 04:05:02PM +0100, Daniel Vetter wrote:
> > > You need
> > >
> > > commit 13e9e30cafea10dff6bc8d63a38a61249e83fd65
> > > Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Date:   Mon Oct 18 21:27:55 2021 +0200
> > >
> > >    drm/scheduler: fix drm_sched_job_add_implicit_dependencies
> >
> > Thank you, that fixed the panic. :)
>
> I spoke too soon. Panic is gone, but I still see (immediately after
> starting Xorg):
>
> [   13.290795] ------------[ cut here ]------------
> [   13.291103] refcount_t: addition on 0; use-after-free.
> [   13.291495] WARNING: CPU: 5 PID: 548 at lib/refcount.c:25 refcount_war=
n_saturate+0x98/0x140
> [   13.292124] Modules linked in:
> [   13.292285] CPU: 5 PID: 548 Comm: Xorg Not tainted 5.16.0-rc1-00414-g2=
1a254904a26 #29
> [   13.292857] Hardware name: Pine64 PinePhonePro (DT)
> [   13.293172] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   13.293669] pc : refcount_warn_saturate+0x98/0x140
> [   13.293977] lr : refcount_warn_saturate+0x98/0x140
> [   13.294285] sp : ffff8000129a3b50
> [   13.294464] x29: ffff8000129a3b50 x28: ffff8000129a3d50 x27: ffff00001=
7ec4b00
> [   13.294979] x26: 0000000000000001 x25: 0000000000000001 x24: ffff00001=
27cca48
> [   13.295494] x23: ffff000017d19b00 x22: 000000000000000a x21: 000000000=
0000001
> [   13.296006] x20: ffff000017e15500 x19: ffff000012980580 x18: 000000000=
0000003
> [   13.296520] x17: 0000000000000000 x16: 0000000000000000 x15: ffff80001=
29a3b58
> [   13.297033] x14: ffffffffffffffff x13: 2e656572662d7265 x12: 7466612d6=
5737520
> [   13.297546] x11: 3b30206e6f206e6f x10: ffff800011d6e8a0 x9 : ffff80001=
022f37c
> [   13.298059] x8 : 00000000ffffefff x7 : ffff800011dc68a0 x6 : 000000000=
0000001
> [   13.298573] x5 : 0000000000000000 x4 : ffff0000f77a9788 x3 : ffff0000f=
77b56f0
> [   13.299085] x2 : ffff0000f77a9788 x1 : ffff8000e5eb1000 x0 : 000000000=
000002a
> [   13.299600] Call trace:
> [   13.299704]  refcount_warn_saturate+0x98/0x140
> [   13.299981]  drm_sched_job_add_implicit_dependencies+0x90/0xdc
> [   13.300385]  panfrost_job_push+0xd0/0x1d4
> [   13.300628]  panfrost_ioctl_submit+0x34c/0x440
> [   13.300906]  drm_ioctl_kernel+0x9c/0x154
> [   13.301142]  drm_ioctl+0x1f0/0x410
> [   13.301330]  __arm64_sys_ioctl+0xb4/0xdc
> [   13.301566]  invoke_syscall+0x4c/0x110
> [   13.301787]  el0_svc_common.constprop.0+0x48/0xf0
> [   13.302090]  do_el0_svc+0x2c/0x90
> [   13.302271]  el0_svc+0x14/0x50
> [   13.302431]  el0t_64_sync_handler+0x9c/0x120
> [   13.302693]  el0t_64_sync+0x158/0x15c
> [   13.302904] ---[ end trace 8c211e57f89714c8 ]---
> [   13.303211] ------------[ cut here ]------------
> [   13.303504] refcount_t: underflow; use-after-free.
> [   13.303820] WARNING: CPU: 5 PID: 548 at lib/refcount.c:28 refcount_war=
n_saturate+0xec/0x140
> [   13.304439] Modules linked in:
> [   13.304596] CPU: 5 PID: 548 Comm: Xorg Tainted: G        W         5.1=
6.0-rc1-00414-g21a254904a26 #29
> [   13.305286] Hardware name: Pine64 PinePhonePro (DT)
> [   13.305600] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   13.306095] pc : refcount_warn_saturate+0xec/0x140
> [   13.306402] lr : refcount_warn_saturate+0xec/0x140
> [   13.306710] sp : ffff8000129a3b70
> [   13.306887] x29: ffff8000129a3b70 x28: ffff8000129a3d50 x27: ffff00001=
7ec4b00
> [   13.307401] x26: 0000000000000001 x25: 0000000000000001 x24: 000000000=
0000000
> [   13.307914] x23: 00000000ffffffff x22: ffff0000129807c0 x21: ffff00001=
2980580
> [   13.308428] x20: ffff000017c54d00 x19: 0000000000000000 x18: 000000000=
0000003
> [   13.308942] x17: 0000000000000000 x16: 0000000000000000 x15: ffff80001=
29a3b58
> [   13.309454] x14: ffffffffffffffff x13: 2e656572662d7265 x12: 7466612d6=
5737520
> [   13.309967] x11: 3b776f6c66726564 x10: ffff800011d6e8a0 x9 : ffff80001=
017893c
> [   13.310480] x8 : 00000000ffffefff x7 : ffff800011dc68a0 x6 : 000000000=
0000001
> [   13.310993] x5 : ffff0000f77a9788 x4 : 0000000000000000 x3 : 000000000=
0000027
> [   13.311506] x2 : 0000000000000023 x1 : ffff0000f77a9790 x0 : 000000000=
0000026
> [   13.312020] Call trace:
> [   13.312123]  refcount_warn_saturate+0xec/0x140
> [   13.312401]  dma_resv_add_excl_fence+0x1a8/0x1bc
> [   13.312700]  panfrost_job_push+0x174/0x1d4
> [   13.312949]  panfrost_ioctl_submit+0x34c/0x440
> [   13.313229]  drm_ioctl_kernel+0x9c/0x154
> [   13.313464]  drm_ioctl+0x1f0/0x410
> [   13.313651]  __arm64_sys_ioctl+0xb4/0xdc
> [   13.313884]  invoke_syscall+0x4c/0x110
> [   13.314103]  el0_svc_common.constprop.0+0x48/0xf0
> [   13.314405]  do_el0_svc+0x2c/0x90
> [   13.314586]  el0_svc+0x14/0x50
> [   13.314745]  el0t_64_sync_handler+0x9c/0x120
> [   13.315007]  el0t_64_sync+0x158/0x15c
> [   13.315217] ---[ end trace 8c211e57f89714c9 ]---
>
> In dmesg. So this looks like some independent issue.
>


I'm seeing something similar with drm/msm, which is, I think, due to
the introduction and location of call to drm_sched_job_arm().. I'm
still trying to untangle where it should go, but I think undoing
357285a2d1c0 ("drm/msm: Improve drm/sched point of no return rules")
would fix it

BR,
-R
