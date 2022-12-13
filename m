Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C4564B487
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 12:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DAD10E1D5;
	Tue, 13 Dec 2022 11:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9969010E1D5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 11:55:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4109AB8115E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 11:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D21BC433EF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 11:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670932465;
 bh=Br8yli4aC+Gy4i+XUMOlNKAPFP7QA7aI+vKkt6xas9k=;
 h=From:To:Subject:Date:From;
 b=nsZZgm4Ln0l4+zsKVpfVICHklVF7b5raJfREJa95gu5Ve0jKjr+zPmhpGnKe+eUHF
 Ak/vCV+bNUJIMTCnqTICozuNenZ3E/Kk1rr5MMa0ntofs5Tu+XlA4kYM1+kaW1BCG3
 siamzMMApJeZ8i/oXu4hVoiXIw8v88VBsm6DLv517iNhsZd8UlimYbfyTXCeu3Y4ZF
 0zhD0UVd1tt7CkqvdyWzoiXUgywOSFtre/b89O518GlPF/LqoDoB5OQdN9qMPrWR5h
 pGVffalzLNJhDRrAaJzlO55uh+Eq6wsO8RbwPx0F4k0yilJbqjKHD9GoYZxWbLcsd5
 cnKNM6bOlhRxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E7A9EC43143; Tue, 13 Dec 2022 11:54:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216805] New: external monitor not working since 6.1 (amdgpu:
 update_mst_stream_alloc_table, regression from 6.0))
Date: Tue, 13 Dec 2022 11:54:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216805-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216805

            Bug ID: 216805
           Summary: external monitor not working since 6.1 (amdgpu:
                    update_mst_stream_alloc_table, regression from 6.0))
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kolAflash@kolahilft.de
        Regression: No

Created attachment 303400
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303400&action=3Dedit
external monitor dmesg - 6.1 not working (amdgpu:
update_mst_stream_alloc_table) - 6.0 working

Since Linux-6.1 my external monitor isn't working anymore.
It was working fine with Linux-6.0, incl. 6.0.12. (-> regression)
For 6.1 there's a suspicious stacktrace in dmesg which wasn't there in 6.0.
(see attachment and below)



I connect two monitors via a USB-C/DisplayPort docking station.
The other monitor is working.

Notebook
- USB-C/DisplayPort: docking station
  - HDMI: external monitor (not working)
  - DisplayPort: VGA-Adapter: external monitor (working)

Notebook:
Model: HP EliteBook 845 G8 (notebook)
CPU+GPU: Ryzen 5650U incl. Radeon GPU
OS: openSUSE-15.4



I didn't have time to complete a full git bisect. This is where I'm right n=
ow:

git bisect start
# good: [4fe89d07dcc2804c8b562f6c7896a45643d34b2f] Linux 6.0
git bisect good 4fe89d07dcc2804c8b562f6c7896a45643d34b2f
# bad: [830b3c68c1fb1e9176028d02ef86f3cf76aa2476] Linux 6.1
git bisect bad 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
# bad: [33e591dee915832c618cf68bb1058c8e7d296128] Merge tag 'phy-for-6.1' of
git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
git bisect bad 33e591dee915832c618cf68bb1058c8e7d296128
# good: [a47e60729d9624e931f988709ab76e043e2ee8b9] Merge tag
'backlight-next-6.1' of
git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight
git bisect good a47e60729d9624e931f988709ab76e043e2ee8b9
# bad: [ff6862c23d2e83d12d1759bf4337d41248fb4dc8] Merge tag 'arm-drivers-6.=
1'
of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad ff6862c23d2e83d12d1759bf4337d41248fb4dc8
# bad: [95d8c67187bcfaa519bafcdef9091cd906505454] Merge tag
'drm-msm-next-2022-09-22' of https://gitlab.freedesktop.org/drm/msm into
drm-next
git bisect bad 95d8c67187bcfaa519bafcdef9091cd906505454
# bad: [6f3562b3bca078b40aa198db8fdc68439b7b0399] Merge drm/drm-next into
drm-intel-next
git bisect bad 6f3562b3bca078b40aa198db8fdc68439b7b0399
# good: [dbaadb3cebaad49c37e3fec937e73e6e41054404] drm/amdgpu/dm/mst: Rename
get_payload_table()
git bisect good dbaadb3cebaad49c37e3fec937e73e6e41054404
# good: [9aa320341e9a86c684ccf8c2e75ff07486d9bf46] drm/i915/display: Fix
warning callstack for imbalance wakeref
git bisect good 9aa320341e9a86c684ccf8c2e75ff07486d9bf46

Last known good:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D9aa320341e9a86c684ccf8c2e75ff07486d9bf46

First known bad:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D6f3562b3bca078b40aa198db8fdc68439b7b0399



I attached a dmesg from a broken 6.1 kernel and a dmesg from a working 6.0.=
12
kernel.
In the dmesg there's a suspicious stacktrace:

------------[ cut here ]------------
WARNING: CPU: 7 PID: 133 at
/home/myuser/opt/linux-kernel/build.backup-exclude-m461c/build_bisect/workt=
ree/drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:3534
update_mst_stream_alloc_table+0x170/0x180 [amdgpu]
Modules linked in: hid_generic(E) usbhid(E) amdgpu(E+) crc32_pclmul(E)
crc32c_intel(E) drm_ttm_helper(E) ttm(E) mfd_core(E) iommu_v2(E) gpu_sched(=
E)
i2c_algo_bit(E) drm_buddy(E) ghash_clmulni_intel(E) drm_display_helper(E)
drm_kms_helper(E) xhci_pci(E) syscopyarea(E) xhci_pci_renesas(E) sysfillrec=
t(E)
sysimgblt(E) aesni_intel(E) nvme(E) fb_sys_fops(E) crypto_simd(E) xhci_hcd(=
E)
nvme_core(E) cryptd(E) drm(E) t10_pi(E) serio_raw(E) crc64_rocksoft_generic=
(E)
cec(E) usbcore(E) ccp(E) sp5100_tco(E) rc_core(E) crc64_rocksoft(E) crc64(E)
video(E) wmi(E) i2c_hid_acpi(E) i2c_hid(E) dm_mirror(E) dm_region_hash(E)
dm_log(E) sg(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E)
scsi_dh_alua(E) scsi_mod(E) scsi_common(E) msr(E) efivarfs(E)
CPU: 7 PID: 133 Comm: kworker/7:1 Tainted: G            E=20=20=20=20=20
6.1.0-v6.1-myhost #2
Hardware name: HP HP EliteBook 845 G8 Notebook PC/8895, BIOS T82 Ver. 01.10=
.00
07/13/2022
Workqueue: events_long drm_dp_mst_link_probe_work [drm_display_helper]
RIP: 0010:update_mst_stream_alloc_table+0x170/0x180 [amdgpu]
Code: 00 00 00 75 cd 48 8b 84 24 90 00 00 00 65 48 33 04 25 28 00 00 00 75 =
19
48 81 c4 98 00 00 00 5b 5d 41 5c 41 5d c3 cc cc cc cc <0f> 0b e9 da fe ff f=
f e8
b4 28 8c e4 0f 1f 40 00 0f 1f 44 00 00 55
RSP: 0018:ffffa52180643668 EFLAGS: 00010202
RAX: 0000000000000002 RBX: ffff8c348d5e8c00 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff8c3510e5d420 RDI: 0000000000000000
RBP: ffffa52180643668 R08: 0000000000000001 R09: ffff8c348d5e8c00
R10: ffffa52180643730 R11: 0000000000000030 R12: ffff8c3560f00aa0
R13: 0000000000000002 R14: ffff8c3560f00aa0 R15: ffff8c34879bdb00
FS:  0000000000000000(0000) GS:ffff8c434e9c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fb6d9270000 CR3: 000000010b610000 CR4: 0000000000750ee0
PKRU: 55555554
Call Trace:
 <TASK>
 dc_link_allocate_mst_payload+0x97/0x2a0 [amdgpu]
 core_link_enable_stream+0x692/0xa00 [amdgpu]
 ? optc1_set_drr+0x139/0x1e0 [amdgpu]
 dce110_apply_ctx_to_hw+0x64b/0x6d0 [amdgpu]
 ? dcn10_plane_atomic_power_down+0xcb/0x100 [amdgpu]
 ? __free_pages_ok+0x26d/0x440
 ? dcn10_wait_for_mpcc_disconnect+0x39/0x150 [amdgpu]
 dc_commit_state_no_check+0x3c3/0xc10 [amdgpu]
 dc_commit_state+0x104/0x120 [amdgpu]
 amdgpu_dm_atomic_commit_tail+0x53c/0x2910 [amdgpu]
[...]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
