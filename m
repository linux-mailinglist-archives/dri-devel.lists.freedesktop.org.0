Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D91CF465
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 10:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885E56E255;
	Tue,  8 Oct 2019 08:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B49296E241
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 08:00:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DFB3872158; Tue,  8 Oct 2019 08:00:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111921] GPU crash on VegaM (amdgpu: The CS has been rejected)
Date: Tue, 08 Oct 2019 08:00:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rverschelde@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111921-502-KH7e8KfqSN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111921-502@http.bugs.freedesktop.org/>
References: <bug-111921-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1155004887=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1155004887==
Content-Type: multipart/alternative; boundary="15705216080.65E0D.31084"
Content-Transfer-Encoding: 7bit


--15705216080.65E0D.31084
Date: Tue, 8 Oct 2019 08:00:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111921

--- Comment #1 from R=C3=A9mi Verschelde <rverschelde@gmail.com> ---
Pasting relevant part of `dmesg` log:
```
[ 7813.339782] [drm] PCIE GART of 256M enabled (table at 0x000000F400000000=
).
[ 7813.454656] [drm] UVD and UVD ENC initialized successfully.
[ 7813.565585] [drm] VCE initialized successfully.
[ 7836.109655] amdgpu 0000:01:00.0: GPU pci config reset
[ 7852.253685] [drm] PCIE GART of 256M enabled (table at 0x000000F400000000=
).
[ 7852.479940] amdgpu 0000:01:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring gfx test failed (-110)
[ 7852.479971] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume=
 of
IP block <gfx_v8_0> failed -110
[ 7852.480000] [drm:amdgpu_device_resume [amdgpu]] *ERROR*
amdgpu_device_ip_resume failed (-110).
[ 7852.497697] [drm] schedsdma0 is not ready, skipping
[ 7852.497697] [drm] schedsdma1 is not ready, skipping
[ 7852.508213] Move buffer fallback to memcpy unavailable
[ 7852.508264] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to process the
buffer list -19!
[ 7852.508377] BUG: kernel NULL pointer dereference, address: 0000000000000=
008
[ 7852.508379] #PF: supervisor read access in kernel mode
[ 7852.508379] #PF: error_code(0x0000) - not-present page
[ 7852.508380] PGD 800000030ef3d067 P4D 800000030ef3d067 PUD 30e4e3067 PMD =
0=20
[ 7852.508383] Oops: 0000 [#1] SMP PTI
[ 7852.508384] CPU: 0 PID: 30196 Comm: godot.x11.:cs0 Tainted: G        W  =
O=20=20=20
  5.3.2-desktop-1.mga7 #1
[ 7852.508385] Hardware name: HP HP Spectre x360 Convertible/83BB, BIOS F.30
03/07/2019
[ 7852.508433] RIP: 0010:amdgpu_vm_sdma_commit+0x46/0x110 [amdgpu]
[ 7852.508434] Code: 18 65 48 8b 04 25 28 00 00 00 48 89 44 24 08 31 c0 48 =
8b
47 08 48 8b aa 88 01 00 00 4c 8b a8 80 00 00 00 48 8b 80 c8 00 00 00 <4c> 8=
b 70
08 8b 45 08 4d 8d 7e 88 85 c0 0f 84 1c 0e 1f 00 49 8b 46
[ 7852.508435] RSP: 0018:ffffb5d70ec939e0 EFLAGS: 00010246
[ 7852.508436] RAX: 0000000000000000 RBX: ffffb5d70ec93a28 RCX:
0000000000000800
[ 7852.508437] RDX: ffff988d83c97c00 RSI: ffff988c8e5ae9b8 RDI:
ffffb5d70ec93a28
[ 7852.508438] RBP: ffff988d83c97df8 R08: 0000000000001000 R09:
0000000000000011
[ 7852.508438] R10: 0000000000000600 R11: 000000000000000d R12:
ffff988c8e5ae9b8
[ 7852.508439] R13: ffff988d922cc000 R14: 00000000000005ff R15:
0000000000000071
[ 7852.508440] FS:  00007f2cf7602700(0000) GS:ffff988e31c00000(0000)
knlGS:0000000000000000
[ 7852.508441] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 7852.508441] CR2: 0000000000000008 CR3: 0000000308aca001 CR4:
00000000003606f0
[ 7852.508442] Call Trace:
[ 7852.508482]  amdgpu_vm_bo_update_mapping+0xcd/0xe0 [amdgpu]
[ 7852.508518]  amdgpu_vm_bo_update+0x336/0x730 [amdgpu]
[ 7852.508552]  amdgpu_cs_ioctl+0x1324/0x1a40 [amdgpu]
[ 7852.508555]  ? __switch_to_asm+0x34/0x70
[ 7852.508591]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
[ 7852.508600]  drm_ioctl_kernel+0xac/0xf0 [drm]
[ 7852.508608]  drm_ioctl+0x201/0x3a0 [drm]
[ 7852.508640]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
[ 7852.508643]  ? do_futex+0xca/0xb70
[ 7852.508674]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[ 7852.508677]  do_vfs_ioctl+0xa4/0x630
[ 7852.508678]  ? __x64_sys_futex+0x13c/0x180
[ 7852.508680]  ksys_ioctl+0x60/0x90
[ 7852.508681]  __x64_sys_ioctl+0x16/0x20
[ 7852.508683]  do_syscall_64+0x69/0x1d0
[ 7852.508684]  ? prepare_exit_to_usermode+0x4c/0xb0
[ 7852.508686]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 7852.508687] RIP: 0033:0x7f2d0c21f2b7
[ 7852.508688] Code: 0f 1f 00 64 48 8b 14 25 00 00 00 00 48 8b 05 d0 8b 0c =
00
c7 04 02 26 00 00 00 48 c7 c0 ff ff ff ff c3 90 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d a9 8b 0c 00 f7 d8 64 89 01 48
[ 7852.508689] RSP: 002b:00007f2cf7601af8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 7852.508690] RAX: ffffffffffffffda RBX: 00007f2cf7601bf8 RCX:
00007f2d0c21f2b7
[ 7852.508691] RDX: 00007f2cf7601b60 RSI: 00000000c0186444 RDI:
0000000000000006
[ 7852.508691] RBP: 00007f2cf7601b60 R08: 00007f2cf7601c50 R09:
0000000000000020
[ 7852.508692] R10: 00007f2cf7601c50 R11: 0000000000000246 R12:
00000000c0186444
[ 7852.508693] R13: 0000000000000006 R14: 00000000073bb160 R15:
00000000073bb1e8
[ 7852.508694] Modules linked in: cmac rfcomm msr ip6t_REJECT nf_reject_ipv6
xt_comment ip6table_mangle ip6table_nat ip6table_raw nf_log_ipv6
ip6table_filter ip6_tables xt_recent ipt_IFWLOG ipt_psd xt_set ip_set_hash_=
ip
ip_set ipt_REJECT nf_reject_ipv4 xt_conntrack xt_hashlimit xt_addrtype xt_m=
ark
iptable_mangle iptable_nat xt_CT xt_tcpudp iptable_raw nfnetlink_log xt_NFL=
OG
nf_log_ipv4 nf_log_common xt_LOG nf_nat_tftp nf_nat_snmp_basic
nf_conntrack_snmp nf_nat_sip nf_nat_pptp nf_nat_irc nf_nat_h323 nf_nat_ftp
nf_nat_amanda ts_kmp nf_conntrack_amanda nf_nat nf_conntrack_sane
nf_conntrack_tftp nf_conntrack_sip nf_conntrack_pptp nf_conntrack_netlink
nfnetlink nf_conntrack_netbios_ns nf_conntrack_broadcast nf_conntrack_irc
nf_conntrack_h323 nf_conntrack_ftp nf_conntrack nf_defrag_ipv4 iptable_filt=
er
ccm af_packet bnep vboxnetadp(O) vboxnetflt(O) vboxdrv(O) fuse nls_iso8859_1
nls_cp437 vfat fat dm_mirror dm_region_hash dm_log dm_mod btusb uvcvideo bt=
bcm
btrtl btintel videobuf2_vmalloc
[ 7852.508713]  videobuf2_memops bluetooth videobuf2_v4l2 videobuf2_common
videodev mc usbhid ecdh_generic ecc snd_hda_codec_hdmi x86_pkg_temp_thermal
intel_powerclamp snd_hda_codec_realtek coretemp iwlmvm snd_hda_codec_generic
ledtrig_audio kvm_intel joydev snd_hda_intel mac80211 kvm libarc4 snd_hda_c=
odec
irqbypass crc32_pclmul snd_hda_core iwlwifi crc32c_intel spi_pxa2xx_platform
dw_dmac dw_dmac_core hid_multitouch 8250_dw ghash_clmulni_intel
hid_sensor_magn_3d hid_sensor_gyro_3d hid_sensor_incl_3d aesni_intel
hid_sensor_rotation hid_sensor_accel_3d iTCO_wdt iTCO_vendor_support
hid_sensor_trigger industrialio_triggered_buffer aes_x86_64 tpm_crb kfifo_b=
uf
crypto_simd snd_hwdep cryptd hid_sensor_iio_common industrialio cfg80211
glue_helper snd_pcm intel_cstate intel_uncore mei_hdcp snd_timer hp_wmi
ucsi_acpi tpm_tis typec_ucsi tpm_tis_core snd hid_sensor_hub psmouse
intel_rapl_msr intel_rapl_perf wmi_bmof soundcore intel_wmi_thunderbolt rfk=
ill
i2c_i801 rtsx_pci_ms input_leds hid_generic
[ 7852.508731]  memstick pinctrl_sunrisepoint idma64 int3403_thermal thermal
typec battery pinctrl_intel virt_dma tpm hp_wireless intel_vbtn sparse_keym=
ap
int3400_thermal acpi_pad acpi_thermal_rel ac intel_ishtp_loader button mei_=
me
mei intel_lpss_pci intel_pch_thermal intel_ishtp_hid processor_thermal_devi=
ce
intel_lpss cros_ec_ishtp intel_rapl_common int340x_thermal_zone cros_ec_core
intel_soc_dts_iosf evdev sch_fq_codel nvram binfmt_misc efivarfs ip_tables
x_tables ipv6 crc_ccitt nf_defrag_ipv6 autofs4 amdgpu xhci_pci xhci_hcd
rtsx_pci_sdmmc mmc_block mmc_core usbcore rtsx_pci amd_iommu_v2 serio_raw
gpu_sched intel_ish_ipc intel_ishtp ttm usb_common i915 i2c_hid hid
i2c_algo_bit wmi drm_kms_helper video drm
[ 7852.508746] CR2: 0000000000000008
[ 7852.508748] ---[ end trace 4ad3d7dd37eb10d6 ]---
[ 7852.508787] RIP: 0010:amdgpu_vm_sdma_commit+0x46/0x110 [amdgpu]
[ 7852.508788] Code: 18 65 48 8b 04 25 28 00 00 00 48 89 44 24 08 31 c0 48 =
8b
47 08 48 8b aa 88 01 00 00 4c 8b a8 80 00 00 00 48 8b 80 c8 00 00 00 <4c> 8=
b 70
08 8b 45 08 4d 8d 7e 88 85 c0 0f 84 1c 0e 1f 00 49 8b 46
[ 7852.508789] RSP: 0018:ffffb5d70ec939e0 EFLAGS: 00010246
[ 7852.508790] RAX: 0000000000000000 RBX: ffffb5d70ec93a28 RCX:
0000000000000800
[ 7852.508790] RDX: ffff988d83c97c00 RSI: ffff988c8e5ae9b8 RDI:
ffffb5d70ec93a28
[ 7852.508791] RBP: ffff988d83c97df8 R08: 0000000000001000 R09:
0000000000000011
[ 7852.508792] R10: 0000000000000600 R11: 000000000000000d R12:
ffff988c8e5ae9b8
[ 7852.508792] R13: ffff988d922cc000 R14: 00000000000005ff R15:
0000000000000071
[ 7852.508793] FS:  00007f2cf7602700(0000) GS:ffff988e31c00000(0000)
knlGS:0000000000000000
[ 7852.508794] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 7852.508795] CR2: 0000000000000008 CR3: 0000000308aca001 CR4:
00000000003606f0
```

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15705216080.65E0D.31084
Date: Tue, 8 Oct 2019 08:00:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921">bug 11192=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rverschelde&#64;gmail.com" title=3D"R=C3=A9mi Verschelde &lt;rverschelde&#6=
4;gmail.com&gt;"> <span class=3D"fn">R=C3=A9mi Verschelde</span></a>
</span></b>
        <pre>Pasting relevant part of `dmesg` log:
```
[ 7813.339782] [drm] PCIE GART of 256M enabled (table at 0x000000F400000000=
).
[ 7813.454656] [drm] UVD and UVD ENC initialized successfully.
[ 7813.565585] [drm] VCE initialized successfully.
[ 7836.109655] amdgpu 0000:01:00.0: GPU pci config reset
[ 7852.253685] [drm] PCIE GART of 256M enabled (table at 0x000000F400000000=
).
[ 7852.479940] amdgpu 0000:01:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring gfx test failed (-110)
[ 7852.479971] [drm:amdgpu_device_ip_resume_phase2 [amdgpu]] *ERROR* resume=
 of
IP block &lt;gfx_v8_0&gt; failed -110
[ 7852.480000] [drm:amdgpu_device_resume [amdgpu]] *ERROR*
amdgpu_device_ip_resume failed (-110).
[ 7852.497697] [drm] schedsdma0 is not ready, skipping
[ 7852.497697] [drm] schedsdma1 is not ready, skipping
[ 7852.508213] Move buffer fallback to memcpy unavailable
[ 7852.508264] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to process the
buffer list -19!
[ 7852.508377] BUG: kernel NULL pointer dereference, address: 0000000000000=
008
[ 7852.508379] #PF: supervisor read access in kernel mode
[ 7852.508379] #PF: error_code(0x0000) - not-present page
[ 7852.508380] PGD 800000030ef3d067 P4D 800000030ef3d067 PUD 30e4e3067 PMD =
0=20
[ 7852.508383] Oops: 0000 [#1] SMP PTI
[ 7852.508384] CPU: 0 PID: 30196 Comm: godot.x11.:cs0 Tainted: G        W  =
O=20=20=20
  5.3.2-desktop-1.mga7 #1
[ 7852.508385] Hardware name: HP HP Spectre x360 Convertible/83BB, BIOS F.30
03/07/2019
[ 7852.508433] RIP: 0010:amdgpu_vm_sdma_commit+0x46/0x110 [amdgpu]
[ 7852.508434] Code: 18 65 48 8b 04 25 28 00 00 00 48 89 44 24 08 31 c0 48 =
8b
47 08 48 8b aa 88 01 00 00 4c 8b a8 80 00 00 00 48 8b 80 c8 00 00 00 &lt;4c=
&gt; 8b 70
08 8b 45 08 4d 8d 7e 88 85 c0 0f 84 1c 0e 1f 00 49 8b 46
[ 7852.508435] RSP: 0018:ffffb5d70ec939e0 EFLAGS: 00010246
[ 7852.508436] RAX: 0000000000000000 RBX: ffffb5d70ec93a28 RCX:
0000000000000800
[ 7852.508437] RDX: ffff988d83c97c00 RSI: ffff988c8e5ae9b8 RDI:
ffffb5d70ec93a28
[ 7852.508438] RBP: ffff988d83c97df8 R08: 0000000000001000 R09:
0000000000000011
[ 7852.508438] R10: 0000000000000600 R11: 000000000000000d R12:
ffff988c8e5ae9b8
[ 7852.508439] R13: ffff988d922cc000 R14: 00000000000005ff R15:
0000000000000071
[ 7852.508440] FS:  00007f2cf7602700(0000) GS:ffff988e31c00000(0000)
knlGS:0000000000000000
[ 7852.508441] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 7852.508441] CR2: 0000000000000008 CR3: 0000000308aca001 CR4:
00000000003606f0
[ 7852.508442] Call Trace:
[ 7852.508482]  amdgpu_vm_bo_update_mapping+0xcd/0xe0 [amdgpu]
[ 7852.508518]  amdgpu_vm_bo_update+0x336/0x730 [amdgpu]
[ 7852.508552]  amdgpu_cs_ioctl+0x1324/0x1a40 [amdgpu]
[ 7852.508555]  ? __switch_to_asm+0x34/0x70
[ 7852.508591]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
[ 7852.508600]  drm_ioctl_kernel+0xac/0xf0 [drm]
[ 7852.508608]  drm_ioctl+0x201/0x3a0 [drm]
[ 7852.508640]  ? amdgpu_cs_find_mapping+0x110/0x110 [amdgpu]
[ 7852.508643]  ? do_futex+0xca/0xb70
[ 7852.508674]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[ 7852.508677]  do_vfs_ioctl+0xa4/0x630
[ 7852.508678]  ? __x64_sys_futex+0x13c/0x180
[ 7852.508680]  ksys_ioctl+0x60/0x90
[ 7852.508681]  __x64_sys_ioctl+0x16/0x20
[ 7852.508683]  do_syscall_64+0x69/0x1d0
[ 7852.508684]  ? prepare_exit_to_usermode+0x4c/0xb0
[ 7852.508686]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 7852.508687] RIP: 0033:0x7f2d0c21f2b7
[ 7852.508688] Code: 0f 1f 00 64 48 8b 14 25 00 00 00 00 48 8b 05 d0 8b 0c =
00
c7 04 02 26 00 00 00 48 c7 c0 ff ff ff ff c3 90 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d a9 8b 0c 00 f7 d8 64 89 01 48
[ 7852.508689] RSP: 002b:00007f2cf7601af8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 7852.508690] RAX: ffffffffffffffda RBX: 00007f2cf7601bf8 RCX:
00007f2d0c21f2b7
[ 7852.508691] RDX: 00007f2cf7601b60 RSI: 00000000c0186444 RDI:
0000000000000006
[ 7852.508691] RBP: 00007f2cf7601b60 R08: 00007f2cf7601c50 R09:
0000000000000020
[ 7852.508692] R10: 00007f2cf7601c50 R11: 0000000000000246 R12:
00000000c0186444
[ 7852.508693] R13: 0000000000000006 R14: 00000000073bb160 R15:
00000000073bb1e8
[ 7852.508694] Modules linked in: cmac rfcomm msr ip6t_REJECT nf_reject_ipv6
xt_comment ip6table_mangle ip6table_nat ip6table_raw nf_log_ipv6
ip6table_filter ip6_tables xt_recent ipt_IFWLOG ipt_psd xt_set ip_set_hash_=
ip
ip_set ipt_REJECT nf_reject_ipv4 xt_conntrack xt_hashlimit xt_addrtype xt_m=
ark
iptable_mangle iptable_nat xt_CT xt_tcpudp iptable_raw nfnetlink_log xt_NFL=
OG
nf_log_ipv4 nf_log_common xt_LOG nf_nat_tftp nf_nat_snmp_basic
nf_conntrack_snmp nf_nat_sip nf_nat_pptp nf_nat_irc nf_nat_h323 nf_nat_ftp
nf_nat_amanda ts_kmp nf_conntrack_amanda nf_nat nf_conntrack_sane
nf_conntrack_tftp nf_conntrack_sip nf_conntrack_pptp nf_conntrack_netlink
nfnetlink nf_conntrack_netbios_ns nf_conntrack_broadcast nf_conntrack_irc
nf_conntrack_h323 nf_conntrack_ftp nf_conntrack nf_defrag_ipv4 iptable_filt=
er
ccm af_packet bnep vboxnetadp(O) vboxnetflt(O) vboxdrv(O) fuse nls_iso8859_1
nls_cp437 vfat fat dm_mirror dm_region_hash dm_log dm_mod btusb uvcvideo bt=
bcm
btrtl btintel videobuf2_vmalloc
[ 7852.508713]  videobuf2_memops bluetooth videobuf2_v4l2 videobuf2_common
videodev mc usbhid ecdh_generic ecc snd_hda_codec_hdmi x86_pkg_temp_thermal
intel_powerclamp snd_hda_codec_realtek coretemp iwlmvm snd_hda_codec_generic
ledtrig_audio kvm_intel joydev snd_hda_intel mac80211 kvm libarc4 snd_hda_c=
odec
irqbypass crc32_pclmul snd_hda_core iwlwifi crc32c_intel spi_pxa2xx_platform
dw_dmac dw_dmac_core hid_multitouch 8250_dw ghash_clmulni_intel
hid_sensor_magn_3d hid_sensor_gyro_3d hid_sensor_incl_3d aesni_intel
hid_sensor_rotation hid_sensor_accel_3d iTCO_wdt iTCO_vendor_support
hid_sensor_trigger industrialio_triggered_buffer aes_x86_64 tpm_crb kfifo_b=
uf
crypto_simd snd_hwdep cryptd hid_sensor_iio_common industrialio cfg80211
glue_helper snd_pcm intel_cstate intel_uncore mei_hdcp snd_timer hp_wmi
ucsi_acpi tpm_tis typec_ucsi tpm_tis_core snd hid_sensor_hub psmouse
intel_rapl_msr intel_rapl_perf wmi_bmof soundcore intel_wmi_thunderbolt rfk=
ill
i2c_i801 rtsx_pci_ms input_leds hid_generic
[ 7852.508731]  memstick pinctrl_sunrisepoint idma64 int3403_thermal thermal
typec battery pinctrl_intel virt_dma tpm hp_wireless intel_vbtn sparse_keym=
ap
int3400_thermal acpi_pad acpi_thermal_rel ac intel_ishtp_loader button mei_=
me
mei intel_lpss_pci intel_pch_thermal intel_ishtp_hid processor_thermal_devi=
ce
intel_lpss cros_ec_ishtp intel_rapl_common int340x_thermal_zone cros_ec_core
intel_soc_dts_iosf evdev sch_fq_codel nvram binfmt_misc efivarfs ip_tables
x_tables ipv6 crc_ccitt nf_defrag_ipv6 autofs4 amdgpu xhci_pci xhci_hcd
rtsx_pci_sdmmc mmc_block mmc_core usbcore rtsx_pci amd_iommu_v2 serio_raw
gpu_sched intel_ish_ipc intel_ishtp ttm usb_common i915 i2c_hid hid
i2c_algo_bit wmi drm_kms_helper video drm
[ 7852.508746] CR2: 0000000000000008
[ 7852.508748] ---[ end trace 4ad3d7dd37eb10d6 ]---
[ 7852.508787] RIP: 0010:amdgpu_vm_sdma_commit+0x46/0x110 [amdgpu]
[ 7852.508788] Code: 18 65 48 8b 04 25 28 00 00 00 48 89 44 24 08 31 c0 48 =
8b
47 08 48 8b aa 88 01 00 00 4c 8b a8 80 00 00 00 48 8b 80 c8 00 00 00 &lt;4c=
&gt; 8b 70
08 8b 45 08 4d 8d 7e 88 85 c0 0f 84 1c 0e 1f 00 49 8b 46
[ 7852.508789] RSP: 0018:ffffb5d70ec939e0 EFLAGS: 00010246
[ 7852.508790] RAX: 0000000000000000 RBX: ffffb5d70ec93a28 RCX:
0000000000000800
[ 7852.508790] RDX: ffff988d83c97c00 RSI: ffff988c8e5ae9b8 RDI:
ffffb5d70ec93a28
[ 7852.508791] RBP: ffff988d83c97df8 R08: 0000000000001000 R09:
0000000000000011
[ 7852.508792] R10: 0000000000000600 R11: 000000000000000d R12:
ffff988c8e5ae9b8
[ 7852.508792] R13: ffff988d922cc000 R14: 00000000000005ff R15:
0000000000000071
[ 7852.508793] FS:  00007f2cf7602700(0000) GS:ffff988e31c00000(0000)
knlGS:0000000000000000
[ 7852.508794] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 7852.508795] CR2: 0000000000000008 CR3: 0000000308aca001 CR4:
00000000003606f0
```</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15705216080.65E0D.31084--

--===============1155004887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1155004887==--
