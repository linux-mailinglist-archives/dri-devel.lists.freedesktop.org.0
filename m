Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0AC2F3B63
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 21:07:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C298F89A8B;
	Tue, 12 Jan 2021 20:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064AD89A5E;
 Tue, 12 Jan 2021 20:07:51 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id e7so4264760ljg.10;
 Tue, 12 Jan 2021 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/tobY7ezO6LrE4QA5HV9kviagXZktigtMpsQ2QWWzuE=;
 b=LAht48GN6mOos3PYtcv3g1fPNKUbpHPHs4bwxvnmb60gSmR/zDdeRg4F/M/ijI3gZ9
 5cBKEubIRe4zwAlDrZgUTzZnZsqHyMKCmLNYhBiz3EcmquqK239nMGjRp780SwJBOiQx
 Pk3jvn37xsHJtYvLI+OW0TAnsB1/8ZPaOk1PEWtu+fmktUZxyC1k92ujFM9yXFyI1eLT
 FGbo8t1UDyM5B+tRBoQD9wggxNWqb76Ue9IJjFKB0EJ3xqeRL993Fb/JiQviGVxPyDws
 uJ2ix6EXfu1VseQzK1kWtw5t5urV47Pn8QnTCKrJcoD7ZS3S7aAhp0itOTk7/24B0vmh
 No3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/tobY7ezO6LrE4QA5HV9kviagXZktigtMpsQ2QWWzuE=;
 b=WDoZXW5b6SVDpGzgb/W3HDaouUSk07uf6TCv682TiUeNKR7vrN6Pjz0nVFPDlm1F7L
 uJQD4OTEgK4ZFVffJckaWNlgAwRMV8N096+a56RgphKk5vd/OnAJyxu8wrzrvl+qlWl7
 PSWPwEako3zmouCFO5MjgESJKZCslrADv3lbaNvGoMVA8jVYMMDgHSwJCkgHMay64kEs
 GYdKbzTatQmV7cuazhg4H/F+9j9wGPFUapAEWeARN0hzBR1XFaTbb1V8ZDBolg1oc3JP
 6eUKEjs+F4Fv5iwNxLELnRHyXPHpczN1rKhv1q3P8DDedTmludhtQ3EualA3M5A1VFf8
 XmwQ==
X-Gm-Message-State: AOAM531TUziMom/XdxGBPWKTSL6WgU2zHoPeUo/td5EtTopDBwWwQmHG
 5ATDnGoubcTm+P7GzijwiahEF+olRv2v+3DMlVY=
X-Google-Smtp-Source: ABdhPJwZ1JG2IKKl+3znp70QJutEqLb6NEUc8POiQahxZKiN3UiJp9mcF4OPHQN2mbaokE9uFXStwDOzsVYd+dGWX4M=
X-Received: by 2002:a2e:b556:: with SMTP id a22mr373231ljn.264.1610482069239; 
 Tue, 12 Jan 2021 12:07:49 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 12 Jan 2021 17:07:37 -0300
Message-ID: <CAOMZO5D_dDTOgDZNy-NkQSPTiKhmrNKjEiqFWGX4rbZr2grDxQ@mail.gmail.com>
Subject: Reboot crash at msm_atomic_commit_tail
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I have noticed that on an imx53-qsb, it is no longer possible to
reboot the system as it fails like this:

Requesting system reboot
[   23.819116] cfg80211: failed to load regulatory.db
[   23.827569] imx-sdma 63fb0000.sdma: external firmware not found,
using ROM firmware
[   23.956838] ci_hdrc ci_hdrc.0: remove, state 1
[   23.968029] usb usb1: USB disconnect, device number 1
[   23.976033] usb 1-1: USB disconnect, device number 2
[   24.234253] ci_hdrc ci_hdrc.0: USB bus 1 deregistered
[   24.268964] 8<--- cut here ---
[   24.274602] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[   24.283434] pgd = (ptrval)
[   24.286387] [00000000] *pgd=ca212831
[   24.290788] Internal error: Oops: 17 [#1] SMP ARM
[   24.295609] Modules linked in:
[   24.298777] CPU: 0 PID: 197 Comm: init Not tainted
5.11.0-rc2-next-20210111 #333
[   24.306276] Hardware name: Freescale i.MX53 (Device Tree Support)
[   24.312442] PC is at msm_atomic_commit_tail+0x54/0xb9c
[   24.317743] LR is at commit_tail+0xa4/0x1b0
[   24.322032] pc : [<c0769b78>]    lr : [<c06db0b4>]    psr: 60000013
[   24.328374] sp : c28d1d50  ip : c23a3000  fp : 00000000
[   24.333670] r10: c2816780  r9 : c12d71c0  r8 : c17fb018
[   24.338967] r7 : c23a3000  r6 : c2816780  r5 : 00000000  r4 : 00000000
[   24.345572] r3 : c24c2c00  r2 : c23a3000  r1 : c0769b24  r0 : 00000000
[   24.352177] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[   24.359407] Control: 10c5387d  Table: 72858019  DAC: 00000051
[   24.365220] Process init (pid: 197, stack limit = 0x(ptrval))
[   24.371052] Stack: (0xc28d1d50 to 0xc28d2000)
[   24.375508] 1d40:                                     ffffffff
00000000 9682f000 00000005
[   24.383794] 1d60: 3031e53d 00000000 00000dc0 c0f816d8 c23a3000
c23a3000 00000000 c17fb018
[   24.392079] 1d80: c12d71c0 c2816780 00000000 c06db0b4 a5f7faba
00000005 00000000 c2816780
[   24.400363] 1da0: 00000000 c23a3000 00000000 c17fb018 c12d71c0
c24c20a0 00000000 c06dbed0
[   24.408647] 1dc0: 00000000 00000000 c2816780 c23a349c c2816780
c28d1dfc c23a34a4 c06db604
[   24.416932] 1de0: c23a3000 00000000 c1609388 c12ba9dc c17fb018
c06db704 c2965e80 c2965e80
[   24.425214] 1e00: 00000008 00000001 00000000 00000000 c175f454
00000000 c175f458 c1c669cc
[   24.433498] 1e20: 00000000 c12bebb8 00000000 00000001 00000008
00000000 c23a32ec c23a32ec
[   24.441783] 1e40: 00000000 433f193b c24c2014 c24c2014 c24c2010
c17674c8 c1e68bec c07c76e8
[   24.450067] 1e60: 00000000 c16158d8 c1609388 fee1dead 00000000
c28d0000 00000058 c0153730
[   24.458350] 1e80: 01234567 c01539d4 fffffffe 00000000 00000000
00000000 00000000 00000000
[   24.466633] 1ea0: 00000000 00000000 00000000 00000000 00000000
ffffffff 00000000 c1609388
[   24.474917] 1ec0: c29663c8 00000000 00000000 c0e17954 ffffe000
ffffffff 00000001 ffffffff
[   24.483200] 1ee0: c1609388 c1609388 c16093d4 433f193b 00000000
c1581584 ffffe000 1ea51000
[   24.491485] 1f00: 00000001 00000080 c1609388 c1609794 c29663c8
00000000 00000000 c0e17954
[   24.499769] 1f20: 00000000 ffffffff 00000000 c1609388 c1609388
c16093d4 00000000 c1609388
[   24.508054] 1f40: c29663c8 c0183f24 c2965e80 c1609388 00000001
c1609794 c2995090 c018ce7c
[   24.516337] 1f60: 00000001 c2995080 c0136e80 c010012c 00000000
00000001 c158b21c c0e22334
[   24.524622] 1f80: c158b21c c010019c c1609794 433f193b 00000000
beefefd4 00000001 00000058
[   24.532907] 1fa0: c0100264 c0100080 00000000 beefefd4 fee1dead
28121969 01234567 00000000
[   24.541191] 1fc0: 00000000 beefefd4 00000001 00000058 00000000
00000000 b6f1ef74 00000000
[   24.549476] 1fe0: 000d7298 beefed40 00091a48 b6e8894c 60000010
fee1dead 00000000 00000000
[   24.557742] [<c0769b78>] (msm_atomic_commit_tail) from [<c06db0b4>]
(commit_tail+0xa4/0x1b0)
[   24.566349] [<c06db0b4>] (commit_tail) from [<c06dbed0>]
(drm_atomic_helper_commit+0x154/0x188)
[   24.575193] [<c06dbed0>] (drm_atomic_helper_commit) from
[<c06db604>] (drm_atomic_helper_disable_all+0x154/0x1c0)
[   24.585599] [<c06db604>] (drm_atomic_helper_disable_all) from
[<c06db704>] (drm_atomic_helper_shutdown+0x94/0x12c)
[   24.596094] [<c06db704>] (drm_atomic_helper_shutdown) from
[<c07c76e8>] (device_shutdown+0x118/0x250)
[   24.605475] [<c07c76e8>] (device_shutdown) from [<c0153730>]
(kernel_restart+0xc/0x68)
[   24.613574] [<c0153730>] (kernel_restart) from [<c01539d4>]
(__do_sys_reboot+0x144/0x200)
[   24.621915] [<c01539d4>] (__do_sys_reboot) from [<c0100080>]
(ret_fast_syscall+0x0/0x2c)
[   24.630160] Exception stack(0xc28d1fa8 to 0xc28d1ff0)
[   24.635315] 1fa0:                   00000000 beefefd4 fee1dead
28121969 01234567 00000000
[   24.643600] 1fc0: 00000000 beefefd4 00000001 00000058 00000000
00000000 b6f1ef74 00000000
[   24.651867] 1fe0: 000d7298 beefed40 00091a48 b6e8894c
[   24.657025] Code: 1592208c 1185521c e1530000 1afffff8 (e5942000)
[   24.663681] ---[ end trace 9a1e129deec83f42 ]---
[   25.670432] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000000
[   25.678331] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x00000000 ]---

It happens on 5.4 as well as 5.11-rc2.

Any ideas?

Thanks,

Fabio Estevam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
