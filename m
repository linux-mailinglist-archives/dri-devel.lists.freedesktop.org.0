Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C26A53C4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 08:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B79F10E028;
	Tue, 28 Feb 2023 07:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474FD10E028
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 07:36:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6071760EB0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 07:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1773C433EF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 07:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677569791;
 bh=+viEYknCHdrD8q+rYiWAB39Qo5+9UyimTjByNxXpbm4=;
 h=From:To:Subject:Date:From;
 b=BaVh0w4N8W7mbel+7HDCSelHpk+vAdfdXGMRL0yapxwxJobjy7jwN6pC/0ueJ8vNB
 3swH3Cibe375vaD05wUne1tMrX2NJAVDzCXQkuYdTQsb5ciffpDLXYmiL7s/8BuIUN
 sjp/KZjpaQ9UajylrvR7YNyl+FJmYRtoSrrF0L/HyOQTpVGYvvNRIC0K0qpqKbG6mg
 YtqCzMnlt/cKwnT31+Jdg7uSNUDqktDRz+GTw7seJpHlYr9B7UZbJ1sv6vaG7R3DEB
 jgRljJKUVELEa0mryGJ9Rh8z4xEn3LZZwPxXoXsypbedxktN4gRN+/jU7myClGomqe
 Paz6qTbLmOmYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AFA81C43143; Tue, 28 Feb 2023 07:36:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217099] New: amdgpu driver errors after disconnecting a Lenovo
 T14 (Gen1 AMD) from dock when the laptop is sleeping
Date: Tue, 28 Feb 2023 07:36:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217099-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217099

            Bug ID: 217099
           Summary: amdgpu driver errors after disconnecting a Lenovo T14
                    (Gen1 AMD) from dock when the laptop is sleeping
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.2.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: madcatx@atlas.cz
        Regression: No

Hi all,

I have started to notice this since kernel 6.1. When I connect my Lenovo T14
Gen1 laptop to a docking station, put it to sleep, disconnect it from the d=
ock
and then wake it up, it causes issues in the amdgpu driver and a reboot is
required. The dock has an external display connected via DisplayPort and bo=
th
the external and built-in screen are in use when this happens. When I
disconnect the dock with the laptop powered up there are no issues.

Now on kernel 6.2.1 I see a series of errors like this in dmesg:

=C3=BAno 28 08:18:41 Sad-Silke kernel:  </TASK>
=C3=BAno 28 08:18:41 Sad-Silke kernel: R13: 0000000000000018 R14: 0000562b9=
a6ed4a0
R15: 0000562b9a66a530
=C3=BAno 28 08:18:41 Sad-Silke kernel: R10: 0000562b9a37b010 R11: 000000000=
0000246
R12: 00000000c03864bc
=C3=BAno 28 08:18:41 Sad-Silke kernel: RBP: 00007ffd88b8f870 R08: 000000000=
0000007
R09: 0000000000000007
=C3=BAno 28 08:18:41 Sad-Silke kernel: RDX: 00007ffd88b8f870 RSI: 00000000c=
03864bc
RDI: 0000000000000018
=C3=BAno 28 08:18:41 Sad-Silke kernel: RAX: ffffffffffffffda RBX: 0000562b9=
bb1e3f0
RCX: 00007f5326d1553f
=C3=BAno 28 08:18:41 Sad-Silke kernel: RSP: 002b:00007ffd88b8f7d0 EFLAGS: 0=
0000246
ORIG_RAX: 0000000000000010
=C3=BAno 28 08:18:41 Sad-Silke kernel: Code: 00 48 89 44 24 18 31 c0 48 8d =
44 24 60
c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 =
00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
=C3=BAno 28 08:18:41 Sad-Silke kernel: RIP: 0033:0x7f5326d1553f
=C3=BAno 28 08:18:41 Sad-Silke kernel:  entry_SYSCALL_64_after_hwframe+0x72=
/0xdc
=C3=BAno 28 08:18:41 Sad-Silke kernel:  ? do_syscall_64+0x6b/0x90
=C3=BAno 28 08:18:41 Sad-Silke kernel:  ? do_syscall_64+0x6b/0x90
=C3=BAno 28 08:18:41 Sad-Silke kernel:  do_syscall_64+0x5f/0x90
=C3=BAno 28 08:18:41 Sad-Silke kernel:  __x64_sys_ioctl+0x94/0xd0
=C3=BAno 28 08:18:41 Sad-Silke kernel:  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu
0a2f4b6a08ebc5361cd3869444020e18bc7c4042]
=C3=BAno 28 08:18:41 Sad-Silke kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/=
0x10
=C3=BAno 28 08:18:41 Sad-Silke kernel:  drm_ioctl+0x233/0x410
=C3=BAno 28 08:18:41 Sad-Silke kernel:  drm_ioctl_kernel+0xcd/0x170
=C3=BAno 28 08:18:41 Sad-Silke kernel:  ? __pfx_drm_mode_atomic_ioctl+0x10/=
0x10
=C3=BAno 28 08:18:41 Sad-Silke kernel:  drm_mode_atomic_ioctl+0x744/0xb70
=C3=BAno 28 08:18:41 Sad-Silke kernel:  drm_atomic_check_only+0x5c0/0xa30
=C3=BAno 28 08:18:41 Sad-Silke kernel:  ?
amdgpu_dm_connector_atomic_duplicate_state+0x29/0xb0 [amdgpu
0a2f4b6a08ebc5361cd3869444020e18bc7c4042]
=C3=BAno 28 08:18:41 Sad-Silke kernel:  amdgpu_dm_atomic_check+0x65/0x11b0 =
[amdgpu
0a2f4b6a08ebc5361cd3869444020e18bc7c4042]
=C3=BAno 28 08:18:41 Sad-Silke kernel:  drm_atomic_helper_check_modeset+0x4=
03/0xc80
=C3=BAno 28 08:18:41 Sad-Silke kernel:  <TASK>
=C3=BAno 28 08:18:41 Sad-Silke kernel: Call Trace:
=C3=BAno 28 08:18:41 Sad-Silke kernel: CR2: 00007f1a4419e000 CR3: 000000011=
abda000
CR4: 0000000000350ee0
=C3=BAno 28 08:18:41 Sad-Silke kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
=C3=BAno 28 08:18:41 Sad-Silke kernel: FS:  00007f53229948c0(0000)
GS:ffff896f2fa80000(0000) knlGS:0000000000000000
=C3=BAno 28 08:18:41 Sad-Silke kernel: R13: ffff896843d45900 R14: ffff89684=
4d63c80
R15: ffff896846aa1000
=C3=BAno 28 08:18:41 Sad-Silke kernel: R10: ffff896844d63c80 R11: 000000000=
0000438
R12: ffff89684a41e568
=C3=BAno 28 08:18:41 Sad-Silke kernel: RBP: ffff896869b52000 R08: ffff89684=
a41e568
R09: ffff896843d45900
=C3=BAno 28 08:18:41 Sad-Silke kernel: RDX: ffff896843d45938 RSI: ffff89684=
1c9a0d0
RDI: 0000000000000000
=C3=BAno 28 08:18:41 Sad-Silke kernel: RAX: ffff896843d45938 RBX: ffff89684=
3d45920
RCX: 0000000000000001
=C3=BAno 28 08:18:41 Sad-Silke kernel: RSP: 0018:ffffb78d833aba78 EFLAGS: 0=
0010246
=C3=BAno 28 08:18:41 Sad-Silke kernel: Code: 45 30 e9 54 ff ff ff 48 8b 04 =
25 08 00
00 00 45 31 f6 31 db 48 85 c0 0f 85 a8 fe ff ff e9 39 ff ff ff 44 89 e8 e9 =
33
ff ff ff <0f> 0b 49 8b 44 24 58 4c 89 e9 48 89 ea 48 c7 c6 80 a5 e2 c0 48 8b
=C3=BAno 28 08:18:41 Sad-Silke kernel: RIP:
0010:drm_dp_atomic_release_time_slots+0x1bd/0x1f0 [drm_display_helper]
=C3=BAno 28 08:18:41 Sad-Silke kernel: Hardware name: LENOVO 20UDS02D00/20U=
DS02D00,
BIOS R1BET73W(1.42 ) 12/09/2022
=C3=BAno 28 08:18:41 Sad-Silke kernel: CPU: 10 PID: 1000 Comm: kwin_wayland=
 Tainted:
G        W          6.2.1-arch1-1 #1 826b345887e8fd845ab37a52cb3a6655383f6b=
60
=C3=BAno 28 08:18:41 Sad-Silke kernel:  snd_seq_device platform_profile ttm
snd_hwdep r8169 bluetooth snd_acp_config ucsi_acpi cfg80211 sp5100_tco
videobuf2_common snd_soc_acpi drm_display_helper snd_pcm typec_ucsi
ecdh_generic video psmouse rapl mc k10temp i2c_piix4 crc16 snd_pci_acp3x
realtek cec snd_timer typec ipmi_devintf rfkill mdio_devres roles libphy
ipmi_msghandler snd so>
=C3=BAno 28 08:18:41 Sad-Silke kernel: Modules linked in: rfcomm snd_seq_du=
mmy
snd_hrtimer snd_seq ccm algif_aead des_generic libdes ecb md4 cmac algif_ha=
sh
algif_skcipher af_alg bnep iwlmvm snd_soc_dmic snd_acp3x_pdm_dma snd_acp3x_=
rn
snd_sof_amd_rembrandt snd_sof_amd_renoir mac80211 snd_sof_amd_acp snd_sof_p=
ci
snd_sof_xtensa_dsp libarc4 snd_sof amdgpu snd_sof_utils snd_soc_core s>
=C3=BAno 28 08:18:41 Sad-Silke kernel: WARNING: CPU: 10 PID: 1000 at
drivers/gpu/drm/display/drm_dp_mst_topology.c:4322
drm_dp_atomic_release_time_slots+0x1bd/0x1f0 [drm_display_helper]
=C3=BAno 28 08:18:41 Sad-Silke kernel: ------------[ cut here ]------------
=C3=BAno 28 08:18:41 Sad-Silke kernel: amdgpu 0000:07:00.0: [drm] *ERROR* N=
o payload
for [MST PORT:00000000e956532c] found in mst state 00000000dcd511ab
=C3=BAno 28 08:18:41 Sad-Silke kernel: ---[ end trace 0000000000000000 ]---

HW:
Lenovo T14 Gen1 AMD, FW. 1.42
Lenovo TP Dock type AH40

Anything I can do to help troubleshoot this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
