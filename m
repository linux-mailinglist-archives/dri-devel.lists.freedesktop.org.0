Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6854695A6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 13:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C1073FAA;
	Mon,  6 Dec 2021 12:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB1E6E135
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Dec 2021 09:55:18 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id
 85-20020a6b0258000000b005ed47a95f03so4518802ioc.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Dec 2021 01:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=+J1qB2+49Im0EdmYLOfWiB0MLUw0lYYruCB9JuWbtuw=;
 b=tTweVeSjSehLCaeYQcd+OxgWJDzwGrB077Vdcy2m2LgRUaX04G1hUuP45uNV0AFhoO
 Y/SH1mVJ8Ty9//c77+g7Hd5X/g4Ccd/jhYP3TAWpnytgR0Vyv1JXLyn6SB5TQ13QlSIz
 RFN8Nd0xWOsfgv5QQpwKI/pIKms+COTI8LOrG65CJyGoK3wklrxkFg5WBGiWlWB+c2h7
 y6g1tN78sxnr9O500u+HUGv3/Gq+/KUPXgXwgFskZGCmI6gWoyUifuS/x5CQD7YKjMp2
 0Cgf5oMpnoSeVVeMVEKTXIMKW8uG6eiIXXKfFQ4ttgOU4Zvjr2XkRWwdI2kMiZSPrqpT
 XV4Q==
X-Gm-Message-State: AOAM533kyJndTqFY928aQOStohS40sa6jPPz5av9zV2UOzzCEVrlmCYv
 bJaOWfBmQtHFBIVvmiJho++5M7EewwK518CiRurHap2FGpWF
X-Google-Smtp-Source: ABdhPJxpdSl19Wc1+2UwAjyN9FL6e2TTzFsOgSkv+B2wKH2hfC55afG+DZWoWox1lThLLCVAyltLIsO7EZAST6BUQgoZgujD34+j
MIME-Version: 1.0
X-Received: by 2002:a6b:7307:: with SMTP id e7mr24491133ioh.211.1638611718158; 
 Sat, 04 Dec 2021 01:55:18 -0800 (PST)
Date: Sat, 04 Dec 2021 01:55:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000062bce805d24f05ca@google.com>
Subject: [syzbot] KASAN: out-of-bounds Write in
 virtio_gpu_cmd_transfer_to_host_2d
From: syzbot <syzbot+f01248cf57e6929868e4@syzkaller.appspotmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 kraxel@redhat.com, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 06 Dec 2021 12:28:45 +0000
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

Hello,

syzbot found the following issue on:

HEAD commit:    e66435936756 mm: fix mismerge of folio page flag manipulat..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c79e0eb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ca1c2027dfeaf335
dashboard link: https://syzkaller.appspot.com/bug?extid=f01248cf57e6929868e4
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f01248cf57e6929868e4@syzkaller.appspotmail.com

R13: 00007ffe6190e50f R14: 00007f51be874300 R15: 0000000000022000
==================================================================
BUG: KASAN: out-of-bounds in memset include/linux/fortify-string.h:175 [inline]
BUG: KASAN: out-of-bounds in virtio_gpu_cmd_transfer_to_host_2d+0x160/0x4a0 drivers/gpu/drm/virtio/virtgpu_vq.c:618
Write of size 56 at addr fffffffffffffff4 by task syz-executor.1/13670

CPU: 2 PID: 13670 Comm: syz-executor.1 Not tainted 5.15.0-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xf/0x2d6 mm/kasan/report.c:256
 __kasan_report mm/kasan/report.c:442 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:459
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
 memset+0x20/0x40 mm/kasan/shadow.c:44
 memset include/linux/fortify-string.h:175 [inline]
 virtio_gpu_cmd_transfer_to_host_2d+0x160/0x4a0 drivers/gpu/drm/virtio/virtgpu_vq.c:618
 virtio_gpu_update_dumb_bo drivers/gpu/drm/virtio/virtgpu_plane.c:128 [inline]
 virtio_gpu_primary_plane_update+0xfcb/0x1650 drivers/gpu/drm/virtio/virtgpu_plane.c:199
 drm_atomic_helper_commit_planes+0x332/0xb60 drivers/gpu/drm/drm_atomic_helper.c:2552
 drm_atomic_helper_commit_tail+0x62/0xf0 drivers/gpu/drm/drm_atomic_helper.c:1582
 commit_tail+0x32d/0x420 drivers/gpu/drm/drm_atomic_helper.c:1667
 drm_atomic_helper_commit drivers/gpu/drm/drm_atomic_helper.c:1884 [inline]
 drm_atomic_helper_commit+0x2eb/0x370 drivers/gpu/drm/drm_atomic_helper.c:1817
 drm_atomic_commit+0xd8/0x110 drivers/gpu/drm/drm_atomic.c:1412
 drm_client_modeset_commit_atomic+0x685/0x7c0 drivers/gpu/drm/drm_client_modeset.c:1043
 drm_client_modeset_commit_locked+0x145/0x580 drivers/gpu/drm/drm_client_modeset.c:1146
 drm_client_modeset_commit+0x4d/0x80 drivers/gpu/drm/drm_client_modeset.c:1172
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:252 [inline]
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:231 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:279 [inline]
 drm_fb_helper_lastclose drivers/gpu/drm/drm_fb_helper.c:1997 [inline]
 drm_fbdev_client_restore+0xe3/0x1a0 drivers/gpu/drm/drm_fb_helper.c:2397
 drm_client_dev_restore+0x184/0x290 drivers/gpu/drm/drm_client.c:226
 drm_lastclose drivers/gpu/drm/drm_file.c:467 [inline]
 drm_release+0x441/0x530 drivers/gpu/drm/drm_file.c:498
 __fput+0x286/0x9f0 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:207
 __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f51c12b1a04
Code: 84 00 00 00 00 00 44 89 54 24 0c e8 96 f9 ff ff 44 8b 54 24 0c 44 89 e2 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 34 44 89 c7 89 44 24 0c e8 c8 f9 ff ff 8b 44
RSP: 002b:00007f51be873cc0 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffea RBX: 6666666666666667 RCX: 00007f51c12b1a04
RDX: 000000000000ff00 RSI: 00007f51be873d60 RDI: 00000000ffffff9c
RBP: 00007f51be873d60 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000ff00
R13: 00007ffe6190e50f R14: 00007f51be874300 R15: 0000000000022000


Memory state around the buggy address:
 fffffffffffffe80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffffffffffffff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffffffffffffff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
general protection fault, maybe for address 0xffffc9000422f80c: 0000 [#1] PREEMPT SMP KASAN
CPU: 2 PID: 13670 Comm: syz-executor.1 Not tainted 5.15.0-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:memcpy_erms+0x6/0x10 arch/x86/lib/memcpy_64.S:55
Code: cc cc cc cc eb 1e 0f 1f 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 f3 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 <f3> a4 c3 0f 1f 80 00 00 00 00 48 89 f8 48 83 fa 20 72 7e 40 38 fe
RSP: 0018:ffffc9000422f800 EFLAGS: 00010086
RAX: ffffc9000422f80c RBX: 0000000000000000 RCX: 0000000000000010
RDX: 0000000000000010 RSI: dffffc0000000000 RDI: ffffc9000422f80c
RBP: fffffffffffffff4 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff83f599a3 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000080 R14: ffffffff84620a60 R15: 0000000000000000
FS:  00007f51be874700(0000) GS:ffff88802cc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f51be873f78 CR3: 0000000077e04000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 print_memory_metadata+0x5a/0xdf mm/kasan/report.c:322
 __kasan_report mm/kasan/report.c:444 [inline]
 kasan_report.cold+0x99/0xdf mm/kasan/report.c:459
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
 memset+0x20/0x40 mm/kasan/shadow.c:44
 memset include/linux/fortify-string.h:175 [inline]
 virtio_gpu_cmd_transfer_to_host_2d+0x160/0x4a0 drivers/gpu/drm/virtio/virtgpu_vq.c:618
 virtio_gpu_update_dumb_bo drivers/gpu/drm/virtio/virtgpu_plane.c:128 [inline]
 virtio_gpu_primary_plane_update+0xfcb/0x1650 drivers/gpu/drm/virtio/virtgpu_plane.c:199
 drm_atomic_helper_commit_planes+0x332/0xb60 drivers/gpu/drm/drm_atomic_helper.c:2552
 drm_atomic_helper_commit_tail+0x62/0xf0 drivers/gpu/drm/drm_atomic_helper.c:1582
 commit_tail+0x32d/0x420 drivers/gpu/drm/drm_atomic_helper.c:1667
 drm_atomic_helper_commit drivers/gpu/drm/drm_atomic_helper.c:1884 [inline]
 drm_atomic_helper_commit+0x2eb/0x370 drivers/gpu/drm/drm_atomic_helper.c:1817
 drm_atomic_commit+0xd8/0x110 drivers/gpu/drm/drm_atomic.c:1412
 drm_client_modeset_commit_atomic+0x685/0x7c0 drivers/gpu/drm/drm_client_modeset.c:1043
 drm_client_modeset_commit_locked+0x145/0x580 drivers/gpu/drm/drm_client_modeset.c:1146
 drm_client_modeset_commit+0x4d/0x80 drivers/gpu/drm/drm_client_modeset.c:1172
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:252 [inline]
 __drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:231 [inline]
 drm_fb_helper_restore_fbdev_mode_unlocked drivers/gpu/drm/drm_fb_helper.c:279 [inline]
 drm_fb_helper_lastclose drivers/gpu/drm/drm_fb_helper.c:1997 [inline]
 drm_fbdev_client_restore+0xe3/0x1a0 drivers/gpu/drm/drm_fb_helper.c:2397
 drm_client_dev_restore+0x184/0x290 drivers/gpu/drm/drm_client.c:226
 drm_lastclose drivers/gpu/drm/drm_file.c:467 [inline]
 drm_release+0x441/0x530 drivers/gpu/drm/drm_file.c:498
 __fput+0x286/0x9f0 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:207
 __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f51c12b1a04
Code: 84 00 00 00 00 00 44 89 54 24 0c e8 96 f9 ff ff 44 8b 54 24 0c 44 89 e2 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 34 44 89 c7 89 44 24 0c e8 c8 f9 ff ff 8b 44
RSP: 002b:00007f51be873cc0 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffea RBX: 6666666666666667 RCX: 00007f51c12b1a04
RDX: 000000000000ff00 RSI: 00007f51be873d60 RDI: 00000000ffffff9c
RBP: 00007f51be873d60 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000ff00
R13: 00007ffe6190e50f R14: 00007f51be874300 R15: 0000000000022000
Modules linked in:
---[ end trace f65df7177f1d34a7 ]---
RIP: 0010:memcpy_erms+0x6/0x10 arch/x86/lib/memcpy_64.S:55
Code: cc cc cc cc eb 1e 0f 1f 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 f3 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 <f3> a4 c3 0f 1f 80 00 00 00 00 48 89 f8 48 83 fa 20 72 7e 40 38 fe
RSP: 0018:ffffc9000422f800 EFLAGS: 00010086
RAX: ffffc9000422f80c RBX: 0000000000000000 RCX: 0000000000000010
RDX: 0000000000000010 RSI: dffffc0000000000 RDI: ffffc9000422f80c
RBP: fffffffffffffff4 R08: 0000000000000000 R09: 0000000000000000
R10: ffffffff83f599a3 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000080 R14: ffffffff84620a60 R15: 0000000000000000
FS:  00007f51be874700(0000) GS:ffff88802cc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f51be873f78 CR3: 0000000077e04000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	cc                   	int3
   1:	cc                   	int3
   2:	cc                   	int3
   3:	cc                   	int3
   4:	eb 1e                	jmp    0x24
   6:	0f 1f 00             	nopl   (%rax)
   9:	48 89 f8             	mov    %rdi,%rax
   c:	48 89 d1             	mov    %rdx,%rcx
   f:	48 c1 e9 03          	shr    $0x3,%rcx
  13:	83 e2 07             	and    $0x7,%edx
  16:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  19:	89 d1                	mov    %edx,%ecx
  1b:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  1d:	c3                   	retq
  1e:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  24:	48 89 f8             	mov    %rdi,%rax
  27:	48 89 d1             	mov    %rdx,%rcx
* 2a:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi) <-- trapping instruction
  2c:	c3                   	retq
  2d:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  34:	48 89 f8             	mov    %rdi,%rax
  37:	48 83 fa 20          	cmp    $0x20,%rdx
  3b:	72 7e                	jb     0xbb
  3d:	40 38 fe             	cmp    %dil,%sil


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
