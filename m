Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693033D3535
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 09:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3B06EB26;
	Fri, 23 Jul 2021 07:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBAA6FA4D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 07:26:21 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 c2-20020a0568303482b029048bcf4c6bd9so1193481otu.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 00:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eAfXNriCEQNG4MBmD1ShL7PN8hxdwdR3h6w9mguTiCM=;
 b=AOWYjv0yajdJcPFOlhyDmX9QtK7rrJdre8VVguZup+GG20fxincfy4UwP3zRrsvF89
 sPcRIVOVysuFNcdRZNlYwdBt/uAThegzxHy/rLtwOgbkbF4563lOu5ayrpH67ZMBWpso
 zeUXZ4p/F8/Mx3ttkxVj7umjg1RbQ5rYGJEZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eAfXNriCEQNG4MBmD1ShL7PN8hxdwdR3h6w9mguTiCM=;
 b=Lld4pBkdlaD2DQUzqKcWR2C6AmK2ZDWWGtPaSYKNQKu9+Sd2drsESuN/y4IUNdVOuF
 A+hQJdJW0r5SsfdKKHvUJaQnnLJ1XanTtyVSGqfEtlbmDP+3xVStO2cCp2PQtAeWlcgd
 xqH9WjFHoQthGR5lbLWM6jBP8td31gObRMpobhls0CP+3pd2TM47v0dPbAhoPdlcD4SI
 KO7+ha90vwI1b/XXZVBzT/je+lIKLEY5bpI0MnNtXxU63k/ZeSlPocWOMUPZGPBZp595
 kkK+GjutzpjctQr08u1/2L/1TKPYotPcnoJJevTCtUwRtSkSLBa96tUePIPvB8LJpCt3
 WtgA==
X-Gm-Message-State: AOAM5319kxQ5tyvFvUKf+rUAE5Ky/4GuA0vLBlw/FEYa/H6ZQhmLflrP
 wPDWNcfyK01Wkc7+ZQkYQoO8cPx4GlJKhbQ4VYpipA==
X-Google-Smtp-Source: ABdhPJzlhTudVtSXpUwWI8iR5mvPPteqR9jagIxSnfYkCMYbreiZ931MCTxCUuXcuvTtfDhPTtUhpSJ98Aba2zR6aVE=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr2132235otu.303.1627025181040; 
 Fri, 23 Jul 2021 00:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <202107222122.05546.linux@zary.sk>
 <CACO55tvq0Ksm6x_L3r6B8KhYR6dTqb=xzPaRzAeQgaBnff_sYA@mail.gmail.com>
In-Reply-To: <CACO55tvq0Ksm6x_L3r6B8KhYR6dTqb=xzPaRzAeQgaBnff_sYA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 23 Jul 2021 09:26:10 +0200
Message-ID: <CAKMK7uGee+A2hzY8meXnBAWDuQGs=c=3oww8-JxMJWxF8_kR=A@mail.gmail.com>
Subject: Re: [Nouveau] nouveau broken again on Riva TNT2 in 5.14.0-rc2
To: Karol Herbst <kherbst@redhat.com>
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
Cc: Ondrej Zary <linux@zary.sk>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 22, 2021 at 9:51 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> hey thanks for the report.
>
> This is a known issue and the fix is pending in drm-mist-fixes and
> should land in 5.14 soonish.

It just landed in Linus' tree yesterday, please retest that or -rc3.
If it's still broken it's something else.
-Daniel

>
> On Thu, Jul 22, 2021 at 9:29 PM Ondrej Zary <linux@zary.sk> wrote:
> >
> > Hello,
> > nouveau is broken again:
> >
> > [   58.795794] BUG: kernel NULL pointer dereference, address: 0000017c
> > [   58.795835] #PF: supervisor read access in kernel mode
> > [   58.795844] #PF: error_code(0x0000) - not-present page
> > [   58.795851] *pde = 00000000
> > [   58.795862] Oops: 0000 [#1] SMP
> > [   58.795875] CPU: 0 PID: 1730 Comm: Xorg Not tainted 5.14.0-rc2+ #391
> > [   58.795886] Hardware name: VIA Technologies, Inc. VT82C694X/694X, BIOS 6.00 PG 02/19/2002
> > [   58.795894] EIP: nouveau_bo_wr16+0x8/0x27 [nouveau]
> > [   58.796716] Code: 85 ff 74 0d 80 7d f3 00 74 07 80 a6 c0 01 00 00 fe 89 f0 e8 e5 ee ff ff 8d 65 f4 89 f8 5b 5e 5f 5d c3 55 01 d2 89 e5 53 89 c3 <03> 93 7c 01 00 00 0f b7 c1 f6 83 84 01 00 00 80 74 07 e8 8a bc 72
> > [   58.796728] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: 00000000
> > [   58.796736] ESI: 00000020 EDI: c18bc600 EBP: c7c49d88 ESP: c7c49d84
> > [   58.796744] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210246
> > [   58.796754] CR0: 80050033 CR2: 0000017c CR3: 07e12000 CR4: 00000690
> > [   58.796762] Call Trace:
> > [   58.796774]  nv04_crtc_cursor_set+0x148/0x1d8 [nouveau]
> > [   58.796952]  ? ttm_bo_reserve.constprop.16+0x1c/0x1c [nouveau]
> > [   58.797122]  drm_mode_cursor_common+0x13b/0x1ad
> > [   58.797150]  ? ttm_bo_reserve.constprop.16+0x1c/0x1c [nouveau]
> > [   58.797322]  drm_mode_cursor_ioctl+0x2e/0x36
> > [   58.797335]  ? drm_mode_setplane+0x203/0x203
> > [   58.797346]  drm_ioctl_kernel+0x66/0x99
> > [   58.797366]  drm_ioctl+0x211/0x2d8
> > [   58.797377]  ? drm_mode_setplane+0x203/0x203
> > [   58.797389]  ? __cond_resched+0x1e/0x22
> > [   58.797409]  ? mutex_lock+0xb/0x24
> > [   58.797422]  ? rpm_resume.part.14+0x6f/0x362
> > [   58.797447]  ? ktime_get_mono_fast_ns+0x5e/0xf2
> > [   58.797469]  ? __pm_runtime_resume+0x5b/0x63
> > [   58.797480]  nouveau_drm_ioctl+0x65/0x81 [nouveau]
> > [   58.797662]  ? nouveau_cli_work+0xc3/0xc3 [nouveau]
> > [   58.797838]  vfs_ioctl+0x1a/0x24
> > [   58.797850]  __ia32_sys_ioctl+0x6ea/0x704
> > [   58.797861]  ? doublefault_shim+0x120/0x120
> > [   58.797872]  ? exit_to_user_mode_prepare+0x9e/0x10c
> > [   58.797900]  do_int80_syscall_32+0x53/0x6e
> > [   58.797910]  entry_INT80_32+0xf0/0xf0
> > [   58.797923] EIP: 0xb7f04092
> > [   58.797932] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 e8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
> > [   58.797943] EAX: ffffffda EBX: 0000000e ECX: c01c64a3 EDX: bf9a15c0
> > [   58.797952] ESI: 00997850 EDI: c01c64a3 EBP: 0000000e ESP: bf9a1574
> > [   58.797959] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200292
> > [   58.797972] Modules linked in: i2c_dev nouveau wmi hwmon drm_ttm_helper psmouse serio_raw via_agp sg parport_pc 8139cp parport
> > [   58.798016] CR2: 000000000000017c
> > [   58.798147] ---[ end trace 732829d39ed65de9 ]---
> >
> >
> > d02117f8efaa5fbc37437df1ae955a147a2a424a is the first bad commit
> >
> > --
> > Ondrej Zary
> >
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
