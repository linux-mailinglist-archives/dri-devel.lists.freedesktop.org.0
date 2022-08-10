Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC4358F1DE
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 19:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2475A10E152;
	Wed, 10 Aug 2022 17:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192BE12A5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 17:48:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDBA361407
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 17:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFE3FC433C1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660153690;
 bh=7PzTdql+nzAfbMk6Pf5Pp41IJZA/UIcoAsRyICwf2yI=;
 h=From:To:Subject:Date:From;
 b=d0bz2kvspTNuBtOHvF53hXIDUUAtSOYiw8YJ0tyJxekEiHqW6dNs3OgfI86iZkIeQ
 r/InvPIfuSixdg9tooX/Tcn9uakZCyunEqSphAi9xjgQ6hpsO88PfqdXcPCSEkVYgM
 ZEg283FrFbyIQ6FYh/W29nB4fYV4IAjB30B6thFTCe30ogV/XcouUfxM1QP0VCLwRg
 o3ySkYxZFWZCMRTIU47F5Zix4kNXQwejeNQQ/O+jduSVPpu3LMul2ei1n2WjRLSMsn
 zAiq9SvOaej6NUQ/pGMu0ihkIJXFbUSivhGI3XH1ROT1mulpQFWpww74d0DKpuabmB
 xPPCRPf8U3YCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9DBC9C433E7; Wed, 10 Aug 2022 17:48:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216350] New: amdgpu 0000:06:00.0:
 drm_WARN_ON(atomic_read(&vblank->refcount) == 0)
Date: Wed, 10 Aug 2022 17:48:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216350-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216350

            Bug ID: 216350
           Summary: amdgpu 0000:06:00.0:
                    drm_WARN_ON(atomic_read(&vblank->refcount) =3D=3D 0)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19 and older
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: icedragon.aw@web.de
        Regression: No

Every times I put my monitor OFF and after some seconds ON I get the follow=
ing
kernel error message (no other issues observed):

[50119.305713] ------------[ cut here ]------------
[50119.305717] amdgpu 0000:06:00.0: drm_WARN_ON(atomic_read(&vblank->refcou=
nt)
=3D=3D 0)
[50119.305728] WARNING: CPU: 7 PID: 75006 at drm_vblank_put+0x121/0x140
[50119.305736] Modules linked in: ufs snd_usb_audio snd_usbmidi_lib uvcvideo
vhost_net vhost vhost_iotlb vmnet(OE) vmw_vsock_vmci_transport vsock vmw_vm=
ci
vmmon(OE) ipt_REJECT nf_reject_ipv4 bridge stp llc razerkbd(OE) razermouse(=
OE)
xt_hl ip6_tables ip6t_rt xt_LOG nf_log_syslog nft_limit xt_limit xt_addrtype
nft_chain_nat xt_MASQUERADE nf_nat xt_conntrack nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 nft_compat binfmt_misc nls_iso8859_1 hid_generic usbhid hid
si2157 si2168 m88rs6000t a8293 cx25840 snd_hda_codec_hdmi snd_hda_intel
snd_intel_dspcfg cx23885 snd_hda_codec tveeprom snd_hwdep altera_ci cx2341x
snd_hda_core tda18271 snd_pcm snd_seq_midi altera_stapl snd_seq_midi_event
videobuf2_dvb videobuf2_dma_sg snd_rawmidi m88ds3103 i2c_mux intel_rapl_com=
mon
dvb_core iosf_mbi snd_seq videobuf2_vmalloc amd64_edac videobuf2_memops
edac_mce_amd snd_seq_device videobuf2_v4l2 snd_timer videobuf2_common rc_co=
re
snd videodev soundcore mc wmi_bmof sch_fq_codel nct6775 wmi nct6775_core
hwmon_vid lm92
[50119.305806]  lm83 autofs4 raid10 raid1 raid0 multipath linear i2c_piix4
r8169 e1000e realtek xhci_pci xhci_pci_renesas
[50119.305817] CPU: 7 PID: 75006 Comm: Isolated Web Co Tainted: G        W =
 OE=20
   5.19.0-aw #1
[50119.305820] Hardware name: To Be Filled By O.E.M. B550M Pro4/B550M Pro4,
BIOS L2.32 05/17/2022
[50119.305822] RIP: 0010:drm_vblank_put+0x121/0x140
[50119.305826] Code: 8b 7f 08 4c 8b 67 50 4d 85 e4 74 25 e8 78 32 61 00 48 =
c7
c1 20 ee 5e 85 4c 89 e2 48 c7 c7 df 8b 5e 85 48 89 c6 e8 64 53 bc 00 <0f> 0=
b e9
6d ff ff ff 4c 8b 27 eb d6 66 66 2e 0f 1f 84 00 00 00 00
[50119.305828] RSP: 0000:ffff9eccc264fc98 EFLAGS: 00010046
[50119.305831] RAX: 0000000000000000 RBX: ffff9058cb2ad028 RCX:
0000000000000000
[50119.305832] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[50119.305834] RBP: ffff9eccc264fca8 R08: 0000000000000000 R09:
0000000000000000
[50119.305835] R10: 0000000000000000 R11: 0000000000000000 R12:
ffff9058c177d210
[50119.305836] R13: 0000000000000086 R14: ffff9058caac0170 R15:
ffff905993b52e80
[50119.305838] FS:  00007fee4742e480(0000) GS:ffff90679e3c0000(0000)
knlGS:0000000000000000
[50119.305840] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[50119.305842] CR2: 000010fb7e33c000 CR3: 00000003d4474000 CR4:
0000000000350ee0
[50119.305843] Call Trace:
[50119.305845]  <TASK>
[50119.305850]  drm_crtc_vblank_put+0x17/0x40
[50119.305853]  dm_pflip_high_irq+0xeb/0x2c0
[50119.305857]  amdgpu_dm_irq_handler+0xaa/0x280
[50119.305860]  amdgpu_irq_dispatch+0xde/0x2c0
[50119.305864]  amdgpu_ih_process+0xa3/0x140
[50119.305867]  amdgpu_irq_handler+0x24/0x80
[50119.305869]  __handle_irq_event_percpu+0x4f/0x1c0
[50119.305873]  handle_irq_event+0x39/0x80
[50119.305876]  handle_edge_irq+0x8c/0x280
[50119.305879]  __common_interrupt+0x52/0x100
[50119.305883]  common_interrupt+0x3d/0xc0
[50119.305888]  asm_common_interrupt+0x27/0x40
[50119.305890] RIP: 0033:0x2b359729d460
[50119.305893] Code: 40 b1 bb 2e ee 7f 00 00 ff 21 0f 0b 18 00 00 00 00 00 =
00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10 75 42 9f 46 0f 00 00 <33> c=
9 49
bb 40 5f 5e 6c dc 1a 00 00 4c 39 18 0f 85 50 00 00 00 48
[50119.305894] RSP: 002b:00007ffdfe7c3780 EFLAGS: 00000246
[50119.305896] RAX: 000013e886654550 RBX: 0000240dc88f0670 RCX:
00007fee2ebc8260
[50119.305898] RDX: 000013e8866fffff RSI: 0000000000000000 RDI:
00007ffdfe7c3610
[50119.305899] RBP: 00007ffdfe7c3850 R08: 00007fee3ffb5410 R09:
0000000000000000
[50119.305900] R10: 00007ffdfe7c33d0 R11: fff9000000000001 R12:
00000f469f40de40
[50119.305902] R13: 00007ffdfe7c4120 R14: 00007fee32ff2b35 R15:
00007fee3b21d100
[50119.305905]  </TASK>
[50119.305906] ---[ end trace 0000000000000000 ]---

This always reproducible - can also be reproduced on 5.18.x mainline kernel.
Kernel: mainline kernel 5.18.x and 5.19 from kernel.org
CPU: AMD Ryzen 7 PRO 4750G with Radeon Graphics
Monitor: DELL S3422DWG
Linux: Kubuntu 22.04.1 LTS - with latest patches

Not other issues observed - system is still usable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
