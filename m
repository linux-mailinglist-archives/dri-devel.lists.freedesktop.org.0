Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5CE46C19D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 18:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54203EB25B;
	Tue,  7 Dec 2021 17:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49512EB029;
 Tue,  7 Dec 2021 17:18:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237438379"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="237438379"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:17:08 -0800
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="502679390"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 09:17:03 -0800
Date: Tue, 7 Dec 2021 19:16:59 +0200
From: Imre Deak <imre.deak@intel.com>
To: Ammar Faizi <ammarfaizi2@gmail.com>
Subject: Re: WARNING: CPU: 1 PID: 722 at
 drivers/gpu/drm/i915/display/intel_tc.c:761
Message-ID: <20211207171659.GA727629@ideak-desk.fi.intel.com>
References: <20211207035039.10570-1-ammar.faizi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211207035039.10570-1-ammar.faizi@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ammar,

On Tue, Dec 07, 2021 at 10:54:59AM +0700, Ammar Faizi wrote:
> Hello,
>=20
> I found warnings in the stable tree.
>=20
> Commit: a2547651bc896f95a3680a6a0a27401e7c7a1080 ("Linux 5.15.6")
>=20
> There are two unique warn locations:
>=20
>   ammarfaizi2@integral2:~$ sudo dmesg -Sr | grep -oiE 'WARNING:.+' | sort=
 | uniq
>   [sudo] password for ammarfaizi2:
>   WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i915/display/intel_tc.c:531=
 intel_tc_port_sanitize+0x323/0x380 [i915]
>   WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i915/display/intel_tc.c:761=
 intel_tc_port_init+0x1a9/0x1b0 [i915]
>=20
> Full log can be found here:
>   https://gist.githubusercontent.com/ammarfaizi2/d588af19f7bb9eb40494626e=
cc041654/raw/b98d3e1ee5f5ed20b79b0a6cabce06dce8abcd97/kernel_log_bug_linux_=
5.15.6_stable.txt

could you open a ticket at
https://gitlab.freedesktop.org/drm/intel/-/issues/new

providing a dmesg log after booting with drm.debug=3D0x1e?

Thanks,
Imre

>=20
> Warning:
>   <4>[    6.629829][  T722] ------------[ cut here ]------------
>   <4>[    6.629830][  T722] i915 0000:00:02.0: drm_WARN_ON(val =3D=3D 0xf=
fffffff)
>   <4>[    6.629842][  T722] WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i=
915/display/intel_tc.c:761 intel_tc_port_init+0x1a9/0x1b0 [i915]
>   <4>[    6.629919][  T722] Modules linked in: i915(+) snd_soc_dmic snd_s=
of_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda soundwire_intel =
soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pc=
i snd_sof_xtensa_dsp snd_sof snd_hda_ext_core snd_soc_acpi_intel_match snd_=
soc_acpi soundwire_bus ledtrig_audio snd_soc_core rtw88_8822ce snd_compress=
 ac97_bus snd_pcm_dmaengine rtw88_8822c snd_hda_intel snd_intel_dspcfg rtw8=
8_pci snd_intel_sdw_acpi rtw88_core snd_hda_codec snd_hda_core snd_hwdep in=
tel_tcc_cooling mac80211 nls_iso8859_1 snd_pcm x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_seq_midi kvm_intel snd_seq_midi_event snd_rawmidi me=
i_hdcp intel_rapl_msr ttm kvm cfg80211 drm_kms_helper snd_seq btusb btrtl b=
tbcm uvcvideo btintel bluetooth videobuf2_vmalloc videobuf2_memops videobuf=
2_v4l2 videobuf2_common videodev cec processor_thermal_device_pci_legacy pr=
ocessor_thermal_device snd_seq_device rc_core processor_thermal_rfim snd_ti=
mer processor_thermal_mbox
>   <4>[    6.629951][  T722]  crct10dif_pclmul ecdh_generic i2c_algo_bit m=
c joydev input_leds processor_thermal_rapl snd ghash_clmulni_intel ecc fb_s=
ys_fops mei_me aesni_intel hp_wmi syscopyarea intel_rapl_common crypto_simd=
 sysfillrect platform_profile mei libarc4 sysimgblt serio_raw sparse_keymap=
 efi_pstore hid_multitouch cryptd ee1004 soundcore wmi_bmof intel_soc_dts_i=
osf mac_hid int3400_thermal int3403_thermal int340x_thermal_zone acpi_therm=
al_rel acpi_pad dptf_pch_fivr sch_fq_codel zram drm msr parport_pc ppdev lp=
 parport ip_tables x_tables autofs4 btrfs blake2b_generic xor usbhid raid6_=
pq libcrc32c hid_generic nvme nvme_core intel_lpss_pci xhci_pci crc32_pclmu=
l xhci_pci_renesas intel_lpss i2c_i801 i2c_hid_acpi vmd i2c_smbus idma64 i2=
c_hid hid wmi video pinctrl_tigerlake
>   <4>[    6.629984][  T722] CPU: 1 PID: 722 Comm: modprobe Not tainted 5.=
15.6-icetea2-stable-00459-ga2547651bc89 #1 d738e98f796accca080303b93ac2eee9=
24880c33
>   <4>[    6.629986][  T722] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, =
BIOS F.15 09/15/2021
>   <4>[    6.629987][  T722] RIP: 0010:intel_tc_port_init+0x1a9/0x1b0 [i91=
5]
>   <4>[    6.630045][  T722] Code: 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 =
b0 a9 17 e0 48 c7 c1 c8 22 6b a1 4c 89 e2 48 c7 c7 5e 0f 6d a1 48 89 c6 e8 =
57 ee 58 e0 <0f> 0b e9 61 ff ff ff 0f 1f 44 00 00 48 8b 17 80 ba d3 0d 00 0=
0 0b
>   <4>[    6.630046][  T722] RSP: 0018:ffffc900017f7b08 EFLAGS: 00010296
>   <4>[    6.630048][  T722] RAX: 0000000000000031 RBX: ffff88810403a000 R=
CX: 0000000000000027
>   <4>[    6.630049][  T722] RDX: ffff88846fa60c28 RSI: 0000000000000001 R=
DI: ffff88846fa60c20
>   <4>[    6.630050][  T722] RBP: 0000000000000000 R08: ffffffff82760528 R=
09: 00000000ffffdfff
>   <4>[    6.630051][  T722] R10: ffffffff82680540 R11: ffffffff82680540 R=
12: ffff888102046410
>   <4>[    6.630052][  T722] R13: 00000000ffffffff R14: ffff88810403b940 R=
15: 00000000ffffffff
>   <4>[    6.630054][  T722] FS:  00007f4fd979e580(0000) GS:ffff88846fa400=
00(0000) knlGS:0000000000000000
>   <4>[    6.630055][  T722] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
>   <4>[    6.630056][  T722] CR2: 00007fe05f19fea0 CR3: 0000000119098004 C=
R4: 0000000000770ee0
>   <4>[    6.630058][  T722] PKRU: 55555554
>   <4>[    6.630059][  T722] Call Trace:
>   <4>[    6.630062][  T722]  <TASK>
>   <4>[    6.630066][  T722]  intel_ddi_init+0x663/0xba0 [i915 91e0a10445c=
c74861446c203b02c9291e0680a4b]
>   <4>[    6.630125][  T722]  intel_modeset_init_nogem+0x982/0x1230 [i915 =
91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.630180][  T722]  ? gen12_fwtable_read32+0x96/0x2a0 [i915 91e0=
a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.630230][  T722]  i915_driver_probe+0x6dc/0xd10 [i915 91e0a104=
45cc74861446c203b02c9291e0680a4b]
>   <4>[    6.630276][  T722]  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>   <4>[    6.630279][  T722]  ? i915_pci_probe+0x31/0x110 [i915 91e0a10445=
cc74861446c203b02c9291e0680a4b]
>   <4>[    6.630322][  T722]  local_pci_probe+0x40/0x80
>   <4>[    6.630325][  T722]  pci_device_probe+0xd9/0x190
>   <4>[    6.630328][  T722]  really_probe+0x1e9/0x3e0
>   <4>[    6.630331][  T722]  __driver_probe_device+0xfe/0x180
>   <4>[    6.630333][  T722]  driver_probe_device+0x1e/0x90
>   <4>[    6.630334][  T722]  __driver_attach+0xc1/0x1d0
>   <4>[    6.630335][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.630337][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.630338][  T722]  bus_for_each_dev+0x64/0x90
>   <4>[    6.630340][  T722]  bus_add_driver+0x12e/0x1f0
>   <4>[    6.630342][  T722]  driver_register+0x8f/0xe0
>   <4>[    6.630344][  T722]  i915_init+0x1a/0x86 [i915 91e0a10445cc748614=
46c203b02c9291e0680a4b]
>   <4>[    6.630387][  T722]  ? 0xffffffffa0e9d000
>   <4>[    6.630388][  T722]  do_one_initcall+0x59/0x210
>   <4>[    6.630392][  T722]  ? __cond_resched+0x16/0x50
>   <4>[    6.630394][  T722]  ? kmem_cache_alloc_trace+0x55/0x550
>   <4>[    6.630397][  T722]  do_init_module+0x5c/0x260
>   <4>[    6.630400][  T722]  __do_sys_finit_module+0x95/0xe0
>   <4>[    6.630404][  T722]  do_syscall_64+0x35/0xb0
>   <4>[    6.630406][  T722]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>   <4>[    6.630408][  T722] RIP: 0033:0x7f4fd98c594d
>   <4>[    6.630409][  T722] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 64 0f 00 f7 d8 64 89 0=
1 48
>   <4>[    6.630410][  T722] RSP: 002b:00007ffd955c4318 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000139
>   <4>[    6.630412][  T722] RAX: ffffffffffffffda RBX: 000055ff3b3e0980 R=
CX: 00007f4fd98c594d
>   <4>[    6.630412][  T722] RDX: 0000000000000000 RSI: 000055ff3b3cfc02 R=
DI: 0000000000000000
>   <4>[    6.630413][  T722] RBP: 0000000000040000 R08: 0000000000000000 R=
09: 0000000000000000
>   <4>[    6.630414][  T722] R10: 0000000000000000 R11: 0000000000000246 R=
12: 000055ff3b3cfc02
>   <4>[    6.630414][  T722] R13: 000055ff3b3e0a90 R14: 0000000000000000 R=
15: 000055ff3b3da910
>   <4>[    6.630418][  T722]  </TASK>
>   <4>[    6.630418][  T722] ---[ end trace a36dd53a5e689fdc ]---
>   <4>[    6.630450][  T722] ------------[ cut here ]------------
>   <4>[    6.630450][  T722] i915 0000:00:02.0: drm_WARN_ON(val =3D=3D 0xf=
fffffff)
>   <4>[    6.630459][  T722] WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i=
915/display/intel_tc.c:761 intel_tc_port_init+0x1a9/0x1b0 [i915]
>   <4>[    6.630518][  T722] Modules linked in: i915(+) snd_soc_dmic snd_s=
of_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda soundwire_intel =
soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pc=
i snd_sof_xtensa_dsp snd_sof snd_hda_ext_core snd_soc_acpi_intel_match snd_=
soc_acpi soundwire_bus ledtrig_audio snd_soc_core rtw88_8822ce snd_compress=
 ac97_bus snd_pcm_dmaengine rtw88_8822c snd_hda_intel snd_intel_dspcfg rtw8=
8_pci snd_intel_sdw_acpi rtw88_core snd_hda_codec snd_hda_core snd_hwdep in=
tel_tcc_cooling mac80211 nls_iso8859_1 snd_pcm x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_seq_midi kvm_intel snd_seq_midi_event snd_rawmidi me=
i_hdcp intel_rapl_msr ttm kvm cfg80211 drm_kms_helper snd_seq btusb btrtl b=
tbcm uvcvideo btintel bluetooth videobuf2_vmalloc videobuf2_memops videobuf=
2_v4l2 videobuf2_common videodev cec processor_thermal_device_pci_legacy pr=
ocessor_thermal_device snd_seq_device rc_core processor_thermal_rfim snd_ti=
mer processor_thermal_mbox
>   <4>[    6.630541][  T722]  crct10dif_pclmul ecdh_generic i2c_algo_bit m=
c joydev input_leds processor_thermal_rapl snd ghash_clmulni_intel ecc fb_s=
ys_fops mei_me aesni_intel hp_wmi syscopyarea intel_rapl_common crypto_simd=
 sysfillrect platform_profile mei libarc4 sysimgblt serio_raw sparse_keymap=
 efi_pstore hid_multitouch cryptd ee1004 soundcore wmi_bmof intel_soc_dts_i=
osf mac_hid int3400_thermal int3403_thermal int340x_thermal_zone acpi_therm=
al_rel acpi_pad dptf_pch_fivr sch_fq_codel zram drm msr parport_pc ppdev lp=
 parport ip_tables x_tables autofs4 btrfs blake2b_generic xor usbhid raid6_=
pq libcrc32c hid_generic nvme nvme_core intel_lpss_pci xhci_pci crc32_pclmu=
l xhci_pci_renesas intel_lpss i2c_i801 i2c_hid_acpi vmd i2c_smbus idma64 i2=
c_hid hid wmi video pinctrl_tigerlake
>   <4>[    6.630566][  T722] CPU: 1 PID: 722 Comm: modprobe Tainted: G    =
    W         5.15.6-icetea2-stable-00459-ga2547651bc89 #1 d738e98f796accca=
080303b93ac2eee924880c33
>   <4>[    6.630568][  T722] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, =
BIOS F.15 09/15/2021
>   <4>[    6.630568][  T722] RIP: 0010:intel_tc_port_init+0x1a9/0x1b0 [i91=
5]
>   <4>[    6.630620][  T722] Code: 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 =
b0 a9 17 e0 48 c7 c1 c8 22 6b a1 4c 89 e2 48 c7 c7 5e 0f 6d a1 48 89 c6 e8 =
57 ee 58 e0 <0f> 0b e9 61 ff ff ff 0f 1f 44 00 00 48 8b 17 80 ba d3 0d 00 0=
0 0b
>   <4>[    6.630621][  T722] RSP: 0018:ffffc900017f7b08 EFLAGS: 00010296
>   <4>[    6.630622][  T722] RAX: 0000000000000031 RBX: ffff88810403c000 R=
CX: 0000000000000027
>   <4>[    6.630623][  T722] RDX: ffff88846fa60c28 RSI: 0000000000000001 R=
DI: ffff88846fa60c20
>   <4>[    6.630623][  T722] RBP: 0000000000000001 R08: ffffffff82760528 R=
09: 00000000ffffdfff
>   <4>[    6.630624][  T722] R10: ffffffff82680540 R11: ffffffff82680540 R=
12: ffff888102046410
>   <4>[    6.630625][  T722] R13: 00000000ffffffff R14: ffff88810403d940 R=
15: 00000000ffffffff
>   <4>[    6.630625][  T722] FS:  00007f4fd979e580(0000) GS:ffff88846fa400=
00(0000) knlGS:0000000000000000
>   <4>[    6.630626][  T722] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
>   <4>[    6.630627][  T722] CR2: 00007fe05f19fea0 CR3: 0000000119098004 C=
R4: 0000000000770ee0
>   <4>[    6.630628][  T722] PKRU: 55555554
>   <4>[    6.630628][  T722] Call Trace:
>   <4>[    6.630629][  T722]  <TASK>
>   <4>[    6.630630][  T722]  intel_ddi_init+0x663/0xba0 [i915 91e0a10445c=
c74861446c203b02c9291e0680a4b]
>   <4>[    6.630684][  T722]  intel_modeset_init_nogem+0x98f/0x1230 [i915 =
91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.630739][  T722]  ? gen12_fwtable_read32+0x96/0x2a0 [i915 91e0=
a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.630786][  T722]  i915_driver_probe+0x6dc/0xd10 [i915 91e0a104=
45cc74861446c203b02c9291e0680a4b]
>   <4>[    6.630827][  T722]  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>   <4>[    6.630828][  T722]  ? i915_pci_probe+0x31/0x110 [i915 91e0a10445=
cc74861446c203b02c9291e0680a4b]
>   <4>[    6.630868][  T722]  local_pci_probe+0x40/0x80
>   <4>[    6.630870][  T722]  pci_device_probe+0xd9/0x190
>   <4>[    6.630872][  T722]  really_probe+0x1e9/0x3e0
>   <4>[    6.630874][  T722]  __driver_probe_device+0xfe/0x180
>   <4>[    6.630876][  T722]  driver_probe_device+0x1e/0x90
>   <4>[    6.630877][  T722]  __driver_attach+0xc1/0x1d0
>   <4>[    6.630879][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.630881][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.630883][  T722]  bus_for_each_dev+0x64/0x90
>   <4>[    6.630886][  T722]  bus_add_driver+0x12e/0x1f0
>   <4>[    6.630888][  T722]  driver_register+0x8f/0xe0
>   <4>[    6.630891][  T722]  i915_init+0x1a/0x86 [i915 91e0a10445cc748614=
46c203b02c9291e0680a4b]
>   <4>[    6.630935][  T722]  ? 0xffffffffa0e9d000
>   <4>[    6.630936][  T722]  do_one_initcall+0x59/0x210
>   <4>[    6.630937][  T722]  ? __cond_resched+0x16/0x50
>   <4>[    6.630939][  T722]  ? kmem_cache_alloc_trace+0x55/0x550
>   <4>[    6.630941][  T722]  do_init_module+0x5c/0x260
>   <4>[    6.630942][  T722]  __do_sys_finit_module+0x95/0xe0
>   <4>[    6.630946][  T722]  do_syscall_64+0x35/0xb0
>   <4>[    6.630947][  T722]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>   <4>[    6.630949][  T722] RIP: 0033:0x7f4fd98c594d
>   <4>[    6.630949][  T722] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 64 0f 00 f7 d8 64 89 0=
1 48
>   <4>[    6.630950][  T722] RSP: 002b:00007ffd955c4318 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000139
>   <4>[    6.630952][  T722] RAX: ffffffffffffffda RBX: 000055ff3b3e0980 R=
CX: 00007f4fd98c594d
>   <4>[    6.630952][  T722] RDX: 0000000000000000 RSI: 000055ff3b3cfc02 R=
DI: 0000000000000000
>   <4>[    6.630953][  T722] RBP: 0000000000040000 R08: 0000000000000000 R=
09: 0000000000000000
>   <4>[    6.630954][  T722] R10: 0000000000000000 R11: 0000000000000246 R=
12: 000055ff3b3cfc02
>   <4>[    6.630954][  T722] R13: 000055ff3b3e0a90 R14: 0000000000000000 R=
15: 000055ff3b3da910
>   <4>[    6.630957][  T722]  </TASK>
>   <4>[    6.630958][  T722] ---[ end trace a36dd53a5e689fdd ]---
>   <4>[    6.630979][  T722] ------------[ cut here ]------------
>   <4>[    6.630980][  T722] i915 0000:00:02.0: drm_WARN_ON(val =3D=3D 0xf=
fffffff)
>   <4>[    6.630985][  T722] WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i=
915/display/intel_tc.c:761 intel_tc_port_init+0x1a9/0x1b0 [i915]
>   <4>[    6.631038][  T722] Modules linked in: i915(+) snd_soc_dmic snd_s=
of_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda soundwire_intel =
soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pc=
i snd_sof_xtensa_dsp snd_sof snd_hda_ext_core snd_soc_acpi_intel_match snd_=
soc_acpi soundwire_bus ledtrig_audio snd_soc_core rtw88_8822ce snd_compress=
 ac97_bus snd_pcm_dmaengine rtw88_8822c snd_hda_intel snd_intel_dspcfg rtw8=
8_pci snd_intel_sdw_acpi rtw88_core snd_hda_codec snd_hda_core snd_hwdep in=
tel_tcc_cooling mac80211 nls_iso8859_1 snd_pcm x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_seq_midi kvm_intel snd_seq_midi_event snd_rawmidi me=
i_hdcp intel_rapl_msr ttm kvm cfg80211 drm_kms_helper snd_seq btusb btrtl b=
tbcm uvcvideo btintel bluetooth videobuf2_vmalloc videobuf2_memops videobuf=
2_v4l2 videobuf2_common videodev cec processor_thermal_device_pci_legacy pr=
ocessor_thermal_device snd_seq_device rc_core processor_thermal_rfim snd_ti=
mer processor_thermal_mbox
>   <4>[    6.631060][  T722]  crct10dif_pclmul ecdh_generic i2c_algo_bit m=
c joydev input_leds processor_thermal_rapl snd ghash_clmulni_intel ecc fb_s=
ys_fops mei_me aesni_intel hp_wmi syscopyarea intel_rapl_common crypto_simd=
 sysfillrect platform_profile mei libarc4 sysimgblt serio_raw sparse_keymap=
 efi_pstore hid_multitouch cryptd ee1004 soundcore wmi_bmof intel_soc_dts_i=
osf mac_hid int3400_thermal int3403_thermal int340x_thermal_zone acpi_therm=
al_rel acpi_pad dptf_pch_fivr sch_fq_codel zram drm msr parport_pc ppdev lp=
 parport ip_tables x_tables autofs4 btrfs blake2b_generic xor usbhid raid6_=
pq libcrc32c hid_generic nvme nvme_core intel_lpss_pci xhci_pci crc32_pclmu=
l xhci_pci_renesas intel_lpss i2c_i801 i2c_hid_acpi vmd i2c_smbus idma64 i2=
c_hid hid wmi video pinctrl_tigerlake
>   <4>[    6.631083][  T722] CPU: 1 PID: 722 Comm: modprobe Tainted: G    =
    W         5.15.6-icetea2-stable-00459-ga2547651bc89 #1 d738e98f796accca=
080303b93ac2eee924880c33
>   <4>[    6.631085][  T722] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, =
BIOS F.15 09/15/2021
>   <4>[    6.631085][  T722] RIP: 0010:intel_tc_port_init+0x1a9/0x1b0 [i91=
5]
>   <4>[    6.631134][  T722] Code: 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 =
b0 a9 17 e0 48 c7 c1 c8 22 6b a1 4c 89 e2 48 c7 c7 5e 0f 6d a1 48 89 c6 e8 =
57 ee 58 e0 <0f> 0b e9 61 ff ff ff 0f 1f 44 00 00 48 8b 17 80 ba d3 0d 00 0=
0 0b
>   <4>[    6.631134][  T722] RSP: 0018:ffffc900017f7b08 EFLAGS: 00010296
>   <4>[    6.631135][  T722] RAX: 0000000000000031 RBX: ffff88810403e000 R=
CX: 0000000000000027
>   <4>[    6.631136][  T722] RDX: ffff88846fa60c28 RSI: 0000000000000001 R=
DI: ffff88846fa60c20
>   <4>[    6.631137][  T722] RBP: 0000000000000002 R08: ffffffff82760528 R=
09: 00000000ffffdfff
>   <4>[    6.631137][  T722] R10: ffffffff82680540 R11: ffffffff82680540 R=
12: ffff888102046410
>   <4>[    6.631138][  T722] R13: 00000000ffffffff R14: ffff88810403f940 R=
15: 00000000ffffffff
>   <4>[    6.631139][  T722] FS:  00007f4fd979e580(0000) GS:ffff88846fa400=
00(0000) knlGS:0000000000000000
>   <4>[    6.631140][  T722] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
>   <4>[    6.631140][  T722] CR2: 00007fe05f19fea0 CR3: 0000000119098004 C=
R4: 0000000000770ee0
>   <4>[    6.631141][  T722] PKRU: 55555554
>   <4>[    6.631142][  T722] Call Trace:
>   <4>[    6.631142][  T722]  <TASK>
>   <4>[    6.631143][  T722]  intel_ddi_init+0x663/0xba0 [i915 91e0a10445c=
c74861446c203b02c9291e0680a4b]
>   <4>[    6.631195][  T722]  intel_modeset_init_nogem+0x99c/0x1230 [i915 =
91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.631249][  T722]  ? gen12_fwtable_read32+0x96/0x2a0 [i915 91e0=
a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.631297][  T722]  i915_driver_probe+0x6dc/0xd10 [i915 91e0a104=
45cc74861446c203b02c9291e0680a4b]
>   <4>[    6.631341][  T722]  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>   <4>[    6.631342][  T722]  ? i915_pci_probe+0x31/0x110 [i915 91e0a10445=
cc74861446c203b02c9291e0680a4b]
>   <4>[    6.631384][  T722]  local_pci_probe+0x40/0x80
>   <4>[    6.631386][  T722]  pci_device_probe+0xd9/0x190
>   <4>[    6.631388][  T722]  really_probe+0x1e9/0x3e0
>   <4>[    6.631390][  T722]  __driver_probe_device+0xfe/0x180
>   <4>[    6.631391][  T722]  driver_probe_device+0x1e/0x90
>   <4>[    6.631393][  T722]  __driver_attach+0xc1/0x1d0
>   <4>[    6.631394][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.631395][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.631397][  T722]  bus_for_each_dev+0x64/0x90
>   <4>[    6.631398][  T722]  bus_add_driver+0x12e/0x1f0
>   <4>[    6.631400][  T722]  driver_register+0x8f/0xe0
>   <4>[    6.631402][  T722]  i915_init+0x1a/0x86 [i915 91e0a10445cc748614=
46c203b02c9291e0680a4b]
>   <4>[    6.631441][  T722]  ? 0xffffffffa0e9d000
>   <4>[    6.631442][  T722]  do_one_initcall+0x59/0x210
>   <4>[    6.631443][  T722]  ? __cond_resched+0x16/0x50
>   <4>[    6.631444][  T722]  ? kmem_cache_alloc_trace+0x55/0x550
>   <4>[    6.631447][  T722]  do_init_module+0x5c/0x260
>   <4>[    6.631448][  T722]  __do_sys_finit_module+0x95/0xe0
>   <4>[    6.631452][  T722]  do_syscall_64+0x35/0xb0
>   <4>[    6.631453][  T722]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>   <4>[    6.631454][  T722] RIP: 0033:0x7f4fd98c594d
>   <4>[    6.631455][  T722] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 64 0f 00 f7 d8 64 89 0=
1 48
>   <4>[    6.631456][  T722] RSP: 002b:00007ffd955c4318 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000139
>   <4>[    6.631457][  T722] RAX: ffffffffffffffda RBX: 000055ff3b3e0980 R=
CX: 00007f4fd98c594d
>   <4>[    6.631458][  T722] RDX: 0000000000000000 RSI: 000055ff3b3cfc02 R=
DI: 0000000000000000
>   <4>[    6.631459][  T722] RBP: 0000000000040000 R08: 0000000000000000 R=
09: 0000000000000000
>   <4>[    6.631459][  T722] R10: 0000000000000000 R11: 0000000000000246 R=
12: 000055ff3b3cfc02
>   <4>[    6.631460][  T722] R13: 000055ff3b3e0a90 R14: 0000000000000000 R=
15: 000055ff3b3da910
>   <4>[    6.631463][  T722]  </TASK>
>   <4>[    6.631463][  T722] ---[ end trace a36dd53a5e689fde ]---
>   <4>[    6.631486][  T722] ------------[ cut here ]------------
>   <4>[    6.631486][  T722] i915 0000:00:02.0: drm_WARN_ON(val =3D=3D 0xf=
fffffff)
>   <4>[    6.631492][  T722] WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i=
915/display/intel_tc.c:761 intel_tc_port_init+0x1a9/0x1b0 [i915]
>   <4>[    6.631547][  T722] Modules linked in: i915(+) snd_soc_dmic snd_s=
of_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda soundwire_intel =
soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pc=
i snd_sof_xtensa_dsp snd_sof snd_hda_ext_core snd_soc_acpi_intel_match snd_=
soc_acpi soundwire_bus ledtrig_audio snd_soc_core rtw88_8822ce snd_compress=
 ac97_bus snd_pcm_dmaengine rtw88_8822c snd_hda_intel snd_intel_dspcfg rtw8=
8_pci snd_intel_sdw_acpi rtw88_core snd_hda_codec snd_hda_core snd_hwdep in=
tel_tcc_cooling mac80211 nls_iso8859_1 snd_pcm x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_seq_midi kvm_intel snd_seq_midi_event snd_rawmidi me=
i_hdcp intel_rapl_msr ttm kvm cfg80211 drm_kms_helper snd_seq btusb btrtl b=
tbcm uvcvideo btintel bluetooth videobuf2_vmalloc videobuf2_memops videobuf=
2_v4l2 videobuf2_common videodev cec processor_thermal_device_pci_legacy pr=
ocessor_thermal_device snd_seq_device rc_core processor_thermal_rfim snd_ti=
mer processor_thermal_mbox
>   <4>[    6.631569][  T722]  crct10dif_pclmul ecdh_generic i2c_algo_bit m=
c joydev input_leds processor_thermal_rapl snd ghash_clmulni_intel ecc fb_s=
ys_fops mei_me aesni_intel hp_wmi syscopyarea intel_rapl_common crypto_simd=
 sysfillrect platform_profile mei libarc4 sysimgblt serio_raw sparse_keymap=
 efi_pstore hid_multitouch cryptd ee1004 soundcore wmi_bmof intel_soc_dts_i=
osf mac_hid int3400_thermal int3403_thermal int340x_thermal_zone acpi_therm=
al_rel acpi_pad dptf_pch_fivr sch_fq_codel zram drm msr parport_pc ppdev lp=
 parport ip_tables x_tables autofs4 btrfs blake2b_generic xor usbhid raid6_=
pq libcrc32c hid_generic nvme nvme_core intel_lpss_pci xhci_pci crc32_pclmu=
l xhci_pci_renesas intel_lpss i2c_i801 i2c_hid_acpi vmd i2c_smbus idma64 i2=
c_hid hid wmi video pinctrl_tigerlake
>   <4>[    6.631593][  T722] CPU: 1 PID: 722 Comm: modprobe Tainted: G    =
    W         5.15.6-icetea2-stable-00459-ga2547651bc89 #1 d738e98f796accca=
080303b93ac2eee924880c33
>   <4>[    6.631594][  T722] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, =
BIOS F.15 09/15/2021
>   <4>[    6.631595][  T722] RIP: 0010:intel_tc_port_init+0x1a9/0x1b0 [i91=
5]
>   <4>[    6.631641][  T722] Code: 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 =
b0 a9 17 e0 48 c7 c1 c8 22 6b a1 4c 89 e2 48 c7 c7 5e 0f 6d a1 48 89 c6 e8 =
57 ee 58 e0 <0f> 0b e9 61 ff ff ff 0f 1f 44 00 00 48 8b 17 80 ba d3 0d 00 0=
0 0b
>   <4>[    6.631642][  T722] RSP: 0018:ffffc900017f7b08 EFLAGS: 00010296
>   <4>[    6.631643][  T722] RAX: 0000000000000031 RBX: ffff888119580000 R=
CX: 0000000000000027
>   <4>[    6.631644][  T722] RDX: ffff88846fa60c28 RSI: 0000000000000001 R=
DI: ffff88846fa60c20
>   <4>[    6.631644][  T722] RBP: 0000000000000003 R08: ffffffff82760528 R=
09: 00000000ffffdfff
>   <4>[    6.631645][  T722] R10: ffffffff82680540 R11: ffffffff82680540 R=
12: ffff888102046410
>   <4>[    6.631645][  T722] R13: 00000000ffffffff R14: ffff888119581940 R=
15: 00000000ffffffff
>   <4>[    6.631646][  T722] FS:  00007f4fd979e580(0000) GS:ffff88846fa400=
00(0000) knlGS:0000000000000000
>   <4>[    6.631647][  T722] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
>   <4>[    6.631648][  T722] CR2: 00007fe05f19fea0 CR3: 0000000119098004 C=
R4: 0000000000770ee0
>   <4>[    6.631648][  T722] PKRU: 55555554
>   <4>[    6.631649][  T722] Call Trace:
>   <4>[    6.631650][  T722]  <TASK>
>   <4>[    6.631651][  T722]  intel_ddi_init+0x663/0xba0 [i915 91e0a10445c=
c74861446c203b02c9291e0680a4b]
>   <4>[    6.631701][  T722]  intel_modeset_init_nogem+0x9a9/0x1230 [i915 =
91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.631754][  T722]  ? gen12_fwtable_read32+0x96/0x2a0 [i915 91e0=
a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.631802][  T722]  i915_driver_probe+0x6dc/0xd10 [i915 91e0a104=
45cc74861446c203b02c9291e0680a4b]
>   <4>[    6.631846][  T722]  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>   <4>[    6.631848][  T722]  ? i915_pci_probe+0x31/0x110 [i915 91e0a10445=
cc74861446c203b02c9291e0680a4b]
>   <4>[    6.631891][  T722]  local_pci_probe+0x40/0x80
>   <4>[    6.631893][  T722]  pci_device_probe+0xd9/0x190
>   <4>[    6.631895][  T722]  really_probe+0x1e9/0x3e0
>   <4>[    6.631896][  T722]  __driver_probe_device+0xfe/0x180
>   <4>[    6.631898][  T722]  driver_probe_device+0x1e/0x90
>   <4>[    6.631900][  T722]  __driver_attach+0xc1/0x1d0
>   <4>[    6.631901][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.631902][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.631904][  T722]  bus_for_each_dev+0x64/0x90
>   <4>[    6.631905][  T722]  bus_add_driver+0x12e/0x1f0
>   <4>[    6.631907][  T722]  driver_register+0x8f/0xe0
>   <4>[    6.631908][  T722]  i915_init+0x1a/0x86 [i915 91e0a10445cc748614=
46c203b02c9291e0680a4b]
>   <4>[    6.631949][  T722]  ? 0xffffffffa0e9d000
>   <4>[    6.631950][  T722]  do_one_initcall+0x59/0x210
>   <4>[    6.631951][  T722]  ? __cond_resched+0x16/0x50
>   <4>[    6.631952][  T722]  ? kmem_cache_alloc_trace+0x55/0x550
>   <4>[    6.631955][  T722]  do_init_module+0x5c/0x260
>   <4>[    6.631956][  T722]  __do_sys_finit_module+0x95/0xe0
>   <4>[    6.631959][  T722]  do_syscall_64+0x35/0xb0
>   <4>[    6.631961][  T722]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>   <4>[    6.631962][  T722] RIP: 0033:0x7f4fd98c594d
>   <4>[    6.631963][  T722] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 64 0f 00 f7 d8 64 89 0=
1 48
>   <4>[    6.631964][  T722] RSP: 002b:00007ffd955c4318 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000139
>   <4>[    6.631965][  T722] RAX: ffffffffffffffda RBX: 000055ff3b3e0980 R=
CX: 00007f4fd98c594d
>   <4>[    6.631966][  T722] RDX: 0000000000000000 RSI: 000055ff3b3cfc02 R=
DI: 0000000000000000
>   <4>[    6.631966][  T722] RBP: 0000000000040000 R08: 0000000000000000 R=
09: 0000000000000000
>   <4>[    6.631967][  T722] R10: 0000000000000000 R11: 0000000000000246 R=
12: 000055ff3b3cfc02
>   <4>[    6.631967][  T722] R13: 000055ff3b3e0a90 R14: 0000000000000000 R=
15: 000055ff3b3da910
>   <4>[    6.631971][  T722]  </TASK>
>   <4>[    6.631971][  T722] ---[ end trace a36dd53a5e689fdf ]---
>   <4>[    6.632069][  T722] ------------[ cut here ]------------
>   <4>[    6.632070][  T722] i915 0000:00:02.0: drm_WARN_ON(!tc_phy_status=
_complete(dig_port))
>   <4>[    6.632075][  T722] WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i=
915/display/intel_tc.c:531 intel_tc_port_sanitize+0x323/0x380 [i915]
>   <4>[    6.632134][  T722] Modules linked in: i915(+) snd_soc_dmic snd_s=
of_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda soundwire_intel =
soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pc=
i snd_sof_xtensa_dsp snd_sof snd_hda_ext_core snd_soc_acpi_intel_match snd_=
soc_acpi soundwire_bus ledtrig_audio snd_soc_core rtw88_8822ce snd_compress=
 ac97_bus snd_pcm_dmaengine rtw88_8822c snd_hda_intel snd_intel_dspcfg rtw8=
8_pci snd_intel_sdw_acpi rtw88_core snd_hda_codec snd_hda_core snd_hwdep in=
tel_tcc_cooling mac80211 nls_iso8859_1 snd_pcm x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_seq_midi kvm_intel snd_seq_midi_event snd_rawmidi me=
i_hdcp intel_rapl_msr ttm kvm cfg80211 drm_kms_helper snd_seq btusb btrtl b=
tbcm uvcvideo btintel bluetooth videobuf2_vmalloc videobuf2_memops videobuf=
2_v4l2 videobuf2_common videodev cec processor_thermal_device_pci_legacy pr=
ocessor_thermal_device snd_seq_device rc_core processor_thermal_rfim snd_ti=
mer processor_thermal_mbox
>   <4>[    6.632157][  T722]  crct10dif_pclmul ecdh_generic i2c_algo_bit m=
c joydev input_leds processor_thermal_rapl snd ghash_clmulni_intel ecc fb_s=
ys_fops mei_me aesni_intel hp_wmi syscopyarea intel_rapl_common crypto_simd=
 sysfillrect platform_profile mei libarc4 sysimgblt serio_raw sparse_keymap=
 efi_pstore hid_multitouch cryptd ee1004 soundcore wmi_bmof intel_soc_dts_i=
osf mac_hid int3400_thermal int3403_thermal int340x_thermal_zone acpi_therm=
al_rel acpi_pad dptf_pch_fivr sch_fq_codel zram drm msr parport_pc ppdev lp=
 parport ip_tables x_tables autofs4 btrfs blake2b_generic xor usbhid raid6_=
pq libcrc32c hid_generic nvme nvme_core intel_lpss_pci xhci_pci crc32_pclmu=
l xhci_pci_renesas intel_lpss i2c_i801 i2c_hid_acpi vmd i2c_smbus idma64 i2=
c_hid hid wmi video pinctrl_tigerlake
>   <4>[    6.632180][  T722] CPU: 1 PID: 722 Comm: modprobe Tainted: G    =
    W         5.15.6-icetea2-stable-00459-ga2547651bc89 #1 d738e98f796accca=
080303b93ac2eee924880c33
>   <4>[    6.632182][  T722] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, =
BIOS F.15 09/15/2021
>   <4>[    6.632182][  T722] RIP: 0010:intel_tc_port_sanitize+0x323/0x380 =
[i915]
>   <4>[    6.632233][  T722] Code: 4c 8b 77 50 4d 85 f6 75 03 4c 8b 37 e8 =
c6 ad 17 e0 48 c7 c1 b8 21 6b a1 4c 89 f2 48 c7 c7 5e 0f 6d a1 48 89 c6 e8 =
6d f2 58 e0 <0f> 0b 45 31 c0 e9 38 fd ff ff 48 8b 45 00 48 8b 78 08 48 8b 5=
7 50
>   <4>[    6.632234][  T722] RSP: 0018:ffffc900017f7a78 EFLAGS: 00010296
>   <4>[    6.632235][  T722] RAX: 0000000000000041 RBX: ffff88811a800000 R=
CX: 0000000000000027
>   <4>[    6.632235][  T722] RDX: ffff88846fa60c28 RSI: 0000000000000001 R=
DI: ffff88846fa60c20
>   <4>[    6.632236][  T722] RBP: ffff88810403a000 R08: ffffffff82760528 R=
09: 00000000ffffdfff
>   <4>[    6.632237][  T722] R10: ffffffff82680540 R11: ffffffff82680540 R=
12: 00000000ffffffff
>   <4>[    6.632237][  T722] R13: ffff88810403b940 R14: ffff888102046410 R=
15: ffff88811a800000
>   <4>[    6.632238][  T722] FS:  00007f4fd979e580(0000) GS:ffff88846fa400=
00(0000) knlGS:0000000000000000
>   <4>[    6.632239][  T722] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
>   <4>[    6.632240][  T722] CR2: 00007fe05f19fea0 CR3: 0000000119098004 C=
R4: 0000000000770ee0
>   <4>[    6.632241][  T722] PKRU: 55555554
>   <4>[    6.632241][  T722] Call Trace:
>   <4>[    6.632242][  T722]  <TASK>
>   <4>[    6.632242][  T722]  ? ktime_get_mono_fast_ns+0x4b/0x90
>   <4>[    6.632245][  T722]  intel_ddi_sync_state+0x40/0x90 [i915 91e0a10=
445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.632297][  T722]  intel_modeset_setup_hw_state+0x3a1/0x1960 [i=
915 91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.632353][  T722]  ? ww_mutex_lock+0x3a/0x90
>   <4>[    6.632354][  T722]  ? modeset_lock+0x90/0x1c0 [drm 096969a57ca4c=
13d209a85249bf0bc84f5e7fee4]
>   <4>[    6.632373][  T722]  ? lock_is_held_type+0xa5/0x120
>   <4>[    6.632376][  T722]  intel_modeset_init_nogem+0x394/0x1230 [i915 =
91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.632430][  T722]  ? gen12_fwtable_read32+0x96/0x2a0 [i915 91e0=
a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.632478][  T722]  i915_driver_probe+0x6dc/0xd10 [i915 91e0a104=
45cc74861446c203b02c9291e0680a4b]
>   <4>[    6.632522][  T722]  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>   <4>[    6.632523][  T722]  ? i915_pci_probe+0x31/0x110 [i915 91e0a10445=
cc74861446c203b02c9291e0680a4b]
>   <4>[    6.632564][  T722]  local_pci_probe+0x40/0x80
>   <4>[    6.632566][  T722]  pci_device_probe+0xd9/0x190
>   <4>[    6.632568][  T722]  really_probe+0x1e9/0x3e0
>   <4>[    6.632570][  T722]  __driver_probe_device+0xfe/0x180
>   <4>[    6.632571][  T722]  driver_probe_device+0x1e/0x90
>   <4>[    6.632573][  T722]  __driver_attach+0xc1/0x1d0
>   <4>[    6.632574][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.632576][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.632577][  T722]  bus_for_each_dev+0x64/0x90
>   <4>[    6.632579][  T722]  bus_add_driver+0x12e/0x1f0
>   <4>[    6.632580][  T722]  driver_register+0x8f/0xe0
>   <4>[    6.632582][  T722]  i915_init+0x1a/0x86 [i915 91e0a10445cc748614=
46c203b02c9291e0680a4b]
>   <4>[    6.632620][  T722]  ? 0xffffffffa0e9d000
>   <4>[    6.632621][  T722]  do_one_initcall+0x59/0x210
>   <4>[    6.632622][  T722]  ? __cond_resched+0x16/0x50
>   <4>[    6.632624][  T722]  ? kmem_cache_alloc_trace+0x55/0x550
>   <4>[    6.632626][  T722]  do_init_module+0x5c/0x260
>   <4>[    6.632627][  T722]  __do_sys_finit_module+0x95/0xe0
>   <4>[    6.632631][  T722]  do_syscall_64+0x35/0xb0
>   <4>[    6.632632][  T722]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>   <4>[    6.632634][  T722] RIP: 0033:0x7f4fd98c594d
>   <4>[    6.632635][  T722] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 64 0f 00 f7 d8 64 89 0=
1 48
>   <4>[    6.632636][  T722] RSP: 002b:00007ffd955c4318 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000139
>   <4>[    6.632637][  T722] RAX: ffffffffffffffda RBX: 000055ff3b3e0980 R=
CX: 00007f4fd98c594d
>   <4>[    6.632638][  T722] RDX: 0000000000000000 RSI: 000055ff3b3cfc02 R=
DI: 0000000000000000
>   <4>[    6.632638][  T722] RBP: 0000000000040000 R08: 0000000000000000 R=
09: 0000000000000000
>   <4>[    6.632639][  T722] R10: 0000000000000000 R11: 0000000000000246 R=
12: 000055ff3b3cfc02
>   <4>[    6.632640][  T722] R13: 000055ff3b3e0a90 R14: 0000000000000000 R=
15: 000055ff3b3da910
>   <4>[    6.632643][  T722]  </TASK>
>   <4>[    6.632643][  T722] ---[ end trace a36dd53a5e689fe0 ]---
>   <4>[    6.632648][  T722] ------------[ cut here ]------------
>   <4>[    6.632648][  T722] i915 0000:00:02.0: drm_WARN_ON(!tc_phy_status=
_complete(dig_port))
>   <4>[    6.632654][  T722] WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i=
915/display/intel_tc.c:531 intel_tc_port_sanitize+0x323/0x380 [i915]
>   <4>[    6.632711][  T722] Modules linked in: i915(+) snd_soc_dmic snd_s=
of_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda soundwire_intel =
soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pc=
i snd_sof_xtensa_dsp snd_sof snd_hda_ext_core snd_soc_acpi_intel_match snd_=
soc_acpi soundwire_bus ledtrig_audio snd_soc_core rtw88_8822ce snd_compress=
 ac97_bus snd_pcm_dmaengine rtw88_8822c snd_hda_intel snd_intel_dspcfg rtw8=
8_pci snd_intel_sdw_acpi rtw88_core snd_hda_codec snd_hda_core snd_hwdep in=
tel_tcc_cooling mac80211 nls_iso8859_1 snd_pcm x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_seq_midi kvm_intel snd_seq_midi_event snd_rawmidi me=
i_hdcp intel_rapl_msr ttm kvm cfg80211 drm_kms_helper snd_seq btusb btrtl b=
tbcm uvcvideo btintel bluetooth videobuf2_vmalloc videobuf2_memops videobuf=
2_v4l2 videobuf2_common videodev cec processor_thermal_device_pci_legacy pr=
ocessor_thermal_device snd_seq_device rc_core processor_thermal_rfim snd_ti=
mer processor_thermal_mbox
>   <4>[    6.632733][  T722]  crct10dif_pclmul ecdh_generic i2c_algo_bit m=
c joydev input_leds processor_thermal_rapl snd ghash_clmulni_intel ecc fb_s=
ys_fops mei_me aesni_intel hp_wmi syscopyarea intel_rapl_common crypto_simd=
 sysfillrect platform_profile mei libarc4 sysimgblt serio_raw sparse_keymap=
 efi_pstore hid_multitouch cryptd ee1004 soundcore wmi_bmof intel_soc_dts_i=
osf mac_hid int3400_thermal int3403_thermal int340x_thermal_zone acpi_therm=
al_rel acpi_pad dptf_pch_fivr sch_fq_codel zram drm msr parport_pc ppdev lp=
 parport ip_tables x_tables autofs4 btrfs blake2b_generic xor usbhid raid6_=
pq libcrc32c hid_generic nvme nvme_core intel_lpss_pci xhci_pci crc32_pclmu=
l xhci_pci_renesas intel_lpss i2c_i801 i2c_hid_acpi vmd i2c_smbus idma64 i2=
c_hid hid wmi video pinctrl_tigerlake
>   <4>[    6.632756][  T722] CPU: 1 PID: 722 Comm: modprobe Tainted: G    =
    W         5.15.6-icetea2-stable-00459-ga2547651bc89 #1 d738e98f796accca=
080303b93ac2eee924880c33
>   <4>[    6.632758][  T722] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, =
BIOS F.15 09/15/2021
>   <4>[    6.632758][  T722] RIP: 0010:intel_tc_port_sanitize+0x323/0x380 =
[i915]
>   <4>[    6.632810][  T722] Code: 4c 8b 77 50 4d 85 f6 75 03 4c 8b 37 e8 =
c6 ad 17 e0 48 c7 c1 b8 21 6b a1 4c 89 f2 48 c7 c7 5e 0f 6d a1 48 89 c6 e8 =
6d f2 58 e0 <0f> 0b 45 31 c0 e9 38 fd ff ff 48 8b 45 00 48 8b 78 08 48 8b 5=
7 50
>   <4>[    6.632811][  T722] RSP: 0018:ffffc900017f7a78 EFLAGS: 00010296
>   <4>[    6.632812][  T722] RAX: 0000000000000041 RBX: ffff88811a800000 R=
CX: 0000000000000027
>   <4>[    6.632813][  T722] RDX: ffff88846fa60c28 RSI: 0000000000000001 R=
DI: ffff88846fa60c20
>   <4>[    6.632813][  T722] RBP: ffff88810403c000 R08: ffffffff82760528 R=
09: 00000000ffffdfff
>   <4>[    6.632814][  T722] R10: ffffffff82680540 R11: ffffffff82680540 R=
12: 00000000ffffffff
>   <4>[    6.632815][  T722] R13: ffff88810403d940 R14: ffff888102046410 R=
15: ffff88811a800000
>   <4>[    6.632815][  T722] FS:  00007f4fd979e580(0000) GS:ffff88846fa400=
00(0000) knlGS:0000000000000000
>   <4>[    6.632816][  T722] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
>   <4>[    6.632817][  T722] CR2: 00007fe05f19fea0 CR3: 0000000119098004 C=
R4: 0000000000770ee0
>   <4>[    6.632817][  T722] PKRU: 55555554
>   <4>[    6.632818][  T722] Call Trace:
>   <4>[    6.632819][  T722]  <TASK>
>   <4>[    6.632819][  T722]  ? ktime_get_mono_fast_ns+0x4b/0x90
>   <4>[    6.632821][  T722]  intel_ddi_sync_state+0x40/0x90 [i915 91e0a10=
445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.632874][  T722]  intel_modeset_setup_hw_state+0x3a1/0x1960 [i=
915 91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.632929][  T722]  ? ww_mutex_lock+0x3a/0x90
>   <4>[    6.632931][  T722]  ? modeset_lock+0x90/0x1c0 [drm 096969a57ca4c=
13d209a85249bf0bc84f5e7fee4]
>   <4>[    6.632945][  T722]  ? lock_is_held_type+0xa5/0x120
>   <4>[    6.632947][  T722]  intel_modeset_init_nogem+0x394/0x1230 [i915 =
91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.632998][  T722]  ? gen12_fwtable_read32+0x96/0x2a0 [i915 91e0=
a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.633047][  T722]  i915_driver_probe+0x6dc/0xd10 [i915 91e0a104=
45cc74861446c203b02c9291e0680a4b]
>   <4>[    6.633091][  T722]  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>   <4>[    6.633092][  T722]  ? i915_pci_probe+0x31/0x110 [i915 91e0a10445=
cc74861446c203b02c9291e0680a4b]
>   <4>[    6.633140][  T722]  local_pci_probe+0x40/0x80
>   <4>[    6.633142][  T722]  pci_device_probe+0xd9/0x190
>   <4>[    6.633146][  T722]  really_probe+0x1e9/0x3e0
>   <4>[    6.633148][  T722]  __driver_probe_device+0xfe/0x180
>   <4>[    6.633150][  T722]  driver_probe_device+0x1e/0x90
>   <4>[    6.633151][  T722]  __driver_attach+0xc1/0x1d0
>   <4>[    6.633153][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.633154][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.633155][  T722]  bus_for_each_dev+0x64/0x90
>   <4>[    6.633157][  T722]  bus_add_driver+0x12e/0x1f0
>   <4>[    6.633159][  T722]  driver_register+0x8f/0xe0
>   <4>[    6.633160][  T722]  i915_init+0x1a/0x86 [i915 91e0a10445cc748614=
46c203b02c9291e0680a4b]
>   <4>[    6.633200][  T722]  ? 0xffffffffa0e9d000
>   <4>[    6.633201][  T722]  do_one_initcall+0x59/0x210
>   <4>[    6.633203][  T722]  ? __cond_resched+0x16/0x50
>   <4>[    6.633204][  T722]  ? kmem_cache_alloc_trace+0x55/0x550
>   <4>[    6.633206][  T722]  do_init_module+0x5c/0x260
>   <4>[    6.633208][  T722]  __do_sys_finit_module+0x95/0xe0
>   <4>[    6.633211][  T722]  do_syscall_64+0x35/0xb0
>   <4>[    6.633213][  T722]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>   <4>[    6.633214][  T722] RIP: 0033:0x7f4fd98c594d
>   <4>[    6.633215][  T722] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 64 0f 00 f7 d8 64 89 0=
1 48
>   <4>[    6.633216][  T722] RSP: 002b:00007ffd955c4318 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000139
>   <4>[    6.633217][  T722] RAX: ffffffffffffffda RBX: 000055ff3b3e0980 R=
CX: 00007f4fd98c594d
>   <4>[    6.633218][  T722] RDX: 0000000000000000 RSI: 000055ff3b3cfc02 R=
DI: 0000000000000000
>   <4>[    6.633218][  T722] RBP: 0000000000040000 R08: 0000000000000000 R=
09: 0000000000000000
>   <4>[    6.633219][  T722] R10: 0000000000000000 R11: 0000000000000246 R=
12: 000055ff3b3cfc02
>   <4>[    6.633220][  T722] R13: 000055ff3b3e0a90 R14: 0000000000000000 R=
15: 000055ff3b3da910
>   <4>[    6.633223][  T722]  </TASK>
>   <4>[    6.633223][  T722] ---[ end trace a36dd53a5e689fe1 ]---
>   <4>[    6.633228][  T722] ------------[ cut here ]------------
>   <4>[    6.633228][  T722] i915 0000:00:02.0: drm_WARN_ON(!tc_phy_status=
_complete(dig_port))
>   <4>[    6.633234][  T722] WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i=
915/display/intel_tc.c:531 intel_tc_port_sanitize+0x323/0x380 [i915]
>   <4>[    6.633287][  T722] Modules linked in: i915(+) snd_soc_dmic snd_s=
of_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda soundwire_intel =
soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pc=
i snd_sof_xtensa_dsp snd_sof snd_hda_ext_core snd_soc_acpi_intel_match snd_=
soc_acpi soundwire_bus ledtrig_audio snd_soc_core rtw88_8822ce snd_compress=
 ac97_bus snd_pcm_dmaengine rtw88_8822c snd_hda_intel snd_intel_dspcfg rtw8=
8_pci snd_intel_sdw_acpi rtw88_core snd_hda_codec snd_hda_core snd_hwdep in=
tel_tcc_cooling mac80211 nls_iso8859_1 snd_pcm x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_seq_midi kvm_intel snd_seq_midi_event snd_rawmidi me=
i_hdcp intel_rapl_msr ttm kvm cfg80211 drm_kms_helper snd_seq btusb btrtl b=
tbcm uvcvideo btintel bluetooth videobuf2_vmalloc videobuf2_memops videobuf=
2_v4l2 videobuf2_common videodev cec processor_thermal_device_pci_legacy pr=
ocessor_thermal_device snd_seq_device rc_core processor_thermal_rfim snd_ti=
mer processor_thermal_mbox
>   <4>[    6.633309][  T722]  crct10dif_pclmul ecdh_generic i2c_algo_bit m=
c joydev input_leds processor_thermal_rapl snd ghash_clmulni_intel ecc fb_s=
ys_fops mei_me aesni_intel hp_wmi syscopyarea intel_rapl_common crypto_simd=
 sysfillrect platform_profile mei libarc4 sysimgblt serio_raw sparse_keymap=
 efi_pstore hid_multitouch cryptd ee1004 soundcore wmi_bmof intel_soc_dts_i=
osf mac_hid int3400_thermal int3403_thermal int340x_thermal_zone acpi_therm=
al_rel acpi_pad dptf_pch_fivr sch_fq_codel zram drm msr parport_pc ppdev lp=
 parport ip_tables x_tables autofs4 btrfs blake2b_generic xor usbhid raid6_=
pq libcrc32c hid_generic nvme nvme_core intel_lpss_pci xhci_pci crc32_pclmu=
l xhci_pci_renesas intel_lpss i2c_i801 i2c_hid_acpi vmd i2c_smbus idma64 i2=
c_hid hid wmi video pinctrl_tigerlake
>   <4>[    6.633334][  T722] CPU: 1 PID: 722 Comm: modprobe Tainted: G    =
    W         5.15.6-icetea2-stable-00459-ga2547651bc89 #1 d738e98f796accca=
080303b93ac2eee924880c33
>   <4>[    6.633335][  T722] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, =
BIOS F.15 09/15/2021
>   <4>[    6.633336][  T722] RIP: 0010:intel_tc_port_sanitize+0x323/0x380 =
[i915]
>   <4>[    6.633385][  T722] Code: 4c 8b 77 50 4d 85 f6 75 03 4c 8b 37 e8 =
c6 ad 17 e0 48 c7 c1 b8 21 6b a1 4c 89 f2 48 c7 c7 5e 0f 6d a1 48 89 c6 e8 =
6d f2 58 e0 <0f> 0b 45 31 c0 e9 38 fd ff ff 48 8b 45 00 48 8b 78 08 48 8b 5=
7 50
>   <4>[    6.633386][  T722] RSP: 0018:ffffc900017f7a78 EFLAGS: 00010296
>   <4>[    6.633387][  T722] RAX: 0000000000000041 RBX: ffff88811a800000 R=
CX: 0000000000000027
>   <4>[    6.633388][  T722] RDX: ffff88846fa60c28 RSI: 0000000000000001 R=
DI: ffff88846fa60c20
>   <4>[    6.633388][  T722] RBP: ffff88810403e000 R08: ffffffff82760528 R=
09: 00000000ffffdfff
>   <4>[    6.633389][  T722] R10: ffffffff82680540 R11: ffffffff82680540 R=
12: 00000000ffffffff
>   <4>[    6.633389][  T722] R13: ffff88810403f940 R14: ffff888102046410 R=
15: ffff88811a800000
>   <4>[    6.633390][  T722] FS:  00007f4fd979e580(0000) GS:ffff88846fa400=
00(0000) knlGS:0000000000000000
>   <4>[    6.633391][  T722] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
>   <4>[    6.633392][  T722] CR2: 00007fe05f19fea0 CR3: 0000000119098004 C=
R4: 0000000000770ee0
>   <4>[    6.633392][  T722] PKRU: 55555554
>   <4>[    6.633393][  T722] Call Trace:
>   <4>[    6.633393][  T722]  <TASK>
>   <4>[    6.633394][  T722]  ? ktime_get_mono_fast_ns+0x4b/0x90
>   <4>[    6.633396][  T722]  intel_ddi_sync_state+0x40/0x90 [i915 91e0a10=
445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.633445][  T722]  intel_modeset_setup_hw_state+0x3a1/0x1960 [i=
915 91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.633499][  T722]  ? ww_mutex_lock+0x3a/0x90
>   <4>[    6.633501][  T722]  ? modeset_lock+0x90/0x1c0 [drm 096969a57ca4c=
13d209a85249bf0bc84f5e7fee4]
>   <4>[    6.633515][  T722]  ? lock_is_held_type+0xa5/0x120
>   <4>[    6.633517][  T722]  intel_modeset_init_nogem+0x394/0x1230 [i915 =
91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.633569][  T722]  ? gen12_fwtable_read32+0x96/0x2a0 [i915 91e0=
a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.633617][  T722]  i915_driver_probe+0x6dc/0xd10 [i915 91e0a104=
45cc74861446c203b02c9291e0680a4b]
>   <4>[    6.633661][  T722]  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>   <4>[    6.633663][  T722]  ? i915_pci_probe+0x31/0x110 [i915 91e0a10445=
cc74861446c203b02c9291e0680a4b]
>   <4>[    6.633707][  T722]  local_pci_probe+0x40/0x80
>   <4>[    6.633709][  T722]  pci_device_probe+0xd9/0x190
>   <4>[    6.633711][  T722]  really_probe+0x1e9/0x3e0
>   <4>[    6.633713][  T722]  __driver_probe_device+0xfe/0x180
>   <4>[    6.633714][  T722]  driver_probe_device+0x1e/0x90
>   <4>[    6.633716][  T722]  __driver_attach+0xc1/0x1d0
>   <4>[    6.633717][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.633719][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.633720][  T722]  bus_for_each_dev+0x64/0x90
>   <4>[    6.633722][  T722]  bus_add_driver+0x12e/0x1f0
>   <4>[    6.633723][  T722]  driver_register+0x8f/0xe0
>   <4>[    6.633725][  T722]  i915_init+0x1a/0x86 [i915 91e0a10445cc748614=
46c203b02c9291e0680a4b]
>   <4>[    6.633764][  T722]  ? 0xffffffffa0e9d000
>   <4>[    6.633765][  T722]  do_one_initcall+0x59/0x210
>   <4>[    6.633767][  T722]  ? __cond_resched+0x16/0x50
>   <4>[    6.633768][  T722]  ? kmem_cache_alloc_trace+0x55/0x550
>   <4>[    6.633770][  T722]  do_init_module+0x5c/0x260
>   <4>[    6.633772][  T722]  __do_sys_finit_module+0x95/0xe0
>   <4>[    6.633775][  T722]  do_syscall_64+0x35/0xb0
>   <4>[    6.633776][  T722]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>   <4>[    6.633778][  T722] RIP: 0033:0x7f4fd98c594d
>   <4>[    6.633779][  T722] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 64 0f 00 f7 d8 64 89 0=
1 48
>   <4>[    6.633780][  T722] RSP: 002b:00007ffd955c4318 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000139
>   <4>[    6.633781][  T722] RAX: ffffffffffffffda RBX: 000055ff3b3e0980 R=
CX: 00007f4fd98c594d
>   <4>[    6.633781][  T722] RDX: 0000000000000000 RSI: 000055ff3b3cfc02 R=
DI: 0000000000000000
>   <4>[    6.633782][  T722] RBP: 0000000000040000 R08: 0000000000000000 R=
09: 0000000000000000
>   <4>[    6.633783][  T722] R10: 0000000000000000 R11: 0000000000000246 R=
12: 000055ff3b3cfc02
>   <4>[    6.633783][  T722] R13: 000055ff3b3e0a90 R14: 0000000000000000 R=
15: 000055ff3b3da910
>   <4>[    6.633786][  T722]  </TASK>
>   <4>[    6.633787][  T722] ---[ end trace a36dd53a5e689fe2 ]---
>   <4>[    6.633792][  T722] ------------[ cut here ]------------
>   <4>[    6.633792][  T722] i915 0000:00:02.0: drm_WARN_ON(!tc_phy_status=
_complete(dig_port))
>   <4>[    6.633797][  T722] WARNING: CPU: 1 PID: 722 at drivers/gpu/drm/i=
915/display/intel_tc.c:531 intel_tc_port_sanitize+0x323/0x380 [i915]
>   <4>[    6.633855][  T722] Modules linked in: i915(+) snd_soc_dmic snd_s=
of_pci_intel_tgl snd_sof_intel_hda_common snd_soc_hdac_hda soundwire_intel =
soundwire_generic_allocation soundwire_cadence snd_sof_intel_hda snd_sof_pc=
i snd_sof_xtensa_dsp snd_sof snd_hda_ext_core snd_soc_acpi_intel_match snd_=
soc_acpi soundwire_bus ledtrig_audio snd_soc_core rtw88_8822ce snd_compress=
 ac97_bus snd_pcm_dmaengine rtw88_8822c snd_hda_intel snd_intel_dspcfg rtw8=
8_pci snd_intel_sdw_acpi rtw88_core snd_hda_codec snd_hda_core snd_hwdep in=
tel_tcc_cooling mac80211 nls_iso8859_1 snd_pcm x86_pkg_temp_thermal intel_p=
owerclamp coretemp snd_seq_midi kvm_intel snd_seq_midi_event snd_rawmidi me=
i_hdcp intel_rapl_msr ttm kvm cfg80211 drm_kms_helper snd_seq btusb btrtl b=
tbcm uvcvideo btintel bluetooth videobuf2_vmalloc videobuf2_memops videobuf=
2_v4l2 videobuf2_common videodev cec processor_thermal_device_pci_legacy pr=
ocessor_thermal_device snd_seq_device rc_core processor_thermal_rfim snd_ti=
mer processor_thermal_mbox
>   <4>[    6.633877][  T722]  crct10dif_pclmul ecdh_generic i2c_algo_bit m=
c joydev input_leds processor_thermal_rapl snd ghash_clmulni_intel ecc fb_s=
ys_fops mei_me aesni_intel hp_wmi syscopyarea intel_rapl_common crypto_simd=
 sysfillrect platform_profile mei libarc4 sysimgblt serio_raw sparse_keymap=
 efi_pstore hid_multitouch cryptd ee1004 soundcore wmi_bmof intel_soc_dts_i=
osf mac_hid int3400_thermal int3403_thermal int340x_thermal_zone acpi_therm=
al_rel acpi_pad dptf_pch_fivr sch_fq_codel zram drm msr parport_pc ppdev lp=
 parport ip_tables x_tables autofs4 btrfs blake2b_generic xor usbhid raid6_=
pq libcrc32c hid_generic nvme nvme_core intel_lpss_pci xhci_pci crc32_pclmu=
l xhci_pci_renesas intel_lpss i2c_i801 i2c_hid_acpi vmd i2c_smbus idma64 i2=
c_hid hid wmi video pinctrl_tigerlake
>   <4>[    6.633901][  T722] CPU: 1 PID: 722 Comm: modprobe Tainted: G    =
    W         5.15.6-icetea2-stable-00459-ga2547651bc89 #1 d738e98f796accca=
080303b93ac2eee924880c33
>   <4>[    6.633902][  T722] Hardware name: HP HP Laptop 14s-dq2xxx/87FD, =
BIOS F.15 09/15/2021
>   <4>[    6.633903][  T722] RIP: 0010:intel_tc_port_sanitize+0x323/0x380 =
[i915]
>   <4>[    6.633953][  T722] Code: 4c 8b 77 50 4d 85 f6 75 03 4c 8b 37 e8 =
c6 ad 17 e0 48 c7 c1 b8 21 6b a1 4c 89 f2 48 c7 c7 5e 0f 6d a1 48 89 c6 e8 =
6d f2 58 e0 <0f> 0b 45 31 c0 e9 38 fd ff ff 48 8b 45 00 48 8b 78 08 48 8b 5=
7 50
>   <4>[    6.633954][  T722] RSP: 0018:ffffc900017f7a78 EFLAGS: 00010296
>   <4>[    6.633955][  T722] RAX: 0000000000000041 RBX: ffff88811a800000 R=
CX: 0000000000000027
>   <4>[    6.633956][  T722] RDX: ffff88846fa60c28 RSI: 0000000000000001 R=
DI: ffff88846fa60c20
>   <4>[    6.633956][  T722] RBP: ffff888119580000 R08: ffffffff82760528 R=
09: 00000000ffffdfff
>   <4>[    6.633957][  T722] R10: ffffffff82680540 R11: ffffffff82680540 R=
12: 00000000ffffffff
>   <4>[    6.633957][  T722] R13: ffff888119581940 R14: ffff888102046410 R=
15: ffff88811a800000
>   <4>[    6.633958][  T722] FS:  00007f4fd979e580(0000) GS:ffff88846fa400=
00(0000) knlGS:0000000000000000
>   <4>[    6.633959][  T722] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
>   <4>[    6.633960][  T722] CR2: 00007fe05f19fea0 CR3: 0000000119098004 C=
R4: 0000000000770ee0
>   <4>[    6.633960][  T722] PKRU: 55555554
>   <4>[    6.633961][  T722] Call Trace:
>   <4>[    6.633961][  T722]  <TASK>
>   <4>[    6.633962][  T722]  ? ktime_get_mono_fast_ns+0x4b/0x90
>   <4>[    6.633964][  T722]  intel_ddi_sync_state+0x40/0x90 [i915 91e0a10=
445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.634016][  T722]  intel_modeset_setup_hw_state+0x3a1/0x1960 [i=
915 91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.634072][  T722]  ? ww_mutex_lock+0x3a/0x90
>   <4>[    6.634074][  T722]  ? modeset_lock+0x90/0x1c0 [drm 096969a57ca4c=
13d209a85249bf0bc84f5e7fee4]
>   <4>[    6.634088][  T722]  ? lock_is_held_type+0xa5/0x120
>   <4>[    6.634090][  T722]  intel_modeset_init_nogem+0x394/0x1230 [i915 =
91e0a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.634144][  T722]  ? gen12_fwtable_read32+0x96/0x2a0 [i915 91e0=
a10445cc74861446c203b02c9291e0680a4b]
>   <4>[    6.634191][  T722]  i915_driver_probe+0x6dc/0xd10 [i915 91e0a104=
45cc74861446c203b02c9291e0680a4b]
>   <4>[    6.634231][  T722]  ? vga_switcheroo_client_probe_defer+0x1f/0x40
>   <4>[    6.634232][  T722]  ? i915_pci_probe+0x31/0x110 [i915 91e0a10445=
cc74861446c203b02c9291e0680a4b]
>   <4>[    6.634272][  T722]  local_pci_probe+0x40/0x80
>   <4>[    6.634274][  T722]  pci_device_probe+0xd9/0x190
>   <4>[    6.634276][  T722]  really_probe+0x1e9/0x3e0
>   <4>[    6.634278][  T722]  __driver_probe_device+0xfe/0x180
>   <4>[    6.634279][  T722]  driver_probe_device+0x1e/0x90
>   <4>[    6.634281][  T722]  __driver_attach+0xc1/0x1d0
>   <4>[    6.634282][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.634283][  T722]  ? __device_attach_driver+0xd0/0xd0
>   <4>[    6.634284][  T722]  bus_for_each_dev+0x64/0x90
>   <4>[    6.634286][  T722]  bus_add_driver+0x12e/0x1f0
>   <4>[    6.634288][  T722]  driver_register+0x8f/0xe0
>   <4>[    6.634289][  T722]  i915_init+0x1a/0x86 [i915 91e0a10445cc748614=
46c203b02c9291e0680a4b]
>   <4>[    6.634327][  T722]  ? 0xffffffffa0e9d000
>   <4>[    6.634328][  T722]  do_one_initcall+0x59/0x210
>   <4>[    6.634330][  T722]  ? __cond_resched+0x16/0x50
>   <4>[    6.634331][  T722]  ? kmem_cache_alloc_trace+0x55/0x550
>   <4>[    6.634333][  T722]  do_init_module+0x5c/0x260
>   <4>[    6.634335][  T722]  __do_sys_finit_module+0x95/0xe0
>   <4>[    6.634338][  T722]  do_syscall_64+0x35/0xb0
>   <4>[    6.634339][  T722]  entry_SYSCALL_64_after_hwframe+0x44/0xae
>   <4>[    6.634341][  T722] RIP: 0033:0x7f4fd98c594d
>   <4>[    6.634342][  T722] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 =
f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c =
24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b3 64 0f 00 f7 d8 64 89 0=
1 48
>   <4>[    6.634343][  T722] RSP: 002b:00007ffd955c4318 EFLAGS: 00000246 O=
RIG_RAX: 0000000000000139
>   <4>[    6.634344][  T722] RAX: ffffffffffffffda RBX: 000055ff3b3e0980 R=
CX: 00007f4fd98c594d
>   <4>[    6.634344][  T722] RDX: 0000000000000000 RSI: 000055ff3b3cfc02 R=
DI: 0000000000000000
>   <4>[    6.634345][  T722] RBP: 0000000000040000 R08: 0000000000000000 R=
09: 0000000000000000
>   <4>[    6.634346][  T722] R10: 0000000000000000 R11: 0000000000000246 R=
12: 000055ff3b3cfc02
>   <4>[    6.634346][  T722] R13: 000055ff3b3e0a90 R14: 0000000000000000 R=
15: 000055ff3b3da910
>   <4>[    6.634349][  T722]  </TASK>
>   <4>[    6.634350][  T722] ---[ end trace a36dd53a5e689fe3 ]---
>=20
> --=20
> Ammar Faizi
>=20
