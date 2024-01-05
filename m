Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6646825269
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 11:51:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C7610E598;
	Fri,  5 Jan 2024 10:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A537410E598
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 10:51:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B120A61A8A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 10:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26D75C433C7
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704451873;
 bh=4HRa9xmwoYWjWkNLKVt+R1MWKBA7YpSxAOzL5aCLyd8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=balggXYLp17VgwRcpFG8fsc+AvzE6gboOHRBezCNFWQCy5RsHjDuqSJuu7Uma2zYg
 nsce5geJ+q+HnmqS2FDeuUxyMS7PzikDgJlr0sjKqj/0saMKYIv1yq+VviKXCExP5S
 AD15MW8BzukA3xd1DhluJW1wFroI0z4HhfJlnWUnabOVBXpBhcx1x0BbkybNhKd3dr
 keGrOqzhQD2VF8p9OviPkC3QuVwnvQBtVsbe74cCWTEmHFDn9fpc9sIegf5gjx6p/Z
 /cVhhFzF5A+W3YQCZpv+KfAEwCXfUSMj0xBTl5aO7LjSeUYz2g/lbtGB7LzTlYmMRG
 zlk92iInwfMwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 13F35C53BC6; Fri,  5 Jan 2024 10:51:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Fri, 05 Jan 2024 10:51:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: riksoft@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-T2vEovWl7b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

Rik (riksoft@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |riksoft@gmail.com

--- Comment #61 from Rik (riksoft@gmail.com) ---
Yesterday I've apt update Debian 12 and with the update I got 6.1.0.-16 -->
6.1.0.-17.
This morning while I was scrolling rapidly a long page of code inside Netbe=
ans
20, I find myself at login.
I DOUBT IT'S MERE COINCIDENCE because I've been working ok for months with =
the
same exact hw/sw config

I can see the culprit in log:
Jan 05 09:50:44  kernel: amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 1=
47
0x00000802 for process Xorg pid 1130 thread Xorg:cs0 pid 1605
That triggered a cascade of problems this way

Jan 05 09:50:44  kernel: amdgpu 0000:01:00.0: amdgpu: GPU fault detected: 1=
47
0x00000802 for process Xorg pid 1130 thread Xorg:cs0 pid 1605
Jan 05 09:50:44  kernel: amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x00000800
Jan 05 09:50:44  kernel: amdgpu 0000:01:00.0: amdgpu:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0C008002
Jan 05 09:50:44  kernel: amdgpu 0000:01:00.0: amdgpu: VM fault (0x02, vmid =
6,
pasid 32769) at page 2048, read from 'TC0' (0x54433000) (8)
Jan 05 09:50:54  kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
timeout, signaled seq=3D158350, emitted seq=3D158352
Jan 05 09:50:54  kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process Xorg pid 1130 thread Xorg:cs0 pid 1605
Jan 05 09:50:54  kernel: amdgpu 0000:01:00.0: amdgpu: GPU reset begin!
Jan 05 09:50:54  kernel: amdgpu: cp is busy, skip halt cp
Jan 05 09:50:55  kernel: amdgpu: rlc is busy, skip halt rlc
Jan 05 09:50:55  kernel: amdgpu 0000:01:00.0: amdgpu: BACO reset
Jan 05 09:50:55  kernel: amdgpu 0000:01:00.0: amdgpu: GPU reset succeeded,
trying to resume
Jan 05 09:50:55  kernel: [drm] PCIE GART of 256M enabled (table at
0x000000F400900000).
Jan 05 09:50:55  kernel: [drm] VRAM is lost due to GPU reset!
Jan 05 09:50:55  kernel: [drm] UVD and UVD ENC initialized successfully.
Jan 05 09:50:55  kernel: [drm] VCE initialized successfully.
Jan 05 09:50:55  kernel: amdgpu 0000:01:00.0: amdgpu: recover vram bo from
shadow start
Jan 05 09:50:55  kernel: amdgpu 0000:01:00.0: amdgpu: recover vram bo from
shadow done
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: amdgpu 0000:01:00.0: amdgpu: GPU reset(2) succeede=
d!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm] Skip scheduling IBs!
Jan 05 09:50:55  kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
initialize parser -125!
Jan 05 09:50:55  pulseaudio[3356]: X11 I/O error handler called
Jan 05 09:50:55  pulseaudio[3356]: X11 I/O error exit handler called, prepa=
ring
to tear down X11 modules
Jan 05 09:50:55  polkitd[1078]: Unregistered Authentication Agent for
unix-session:4 (system bus name :1.44, object path
/org/mate/PolicyKit1/AuthenticationAgent, locale en_GB.UTF-8) (disconnected
from bus)
Jan 05 09:50:55  at-spi-bus-launcher[3480]: X connection to :0 broken (expl=
icit
kill or server shutdown).
Jan 05 09:50:55  lightdm[2844]: pam_unix(lightdm:session): session closed f=
or
user rik
Jan 05 09:50:55  systemd-logind[920]: Session 4 logged out. Waiting for
processes to exit.
Jan 05 09:50:55  firefox[4100]: Exiting due to channel error.
Jan 05 09:50:55  firefox[17385]: Exiting due to channel error.
Jan 05 09:50:55  firefox[4070]: Exiting due to channel error.
Jan 05 09:50:55  firefox[4074]: Exiting due to channel error.
Jan 05 09:50:55  firefox[17422]: Exiting due to channel error.
Jan 05 09:50:55  firefox[17383]: Exiting due to channel error.
Jan 05 09:50:55  firefox[4020]: Exiting due to channel error.
Jan 05 09:50:55  firefox[3959]: Exiting due to channel error.
Jan 05 09:50:55  kernel: ------------[ cut here ]------------
Jan 05 09:50:55  kernel: WARNING: CPU: 4 PID: 13711 at
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:655 amdgpu_irq_put+0x45/0x70 [amdgp=
u]
Jan 05 09:50:55  kernel: Modules linked in: vboxnetadp(OE) vboxnetflt(OE)
vboxdrv(OE) rfkill ip6t_REJECT nf_reject_ipv6 xt_hl ip6_tables ip6t_rt
ipt_REJECT nf_reject_ipv4 xt_LOG nf_log_syslog xt_multiport nft_limit xt_li=
mit
xt_addrtype xt_tcpudp sunrpc xt_conntrack nf_conn>
Jan 05 09:50:55  kernel:  loop fuse ip_tables x_tables autofs4 ext4 crc16
mbcache jbd2 btrfs blake2b_generic zstd_compress raid10 raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq
libcrc32c crc32c_generic raid1 raid0 multipath linear md_mod hi>
Jan 05 09:50:55  kernel: CPU: 4 PID: 13711 Comm: kworker/4:0 Tainted: G=20=
=20=20=20=20=20=20=20
  OE      6.1.0-17-amd64 #1  Debian 6.1.69-1
Jan 05 09:50:55  kernel: Hardware name: To Be Filled By O.E.M. To Be Filled=
 By
O.E.M./Z370 Extreme4, BIOS P1.80 03/20/2018
Jan 05 09:50:55  kernel: Workqueue: events drm_mode_rmfb_work_fn [drm]
Jan 05 09:50:55  kernel: RIP: 0010:amdgpu_irq_put+0x45/0x70 [amdgpu]
Jan 05 09:50:55  kernel: Code: 48 8b 4e 10 48 83 39 00 74 2c 89 d1 48 8d 04=
 88
8b 08 85 c9 74 14 f0 ff 08 b8 00 00 00 00 74 05 c3 cc cc cc cc e9 8b fd ff =
ff
<0f> 0b b8 ea ff ff ff c3 cc cc cc cc b8 ea ff ff ff c3 cc cc cc cc
Jan 05 09:50:55  kernel: RSP: 0018:ffff9c9603077900 EFLAGS: 00010046
Jan 05 09:50:55  kernel: RAX: ffff90d56350bca0 RBX: ffff90d540c63800 RCX:
0000000000000000
Jan 05 09:50:55  kernel: RDX: 0000000000000000 RSI: ffff90d54bf86578 RDI:
ffff90d54bf80000
Jan 05 09:50:55  kernel: RBP: 0000000000000000 R08: ffffffffc0e0691d R09:
0000000000000000
Jan 05 09:50:55  kernel: R10: ffff9c96030777f4 R11: 000000000000090d R12:
ffff90d54bf80010
Jan 05 09:50:55  kernel: R13: ffff90d54bf80000 R14: ffff90d62c5e4e00 R15:
ffff90d540c63800
Jan 05 09:50:55  kernel: FS:  0000000000000000(0000) GS:ffff90d89ed00000(00=
00)
knlGS:0000000000000000
Jan 05 09:50:55  kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Jan 05 09:50:55  kernel: CR2: 00007f903f3433d8 CR3: 00000002e8a10006 CR4:
00000000003706e0
Jan 05 09:50:55  kernel: Call Trace:
Jan 05 09:50:55  kernel:  <TASK>
Jan 05 09:50:55  kernel:  ? __warn+0x7d/0xc0
Jan 05 09:50:55  kernel:  ? amdgpu_irq_put+0x45/0x70 [amdgpu]
Jan 05 09:50:55  kernel:  ? report_bug+0xe2/0x150
Jan 05 09:50:55  kernel:  ? handle_bug+0x41/0x70
Jan 05 09:50:55  kernel:  ? exc_invalid_op+0x13/0x60
Jan 05 09:50:55  kernel:  ? asm_exc_invalid_op+0x16/0x20
Jan 05 09:50:55  kernel:  ? amdgpu_irq_put+0x45/0x70 [amdgpu]
Jan 05 09:50:55  kernel:  dm_set_vblank+0x187/0x1b0 [amdgpu]
Jan 05 09:50:55  kernel:  drm_vblank_disable_and_save+0xb3/0xf0 [drm]
Jan 05 09:50:55  kernel:  drm_crtc_vblank_off+0xd1/0x2a0 [drm]
Jan 05 09:50:55  kernel:  amdgpu_dm_atomic_commit_tail+0x182/0x3790 [amdgpu]
Jan 05 09:50:55  kernel:  ? __alloc_pages+0x1dc/0x330
Jan 05 09:50:55  kernel:  ? free_unref_page_commit+0x7c/0x170
Jan 05 09:50:55  kernel:  ? free_unref_page+0x15f/0x1d0
Jan 05 09:50:55  kernel:  ? mod_lruvec_page_state.constprop.0+0x1c/0x30
Jan 05 09:50:55  kernel:  ? __kmalloc_large_node+0x9e/0xe0
Jan 05 09:50:55  kernel:  ? __kmalloc_node+0xbf/0x150
Jan 05 09:50:55  kernel:  ? dce112_validate_bandwidth+0x72/0x1c0 [amdgpu]
Jan 05 09:50:55  kernel:  ? dc_validate_global_state+0x309/0x3d0 [amdgpu]
Jan 05 09:50:55  kernel:  ? dma_resv_iter_first_unlocked+0x62/0x70
Jan 05 09:50:55  kernel:  ? dma_resv_get_fences+0x5d/0x220
Jan 05 09:50:55  kernel:  ? dma_resv_get_singleton+0x42/0x140
Jan 05 09:50:55  kernel:  ? wait_for_completion_timeout+0x13a/0x170
Jan 05 09:50:55  kernel:  ? wait_for_completion_interruptible+0x135/0x1e0
Jan 05 09:50:55  kernel:  commit_tail+0x91/0x130 [drm_kms_helper]
Jan 05 09:50:55  kernel:  drm_atomic_helper_commit+0x112/0x140 [drm_kms_hel=
per]
Jan 05 09:50:55  kernel:  drm_atomic_commit+0x93/0xc0 [drm]
Jan 05 09:50:55  kernel:  ? drm_plane_get_damage_clips.cold+0x1c/0x1c [drm]
Jan 05 09:50:55  kernel:  drm_framebuffer_remove+0x479/0x510 [drm]
Jan 05 09:50:55  kernel:  drm_mode_rmfb_work_fn+0x76/0x90 [drm]
Jan 05 09:50:55  kernel:  process_one_work+0x1c4/0x380
Jan 05 09:50:55  kernel:  worker_thread+0x1ab/0x380
Jan 05 09:50:55  kernel:  ? rescuer_thread+0x3a0/0x3a0
Jan 05 09:50:55  kernel:  kthread+0xd7/0x100
Jan 05 09:50:55  kernel:  ? kthread_complete_and_exit+0x20/0x20
Jan 05 09:50:55  kernel:  ret_from_fork+0x1f/0x30
Jan 05 09:50:55  kernel:  </TASK>
Jan 05 09:50:55  kernel: ---[ end trace 0000000000000000 ]---
Jan 05 09:50:56  rtkit-daemon[2336]: Supervising 3 threads of 1 processes o=
f 1
users.
Jan 05 09:50:56  rtkit-daemon[2336]: Successfully made thread 17615 of proc=
ess
3356 owned by '1000' RT at priority 5.
Jan 05 09:50:56  rtkit-daemon[2336]: Supervising 4 threads of 1 processes o=
f 1
users.
Jan 05 09:50:56  lightdm[17633]: pam_unix(lightdm-greeter:session): session
opened for user lightdm(uid=3D114) by (uid=3D0)
Jan 05 09:50:56  systemd[1]: Created slice user-114.slice - User Slice of U=
ID
114.
Jan 05 09:50:56  systemd[1]: Starting user-runtime-dir@114.service - User
Runtime Directory /run/user/114...
Jan 05 09:50:56  systemd-logind[920]: New session c2 of user lightdm.



Graphics:
  Device-1: AMD Ellesmere [Radeon RX 470/480/570/570X/580/580X/590]
    driver: amdgpu v: kernel
  Display: x11 server: X.Org v: 1.21.1.7 driver: X: loaded: amdgpu
    unloaded: fbdev,modesetting,vesa dri: radeonsi gpu: amdgpu resolution:
    1: 1440x2560~60Hz 2: 1440x2560~60Hz
  API: OpenGL v: 4.6 Mesa 22.3.6 renderer: AMD Radeon RX 570 Series
    (polaris10 LLVM 15.0.6 DRM 3.49 6.1.0-17-amd64)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
