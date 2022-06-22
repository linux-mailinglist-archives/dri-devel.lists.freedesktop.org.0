Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7015540E5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 05:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1FF10E5B1;
	Wed, 22 Jun 2022 03:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D4510E5B1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 03:28:04 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id es26so20326829edb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 20:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YXJ0iZBB+6cAcR3XDj5z2HaLv2yJgQTpuwchtqptn3I=;
 b=kmOD7Akcq43gbeDP17tSltV3Rz95I4BfVFAjV4pFCWmXMdHx/tpVH/DLOaRgMPIvCn
 auM+J+XsU+XyIuIxdOygaJjeORyVTYGEW6BO5hC74QQ+jAHOJGsP4CbFafxDCiXcAyWg
 /m3gqEOEc5bSqDeAR5IfX6eIp4VOsUY4QPI48eUAJjWYOcduzbbID4xtpmaidEL6n4Dw
 ruSFWLH2D15PouFEqluwerjgBelHpW5STkHlo46yNLRLUBJQlbLvLnz3hHsgtFscjrmw
 CyVmSYERgya4tlldVOHZ+3s8zf5M13TDqlN2NmAblShRnyE532TylLjRusr11h3ZNkFf
 W3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YXJ0iZBB+6cAcR3XDj5z2HaLv2yJgQTpuwchtqptn3I=;
 b=K6tW1VQwMCscMV8X8TD0MDokANUg3c+9B03aNkSa/+SCDd7jc7ksUd0u5c+yiGaLdm
 B8TlPG2h83nGnvm/3xbo01b6PxO/Iv/bAcA5hwQvZAb9eSqHxv+v2XkE7Ntx91oQ1uIn
 f5pttZMg9W9OW0hagyd++/jknyWXiXwr6mQFFXfuJ4PgUGwoe/ksynbiSY+Q+poAwhrT
 xtN1ysyGIe+I2gqo0wTCbDOUdfYa1OAD+9HIbUMfE0Xlof5LhjRotgBcOeVb5UIkaZTu
 b7S3RsHaHWTj+q2zGMr3N9KBmAw7qWxhfY0GS6VztOia9S4p+VF90piVWzJAUdcAzRVe
 D+Hg==
X-Gm-Message-State: AJIora+b0PqSt6mgGgZ3WWapfz9pTLE1XWMfv2XYlVLMgV4DZXD5xV7v
 3kW+p5arUiPUsGEFBn9KJeCSXnHRdSLZbsMCFWQ=
X-Google-Smtp-Source: AGRyM1sB7/74ZXRONGKydlWtrCgnVya4GB9h0CwWrFLe2Tid3g5CLd6i8OKfW2uLpqkRT6q4sHwT2zni/PuR1f6eiKc=
X-Received: by 2002:a05:6402:4414:b0:434:f58c:ee2e with SMTP id
 y20-20020a056402441400b00434f58cee2emr1583536eda.362.1655868482515; Tue, 21
 Jun 2022 20:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220522000219.GB241035@adroid>
 <6aa0b632-674d-d9ca-2ba9-cab497aa1f37@kernel.org>
 <20220522100639.GA191106@adroid> <20220526233439.GA81797@adroid>
 <CAAQKjZPejin5asY4ctg__bTgSvtftP0YE4h096iJo34xGy55bQ@mail.gmail.com>
 <20220604110518.GA4254@adroid>
In-Reply-To: <20220604110518.GA4254@adroid>
From: Inki Dae <daeinki@gmail.com>
Date: Wed, 22 Jun 2022 12:27:24 +0900
Message-ID: <CAAQKjZOOEpSde95bJxHO2a29mJrPt6D9dYe7rAmQBFBFoXOfpg@mail.gmail.com>
Subject: Re: Exynos vblank timeout issue
To: =?UTF-8?Q?Martin_J=C3=BCcker?= <martin.juecker@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Martin,

2022=EB=85=84 6=EC=9B=94 4=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 8:05, Ma=
rtin J=C3=BCcker <martin.juecker@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On Sat, Jun 04, 2022 at 01:05:39PM +0900, Inki Dae wrote:
> > Hi Martin,
> >
>
> Hi Inki,
>
> > What kind of panel does Galaxy Note 10.1 use? I guess it uses I80
> > panel which needs CPU-trigger.
>
> the Note 10.1 uses a Samsung LTL101AL01 LCD which is connected via the
> RGB interface.
>
> In the meantime I tried several things but to no avail. Krzysztof
> proposed in IRC to disable devfreq which had no effect. I compared the
> mainline sources with the vendor kernel, but there are no notable
> differences and the parts that were a bit different also didn't solve
> the problem when applied to mainline.
>
> I then tried to reproduce the issue, I noticed that things go wrong as
> soon as I get to planes that are less than 8x8 pixels. There is two
> different issues I can make out:
>
> 1) Active pixels are not what expected, so the plane is 1x4 pixels but
> only two pixels will be visible on the display
> 2) The screen goes dark and the vblank interrupt stops working

Seems malfunctioning of display controller, FIMD device.

>
> The vblank occurs for all planes that are 1x8 or any multiple of it, so
> 1x16, 1x24 as well as planes bigger than 1x279 in size. This is for the
> primary plane. A width of two seems to be fine here.

FIMD device has a limit to DMA burst size. Please see how burst size
is set according to pixel format,
https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/tree=
/drivers/gpu/drm/exynos/exynos_drm_fimd.c?h=3Dexynos-drm-fixes#n660

I think Android platform uses XRGB888 or ARGB888 for framebuffer. In
this case, the burst size - it means the minimum size that FIMD's DMA
controller reads some portion of frame buffer from memory - is 16
words.
So width size should be multiple of the word size.

Could you align the width size of the frame buffer to multiple of 16?
According to your analysis, multiple of 8 would be ok.

Thanks,
Inki Dae

>
> For overlay planes, the situation is worse. All planes of width one will
> trigger a vsync timeout. Also, planes of widths smaller 8 seem to be hit
> and miss, most of them don't work.
>
> The first issue with the wrong number of pixels seems to be for small
> planes less than 8x8 pixels that don't trigger the vsync issue but it's
> more difficult to find a pattern here. It looks like even numbers like
> 4x4, 4x6 are fine but as soon as at least one odd number is present, it
> will go down the drain. 5x6 for example will only display 5x5 pixels,
> 5x5 will display four rows of five pixels and one row with one pixel.
>
> Kind Regards
> Martin
>
>
>
> > If so, you may need to check if the panel device works correctly after
> > booting because FIMD will incur vsync timeout if the panel doesn't
> > work.
> > I think you could try to check if te signal works or not in
> > exynos_dsi_te_irq_handler function of exynos_drm_dsi.c
> >
> > Thanks,
> > Inki Dae
> >
> > 2022=EB=85=84 5=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 8:3=
4, Martin J=C3=BCcker <martin.juecker@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=
=91=EC=84=B1:
> > >
> > > Hello again,
> > >
> > > I tried to dig around a bit to unearth some more information. What I'=
m
> > > seeing is that it works just fine in the beginning, planes are update=
d a
> > > couple of times and suddenly, after one of the plane updates, the
> > > interrupt handler in the FIMD driver is no longer called. The screen
> > > goes dark but the device is still operational, e.g. ADB works fine, I
> > > can connect and execute commands.
> > >
> > > Trying to figure out what is called when and curious about the state =
of
> > > the registers, I littered the code with print statements and it looks
> > > like vsync is still active, no other code calls into disabling it. Al=
l
> > > registers are as expected, e.g. VIDINTCON0 has the interrupt bit set.=
 I
> > > also had a look at the interrupt combiner, this too has the
> > > corresponding lcd0-1 interrupt enabled at all times and there is no
> > > interrupt pending, even after FIMD stopped receiving them.
> > >
> > > Looking at the wiki at https://exynos.wiki.kernel.org/todo_tasks I fo=
und
> > > issue #9. It's about trashed display or DMA freeze if planes are too
> > > narrow and I was wondering if this could be related. So I had a look =
at
> > > the drm debug output and planes are indeed getting very small. This
> > > happens exactly when the animation that is triggering the issue is
> > > playing, so this would match. Looking a bit closer at the position an=
d
> > > size of the planes, I could see that the last working vsync was right
> > > after one of the planes was exactly 1 pixel in width and vsync only
> > > stopped working one update later. Here are the plane updates from the
> > > logs:
> > >
> > > -
> > >
> > > Planes getting smaller and smaller with each update:
> > > plane : offset_x/y(0,0), width/height(4,800)
> > > plane : offset_x/y(4,0), width/height(1276,800)
> > > plane : offset_x/y(0,0), width/height(1280,800)
> > > plane : offset_x/y(0,776), width/height(1280,24)
> > >
> > > plane : offset_x/y(0,0), width/height(2,800)
> > > plane : offset_x/y(2,0), width/height(1278,800)
> > > plane : offset_x/y(0,0), width/height(1280,800)
> > > plane : offset_x/y(0,776), width/height(1280,24)
> > >
> > > plane : offset_x/y(0,0), width/height(1,800)
> > > plane : offset_x/y(1,0), width/height(1279,800)
> > > plane : offset_x/y(0,0), width/height(1280,800)
> > > plane : offset_x/y(0,776), width/height(1280,24)
> > >
> > > Still got a vsync in between those two. But after the following updat=
e,
> > > it's dead:
> > > plane : offset_x/y(0,0), width/height(1280,800)
> > > plane : offset_x/y(0,0), width/height(1280,24)
> > > plane : offset_x/y(0,740), width/height(1280,60)
> > > plane : offset_x/y(0,0), width/height(1280,800)
> > >
> > > -> vsync timeout comes here
> > >
> > > -
> > >
> > > I have no idea how to analyze this further on the kernel side. I'll t=
ry
> > > to write an executable that triggers this bug next. If you have any
> > > ideas on that, I'd be very grateful.
> > >
> > > Kind Regards
> > > Martin
> > >
> > > On Sun, May 22, 2022 at 12:06:39PM +0200, Martin J=C3=BCcker wrote:
> > > > On Sun, May 22, 2022 at 09:45:51AM +0200, Krzysztof Kozlowski wrote=
:
> > > > > On 22/05/2022 02:02, Martin J=C3=BCcker wrote:
> > > > > > Hello,
> > > > > >
> > > > > > I'm trying to get Android 12 up and running on my Galaxy Note 1=
0.1 which
> > > > > > is based on Exynos 4412 with a Mali GPU. For Android 11, I had =
no issues
> > > > > > with graphics but after upgrading and building Android 12, I'm =
getting a
> > > > > > vblank wait timeout shortly after starting the device setup, wh=
ich in
> > > > > > turn leads to my display turning black and SurfaceFlinger hangi=
ng. This
> > > > > > can be reliably reproduced after every reboot, so much so that =
it's
> > > > > > basically always on the exact same step of the setup.
> > > > > >
> > > > > > I'm using the following setup:
> > > > > >
> > > > > > * 5.10.101 Android Common Kernel with some patches to get
> > > > > > the Note 10.1 up and running
> > > > >
> > > > > It's Android kernel, so not upstream. It is perfectly fine to use
> > > > > downstream kernels, but with the issues you also go to downstream=
 folks.
> > > > > I have no clue what Android did to Exynos.
> > > >
> > > > Hi Krzysztof,
> > > >
> > > > indeed, that was my mistake. Should have done that on mainline firs=
t.
> > > >
> > > > I rebased some patches on top of v5.17.9 and tried again, same resu=
lt.
> > > > There are no Android patches in there, only p4note related things. =
You
> > > > can have a look here:
> > > >
> > > > https://github.com/Viciouss/linux/commits/v5.17.9-android
> > > >
> > > > The behaviour is exactly the same, as soon as I try to advance in t=
he
> > > > setup process, it suddenly turns the screen all black.
> > > >
> > > > Here is the warning again, just in case there are any differences.
> > > >
> > > > [   77.651495] ------------[ cut here ]------------
> > > > [   77.651527] WARNING: CPU: 2 PID: 8 at
> > > > ../drivers/gpu/drm/drm_atomic_helper.c:1530
> > > > drm_atomic_helper_wait_for_vblanks.part.1+0x2b0/0x2b4
> > > > [   77.651593] [CRTC:49:crtc-0] vblank wait timed out
> > > > [   77.651608] Modules linked in: s5p_mfc s5p_jpeg v4l2_mem2mem
> > > > videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_comm=
on
> > > > rfcomm kheaders hidp hci_uart cpufreq_userspace cpufreq_powersave
> > > > cpufreq_conservative btbcm brcmfmac brcmutil bnep bluetooth atmel_m=
xt_ts
> > > > [   77.651789] CPU: 2 PID: 8 Comm: kworker/u8:0 Not tainted 5.17.9+=
 #3
> > > > [   77.651813] Hardware name: Samsung Exynos (Flattened Device Tree=
)
> > > > [   77.651828] Workqueue: events_unbound commit_work
> > > > [   77.651858] Backtrace:
> > > > [   77.651874] dump_backtrace from show_stack+0x20/0x24
> > > > [   77.651915] r7:c071097c r6:00000000 r5:c10ec66c r4:600f0013
> > > > [   77.651926] show_stack from dump_stack_lvl+0x48/0x54
> > > > [   77.651958] dump_stack_lvl from dump_stack+0x18/0x1c
> > > > [   77.651986] r5:c113dcf4 r4:c1d51e04
> > > > [   77.651996] dump_stack from __warn+0x18c/0x190
> > > > [   77.652030] __warn from warn_slowpath_fmt+0x80/0xbc
> > > > [   77.652070] r9:00000009 r8:c071097c r7:000005fa r6:c113dcf4
> > > > r5:c1d8cb40 r4:c113e338
> > > > [   77.652081] warn_slowpath_fmt from
> > > > drm_atomic_helper_wait_for_vblanks.part.1+0x2b0/0x2b4
> > > > [   77.652123] r9:00000001 r8:00000000 r7:00000000 r6:00000000
> > > > r5:00000000 r4:c398c800
> > > > [   77.652135] drm_atomic_helper_wait_for_vblanks.part.1 from
> > > > drm_atomic_helper_commit_tail_rpm+0x6c/0x7c
> > > > [   77.652175] r10:c14cce68 r9:c1c2a005 r8:00000000 r7:0e3f351d
> > > > r6:00000012 r5:c398c000
> > > > [   77.652188] r4:d42943c0
> > > > [   77.652197] drm_atomic_helper_commit_tail_rpm from
> > > > commit_tail+0xb8/0x1d8
> > > > [   77.652228] r5:00000000 r4:d42943c0
> > > > [   77.652238] commit_tail from commit_work+0x1c/0x20
> > > > [   77.652274] r10:c1518d20 r9:c1c2a005 r8:00000000 r7:c1c2a000
> > > > r6:c1c0a800 r5:c1c08a00
> > > > [   77.652287] r4:d42943ec
> > > > [   77.652297] commit_work from process_one_work+0x1b0/0x528
> > > > [   77.652324] process_one_work from worker_thread+0x54/0x4d8
> > > > [   77.652356] r10:c1c0a800 r9:00000088 r8:c1403d00 r7:c1c0a81c
> > > > r6:c1c08a18 r5:c1c0a800
> > > > [   77.652368] r4:c1c08a00
> > > > [   77.652378] worker_thread from kthread+0x104/0x134
> > > > [   77.652419] r10:00000000 r9:c1d43e5c r8:c1d05880 r7:c1d8cb40
> > > > r6:c1c08a00 r5:c015530c
> > > > [   77.652432] r4:c1d05700
> > > > [   77.652441] kthread from ret_from_fork+0x14/0x2c
> > > > [   77.652468] Exception stack(0xc1d51fb0 to 0xc1d51ff8)
> > > > [   77.652488] 1fa0:                                     00000000
> > > > 00000000 00000000 00000000
> > > > [   77.652509] 1fc0: 00000000 00000000 00000000 00000000 00000000
> > > > 00000000 00000000 00000000
> > > > [   77.652528] 1fe0: 00000000 00000000 00000000 00000000 00000013
> > > > 00000000
> > > > [   77.652550] r9:00000000 r8:00000000 r7:00000000 r6:00000000
> > > > r5:c015da78 r4:c1d05700
> > > > [   77.652561] ---[ end trace 0000000000000000 ]---
> > > >
> > > > Kind Regards
> > > > Martin
> > > >
> > > > >
> > > > > Best regards,
> > > > > Krzysztof
