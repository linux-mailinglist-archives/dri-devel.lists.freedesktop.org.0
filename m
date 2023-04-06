Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DEF6D9FAF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 20:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C199110E23B;
	Thu,  6 Apr 2023 18:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3455B10E23B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 18:21:34 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94971337b10so15244166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 11:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680805292; x=1683397292;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Emp9vhrsOSTxDbGtg9X4DZhmoRYDGrLQuzWbBS9r4bs=;
 b=TV+MEHzgKPAisjzVjoxl3+adTS5C87nyqx3DbXQpQ81GXniqmbuRB4bQ7RBm3L7lmL
 rm6YdU0bFaEh2hQtvINOiXUQVGrkFZDMxUXb+FhR2Lwq46JGtY1rPzPt4Y72FSCb4wtB
 Ob3wS+zpPQt1tdRAeyjgPaBDjgr8swpAeWF/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680805292; x=1683397292;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Emp9vhrsOSTxDbGtg9X4DZhmoRYDGrLQuzWbBS9r4bs=;
 b=WDPVyfbfgZjbcha5F8HBYuj+ObUxH+vA2MwtlUfggilRCJmQutGLsclOcoOO5pgWwR
 ENcQZtRYsH9q700fU9FEE7KBwU3NzSUkP1UQHv3Gq8KPJuK5AaZQVuhLV8J5RIb8AaLB
 bnabssn8sMMgEXQn7JWgeDLI+js4zrlHX8Q/sXCLrF24vgDIQqhoJKVz+twZVoSvR+nf
 4XYJGzz9Bi7VIuB43IuTxGnaUWYSlCENSC3SDnDWLsUJlJuglQpqP7s8xWvuCB7TEcA3
 v0k0TelCLpKc7SuJ524vDgT8PLJ8vDdmqDcTowdFZMxP8wU0Z4zfswDC0Es4uXa8mfag
 5t8A==
X-Gm-Message-State: AAQBX9ev3twBTsYUFAYG/E8GlaTkhToc9hG0Xf86Mjs5pO2Kz2pt1dvr
 Huk5aPM65wHzKGYtMUs/Tp13xA==
X-Google-Smtp-Source: AKy350b77XUNdhU8smZI3wWEVx/PB5wLMiiP8/Ujgiu2lHLH+B6wWqNz7K2GoAb6Wz0Dvl7YJ9ErmQ==
X-Received: by 2002:a17:906:d4:b0:933:fa42:7e36 with SMTP id
 20-20020a17090600d400b00933fa427e36mr5203996eji.5.1680805292568; 
 Thu, 06 Apr 2023 11:21:32 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 mj23-20020a170906af9700b009255b14e91dsm1099532ejb.46.2023.04.06.11.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 11:21:32 -0700 (PDT)
Date: Thu, 6 Apr 2023 20:21:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: syzbot <syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail.com>
Subject: Re: [syzbot] [dri?] WARNING in vkms_get_vblank_timestamp
Message-ID: <ZC8Nqs9ZSqMKbHa9@phenom.ffwll.local>
Mail-Followup-To: syzbot
 <syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail.com>, 
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org,
 melissa.srw@gmail.com, rodrigosiqueiramelo@gmail.com,
 syzkaller-bugs@googlegroups.com
References: <00000000000080a2d405f8aea527@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000080a2d405f8aea527@google.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 06, 2023 at 10:57:48AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    4b0f4525dc4f Add linux-next specific files for 20230331
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=13ea0159c80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=85cc4b935a1f7194
> dashboard link: https://syzkaller.appspot.com/bug?extid=75cc0f9f7e6324dd2501
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15cb3659c80000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/8d06bb015df3/disk-4b0f4525.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6a1c1ebf3724/vmlinux-4b0f4525.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/4bb2b8d6cd7d/bzImage-4b0f4525.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+75cc0f9f7e6324dd2501@syzkaller.appspotmail.com

Should be fixed with f2c7ca890182 ("drm/atomic-helper: Don't set deadline
for modesets"). And maybe also 6f1ccbf07453 ("drm/vblank: Fix for drivers
that do not drm_vblank_init()").

Would be great if you can confirm. The regression was introduced in
d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank") if my
guess is correct.
-Daniel

> 
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 6019 at drivers/gpu/drm/vkms/vkms_crtc.c:103 vkms_get_vblank_timestamp+0x1cf/0x240 drivers/gpu/drm/vkms/vkms_crtc.c:103
> Modules linked in:
> CPU: 1 PID: 6019 Comm: syz-executor.1 Not tainted 6.3.0-rc4-next-20230331-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
> RIP: 0010:vkms_get_vblank_timestamp+0x1cf/0x240 drivers/gpu/drm/vkms/vkms_crtc.c:103
> Code: ce 73 fc e8 53 e9 63 fc 4c 89 e1 48 ba 00 00 00 00 00 fc ff df 48 c1 e9 03 80 3c 11 00 75 65 49 89 04 24 eb c4 e8 b1 ce 73 fc <0f> 0b eb bb e8 d8 80 c6 fc e9 de fe ff ff e8 0e 81 c6 fc e9 78 fe
> RSP: 0018:ffffc9000b3873d8 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: 0000004e19fc6e8a RCX: 0000000000000000
> RDX: ffff8880756257c0 RSI: ffffffff850f429f RDI: 0000000000000006
> RBP: ffff88801dc84000 R08: 0000000000000006 R09: 0000004e19fc6e8a
> R10: 0000004e19fc6e8a R11: 0000000000000000 R12: ffffc9000b387540
> R13: 0000004e19fc6e8a R14: 0000000000004e20 R15: ffffffff850f40d0
> FS:  00007f5372809700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000202fc000 CR3: 0000000027361000 CR4: 00000000003506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  drm_crtc_get_last_vbltimestamp+0x102/0x1a0 drivers/gpu/drm/drm_vblank.c:877
>  drm_crtc_next_vblank_start+0x13f/0x2b0 drivers/gpu/drm/drm_vblank.c:1006
>  set_fence_deadline drivers/gpu/drm/drm_atomic_helper.c:1531 [inline]
>  drm_atomic_helper_wait_for_fences+0x1b4/0x780 drivers/gpu/drm/drm_atomic_helper.c:1578
>  drm_atomic_helper_commit drivers/gpu/drm/drm_atomic_helper.c:2007 [inline]
>  drm_atomic_helper_commit+0x1bd/0x370 drivers/gpu/drm/drm_atomic_helper.c:1979
>  drm_atomic_commit+0x20a/0x300 drivers/gpu/drm/drm_atomic.c:1503
>  drm_client_modeset_commit_atomic+0x69b/0x7e0 drivers/gpu/drm/drm_client_modeset.c:1045
>  drm_client_modeset_commit_locked+0x149/0x580 drivers/gpu/drm/drm_client_modeset.c:1148
>  pan_display_atomic drivers/gpu/drm/drm_fb_helper.c:1690 [inline]
>  drm_fb_helper_pan_display+0x28f/0x970 drivers/gpu/drm/drm_fb_helper.c:1750
>  fb_pan_display+0x2fb/0x6c0 drivers/video/fbdev/core/fbmem.c:924
>  bit_update_start+0x49/0x1f0 drivers/video/fbdev/core/bitblit.c:387
>  fbcon_switch+0xbcf/0x1380 drivers/video/fbdev/core/fbcon.c:2169
>  redraw_screen+0x2bd/0x740 drivers/tty/vt/vt.c:965
>  fbcon_modechanged+0x526/0x620 drivers/video/fbdev/core/fbcon.c:2704
>  fbcon_update_vcs+0x3e/0x50 drivers/video/fbdev/core/fbcon.c:2749
>  do_fb_ioctl+0x6d7/0x740 drivers/video/fbdev/core/fbmem.c:1125
>  fb_ioctl+0xeb/0x150 drivers/video/fbdev/core/fbmem.c:1202
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:870 [inline]
>  __se_sys_ioctl fs/ioctl.c:856 [inline]
>  __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7f5371a8c0f9
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f5372809168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f5371bac050 RCX: 00007f5371a8c0f9
> RDX: 0000000020000000 RSI: 0000000000004601 RDI: 0000000000000005
> RBP: 00007f5371ae7b39 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007ffd0e5e571f R14: 00007f5372809300 R15: 0000000000022000
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
