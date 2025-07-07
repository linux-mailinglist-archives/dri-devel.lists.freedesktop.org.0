Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B573AFBDDB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0958910E03B;
	Mon,  7 Jul 2025 21:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H4572+o0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32E410E03B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 21:51:34 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7d20f79a00dso556919785a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 14:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751925094; x=1752529894; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qBG8RgRp5aWpRNqXfp/hHId5FOptjrBygU9EaAjmUuU=;
 b=H4572+o0UdPoNNAaUog5qRGFQKzdkQhYMwV29dwZIztXPQdoW5MDDm2fBPg1Xwi9pK
 XFUXkHOLEeNcT2G5UxyGlHE3vSvQufMFWOes7Dtolj6AOGE211KO5nBkmD5uwzsI+VCI
 G/kBSSt77uNbkxq/FaA/iXqOZLLeqVKApUqlR+feJ9JfOzi4G/iddPm+2SLmZ/BmRuyt
 Veu2TVH7UeXATQNjrlrkPFJcRNUdvW3WyhSbIXrPvzPwVTfaQBdxKo5VqGDfrpZJOom7
 R7HGWNYmJriW5A3ZPKhc3SYfmqzTcXfoemheTdE1zRSpRV/vpdtrQpuYDC68bkmxrLDG
 PHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751925094; x=1752529894;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qBG8RgRp5aWpRNqXfp/hHId5FOptjrBygU9EaAjmUuU=;
 b=dA2OdRcL7wEGSAM+9DlYRtZjxjBMY4lX5YvJdbqIGBtliNN4b20pPcAItFgYnHCz+n
 iqRvGzT1piL6KXfBNQz3/dNyUNQtHHbt9BSAk+5lR3S1tIPxTkUbTOkT/PjAdDwnZgy5
 fc2rh5M6tuNpAw5XQlj8q/w/zVU9FY7zj6HzC85ZZyC8s4sb2f/Hq5ojFo76xGeKJXdt
 ZTZu2kH3GBSCvzh9l8yNseKT51cV+Qf4j2UqKGz60i1mYmWZL1YHaOWxsNzF2rdUvoIb
 LJo+QBanw7jujTelgILKUOD5gKyvzAq2ZqvVADaupaORYLkRIIOwJWgprLdMV/3AxhGJ
 JjZg==
X-Gm-Message-State: AOJu0YxBo9HexR/Fc/ii5yNIbKI0YP2tHNFojkeTAaHn/aHvvGbb85Xx
 YTo8zEjDrcIEMBsxpMBXv5jefEqMcfxNg5rT12XFa7xHSmhkvTi9XjANYo/QQjdYJJcY9Ur77Xw
 uRNxQOq4bGVWhP/uLxH2Rm+L9jcTmb/I=
X-Gm-Gg: ASbGncv3yHF8PkkAUVZ39CWN8FEjt0/2J+w1BKWgCw24MxpVWADfStHcc3SsZi0gUr0
 Abn8cPFQarDsa986wqyIOXpeUw/JpnVNgRye1dQwqqvrX/puuRVV7PIwwBHzC8jzvK23+qvEAnY
 DAyf2CH+Gph7Fol2Fhpvb62z7Gkon8jW92+oSpBN5bQOKkLj+RpObsbUFGFnWL+lxwsq4qSmBpG
 pSeHJwAM+X3+RlH
X-Google-Smtp-Source: AGHT+IH/WpBXkCAX5gTtSFLfM0VHrfYiIyCEHbg1/iwHSjr4d+fy0Ff9QmZAqzy8rURzr5JkI4V2XmoySpRzI3xVa2o=
X-Received: by 2002:a05:620a:708e:b0:7d0:98fc:83f9 with SMTP id
 af79cd13be357-7d5dcc7297emr1805784085a.18.1751925093768; Mon, 07 Jul 2025
 14:51:33 -0700 (PDT)
MIME-Version: 1.0
From: Steve French <smfrench@gmail.com>
Date: Mon, 7 Jul 2025 16:51:22 -0500
X-Gm-Features: Ac12FXy3learX7rqABOLMiQr7WvFHfcz0ICgQjm93cahy8vEBhOo_shQG00bqMU
Message-ID: <CAH2r5msTzHGf5YhYra+_5yFFGkc=1o2z_-QmtsA=5rNdy35j0g@mail.gmail.com>
Subject: Flood of RIPs in DRM driver starting with 6.16-rc5
To: David Airlie <airlied@redhat.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
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

I see these RIP logged every second or two with 6.16-rc5 on boot, and
they continue indefinitely.  I don't remember seeing these on rc4.
This happens when booting up, even when doing nothing on laptop
(Lenovo P52, Ubuntu 24 running normal build of mainline 6.16-rc5) and
they keep occurring.

6.16.0-061600rc5-generic #202507062141 PREEMPT(voluntary)
[  642.019544] Tainted: [W]=WARN
[  642.019549] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
N2CET70W (1.53 ) 03/11/2024
[  642.019556] RIP: 0010:drm_gem_object_handle_put_unlocked+0xc5/0x100
[  642.019570] Code: ca ff eb 9c 4c 89 e7 e8 09 cf 64 00 eb d0 48 8b
43 08 48 8d b8 e8 05 00 00 e8 47 8b 60 00 c7 83 e0 00 00 00 00 00 00
00 eb 90 <0f> 0b 5b 41 5c 5d 31 c0 31 f6 31 ff c3 cc cc cc cc 48 8b 83
40 01
[  642.019579] RSP: 0018:ffffd003454f38c8 EFLAGS: 00010246
[  642.019590] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
[  642.019596] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8ced0e693000
[  642.019602] RBP: ffffd003454f38d8 R08: 0000000000000000 R09: 0000000000000000
[  642.019609] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8ced06634000
[  642.019615] R13: 0000000000000000 R14: ffffd003454f3a30 R15: ffff8ced06634000
[  642.019622] FS:  00007f0b743986c0(0000) GS:ffff8cf4cbd88000(0000)
knlGS:0000000000000000
[  642.019630] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  642.019637] CR2: 00007f0af0384000 CR3: 000000016c6a0006 CR4: 00000000003726f0
[  642.019645] Call Trace:
[  642.019651]  <TASK>
[  642.019658]  drm_gem_fb_destroy+0x35/0x80
[  642.019673]  drm_framebuffer_free+0x40/0xa0
[  642.019706]  drm_mode_object_put.part.0+0x5d/0xa0
[  642.019718]  drm_mode_object_put+0x15/0x30
[  642.019727]  drm_mode_closefb_ioctl+0x76/0xa0
[  642.019738]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
[  642.019748]  drm_ioctl_kernel+0xb2/0x110
[  642.019760]  drm_ioctl+0x2ea/0x5b0
[  642.019767]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
[  642.019788]  nouveau_drm_ioctl+0x5e/0xc0 [nouveau]
[  642.020378]  __x64_sys_ioctl+0xa2/0x100
[  642.020392]  x64_sys_call+0x106b/0x2320
[  642.020403]  do_syscall_64+0x80/0xe80
[  642.020416]  ? do_syscall_64+0xb6/0xe80
[  642.020429]  ? __rseq_handle_notify_resume+0x36/0x70
[  642.020444]  ? arch_exit_to_user_mode_prepare.isra.0+0xa0/0xc0
[  642.020455]  ? do_syscall_64+0xb6/0xe80
[  642.020474]  ? kick_ilb+0x52/0x180
[  642.020488]  ? update_load_avg+0x8b/0x410
[  642.020502]  ? __update_blocked_fair+0xac/0x550
[  642.020515]  ? __note_gp_changes+0x1ca/0x220
[  642.020529]  ? note_gp_changes+0x8f/0xa0
[  642.020541]  ? rcu_core+0x1b6/0x370
[  642.020553]  ? rcu_core_si+0xe/0x20
[  642.020564]  ? handle_softirqs+0xe4/0x340
[  642.020576]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
[  642.020588]  ? irqentry_exit_to_user_mode+0x2d/0x1d0
[  642.020599]  ? irqentry_exit+0x43/0x50
[  642.020609]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  642.020618] RIP: 0033:0x7f0b7ad24ded
[  642.020627] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
00 00
[  642.020635] RSP: 002b:00007ffca5eb8f50 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  642.020647] RAX: ffffffffffffffda RBX: 000055b1a5e17cc0 RCX: 00007f0b7ad24ded
[  642.020654] RDX: 00007ffca5eb8fe0 RSI: 00000000c00864d0 RDI: 000000000000000c
[  642.020661] RBP: 00007ffca5eb8fa0 R08: 0000000000000000 R09: 00007f0b7ae03ac0
[  642.020667] R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffca5eb8fe0
[  642.020673] R13: 00000000c00864d0 R14: 000000000000000c R15: 000000002640746b
[  642.020702]  </TASK>
[  642.020707] ---[ end trace 0000000000000000 ]---

...

6.16.0-061600rc5-generic #202507062141 PREEMPT(voluntary)
[  795.464458] Tainted: [W]=WARN
[  795.464460] Hardware name: LENOVO 20MAS08500/20MAS08500, BIOS
N2CET70W (1.53 ) 03/11/2024
[  795.464462] RIP: 0010:drm_gem_object_handle_put_unlocked+0xc5/0x100
[  795.464468] Code: ca ff eb 9c 4c 89 e7 e8 09 cf 64 00 eb d0 48 8b
43 08 48 8d b8 e8 05 00 00 e8 47 8b 60 00 c7 83 e0 00 00 00 00 00 00
00 eb 90 <0f> 0b 5b 41 5c 5d 31 c0 31 f6 31 ff c3 cc cc cc cc 48 8b 83
40 01
[  795.464471] RSP: 0018:ffffd003454f3898 EFLAGS: 00010246
[  795.464476] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
[  795.464479] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff8ced0e693000
[  795.464481] RBP: ffffd003454f38a8 R08: 0000000000000000 R09: 0000000000000000
[  795.464484] R10: 0000000000000000 R11: 0000000000000000 R12: ffff8ced06634000
[  795.464486] R13: 0000000000000000 R14: ffffd003454f3a00 R15: ffff8ced06634000
[  795.464489] FS:  00007f0b743986c0(0000) GS:ffff8cf4cb988000(0000)
knlGS:0000000000000000
[  795.464492] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  795.464495] CR2: 00007f0b6c6a9020 CR3: 000000016c6a0006 CR4: 00000000003726f0
[  795.464498] Call Trace:
[  795.464500]  <TASK>
[  795.464504]  drm_gem_fb_destroy+0x35/0x80
[  795.464510]  drm_framebuffer_free+0x40/0xa0
[  795.464515]  drm_mode_object_put.part.0+0x5d/0xa0
[  795.464520]  drm_mode_object_put+0x15/0x30
[  795.464524]  drm_mode_closefb_ioctl+0x76/0xa0
[  795.464528]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
[  795.464533]  drm_ioctl_kernel+0xb2/0x110
[  795.464537]  drm_ioctl+0x2ea/0x5b0
[  795.464541]  ? __pfx_drm_mode_closefb_ioctl+0x10/0x10
[  795.464550]  nouveau_drm_ioctl+0x5e/0xc0 [nouveau]
[  795.464783]  __x64_sys_ioctl+0xa2/0x100
[  795.464790]  x64_sys_call+0x106b/0x2320
[  795.464794]  do_syscall_64+0x80/0xe80
[  795.464802]  ? __x64_sys_poll+0xd2/0x180
[  795.464808]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
[  795.464813]  ? do_syscall_64+0xb6/0xe80
[  795.464819]  ? futex_hash+0xe/0x20
[  795.464823]  ? futex_wake+0x89/0x1b0
[  795.464830]  ? do_futex+0x18e/0x260
[  795.464835]  ? __x64_sys_futex+0x127/0x200
[  795.464839]  ? eventfd_write+0xdc/0x200
[  795.464844]  ? security_file_permission+0x5b/0x170
[  795.464850]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
[  795.464854]  ? do_syscall_64+0xb6/0xe80
[  795.464862]  ? ksys_write+0xd9/0xf0
[  795.464869]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
[  795.464873]  ? do_syscall_64+0xb6/0xe80
[  795.464878]  ? do_syscall_64+0xb6/0xe80
[  795.464883]  ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xc0
[  795.464888]  ? irqentry_exit_to_user_mode+0x2d/0x1d0
[  795.464893]  ? irqentry_exit+0x43/0x50
[  795.464897]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  795.464901] RIP: 0033:0x7f0b7ad24ded
[  795.464904] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00
00 00
[  795.464907] RSP: 002b:00007ffca5eb8f50 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  795.464912] RAX: ffffffffffffffda RBX: 000055b1a8710050 RCX: 00007f0b7ad24ded
[  795.464915] RDX: 00007ffca5eb8fe0 RSI: 00000000c00864d0 RDI: 000000000000000c
[  795.464917] RBP: 00007ffca5eb8fa0 R08: 0000000000000000 R09: 00007f0b7ae03ac0
[  795.464920] R10: 0000000000000008 R11: 0000000000000246 R12: 00007ffca5eb8fe0
[  795.464922] R13: 00000000c00864d0 R14: 000000000000000c R15: 000000002f66b7a8
[  795.464929]  </TASK>
[  795.464931] ---[ end trace 0000000000000000 ]---


-- 
Thanks,

Steve
