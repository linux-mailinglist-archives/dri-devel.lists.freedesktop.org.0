Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017D7878FED
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 09:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F45510FA90;
	Tue, 12 Mar 2024 08:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=klervi.com header.i=@klervi.com header.b="n+JeDqkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC8EC10FA90
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 08:46:49 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-41332865abfso3611015e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 01:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=klervi.com; s=google; t=1710233208; x=1710838008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NNwAuf3xKbCs7LgkxRoAfBG44V8t0JvPJ1MnxJHQkm4=;
 b=n+JeDqkF8YbAvKynNNhcnuXLsyRZ6+LaT8S2a/oclSpo8WA7MXr/tlJ9rT1nEqZQDq
 V7C5jnR5S+PxRdkqC3ovwX3CKtMG00uhdfkY9TQDlTIhxNLCTQZHaH6kB+zwLHW0xAx/
 4vCfhWBQqnXP+JtJ7m8ztZ9RkDXlzlc8oKyok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710233208; x=1710838008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NNwAuf3xKbCs7LgkxRoAfBG44V8t0JvPJ1MnxJHQkm4=;
 b=wK78lGukqbPKgrohd0YlwawA1f+B8sDDsxh63FQhcmWhERHgwvao6v1VHyIc4CfOTJ
 vLk/FDvVlfygAXoqRoJPr5XHBl3CKTy2WDeP4tlHseA7fa65v0ebfValgBBAsSYY/2y5
 hYj0EMcvEd5bA7thsY2nLv3GHa5AtloTumDYy4QW10fNP3au9oZd00qJ4qtA5B0F/pv2
 M9WUfSDJeh/QunpJMrJiJQr0fctjDNPo5qMTgf2QD7tfCk4rsy5BFBOPbMW+e2omXJUa
 0vvMcDV8H6gPYMedHJv1z0Oe7pJP0f0xDDEnh1Add5iOKbrtu94UOTuTa+rC3Ilmf1/w
 yuOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCULnzZQIib1K5vTxtzI3iaXlmoINgBJdkRtG/qnsDSY5lYQknswkpuMl3luYZYx9SgXdiTq+kUlUC7M4wE8loY/A5GC25nGi4o9nEopyQ14
X-Gm-Message-State: AOJu0YzLJnVjkYoIoLUt6merTQWQKV9rnpv3lO19rv1dwYUXATCnASJA
 dw9LCs9jmickvccu33/1rfQ+g/l020EgURGRFGCVBMyLGI9MB1W9qcEzBibDoUV23XpYGLNUs/+
 faPG4otUuKxnc/7j/2kcHvtGfMvLemEbKUiFw4qLwNJHfAnPGKG7lkhzp0jJOeGRn3VIWnzcLtn
 uXt9bzB/QcHY0Zko9TFIi6OY1qDR5yqtvfBnjVW3SgoH62Cs7A+12+FFTkJo13Nexets49cEANr
 D2SP9nddeA87dO9woIulGT0uYLNXnd9y0vNh2eATKuqtm4QuA==
X-Google-Smtp-Source: AGHT+IHFRYoj1ujPIjrnnD2FdqnX3CgjhCyRszbS+OoWbBKnqV0VQDAPUhZMkwUH8x2LE/bRi3VOog==
X-Received: by 2002:a05:600c:314d:b0:413:1f57:a312 with SMTP id
 h13-20020a05600c314d00b004131f57a312mr864272wmo.11.1710232889062; 
 Tue, 12 Mar 2024 01:41:29 -0700 (PDT)
Received: from cadmium.klervi.com (fourier.klervi.com. [91.90.98.42])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b00412f2136793sm18557523wmq.44.2024.03.12.01.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Mar 2024 01:41:28 -0700 (PDT)
From: Pierre-Louis Dourneau <pl.dourneau@klervi.com>
To: Ludovic.Desroches@microchip.com, sam@ravnborg.org, bbrezillon@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Manikandan.M@microchip.com
Cc: Pierre-Louis Dourneau <pl.dourneau@klervi.com>, b.alcaina@klervi.com,
 a.lahache@klervi.com, n.georges@klervi.com
Subject: Re: [PATCH] drm/atmel-hlcdc: Release CRTC commit when destroying
 plane state
Date: Tue, 12 Mar 2024 09:40:15 +0100
Message-Id: <20240312084016.36136-1-pl.dourneau@klervi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <5856fbbb-2b51-4609-ae7a-d920648567b1@microchip.com>
References: <20240306194935.11871-1-pl.dourneau@klervi.com>,
 <5856fbbb-2b51-4609-ae7a-d920648567b1@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hey Ludovic,

On 3/8/24, Ludovic.Desroches@microchip.com <Ludovic.Desroches@microchip.com> wrote:
> On 3/6/24 20:49, Pierre-Louis Dourneau wrote:
> >
> > From: Arnaud Lahache <a.lahache@klervi.com>
> >
> > Fixes a memory leak occurring on each modeset update.
> >
> > Running a program such as libdrm's modetest[0] with this driver exhausts
> > all available memory after a few minutes. Enabling kmemleak yields a series
> > of such leak reports:
> >
> > unreferenced object 0xc21acf40 (size 64):
> >    comm "modetest", pid 210, jiffies 4294942460 (age 331.240s)
> >    hex dump (first 32 bytes):
> >      00 a0 a1 c1 01 00 00 00 ff ff ff ff 4c cf 1a c2  ............L...
> >      4c cf 1a c2 ff ff ff ff 58 cf 1a c2 58 cf 1a c2  L.......X...X...
> >    backtrace:
> >      [<d68b3e09>] kmalloc_trace+0x18/0x24
> >      [<f858a020>] drm_atomic_helper_setup_commit+0x1e0/0x7e0
> >      [<26e8ab04>] drm_atomic_helper_commit+0x40/0x160
> >      [<49708b0c>] drm_atomic_commit+0xa8/0xf0
> >      [<e58c2942>] drm_mode_obj_set_property_ioctl+0x154/0x3d8
> >      [<5e97e57d>] drm_ioctl+0x200/0x3c4
> >      [<ed514ba1>] sys_ioctl+0x240/0xb48
> >      [<26aab344>] ret_fast_syscall+0x0/0x44
> >
> > drm_atomic_helper_setup_commit() acquires a reference to a drm_crtc_commit
> > for each CRTC and associated connectors and planes involved in a modeset.
> > 64-byte leaks map well to the size of a drm_crtc_commit on 32-bit
> > architectures, and the second 4-byte chunk in the hex dump above awfully
> > looks like a reference count.
> >
> > We tracked this missing reference decrement down to the driver's
> > atmel_hlcdc_plane_atomic_destroy_state() callback. Its CRTC counterpart,
> > atmel_hlcdc_crtc_destroy_state(), calls into the drm_atomic helpers and
> > properly releases its references to the commit. Planes didn't. Using the
> > default helper for that purpose, __drm_atomic_helper_plane_destroy_state(),
> > fixes the leak and avoids reimplementing the same logic in the driver.
> >
> > [0]: https://gitlab.freedesktop.org/mesa/drm/-/tree/main/tests/modetest
> >       Invoke with `modetest -M atmel-hlcdc -s 32:#0 -v`, assuming 32 is the
> >       ID of a connector.
> >
> > Signed-off-by: Arnaud Lahache <a.lahache@klervi.com>
> > Co-developed-by: Pierre-Louis Dourneau <pl.dourneau@klervi.com>
> > Signed-off-by: Pierre-Louis Dourneau <pl.dourneau@klervi.com>
> > Co-developed-by: Benoît Alcaina <b.alcaina@klervi.com>
> > Signed-off-by: Benoît Alcaina <b.alcaina@klervi.com>
> > ---
> > As far as our testing goes, we've been running 6 of our production units
> > with this patch for more than 2 weeks as per the date this patch is sent
> > out. We can report stable memory usage.
> 
> Hello Arnaud,
> 
> This patch fixes the memory leak but introduces a crash on my side when
> exiting a graphics app using the Microchip graphics library.
> 
> 
> ------------[ cut here ]------------
> 
> 
> 
> WARNING: CPU: 0 PID: 201 at lib/refcount.c:28
> refcount_warn_saturate+0x58/0x130
> 
> 
> 
> refcount_t: underflow; use-after-free.
> 
> 
> 
> Modules linked in:
> 
> 
> 
> CPU: 0 PID: 201 Comm: basic Not tainted 6.1.55-linux4microchip-2023.10+
> #65
> 
> 
> Hardware name: Microchip SAM9X60
> 
> 
> 
>   unwind_backtrace from show_stack+0x10/0x18
> 
> 
> 
>   show_stack from dump_stack_lvl+0x28/0x34
> 
> 
> 
>   dump_stack_lvl from __warn+0x70/0xb8
> 
> 
> 
>   __warn from warn_slowpath_fmt+0x78/0xac
> 
> 
> 
>   warn_slowpath_fmt from refcount_warn_saturate+0x58/0x130
> 
> 
> 
>   refcount_warn_saturate from kref_put+0x54/0x5c
> 
> 
> 
>   kref_put from drm_fb_release+0x100/0x11c
> 
> 
> 
>   drm_fb_release from drm_file_free+0xcc/0x1bc
> 
> 
> 
>   drm_file_free from drm_release+0x44/0x94
> 
> 
> 
>   drm_release from __fput+0xf0/0x20c
> 
> 
> 
>   __fput from task_work_run+0x8c/0xb0
> 
> 
> 
>   task_work_run from do_exit+0x310/0x760
> 
> 
> 
>   do_exit from sys_exit_group+0x0/0x14
> 
> 
> 
>   sys_exit_group from get_signal+0x524/0x64c
> 
> 
> 
>   get_signal from do_work_pending+0xf4/0x398
> 
> 
> 
>   do_work_pending from slow_work_pending+0xc/0x24
> 
> 
> 
> Exception stack(0xc9991fb0 to 0xc9991ff8)
> 
> 
> 
> 1fa0:                                     0054dd48 00000000 005331f8
> 00000001
> 
> 
> 1fc0: 00533270 00000002 00000000 404c8000 beb54170 0051b448 43ab8000
> 0051b424
> 
> 
> 1fe0: b6cc1d98 beb54040 b6c224fc b68357dc 20000010 ffffffff
> 
> 
> 
> ---[ end trace 0000000000000000 ]---
> 
> 
> 
> 8<--- cut here ---
> 
> 
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 00000004
> 
> 
> [00000004] *pgd=00000000
> 
> 
> 
> Internal error: Oops: 805 [#1] ARM
> 
> 
> 
> Modules linked in:
> 
> 
> 
> CPU: 0 PID: 201 Comm: basic Tainted: G        W
> 6.1.55-linux4microchip-2023.10+ #65
> 
> 
> Hardware name: Microchip SAM9X60
> 
> 
> 
> PC is at drm_fb_release+0xc0/0x11c
> 
> 
> 
> LR is at drm_fb_release+0x100/0x11c
> 
> 
> 
> pc : [<c0329b10>]    lr : [<c0329b50>]    psr: 80000013
> 
> 
> 
> sp : c9991e48  ip : 00000000  fp : 0051b424
> 
> 
> 
> r10: c174a5f0  r9 : 00000000  r8 : c2188074
> 
> 
> 
> r7 : 60000013  r6 : c9991e5c  r5 : ffffff8c  r4 : c2188048
> 
> 
> 
> r3 : c1590994  r2 : c2188048  r1 : 00000000  r0 : c1590920
> 
> 
> 
> Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> 
> 
> 
> Control: 0005317f  Table: 2384c000  DAC: 00000051
> 
> 
> 
> Register r0 information: slab kmalloc-192 start c1590920 pointer offset
> 0 size 192
> 
> 
> Register r1 information: NULL pointer
> 
> 
> 
> Register r2 information: slab kmalloc-192 start c2188000 pointer offset
> 72 size 192
> 
> 
> Register r3 information: slab kmalloc-192 start c1590920 pointer offset
> 116 size 192
> 
> 
> Register r4 information: slab kmalloc-192 start c2188000 pointer offset
> 72 size 192
> 
> 
> Register r5 information: non-paged memory
> 
> 
> 
> Register r6 information: 2-page vmalloc region starting at 0xc9990000
> allocated at kernel_clone+0xb4/0x204
> 
> 
> Register r7 information: non-paged memory
> 
> 
> 
> Register r8 information: slab kmalloc-192 start c2188000 pointer offset
> 116 size 192
> 
> 
> Register r9 information: NULL pointer
> 
> 
> 
> Register r10 information: slab task_struct start c174a140 pointer offset
> 1200
> 
> 
> Register r11 information: non-paged memory
> 
> 
> 
> Register r12 information: NULL pointer
> 
> 
> 
> Process basic (pid: 201, stack limit = 0x41541c7b)
> 
> 
> 
> Stack: (0xc9991e48 to 0xc9992000)
> 1e40:                   00000001 00000000 00000000 00000000 00000000
> c9991e5c
> 
> 
> 1e60: c9991e5c 5c44a9dd c2188000 c1621800 c2188060 c03146e4 000000c9
> 0000e200
> 
> 
> 1e80: 00000001 00000000 00000000 c1621800 c38f2cc0 c0fb63e0 c0c1ce70
> c0f99560
> 
> 
> 1ea0: 00000000 c0314a5c c38f2cc0 c10ee6e8 000a201f c00c66a0 c38f2cc0
> 00000001
> 
> 
> 1ec0: c09f1a4c c00c67fc c38f2e00 c174a140 c0a20b1c c2232a50 c9991ef4
> c002f000
> 
> 
> 1ee0: c174a140 c2232a20 c174a140 c001a094 00000002 00000008 c383c880
> 5c44a9dd
> 
> 
> 1f00: 00000002 c383c880 0051b424 c001a6a8 00000009 c0024af0 beb53c50
> 00000000
> 
> 
> 1f20: 00000000 5c44a9dd 00000000 00000000 c9991fb0 c174a140 00000000
> 00000000
> 
> 
> 1f40: 00000000 00000000 0051b424 c000c244 00000000 00000000 00000000
> 00000000
> 
> 
> 1f60: 00000000 00000000 00000009 00000000 00000000 00000000 00000000
> 00000000
> 
> 
> 1f80: 00000000 00000000 00000000 5c44a9dd b68357dc 20000010 ffffffff
> 0005317f
> 
> 
> 1fa0: 00000000 c174a140 43ab8000 c00084dc 0054dd48 00000000 005331f8
> 00000001
> 
> 
> 1fc0: 00533270 00000002 00000000 404c8000 beb54170 0051b448 43ab8000
> 0051b424
> 
> 
> 1fe0: b6cc1d98 beb54040 b6c224fc b68357dc 20000010 ffffffff 00000000
> 00000000
> 
> 
>   drm_fb_release from drm_file_free+0xcc/0x1bc
> 
> 
> 
>   drm_file_free from drm_release+0x44/0x94
> 
> 
> 
>   drm_release from __fput+0xf0/0x20c
> 
> 
> 
>   __fput from task_work_run+0x8c/0xb0
> 
> 
> 
>   task_work_run from do_exit+0x310/0x760
> 
> 
> 
>   do_exit from sys_exit_group+0x0/0x14
> 
> 
> 
>   sys_exit_group from get_signal+0x524/0x64c
> 
> 
> 
>   get_signal from do_work_pending+0xf4/0x398
> 
> 
> 
>   do_work_pending from slow_work_pending+0xc/0x24
> 
> 
> 
> Exception stack(0xc9991fb0 to 0xc9991ff8)
> 
> 
> 
> 1fa0:                                     0054dd48 00000000 005331f8
> 00000001
> 
> 
> 1fc0: 00533270 00000002 00000000 404c8000 beb54170 0051b448 43ab8000
> 0051b424
> 
> 
> 1fe0: b6cc1d98 beb54040 b6c224fc b68357dc 20000010 ffffffff
> 
> 
> 
> Code: e590c018 e5902078 e5901074 e35c0001 (e5812004)
> 
> 
> 
> ---[ end trace 00000000c0a20288 ]---
> 
> 
> 
> Fixing recursive fault but reboot is needed!

We've tried to reproduce your crash with 6.1.22-linux4microchip-2023.04,
to no avail. We'll try to upgrade to 6.1.55-linux4microchip-2023.10 (your
version) and test again.

Is there a particular EGT program you recommend to trigger the crash? Or
any should do? We've limited ourselves to a few of the samples provided
with the library, namely egt_basic, egt_water, egt_charts, and egt_i18n.

> The memory leak had been introduced with this commit:
> 
> 
> commit eec44d44a3d2d00c8f663f13555d3dd280b1ea3f
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Thu Jan 21 16:29:54 2021 +0100
> 
> 
> 
>      drm/atmel: Use drm_atomic_helper_commit
> 
>      One of these drivers that predates the nonblocking support in helpers,
>      and hand-rolled its own thing. Entirely not anything specific here, we
>      can just delete it all and replace it with the helper version.
> 
>      Could also perhaps use the drm_mode_config_helper_suspend/resume
>      stuff, for another few lines deleted. But I'm not looking at that
>      stuff, I'm just going through all the atomic commit functions and make
>      sure they have properly annotated dma-fence critical sections
>      everywhere.
> 
> 
> I think this move to the drm atomic helper should have gone with an
> update on the release side as well. There is probably something wrong
> with the atomic_destroy_state callbacks provided by the atmel-hlcdc driver.
> 
> Regards,
> Ludovic
> 
> >
> > Admittedly, our usage of the DRM uAPI is rather simple: create 2 dumb
> > buffers, do an initial MODE_SETCRTC, and then MODE_PAGE_FLIP between the
> > two dumb buffers at the rate of once per second on average. We haven't
> > evaluated more complex workloads.
> >
> >   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> > index daa508504f47..390c4fc62af7 100644
> > --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> > +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> > @@ -934,8 +934,7 @@ static void atmel_hlcdc_plane_atomic_destroy_state(struct drm_plane *p,
> >                                state->dscrs[i]->self);
> >          }
> >
> > -       if (s->fb)
> > -               drm_framebuffer_put(s->fb);
> > +       __drm_atomic_helper_plane_destroy_state(s);
> >
> >          kfree(state);
> >   }
> >
> > base-commit: 9dfc46c87cdc8f5a42a71de247a744a6b8188980
> > --
> > 2.34.1
> >

Pierre-Louis
