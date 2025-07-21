Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D9CB0C741
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 17:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2905110E233;
	Mon, 21 Jul 2025 15:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="fgHum9fp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC1E10E233;
 Mon, 21 Jul 2025 15:06:48 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B550040E01F6; 
 Mon, 21 Jul 2025 15:06:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id G11CKHNiU46i; Mon, 21 Jul 2025 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1753110403; bh=/9BIwm4tmwmUlQhEoiG7gsCrL73VaY1puitrNcsikes=;
 h=Date:From:To:Cc:Subject:From;
 b=fgHum9fpzSa/lk8pyL9hhd20lezDySkhUZ4GPUZJJqORIzz/xzP5vK2uQZVISRsTF
 LW6oT26JKTUk/LH9vxoiXFwF45uEiw/biOii4wxLrlSmIhP9K7ZvfqtH8eahb6i8Dc
 9wOgcDafY8nbW+MHrNnrGC8cR4MHChYjB6uLAFUkG6ikK/IKG61ILiJl8gMEYLoLl+
 G+r/e3gmBiJNRKlrkvbtrtUje7sgg+AAzjhGUZpZuovp1iAAm9igeLAZkEfe3ZQwuv
 QTKVCn7XxcgwqWb4VhBTSY4wyhtF5AqhibtKF0ZJP8p/mTJwHFnFv73Sk9O0CnPUr2
 zpf8sQuoaIvwICzh91F8iPsEjGX7RJ29jwROIl7YthQnQz68rbYJweM05aqMm7tkhC
 4YsssbwqG9EbkTZuOD2cv0sI9pS1uDfNK4fgbzXC3fCN2HrDmdaZKvRCMYbrhc4XLJ
 UeslSafDVNLB2jtE1MZB4f6PMd+wRM7asVK5VonpadyrDNdN7bzA1lUKspA9+ZHbx2
 PTvy2eofJX8G8/jeuS56HrsRRd0EcRKwA0jD9SMqTFSPVihiPi/uZjBkTJvJp0odQY
 AmJHz+uuOV1GLfCepj0o8o9hYtTNjTgHBpJOuwn8OC5OZG8Bu42j80Pb+1sHPmJnGy
 59EWg17bQKJbYCAQYdAS1ekg=
Received: from rn.tnic (unknown [78.130.214.207])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 76AE240E0212; Mon, 21 Jul 2025 15:06:34 +0000 (UTC)
Date: Mon, 21 Jul 2025 17:08:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: amdgpu, 16.6-rc7+, WARNING: ./include/linux/sched.h:2175 at
 __ww_mutex_lock.constprop.0+0xec3/0x1ab0, CPU#5: kworker/5:1/122
Message-ID: <20250721150832.GAaH5X8BkPfhXKpjRq@renoirsky.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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

Hi,

I see this on latest Linus + tip/master from today. Something about
clearing blocked tasks' relationships with the same mutex held...

[    5.222437] [drm] amdgpu kernel modesetting enabled.
[    5.227168] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:08.=
1/0000:03:00.6/sound/card1/input14
[    5.228163] amdgpu: Virtual CRAT table created for CPU
[    5.229327] amdgpu: Topology: Add CPU node
[    5.229454] input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:0=
8.1/0000:03:00.6/sound/card1/input15
[    5.231815] input: HD-Audio Generic Headphone as /devices/pci0000:00/000=
0:00:08.1/0000:03:00.6/sound/card1/input16
[    5.232136] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 =
0x103C:0x8830 0xC3).
[    5.234072] [drm] register mmio base: 0xFC300000
[    5.234923] [drm] register mmio size: 524288
[    5.239532] FAT-fs (nvme0n1p1): Volume was not properly unmounted. Some =
data may be corrupt. Please run fsck.
[    5.243553] amdgpu 0000:03:00.0: amdgpu: detected ip block number 0 <soc=
15_common>
[    5.243561] amdgpu 0000:03:00.0: amdgpu: detected ip block number 1 <gmc=
_v9_0>
[    5.243563] amdgpu 0000:03:00.0: amdgpu: detected ip block number 2 <veg=
a10_ih>
[    5.243565] amdgpu 0000:03:00.0: amdgpu: detected ip block number 3 <psp>
[    5.243566] amdgpu 0000:03:00.0: amdgpu: detected ip block number 4 <smu>
[    5.243568] amdgpu 0000:03:00.0: amdgpu: detected ip block number 5 <dm>
[    5.243570] amdgpu 0000:03:00.0: amdgpu: detected ip block number 6 <gfx=
_v9_0>
[    5.243572] amdgpu 0000:03:00.0: amdgpu: detected ip block number 7 <sdm=
a_v4_0>
[    5.243574] amdgpu 0000:03:00.0: amdgpu: detected ip block number 8 <vcn=
_v2_0>
[    5.243575] amdgpu 0000:03:00.0: amdgpu: detected ip block number 9 <jpe=
g_v2_0>
[    5.243621] amdgpu 0000:03:00.0: amdgpu: Fetched VBIOS from VFCT
[    5.243625] amdgpu: ATOM BIOS: SWBRT58350.001
[    5.255919] Console: switching to colour dummy device 80x25
[    5.256327] amdgpu 0000:03:00.0: vgaarb: deactivate vga console
[    5.256341] amdgpu 0000:03:00.0: amdgpu: Trusted Memory Zone (TMZ) featu=
re enabled
[    5.256355] amdgpu 0000:03:00.0: amdgpu: MODE2 reset
[    5.256721] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, f=
ragment size is 9-bit
[    5.256743] amdgpu 0000:03:00.0: amdgpu: VRAM: 512M 0x000000F400000000 -=
 0x000000F41FFFFFFF (512M used)
[    5.256756] amdgpu 0000:03:00.0: amdgpu: GART: 1024M 0x0000000000000000 =
- 0x000000003FFFFFFF
[    5.256773] [drm] Detected VRAM RAM=3D512M, BAR=3D512M
[    5.256781] [drm] RAM width 64bits DDR4
[    5.258073] [drm] amdgpu: 512M of VRAM memory ready
[    5.258086] [drm] amdgpu: 1583M of GTT memory ready.
[    5.258239] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    5.258563] [drm] PCIE GART of 1024M enabled.
[    5.258571] [drm] PTB located at 0x000000F41FC00000
[    5.260486] amdgpu 0000:03:00.0: amdgpu: [drm] Loading DMUB firmware via=
 PSP: version=3D0x0101002B
[    5.261801] amdgpu 0000:03:00.0: amdgpu: Found VCN firmware Version ENC:=
 1.24 DEC: 8 VEP: 0 Revision: 3
[    5.265251] amdgpu 0000:03:00.0: amdgpu: reserve 0x400000 from 0xf41f800=
000 for PSP TMR
[    5.358191] amd_atl: AMD Address Translation Library initialized
[    5.371805] amdgpu 0000:03:00.0: amdgpu: RAS: optional ras ta ucode is n=
ot available
[    5.383661] amdgpu 0000:03:00.0: amdgpu: RAP: optional rap ta ucode is n=
ot available
[    5.389664] amdgpu 0000:03:00.0: amdgpu: psp gfx command LOAD_TA(0x1) fa=
iled and response status is (0x7)
[    5.390159] amdgpu 0000:03:00.0: amdgpu: psp gfx command INVOKE_CMD(0x3)=
 failed and response status is (0x4)
[    5.390201] amdgpu 0000:03:00.0: amdgpu: Secure display: Generic Failure.
[    5.390212] amdgpu 0000:03:00.0: amdgpu: SECUREDISPLAY: query securedisp=
lay TA failed. ret 0x0
[    5.391829] amdgpu 0000:03:00.0: amdgpu: SMU is initialized successfully!
[    5.394160] amdgpu 0000:03:00.0: amdgpu: [drm] Display Core v3.2.334 ini=
tialized on DCN 2.1
[    5.394191] amdgpu 0000:03:00.0: amdgpu: [drm] DP-HDMI FRL PCON supported
[    5.395176] amdgpu 0000:03:00.0: amdgpu: [drm] DMUB hardware initialized=
: version=3D0x0101002B
[    5.424427] snd_hda_intel 0000:03:00.1: bound 0000:03:00.0 (ops amdgpu_d=
m_audio_component_bind_ops [amdgpu])
[    5.600578] amdgpu 0000:03:00.0: amdgpu: [drm] Using ACPI provided EDID =
for eDP-1
[    5.607002] [drm] kiq ring mec 2 pipe 1 q 0
[    5.615137] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    5.615187] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[    5.615860] amdgpu: Virtual CRAT table created for GPU
[    5.616433] amdgpu: Topology: Add dGPU node [0x1636:0x1002]
[    5.616452] kfd kfd: amdgpu: added device 1002:1636
[    5.616629] amdgpu 0000:03:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 8,=
 active_cu_number 6
[    5.616662] amdgpu 0000:03:00.0: amdgpu: ring gfx uses VM inv eng 0 on h=
ub 0
[    5.616672] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng=
 1 on hub 0
[    5.616682] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng=
 4 on hub 0
[    5.616693] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng=
 5 on hub 0
[    5.616703] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng=
 6 on hub 0
[    5.616713] amdgpu 0000:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng=
 7 on hub 0
[    5.616723] amdgpu 0000:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng=
 8 on hub 0
[    5.616733] amdgpu 0000:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng=
 9 on hub 0
[    5.616744] amdgpu 0000:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng=
 10 on hub 0
[    5.616754] amdgpu 0000:03:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv en=
g 11 on hub 0
[    5.616764] amdgpu 0000:03:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on=
 hub 8
[    5.616774] amdgpu 0000:03:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 =
on hub 8
[    5.616784] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4=
 on hub 8
[    5.616794] amdgpu 0000:03:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5=
 on hub 8
[    5.616804] amdgpu 0000:03:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6=
 on hub 8
[    5.619392] amdgpu 0000:03:00.0: amdgpu: Runtime PM not available
[    5.620939] amdgpu 0000:03:00.0: amdgpu: [drm] Using custom brightness c=
urve
[    5.622425] [drm] Initialized amdgpu 3.64.0 for 0000:03:00.0 on minor 0
[    5.632366] fbcon: amdgpudrmfb (fb0) is primary device
[    5.633550] [drm] pre_validate_dsc:1627 MST_DSC dsc precompute is not ne=
eded
[    5.654085] Console: switching to colour frame buffer device 240x67
[    5.654589] ------------[ cut here ]------------
[    5.654607] WARNING: ./include/linux/sched.h:2175 at __ww_mutex_lock.con=
stprop.0+0xec3/0x1ab0, CPU#5: kworker/5:1/122
[    5.654613] Modules linked in: amd_atl(E) nls_ascii(E) nls_cp437(E) vfat=
(E) joydev(E) fat(E) edac_mce_amd(E) snd_hda_codec_realtek(E) snd_hda_codec=
_generic(E) hid_multitouch(E) amdgpu(E+) snd_hda_scodec_component(E) kvm_am=
d(E) hid_generic(E) rtw88_8822ce(E) snd_hda_codec_hdmi(E) rtw88_8822c(E) sh=
a3_generic(E) amdxcp(E) kvm(E) jitterentropy_rng(E) rtw88_pci(E) i2c_algo_b=
it(E) drm_client_lib(E) drm_ttm_helper(E) irqbypass(E) rtw88_core(E) ttm(E)=
 tpm_crb(E) drm_exec(E) wmi_bmof(E) drbg(E) snd_hda_intel(E) ghash_clmulni_=
intel(E) mac80211(E) snd_intel_dspcfg(E) gpu_sched(E) aesni_intel(E) snd_hd=
a_codec(E) libarc4(E) snd_hwdep(E) drm_suballoc_helper(E) drm_panel_backlig=
ht_quirks(E) snd_hda_core(E) sp5100_tco(E) cec(E) rapl(E) watchdog(E) snd_p=
cm(E) drm_buddy(E) snd_rn_pci_acp3x(E) cfg80211(E) ucsi_acpi(E) i2c_piix4(E=
) drm_display_helper(E) snd_acp_config(E) typec_ucsi(E) video(E) snd_timer(=
E) snd_soc_acpi(E) xhci_pci(E) pcspkr(E) acpi_cpufreq(E) drm_kms_helper(E) =
roles(E) snd(E) xhci_hcd(E) ccp(E) snd_pci_acp3x(E)
[    5.654660]  soundcore(E) k10temp(E) i2c_smbus(E) rfkill(E) typec(E) bat=
tery(E) wmi(E) i2c_hid_acpi(E) i2c_hid(E) tpm_tis(E) hid(E) tpm_tis_core(E)=
 ac(E) button(E) fuse(E) efi_pstore(E) drm(E) tpm(E) libaescfb(E) ecdh_gene=
ric(E) ecc(E) rng_core(E) autofs4(E) evdev(E) serio_raw(E)
[    5.654676] CPU: 5 UID: 0 PID: 122 Comm: kworker/5:1 Tainted: G         =
   E       6.16.0-rc7+ #3 PREEMPT(voluntary)=20
[    5.654679] Tainted: [E]=3DUNSIGNED_MODULE
[    5.654680] Hardware name: HP HP ProBook 635 Aero G7 Notebook PC/8830, B=
IOS S84 Ver. 01.05.00 05/14/2021
[    5.654682] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
[    5.654700] RIP: 0010:__ww_mutex_lock.constprop.0+0xec3/0x1ab0
[    5.654702] Code: 00 00 85 c0 0f 85 c6 0a 00 00 49 8b 81 d8 0d 00 00 48 =
85 c0 0f 84 57 0b 00 00 48 89 8d 68 ff ff ff 49 39 c7 0f 84 53 0b 00 00 <0f=
> 0b 49 c7 81 d8 0d 00 00 00 00 00 00 4c 89 ce 48 8d 7d 90 e8 24
[    5.654703] RSP: 0018:ffffc06e005cb970 EFLAGS: 00010087
[    5.654705] RAX: ffff9db45056e820 RBX: ffff9db544e4c700 RCX: ffff9db4505=
6c870
[    5.654706] RDX: 0000000000000001 RSI: ffff9db45056c840 RDI: ffff9db544e=
4d5f8
[    5.654707] RBP: ffffc06e005cba20 R08: ffffc06e00ec7608 R09: ffff9db5443=
68000
[    5.654708] R10: 0000000000000000 R11: 000000000000055e R12: ffffc06e005=
cbc90
[    5.654709] R13: 0000000000000246 R14: ffff9db45056c828 R15: ffff9db4505=
6c820
[    5.654710] FS:  0000000000000000(0000) GS:ffff9db5bf075000(0000) knlGS:=
0000000000000000
[    5.654711] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.654712] CR2: 00007fb98977b2d0 CR3: 0000000102ab2000 CR4: 00000000003=
50ef0
[    5.654713] Call Trace:
[    5.654714]  <TASK>
[    5.654716]  ? modeset_lock+0x189/0x1e0 [drm]
[    5.654761]  ? ww_mutex_lock+0x3c/0xb0
[    5.654763]  ww_mutex_lock+0x3c/0xb0
[    5.654764]  modeset_lock+0x189/0x1e0 [drm]
[    5.654786]  drm_modeset_lock_all_ctx+0xc1/0x180 [drm]
[    5.654808]  amdgpu_dm_atomic_check+0x141c/0x1920 [amdgpu]
[    5.655313]  ? modeset_lock+0x189/0x1e0 [drm]
[    5.655347]  drm_atomic_check_only+0x619/0xaa0 [drm]
[    5.655371]  drm_atomic_commit+0x71/0xe0 [drm]
[    5.655391]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
[    5.655415]  drm_atomic_helper_dirtyfb+0x1c0/0x2a0 [drm_kms_helper]
[    5.655434]  drm_fbdev_ttm_helper_fb_dirty+0x220/0xa10 [drm_ttm_helper]
[    5.655439]  drm_fb_helper_damage_work+0x8b/0x170 [drm_kms_helper]
[    5.655449]  process_one_work+0x230/0x5c0
[    5.655455]  worker_thread+0x1da/0x3d0
[    5.655457]  ? __pfx_worker_thread+0x10/0x10
[    5.655459]  kthread+0x10d/0x240
[    5.655462]  ? __pfx_kthread+0x10/0x10
[    5.655465]  ret_from_fork+0x16b/0x1c0
[    5.655466]  ? __pfx_kthread+0x10/0x10
[    5.655468]  ret_from_fork_asm+0x1a/0x30
[    5.655475]  </TASK>
[    5.655476] irq event stamp: 7586
[    5.655477] hardirqs last  enabled at (7585): [<ffffffff8678ac4d>] ___km=
alloc_large_node+0xfd/0x140
[    5.655479] hardirqs last disabled at (7586): [<ffffffff87096764>] _raw_=
spin_lock_irqsave+0x54/0x60
[    5.655481] softirqs last  enabled at (7580): [<ffffffff864f17c6>] __irq=
_exit_rcu+0x96/0xc0
[    5.655484] softirqs last disabled at (7575): [<ffffffff864f17c6>] __irq=
_exit_rcu+0x96/0xc0
[    5.655486] ---[ end trace 0000000000000000 ]---
[    5.699841] amdgpu 0000:03:00.0: [drm] fb0: amdgpudrmfb frame buffer dev=
ice
[   56.286905] sched: DL replenish lagged too much

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
