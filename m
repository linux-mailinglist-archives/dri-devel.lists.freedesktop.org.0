Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89205CB04BC
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3ED189AC3;
	Tue,  9 Dec 2025 14:35:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GW6G2fUc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Ot0C+1P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GW6G2fUc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Ot0C+1P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF32589AC3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 14:35:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8393C33820;
 Tue,  9 Dec 2025 14:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765290952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r0bMpNJLIzS8wDGoePndEerX2T4Tmd/F3wVAZM4/Ch8=;
 b=GW6G2fUcVQMJ1liX30xG9PrCNGsktvQdq1AgJjs91UGRyKPsnw+ImwqdR76i33EBUPsc9b
 K3vRRD3RAmcCjyXsHNQkdRfrtVWHE9djalb0yJGja+1hZf53HGvv0/b3gGuGQwkyPH0omY
 QoWiVnuF456H4HSji2j7jjv1cEZVd80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765290952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r0bMpNJLIzS8wDGoePndEerX2T4Tmd/F3wVAZM4/Ch8=;
 b=5Ot0C+1P4c8QFqRQQ0xuf/KirhR7Gqvp4366lo2jH2xCjce5z6p0OlIi4CT7qd42amz2Wg
 ERLaL4ie8jWxd/AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1765290952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r0bMpNJLIzS8wDGoePndEerX2T4Tmd/F3wVAZM4/Ch8=;
 b=GW6G2fUcVQMJ1liX30xG9PrCNGsktvQdq1AgJjs91UGRyKPsnw+ImwqdR76i33EBUPsc9b
 K3vRRD3RAmcCjyXsHNQkdRfrtVWHE9djalb0yJGja+1hZf53HGvv0/b3gGuGQwkyPH0omY
 QoWiVnuF456H4HSji2j7jjv1cEZVd80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1765290952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=r0bMpNJLIzS8wDGoePndEerX2T4Tmd/F3wVAZM4/Ch8=;
 b=5Ot0C+1P4c8QFqRQQ0xuf/KirhR7Gqvp4366lo2jH2xCjce5z6p0OlIi4CT7qd42amz2Wg
 ERLaL4ie8jWxd/AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49D473EA63;
 Tue,  9 Dec 2025 14:35:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7xGnEMgzOGnqWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Dec 2025 14:35:52 +0000
Message-ID: <337993e9-2f99-42ad-97c0-3a4a5a4de972@suse.de>
Date: Tue, 9 Dec 2025 15:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [dri?] WARNING in drm_atomic_helper_wait_for_vblanks (5)
To: syzbot <syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com>,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, syzkaller-bugs@googlegroups.com
References: <69381d6c.050a0220.4004e.0017.GAE@google.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <69381d6c.050a0220.4004e.0017.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=dbcb767d1e1208ac];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[syzkaller.appspotmail.com,gmail.com,lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,googlegroups.com];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,syzkaller.appspot.com:url,storage.googleapis.com:url,googlegroups.com:email,appspotmail.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid,goo.gl:url];
 RCPT_COUNT_SEVEN(0.00)[8]; MID_RHS_MATCH_FROM(0.00)[];
 REDIRECTOR_URL(0.00)[goo.gl];
 TAGGED_RCPT(0.00)[fcede535e7eb57cf5b43];
 SUBJECT_HAS_QUESTION(0.00)[]
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

Hi

Am 09.12.25 um 14:00 schrieb syzbot:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    cb015814f8b6 Merge tag 'f2fs-for-6.19-rc1' of git://git.ke..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16269a1a580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=dbcb767d1e1208ac
> dashboard link: https://syzkaller.appspot.com/bug?extid=fcede535e7eb57cf5b43
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-cb015814.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/81f7cff430d3/vmlinux-cb015814.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/1252ad8ea70f/bzImage-cb015814.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+fcede535e7eb57cf5b43@syzkaller.appspotmail.com

There's possible fix at [1]. Any testing would be appreciated.

Best regards
Thomas

[1] 
https://lore.kernel.org/dri-devel/20251209143325.102056-1-tzimmermann@suse.de/

>
> ------------[ cut here ]------------
> [CRTC:37:crtc-0] vblank wait timed out
> WARNING: drivers/gpu/drm/drm_atomic_helper.c:1844 at 0x0, CPU#3: kworker/3:0/34
> Modules linked in:
> CPU: 3 UID: 0 PID: 34 Comm: kworker/3:0 Tainted: G             L      syzkaller #0 PREEMPT(full)
> Tainted: [L]=SOFTLOCKUP
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> Workqueue: events drm_fb_helper_damage_work
> RIP: 0010:drm_atomic_helper_wait_for_vblanks.part.0+0x766/0x8c0 drivers/gpu/drm/drm_atomic_helper.c:1844
> Code: 00 00 00 fc ff df 48 89 f9 48 c1 e9 03 0f b6 04 01 84 c0 74 08 3c 03 0f 8e 3f 01 00 00 48 8d 3d f0 9b 3a 0b 8b b5 d8 00 00 00 <67> 48 0f b9 3a e9 ed fc ff ff e8 8b 66 67 fc e9 81 fe ff ff e8 b1
> RSP: 0018:ffffc900006df688 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 1ffff11004e34023
> RDX: ffff8880264b9cc0 RSI: 0000000000000025 RDI: ffffffff909219c0
> RBP: ffff8880271a0040 R08: 0000000000000005 R09: 0000000000000000
> R10: 0000000000000000 R11: ffff88801e6bd4b0 R12: dffffc0000000000
> R13: ffff88802b42d300 R14: 0000000000000000 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff8880d6c07000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f5e2cb4af98 CR3: 00000000578af000 CR4: 0000000000352ef0
> Call Trace:
>   <TASK>
>   drm_atomic_helper_wait_for_vblanks drivers/gpu/drm/drm_atomic_helper.c:1818 [inline]
>   drm_atomic_helper_commit_tail+0xaa/0xd0 drivers/gpu/drm/drm_atomic_helper.c:1920
>   commit_tail+0x334/0x410 drivers/gpu/drm/drm_atomic_helper.c:1997
>   drm_atomic_helper_commit+0x300/0x380 drivers/gpu/drm/drm_atomic_helper.c:2235
>   drm_atomic_commit+0x234/0x300 drivers/gpu/drm/drm_atomic.c:1743
>   drm_atomic_helper_dirtyfb+0x5fd/0x780 drivers/gpu/drm/drm_damage_helper.c:183
>   drm_fbdev_shmem_helper_fb_dirty+0x1cc/0x310 drivers/gpu/drm/drm_fbdev_shmem.c:117
>   drm_fb_helper_fb_dirty drivers/gpu/drm/drm_fb_helper.c:346 [inline]
>   drm_fb_helper_damage_work+0x2a2/0x5e0 drivers/gpu/drm/drm_fb_helper.c:369
>   process_one_work+0x9ba/0x1b20 kernel/workqueue.c:3257
>   process_scheduled_works kernel/workqueue.c:3340 [inline]
>   worker_thread+0x6c8/0xf10 kernel/workqueue.c:3421
>   kthread+0x3c5/0x780 kernel/kthread.c:463
>   ret_from_fork+0x983/0xb10 arch/x86/kernel/process.c:158
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
>   </TASK>
> ----------------
> Code disassembly (best guess), 5 bytes skipped:
>     0:	df 48 89             	fisttps -0x77(%rax)
>     3:	f9                   	stc
>     4:	48 c1 e9 03          	shr    $0x3,%rcx
>     8:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
>     c:	84 c0                	test   %al,%al
>     e:	74 08                	je     0x18
>    10:	3c 03                	cmp    $0x3,%al
>    12:	0f 8e 3f 01 00 00    	jle    0x157
>    18:	48 8d 3d f0 9b 3a 0b 	lea    0xb3a9bf0(%rip),%rdi        # 0xb3a9c0f
>    1f:	8b b5 d8 00 00 00    	mov    0xd8(%rbp),%esi
> * 25:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
>    2a:	e9 ed fc ff ff       	jmp    0xfffffd1c
>    2f:	e8 8b 66 67 fc       	call   0xfc6766bf
>    34:	e9 81 fe ff ff       	jmp    0xfffffeba
>    39:	e8                   	.byte 0xe8
>    3a:	b1                   	.byte 0xb1
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)


