Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJl4LN7TnGkJLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:25:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F99117E4DF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EF810E31F;
	Mon, 23 Feb 2026 22:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9F410E31F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:25:31 +0000 (UTC)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-7d1950b48f3so57929663a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771885530; x=1772490330;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PgOxsNzF9+P5mfN1kIFAAHPuUOrC6LP1HL/NTjO9xOE=;
 b=bB4rFqltTaWz9CvPeKDXPcZaEAnmGNI4mBU3NqGAdOjIDT8rD3jX/FKkuNS5nT1a7e
 0pG02WfhgRUiWudTZjZtFR3dn9cvDde7cVsFKKdwt7ZLu+/JZkBkbYXFUw7SG3UY4FNm
 yVfcGmEoAt8dBKGWwCDpdCUx/53vUkGcdRQJN8lVQhCHa67DXqD8hXQPwM8jeZs48qK2
 52VHNiwtow2QCLQF7zjskEJHI9A1slHQoGiuSR3GL4RJm9W3YrXeXjYBgrx3FDzole81
 5qQk6j0kTrH0YGJv6bSBRPs2+EsFli2guLCIFGFDk59iO/1oby4Jrl2r/oLYCTGacv2h
 PI4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+vOmlEPiHumtVeg7KKkeK4wjFZLygwBX7E126dJUXSJsLPn9O/zdXXUC2A/LoJhe9CeKXHcqgB4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2rEnbALs6LMJPnH/LDydbjV1bAoXj+I/V1R/DUPQBU2dfvejG
 byOuWEJoiUIntyj+L5HsKQLBfIXiQ7AQi5LeKUbeXHlG4OZjbZD8PMnC8Z5/+Su46RlV9A6Wyq/
 i3Apuy6ziF+3mWv4p33NSifFPogTH4bUQPEBzWH+/tKVNIQdw5SYsktwaCyU=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:160a:b0:65d:aa2:2e30 with SMTP id
 006d021491bc7-679c4278141mr5620934eaf.28.1771885530322; Mon, 23 Feb 2026
 14:25:30 -0800 (PST)
Date: Mon, 23 Feb 2026 14:25:30 -0800
In-Reply-To: <694c864d.050a0220.35954c.002e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <699cd3da.a00a0220.121a60.00f1.GAE@google.com>
Subject: Re: [syzbot] [dri?] WARNING in drm_crtc_wait_one_vblank
From: syzbot <syzbot+c9f3062e1f1e68af836a@syzkaller.appspotmail.com>
To: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, simona@ffwll.ch, syzkaller-bugs@googlegroups.com, 
 tzimmermann@suse.de
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=d91443204e48b7a1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[appspotmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:syzkaller-bugs@googlegroups.com,m:tzimmermann@suse.de,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[c9f3062e1f1e68af836a];
	RCVD_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,storage.googleapis.com:url,appspotmail.com:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,googlegroups.com,suse.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[syzbot@syzkaller.appspotmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[syzbot@syzkaller.appspotmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 1F99117E4DF
X-Rspamd-Action: no action

syzbot has found a reproducer for the following issue on:

HEAD commit:    6de23f81a5e0 Linux 7.0-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1240455a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d91443204e48b7a1
dashboard link: https://syzkaller.appspot.com/bug?extid=c9f3062e1f1e68af836a
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ffc152580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147dd9e6580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8c986068e2b3/disk-6de23f81.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/15bbf2602cdc/vmlinux-6de23f81.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5e9cae7959ff/bzImage-6de23f81.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c9f3062e1f1e68af836a@syzkaller.appspotmail.com

------------[ cut here ]------------
faux_driver vkms: [drm] vblank wait timed out on crtc 0
WARNING: drivers/gpu/drm/drm_vblank.c:1320 at drm_crtc_wait_one_vblank+0x357/0x500 drivers/gpu/drm/drm_vblank.c:1320, CPU#0: kworker/0:4/5856
Modules linked in:
CPU: 0 UID: 0 PID: 5856 Comm: kworker/0:4 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Workqueue: events drm_fb_helper_damage_work
RIP: 0010:drm_crtc_wait_one_vblank+0x4b6/0x500 drivers/gpu/drm/drm_vblank.c:1320
Code: e8 03 48 b9 00 00 00 00 00 fc ff df 80 3c 08 00 74 08 4c 89 ef e8 8a d9 d4 fc 4d 8b 7d 00 48 89 df 4c 89 e6 4c 89 fa 44 89 f1 <67> 48 0f b9 3a 48 8b 3c 24 44 89 f6 e8 e9 f4 ff ff b8 92 ff ff ff
RSP: 0018:ffffc90004b878e0 EFLAGS: 00010246
RAX: 1ffff11004a21800 RBX: ffffffff8f7504f0 RCX: 0000000000000000
RDX: ffffffff8bbf2ce0 RSI: ffffffff8bc0ebe0 RDI: ffffffff8f7504f0
RBP: ffffc90004b879c8 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: fffffbfff1ed44b7 R12: ffffffff8bc0ebe0
R13: ffff88802510c000 R14: 0000000000000000 R15: ffffffff8bbf2ce0
FS:  0000000000000000(0000) GS:ffff888126343000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3c5d8c9d40 CR3: 00000000247e0000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 drm_client_modeset_wait_for_vblank+0xc5/0xf0 drivers/gpu/drm/drm_client_modeset.c:1330
 drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:236 [inline]
 drm_fb_helper_damage_work+0x131/0x6f0 drivers/gpu/drm/drm_fb_helper.c:274
 process_one_work kernel/workqueue.c:3275 [inline]
 process_scheduled_works+0xb02/0x1830 kernel/workqueue.c:3358
 worker_thread+0xa50/0xfc0 kernel/workqueue.c:3439
 kthread+0x388/0x470 kernel/kthread.c:467
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	e8 03 48 b9 00       	call   0xb94808
   5:	00 00                	add    %al,(%rax)
   7:	00 00                	add    %al,(%rax)
   9:	fc                   	cld
   a:	ff                   	lcall  (bad)
   b:	df 80 3c 08 00 74    	filds  0x7400083c(%rax)
  11:	08 4c 89 ef          	or     %cl,-0x11(%rcx,%rcx,4)
  15:	e8 8a d9 d4 fc       	call   0xfcd4d9a4
  1a:	4d 8b 7d 00          	mov    0x0(%r13),%r15
  1e:	48 89 df             	mov    %rbx,%rdi
  21:	4c 89 e6             	mov    %r12,%rsi
  24:	4c 89 fa             	mov    %r15,%rdx
  27:	44 89 f1             	mov    %r14d,%ecx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	48 8b 3c 24          	mov    (%rsp),%rdi
  33:	44 89 f6             	mov    %r14d,%esi
  36:	e8 e9 f4 ff ff       	call   0xfffff524
  3b:	b8 92 ff ff ff       	mov    $0xffffff92,%eax


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
