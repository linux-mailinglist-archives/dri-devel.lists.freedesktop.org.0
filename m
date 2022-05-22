Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9A9530979
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2017110ED98;
	Mon, 23 May 2022 06:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CD710E269
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 10:06:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i40so15709439eda.7
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6HKvzCO3adAcCXDORAtuEwAZ27lgMzxsx4vIPpNEwvs=;
 b=TRq88ZE+ZCm+jkohEJkgDLAg9An40PifWkstZCCLHNFQo2LybQ9byuidpohSewJrIY
 9hQHS34zBS0OxB7DbOS2pRWD2av4ohrp1cOl1ZrpC5Hl9kTuUayUS1wKvuuQXMeoAZKs
 vApTtXF2vZo+NA+xDzYwXCvFA67lajiihdE9Yp32PlNgdnD4KqO69pvEzEtv/JL5t5LY
 u89Pjl2pIYd0+7gWBJw7NFp/qRgs12GHMKof6sSaqVQbI7w2UhwLtN0d5iEBy5PDHCAO
 NyqCAu9Kt5Qz5qWn2qnY0zX8RGDGMa1bZt4w64mJe+I6psIr9KXeQNVkvugtArKJjVO9
 7cGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6HKvzCO3adAcCXDORAtuEwAZ27lgMzxsx4vIPpNEwvs=;
 b=ipHCF7M1zMSPJgcqPSRjCh+ftSBhvAYZcNUPFlXX9WKJ2sPHwfwi4A9MZClVSJ33oP
 UCcdy7jvYcni79t3DkHlldQrQUQ6X7xy4dC6qKfM/zR5lKSXB0Pd/a12ot7odwJaqoSu
 L5hzNb/duBgBX/nT0MP+zq/vDvOKz7tNqzj0y8/47Y9HT8sIj6lHDf2Yva8L48On/YM1
 DTA7l3kKKDpVo8kfTnVtKAf/Obu5c1sroOJh0t9cktwUOqZhb39psiP5lhMz273HIswp
 ktcheKI8N8nUIm/+Q9/uHOnUEoosBdoxHRqwHEFfDssXftRCAfXuYYxeq16d/ixQZbLj
 oJbw==
X-Gm-Message-State: AOAM531zgwzAkzsFuSqnFeOyaGcNZVkKMhQD6iI4viWBLxBWkrgIwgxf
 d9riOGz2xk+ehEk1cMOrQYA=
X-Google-Smtp-Source: ABdhPJx/h8GHn2hr8fwkiLutaiQ5ubnUU6b3G/JTXf+fDTcAu90Y86tcyQ1KTlesDWpphD9sVfMECQ==
X-Received: by 2002:a05:6402:d0a:b0:421:10e6:2ecc with SMTP id
 eb10-20020a0564020d0a00b0042110e62eccmr19018402edb.329.1653214002294; 
 Sun, 22 May 2022 03:06:42 -0700 (PDT)
Received: from adroid (102-167-184-091.ip-addr.vsenet.de. [91.184.167.102])
 by smtp.gmail.com with ESMTPSA id
 q1-20020aa7d441000000b0042aae0a4699sm6843326edr.60.2022.05.22.03.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 03:06:41 -0700 (PDT)
Date: Sun, 22 May 2022 12:06:39 +0200
From: Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: Exynos vblank timeout issue
Message-ID: <20220522100639.GA191106@adroid>
References: <20220522000219.GB241035@adroid>
 <6aa0b632-674d-d9ca-2ba9-cab497aa1f37@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6aa0b632-674d-d9ca-2ba9-cab497aa1f37@kernel.org>
X-Mailman-Approved-At: Mon, 23 May 2022 06:25:06 +0000
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
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 22, 2022 at 09:45:51AM +0200, Krzysztof Kozlowski wrote:
> On 22/05/2022 02:02, Martin Jücker wrote:
> > Hello,
> > 
> > I'm trying to get Android 12 up and running on my Galaxy Note 10.1 which
> > is based on Exynos 4412 with a Mali GPU. For Android 11, I had no issues
> > with graphics but after upgrading and building Android 12, I'm getting a
> > vblank wait timeout shortly after starting the device setup, which in
> > turn leads to my display turning black and SurfaceFlinger hanging. This
> > can be reliably reproduced after every reboot, so much so that it's
> > basically always on the exact same step of the setup.
> > 
> > I'm using the following setup:
> > 
> > * 5.10.101 Android Common Kernel with some patches to get
> > the Note 10.1 up and running
> 
> It's Android kernel, so not upstream. It is perfectly fine to use
> downstream kernels, but with the issues you also go to downstream folks.
> I have no clue what Android did to Exynos.

Hi Krzysztof,

indeed, that was my mistake. Should have done that on mainline first.

I rebased some patches on top of v5.17.9 and tried again, same result.
There are no Android patches in there, only p4note related things. You
can have a look here: 

https://github.com/Viciouss/linux/commits/v5.17.9-android

The behaviour is exactly the same, as soon as I try to advance in the
setup process, it suddenly turns the screen all black.

Here is the warning again, just in case there are any differences.

[   77.651495] ------------[ cut here ]------------
[   77.651527] WARNING: CPU: 2 PID: 8 at
../drivers/gpu/drm/drm_atomic_helper.c:1530
drm_atomic_helper_wait_for_vblanks.part.1+0x2b0/0x2b4
[   77.651593] [CRTC:49:crtc-0] vblank wait timed out
[   77.651608] Modules linked in: s5p_mfc s5p_jpeg v4l2_mem2mem
videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common
rfcomm kheaders hidp hci_uart cpufreq_userspace cpufreq_powersave
cpufreq_conservative btbcm brcmfmac brcmutil bnep bluetooth atmel_mxt_ts
[   77.651789] CPU: 2 PID: 8 Comm: kworker/u8:0 Not tainted 5.17.9+ #3
[   77.651813] Hardware name: Samsung Exynos (Flattened Device Tree)
[   77.651828] Workqueue: events_unbound commit_work
[   77.651858] Backtrace: 
[   77.651874] dump_backtrace from show_stack+0x20/0x24
[   77.651915] r7:c071097c r6:00000000 r5:c10ec66c r4:600f0013
[   77.651926] show_stack from dump_stack_lvl+0x48/0x54
[   77.651958] dump_stack_lvl from dump_stack+0x18/0x1c
[   77.651986] r5:c113dcf4 r4:c1d51e04
[   77.651996] dump_stack from __warn+0x18c/0x190
[   77.652030] __warn from warn_slowpath_fmt+0x80/0xbc
[   77.652070] r9:00000009 r8:c071097c r7:000005fa r6:c113dcf4
r5:c1d8cb40 r4:c113e338
[   77.652081] warn_slowpath_fmt from
drm_atomic_helper_wait_for_vblanks.part.1+0x2b0/0x2b4
[   77.652123] r9:00000001 r8:00000000 r7:00000000 r6:00000000
r5:00000000 r4:c398c800
[   77.652135] drm_atomic_helper_wait_for_vblanks.part.1 from
drm_atomic_helper_commit_tail_rpm+0x6c/0x7c
[   77.652175] r10:c14cce68 r9:c1c2a005 r8:00000000 r7:0e3f351d
r6:00000012 r5:c398c000
[   77.652188] r4:d42943c0
[   77.652197] drm_atomic_helper_commit_tail_rpm from
commit_tail+0xb8/0x1d8
[   77.652228] r5:00000000 r4:d42943c0
[   77.652238] commit_tail from commit_work+0x1c/0x20
[   77.652274] r10:c1518d20 r9:c1c2a005 r8:00000000 r7:c1c2a000
r6:c1c0a800 r5:c1c08a00
[   77.652287] r4:d42943ec
[   77.652297] commit_work from process_one_work+0x1b0/0x528
[   77.652324] process_one_work from worker_thread+0x54/0x4d8
[   77.652356] r10:c1c0a800 r9:00000088 r8:c1403d00 r7:c1c0a81c
r6:c1c08a18 r5:c1c0a800
[   77.652368] r4:c1c08a00
[   77.652378] worker_thread from kthread+0x104/0x134
[   77.652419] r10:00000000 r9:c1d43e5c r8:c1d05880 r7:c1d8cb40
r6:c1c08a00 r5:c015530c
[   77.652432] r4:c1d05700
[   77.652441] kthread from ret_from_fork+0x14/0x2c
[   77.652468] Exception stack(0xc1d51fb0 to 0xc1d51ff8)
[   77.652488] 1fa0:                                     00000000
00000000 00000000 00000000
[   77.652509] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   77.652528] 1fe0: 00000000 00000000 00000000 00000000 00000013
00000000
[   77.652550] r9:00000000 r8:00000000 r7:00000000 r6:00000000
r5:c015da78 r4:c1d05700
[   77.652561] ---[ end trace 0000000000000000 ]---

Kind Regards
Martin

> 
> Best regards,
> Krzysztof
