Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501914E2EC6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 18:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D1810E1A5;
	Mon, 21 Mar 2022 17:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E0F10E1A5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 17:07:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0C9A6144A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 17:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A986C340FE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 17:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647882428;
 bh=q2j+RHgXReIEx7VD3JOcPbpb1/dfXlBgeRaxJl6NKOk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GOJh2Ydo9CHayESnY+kkYHwyD9hLxFJyY4jchUMu9CoBRxLPAoNlUxUT1milRvAin
 1LbKczEOgudoAvWfwcKBxAydpKLMcSKGyYaxNWILRkUwIkrIb85bq0tWfXUrXBiyyG
 VERdFAwldbkLcOrRcDTnOnkKg4feqMTyXGzBuxw7pAgxkz/C3p6p3wq0/kyRB1Hfco
 PWGcWAiPjqpuzT88WhiGsyp+c6L3RpfqfoPBZvTBGBpB1H0VXsi25zkg3HUCofVZVM
 pnRl4aBzjvBeqeG9sjCggTaGh6mbWSdQqzZXfgtp48WZ9gEhtzvJfB+OE7zvLLhnAl
 NrxTV+cc0jMPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 89307C05FE2; Mon, 21 Mar 2022 17:07:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Mon, 21 Mar 2022 17:07:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: commandline@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205089-2300-XdowKZSe5A@https.bugzilla.kernel.org/>
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

Joris L. (commandline@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |commandline@protonmail.com

--- Comment #36 from Joris L. (commandline@protonmail.com) ---
I also see these kind of errors on EL8 with kernel 4.18.0-348.20.1.el8_5.x8=
6_64

I've been tracking a webkit bug for some time with similar impact, this web=
kit
bug were hard freezes but here the system does not always freeze, it can
recover.

Since the webkit bug was browser originating and specific to some URL only i
considered it highly likely to be specific to Javascript.

Now also the impact is Javascript/NodeJS specific.

The URL which now caused this freeze was while writing content on LinkedIn.=
com

Before the most recent 'partial freeze' there was a 'full freeze' where the
messages such as '[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initiali=
ze
parser -125!' were preceeded by a lengthy evolution of the problem

------

[ma mrt 21 17:06:55 2022] perf: interrupt took too long (2510 > 2500), lowe=
ring
kernel.perf_event_max_sample_rate to 79000
[ma mrt 21 17:09:27 2022] [drm:amdgpu_dm_commit_planes [amdgpu]] *ERROR*
Waiting for fences timed out!
[ma mrt 21 17:09:32 2022] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring s=
dma0
timeout, signaled seq=3D266035, emitted seq=3D266036
[ma mrt 21 17:09:32 2022] [drm:amdgpu_dm_commit_planes [amdgpu]] *ERROR*
Waiting for fences timed out!
[ma mrt 21 17:09:32 2022] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process  pid 0 thread  pid 0
[ma mrt 21 17:09:32 2022] amdgpu 0000:05:00.0: GPU reset begin!
[ma mrt 21 17:09:32 2022] [drm] free PSP TMR buffer
[ma mrt 21 17:09:32 2022] amdgpu 0000:05:00.0: MODE2 reset
[ma mrt 21 17:09:32 2022] amdgpu 0000:05:00.0: GPU reset succeeded, trying =
to
resume
[ma mrt 21 17:09:32 2022] [drm] PCIE GART of 1024M enabled (table at
0x000000F400900000).
[ma mrt 21 17:09:32 2022] [drm] PSP is resuming...
[ma mrt 21 17:09:32 2022] [drm] reserve 0x400000 from 0xf47fc00000 for PSP =
TMR
[ma mrt 21 17:09:32 2022] amdgpu 0000:05:00.0: RAS: optional ras ta ucode is
not available
[ma mrt 21 17:09:32 2022] amdgpu 0000:05:00.0: RAP: optional rap ta ucode is
not available
[ma mrt 21 17:09:32 2022] [drm] kiq ring mec 2 pipe 1 q 0
[ma mrt 21 17:09:33 2022] WARNING: CPU: 5 PID: 25470 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:942
dc_commit_state_no_check+0x404/0x980 [amdgpu]
[ma mrt 21 17:09:33 2022] Modules linked in: snd_seq_dummy snd_hrtimer uinp=
ut
xt_CHECKSUM ipt_MASQUERADE xt_conntrack ipt_REJECT nft_compat nf_nat_tftp
nft_objref nf_conntrack_tftp nft_counter tun bridge stp llc nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_=
ipv6
nft_reject nft_ct nf_tables_set nft_chain_nat nf_nat nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables libcrc32c nfnetlink sunrpc v=
fat
fat intel_rapl_msr wmi_bmof intel_rapl_common edac_mce_amd rtw88_8822be
snd_ctl_led rtw88_8822b snd_hda_codec_conexant kvm_amd rtw88_pci
snd_hda_codec_generic snd_hda_codec_hdmi uvcvideo ccp kvm rtw88_core
videobuf2_vmalloc irqbypass rapl snd_hda_intel joydev mac80211 videobuf2_me=
mops
videobuf2_v4l2 pcspkr videobuf2_common snd_intel_dspcfg videodev
snd_intel_sdw_acpi snd_hda_codec snd_hda_core cfg80211 k10temp snd_hwdep
snd_seq snd_seq_device snd_pcm libarc4 snd_timer rtsx_pci_ms thinkpad_acpi
sp5100_tco ledtrig_audio snd_rn_pci_acp3x memstick snd i2c_piix4
[ma mrt 21 17:09:33 2022]  soundcore rfkill wmi video i2c_scmi acpi_cpufreq
ext4 mbcache jbd2 dm_crypt mmc_block sd_mod sg amdgpu rtsx_pci_sdmmc mmc_co=
re
drm_ttm_helper ttm iommu_v2 gpu_sched i2c_algo_bit drm_kms_helper
crct10dif_pclmul crc32_pclmul syscopyarea sysfillrect crc32c_intel ahci
sysimgblt fb_sys_fops libahci drm ghash_clmulni_intel libata serio_raw nvme
nvme_core r8169 rtsx_pci realtek t10_pi dm_mirror dm_region_hash dm_log dm_=
mod
fuse
[ma mrt 21 17:09:33 2022] CPU: 5 PID: 25470 Comm: kworker/5:3 Kdump: loaded=
 Not
tainted 4.18.0-348.20.1.el8_5.x86_64 #1
[ma mrt 21 17:09:33 2022] Hardware name: LENOVO 20NF0000GE/20NF0000GE, BIOS
R11ET44P (1.24 ) 01/26/2022
[ma mrt 21 17:09:33 2022] Workqueue: events drm_sched_job_timedout [gpu_sch=
ed]
[ma mrt 21 17:09:33 2022] RIP: 0010:dc_commit_state_no_check+0x404/0x980
[amdgpu]
[ma mrt 21 17:09:33 2022] Code: 74 e2 49 3b 56 08 75 dc 48 8b 93 f8 e8 00 0=
0 48
85 d2 74 d0 48 89 de 4c 89 f7 e8 d7 58 9c c6 eb c3 80 b8 80 03 00 00 00 74 =
02
<0f> 0b 48 81 c5 d8 04 00 00 49 39 ed 0f 85 d9 02 00 00 48 8b 93 b8
[ma mrt 21 17:09:33 2022] RSP: 0018:ffffa2e14ae7bc20 EFLAGS: 00010202
[ma mrt 21 17:09:33 2022] RAX: ffff89a339309400 RBX: ffff89a1e4400000 RCX:
0000000000000002
[ma mrt 21 17:09:33 2022] RDX: 0000000000000e60 RSI: 00000000000008f8 RDI:
00000baa349077ea
[ma mrt 21 17:09:33 2022] RBP: ffff89a3441e06c0 R08: ffffa2e14ae7bb74 R09:
0000000000000000
[ma mrt 21 17:09:33 2022] R10: 0000000000000030 R11: 0000000000001000 R12:
0000000000000000
[ma mrt 21 17:09:33 2022] R13: ffff89a3441e1ef8 R14: ffff89a3441e1ef8 R15:
ffff89a3441e0000
[ma mrt 21 17:09:33 2022] FS:  0000000000000000(0000) GS:ffff89a860b40000(0=
000)
knlGS:0000000000000000
[ma mrt 21 17:09:33 2022] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ma mrt 21 17:09:33 2022] CR2: 00007face995a020 CR3: 00000001bdb68000 CR4:
00000000003506e0
[ma mrt 21 17:09:33 2022] Call Trace:
[ma mrt 21 17:09:33 2022]  dc_commit_state+0xa1/0xb0 [amdgpu]
[ma mrt 21 17:09:33 2022]  dm_resume+0x3cd/0x530 [amdgpu]
[ma mrt 21 17:09:33 2022]  ? psm_adjust_power_state_dynamic+0xeb/0x1b0 [amd=
gpu]
[ma mrt 21 17:09:33 2022]  amdgpu_device_ip_resume_phase2+0x63/0xd0 [amdgpu]
[ma mrt 21 17:09:33 2022]  amdgpu_do_asic_reset+0x28b/0x3d0 [amdgpu]
[ma mrt 21 17:09:33 2022]  amdgpu_device_gpu_recover+0x4e8/0xac0 [amdgpu]
[ma mrt 21 17:09:33 2022]  ? __drm_err+0x72/0x90 [drm]
[ma mrt 21 17:09:33 2022]  amdgpu_job_timedout+0x132/0x150 [amdgpu]
[ma mrt 21 17:09:33 2022]  drm_sched_job_timedout+0x84/0xe0 [gpu_sched]
[ma mrt 21 17:09:33 2022]  process_one_work+0x1a7/0x360
[ma mrt 21 17:09:33 2022]  ? create_worker+0x1a0/0x1a0
[ma mrt 21 17:09:33 2022]  worker_thread+0x30/0x390
[ma mrt 21 17:09:33 2022]  ? create_worker+0x1a0/0x1a0
[ma mrt 21 17:09:33 2022]  kthread+0x116/0x130
[ma mrt 21 17:09:33 2022]  ? kthread_flush_work_fn+0x10/0x10
[ma mrt 21 17:09:33 2022]  ret_from_fork+0x22/0x40
[ma mrt 21 17:09:33 2022] ---[ end trace c905cf83c622864c ]---
[ma mrt 21 17:09:33 2022] [drm] VCN decode and encode initialized
successfully(under SPG Mode).
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring gfx uses VM inv eng 0 on
hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring comp_1.0.0 uses VM inv =
eng
1 on hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring comp_1.1.0 uses VM inv =
eng
4 on hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring comp_1.2.0 uses VM inv =
eng
5 on hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring comp_1.3.0 uses VM inv =
eng
6 on hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring comp_1.0.1 uses VM inv =
eng
7 on hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring comp_1.1.1 uses VM inv =
eng
8 on hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring comp_1.2.1 uses VM inv =
eng
9 on hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring comp_1.3.1 uses VM inv =
eng
10 on hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring kiq_2.1.0 uses VM inv e=
ng
11 on hub 0
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring sdma0 uses VM inv eng 0=
 on
hub 1
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring vcn_dec uses VM inv eng=
 1
on hub 1
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring vcn_enc0 uses VM inv en=
g 4
on hub 1
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring vcn_enc1 uses VM inv en=
g 5
on hub 1
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: ring jpeg_dec uses VM inv en=
g 6
on hub 1
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: recover vram bo from shadow
start
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: recover vram bo from shadow =
done
[ma mrt 21 17:09:33 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: GPU reset(1) succeeded!
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x1688011a0 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x1688011e0 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x1688011c0 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168801200 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168801220 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168801260 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168801240 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168801280 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x1688012c0 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x1688012a0 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168801300 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x1688012e0 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168801340 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168801320 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168801360 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x1688013a0 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168801380 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x1688013e0 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x1688013c0 flags=3D0x0070]
[ma mrt 21 17:09:33 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168801420 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring g=
fx
timeout, signaled seq=3D706702, emitted seq=3D706705
[ma mrt 21 17:09:43 2022] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process
information: process Xwayland pid 17823 thread Xwayland:cs0 pid 17916
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: GPU reset begin!
[ma mrt 21 17:09:43 2022] amd_iommu_report_page_fault: 412 callbacks suppre=
ssed
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168840000 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x16881e560 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168840000 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x16881e580 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168840000 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x16881e5a0 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168840000 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x16881e5c0 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x168840000 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: Event logged [IO_PAGE_FAULT
domain=3D0x0000 address=3D0x16881e5e0 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] amd_iommu_report_page_fault: 418 callbacks suppre=
ssed
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168840000 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x16881e600 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168840000 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x16881e620 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168840000 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x16881e6c0 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x16881e640 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x16881e680 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x16881e700 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] AMD-Vi: Event logged [IO_PAGE_FAULT device=3D05:0=
0.0
domain=3D0x0000 address=3D0x168840000 flags=3D0x0070]
[ma mrt 21 17:09:43 2022] [drm] free PSP TMR buffer
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: MODE2 reset
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: GPU reset succeeded, trying =
to
resume
[ma mrt 21 17:09:43 2022] [drm] PCIE GART of 1024M enabled (table at
0x000000F400900000).
[ma mrt 21 17:09:43 2022] [drm] PSP is resuming...
[ma mrt 21 17:09:43 2022] [drm] reserve 0x400000 from 0xf47fc00000 for PSP =
TMR
[ma mrt 21 17:09:43 2022] core: [Hardware Error]: Machine check events logg=
ed
[ma mrt 21 17:09:43 2022] [Hardware Error]: Deferred error, no action requi=
red.
[ma mrt 21 17:09:43 2022] [Hardware Error]: CPU:0 (17:18:1)
MC20_STATUS[-|-|MiscV|AddrV|-|-|SyndV|UECC|Deferred|-|-]: 0x9c2030000001085b
[ma mrt 21 17:09:43 2022] [Hardware Error]: Error Addr: 0x00007ffcffffff00
[ma mrt 21 17:09:43 2022] [Hardware Error]: IPID: 0x0000002e00000000, Syndr=
ome:
0x000000005b240204
[ma mrt 21 17:09:43 2022] [Hardware Error]: Coherent Slave Ext. Error Code:=
 1,
Address Violation.
[ma mrt 21 17:09:43 2022] [Hardware Error]: cache level: L3/GEN, mem/io: IO,
mem-tx: IRD, part-proc: SRC (no timeout)
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: RAS: optional ras ta ucode is
not available
[ma mrt 21 17:09:43 2022] amdgpu 0000:05:00.0: RAP: optional rap ta ucode is
not available
[ma mrt 21 17:09:44 2022] [drm] kiq ring mec 2 pipe 1 q 0
[ma mrt 21 17:09:44 2022] [drm] VCN decode and encode initialized
successfully(under SPG Mode).
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring gfx uses VM inv eng 0 on
hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring comp_1.0.0 uses VM inv =
eng
1 on hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring comp_1.1.0 uses VM inv =
eng
4 on hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring comp_1.2.0 uses VM inv =
eng
5 on hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring comp_1.3.0 uses VM inv =
eng
6 on hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring comp_1.0.1 uses VM inv =
eng
7 on hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring comp_1.1.1 uses VM inv =
eng
8 on hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring comp_1.2.1 uses VM inv =
eng
9 on hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring comp_1.3.1 uses VM inv =
eng
10 on hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring kiq_2.1.0 uses VM inv e=
ng
11 on hub 0
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring sdma0 uses VM inv eng 0=
 on
hub 1
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring vcn_dec uses VM inv eng=
 1
on hub 1
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring vcn_enc0 uses VM inv en=
g 4
on hub 1
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring vcn_enc1 uses VM inv en=
g 5
on hub 1
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: ring jpeg_dec uses VM inv en=
g 6
on hub 1
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: recover vram bo from shadow
start
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: recover vram bo from shadow =
done
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] amdgpu 0000:05:00.0: GPU reset(3) succeeded!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:44 2022] [drm] Skip scheduling IBs!
[ma mrt 21 17:09:48 2022] amdgpu_cs_ioctl: 3771 callbacks suppressed
[ma mrt 21 17:09:48 2022] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
initialize parser -125!
[ma mrt 21 17:09:48 2022] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to
initialize parser -125!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
