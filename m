Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A31623267
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 19:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDB410E616;
	Wed,  9 Nov 2022 18:25:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C05110E616
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 18:25:48 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id
 h8-20020a05660224c800b006d8de87e192so7791955ioe.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 10:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9fGqAIeMuhrwXfptcLbIlluni1y5fNYxkg7mqkWbCqw=;
 b=HF4TQIUN3UuMVNy+8MawJwg7Zu9PWBlLUlhP44fVE/SlmnfWDQlxc8cPDw9e7hjZFB
 rlxraF2ut4aTx74XDBWkxFGI1iQeN63V6SxmauZ6wL2W/u+1+FJ4WaLDyp/d68MHFkvT
 qk4vES6ap2/EG+yOMUIm4mui0TXe5iw7sTXeM9LdranLaySShuDIsyr5KZCFBlETw8MF
 vywUtA4qKvFTPmgJkOF7Obhe/t4svCHRe85EEPsIwrp5WW+J9avKcmmrTjZNxK9mrXKF
 GWMdNTh0vt7Ucc5R040qV8tA6z+lffN+sZ9KHW3UQcitPU3nMONoKRd/rzcP5glG8yJ7
 Gb/Q==
X-Gm-Message-State: ACrzQf2bwAApNkGSQVpcqB5Zh+CRRpMlWZgkw5tH2izoFDFzNyT8TCcG
 kUZwKHPsKofHzc85xUAmdZaN+K4zen5g1arw/70oAi8OjoLq
X-Google-Smtp-Source: AMsMyM5VSP02eDnDxeF9p9H+9ItHHOlHZltrqLdAkXdQwNZctajHd6PnT+o9/jbh0Fh90oK/DnP735XMapA8BWJqdWW52dpASwPk
MIME-Version: 1.0
X-Received: by 2002:a92:d283:0:b0:300:ddde:c31f with SMTP id
 p3-20020a92d283000000b00300dddec31fmr1890492ilp.246.1668018347394; Wed, 09
 Nov 2022 10:25:47 -0800 (PST)
Date: Wed, 09 Nov 2022 10:25:47 -0800
In-Reply-To: <00000000000090655b05a2ff399a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000134d6205ed0dc953@google.com>
Subject: Re: [syzbot] memory leak in drm_vma_node_allow
From: syzbot <syzbot+04639d98c75c52e41b8a@syzkaller.appspotmail.com>
To: 11115066@vivo.com, airlied@gmail.com, airlied@linux.ie, 
 anant.thazhemadam@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 igormtorrente@gmail.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    f141df371335 Merge tag 'audit-pr-20221107' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=123bdcd1880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f7ebe38e4b66a7b
dashboard link: https://syzkaller.appspot.com/bug?extid=04639d98c75c52e41b8a
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=158ec0c1880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=120cc3e1880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d056ae4a8f32/disk-f141df37.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/02fdf71b87b4/vmlinux-f141df37.xz
kernel image: https://storage.googleapis.com/syzbot-assets/14078d70a64d/bzImage-f141df37.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+04639d98c75c52e41b8a@syzkaller.appspotmail.com

executing program
executing program
executing program
executing program
BUG: memory leak
unreferenced object 0xffff88810f65f0c0 (size 64):
  comm "syz-executor402", pid 3630, jiffies 4294948375 (age 13.410s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 94 b3 05 81 88 ff ff  ................
  backtrace:
    [<ffffffff814cfce0>] kmalloc_trace+0x20/0x90 mm/slab_common.c:1046
    [<ffffffff826b5bd2>] kmalloc include/linux/slab.h:576 [inline]
    [<ffffffff826b5bd2>] drm_vma_node_allow+0x32/0x120 drivers/gpu/drm/drm_vma_manager.c:274
    [<ffffffff8269bbda>] drm_gem_handle_create_tail+0x10a/0x250 drivers/gpu/drm/drm_gem.c:377
    [<ffffffff826e45e9>] drm_gem_shmem_create_with_handle drivers/gpu/drm/drm_gem_shmem_helper.c:432 [inline]
    [<ffffffff826e45e9>] drm_gem_shmem_dumb_create+0xb9/0x200 drivers/gpu/drm/drm_gem_shmem_helper.c:534
    [<ffffffff826cb557>] drm_mode_create_dumb+0x117/0x150 drivers/gpu/drm/drm_dumb_buffers.c:96
    [<ffffffff8269d094>] drm_ioctl_kernel+0x144/0x260 drivers/gpu/drm/drm_ioctl.c:788
    [<ffffffff8269d49c>] drm_ioctl+0x2ec/0x4f0 drivers/gpu/drm/drm_ioctl.c:891
    [<ffffffff81602aec>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff81602aec>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff81602aec>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff81602aec>] __x64_sys_ioctl+0xfc/0x140 fs/ioctl.c:856
    [<ffffffff84608245>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84608245>] do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84800087>] entry_SYSCALL_64_after_hwframe+0x63/0xcd


