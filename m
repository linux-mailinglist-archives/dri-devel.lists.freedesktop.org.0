Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C296DF1E4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 12:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFA910E0DF;
	Wed, 12 Apr 2023 10:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3547710E77C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 10:24:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f08b6a9f8aso54375e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 03:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1681295083; x=1683887083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxun6ZVm+ttJejAjpxCebQILRWh3ItaNHDjL2I+kovw=;
 b=vZlFw6Qh8QV93J5XVFpRDYwwe3qvBJl2dGvAsl8YA4myXVIFlmjj7aDWnrK7OH4BT5
 fKCpZYkXjXDzsjryjJZRy+DtN2Hbhdal7GlqSvEY1C46/7/QRCdyJFMh0+ZQXkY2aUrD
 BcSVSUyXzUhoX4IZYkAev7mIHTmrLICSEu10sGRTcMoEREO/1lB+aQPfITFSkytn5iAz
 /hLB06CUrCk4I3obgQU3PzTXxWaiw0HyLqNlhDbL7pAvtwwfsfGYdkcAz+Y8OOLQ/vIE
 6Tj48GSto68nguo/L5XX4xPleOOo0xGWIzC5W/thZoXALAKa6Mxw8P6fxMaRD8Dgqcoh
 ZxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681295083; x=1683887083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qxun6ZVm+ttJejAjpxCebQILRWh3ItaNHDjL2I+kovw=;
 b=BFL65KyCNJ+2+dGSypDo0ePqgzNyXt/yAbBzCmVv35kdiXmgaucP6u1vkMNqUZjzr1
 BpmvkCIHcm2wIhsRLPrTxeG7Q3MslCBjgrXPjTiad/2lJVz7SzND958z2/3PiHt6V1Ro
 dipE1CjXg49TR5ADS9VAZzKzQSXGEnGxBZtD6x7etUFmiO7PWuqxQFL5LU7tjhFJK1wc
 +2rU/iB4DAHvEbIslfyEkTsJ3NcoIf84CeV9t+TwlwF0K2CUtQApV3dl9vWqAqYNOx6v
 zWrXMpm8oc8VCNkPEvfwcT3p1ktzZpQ/qLdYNp54REaGqszVVxGTpPBIsC2Wg73wvrDd
 OE2g==
X-Gm-Message-State: AAQBX9eF9mj/LhZ55uvfD9BMEudQ8Ak/ZHsqWFnyoMWlP4p/WZ248Zn0
 V8MrHyr6OpI2ujxJREfnGPKimEob4ZVXZ+dxVQQmPg==
X-Google-Smtp-Source: AKy350bHxVQq/8UVMu5U97LLFyEkw0iLPISoHvuakkOLyQlL/Rp9DQdgQl0m77rxSmjh8W2KAdI+C8ABbwqe7JbelJQ=
X-Received: by 2002:a05:600c:4450:b0:3f0:9e90:a20d with SMTP id
 v16-20020a05600c445000b003f09e90a20dmr86835wmn.6.1681295082838; Wed, 12 Apr
 2023 03:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000080a2d405f8aea527@google.com>
 <ZC8Nqs9ZSqMKbHa9@phenom.ffwll.local>
In-Reply-To: <ZC8Nqs9ZSqMKbHa9@phenom.ffwll.local>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 12 Apr 2023 12:24:30 +0200
Message-ID: <CANp29Y4V7LsaJk0h3GyWV-chE8YkwM2qX33_hy9ZF5si8ZLdDg@mail.gmail.com>
Subject: Re: [syzbot] [dri?] WARNING in vkms_get_vblank_timestamp
To: syzbot <syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail.com>, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com, 
 linux-kernel@vger.kernel.org, melissa.srw@gmail.com, 
 rodrigosiqueiramelo@gmail.com, syzkaller-bugs@googlegroups.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 6, 2023 at 8:59=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> On Thu, Apr 06, 2023 at 10:57:48AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    4b0f4525dc4f Add linux-next specific files for 20230331
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D13ea0159c80=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D85cc4b935a1=
f7194
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D75cc0f9f7e632=
4dd2501
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binu=
tils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D15cb3659c=
80000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/8d06bb015df3/d=
isk-4b0f4525.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/6a1c1ebf3724/vmli=
nux-4b0f4525.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/4bb2b8d6cd7d=
/bzImage-4b0f4525.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail.com
>
> Should be fixed with f2c7ca890182 ("drm/atomic-helper: Don't set deadline
> for modesets"). And maybe also 6f1ccbf07453 ("drm/vblank: Fix for drivers
> that do not drm_vblank_init()").
>
> Would be great if you can confirm. The regression was introduced in
> d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank") if my
> guess is correct.
> -Daniel

Let's ask the bot to retest the reproducer

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.gi=
t
master

>
> >
> > ------------[ cut here ]------------
> > WARNING: CPU: 1 PID: 6019 at drivers/gpu/drm/vkms/vkms_crtc.c:103 vkms_=
get_vblank_timestamp+0x1cf/0x240 drivers/gpu/drm/vkms/vkms_crtc.c:103
> > Modules linked in:
> > CPU: 1 PID: 6019 Comm: syz-executor.1 Not tainted 6.3.0-rc4-next-202303=
31-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 03/02/2023
> > RIP: 0010:vkms_get_vblank_timestamp+0x1cf/0x240 drivers/gpu/drm/vkms/vk=
ms_crtc.c:103
> > Code: ce 73 fc e8 53 e9 63 fc 4c 89 e1 48 ba 00 00 00 00 00 fc ff df 48=
 c1 e9 03 80 3c 11 00 75 65 49 89 04 24 eb c4 e8 b1 ce 73 fc <0f> 0b eb bb =
e8 d8 80 c6 fc e9 de fe ff ff e8 0e 81 c6 fc e9 78 fe
> > RSP: 0018:ffffc9000b3873d8 EFLAGS: 00010293
> > RAX: 0000000000000000 RBX: 0000004e19fc6e8a RCX: 0000000000000000
> > RDX: ffff8880756257c0 RSI: ffffffff850f429f RDI: 0000000000000006
> > RBP: ffff88801dc84000 R08: 0000000000000006 R09: 0000004e19fc6e8a
> > R10: 0000004e19fc6e8a R11: 0000000000000000 R12: ffffc9000b387540
> > R13: 0000004e19fc6e8a R14: 0000000000004e20 R15: ffffffff850f40d0
> > FS:  00007f5372809700(0000) GS:ffff8880b9900000(0000) knlGS:00000000000=
00000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00000000202fc000 CR3: 0000000027361000 CR4: 00000000003506e0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  <TASK>
> >  drm_crtc_get_last_vbltimestamp+0x102/0x1a0 drivers/gpu/drm/drm_vblank.=
c:877
> >  drm_crtc_next_vblank_start+0x13f/0x2b0 drivers/gpu/drm/drm_vblank.c:10=
06
> >  set_fence_deadline drivers/gpu/drm/drm_atomic_helper.c:1531 [inline]
> >  drm_atomic_helper_wait_for_fences+0x1b4/0x780 drivers/gpu/drm/drm_atom=
ic_helper.c:1578
> >  drm_atomic_helper_commit drivers/gpu/drm/drm_atomic_helper.c:2007 [inl=
ine]
> >  drm_atomic_helper_commit+0x1bd/0x370 drivers/gpu/drm/drm_atomic_helper=
.c:1979
> >  drm_atomic_commit+0x20a/0x300 drivers/gpu/drm/drm_atomic.c:1503
> >  drm_client_modeset_commit_atomic+0x69b/0x7e0 drivers/gpu/drm/drm_clien=
t_modeset.c:1045
> >  drm_client_modeset_commit_locked+0x149/0x580 drivers/gpu/drm/drm_clien=
t_modeset.c:1148
> >  pan_display_atomic drivers/gpu/drm/drm_fb_helper.c:1690 [inline]
> >  drm_fb_helper_pan_display+0x28f/0x970 drivers/gpu/drm/drm_fb_helper.c:=
1750
> >  fb_pan_display+0x2fb/0x6c0 drivers/video/fbdev/core/fbmem.c:924
> >  bit_update_start+0x49/0x1f0 drivers/video/fbdev/core/bitblit.c:387
> >  fbcon_switch+0xbcf/0x1380 drivers/video/fbdev/core/fbcon.c:2169
> >  redraw_screen+0x2bd/0x740 drivers/tty/vt/vt.c:965
> >  fbcon_modechanged+0x526/0x620 drivers/video/fbdev/core/fbcon.c:2704
> >  fbcon_update_vcs+0x3e/0x50 drivers/video/fbdev/core/fbcon.c:2749
> >  do_fb_ioctl+0x6d7/0x740 drivers/video/fbdev/core/fbmem.c:1125
> >  fb_ioctl+0xeb/0x150 drivers/video/fbdev/core/fbmem.c:1202
> >  vfs_ioctl fs/ioctl.c:51 [inline]
> >  __do_sys_ioctl fs/ioctl.c:870 [inline]
> >  __se_sys_ioctl fs/ioctl.c:856 [inline]
> >  __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
> >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >  do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
> >  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > RIP: 0033:0x7f5371a8c0f9
> > Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89=
 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 =
ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> > RSP: 002b:00007f5372809168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > RAX: ffffffffffffffda RBX: 00007f5371bac050 RCX: 00007f5371a8c0f9
> > RDX: 0000000020000000 RSI: 0000000000004601 RDI: 0000000000000005
> > RBP: 00007f5371ae7b39 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> > R13: 00007ffd0e5e571f R14: 00007f5372809300 R15: 0000000000022000
> >  </TASK>
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> > syzbot can test patches for this issue, for details see:
> > https://goo.gl/tpsmEJ#testing-patches
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/ZC8Nqs9ZSqMKbHa9%40phenom.ffwll.local.
