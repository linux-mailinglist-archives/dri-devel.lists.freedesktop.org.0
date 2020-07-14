Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CDE21EA05
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA8489D4B;
	Tue, 14 Jul 2020 07:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 584AF89D4B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 07:27:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208539] New: Warning at drm_mod_object_add on when display is
 re-enabled (after display off)
Date: Tue, 14 Jul 2020 07:27:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dl9pf@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression
Message-ID: <bug-208539-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208539

            Bug ID: 208539
           Summary: Warning at drm_mod_object_add on when display is
                    re-enabled (after display off)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.8.0-rc5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dl9pf@gmx.de
                CC: dl9pf@gmx.de
        Regression: Yes

[78580.431312] [drm] DM_MST: starting TM on aconnector: 00000000d383a98b [id:
67]
[78580.744579] ------------[ cut here ]------------
[78580.744595] WARNING: CPU: 2 PID: 23119 at
drivers/gpu/drm/drm_mode_object.c:45 drm_mode_object_add+0x75/0x80 [drm]
[78580.744595] Modules linked in: fuse(E) rfcomm(E) tun(E) af_packet(E)
xt_tcpudp(E) ip6t_REJECT(E) nf_reject_ipv6(E) ip6t_rpfilter(E) ipt_REJECT(E)
nf_reject_ipv4(E) xt_conntrack(E) ebtable_nat(E) ebtable_broute(E)
ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) ip6table_security(E)
iptable_nat(E) nf_nat(E) iptable_mangle(E) iptable_raw(E) iptable_security(E)
nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) iscsi_ibft(E)
iscsi_boot_sysfs(E) ip_set(E) nfnetlink(E) ebtable_filter(E) ebtables(E)
ip6table_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E)
dmi_sysfs(E) cmac(E) algif_hash(E) algif_skcipher(E) af_alg(E) bnep(E) msr(E)
intel_rapl_msr(E) intel_rapl_common(E) hid_logitech_hidpp(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) iTCO_wdt(E) coretemp(E) ee1004(E)
iTCO_vendor_support(E) kvm_intel(E) tps6598x(E) mei_hdcp(E) roles(E) typec(E)
kvm(E) irqbypass(E) crct10dif_pclmul(E) crc32_pclmul(E) nls_iso8859_1(E)
ghash_clmulni_intel(E) nls_cp437(E) aesni_intel(E)
[78580.744607]  crypto_simd(E) vfat(E) cryptd(E) fat(E) glue_helper(E)
pcspkr(E) intel_wmi_thunderbolt(E) wmi_bmof(E) deflate(E) i2c_i801(E)
efi_pstore(E) e1000e(E) i2c_smbus(E) iwlwifi(E) btusb(E) cdc_ether(E) btrtl(E)
usbnet(E) btbcm(E) btintel(E) igb(E) cfg80211(E) ptp(E) bluetooth(E) r8152(E)
mei_me(E) pps_core(E) dca(E) mei(E) ecdh_generic(E) mii(E) uvcvideo(E)
videobuf2_vmalloc(E) rfkill(E) videobuf2_memops(E) ecc(E) videobuf2_v4l2(E)
uas(E) snd_hda_codec_realtek(E) videobuf2_common(E) snd_hda_codec_generic(E)
videodev(E) ledtrig_audio(E) usb_storage(E) snd_hda_codec_hdmi(E)
snd_usb_audio(E) snd_hda_intel(E) snd_usbmidi_lib(E) snd_intel_dspcfg(E)
snd_rawmidi(E) snd_seq_device(E) intel_lpss_pci(E) hid_logitech_dj(E)
intel_lpss(E) joydev(E) mc(E) idma64(E) snd_hda_codec(E) ir_rc6_decoder(E)
snd_hda_core(E) intel_pch_thermal(E) snd_hwdep(E) snd_pcm(E) snd_timer(E)
snd(E) soundcore(E) thermal(E) fan(E) i2c_multi_instantiate(E) rc_rc6_mce(E)
ite_cir(E) rc_core(E) button(E) acpi_pad(E)
[78580.744620]  btrfs(E) blake2b_generic(E) libcrc32c(E) xor(E) hid_generic(E)
usbhid(E) raid6_pq(E) crc32c_intel(E) xhci_pci(E) serio_raw(E) sdhci_pci(E)
xhci_hcd(E) cqhci(E) sdhci(E) usbcore(E) mmc_core(E) wmi(E) video(E)
pinctrl_sunrisepoint(E) pinctrl_intel(E) amdgpu(E) iommu_v2(E) gpu_sched(E)
i2c_algo_bit(E) ttm(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E)
sysimgblt(E) fb_sys_fops(E) cec(E) drm(E) sg(E) dm_multipath(E) dm_mod(E)
scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) efivarfs(E)
[78580.744628] CPU: 2 PID: 23119 Comm: kworker/2:2 Tainted: G        W   E    
5.8.0-rc5-1-default-20200713-0948 #1
[78580.744629] Hardware name: Intel Corporation NUC8i7HVK/NUC8i7HVB, BIOS
HNKBLi70.86A.0054.2019.0214.1350 02/14/2019
[78580.744636] Workqueue: events_long drm_dp_mst_link_probe_work
[drm_kms_helper]
[78580.744645] RIP: 0010:drm_mode_object_add+0x75/0x80 [drm]
[78580.744646] Code: 85 c0 78 07 89 45 00 44 89 65 04 4c 89 ef e8 f2 9e ef f6
85 db b8 00 00 00 00 0f 4e c3 5b 5d 41 5c 41 5d c3 80 7f 60 00 74 a9 <0f> 0b eb
a5 0f 1f 80 00 00 00 00 0f 1f 44 00 00 41 54 4c 8d a7 f8
[78580.744647] RSP: 0000:ffffa66f44b43b18 EFLAGS: 00010202
[78580.744648] RAX: ffffffffc0ab3120 RBX: ffff8ba6c7611000 RCX:
0000000000000007
[78580.744648] RDX: 00000000e0e0e0e0 RSI: ffff8babddd0b218 RDI:
ffff8ba6c7611000
[78580.744648] RBP: ffff8babddd0b218 R08: 0000000000000000 R09:
ffff8babddd0b200
[78580.744649] R10: 0000000000000000 R11: ffffa66f44b43c08 R12:
00000000e0e0e0e0
[78580.744649] R13: 0000000000000007 R14: ffffffffc0929e00 R15:
ffff8babddd0b218
[78580.744650] FS:  0000000000000000(0000) GS:ffff8bae1ec80000(0000)
knlGS:0000000000000000
[78580.744650] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[78580.744651] CR2: 00007f948d2c95c0 CR3: 00000008444e0004 CR4:
00000000003606e0
[78580.744651] Call Trace:
[78580.744662]  drm_encoder_init+0x49/0x160 [drm]
[78580.744664]  ? _cond_resched+0x16/0x40
[78580.744666]  ? kmem_cache_alloc_trace+0x14b/0x200
[78580.744741]  dm_dp_add_mst_connector+0x114/0x1e0 [amdgpu]
[78580.744747]  drm_dp_mst_port_add_connector+0x52/0xe0 [drm_kms_helper]
[78580.744749]  ? acpi_os_signal_semaphore+0x70/0x80
[78580.744750]  ? acpi_ut_release_mutex+0x13e/0x145
[78580.744751]  ? _cond_resched+0x16/0x40
[78580.744753]  ? klist_next+0x136/0x140
[78580.744754]  ? __process_new_driver+0x20/0x20
[78580.744756]  ? bus_for_each_drv+0x82/0xa0
[78580.744757]  ? i2c_register_adapter+0x1b1/0x370
[78580.744761]  ? drm_dp_port_set_pdt+0x115/0x2a0 [drm_kms_helper]
[78580.744765]  drm_dp_mst_handle_link_address_port+0x2cf/0x4b0
[drm_kms_helper]
[78580.744770]  drm_dp_send_link_address+0x1a5/0x370 [drm_kms_helper]
[78580.744771]  ? __queue_work+0x1e0/0x370
[78580.744775]  drm_dp_check_and_send_link_address+0xad/0xd0 [drm_kms_helper]
[78580.744778]  drm_dp_mst_link_probe_work+0x94/0x180 [drm_kms_helper]
[78580.744780]  process_one_work+0x1e3/0x3b0
[78580.744781]  worker_thread+0x46/0x340
[78580.744782]  ? process_one_work+0x3b0/0x3b0
[78580.744783]  kthread+0x119/0x140
[78580.744784]  ? __kthread_bind_mask+0x60/0x60
[78580.744786]  ret_from_fork+0x22/0x30
[78580.744787] ---[ end trace 439e8523e829733f ]---
[78581.000232] ------------[ cut here ]------------
[78581.000257] WARNING: CPU: 2 PID: 23119 at
drivers/gpu/drm/drm_mode_object.c:45 drm_mode_object_add+0x75/0x80 [drm]
[78581.000258] Modules linked in: fuse(E) rfcomm(E) tun(E) af_packet(E)
xt_tcpudp(E) ip6t_REJECT(E) nf_reject_ipv6(E) ip6t_rpfilter(E) ipt_REJECT(E)
nf_reject_ipv4(E) xt_conntrack(E) ebtable_nat(E) ebtable_broute(E)
ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) ip6table_security(E)
iptable_nat(E) nf_nat(E) iptable_mangle(E) iptable_raw(E) iptable_security(E)
nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) iscsi_ibft(E)
iscsi_boot_sysfs(E) ip_set(E) nfnetlink(E) ebtable_filter(E) ebtables(E)
ip6table_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E)
dmi_sysfs(E) cmac(E) algif_hash(E) algif_skcipher(E) af_alg(E) bnep(E) msr(E)
intel_rapl_msr(E) intel_rapl_common(E) hid_logitech_hidpp(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) iTCO_wdt(E) coretemp(E) ee1004(E)
iTCO_vendor_support(E) kvm_intel(E) tps6598x(E) mei_hdcp(E) roles(E) typec(E)
kvm(E) irqbypass(E) crct10dif_pclmul(E) crc32_pclmul(E) nls_iso8859_1(E)
ghash_clmulni_intel(E) nls_cp437(E) aesni_intel(E)
[78581.000281]  crypto_simd(E) vfat(E) cryptd(E) fat(E) glue_helper(E)
pcspkr(E) intel_wmi_thunderbolt(E) wmi_bmof(E) deflate(E) i2c_i801(E)
efi_pstore(E) e1000e(E) i2c_smbus(E) iwlwifi(E) btusb(E) cdc_ether(E) btrtl(E)
usbnet(E) btbcm(E) btintel(E) igb(E) cfg80211(E) ptp(E) bluetooth(E) r8152(E)
mei_me(E) pps_core(E) dca(E) mei(E) ecdh_generic(E) mii(E) uvcvideo(E)
videobuf2_vmalloc(E) rfkill(E) videobuf2_memops(E) ecc(E) videobuf2_v4l2(E)
uas(E) snd_hda_codec_realtek(E) videobuf2_common(E) snd_hda_codec_generic(E)
videodev(E) ledtrig_audio(E) usb_storage(E) snd_hda_codec_hdmi(E)
snd_usb_audio(E) snd_hda_intel(E) snd_usbmidi_lib(E) snd_intel_dspcfg(E)
snd_rawmidi(E) snd_seq_device(E) intel_lpss_pci(E) hid_logitech_dj(E)
intel_lpss(E) joydev(E) mc(E) idma64(E) snd_hda_codec(E) ir_rc6_decoder(E)
snd_hda_core(E) intel_pch_thermal(E) snd_hwdep(E) snd_pcm(E) snd_timer(E)
snd(E) soundcore(E) thermal(E) fan(E) i2c_multi_instantiate(E) rc_rc6_mce(E)
ite_cir(E) rc_core(E) button(E) acpi_pad(E)
[78581.000310]  btrfs(E) blake2b_generic(E) libcrc32c(E) xor(E) hid_generic(E)
usbhid(E) raid6_pq(E) crc32c_intel(E) xhci_pci(E) serio_raw(E) sdhci_pci(E)
xhci_hcd(E) cqhci(E) sdhci(E) usbcore(E) mmc_core(E) wmi(E) video(E)
pinctrl_sunrisepoint(E) pinctrl_intel(E) amdgpu(E) iommu_v2(E) gpu_sched(E)
i2c_algo_bit(E) ttm(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E)
sysimgblt(E) fb_sys_fops(E) cec(E) drm(E) sg(E) dm_multipath(E) dm_mod(E)
scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) efivarfs(E)
[78581.000326] CPU: 2 PID: 23119 Comm: kworker/2:2 Tainted: G        W   E    
5.8.0-rc5-1-default-20200713-0948 #1
[78581.000326] Hardware name: Intel Corporation NUC8i7HVK/NUC8i7HVB, BIOS
HNKBLi70.86A.0054.2019.0214.1350 02/14/2019
[78581.000335] Workqueue: events_long drm_dp_mst_link_probe_work
[drm_kms_helper]
[78581.000346] RIP: 0010:drm_mode_object_add+0x75/0x80 [drm]
[78581.000347] Code: 85 c0 78 07 89 45 00 44 89 65 04 4c 89 ef e8 f2 9e ef f6
85 db b8 00 00 00 00 0f 4e c3 5b 5d 41 5c 41 5d c3 80 7f 60 00 74 a9 <0f> 0b eb
a5 0f 1f 80 00 00 00 00 0f 1f 44 00 00 41 54 4c 8d a7 f8
[78581.000348] RSP: 0018:ffffa66f44b43b18 EFLAGS: 00010202
[78581.000348] RAX: ffffffffc0ab3120 RBX: ffff8ba6c7611000 RCX:
0000000000000007
[78581.000349] RDX: 00000000e0e0e0e0 RSI: ffff8babddd08a18 RDI:
ffff8ba6c7611000
[78581.000349] RBP: ffff8babddd08a18 R08: 0000000000000000 R09:
ffff8babddd08a00
[78581.000350] R10: 0000000000000000 R11: ffffffffb8338420 R12:
00000000e0e0e0e0
[78581.000350] R13: 0000000000000007 R14: ffffffffc0929e00 R15:
ffff8babddd08a18
[78581.000351] FS:  0000000000000000(0000) GS:ffff8bae1ec80000(0000)
knlGS:0000000000000000
[78581.000351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[78581.000352] CR2: 00007f856fc25000 CR3: 000000076c170001 CR4:
00000000003606e0
[78581.000352] Call Trace:
[78581.000363]  drm_encoder_init+0x49/0x160 [drm]
[78581.000366]  ? _cond_resched+0x16/0x40
[78581.000368]  ? kmem_cache_alloc_trace+0x14b/0x200
[78581.000461]  dm_dp_add_mst_connector+0x114/0x1e0 [amdgpu]
[78581.000467]  drm_dp_mst_port_add_connector+0x52/0xe0 [drm_kms_helper]
[78581.000470]  ? acpi_os_signal_semaphore+0x70/0x80
[78581.000471]  ? acpi_ut_release_mutex+0x13e/0x145
[78581.000472]  ? _cond_resched+0x16/0x40
[78581.000474]  ? klist_next+0x136/0x140
[78581.000476]  ? __process_new_driver+0x20/0x20
[78581.000477]  ? bus_for_each_drv+0x82/0xa0
[78581.000478]  ? _cond_resched+0x16/0x40
[78581.000479]  ? kmem_cache_alloc_trace+0x14b/0x200
[78581.000483]  ? drm_dp_mst_add_port+0x2f/0xe0 [drm_kms_helper]
[78581.000487]  drm_dp_mst_handle_link_address_port+0x2cf/0x4b0
[drm_kms_helper]
[78581.000492]  drm_dp_send_link_address+0x1a5/0x370 [drm_kms_helper]
[78581.000494]  ? __queue_work+0x1e0/0x370
[78581.000497]  drm_dp_check_and_send_link_address+0xad/0xd0 [drm_kms_helper]
[78581.000501]  drm_dp_mst_link_probe_work+0x94/0x180 [drm_kms_helper]
[78581.000502]  process_one_work+0x1e3/0x3b0
[78581.000503]  worker_thread+0x46/0x340
[78581.000504]  ? process_one_work+0x3b0/0x3b0
[78581.000505]  kthread+0x119/0x140
[78581.000506]  ? __kthread_bind_mask+0x60/0x60
[78581.000508]  ret_from_fork+0x22/0x30
[78581.000509] ---[ end trace 439e8523e8297340 ]---


dl9pf@monster:~> inxi -G
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Polaris 22 XT [Radeon RX
Vega M GH] driver: amdgpu v: kernel 
           Display: x11 server: X.Org 1.20.8 driver: amdgpu resolution: 1:
1080x1920~60Hz 2: 1920x1080~60Hz 3: 1080x1920 
           OpenGL: renderer: AMD VEGAM (DRM 3.38.0
5.8.0-rc5-1-default-20200713-0948 LLVM 10.0.0) v: 4.6 Mesa 20.1.1

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
