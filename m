Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55159F7C6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 03:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9127A89C08;
	Wed, 28 Aug 2019 01:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81F6689C08
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 01:21:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7E7A272161; Wed, 28 Aug 2019 01:21:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110381] Failed to updateMST allocation table forpipe idx:0
Date: Wed, 28 Aug 2019 01:21:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamespharvey20@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110381-502-ZNFC9uNGvv@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110381-502@http.bugs.freedesktop.org/>
References: <bug-110381-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1786874366=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1786874366==
Content-Type: multipart/alternative; boundary="15669552894.CE280b.18284"
Content-Transfer-Encoding: 7bit


--15669552894.CE280b.18284
Date: Wed, 28 Aug 2019 01:21:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110381

--- Comment #10 from jamespharvey20@gmail.com ---
Also occurred on 5.2.1.

05:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Vega 10 XL/XT [Radeon RX Vega 56/64] [1002:687f] (rev c1) (prog-i=
f 00
[VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RX Vega64 [1002:0=
b36]

Jul 29 07:23:38 servo kernel: WARNING: CPU: 1 PID: 1547 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2404
update_mst_stream_alloc_table+0x124/0x130 [amdgpu]
Jul 29 07:23:38 servo kernel: Modules linked in: tcp_diag inet_diag dm_snap=
shot
fuse isofs loop xfs jfs nls_utf8 udf crc_itu_t uas usb_storage vhost_net vh=
ost
tap tun ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter
rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache ib_i=
sert
iscsi_target_mod ib_srpt target_core_mod ib_srp scsi_transport_srp rpcrdma
sunrpc rdma_ucm ib_iser rdma_cm ib_umad iw_cm ib_ipoib libiscsi
scsi_transport_iscsi ib_cm mlx4_ib ib_uverbs ib_core mlx4_en msr nct6775
hwmon_vid nls_iso8859_1 nls_cp437 vfat fat ipmi_ssif intel_rapl sb_edac
x86_pkg_temp_thermal intel_powerclamp
coretemp bridge stp kvm_intel llc kvm irqbypass snd_hda_codec_realtek
intel_cstate snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi iTCO_wdt
iTCO_vendor_support snd_hda_intel mousedev snd_hda_codec joydev input_leds
snd_hda_core intel_uncore snd_hwdep intel_rapl_perf snd_pcm mlx4_core pcspkr
snd_timer snd ipmi_si e1000e i2c_i801 mei_me ioatdma ipmi_devintf mei lpc_i=
ch
soundcore
Jul 29 07:23:38 servo kernel:  dca wmi ipmi_msghandler pcc_cpufreq evdev
mac_hid vmmon(OE) vmw_vmci vboxnetflt(OE) vboxnetadp(OE) vboxpci(OE)
vboxdrv(OE) sg crypto_user ip_tables x_tables btrfs xor raid6_pq algif_skci=
pher
af_alg dm_thin_pool dm_persistent_data dm_bio_prison dm_bufio libcrc32c
crc32c_generic hid_generic usbhid hid sr_mod cdrom sd_mod dm_crypt dm_mod
crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel isci aesni_i=
ntel
libsas ahci scsi_transport_sas libahci aes_x86_64 crypto_simd libata cryptd
glue_helper scsi_mod ehci_pci ehci_hcd amdgpu amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fo=
ps
drm agpgart
Jul 29 07:23:38 servo kernel: CPU: 1 PID: 1547 Comm: Xorg Tainted: G=20=20=
=20=20=20=20=20=20=20=20
OE     5.2.1-arch1-1-ARCH #1
Jul 29 07:23:38 servo kernel: Hardware name: To Be Filled By O.E.M. To Be
Filled By O.E.M./EP2C602, BIOS P1.90 04/12/2018
Jul 29 07:23:38 servo kernel: RIP:
0010:update_mst_stream_alloc_table+0x124/0x130 [amdgpu]
Jul 29 07:23:38 servo kernel: Code: 33 04 25 28 00 00 00 75 28 48 8d 65 e0 =
5b
41 5c 41 5d 41 5e 5d c3 41 0f b6 03 4c 89 26 88 46 08 41 0f b6 43 01 88 46 =
09
eb 96 <0f> 0b e9 33 ff ff ff e8 60 f0 eb fb 66 66 66 66 90 55 48 89 e5 41
Jul 29 07:23:38 servo kernel: RSP: 0018:ffffac5f880df620 EFLAGS: 00010202
Jul 29 07:23:38 servo kernel: RAX: 0000000000000002 RBX: ffff8f1b96868800 R=
CX:
0000000000000000
Jul 29 07:23:38 servo kernel: RDX: ffffac5f880df608 RSI: ffff8f1b961af100 R=
DI:
ffffac5f880df680
Jul 29 07:23:38 servo kernel: RBP: ffffac5f880df6b8 R08: ffffffffc01a0db5 R=
09:
0000000000000000
Jul 29 07:23:38 servo kernel: R10: ffffac5f880df620 R11: 0000000000000001 R=
12:
ffff8f1b961af100
Jul 29 07:23:38 servo kernel: R13: ffffac5f880df70c R14: 0000000000000002 R=
15:
0000000000000004
Jul 29 07:23:38 servo kernel: FS:  00007fc20580bdc0(0000)
GS:ffff8f1b9f840000(0000) knlGS:0000000000000000
Jul 29 07:23:38 servo kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Jul 29 07:23:38 servo kernel: CR2: 000055ff36f2fc7e CR3: 00000008540e0005 C=
R4:
00000000000606e0
Jul 29 07:23:38 servo kernel: Call Trace:
Jul 29 07:23:38 servo kernel:  core_link_enable_stream+0x5e0/0x1130 [amdgpu]
Jul 29 07:23:38 servo kernel:  ? set_pixel_encoding.isra.0+0x68/0x150 [amdg=
pu]
Jul 29 07:23:38 servo kernel:  dce110_apply_ctx_to_hw+0x446/0x4b0 [amdgpu]
Jul 29 07:23:38 servo kernel:  dc_commit_state+0x272/0x5a0 [amdgpu]
Jul 29 07:23:38 servo kernel:  amdgpu_dm_atomic_commit_tail+0xc64/0x1a20
[amdgpu]
Jul 29 07:23:38 servo kernel:  ? free_one_page+0xac/0x480
Jul 29 07:23:38 servo kernel:  ? bw_calcs+0x930/0x3900 [amdgpu]
Jul 29 07:23:38 servo kernel:  ? commit_tail+0x3c/0x70 [drm_kms_helper]
Jul 29 07:23:38 servo kernel:  ? __bpf_trace_amdgpu_dc_wreg+0x30/0x30 [amdg=
pu]
Jul 29 07:23:38 servo kernel:  commit_tail+0x3c/0x70 [drm_kms_helper]
Jul 29 07:23:38 servo kernel:  drm_atomic_helper_commit+0x10e/0x120
[drm_kms_helper]
Jul 29 07:23:38 servo kernel:  drm_atomic_helper_set_config+0x82/0x90
[drm_kms_helper]
Jul 29 07:23:38 servo kernel:  drm_mode_setcrtc+0x1fa/0x720 [drm]
Jul 29 07:23:38 servo kernel:  ? drm_mode_getcrtc+0x190/0x190 [drm]
Jul 29 07:23:38 servo kernel:  drm_ioctl_kernel+0xbf/0x100 [drm]
Jul 29 07:23:38 servo kernel:  drm_ioctl+0x244/0x3d0 [drm]
Jul 29 07:23:38 servo kernel:  ? drm_mode_getcrtc+0x190/0x190 [drm]
Jul 29 07:23:38 servo kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Jul 29 07:23:38 servo kernel:  do_vfs_ioctl+0x447/0x6d0
Jul 29 07:23:38 servo kernel:  ? __fget+0x71/0xa0
Jul 29 07:23:38 servo kernel:  ksys_ioctl+0x60/0x90
Jul 29 07:23:38 servo kernel:  __x64_sys_ioctl+0x1a/0x20
Jul 29 07:23:38 servo kernel:  do_syscall_64+0x5b/0x1b0
Jul 29 07:23:38 servo kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jul 29 07:23:38 servo kernel: RIP: 0033:0x7fc206c3521b
Jul 29 07:23:38 servo kernel: Code: 0f 1e fa 48 8b 05 75 8c 0c 00 64 c7 00 =
26
00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 =
00
0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 45 8c 0c 00 f7 d8 64 89 01 48
Jul 29 07:23:38 servo kernel: RSP: 002b:00007fff9d9265c8 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Jul 29 07:23:38 servo kernel: RAX: ffffffffffffffda RBX: 00007fff9d926600 R=
CX:
00007fc206c3521b
Jul 29 07:23:38 servo kernel: RDX: 00007fff9d926600 RSI: 00000000c06864a2 R=
DI:
000000000000000a
Jul 29 07:23:38 servo kernel: RBP: 00000000c06864a2 R08: 0000000000000000 R=
09:
000055ff371433a0
Jul 29 07:23:38 servo kernel: R10: 0000000000000000 R11: 0000000000000246 R=
12:
000055ff36724290
Jul 29 07:23:38 servo kernel: R13: 000000000000000a R14: 0000000000000000 R=
15:
000055ff371433a0
Jul 29 07:23:38 servo kernel: ---[ end trace 3bc8de046fc13a5e ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669552894.CE280b.18284
Date: Wed, 28 Aug 2019 01:21:29 +0000
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
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381">bug 11038=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jamespharvey20&#64;gmail.com" title=3D"jamespharvey20&#64;gmail.com">jamesp=
harvey20&#64;gmail.com</a>
</span></b>
        <pre>Also occurred on 5.2.1.

05:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Vega 10 XL/XT [Radeon RX Vega 56/64] [1002:687f] (rev c1) (prog-i=
f 00
[VGA controller])
        Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RX Vega64 [1002:0=
b36]

Jul 29 07:23:38 servo kernel: WARNING: CPU: 1 PID: 1547 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2404
update_mst_stream_alloc_table+0x124/0x130 [amdgpu]
Jul 29 07:23:38 servo kernel: Modules linked in: tcp_diag inet_diag dm_snap=
shot
fuse isofs loop xfs jfs nls_utf8 udf crc_itu_t uas usb_storage vhost_net vh=
ost
tap tun ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter
rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_resolver nfs lockd grace fscache ib_i=
sert
iscsi_target_mod ib_srpt target_core_mod ib_srp scsi_transport_srp rpcrdma
sunrpc rdma_ucm ib_iser rdma_cm ib_umad iw_cm ib_ipoib libiscsi
scsi_transport_iscsi ib_cm mlx4_ib ib_uverbs ib_core mlx4_en msr nct6775
hwmon_vid nls_iso8859_1 nls_cp437 vfat fat ipmi_ssif intel_rapl sb_edac
x86_pkg_temp_thermal intel_powerclamp
coretemp bridge stp kvm_intel llc kvm irqbypass snd_hda_codec_realtek
intel_cstate snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi iTCO_wdt
iTCO_vendor_support snd_hda_intel mousedev snd_hda_codec joydev input_leds
snd_hda_core intel_uncore snd_hwdep intel_rapl_perf snd_pcm mlx4_core pcspkr
snd_timer snd ipmi_si e1000e i2c_i801 mei_me ioatdma ipmi_devintf mei lpc_i=
ch
soundcore
Jul 29 07:23:38 servo kernel:  dca wmi ipmi_msghandler pcc_cpufreq evdev
mac_hid vmmon(OE) vmw_vmci vboxnetflt(OE) vboxnetadp(OE) vboxpci(OE)
vboxdrv(OE) sg crypto_user ip_tables x_tables btrfs xor raid6_pq algif_skci=
pher
af_alg dm_thin_pool dm_persistent_data dm_bio_prison dm_bufio libcrc32c
crc32c_generic hid_generic usbhid hid sr_mod cdrom sd_mod dm_crypt dm_mod
crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel isci aesni_i=
ntel
libsas ahci scsi_transport_sas libahci aes_x86_64 crypto_simd libata cryptd
glue_helper scsi_mod ehci_pci ehci_hcd amdgpu amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fo=
ps
drm agpgart
Jul 29 07:23:38 servo kernel: CPU: 1 PID: 1547 Comm: Xorg Tainted: G=20=20=
=20=20=20=20=20=20=20=20
OE     5.2.1-arch1-1-ARCH #1
Jul 29 07:23:38 servo kernel: Hardware name: To Be Filled By O.E.M. To Be
Filled By O.E.M./EP2C602, BIOS P1.90 04/12/2018
Jul 29 07:23:38 servo kernel: RIP:
0010:update_mst_stream_alloc_table+0x124/0x130 [amdgpu]
Jul 29 07:23:38 servo kernel: Code: 33 04 25 28 00 00 00 75 28 48 8d 65 e0 =
5b
41 5c 41 5d 41 5e 5d c3 41 0f b6 03 4c 89 26 88 46 08 41 0f b6 43 01 88 46 =
09
eb 96 &lt;0f&gt; 0b e9 33 ff ff ff e8 60 f0 eb fb 66 66 66 66 90 55 48 89 e=
5 41
Jul 29 07:23:38 servo kernel: RSP: 0018:ffffac5f880df620 EFLAGS: 00010202
Jul 29 07:23:38 servo kernel: RAX: 0000000000000002 RBX: ffff8f1b96868800 R=
CX:
0000000000000000
Jul 29 07:23:38 servo kernel: RDX: ffffac5f880df608 RSI: ffff8f1b961af100 R=
DI:
ffffac5f880df680
Jul 29 07:23:38 servo kernel: RBP: ffffac5f880df6b8 R08: ffffffffc01a0db5 R=
09:
0000000000000000
Jul 29 07:23:38 servo kernel: R10: ffffac5f880df620 R11: 0000000000000001 R=
12:
ffff8f1b961af100
Jul 29 07:23:38 servo kernel: R13: ffffac5f880df70c R14: 0000000000000002 R=
15:
0000000000000004
Jul 29 07:23:38 servo kernel: FS:  00007fc20580bdc0(0000)
GS:ffff8f1b9f840000(0000) knlGS:0000000000000000
Jul 29 07:23:38 servo kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Jul 29 07:23:38 servo kernel: CR2: 000055ff36f2fc7e CR3: 00000008540e0005 C=
R4:
00000000000606e0
Jul 29 07:23:38 servo kernel: Call Trace:
Jul 29 07:23:38 servo kernel:  core_link_enable_stream+0x5e0/0x1130 [amdgpu]
Jul 29 07:23:38 servo kernel:  ? set_pixel_encoding.isra.0+0x68/0x150 [amdg=
pu]
Jul 29 07:23:38 servo kernel:  dce110_apply_ctx_to_hw+0x446/0x4b0 [amdgpu]
Jul 29 07:23:38 servo kernel:  dc_commit_state+0x272/0x5a0 [amdgpu]
Jul 29 07:23:38 servo kernel:  amdgpu_dm_atomic_commit_tail+0xc64/0x1a20
[amdgpu]
Jul 29 07:23:38 servo kernel:  ? free_one_page+0xac/0x480
Jul 29 07:23:38 servo kernel:  ? bw_calcs+0x930/0x3900 [amdgpu]
Jul 29 07:23:38 servo kernel:  ? commit_tail+0x3c/0x70 [drm_kms_helper]
Jul 29 07:23:38 servo kernel:  ? __bpf_trace_amdgpu_dc_wreg+0x30/0x30 [amdg=
pu]
Jul 29 07:23:38 servo kernel:  commit_tail+0x3c/0x70 [drm_kms_helper]
Jul 29 07:23:38 servo kernel:  drm_atomic_helper_commit+0x10e/0x120
[drm_kms_helper]
Jul 29 07:23:38 servo kernel:  drm_atomic_helper_set_config+0x82/0x90
[drm_kms_helper]
Jul 29 07:23:38 servo kernel:  drm_mode_setcrtc+0x1fa/0x720 [drm]
Jul 29 07:23:38 servo kernel:  ? drm_mode_getcrtc+0x190/0x190 [drm]
Jul 29 07:23:38 servo kernel:  drm_ioctl_kernel+0xbf/0x100 [drm]
Jul 29 07:23:38 servo kernel:  drm_ioctl+0x244/0x3d0 [drm]
Jul 29 07:23:38 servo kernel:  ? drm_mode_getcrtc+0x190/0x190 [drm]
Jul 29 07:23:38 servo kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Jul 29 07:23:38 servo kernel:  do_vfs_ioctl+0x447/0x6d0
Jul 29 07:23:38 servo kernel:  ? __fget+0x71/0xa0
Jul 29 07:23:38 servo kernel:  ksys_ioctl+0x60/0x90
Jul 29 07:23:38 servo kernel:  __x64_sys_ioctl+0x1a/0x20
Jul 29 07:23:38 servo kernel:  do_syscall_64+0x5b/0x1b0
Jul 29 07:23:38 servo kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jul 29 07:23:38 servo kernel: RIP: 0033:0x7fc206c3521b
Jul 29 07:23:38 servo kernel: Code: 0f 1e fa 48 8b 05 75 8c 0c 00 64 c7 00 =
26
00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 =
00
0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 45 8c 0c 00 f7 d8 64 89 0=
1 48
Jul 29 07:23:38 servo kernel: RSP: 002b:00007fff9d9265c8 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Jul 29 07:23:38 servo kernel: RAX: ffffffffffffffda RBX: 00007fff9d926600 R=
CX:
00007fc206c3521b
Jul 29 07:23:38 servo kernel: RDX: 00007fff9d926600 RSI: 00000000c06864a2 R=
DI:
000000000000000a
Jul 29 07:23:38 servo kernel: RBP: 00000000c06864a2 R08: 0000000000000000 R=
09:
000055ff371433a0
Jul 29 07:23:38 servo kernel: R10: 0000000000000000 R11: 0000000000000246 R=
12:
000055ff36724290
Jul 29 07:23:38 servo kernel: R13: 000000000000000a R14: 0000000000000000 R=
15:
000055ff371433a0
Jul 29 07:23:38 servo kernel: ---[ end trace 3bc8de046fc13a5e ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669552894.CE280b.18284--

--===============1786874366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1786874366==--
