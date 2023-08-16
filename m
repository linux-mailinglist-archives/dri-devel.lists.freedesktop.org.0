Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D67A677E5EB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C6910E385;
	Wed, 16 Aug 2023 16:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9882310E385
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:02:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20FDA62113
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 868D3C433CC
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692201777;
 bh=qzYX1dy+iGnhRFgEcw3lbZIfS2lDrHhkLVh5vA37yDg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mnsimBu9Mt/wcSiVYqHy3XyhX5CBukeuQ9E9HR9pLxbQritX3aurs6VmfMGRT5rIb
 oEiUu/khHMlYEPyma1Ej2iHyCxulK+aXMzIAPgLA9uAt8AaWn/tHvMZyWYI65UMsHQ
 1/B4pqWVWbUcCVaK9tBuqGzkJ/UTbZFuP7/5d4qSIcepqPR6UDATQaHlSklV1VVJ5B
 0/mI7qqblVr9OPs8Crr0nnflMA/Aw9fpQUEZHIVJipgNgDETaZeAMNvc7r9ZbKJX42
 ggxPhcj5n+BbRKu5gUfVd0VRLMAwa5O83VAVt1nDRQbDXZeOeGSNMz64xARC0Qzv2Q
 GzEwRsk62QpQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 73D0EC4332E; Wed, 16 Aug 2023 16:02:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201847] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
 000000000a721000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 82 [] on
 channel 4 [00ff85c000 X[3819]]
Date: Wed, 16 Aug 2023 16:02:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: simonfogliato@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201847-2300-xMmrjGJNho@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201847-2300@https.bugzilla.kernel.org/>
References: <bug-201847-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201847

Simon Fogliato (simonfogliato@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |simonfogliato@gmail.com

--- Comment #4 from Simon Fogliato (simonfogliato@gmail.com) ---
sf@sf-T3600 ~ % uname -a
Linux sf-T3600 6.4.10-arch1-1 #1 SMP PREEMPT_DYNAMIC Fri, 11 Aug 2023 11:03=
:36
+0000 x86_64 GNU/Linux

Aug 16 08:21:06 sf-T3600 kernel: nouveau 0000:03:00.0: fifo: fault 01 [WRIT=
E]
at 000000000002e000 engine 15 [PCE0] client 01 [HUB/PCOPY0] reason 02
[PAGE_NOT_PRES>
Aug 16 08:21:06 sf-T3600 kernel: nouveau 0000:03:00.0:
fifo:000000:0001:[(udev-worker)[738]] rc scheduled
Aug 16 08:21:06 sf-T3600 kernel: nouveau 0000:03:00.0: fifo:000000: rc
scheduled
Aug 16 08:21:06 sf-T3600 kernel: nouveau 0000:03:00.0:
fifo:000000:0001:0001:[(udev-worker)[738]] errored - disabling channel
Aug 16 08:21:06 sf-T3600 kernel: nouveau 0000:03:00.0: DRM: channel 1 kille=
d!
Aug 16 08:21:08 sf-T3600 kernel: sched: RT throttling activated
Aug 16 08:21:44 sf-T3600 rtkit-daemon[1065]: Supervising 8 threads of 5
processes of 1 users.
Aug 16 08:21:44 sf-T3600 rtkit-daemon[1065]: Supervising 8 threads of 5
processes of 1 users.
Aug 16 08:21:49 sf-T3600 kernel: ------------[ cut here ]------------
Aug 16 08:21:49 sf-T3600 kernel: WARNING: CPU: 0 PID: 19149 at mm/gup.c:1101
__get_user_pages+0x582/0x680
Aug 16 08:21:49 sf-T3600 kernel: Modules linked in: snd_seq_dummy snd_hrtim=
er
snd_seq rfkill intel_rapl_msr intel_rapl_common uvcvideo x86_pkg_temp_therm=
al
intel_>
Aug 16 08:21:49 sf-T3600 kernel:  crct10dif_pclmul crc32_pclmul crc32c_intel
polyval_clmulni uas polyval_generic usb_storage usbhid gf128mul
ghash_clmulni_intel s>
Aug 16 08:21:49 sf-T3600 kernel: CPU: 0 PID: 19149 Comm: chrome_crashpad
Tainted: G        W  OE      6.4.10-arch1-1 #1
2d4402bf7ad4a7ea488c9261840b8101c9d1e712
Aug 16 08:21:49 sf-T3600 kernel: Hardware name: Dell Inc. Precision
T3600/08HPGT, BIOS A15 05/08/2017
Aug 16 08:21:49 sf-T3600 kernel: RIP: 0010:__get_user_pages+0x582/0x680
Aug 16 08:21:49 sf-T3600 kernel: Code: 00 e9 cb fd ff ff 48 03 bd 88 00 00 =
00
e9 c7 fb ff ff 48 81 e1 00 f0 ff ff e9 4b fc ff ff 48 81 e2 00 f0 ff ff e9 =
b5
fc ff >
Aug 16 08:21:49 sf-T3600 kernel: RSP: 0018:ffffb531ccc17bf8 EFLAGS: 00010202
Aug 16 08:21:49 sf-T3600 kernel: RAX: ffff94633a009cc0 RBX: 000000000005000a
RCX: 00007ffdc4e02fff
Aug 16 08:21:49 sf-T3600 kernel: RDX: 0000000000000000 RSI: 00007eff84e4b000
RDI: ffff9463c986a080
Aug 16 08:21:49 sf-T3600 kernel: RBP: ffff946398f0bc80 R08: ffff94633a0b8008
R09: 0000000000000001
Aug 16 08:21:49 sf-T3600 kernel: R10: ffff94633a0b8080 R11: ffff94633a0b800c
R12: 0000000000000000
Aug 16 08:21:49 sf-T3600 kernel: R13: ffff94633a009cc0 R14: ffffb531ccc17cbc
R15: ffffb531ccc17cbc
Aug 16 08:21:49 sf-T3600 kernel: FS:  00007f7035d135c0(0000)
GS:ffff946a2f600000(0000) knlGS:0000000000000000
Aug 16 08:21:49 sf-T3600 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Aug 16 08:21:49 sf-T3600 kernel: CR2: 000036cc0040c300 CR3: 000000018e95e004
CR4: 00000000000626f0
Aug 16 08:21:49 sf-T3600 kernel: Call Trace:
Aug 16 08:21:49 sf-T3600 kernel:  <TASK>
Aug 16 08:21:49 sf-T3600 kernel:  ? __get_user_pages+0x582/0x680
Aug 16 08:21:49 sf-T3600 kernel:  ? __warn+0x81/0x130
Aug 16 08:21:49 sf-T3600 kernel:  ? __get_user_pages+0x582/0x680
Aug 16 08:21:49 sf-T3600 kernel:  ? report_bug+0x171/0x1a0
Aug 16 08:21:49 sf-T3600 kernel:  ? handle_bug+0x3c/0x80
Aug 16 08:21:49 sf-T3600 kernel:  ? exc_invalid_op+0x17/0x70
Aug 16 08:21:49 sf-T3600 kernel:  ? asm_exc_invalid_op+0x1a/0x20
Aug 16 08:21:49 sf-T3600 kernel:  ? __get_user_pages+0x582/0x680
Aug 16 08:21:49 sf-T3600 kernel:  ? __get_user_pages+0x8a/0x680
Aug 16 08:21:49 sf-T3600 kernel:  get_user_pages_remote+0x14a/0x400
Aug 16 08:21:49 sf-T3600 kernel:  __access_remote_vm+0x1bf/0x420
Aug 16 08:21:49 sf-T3600 kernel:  mem_rw.isra.0+0x111/0x1d0
Aug 16 08:21:49 sf-T3600 kernel:  vfs_read+0xac/0x320
Aug 16 08:21:49 sf-T3600 kernel:  ? mem_rw.isra.0+0x18a/0x1d0
Aug 16 08:21:49 sf-T3600 kernel:  ? vfs_read+0xac/0x320
Aug 16 08:21:49 sf-T3600 kernel:  __x64_sys_pread64+0x98/0xd0
Aug 16 08:21:49 sf-T3600 kernel:  do_syscall_64+0x60/0x90
Aug 16 08:21:49 sf-T3600 kernel:  ? __x64_sys_pread64+0xa8/0xd0
Aug 16 08:21:49 sf-T3600 kernel:  ? syscall_exit_to_user_mode+0x1b/0x40
Aug 16 08:21:49 sf-T3600 kernel:  ? do_syscall_64+0x6c/0x90
Aug 16 08:21:49 sf-T3600 kernel:  ? do_syscall_64+0x6c/0x90
Aug 16 08:21:49 sf-T3600 kernel:  entry_SYSCALL_64_after_hwframe+0x77/0xe1
Aug 16 08:21:49 sf-T3600 kernel: RIP: 0033:0x7f7035ae8d07
Aug 16 08:21:49 sf-T3600 kernel: Code: 08 89 3c 24 48 89 4c 24 18 e8 85 00 =
fa
ff 4c 8b 54 24 18 48 8b 54 24 10 41 89 c0 48 8b 74 24 08 8b 3c 24 b8 11 00 =
00
00 0f >
Aug 16 08:21:49 sf-T3600 kernel: RSP: 002b:00007fff5f79a8f0 EFLAGS: 00000293
ORIG_RAX: 0000000000000011
Aug 16 08:21:49 sf-T3600 kernel: RAX: ffffffffffffffda RBX: 0000000000001000
RCX: 00007f7035ae8d07
Aug 16 08:21:49 sf-T3600 kernel: RDX: 0000000000001000 RSI: 00007fff5f79abe0
RDI: 0000000000000007
Aug 16 08:21:49 sf-T3600 kernel: RBP: 00007fff5f79aa90 R08: 0000000000000000
R09: 000055f24f499c20
Aug 16 08:21:49 sf-T3600 kernel: R10: 00007eff84e4a880 R11: 0000000000000293
R12: 00007eff84e4a880
Aug 16 08:21:49 sf-T3600 kernel: R13: 000036cc00218380 R14: 00007fff5f79abe0
R15: 0000000000001000
Aug 16 08:21:49 sf-T3600 kernel:  </TASK>
Aug 16 08:21:49 sf-T3600 kernel: ---[ end trace 0000000000000000 ]---
Aug 16 08:22:08 sf-T3600 systemd[1]: Started Getty on tty5.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
