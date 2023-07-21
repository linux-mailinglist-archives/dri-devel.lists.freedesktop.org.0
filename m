Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E73475C6D8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 14:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3166010E66D;
	Fri, 21 Jul 2023 12:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D124B10E66D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:23:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B610161961
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF68DC433C8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689942235;
 bh=/IhAL/K3TmmYqxoHb/2pr3/FkUXxXCmHICRXdHJ/9Zo=;
 h=From:To:Subject:Date:From;
 b=bYcyHEpPRHbhiD8Z3ZAHKcahlZt1Oma419IWmPnwQdwdBU09yu6TguUG1auC4ilW8
 NA3A60u+HW9aRPqOKDozB4szxkCTyqcr4at84iDhFPAkJi1iZAt5+OFqA8zVXKnjQ8
 JwlCIIioxJkmLgMmzdav3UVoZiamgzU5efqnFqSbZ1IVJsIDCLxuwt8liDWbXdff9I
 SD2KrwCKkmxwlEYAxE0UTzU6IPPVyFwxfZb3HsfVcNNjHbOvpdAwYGjHQKJyZ7DEe4
 zU9AuhYRy40H5BhKkNy4je4Y7+l7dv7n+oeZ7KOOQOQBKYWsY1iYpDiXWA0jJddKcP
 d356vdbzHxE2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C79BDC53BC6; Fri, 21 Jul 2023 12:23:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217692] New: amdgpu crashes on resume from standby -
 amdgpu-reset-dev drm_sched_job_timedout
Date: Fri, 21 Jul 2023 12:23:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: turecki@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217692-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217692

            Bug ID: 217692
           Summary: amdgpu crashes on resume from standby -
                    amdgpu-reset-dev drm_sched_job_timedout
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: turecki@gmail.com
        Regression: No

Created attachment 304679
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304679&action=3Dedit
Single log with dmesg joined with suspend + resume log until crash

Kernel version: 6.4.3-2-MANJARO #1 SMP PREEMPT_DYNAMIC Sun Jul 16 16:55:12 =
UTC
2023 x86_64 GNU/Linux

Suspend took longer than usual and after resume by pressing a key on keyboa=
rd,
screen did not turn on.

A hopefully relevant part of trace (attached complete):

Jul 20 21:44:50 too-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* r=
ing
sdma0 timeout, signaled seq=3D1605372, emitted seq=3D1605374
Jul 20 21:44:50 too-pc kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process  pid 0 thread  pid 0
Jul 20 21:44:50 too-pc kernel: amdgpu 0000:2f:00.0: amdgpu: GPU reset begin!
Jul 20 21:44:51 too-pc systemd[1]: NetworkManager-dispatcher.service:
Deactivated successfully.
Jul 20 21:44:54 too-pc kernel: amdgpu 0000:2f:00.0: amdgpu: SMU: I'm not do=
ne
with your previous command: SMN_C2PMSG_66:0x0000003A SMN_C2PMSG_82:0x000000=
00
Jul 20 21:44:54 too-pc kernel: amdgpu 0000:2f:00.0: amdgpu: Failed to retri=
eve
enabled ppfeatures!
Jul 20 21:44:58 too-pc kernel: amdgpu 0000:2f:00.0: amdgpu: SMU: I'm not do=
ne
with your previous command: SMN_C2PMSG_66:0x0000003A SMN_C2PMSG_82:0x000000=
00
Jul 20 21:44:58 too-pc kernel: amdgpu 0000:2f:00.0: amdgpu: Failed to retri=
eve
enabled ppfeatures!
Jul 20 21:45:02 too-pc kernel: amdgpu 0000:2f:00.0: amdgpu: failed to suspe=
nd
display audio
Jul 20 21:45:02 too-pc kernel: amdgpu 0000:2f:00.0: amdgpu: Failed to disal=
low
df cstate
Jul 20 21:45:02 too-pc kernel: ------------[ cut here ]------------
Jul 20 21:45:02 too-pc kernel: WARNING: CPU: 24 PID: 574073 at
drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:599 amdgpu_irq_put+0x46/0x70 [amdgp=
u]
Jul 20 21:45:02 too-pc kernel: Modules linked in: tls vhost_net vhost
vhost_iotlb tap tun dm_crypt cbc encrypted_keys trusted asn1_encoder tee
xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnetlink iptable_nat nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c x
t_addrtype iptable_filter br_netfilter snd_seq_dummy snd_hrtimer snd_seq br=
idge
stp llc rfkill qrtr overlay uvcvideo videobuf2_vmalloc uvc videobuf2_memops
snd_usb_audio videobuf2_v4l2 snd_usbmidi_lib videodev uas snd_rawmidi
videobuf2_common snd_seq_device mousedev mc joyd
ev vfat fat intel_rapl_msr intel_rapl_common edac_mce_amd kvm_amd
snd_hda_codec_realtek ccp snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel kvm snd_intel_dspcfg snd_intel_sdw_acpi
snd_hda_codec crct10dif_pclmul crc32_pclmul polyval_clmulni snd_hda_core
polyval_generic gf128mul snd_hwdep r8169 ghash_clmulni_intel snd_pcm
sha512_ssse3 aesni_intel snd_timer crypto_simd wmi_bmof sp5100_tco realtek
cryptd snd rapl mdio_devres pcspkr soundcore k10temp i2c_piix4 libphy
ryzen_smu(OE)
Jul 20 21:45:02 too-pc kernel:  mac_hid uinput i2c_dev dm_multipath fuse
crypto_user dm_mod loop bpf_preload ip_tables x_tables ext4 crc32c_generic
crc16 mbcache jbd2 usb_storage usbhid crc32c_intel nvme xhci_pci nvme_core
xhci_pci_renesas nvme_common vfio_pci vfio_pci_core
 irqbypass vfio_iommu_type1 vfio iommufd amdgpu i2c_algo_bit drm_ttm_helper=
 ttm
video wmi drm_suballoc_helper drm_buddy gpu_sched drm_display_helper cec
Jul 20 21:45:02 too-pc kernel: CPU: 24 PID: 574073 Comm: kworker/u64:25
Tainted: G        W  OE      6.4.3-2-MANJARO #1
00e85e278f33e769813ea7ae6ba8e625d37e2fac
Jul 20 21:45:02 too-pc kernel: Hardware name: Micro-Star International Co.,
Ltd. MS-7C37/MPG X570 GAMING PLUS (MS-7C37), BIOS A.I0 08/10/2022
Jul 20 21:45:02 too-pc kernel: Workqueue: amdgpu-reset-dev
drm_sched_job_timedout [gpu_sched]
Jul 20 21:45:02 too-pc kernel: RIP: 0010:amdgpu_irq_put+0x46/0x70 [amdgpu]
Jul 20 21:45:02 too-pc kernel: Code: c0 74 33 48 8b 4e 10 48 83 39 00 74 29=
 89
d1 48 8d 04 88 8b 08 85 c9 74 11 f0 ff 08 74 07 31 c0 e9 8f c5 ae f0 e9 5a =
fd
ff ff <0f> 0b b8 ea ff ff ff e9 7e c5 ae f0 b8 ea ff ff ff e9 74 c5 ae f0
Jul 20 21:45:02 too-pc kernel: RSP: 0018:ffffa87787687c98 EFLAGS: 00010246
Jul 20 21:45:02 too-pc kernel: RAX: ffff9c5f5233c980 RBX: ffff9c5f546c0000 =
RCX:
0000000000000000
Jul 20 21:45:02 too-pc kernel: RDX: 0000000000000000 RSI: ffff9c5f546d9250 =
RDI:
ffff9c5f546c0000
Jul 20 21:45:02 too-pc kernel: RBP: ffff9c5f546c0000 R08: 000000000003ac80 =
R09:
0000000000000006
Jul 20 21:45:02 too-pc kernel: R10: 0000000000000100 R11: 0000000000000000 =
R12:
0000000000001050
Jul 20 21:45:02 too-pc kernel: R13: ffff9c5f546e5d70 R14: ffff9c666fb86000 =
R15:
0000000000000000
Jul 20 21:45:02 too-pc kernel: FS:  0000000000000000(0000)
GS:ffff9c6a3f000000(0000) knlGS:0000000000000000
Jul 20 21:45:02 too-pc kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jul 20 21:45:02 too-pc kernel: CR2: 00007f26044c5038 CR3: 000000036936a000 =
CR4:
0000000000350ee0
Jul 20 21:45:02 too-pc kernel: Call Trace:
Jul 20 21:45:02 too-pc kernel:  <TASK>
Jul 20 21:45:02 too-pc kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu
e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  ? __warn+0x81/0x130
Jul 20 21:45:02 too-pc kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu
e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  ? report_bug+0x171/0x1a0
Jul 20 21:45:02 too-pc kernel:  ? handle_bug+0x3c/0x80
Jul 20 21:45:02 too-pc kernel:  ? exc_invalid_op+0x17/0x70
Jul 20 21:45:02 too-pc kernel:  ? asm_exc_invalid_op+0x1a/0x20
Jul 20 21:45:02 too-pc kernel:  ? amdgpu_irq_put+0x46/0x70 [amdgpu
e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  gfx_v10_0_hw_fini+0x1e/0x160 [amdgpu
e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  amdgpu_device_ip_suspend_phase2+0x107/0x1a0
[amdgpu e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  ? amdgpu_device_ip_suspend_phase1+0x71/0xe0
[amdgpu e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  amdgpu_device_ip_suspend+0x36/0x70 [amdgpu
e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  amdgpu_device_pre_asic_reset+0xd3/0x2b0 [am=
dgpu
e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  amdgpu_device_gpu_recover+0x4c9/0xd80 [amdg=
pu
e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  amdgpu_job_timedout+0x18d/0x240 [amdgpu
e53a5ce3236982c3abd9d891fdaf5541b1a96ab9]
Jul 20 21:45:02 too-pc kernel:  drm_sched_job_timedout+0x7a/0x110 [gpu_sched
e56a49900f4cfad6f449f14abf3e996a15ceae97]
Jul 20 21:45:02 too-pc kernel:  process_one_work+0x1c7/0x3d0
Jul 20 21:45:02 too-pc kernel:  worker_thread+0x51/0x390
Jul 20 21:45:02 too-pc kernel:  ? __pfx_worker_thread+0x10/0x10
Jul 20 21:45:02 too-pc kernel:  kthread+0xe8/0x120
Jul 20 21:45:02 too-pc kernel:  ? __pfx_kthread+0x10/0x10
Jul 20 21:45:02 too-pc kernel:  ret_from_fork+0x2c/0x50
Jul 20 21:45:02 too-pc kernel:  </TASK>
Jul 20 21:45:02 too-pc kernel: ---[ end trace 0000000000000000 ]---
Jul 20 21:45:02 too-pc kernel: ------------[ cut here ]------------

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
