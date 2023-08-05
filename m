Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C000D771264
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 23:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD2A10E05F;
	Sat,  5 Aug 2023 21:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0B610E05F
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 21:33:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A170760F4B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 21:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE75FC433C9
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691271224;
 bh=zDwpsB356sYOqsgBrSfXfCG6t72OFxtq3LXMBM7Ovsc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FbG7rVL+B2Qh4GqnJPJW2xHeHfEQxf99S/IgpuKlxZOlOcTIwK5Ir/dX/7cIVwW2r
 99OjBVdyZ1s4Jo4qEKyQzbM9w9uAcknpz7z6QNYdig3z7Ne+5lU7md21dsEs9DxfIZ
 34EA/STy9t1OpOkqCLv2R2Te/OT3Ghjdm+9TMlcZPOvhE0XR1rIQ+6NQ/DyMl+d3eh
 HvcXI2E1idd7XC1eIOx2moVeBkgWmP7+cvplg/3dDZvck1y3wBthue7fZW7cxXENuD
 CZl1wE1Gk6SKDoylrpRI5nL9L7+AmWBmqR2diWZu3MlXFzoI45sGCsqsQlLH7dB727
 HEFYwPrGuF9SQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9CFE5C53BD1; Sat,  5 Aug 2023 21:33:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Sat, 05 Aug 2023 21:33:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hcoin@quietfountain.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213983-2300-7uYNljbcTO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213983-2300@https.bugzilla.kernel.org/>
References: <bug-213983-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

Harry Coin (hcoin@quietfountain.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hcoin@quietfountain.com

--- Comment #7 from Harry Coin (hcoin@quietfountain.com) ---
Remains in 6.5-rc4

Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]:  #011Size:
QSize(5760, 2160)
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]:  #011SizeMM:
QSize(1520, 570)
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xrandr:
XRandR::setConfig done!
Aug  5 16:22:27 ceo1homenx kernel: [   42.812119] ------------[ cut here
]------------
Aug  5 16:22:27 ceo1homenx kernel: [   42.812124] WARNING: CPU: 3 PID: 2083=
 at
drivers/gpu/drm/ttm/ttm_bo.c:326 ttm_bo_release+0x299/0x2c0 [ttm]
Aug  5 16:22:27 ceo1homenx kernel: [   42.812140] Modules linked in: ceph
fscache netfs rbd libceph xt_conntrack nft_chain_nat xt_MASQUERADE nf_nat
nf_conntrack_netlink nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xfrm_user
xfrm_algo xt_addrtype nft_compat nf_tables nfnetlink br_netfilter bridge stp
llc overlay binfmt_misc intel_rapl_msr snd_usb_audio intel_rapl_common
snd_hda_codec_realtek snd_usbmidi_lib edac_mce_amd snd_hda_codec_generic
snd_ump snd_hda_codec_hdmi uvcvideo snd_seq_midi kvm_amd snd_hda_intel
videobuf2_vmalloc snd_seq_midi_event snd_intel_dspcfg snd_intel_sdw_acpi uvc
videobuf2_memops nls_iso8859_1 k10temp snd_rawmidi snd_hda_codec kvm eeepc_=
wmi
snd_hda_core asus_wmi irqbypass ledtrig_audio snd_hwdep videobuf2_v4l2
sparse_keymap snd_seq rapl platform_profile snd_pcm wmi_bmof ccp snd_seq_de=
vice
snd_timer videodev snd videobuf2_common input_leds joydev soundcore mc mac_=
hid
sch_fq_codel msr parport_pc auth_rpcgss ppdev lp pstore_blk ramoops parport
reed_solomon pstore_zone efi_pstore sunrpc ip_tables x_tables autofs4 btrfs
blake2b_generic
Aug  5 16:22:27 ceo1homenx kernel: [   42.812203]  raid1 dm_raid raid456
async_raid6_recov async_memcpy async_pq async_xor async_tx xor hid_generic
usbhid raid6_pq libcrc32c hid amdgpu amdxcp iommu_v2 drm_buddy gpu_sched vi=
deo
i2c_algo_bit drm_suballoc_helper drm_ttm_helper ttm drm_display_helper uas
crct10dif_pclmul crc32_pclmul polyval_clmulni cec polyval_generic usb_stora=
ge
ghash_clmulni_intel rc_core sha512_ssse3 aesni_intel drm_kms_helper crypto_=
simd
cryptd nvme drm nvme_core i2c_piix4 r8169 ahci xhci_pci realtek
xhci_pci_renesas libahci nvme_common wmi gpio_amdpt
Aug  5 16:22:27 ceo1homenx kernel: [   42.812231] CPU: 3 PID: 2083 Comm: Xo=
rg
Not tainted 6.5.0-060500rc4-generic #202308041735
Aug  5 16:22:27 ceo1homenx kernel: [   42.812233] Hardware name: System
manufacturer System Product Name/PRIME B450-PLUS, BIOS 4003 03/13/2023
Aug  5 16:22:27 ceo1homenx kernel: [   42.812234] RIP:
0010:ttm_bo_release+0x299/0x2c0 [ttm]
Aug  5 16:22:27 ceo1homenx kernel: [   42.812242] Code: 48 8b 7b 90 e8 f8 9=
b a4
c4 e9 e1 fd ff ff c7 43 2c 00 00 00 00 48 8b 7b 08 e8 a3 53 00 00 e9 5d ff =
ff
ff 0f 0b e9 b0 fd ff ff <0f> 0b e9 9e fd ff ff be 03 00 00 00 e8 56 36 12 c=
4 e9
21 ff ff ff
Aug  5 16:22:27 ceo1homenx kernel: [   42.812244] RSP: 0018:ffffaf2b826c3d00
EFLAGS: 00010206
Aug  5 16:22:27 ceo1homenx kernel: [   42.812246] RAX: 0000000000000000 RBX:
ffff895280bd4dc0 RCX: 0000000000000000
Aug  5 16:22:27 ceo1homenx kernel: [   42.812247] RDX: 0000000000000006 RSI:
0000000000000000 RDI: ffff895280bd4dc0
Aug  5 16:22:27 ceo1homenx kernel: [   42.812248] RBP: ffffaf2b826c3d60 R08:
0000000000000000 R09: 0000000000000000
Aug  5 16:22:27 ceo1homenx kernel: [   42.812249] R10: 0000000000000000 R11:
0000000000000000 R12: 0000000000000000
Aug  5 16:22:27 ceo1homenx kernel: [   42.812250] R13: ffff8952a758eed0 R14:
ffff895280bd4c58 R15: ffff895291a6f300
Aug  5 16:22:27 ceo1homenx kernel: [   42.812251] FS:  00007f03dcc28a80(000=
0)
GS:ffff89599eac0000(0000) knlGS:0000000000000000
Aug  5 16:22:27 ceo1homenx kernel: [   42.812252] CS:  0010 DS: 0000 ES: 00=
00
CR0: 0000000080050033
Aug  5 16:22:27 ceo1homenx kernel: [   42.812253] CR2: 00007f03d01a113a CR3:
00000001095a4000 CR4: 0000000000350ee0
Aug  5 16:22:27 ceo1homenx kernel: [   42.812254] Call Trace:
Aug  5 16:22:27 ceo1homenx kernel: [   42.812256]  <TASK>
Aug  5 16:22:27 ceo1homenx kernel: [   42.812258]  ? show_regs+0x6d/0x80
Aug  5 16:22:27 ceo1homenx kernel: [   42.812263]  ? __warn+0x89/0x160
Aug  5 16:22:27 ceo1homenx kernel: [   42.812266]  ? ttm_bo_release+0x299/0=
x2c0
[ttm]
Aug  5 16:22:27 ceo1homenx kernel: [   42.812274]  ? report_bug+0x17e/0x1b0
Aug  5 16:22:27 ceo1homenx kernel: [   42.812278]  ? handle_bug+0x51/0xa0
Aug  5 16:22:27 ceo1homenx kernel: [   42.812280]  ? exc_invalid_op+0x18/0x=
80
Aug  5 16:22:27 ceo1homenx kernel: [   42.812282]  ?
asm_exc_invalid_op+0x1b/0x20
Aug  5 16:22:27 ceo1homenx kernel: [   42.812285]  ? ttm_bo_release+0x299/0=
x2c0
[ttm]
Aug  5 16:22:27 ceo1homenx kernel: [   42.812292]  ?
__call_rcu_common.constprop.0+0xa0/0x2b0
Aug  5 16:22:27 ceo1homenx kernel: [   42.812296]  ttm_bo_put+0x3c/0x70 [tt=
m]
Aug  5 16:22:27 ceo1homenx kernel: [   42.812303]  amdgpu_bo_unref+0x1e/0x40
[amdgpu]
Aug  5 16:22:27 ceo1homenx kernel: [   42.812593]=20
amdgpu_gem_object_free+0x34/0x60 [amdgpu]
Aug  5 16:22:27 ceo1homenx kernel: [   42.812906]=20
drm_gem_object_free+0x1d/0x40 [drm]
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
RRScreenChangeNotify
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Timestamp:  20814
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Config_timestamp:  20814
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Window: 62914565
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Root: 1731
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Rotation:  "Rotate_0"
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Size ID: 65535
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Size:  11520 2160
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011SizeMM:  3040 570
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
RRNotify_CrtcChange
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Timestamp:  20814
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011CRTC:  78
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Mode:  91
Aug  5 16:22:27 ceo1homenx kernel: [   42.812946]=20
drm_gem_dmabuf_release+0x46/0x70 [drm]
Aug  5 16:22:27 ceo1homenx kernel: [   42.812982]  dma_buf_release+0x3e/0xa0
Aug  5 16:22:27 ceo1homenx kernel: [   42.812986]  __dentry_kill+0x100/0x190
Aug  5 16:22:27 ceo1homenx kernel: [   42.812989]  dput+0x19d/0x320
Aug  5 16:22:27 ceo1homenx kernel: [   42.812992]  __fput+0x153/0x2c0
Aug  5 16:22:27 ceo1homenx kernel: [   42.812995]  ____fput+0xe/0x20
Aug  5 16:22:27 ceo1homenx kernel: [   42.812997]  task_work_run+0x61/0xa0
Aug  5 16:22:27 ceo1homenx kernel: [   42.813001]=20
exit_to_user_mode_loop+0x100/0x130
Aug  5 16:22:27 ceo1homenx kernel: [   42.813004]=20
exit_to_user_mode_prepare+0xa5/0xb0
Aug  5 16:22:27 ceo1homenx kernel: [   42.813006]=20
syscall_exit_to_user_mode+0x29/0x50
Aug  5 16:22:27 ceo1homenx kernel: [   42.813008]  do_syscall_64+0x68/0x90
Aug  5 16:22:27 ceo1homenx kernel: [   42.813011]  ? irqentry_exit+0x43/0x50
Aug  5 16:22:27 ceo1homenx kernel: [   42.813013]  ?
sysvec_reschedule_ipi+0x7a/0x120
Aug  5 16:22:27 ceo1homenx kernel: [   42.813015]=20
entry_SYSCALL_64_after_hwframe+0x6e/0xd8
Aug  5 16:22:27 ceo1homenx kernel: [   42.813018] RIP: 0033:0x7f03dcb1aaff
Aug  5 16:22:27 ceo1homenx kernel: [   42.813042] Code: 00 48 89 44 24 18 3=
1 c0
48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 =
24
10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 4=
8 2b
04 25 28 00
Aug  5 16:22:27 ceo1homenx kernel: [   42.813044] RSP: 002b:00007fff1c798770
EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Aug  5 16:22:27 ceo1homenx kernel: [   42.813045] RAX: 0000000000000000 RBX:
00007fff1c798800 RCX: 00007f03dcb1aaff
Aug  5 16:22:27 ceo1homenx kernel: [   42.813046] RDX: 00007fff1c798800 RSI:
0000000040086409 RDI: 0000000000000012
Aug  5 16:22:27 ceo1homenx kernel: [   42.813047] RBP: 0000000040086409 R08:
0000563c28c49210 R09: 0000000000000000
Aug  5 16:22:27 ceo1homenx kernel: [   42.813048] R10: 0000000000000000 R11:
0000000000000246 R12: 0000563c27b93f08
Aug  5 16:22:27 ceo1homenx kernel: [   42.813049] R13: 0000000000000012 R14:
0000563c27c19c2c R15: 00007fff1c798840
Aug  5 16:22:27 ceo1homenx kernel: [   42.813051]  </TASK>
Aug  5 16:22:27 ceo1homenx kernel: [   42.813052] ---[ end trace
0000000000000000 ]---
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Rotation:  "Rotate_0"
Aug  5 16:22:27 ceo1homenx kscreen_backend_launcher[2843]: kscreen.xcb.help=
er:
#011Geometry:  1919 0 1920 1080
Aug  5 16

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
