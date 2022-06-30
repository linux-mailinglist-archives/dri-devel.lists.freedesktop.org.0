Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F089560FDB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 06:03:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB93C10EAC1;
	Thu, 30 Jun 2022 04:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A4810EAC1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 04:03:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 814416209E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 04:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCEE6C3411E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 04:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656561813;
 bh=MZ2M4AeoTnYvqELIvMUwXfXlddchfGTNjuKXIze1zjQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KId+NSRWfUFSo4Ise9X8fiqsoaVwsDv3DyfVoZHKXl8qIlVtgEPExUW0v6nLWkCDl
 Ir9BGZNPIumMFFZeRl71VGPr7szoIuq/6Qhc5lTvAAVk0mbN/SWMHccnA3OqDKmbeL
 ymOnGuwGXLEUo61K8PgFvaxVYWkeoz09EX45SJtXV7HjSD9wwnybFyscpT3mFQ20Vz
 adlRQFNhxb4leFh7zNYIC72CpyHm/e+oQUIo7RWyqelTOkGAXOOfuxPUtgjVqryiwv
 ILK0qf1LhjArimoJgzW0OUw64afS3Dh/SVHVLqMoU9S8DGSgUCmg3RVg8FEdyILlhJ
 TjMhPyYI4IGlw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C9EAFCC13B5; Thu, 30 Jun 2022 04:03:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215618] vblank related lockup during start of SteamVR using
 Valve Index HMD
Date: Thu, 30 Jun 2022 04:03:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: perk11@perk11.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215618-2300-1ciBH7v91u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215618-2300@https.bugzilla.kernel.org/>
References: <bug-215618-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215618

Konstantin Pereiaslov (perk11@perk11.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |perk11@perk11.info

--- Comment #3 from Konstantin Pereiaslov (perk11@perk11.info) ---
Getting the same issue as the original post most times when starting SteamVR
with Valve Index connected.

Linux perk11-home 5.18.6-1-MANJARO #1 SMP PREEMPT_DYNAMIC Wed Jun 22 14:16:=
20
UTC 2022 x86_64 GNU/Linux


Jun 29 22:38:01 perk11-home kernel: [drm:dm_vblank_get_counter [amdgpu]]
*ERROR* dc_stream_state is NULL for crtc '1'!
Jun 29 22:38:01 perk11-home kernel: [drm:dm_crtc_get_scanoutpos [amdgpu]]
*ERROR* dc_stream_state is NULL for crtc '1'!
Jun 29 22:38:01 perk11-home kernel: [drm:dm_vblank_get_counter [amdgpu]]
*ERROR* dc_stream_state is NULL for crtc '1'!
Jun 29 22:38:01 perk11-home kernel: ------------[ cut here ]------------
Jun 29 22:38:01 perk11-home kernel: amdgpu 0000:0a:00.0:
drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
Jun 29 22:38:01 perk11-home kernel: WARNING: CPU: 0 PID: 24962 at
drivers/gpu/drm/drm_vblank.c:728
drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x343/0x350
Jun 29 22:38:01 perk11-home kernel: Modules linked in: cdc_acm xt_REDIRECT
xt_nat xt_tcpudp veth xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnet=
link
xt_addrtype iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
br_netfilter bridge stp>
Jun 29 22:38:01 perk11-home kernel:  gpu_sched crypto_simd drm_ttm_helper
cryptd ttm snd_timer rapl snd drm_dp_helper tpm_crb soundcore pcspkr tpm_tis
tpm_tis_core ccp tpm joydev rng_core pinctrl_amd mac_hid sp5100_tco wmi k10=
temp
i2c_piix4 acpi_cpufre>
Jun 29 22:38:01 perk11-home kernel: CPU: 0 PID: 24962 Comm: VulkanVblankThr
Tainted: G           OE     5.18.6-1-MANJARO #1
b31d9f0a4836337638fdda8256aa2395a26153d9
Jun 29 22:38:01 perk11-home kernel: Hardware name: Gigabyte Technology Co.,
Ltd. X570 AORUS ELITE/X570 AORUS ELITE, BIOS F37a 02/16/2022
Jun 29 22:38:01 perk11-home kernel: RIP:
0010:drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x343/0x350
Jun 29 22:38:01 perk11-home kernel: Code: 48 8b 5f 50 48 85 db 75 03 48 8b =
1f
e8 46 5b 01 00 48 c7 c1 10 9b 14 b8 48 89 da 48 c7 c7 0c a0 0b b8 48 89 c6 =
e8
59 4e 3e 00 <0f> 0b e9 c7 fd ff ff e8 f1 fa 43 00 90 f3 0f 1e fa 0f 1f 44 0=
0 00
Jun 29 22:38:01 perk11-home kernel: RSP: 0018:ffffba908622bb98 EFLAGS: 0001=
0086
Jun 29 22:38:01 perk11-home kernel: RAX: 0000000000000000 RBX: ffff9ec78170=
b600
RCX: 0000000000000027
Jun 29 22:38:01 perk11-home kernel: RDX: ffff9ed67ea216a8 RSI: 000000000000=
0001
RDI: ffff9ed67ea216a0
Jun 29 22:38:01 perk11-home kernel: RBP: ffffba908622bc08 R08: 000000000000=
0000
R09: ffffba908622b9a8
Jun 29 22:38:01 perk11-home kernel: R10: 0000000000000003 R11: ffff9ed6bf32=
48a8
R12: ffffba908622bc68
Jun 29 22:38:01 perk11-home kernel: R13: ffffffffc0ea51e0 R14: 000000000000=
0003
R15: ffff9ec7a0ab41d8
Jun 29 22:38:01 perk11-home kernel: FS:  00007f4f18238640(0000)
GS:ffff9ed67ea00000(0000) knlGS:0000000000000000
Jun 29 22:38:01 perk11-home kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 29 22:38:01 perk11-home kernel: CR2: 00007f4eb4001278 CR3: 00000001b7dc=
8000
CR4: 0000000000350ef0
Jun 29 22:38:01 perk11-home kernel: Call Trace:
Jun 29 22:38:01 perk11-home kernel:  <TASK>
Jun 29 22:38:01 perk11-home kernel:  drm_get_last_vbltimestamp+0xaa/0xc0
Jun 29 22:38:01 perk11-home kernel:  drm_update_vblank_count+0x8f/0x3a0
Jun 29 22:38:01 perk11-home kernel:  drm_vblank_enable+0x14b/0x180
Jun 29 22:38:01 perk11-home kernel:  drm_vblank_get+0x97/0xe0
Jun 29 22:38:01 perk11-home kernel:  drm_crtc_queue_sequence_ioctl+0xf9/0x2=
d0
Jun 29 22:38:01 perk11-home kernel:  ? drm_ioctl+0x250/0x410
Jun 29 22:38:01 perk11-home kernel:  ? drm_crtc_get_sequence_ioctl+0x1a0/0x=
1a0
Jun 29 22:38:01 perk11-home kernel:  drm_ioctl_kernel+0xca/0x170
Jun 29 22:38:01 perk11-home kernel:  drm_ioctl+0x22e/0x410
Jun 29 22:38:01 perk11-home kernel:  ? drm_crtc_get_sequence_ioctl+0x1a0/0x=
1a0
Jun 29 22:38:01 perk11-home kernel:  amdgpu_drm_ioctl+0x4e/0x80 [amdgpu
87a94d2005d4986ad8a825609f070d6f446ae712]
Jun 29 22:38:01 perk11-home kernel:  __x64_sys_ioctl+0x91/0xc0
Jun 29 22:38:01 perk11-home kernel:  do_syscall_64+0x5f/0x90
Jun 29 22:38:01 perk11-home kernel:  ? exc_page_fault+0x74/0x170
Jun 29 22:38:01 perk11-home kernel:  entry_SYSCALL_64_after_hwframe+0x44/0x=
ae
Jun 29 22:38:01 perk11-home kernel: RIP: 0033:0x7f4f2f3077af
Jun 29 22:38:01 perk11-home kernel: Code: 00 48 89 44 24 18 31 c0 48 8d 44 =
24
60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 =
00
00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 0=
0 00
Jun 29 22:38:01 perk11-home kernel: RSP: 002b:00007f4f18237a80 EFLAGS: 0000=
0246
ORIG_RAX: 0000000000000010
Jun 29 22:38:01 perk11-home kernel: RAX: ffffffffffffffda RBX: 000000000000=
0000
RCX: 00007f4f2f3077af
Jun 29 22:38:01 perk11-home kernel: RDX: 00007f4f18237b10 RSI: 00000000c018=
643c
RDI: 0000000000000060
Jun 29 22:38:01 perk11-home kernel: RBP: 00007f4f18237b10 R08: 000000000000=
0000
R09: 00007f4eb4000be0
Jun 29 22:38:01 perk11-home kernel: R10: 0000000000004022 R11: 000000000000=
0246
R12: 00000000c018643c
Jun 29 22:38:01 perk11-home kernel: R13: 0000000000000060 R14: 000055f449aa=
abd0
R15: 00007f4f18138000
Jun 29 22:38:01 perk11-home kernel:  </TASK>
Jun 29 22:38:01 perk11-home kernel: ---[ end trace 0000000000000000 ]---
Jun 29 22:38:01 perk11-home kernel: [drm:dm_vblank_get_counter [amdgpu]]
*ERROR* dc_stream_state is NULL for crtc '1'!
Jun 29 22:38:01 perk11-home kernel: [drm:dm_crtc_get_scanoutpos [amdgpu]]
*ERROR* dc_stream_state is NULL for crtc '1'!
Jun 29 22:38:01 perk11-home kernel: [drm:dm_vblank_get_counter [amdgpu]]
*ERROR* dc_stream_state is NULL for crtc '1'!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
