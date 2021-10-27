Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3428343BEF3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 03:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1FB6E4EA;
	Wed, 27 Oct 2021 01:20:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502516E4EA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 01:20:21 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id r28so1353068pga.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 18:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=lCiBeAFnaHniNfW4RWf0sWglC39grZloKnVh+Fb/4cA=;
 b=fDB0Jh91LeKE7MEFFEdv0pGBcz6T0/xyeXpa023IStCuFBMHFPq/Oj2Kv42zCg34Vm
 BNQIJwhSd3alGmaghekPkVXZhvlv8s7l/UQTx57Ck6h/hEiXwY1S1s4+t2Wj4kfvh/lC
 Dp9AnIbc5ss9rxfMSMllyRt8SLFgNZ7/aQqp/jQkreLMobGVYaKXNXFjCl8fPWiv2x+q
 gf0Q+axgFy3xAtiyyYvtvvHzCJqh7bJ35RvMLjcGHFAsfYjm62EthFC6FD9+jhzSOvoo
 C61I7qgSh544NgKcYMxIfctKXDxyUNvJjz1OX8FRz+ZwP66oHGMaVgoMxWbcecZenN2a
 QESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=lCiBeAFnaHniNfW4RWf0sWglC39grZloKnVh+Fb/4cA=;
 b=VgNIFKAMaZ41k49XID6KvH2KM0eOS8Ue/u+UBCHK6F8JZ7rBWcAKoZOGvVi+9REO+N
 nnfdOiBZh7rV5PEhkIaRvMeEwXz05MZ7g3dOfOhFJKzhLYMXib7a23Y1lIWYXtUhkAHJ
 AeijvIlUlP/ZlS0tyYHItxYOo2O3DLxe01V0+jLmUGOPqeyhg/m75k5PkhkMvJH+mTlh
 ANS5OfL1HDopI7OEhVBQ2ASX7WBndmIEK9bk+dnfBT9oiwGNwbQ8ac8ZGLrrhpM2H1RY
 rAJTbiZUnlScfVT/WeN7aFEcjV9LctYRc8AG8T5vRh1sHoORppLE60EsRcIi/yCo+Bs0
 F+Rg==
X-Gm-Message-State: AOAM533HZAccT8JDGLsIxh8E3wx3HYJOlxLtUF5iWqizTa6Y69cBFXjy
 F4nZUdDfE1j+jcq70Z8tSko4Og9o0HYdD3BM6/cwviX9hGTBgR+rZQ==
X-Google-Smtp-Source: ABdhPJy5sckpy0bgbbhJMUkpzV1d6ndtoSi4WF0fnp3+5cLZgFijVS9ILGiftbpdrZbVX5mBw1erb/64Gorrg5r7FQs=
X-Received: by 2002:a05:6a00:1242:b0:44c:2025:29e3 with SMTP id
 u2-20020a056a00124200b0044c202529e3mr29820950pfi.59.1635297620605; Tue, 26
 Oct 2021 18:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <CACkBjsaAFR4Jx3+pxM5zM09jFL1Th2pi-XNfn4CoSrjePmxSKQ@mail.gmail.com>
In-Reply-To: <CACkBjsaAFR4Jx3+pxM5zM09jFL1Th2pi-XNfn4CoSrjePmxSKQ@mail.gmail.com>
From: Hao Sun <sunhao.th@gmail.com>
Date: Wed, 27 Oct 2021 09:20:07 +0800
Message-ID: <CACkBjsZaNnPkvPLJ14xN85AsAy1S52CkaeYAPtE+VBwBWhFA_g@mail.gmail.com>
Subject: Re: KASAN: vmalloc-out-of-bounds Write in imageblit
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This bug can still be triggered repeatedly on the latest Linux.

HEAD commit: 519d81956ee2 Linux 5.15-rc6
git tree: upstream
console output:
https://drive.google.com/file/d/17xFIX8JgBxamy8iUnUTAdcVvaASuhqxr/view?usp=sharing
kernel config: https://drive.google.com/file/d/12PUnxIM1EPBgW4ZJmI7WJBRaY1lA83an/view?usp=sharing

==================================================================
BUG: KASAN: vmalloc-out-of-bounds in fast_imageblit
drivers/video/fbdev/core/sysimgblt.c:229 [inline]
BUG: KASAN: vmalloc-out-of-bounds in sys_imageblit+0x1372/0x13f0
drivers/video/fbdev/core/sysimgblt.c:275
Write of size 4 at addr ffffc90005759380 by task syz-executor/31261

CPU: 2 PID: 31261 Comm: syz-executor Not tainted 5.15.0-rc6 #4
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xf/0x334 mm/kasan/report.c:256
 __kasan_report mm/kasan/report.c:442 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:459
 fast_imageblit drivers/video/fbdev/core/sysimgblt.c:229 [inline]
 sys_imageblit+0x1372/0x13f0 drivers/video/fbdev/core/sysimgblt.c:275
 drm_fb_helper_sys_imageblit+0x1c/0x180 drivers/gpu/drm/drm_fb_helper.c:794
 drm_fbdev_fb_imageblit+0x179/0x260 drivers/gpu/drm/drm_fb_helper.c:2282
 bit_putcs_unaligned drivers/video/fbdev/core/bitblit.c:139 [inline]
 bit_putcs+0x8ed/0xd80 drivers/video/fbdev/core/bitblit.c:188
 fbcon_putcs+0x362/0x450 drivers/video/fbdev/core/fbcon.c:1296
 do_update_region+0x399/0x630 drivers/tty/vt/vt.c:676
 invert_screen+0x2a7/0x610 drivers/tty/vt/vt.c:800
 highlight drivers/tty/vt/selection.c:57 [inline]
 clear_selection drivers/tty/vt/selection.c:84 [inline]
 clear_selection+0x55/0x70 drivers/tty/vt/selection.c:80
 vc_do_resize+0xda8/0x10a0 drivers/tty/vt/vt.c:1257
 fbcon_do_set_font+0x47e/0x780 drivers/video/fbdev/core/fbcon.c:2397
 fbcon_set_font+0x81e/0xa10 drivers/video/fbdev/core/fbcon.c:2483
 con_font_set drivers/tty/vt/vt.c:4666 [inline]
 con_font_op+0x73a/0xca0 drivers/tty/vt/vt.c:4710
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]
 vt_ioctl+0x1de9/0x2af0 drivers/tty/vt/vt_ioctl.c:752
 tty_ioctl+0xc80/0x1450 drivers/tty/tty_io.c:2805
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7ff832e3ec4d
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff8303a6c58 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ff832f650a0 RCX: 00007ff832e3ec4d
RDX: 0000000020000100 RSI: 0000000000004b72 RDI: 0000000000000004
RBP: 00007ff832eb7d80 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ff832f650a0
R13: 00007ffffdbaddff R14: 00007ffffdbadfa0 R15: 00007ff8303a6dc0


Memory state around the buggy address:
 ffffc90005759280: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90005759300: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc90005759380: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                   ^
 ffffc90005759400: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90005759480: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================
