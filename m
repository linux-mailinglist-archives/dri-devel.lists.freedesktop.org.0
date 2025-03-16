Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2782AA632FB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 01:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB43910E02C;
	Sun, 16 Mar 2025 00:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p5aqcWek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBB510E02C
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 00:31:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 41CF2A48B9F
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 00:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A96F4C4CEE5
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 00:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742085050;
 bh=xl3wMhJFwowkt23FMhmqQN++9P6qG4/3PHDKH0G1rME=;
 h=From:To:Subject:Date:From;
 b=p5aqcWekPAHJ1qPfjDpZGKnrxUDywahxAFF2MmVB/Yf6DCK09mGrKB/wmgCcIsAhJ
 1O24SaeXPkbE7XNkFqYydfWey2cmtpq6NIViyCeXR2SeVUrp18/+M20JtJCvssx7AF
 DRto1r/NJXVZob9epxl4XiMdZUvd44MJNIV5o13lqPGVpxRIZhuruI3asmedp4zI7z
 yenl6dirEtNW3QBHkS5EsLzQRcIU80TqOFllGBVmuMp/mdUJ5ZnNxD8jdTohn6nRsa
 JVoEAThfNtlcWa9GSlU5GbtgOAUGiG1gELBZ55c1Bd4AEHUQG9sI2IIuFM29Gl1WVR
 J5cFYqmrD7Dzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A2732C53BC5; Sun, 16 Mar 2025 00:30:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] New: amdgpu: Oops connecting HDMI/DVI/DP on HD 7850
 (Pitcairn)
Date: Sun, 16 Mar 2025 00:30:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression
Message-ID: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

            Bug ID: 219888
           Summary: amdgpu: Oops connecting HDMI/DVI/DP on HD 7850
                    (Pitcairn)
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.13.0
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: alexandre.f.demers@gmail.com
        Regression: No

Using ArchLinux's kernel 6.13.7 with two Radeon GPU. Main GPU is an RX 5500=
 XT,
second is an HD 7850 (Pitcairn).
Booting works fine with both cards. However, connecting a monitor on any of=
 the
HD 7850's port throws the following error.

Oops: Oops: 0010 [#1] PREEMPT SMP NOPTI
CPU: 0 UID: 0 PID: 138 Comm: kworker/0:1H Tainted: G S=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
6.13.7-arch1-1 #1 c1fb750cdab658a6e7961595e6231210fa8606e4
Tainted: [S]=3DCPU_OUT_OF_SPEC
Hardware name: To Be Filled By O.E.M. B550 Phantom Gaming 4/ac/B550 Phantom
Gaming 4/ac, BIOS P2.40 10/19/2022
Workqueue: events_highpri dm_irq_work_func [amdgpu]
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffad114066b868 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffffa047552802a8
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa04736648060
RBP: 0000000000000780 R08: ffffa04694d10000 R09: 0000000000000000
R10: 00000000007a1200 R11: ffffa04755280a88 R12: ffffa04736648000
R13: 0000000000000000 R14: 0000000000000780 R15: 0000000000000780
FS:  0000000000000000(0000) GS:ffffa049aea00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 000000010d8c8000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 ? __die_body.cold+0x19/0x27
 ? page_fault_oops+0x15c/0x2e0
 ? exc_page_fault+0x81/0x190
 ? asm_exc_page_fault+0x26/0x30
 resource_get_odm_slice_dst_width+0xc2/0x120 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 resource_get_odm_slice_dst_rect+0xba/0x140 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 resource_get_odm_slice_src_rect+0x57/0x130 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 resource_build_scaling_params+0x2b/0x940 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 resource_append_dpp_pipes_for_plane_composition+0x1dc/0x2a0 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 ? srso_return_thunk+0x5/0x5f
 ? dce110_get_pix_clk_dividers+0x233/0x2a0 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 dc_state_add_plane+0xca/0x260 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 create_validate_stream_for_sink+0x380/0x400 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 amdgpu_dm_connector_mode_valid+0x63/0x200 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 drm_connector_mode_valid+0x3b/0x60
 __drm_helper_update_and_validate+0x127/0x3e0
 ? srso_return_thunk+0x5/0x5f
 drm_helper_probe_single_connector_modes+0x332/0x630
 drm_client_modeset_probe+0x273/0x1740
 ? srso_return_thunk+0x5/0x5f
 ? __wake_up+0x44/0x60
 ? kmem_cache_free+0x3f0/0x450
 __drm_fb_helper_initial_config_and_unlock+0x3b/0x4d0
 ? srso_return_thunk+0x5/0x5f
 drm_client_dev_hotplug+0xa1/0xf0
 handle_hpd_irq_helper+0x176/0x190 [amdgpu
63b2a590acaeeee8c3b2e1cf2368f882ac94c973]
 process_one_work+0x17e/0x330
 worker_thread+0x2ce/0x3f0
 ? __pfx_worker_thread+0x10/0x10
 kthread+0xd2/0x100
 ? __pfx_kthread+0x10/0x10
 ret_from_fork+0x34/0x50
 ? __pfx_kthread+0x10/0x10
 ret_from_fork_asm+0x1a/0x30
 </TASK>
Modules linked in: tls snd_seq_dummy rfcomm snd_hrtimer snd_seq
nf_conntrack_netlink xt_nat iptable_raw xt_tcpudp veth xt_conntrack
xt_MASQUERADE bridge stp l>
 btmtk crypto_simd snd_pcm sp5100_tco cryptd videodev wmi_bmof snd_timer
mdio_devres blake2b_generic rapl cfg80211 snd i2c_piix4 bluetooth xor mc pc=
spkr
k10te>
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0018:ffffad114066b868 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffffa047552802a8
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffa04736648060
RBP: 0000000000000780 R08: ffffa04694d10000 R09: 0000000000000000
R10: 00000000007a1200 R11: ffffa04755280a88 R12: ffffa04736648000
R13: 0000000000000000 R14: 0000000000000780 R15: 0000000000000780
FS:  0000000000000000(0000) GS:ffffa049aea00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 000000010d8c8000 CR4: 0000000000350ef0
note: kworker/0:1H[138] exited with irqs disabled

I also tested a vanilla 6.13.0, which gave me the same error. Going back
further with the 6.10.2-rt from Arch gave me no output, but it didn't crash=
 (no
output in the logs).

My kernel is configured with radeon.si_support=3D0 radeon.cik_support=3D0
amdgpu.si_support=3D1 amdgpu.cik_support=3D1 amdgpu.dpm=3D1 amdgpu.dc=3D1
amdgpu.ppfeaturemask=3D0xffffffff

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
