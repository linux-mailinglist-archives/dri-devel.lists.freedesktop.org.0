Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E343D3FA411
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 08:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABAE6EA0F;
	Sat, 28 Aug 2021 06:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81AA6EA0F
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 06:54:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C14360FBF
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Aug 2021 06:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630133651;
 bh=7dB+z1qFvU9fszWxKYl8NiCvh7Xh+ZmVzXjNYn8CLXc=;
 h=From:To:Subject:Date:From;
 b=jy1flxyR7BEzHNxMan6DLLWJz1LauFdYN4bObvCvydHkGcxCXt3vreswOVBwf2a/J
 FANIS6ouXGAR+HHf5DBvSKLMwqsu/EIaFnchEw0VcPn/6tGB/DeZoc9m8SBocMrznN
 gh7Bs/aVgecmn7Sx++3iGQK8dL5QjpA/1Q9GrZE6QOymUpNrd0Qkhz2dImJqj4hDFl
 8TDpo8tJYG2tvxu+dwVI5iEp9XlHerUzYzXmcJEPSRwi6oPUrs8V6iSEZ/PTzGMW/Z
 4YiHeByHM8AdGtK6ZlgjiMTayD4/Yddj6oWm8PENGb7N5wQw/YfERnlq9IsuUxbZtQ
 PS2rAje9Maoyg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 40ECB60EE4; Sat, 28 Aug 2021 06:54:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214209] New: WARNING: CPU: 5 PID: 0 at
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c:284
Date: Sat, 28 Aug 2021 06:54:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ne-vlezay80@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214209-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214209

            Bug ID: 214209
           Summary: WARNING: CPU: 5 PID: 0 at
                    drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c:284
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.8-arch1-1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: ne-vlezay80@yandex.ru
        Regression: No

2344.383186] WARNING: CPU: 5 PID: 0 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c:284
gk104_fifo_engine_id+0x33/0x50 [nouveau]
[ 2344.383293] Modules linked in: cfg80211 rfkill ccm algif_aead cbc
des_generic libdes ecb algif_skcipher cmac md4 algif_hash af_alg edac_mce_a=
md
kvm_amd ccp rng_core snd_hda_codec_realtek snd_hda_codec_generic pktcdvd kvm
ledtrig_audio snd_hda_codec_hdmi snd_hda_intel irqbypass snd_intel_dspcfg
snd_intel_sdw_acpi ppdev snd_hda_codec crct10dif_pclmul ghash_clmulni_intel
pcspkr wmi_bmof fam15h_power snd_hda_core k10temp snd_hwdep snd_pcm joydev
snd_timer mousedev parport_pc snd asus_atk0110 parport soundcore sp5100_tco
i2c_piix4 mac_hid acpi_cpufreq pkcs8_key_parser speakup_soft speakup fuse
bpf_preload ip_tables x_tables overlay squashfs loop nfsv3 nfs_acl nfs lockd
grace sunrpc nfs_ssc fscache ata_generic pata_acpi nouveau mxm_wmi video
i2c_algo_bit drm_ttm_helper ttm drm_kms_helper crc32_pclmul crc32c_intel
syscopyarea sysfillrect sysimgblt fb_sys_fops cec aesni_intel r8169 realtek=
 drm
mdio_devres crypto_simd sr_mod xhci_pci cryptd pata_atiixp e1000e usbhid li=
bphy
cdrom xhci_pci_renesas
[ 2344.383369]  agpgart wmi
[ 2344.383373] CPU: 5 PID: 0 Comm: swapper/5 Not tainted 5.12.8-arch1-1 #1
[ 2344.383375] Hardware name: System manufacturer System Product Name/M5A78=
L-M
PLUS/USB3, BIOS 0502    11/18/2016
[ 2344.383377] RIP: 0010:gk104_fifo_engine_id+0x33/0x50 [nouveau]
[ 2344.383463] Code: 74 30 8b 97 98 04 00 00 48 85 f6 74 1d 85 d2 7e 19 48 =
81
c7 98 03 00 00 31 c0 48 39 37 74 18 83 c0 01 48 83 c7 10 39 d0 7c f0 <0f> 0=
b b8
ff ff ff ff c3 b8 0f 00 00 00 c3 66 66 2e 0f 1f 84 00 00
[ 2344.383465] RSP: 0018:ffffb91cc021cd80 EFLAGS: 00010046
[ 2344.383468] RAX: 0000000000000007 RBX: ffff8e2ed6ffb030 RCX:
0000000000000007
[ 2344.383470] RDX: 0000000000000007 RSI: ffff8e2ed6ffb010 RDI:
ffff8e2ed6ffb410
[ 2344.383472] RBP: 0000000000000007 R08: 0000000000000000 R09:
0000000000000007
[ 2344.383473] R10: ffffb91cc021c9b0 R11: ffffffffa20cc468 R12:
0000000000000046
[ 2344.383475] R13: ffff8e2ed6ffb010 R14: ffff8e2ed6ffb008 R15:
ffff8e2ed6ffb2b8
[ 2344.383476] FS:  0000000000000000(0000) GS:ffff8e33c7d40000(0000)
knlGS:0000000000000000
[ 2344.383478] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2344.383480] CR2: 00007fd842690ff0 CR3: 0000000103834000 CR4:
00000000000406e0
[ 2344.383482] Call Trace:
[ 2344.383485]  <IRQ>
[ 2344.383487]  gk104_fifo_fault+0x10a/0x230 [nouveau]
[ 2344.383576]  gf100_fifo_intr_fault+0x109/0x130 [nouveau]
[ 2344.383662]  gk104_fifo_intr+0x2aa/0x500 [nouveau]
[ 2344.383751]  nvkm_mc_intr+0x129/0x170 [nouveau]
[ 2344.383826]  nvkm_pci_intr+0x4d/0x90 [nouveau]
[ 2344.383905]  __handle_irq_event_percpu+0x40/0x190
[ 2344.383911]  handle_irq_event+0x58/0xb0
[ 2344.383914]  handle_edge_irq+0x96/0x260
[ 2344.383917]  __common_interrupt+0x41/0xa0
[ 2344.383921]  common_interrupt+0x7e/0xa0
[ 2344.383925]  </IRQ>
[ 2344.383926]  asm_common_interrupt+0x1e/0x40
[ 2344.383929] RIP: 0010:cpuidle_enter_state+0xc7/0x380
[ 2344.383934] Code: 8b 3d 75 e0 20 5f e8 c8 b8 8c ff 49 89 c5 0f 1f 44 00 =
00
31 ff e8 e9 c5 8c ff 45 84 ff 0f 85 da 01 00 00 fb 66 0f 1f 44 00 00 <45> 8=
5 f6
0f 88 11 01 00 00 49 63 d6 4c 2b 2c 24 48 8d 04 52 48 8d
[ 2344.383936] RSP: 0018:ffffb91cc00d7ea8 EFLAGS: 00000246
[ 2344.383938] RAX: ffff8e33c7d6c7c0 RBX: 0000000000000001 RCX:
000000000000001f
[ 2344.383940] RDX: 0000000000000000 RSI: 000000001f41d11b RDI:
0000000000000000
[ 2344.383942] RBP: ffff8e2ec22c8800 R08: 00000221d81f1a05 R09:
0000000000000018
[ 2344.383943] R10: 0000000000000058 R11: 00000000000000a8 R12:
ffffffffa2149f00
[ 2344.383945] R13: 00000221d81f1a05 R14: 0000000000000001 R15:
0000000000000000
[ 2344.383948]  ? cpuidle_enter_state+0xb7/0x380
[ 2344.383952]  cpuidle_enter+0x29/0x40
[ 2344.383955]  do_idle+0x1da/0x270
[ 2344.383958]  cpu_startup_entry+0x19/0x20
[ 2344.383961]  secondary_startup_64_no_verify+0xc2/0xcb
[ 2344.383966] ---[ end trace 27bba26894ac92fb ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
