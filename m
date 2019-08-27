Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5FD9F5F0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 00:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B7589BA3;
	Tue, 27 Aug 2019 22:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D968A89B5F
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 22:20:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D02B772161; Tue, 27 Aug 2019 22:20:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Tue, 27 Aug 2019 22:20:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: freedesktop@postfach.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-m8rNDn8vUz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2122666424=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2122666424==
Content-Type: multipart/alternative; boundary="15669444340.c2C9e1b.30190"
Content-Transfer-Encoding: 7bit


--15669444340.c2C9e1b.30190
Date: Tue, 27 Aug 2019 22:20:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #4 from Robert <freedesktop@postfach.xyz> ---
I guess it's also not of interest but if I pull the DisplayPort cable and p=
ull
it in again I get this error via "dmesg" (this happens every time I do this=
):

"""
[Wed Aug 28 00:12:08 2019] ------------[ cut here ]------------
[Wed Aug 28 00:12:08 2019] WARNING: CPU: 6 PID: 1995 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:2800
dcn20_validate_bandwidth.cold+0xe/0x18 [amdgpu]
[Wed Aug 28 00:12:08 2019] Modules linked in: xt_nat veth xt_MASQUERADE
nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo iptable_nat br_netfilter
overlay wireguard(O) ip6_udp_tunnel udp_tunnel edac_mce_amd kvm_amd sr_mod
cdrom uas usb_storage stv6110x lnbp21 kvm btusb btrtl snd_hda_codec_realtek
btbcm btintel nls_iso8859_1 snd_hda_codec_generic nls_cp437 ledtrig_audio
snd_hda_codec_hdmi vfat fat stv090x bluetooth snd_hda_intel crct10dif_pclmul
crc32_pclmul snd_hda_codec ghash_clmulni_intel bridge snd_hda_core eeepc_wmi
asus_wmi snd_hwdep sparse_keymap ngene stp ecdh_generic snd_pcm dvb_core
aesni_intel ecc videobuf2_vmalloc joydev snd_timer ccp videobuf2_memops llc
video wmi_bmof mxm_wmi videobuf2_common sp5100_tco mousedev evdev aes_x86_64
input_leds snd crypto_simd led_class mac_hid cryptd glue_helper i2c_piix4
rfkill pcspkr rng_core soundcore videodev igb mc dca wmi button acpi_cpufreq
nf_log_ipv6 ip6t_REJECT nf_reject_ipv6 xt_hl ip6t_rt nf_log_ipv4 nf_log_com=
mon
ipt_REJECT nf_reject_ipv4 xt_LOG
[Wed Aug 28 00:12:08 2019]  xt_multiport xt_limit xt_addrtype xt_tcpudp
xt_conntrack ip6table_filter ip6_tables nf_conntrack_netbios_ns
nf_conntrack_broadcast nf_nat_ftp nf_nat nf_conntrack_ftp nfsd nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_filter bpfilter auth_rpcgss
nfs_acl lockd grace sch_fq_codel sunrpc sg crypto_user ip_tables x_tables e=
xt4
crc32c_generic crc16 mbcache jbd2 hid_logitech_hidpp sd_mod hid_logitech_dj
hid_generic usbhid hid crc32c_intel ahci xhci_pci libahci xhci_hcd libata
usbcore nvme scsi_mod usb_common nvme_core amdgpu amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fo=
ps
drm agpgart vfio_pci irqbypass vfio_virqfd vfio_iommu_type1 vfio
[Wed Aug 28 00:12:08 2019] CPU: 6 PID: 1995 Comm: Xorg Tainted: G        W =
 O=20=20
   5.3.0-rc3-amd-staging-drm-next-git-b8cd95e15410 #1
[Wed Aug 28 00:12:08 2019] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-E GAMING, BIOS 1005 08/01/2019
[Wed Aug 28 00:12:08 2019] RIP: 0010:dcn20_validate_bandwidth.cold+0xe/0x18
[amdgpu]
[Wed Aug 28 00:12:08 2019] Code: d9 05 ef e0 18 00 8b 54 24 08 0f b7 44 24 =
2e
80 cc 0c 66 89 44 24 2c e9 83 ed f4 ff 48 c7 c7 50 49 80 c0 31 c0 e8 dd 8b =
9b
cb <0f> 0b 45 89 f5 e9 5e f3 f4 ff 48 c7 c7 50 49 80 c0 31 c0 e8 c5 8b
[Wed Aug 28 00:12:08 2019] RSP: 0018:ffff9e5e09b43a98 EFLAGS: 00010246
[Wed Aug 28 00:12:08 2019] RAX: 0000000000000024 RBX: 4079400000000000 RCX:
0000000000000000
[Wed Aug 28 00:12:08 2019] RDX: 0000000000000000 RSI: ffff8e847e997448 RDI:
ffff8e847e997448
[Wed Aug 28 00:12:08 2019] RBP: ffff8e8337650000 R08: ffff8e847e997448 R09:
0000000000000004
[Wed Aug 28 00:12:08 2019] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff8e8470d00000
[Wed Aug 28 00:12:08 2019] R13: 0000000000000000 R14: 0000000000000001 R15:
ffff8e84708e6000
[Wed Aug 28 00:12:08 2019] FS:  00007f1c3fdbfdc0(0000)
GS:ffff8e847e980000(0000) knlGS:0000000000000000
[Wed Aug 28 00:12:08 2019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Wed Aug 28 00:12:08 2019] CR2: 00007f4398fee528 CR3: 0000000ff4c52000 CR4:
0000000000340ee0
[Wed Aug 28 00:12:08 2019] Call Trace:
[Wed Aug 28 00:12:08 2019]  dc_validate_global_state+0x28a/0x310 [amdgpu]
[Wed Aug 28 00:12:08 2019]  amdgpu_dm_atomic_check+0x5a2/0x800 [amdgpu]
[Wed Aug 28 00:12:08 2019]  drm_atomic_check_only+0x550/0x780 [drm]
[Wed Aug 28 00:12:08 2019]  drm_atomic_commit+0x13/0x50 [drm]
[Wed Aug 28 00:12:08 2019]  drm_atomic_connector_commit_dpms+0xd7/0x100 [dr=
m]
[Wed Aug 28 00:12:08 2019]  drm_mode_obj_set_property_ioctl+0x159/0x2b0 [dr=
m]
[Wed Aug 28 00:12:08 2019]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[Wed Aug 28 00:12:08 2019]  drm_connector_property_set_ioctl+0x39/0x60 [drm]
[Wed Aug 28 00:12:08 2019]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[Wed Aug 28 00:12:08 2019]  drm_ioctl+0x208/0x390 [drm]
[Wed Aug 28 00:12:08 2019]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[Wed Aug 28 00:12:08 2019]  ? ep_read_events_proc+0xd0/0xd0
[Wed Aug 28 00:12:08 2019]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[Wed Aug 28 00:12:08 2019]  do_vfs_ioctl+0x40c/0x670
[Wed Aug 28 00:12:08 2019]  ksys_ioctl+0x5e/0x90
[Wed Aug 28 00:12:08 2019]  __x64_sys_ioctl+0x16/0x20
[Wed Aug 28 00:12:08 2019]  do_syscall_64+0x4e/0x120
[Wed Aug 28 00:12:08 2019]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[Wed Aug 28 00:12:08 2019] RIP: 0033:0x7f1c411f221b
[Wed Aug 28 00:12:08 2019] Code: 0f 1e fa 48 8b 05 75 8c 0c 00 64 c7 00 26 =
00
00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 =
0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 45 8c 0c 00 f7 d8 64 89 01 48
[Wed Aug 28 00:12:08 2019] RSP: 002b:00007ffe5a751d68 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[Wed Aug 28 00:12:08 2019] RAX: ffffffffffffffda RBX: 00007ffe5a751da0 RCX:
00007f1c411f221b
[Wed Aug 28 00:12:08 2019] RDX: 00007ffe5a751da0 RSI: 00000000c01064ab RDI:
000000000000000d
[Wed Aug 28 00:12:08 2019] RBP: 00000000c01064ab R08: 0000000000000000 R09:
000056432099ffb0
[Wed Aug 28 00:12:08 2019] R10: 0000000000000000 R11: 0000000000000246 R12:
000056431ed03f90
[Wed Aug 28 00:12:08 2019] R13: 000000000000000d R14: 00005643226d4d70 R15:
0000000000000000
[Wed Aug 28 00:12:08 2019] ---[ end trace 7f6319103d8b887e ]---
"""

Besides the error nothing else happens. Display is still working fine
afterwards (besides the still high power consumption).

As Andrew already mentioned my card also stays at the highest frequency:

"""
cat /sys/class/drm/card0/device/pp_dpm_mclk
0: 100Mhz=20
1: 500Mhz=20
2: 625Mhz=20
3: 875Mhz *
"""

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669444340.c2C9e1b.30190
Date: Tue, 27 Aug 2019 22:20:34 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;postfach.xyz" title=3D"Robert &lt;freedesktop&#64;postfach.=
xyz&gt;"> <span class=3D"fn">Robert</span></a>
</span></b>
        <pre>I guess it's also not of interest but if I pull the DisplayPor=
t cable and pull
it in again I get this error via &quot;dmesg&quot; (this happens every time=
 I do this):

&quot;&quot;&quot;
[Wed Aug 28 00:12:08 2019] ------------[ cut here ]------------
[Wed Aug 28 00:12:08 2019] WARNING: CPU: 6 PID: 1995 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:2800
dcn20_validate_bandwidth.cold+0xe/0x18 [amdgpu]
[Wed Aug 28 00:12:08 2019] Modules linked in: xt_nat veth xt_MASQUERADE
nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo iptable_nat br_netfilter
overlay wireguard(O) ip6_udp_tunnel udp_tunnel edac_mce_amd kvm_amd sr_mod
cdrom uas usb_storage stv6110x lnbp21 kvm btusb btrtl snd_hda_codec_realtek
btbcm btintel nls_iso8859_1 snd_hda_codec_generic nls_cp437 ledtrig_audio
snd_hda_codec_hdmi vfat fat stv090x bluetooth snd_hda_intel crct10dif_pclmul
crc32_pclmul snd_hda_codec ghash_clmulni_intel bridge snd_hda_core eeepc_wmi
asus_wmi snd_hwdep sparse_keymap ngene stp ecdh_generic snd_pcm dvb_core
aesni_intel ecc videobuf2_vmalloc joydev snd_timer ccp videobuf2_memops llc
video wmi_bmof mxm_wmi videobuf2_common sp5100_tco mousedev evdev aes_x86_64
input_leds snd crypto_simd led_class mac_hid cryptd glue_helper i2c_piix4
rfkill pcspkr rng_core soundcore videodev igb mc dca wmi button acpi_cpufreq
nf_log_ipv6 ip6t_REJECT nf_reject_ipv6 xt_hl ip6t_rt nf_log_ipv4 nf_log_com=
mon
ipt_REJECT nf_reject_ipv4 xt_LOG
[Wed Aug 28 00:12:08 2019]  xt_multiport xt_limit xt_addrtype xt_tcpudp
xt_conntrack ip6table_filter ip6_tables nf_conntrack_netbios_ns
nf_conntrack_broadcast nf_nat_ftp nf_nat nf_conntrack_ftp nfsd nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_filter bpfilter auth_rpcgss
nfs_acl lockd grace sch_fq_codel sunrpc sg crypto_user ip_tables x_tables e=
xt4
crc32c_generic crc16 mbcache jbd2 hid_logitech_hidpp sd_mod hid_logitech_dj
hid_generic usbhid hid crc32c_intel ahci xhci_pci libahci xhci_hcd libata
usbcore nvme scsi_mod usb_common nvme_core amdgpu amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fo=
ps
drm agpgart vfio_pci irqbypass vfio_virqfd vfio_iommu_type1 vfio
[Wed Aug 28 00:12:08 2019] CPU: 6 PID: 1995 Comm: Xorg Tainted: G        W =
 O=20=20
   5.3.0-rc3-amd-staging-drm-next-git-b8cd95e15410 #1
[Wed Aug 28 00:12:08 2019] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-E GAMING, BIOS 1005 08/01/2019
[Wed Aug 28 00:12:08 2019] RIP: 0010:dcn20_validate_bandwidth.cold+0xe/0x18
[amdgpu]
[Wed Aug 28 00:12:08 2019] Code: d9 05 ef e0 18 00 8b 54 24 08 0f b7 44 24 =
2e
80 cc 0c 66 89 44 24 2c e9 83 ed f4 ff 48 c7 c7 50 49 80 c0 31 c0 e8 dd 8b =
9b
cb &lt;0f&gt; 0b 45 89 f5 e9 5e f3 f4 ff 48 c7 c7 50 49 80 c0 31 c0 e8 c5 8b
[Wed Aug 28 00:12:08 2019] RSP: 0018:ffff9e5e09b43a98 EFLAGS: 00010246
[Wed Aug 28 00:12:08 2019] RAX: 0000000000000024 RBX: 4079400000000000 RCX:
0000000000000000
[Wed Aug 28 00:12:08 2019] RDX: 0000000000000000 RSI: ffff8e847e997448 RDI:
ffff8e847e997448
[Wed Aug 28 00:12:08 2019] RBP: ffff8e8337650000 R08: ffff8e847e997448 R09:
0000000000000004
[Wed Aug 28 00:12:08 2019] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff8e8470d00000
[Wed Aug 28 00:12:08 2019] R13: 0000000000000000 R14: 0000000000000001 R15:
ffff8e84708e6000
[Wed Aug 28 00:12:08 2019] FS:  00007f1c3fdbfdc0(0000)
GS:ffff8e847e980000(0000) knlGS:0000000000000000
[Wed Aug 28 00:12:08 2019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Wed Aug 28 00:12:08 2019] CR2: 00007f4398fee528 CR3: 0000000ff4c52000 CR4:
0000000000340ee0
[Wed Aug 28 00:12:08 2019] Call Trace:
[Wed Aug 28 00:12:08 2019]  dc_validate_global_state+0x28a/0x310 [amdgpu]
[Wed Aug 28 00:12:08 2019]  amdgpu_dm_atomic_check+0x5a2/0x800 [amdgpu]
[Wed Aug 28 00:12:08 2019]  drm_atomic_check_only+0x550/0x780 [drm]
[Wed Aug 28 00:12:08 2019]  drm_atomic_commit+0x13/0x50 [drm]
[Wed Aug 28 00:12:08 2019]  drm_atomic_connector_commit_dpms+0xd7/0x100 [dr=
m]
[Wed Aug 28 00:12:08 2019]  drm_mode_obj_set_property_ioctl+0x159/0x2b0 [dr=
m]
[Wed Aug 28 00:12:08 2019]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[Wed Aug 28 00:12:08 2019]  drm_connector_property_set_ioctl+0x39/0x60 [drm]
[Wed Aug 28 00:12:08 2019]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[Wed Aug 28 00:12:08 2019]  drm_ioctl+0x208/0x390 [drm]
[Wed Aug 28 00:12:08 2019]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[Wed Aug 28 00:12:08 2019]  ? ep_read_events_proc+0xd0/0xd0
[Wed Aug 28 00:12:08 2019]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[Wed Aug 28 00:12:08 2019]  do_vfs_ioctl+0x40c/0x670
[Wed Aug 28 00:12:08 2019]  ksys_ioctl+0x5e/0x90
[Wed Aug 28 00:12:08 2019]  __x64_sys_ioctl+0x16/0x20
[Wed Aug 28 00:12:08 2019]  do_syscall_64+0x4e/0x120
[Wed Aug 28 00:12:08 2019]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[Wed Aug 28 00:12:08 2019] RIP: 0033:0x7f1c411f221b
[Wed Aug 28 00:12:08 2019] Code: 0f 1e fa 48 8b 05 75 8c 0c 00 64 c7 00 26 =
00
00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 =
0f
05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 45 8c 0c 00 f7 d8 64 89 01 48
[Wed Aug 28 00:12:08 2019] RSP: 002b:00007ffe5a751d68 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[Wed Aug 28 00:12:08 2019] RAX: ffffffffffffffda RBX: 00007ffe5a751da0 RCX:
00007f1c411f221b
[Wed Aug 28 00:12:08 2019] RDX: 00007ffe5a751da0 RSI: 00000000c01064ab RDI:
000000000000000d
[Wed Aug 28 00:12:08 2019] RBP: 00000000c01064ab R08: 0000000000000000 R09:
000056432099ffb0
[Wed Aug 28 00:12:08 2019] R10: 0000000000000000 R11: 0000000000000246 R12:
000056431ed03f90
[Wed Aug 28 00:12:08 2019] R13: 000000000000000d R14: 00005643226d4d70 R15:
0000000000000000
[Wed Aug 28 00:12:08 2019] ---[ end trace 7f6319103d8b887e ]---
&quot;&quot;&quot;

Besides the error nothing else happens. Display is still working fine
afterwards (besides the still high power consumption).

As Andrew already mentioned my card also stays at the highest frequency:

&quot;&quot;&quot;
cat /sys/class/drm/card0/device/pp_dpm_mclk
0: 100Mhz=20
1: 500Mhz=20
2: 625Mhz=20
3: 875Mhz *
&quot;&quot;&quot;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669444340.c2C9e1b.30190--

--===============2122666424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2122666424==--
