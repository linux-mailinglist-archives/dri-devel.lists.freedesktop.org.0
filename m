Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D866B53566B
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 01:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0279410E2CB;
	Thu, 26 May 2022 23:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D6010E2CB
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 23:34:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id wh22so5754136ejb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 16:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jGWDd1k+QnoJ5pqSff/7/gA81Dp7iVjKRR7beBIAKWM=;
 b=baQWS40EjicfD7EK1Z84Ora3fybhN1jJKR3zil3Q3sWyaPePR8s80CfolLuUY/YAd8
 n/SFZN9VFZEP88ntMeTUjocKs9dsy0nahAszIPHNJO3/W34bseBpBP9HCgFb7TyYIq4a
 A36A0N+nvMAfArqqEdiESmg2NU5fexZRCI8vNemcoWB2gMQmuMrX7trBwHSN22XOJYO1
 pR4hyCRuumWh09pKXADStPwq2vuPp5PyCrzrdXgxGupx2z83bTP0XELZPU+X+CYJNomf
 DrtTNdFzNCC5+Rg1YYG9GKlc63k06HzgRkJW/JQ4begjMxKToneEUyOAC2XFt8dUz+uV
 VDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jGWDd1k+QnoJ5pqSff/7/gA81Dp7iVjKRR7beBIAKWM=;
 b=7w6gJYV2PECg9QA+rAv1HW/3+5RfI8EE3IZo3CLFeO6Qb9TGLKRvCRi2WToQdY7lHP
 QQLWG7KdoVU4i1LePqxo61Y6YGlQOacYLC4IExiSUc8WiP7PSOdWHhEvA0uQucvQAY87
 SuHmVsLzxzCizsobUnFBRduvkalSLPO+lkWOm17AhCgKteASQtIzhKCz0AUQJmpT93J5
 5+SD6BXC0sWAD7rKGc6jqU6kwdxMLfH5A4VbXh+JOcWiPek1igiJcqUJttY9j6ryCiTS
 /Eo/BYtDgecPs26CkRx8i+GXJiuj66auh6Wa8jJbtNkTWveunk3LY6jwhkbam09DKyyG
 80FA==
X-Gm-Message-State: AOAM532u8xzNMuyNT30zmVdqu/vCEM3oQV2xTvfodUFDf7rLDan1yiQN
 c89JnF8n+7Hchofg3kjAc5zgfWNAkr2E5g==
X-Google-Smtp-Source: ABdhPJyl+VGTHHPPz85RqgizD9I16K0B9+ajp3UhfsS3Bc7kXIJ8uD6ui0YU4YXDswD2c+xRZ/53Hg==
X-Received: by 2002:a17:907:1b20:b0:6da:649b:d99e with SMTP id
 mp32-20020a1709071b2000b006da649bd99emr36038154ejc.712.1653608082426; 
 Thu, 26 May 2022 16:34:42 -0700 (PDT)
Received: from adroid (102-167-184-091.ip-addr.vsenet.de. [91.184.167.102])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a50f0c1000000b0042be30c95fbsm727049edm.39.2022.05.26.16.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 16:34:41 -0700 (PDT)
Date: Fri, 27 May 2022 01:34:39 +0200
From: Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: Exynos vblank timeout issue
Message-ID: <20220526233439.GA81797@adroid>
References: <20220522000219.GB241035@adroid>
 <6aa0b632-674d-d9ca-2ba9-cab497aa1f37@kernel.org>
 <20220522100639.GA191106@adroid>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220522100639.GA191106@adroid>
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
Cc: David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello again,

I tried to dig around a bit to unearth some more information. What I'm
seeing is that it works just fine in the beginning, planes are updated a
couple of times and suddenly, after one of the plane updates, the
interrupt handler in the FIMD driver is no longer called. The screen
goes dark but the device is still operational, e.g. ADB works fine, I
can connect and execute commands.

Trying to figure out what is called when and curious about the state of
the registers, I littered the code with print statements and it looks
like vsync is still active, no other code calls into disabling it. All
registers are as expected, e.g. VIDINTCON0 has the interrupt bit set. I
also had a look at the interrupt combiner, this too has the
corresponding lcd0-1 interrupt enabled at all times and there is no
interrupt pending, even after FIMD stopped receiving them.

Looking at the wiki at https://exynos.wiki.kernel.org/todo_tasks I found
issue #9. It's about trashed display or DMA freeze if planes are too
narrow and I was wondering if this could be related. So I had a look at
the drm debug output and planes are indeed getting very small. This
happens exactly when the animation that is triggering the issue is
playing, so this would match. Looking a bit closer at the position and
size of the planes, I could see that the last working vsync was right
after one of the planes was exactly 1 pixel in width and vsync only
stopped working one update later. Here are the plane updates from the
logs:

-

Planes getting smaller and smaller with each update:
plane : offset_x/y(0,0), width/height(4,800)
plane : offset_x/y(4,0), width/height(1276,800)
plane : offset_x/y(0,0), width/height(1280,800)
plane : offset_x/y(0,776), width/height(1280,24)

plane : offset_x/y(0,0), width/height(2,800)
plane : offset_x/y(2,0), width/height(1278,800)
plane : offset_x/y(0,0), width/height(1280,800)
plane : offset_x/y(0,776), width/height(1280,24)

plane : offset_x/y(0,0), width/height(1,800)
plane : offset_x/y(1,0), width/height(1279,800)
plane : offset_x/y(0,0), width/height(1280,800)
plane : offset_x/y(0,776), width/height(1280,24)

Still got a vsync in between those two. But after the following update,
it's dead:
plane : offset_x/y(0,0), width/height(1280,800)
plane : offset_x/y(0,0), width/height(1280,24)
plane : offset_x/y(0,740), width/height(1280,60)
plane : offset_x/y(0,0), width/height(1280,800)

-> vsync timeout comes here

-

I have no idea how to analyze this further on the kernel side. I'll try
to write an executable that triggers this bug next. If you have any
ideas on that, I'd be very grateful.

Kind Regards
Martin

On Sun, May 22, 2022 at 12:06:39PM +0200, Martin Jücker wrote:
> On Sun, May 22, 2022 at 09:45:51AM +0200, Krzysztof Kozlowski wrote:
> > On 22/05/2022 02:02, Martin Jücker wrote:
> > > Hello,
> > > 
> > > I'm trying to get Android 12 up and running on my Galaxy Note 10.1 which
> > > is based on Exynos 4412 with a Mali GPU. For Android 11, I had no issues
> > > with graphics but after upgrading and building Android 12, I'm getting a
> > > vblank wait timeout shortly after starting the device setup, which in
> > > turn leads to my display turning black and SurfaceFlinger hanging. This
> > > can be reliably reproduced after every reboot, so much so that it's
> > > basically always on the exact same step of the setup.
> > > 
> > > I'm using the following setup:
> > > 
> > > * 5.10.101 Android Common Kernel with some patches to get
> > > the Note 10.1 up and running
> > 
> > It's Android kernel, so not upstream. It is perfectly fine to use
> > downstream kernels, but with the issues you also go to downstream folks.
> > I have no clue what Android did to Exynos.
> 
> Hi Krzysztof,
> 
> indeed, that was my mistake. Should have done that on mainline first.
> 
> I rebased some patches on top of v5.17.9 and tried again, same result.
> There are no Android patches in there, only p4note related things. You
> can have a look here: 
> 
> https://github.com/Viciouss/linux/commits/v5.17.9-android
> 
> The behaviour is exactly the same, as soon as I try to advance in the
> setup process, it suddenly turns the screen all black.
> 
> Here is the warning again, just in case there are any differences.
> 
> [   77.651495] ------------[ cut here ]------------
> [   77.651527] WARNING: CPU: 2 PID: 8 at
> ../drivers/gpu/drm/drm_atomic_helper.c:1530
> drm_atomic_helper_wait_for_vblanks.part.1+0x2b0/0x2b4
> [   77.651593] [CRTC:49:crtc-0] vblank wait timed out
> [   77.651608] Modules linked in: s5p_mfc s5p_jpeg v4l2_mem2mem
> videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common
> rfcomm kheaders hidp hci_uart cpufreq_userspace cpufreq_powersave
> cpufreq_conservative btbcm brcmfmac brcmutil bnep bluetooth atmel_mxt_ts
> [   77.651789] CPU: 2 PID: 8 Comm: kworker/u8:0 Not tainted 5.17.9+ #3
> [   77.651813] Hardware name: Samsung Exynos (Flattened Device Tree)
> [   77.651828] Workqueue: events_unbound commit_work
> [   77.651858] Backtrace: 
> [   77.651874] dump_backtrace from show_stack+0x20/0x24
> [   77.651915] r7:c071097c r6:00000000 r5:c10ec66c r4:600f0013
> [   77.651926] show_stack from dump_stack_lvl+0x48/0x54
> [   77.651958] dump_stack_lvl from dump_stack+0x18/0x1c
> [   77.651986] r5:c113dcf4 r4:c1d51e04
> [   77.651996] dump_stack from __warn+0x18c/0x190
> [   77.652030] __warn from warn_slowpath_fmt+0x80/0xbc
> [   77.652070] r9:00000009 r8:c071097c r7:000005fa r6:c113dcf4
> r5:c1d8cb40 r4:c113e338
> [   77.652081] warn_slowpath_fmt from
> drm_atomic_helper_wait_for_vblanks.part.1+0x2b0/0x2b4
> [   77.652123] r9:00000001 r8:00000000 r7:00000000 r6:00000000
> r5:00000000 r4:c398c800
> [   77.652135] drm_atomic_helper_wait_for_vblanks.part.1 from
> drm_atomic_helper_commit_tail_rpm+0x6c/0x7c
> [   77.652175] r10:c14cce68 r9:c1c2a005 r8:00000000 r7:0e3f351d
> r6:00000012 r5:c398c000
> [   77.652188] r4:d42943c0
> [   77.652197] drm_atomic_helper_commit_tail_rpm from
> commit_tail+0xb8/0x1d8
> [   77.652228] r5:00000000 r4:d42943c0
> [   77.652238] commit_tail from commit_work+0x1c/0x20
> [   77.652274] r10:c1518d20 r9:c1c2a005 r8:00000000 r7:c1c2a000
> r6:c1c0a800 r5:c1c08a00
> [   77.652287] r4:d42943ec
> [   77.652297] commit_work from process_one_work+0x1b0/0x528
> [   77.652324] process_one_work from worker_thread+0x54/0x4d8
> [   77.652356] r10:c1c0a800 r9:00000088 r8:c1403d00 r7:c1c0a81c
> r6:c1c08a18 r5:c1c0a800
> [   77.652368] r4:c1c08a00
> [   77.652378] worker_thread from kthread+0x104/0x134
> [   77.652419] r10:00000000 r9:c1d43e5c r8:c1d05880 r7:c1d8cb40
> r6:c1c08a00 r5:c015530c
> [   77.652432] r4:c1d05700
> [   77.652441] kthread from ret_from_fork+0x14/0x2c
> [   77.652468] Exception stack(0xc1d51fb0 to 0xc1d51ff8)
> [   77.652488] 1fa0:                                     00000000
> 00000000 00000000 00000000
> [   77.652509] 1fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [   77.652528] 1fe0: 00000000 00000000 00000000 00000000 00000013
> 00000000
> [   77.652550] r9:00000000 r8:00000000 r7:00000000 r6:00000000
> r5:c015da78 r4:c1d05700
> [   77.652561] ---[ end trace 0000000000000000 ]---
> 
> Kind Regards
> Martin
> 
> > 
> > Best regards,
> > Krzysztof
