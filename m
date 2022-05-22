Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1698530973
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 08:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0E710E8FB;
	Mon, 23 May 2022 06:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEF610E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 May 2022 00:02:23 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id j28so14871555eda.13
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 17:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=MDT5Xa8t79Ulc/QDcL088Rb1tarcFmW3VjQHLmnRIsg=;
 b=B1zNPKWDFYt8ttnGxj+qubezN+z/PHeHEf1wAmlF17W+ewA8alzlOG/1pulkENBKuG
 H12+yCwLdTniTzRklXL3p8YGRMaGNvFbpEpcDDU/3TgnCT6A/MTAvZkMsJkkSW891ig1
 h/IjEcU2sCwLUQ9jT6xIQAi890cYjXDlF1dXz4Gul7VH+uNB6TkEY1WsJkBnx6TPyOVI
 bIuU3MpEKXSLsAKR8To8BOgVOCCe59l54uNNrU2Mb4054+nqGT5jgVxAoay4/BW3VDI2
 Xa+TykshMU4OFM8yKJqnKksYFU3BQwA6mW2vZUUePZ9qUsOn/sKfYLncX7CfP/SzVTpp
 wUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=MDT5Xa8t79Ulc/QDcL088Rb1tarcFmW3VjQHLmnRIsg=;
 b=S4P68iTFEgo5V8wczuuMQzaoT0rSWWTbpsrdqciiyOJ+pUqKtAYgkj71qw8/tp9eGV
 898s1FU1QHJO5gU2h+JQ5tEEhz2Ce7TP5ligEUcDlAV0SF3pWyfFEMVO0DZbI0CaEm9W
 wZ2R83OFp6joiT/5FIf+pL0TsbtPgZH6Wz7jZJcDQNaJZFViOgKEUtMb5ymDVkMzkd0g
 GaQ9TyhS4C2++jBD8QVyLcxwkk1B132VwQAhFhDtI7QwIomBNdX5dObhmQZrlF5DgZEb
 NRd+bIBLywKe2ozDUgM8DzmjjQtNlEjQPHZZiRQ3xctMR6MrsmG2lYXAiHbvsUbVX6t8
 DA5g==
X-Gm-Message-State: AOAM5335hJpucoxz9+hHhcEY8Py7lJ/yD5HaXDlOsQw32Qz3Zhidmqbe
 p43fzY1Bbt4PqJzGM0j0CH42XlLWaFrYxg==
X-Google-Smtp-Source: ABdhPJy2QatjeTZbV6dUSO3DS5Lz3WM5k4oInALozOSvXAH/1QKqZmPad4Y1actjEtHcfvR8SIZB4w==
X-Received: by 2002:a05:6402:2815:b0:420:c32e:ebe2 with SMTP id
 h21-20020a056402281500b00420c32eebe2mr17791644ede.1.1653177741326; 
 Sat, 21 May 2022 17:02:21 -0700 (PDT)
Received: from adroid (102-167-184-091.ip-addr.vsenet.de. [91.184.167.102])
 by smtp.gmail.com with ESMTPSA id
 x7-20020aa7dac7000000b0042aaaf3f41csm6193991eds.4.2022.05.21.17.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 17:02:21 -0700 (PDT)
Date: Sun, 22 May 2022 02:02:19 +0200
From: Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: Exynos vblank timeout issue
Message-ID: <20220522000219.GB241035@adroid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Martin =?iso-8859-1?Q?J=FCcker?= <martin.juecker@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I'm trying to get Android 12 up and running on my Galaxy Note 10.1 which
is based on Exynos 4412 with a Mali GPU. For Android 11, I had no issues
with graphics but after upgrading and building Android 12, I'm getting a
vblank wait timeout shortly after starting the device setup, which in
turn leads to my display turning black and SurfaceFlinger hanging. This
can be reliably reproduced after every reboot, so much so that it's
basically always on the exact same step of the setup.

I'm using the following setup:

* 5.10.101 Android Common Kernel with some patches to get
the Note 10.1 up and running
* Exynos FIMD + Lima GPU driver
* android-12.1.0_r5 branch
* drm-hwcomposer main branch
* mesa main branch
* minigbm from the GloDroid project

I tried several older versions of hwc, mesa and minigbm with no success,
same problem on all of them. What I found is that, if I disable overlay
planes and only the primary plane is used, it works without any issues.
Adding the second plane is fine as well, but the third one triggers the
problem. For some reason, this didn't happen on Android 11 though and
nothing changed on the kernel side, I was using the same kernel for it.

Unfortunately, there is not a lot going on in the logging. In logcat I
can see the following messages:

E hwc-drm-atomic-state-manager:sync_wait(fd=33) returned: -1 (errno: 62)
E hwc-drm-atomic-state-manager: Failed to commit pset ret=-16
E hwc-drm-atomic-state-manager: Composite failed for pipeline VGA-1
E Fence: waitForever: Throttling EGL Production: fence 431 didn't
signal in 3000 ms
W OpenGLRenderer: dequeueBuffer failed,error = -110;


Here is the dmesg output of it:

[   55.106235] [drm:drm_ioctl] comm="composer@2.4-se" pid=266,
dev=0xe200, auth=1, DRM_IOCTL_MODE_ATOMIC
[   55.106264] [drm:drm_atomic_state_init] Allocated atomic state
a07053f4
[   55.106299] [drm:drm_mode_object_get] OBJ ID: 73 (2)
[   55.106313] [drm:drm_atomic_get_plane_state] Added [PLANE:31:plane-0]
ff8c5726 state to a07053f4
[   55.106327] [drm:drm_mode_object_get] OBJ ID: 60 (1)
[   55.106339] [drm:drm_atomic_get_crtc_state] Added [CRTC:54:crtc-0]
33284f8c state to a07053f4
[   55.106367] [drm:drm_atomic_set_fb_for_plane] Set [FB:73] for
[PLANE:31:plane-0] state ff8c5726
[   55.106385] [drm:drm_mode_object_get] OBJ ID: 73 (5)
[   55.106395] [drm:drm_mode_object_put.part.0] OBJ ID: 73 (6)
[   55.106415] [drm:drm_mode_object_put.part.0] OBJ ID: 73 (5)
[   55.106426] [drm:drm_mode_object_put.part.0] OBJ ID: 73 (4)
[   55.106449] [drm:drm_mode_object_get] OBJ ID: 72 (2)
[   55.106462] [drm:drm_atomic_get_plane_state] Added [PLANE:34:plane-1]
b6a2ee22 state to a07053f4
[   55.106479] [drm:drm_atomic_set_fb_for_plane] Set [FB:72] for
[PLANE:34:plane-1] state b6a2ee22
[   55.106490] [drm:drm_mode_object_get] OBJ ID: 72 (5)
[   55.106500] [drm:drm_mode_object_put.part.0] OBJ ID: 72 (6)
[   55.106510] [drm:drm_mode_object_put.part.0] OBJ ID: 72 (5)
[   55.106520] [drm:drm_mode_object_put.part.0] OBJ ID: 72 (4)
[   55.106540] [drm:drm_mode_object_get] OBJ ID: 68 (2)
[   55.106552] [drm:drm_atomic_get_plane_state] Added [PLANE:39:plane-2]
aba4b1f1 state to a07053f4
[   55.106568] [drm:drm_atomic_set_fb_for_plane] Set [FB:61] for
[PLANE:39:plane-2] state aba4b1f1
[   55.106578] [drm:drm_mode_object_get] OBJ ID: 61 (3)
[   55.106588] [drm:drm_mode_object_put.part.0] OBJ ID: 68 (3)
[   55.106599] [drm:drm_mode_object_put.part.0] OBJ ID: 61 (4)
[   55.106608] [drm:drm_mode_object_put.part.0] OBJ ID: 61 (3)
[   55.106628] [drm:drm_mode_object_get] OBJ ID: 66 (2)
[   55.106639] [drm:drm_atomic_get_plane_state] Added [PLANE:44:plane-3]
08e79ee6 state to a07053f4
[   55.106656] [drm:drm_atomic_set_fb_for_plane] Set [FB:66] for
[PLANE:44:plane-3] state 08e79ee6
[   55.106666] [drm:drm_mode_object_get] OBJ ID: 66 (5)
[   55.106677] [drm:drm_mode_object_put.part.0] OBJ ID: 66 (6)
[   55.106687] [drm:drm_mode_object_put.part.0] OBJ ID: 66 (5)
[   55.106697] [drm:drm_mode_object_put.part.0] OBJ ID: 66 (4)
[   55.106739] [drm:drm_atomic_check_only] checking a07053f4
[   55.106769] exynos-drm exynos-drm: [drm:exynos_plane_atomic_check]
plane : offset_x/y(0,0), width/height(4,800)
[   55.106785] exynos-drm exynos-drm: [drm:exynos_plane_atomic_check]
plane : offset_x/y(4,0), width/height(1276,800)
[   55.106798] exynos-drm exynos-drm: [drm:exynos_plane_atomic_check]
plane : offset_x/y(0,0), width/height(1280,800)
[   55.106813] exynos-drm exynos-drm: [drm:exynos_plane_atomic_check]
plane : offset_x/y(0,776), width/height(1280,24)
[   55.106827] [drm:drm_atomic_nonblocking_commit] committing a07053f4
nonblocking
[   55.106905] exynos-drm exynos-drm:
[drm:drm_calc_timestamping_constants] crtc 54: hwmode: htotal 1350,
vtotal 823, vdisplay 800
[   55.106922] exynos-drm exynos-drm:
[drm:drm_calc_timestamping_constants] crtc 54: clock 66663 kHz framedur
16666666 linedur 20251
[   55.106949] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] start
addr = 0x22f013f0, end addr = 0x232e93f0, size = 0x3e8000
[   55.106962] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane]
ovl_width = 4, ovl_height = 800
[   55.106977] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] osd
pos: tx = 0, ty = 0, bx = 3, by = 799
[   55.106989] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] osd
size = 0xc80
[   55.107005] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] start
addr = 0x21300000, end addr = 0x216e8000, size = 0x3e8000
[   55.107017] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane]
ovl_width = 1276, ovl_height = 800
[   55.107031] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] osd
pos: tx = 4, ty = 0, bx = 1279, by = 799
[   55.107043] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] osd
size = 0xf9380
[   55.107061] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] start
addr = 0x20500000, end addr = 0x208e8000, size = 0x3e8000
[   55.107073] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane]
ovl_width = 1280, ovl_height = 800
[   55.107086] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] osd
pos: tx = 0, ty = 0, bx = 1279, by = 799
[   55.107097] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] osd
size = 0xfa000
[   55.107115] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] start
addr = 0x22800000, end addr = 0x2281e000, size = 0x1e000
[   55.107127] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane]
ovl_width = 1280, ovl_height = 24
[   55.107140] exynos4-fb 11c00000.fimd: [drm:fimd_update_plane] osd
pos: tx = 0, ty = 776, bx = 1279, by = 799
[   55.107168] exynos-drm exynos-drm: [drm:drm_update_vblank_count]
updating vblank count on crtc 0: current=3108, diff=0, hw=0 hw_last=0
[   55.172238] [drm:drm_ioctl] comm="RenderThread" pid=1145, dev=0xe281,
auth=1, DRM_IOCTL_SYNCOBJ_HANDLE_TO_FD
[   55.215253] ------------[ cut here ]------------
[   55.215285] WARNING: CPU: 1 PID: 115 at
../drivers/gpu/drm/drm_atomic_helper.c:1513
drm_atomic_helper_wait_for_vblanks.part.1+0x2b8/0x2bc
[   55.215294] [CRTC:54:crtc-0] vblank wait timed out
[   55.215299] Modules linked in: s5p_mfc s5p_jpeg v4l2_mem2mem
videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common
rfcomm kheaders hidp hci_uart cpufreq_userspace cpufreq_powersave
cpufreq_conservative btbcm brcmfmac brcmutil bnep bluetooth atmel_mxt_ts
[   55.215402] CPU: 1 PID: 115 Comm: kworker/u8:2 Tainted: G        W
5.10.101+ #15
[   55.215408] Hardware name: Samsung Exynos (Flattened Device Tree)
[   55.215421] Workqueue: events_unbound commit_work
[   55.215430] Backtrace: 
[   55.215449] [<c010d9c4>] (dump_backtrace) from [<c010dd18>]
(show_stack+0x20/0x24)
[   55.215460] r7:60000013 r6:c13c6d8c r5:00000000 r4:c13c6d8c
[   55.215473] [<c010dcf8>] (show_stack) from [<c0cd3e7c>]
(dump_stack_lvl+0x90/0xa4)
[   55.215485] [<c0cd3dec>] (dump_stack_lvl) from [<c0cd3ea8>]
(dump_stack+0x18/0x1c)
[   55.215496] r9:c070cab4 r8:000005e9 r7:00000009 r6:00000000
r5:c102b268 r4:c2165dec
[   55.215511] [<c0cd3e90>] (dump_stack) from [<c0138098>]
(__warn+0x110/0x114)
[   55.215523] [<c0137f88>] (__warn) from [<c0138124>]
(warn_slowpath_fmt+0x88/0xc4)
[   55.215534] r9:00000009 r8:c070cab4 r7:000005e9 r6:c102b268
r5:c102b7dc r4:c2164000
[   55.215550] [<c01380a0>] (warn_slowpath_fmt) from [<c070cab4>]
(drm_atomic_helper_wait_for_vblanks.part.1+0x2b8/0x2bc)
[   55.215561] r9:00000000 r8:00000001 r7:00000000 r6:00000000
r5:00000000 r4:c213d000
[   55.215575] [<c070c7fc>] (drm_atomic_helper_wait_for_vblanks.part.1)
from [<c070e31c>] (drm_atomic_helper_commit_tail_rpm+0x6c/0x7c)
[   55.215586] r10:c13cdc78 r9:00000000 r8:00000000 r7:d4511ee8
r6:0000000c r5:c213c800
[   55.215592] r4:d0e42b00
[   55.215603] [<c070e2b0>] (drm_atomic_helper_commit_tail_rpm) from
[<c070e724>] (commit_tail+0xb8/0x1d4)
[   55.215611] r5:00000000 r4:d0e42b00
[   55.215621] [<c070e66c>] (commit_tail) from [<c070e85c>]
(commit_work+0x1c/0x20)
[   55.215632] r10:c141cfe0 r9:00000000 r8:00000000 r7:c1c0f000
r6:c1c0a400 r5:c1f16080
[   55.215638] r4:d0e42b30
[   55.215650] [<c070e840>] (commit_work) from [<c01583b8>]
(process_one_work+0x1b0/0x594)
[   55.215661] [<c0158208>] (process_one_work) from [<c01587f8>]
(worker_thread+0x5c/0x550)
[   55.215672] r10:c1303d00 r9:00000088 r8:ffffe000 r7:c1c0a418
r6:c1f16094 r5:c1c0a400
[   55.215678] r4:c1f16080
[   55.215692] [<c015879c>] (worker_thread) from [<c0160bc0>]
(kthread+0x198/0x1b0)
[   55.215703] r10:c215be74 r9:00000000 r8:c1f16080 r7:c015879c
r6:c2164000 r5:c1f0d140
[   55.215710] r4:c211e200
[   55.215722] [<c0160a28>] (kthread) from [<c0100148>]
(ret_from_fork+0x14/0x2c)
[   55.215729] Exception stack(0xc2165fb0 to 0xc2165ff8)
[   55.215738] 5fa0:                                     00000000
00000000 00000000 00000000
[   55.215749] 5fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   55.215758] 5fe0: 00000000 00000000 00000000 00000000 00000013
00000000
[   55.215769] r10:00000000 r9:00000000 r8:00000000 r7:00000000
r6:00000000 r5:c0160a28
[   55.215775] r4:c1f0d140
[   55.215782] ---[ end trace 3478b4dd7c26b793 ]---
[   55.215804] [drm:drm_atomic_state_default_clear] Clearing atomic
state a07053f4
[   55.215820] [drm:drm_mode_object_put.part.0] OBJ ID: 60 (2)
[   55.215833] [drm:drm_mode_object_put.part.0] OBJ ID: 73 (3)
[   55.215844] [drm:drm_mode_object_put.part.0] OBJ ID: 72 (3)
[   55.215855] [drm:drm_mode_object_put.part.0] OBJ ID: 68 (2)
[   55.215865] [drm:drm_mode_object_put.part.0] OBJ ID: 66 (3)
[   55.215876] [drm:__drm_atomic_state_free] Freeing atomic state
a07053f4


If I can provide anything else that would be helpful to analyze this
problem, I'm happy to assist.

Kind Regards
Martin
