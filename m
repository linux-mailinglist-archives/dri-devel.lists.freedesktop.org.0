Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD584AD335
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060AA10E495;
	Tue,  8 Feb 2022 08:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3BA10E269
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 07:51:30 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 b3-20020a056e020c8300b002be19f9e043so3969844ile.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 23:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=f+PS8bYwF5wBhMvgVJjLy1tyVfgdFtf4D2GhyeRWiOg=;
 b=SZQQk5TaWIguh/PlQLjnpVKRxbJgM+DXr85KlvlT8w/LWZwhYmpnz0WOz4U3DD0u47
 SgdQPRWhbYuNvtqOCaxAUqzdHfAmJCkXVI/+it12lQbXoxLd1AKQfB7IhErbBnJ0p2yp
 YthYZgL+ON5ysZIECuV6RFNCfyxZaYB8PCn1IRiYDbrZtx5WlZn2oD2ageXOnPxQoosB
 030JreubEiXw/nyjs3mX60OFBQTg4gReAudGari/T/CwVEv6mX3Bv4Shz2o7GJI/GEsk
 IEqW9bDdWsm1ZKFjaeV/9mFZrjeSEQw4IyIk43rl+0OHVaZUdc9vOSDNNIceafs2JQJN
 ijbw==
X-Gm-Message-State: AOAM5314IlUYXankNM4iK83/QvCS6h2YDksTf/qSEpV18YUSQCBYMctg
 rwBLnBVmhcHNxCd0NcUvsbMOB75wcVCO57+VZl07XgDNmHCb
X-Google-Smtp-Source: ABdhPJztnn1YEJ0TMUD57Lu2Md6Du6wd1J/i/PO2DCxV9ey6Vq/j+ereZKbMz1nZFzkFMgz0eNnlgPhqo0CxN2Kj/zBQHhA2IezH
MIME-Version: 1.0
X-Received: by 2002:a92:1311:: with SMTP id 17mr1605580ilt.42.1644306689312;
 Mon, 07 Feb 2022 23:51:29 -0800 (PST)
Date: Mon, 07 Feb 2022 23:51:29 -0800
In-Reply-To: <00000000000016f4ae05d5cec832@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001e4c2e05d77cfcbb@google.com>
Subject: Re: [syzbot] WARNING in component_del
From: syzbot <syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, rafael@kernel.org, 
 syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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

HEAD commit:    555f3d7be91a Merge tag '5.17-rc3-ksmbd-server-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=130a0c2c700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=266de9da75c71a45
dashboard link: https://syzkaller.appspot.com/bug?extid=60df062e1c41940cae0f
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15880d84700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14de0c77b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+60df062e1c41940cae0f@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 3598 at drivers/base/component.c:767 component_del+0x40c/0x540 drivers/base/component.c:765
Modules linked in:
CPU: 0 PID: 3598 Comm: syz-executor255 Not tainted 5.17.0-rc3-syzkaller-00020-g555f3d7be91a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:component_del+0x40c/0x540 drivers/base/component.c:767
Code: 00 48 39 6b 20 75 82 e8 72 b1 07 fd 48 c7 43 20 00 00 00 00 e9 70 ff ff ff e8 60 b1 07 fd 48 c7 c7 20 aa 67 8c e8 84 d4 db 04 <0f> 0b 31 ed e8 4b b1 07 fd 48 89 ef 5b 5d 41 5c 41 5d 41 5e 41 5f
RSP: 0018:ffffc90001aafa68 EFLAGS: 00010286
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: ffff8880745c8000
RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffc90001aaf9b0
RBP: ffffffff8c67a9e0 R08: 0000000000000001 R09: ffffc90001aaf9b7
R10: fffff52000355f36 R11: 0000000000000001 R12: ffff88801dce5008
R13: ffffffff8a4c0dc0 R14: ffff88801dce5008 R15: ffff88801dce5000
FS:  0000555556461300(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb3739a5130 CR3: 000000001996f000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 usb_hub_remove_port_device+0x272/0x370 drivers/usb/core/port.c:653
 hub_disconnect+0x171/0x510 drivers/usb/core/hub.c:1737
 usb_unbind_interface+0x1d8/0x8e0 drivers/usb/core/driver.c:458
 __device_release_driver+0x5d7/0x700 drivers/base/dd.c:1206
 device_release_driver_internal drivers/base/dd.c:1237 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1260
 usb_driver_release_interface+0x102/0x180 drivers/usb/core/driver.c:627
 proc_ioctl.part.0+0x4d6/0x560 drivers/usb/core/devio.c:2332
 proc_ioctl drivers/usb/core/devio.c:170 [inline]
 proc_ioctl_default drivers/usb/core/devio.c:2375 [inline]
 usbdev_do_ioctl drivers/usb/core/devio.c:2731 [inline]
 usbdev_ioctl+0x2b29/0x36c0 drivers/usb/core/devio.c:2791
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fb3739346f9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff3db9d808 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fb373978194 RCX: 00007fb3739346f9
RDX: 0000000020000380 RSI: 00000000c0105512 RDI: 0000000000000003
RBP: 0000000000000000 R08: 00007fff3db9d280 R09: 0000000000000001
R10: 000000000000ffff R11: 0000000000000246 R12: 00007fff3db9d81c
R13: 431bde82d7b634db R14: 0000000000000000 R15: 0000000000000000
 </TASK>

