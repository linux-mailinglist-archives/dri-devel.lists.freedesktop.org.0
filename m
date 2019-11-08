Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E418DF4070
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 07:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697786E5BB;
	Fri,  8 Nov 2019 06:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 36DC26E5BB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 06:36:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2C19E720E2; Fri,  8 Nov 2019 06:36:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Fri, 08 Nov 2019 06:36:31 +0000
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
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-i3et4Q99SE@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1162086124=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1162086124==
Content-Type: multipart/alternative; boundary="15731949910.Ad54ed9c5.28134"
Content-Transfer-Encoding: 7bit


--15731949910.Ad54ed9c5.28134
Date: Fri, 8 Nov 2019 06:36:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #41 from Robert <freedesktop@postfach.xyz> ---
(In reply to Shmerl from comment #39)
> With kernel 5.4-rc6 I'm now seeing such errors once in 20 minutes or so:
>=20

I don't see it that often but I also getting it from time to time. I don't =
use
any patches. It's plain 5.4rc6. But I can't see any obvious consequences.

[Fri Nov  8 07:22:49 2019] WARNING: CPU: 22 PID: 2129 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:2801
dcn20_validate_bandwidth+0xc0/0xd0 [amdgpu]
[Fri Nov  8 07:22:49 2019] Modules linked in: msr ngene dm_mod vhost_net vh=
ost
tap tun fuse xt_nat veth xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_=
user
xfrm_algo iptable_nat br_netfilter overlay wireguard(OE) ip6_udp_tunnel
udp_tunnel ebtable_filter ebtables edac_mce_amd kvm_amd snd_usb_audio
snd_usbmidi_lib snd_rawmidi snd_seq_device nct6775(OE) hwmon_vid nls_iso885=
9_1
nls_cp437 vfat fat stv6110x eeepc_wmi lnbp21 asus_wmi battery sparse_keymap
wmi_bmof mxm_wmi kvm snd_hda_codec_realtek snd_hda_codec_generic ledtrig_au=
dio
snd_hda_codec_hdmi crct10dif_pclmul crc32_pclmul snd_hda_intel
ghash_clmulni_intel snd_intel_nhlt snd_hda_codec bridge snd_hda_core btusb
btrtl btbcm snd_hwdep stp btintel llc joydev aesni_intel mousedev crypto_si=
md
bluetooth stv090x input_leds cryptd snd_pcm glue_helper snd_timer pcspkr igb
k10temp ecdh_generic snd ccp rfkill sp5100_tco ecc rng_core i2c_piix4 sound=
core
dca dvb_core pinctrl_amd evdev mac_hid wmi acpi_cpufreq nf_log_ipv6 ip6t_RE=
JECT
nf_reject_ipv6 xt_hl ip6t_rt
[Fri Nov  8 07:22:49 2019]  nf_log_ipv4 nf_log_common ipt_REJECT nf_reject_=
ipv4
xt_LOG xt_multiport xt_limit xt_addrtype xt_tcpudp xt_conntrack ip6table_fi=
lter
ip6_tables nf_conntrack_netbios_ns nf_conntrack_broadcast nf_nat_ftp nf_nat
nf_conntrack_ftp nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c
iptable_filter nfsd uvcvideo videobuf2_vmalloc videobuf2_memops auth_rpcgss
videobuf2_v4l2 videobuf2_common nfs_acl videodev lockd grace mc sunrpc sg
crypto_user ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2
hid_logitech_hidpp hid_logitech_dj hid_generic usbhid hid sd_mod ahci libah=
ci
libata crc32c_intel xhci_pci scsi_mod xhci_hcd amdgpu gpu_sched i2c_algo_bit
ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
vfio_pci irqbypass vfio_virqfd vfio_iommu_type1 vfio [last unloaded: ngene]
[Fri Nov  8 07:22:49 2019] CPU: 22 PID: 2129 Comm: Xorg Tainted: G        W=
  OE
    5.4.0-rc6-mainline #1
[Fri Nov  8 07:22:49 2019] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-E GAMING, BIOS 1201 09/09/2019
[Fri Nov  8 07:22:49 2019] RIP: 0010:dcn20_validate_bandwidth+0xc0/0xd0
[amdgpu]
[Fri Nov  8 07:22:49 2019] Code: 5d 41 5c 41 5d e9 a0 fc ff ff f2 0f 11 85 =
70
21 00 00 31 d2 48 89 ee 4c 89 e7 e8 8b fc ff ff 41 89 c5 22 85 c8 1d 00 00 =
75
04 <0f> 0b eb 92 c6 85 c8 1d 00 00 00 41 89 c5 eb 86 0f 1f 44 00 00 41
[Fri Nov  8 07:22:49 2019] RSP: 0018:ffff959b49adbaa0 EFLAGS: 00010246
[Fri Nov  8 07:22:49 2019] RAX: 0000000000000000 RBX: ffff93672e822bf8 RCX:
000000000374a816
[Fri Nov  8 07:22:49 2019] RDX: 000000000374a616 RSI: ffff93673edaf1a0 RDI:
000000000002f1a0
[Fri Nov  8 07:22:49 2019] RBP: ffff93658ccc0000 R08: 0000000000000006 R09:
0000000000000000
[Fri Nov  8 07:22:49 2019] R10: 0000000000000001 R11: 0000000100000001 R12:
ffff93672faf0000
[Fri Nov  8 07:22:49 2019] R13: 0000000000000001 R14: 0000000000000000 R15:
ffff93672ef01400
[Fri Nov  8 07:22:49 2019] FS:  00007f43fa01adc0(0000)
GS:ffff93673ed80000(0000) knlGS:0000000000000000
[Fri Nov  8 07:22:49 2019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Fri Nov  8 07:22:49 2019] CR2: 00007f6c55528008 CR3: 0000000fad9c0000 CR4:
0000000000340ee0
[Fri Nov  8 07:22:49 2019] Call Trace:
[Fri Nov  8 07:22:49 2019]  dc_validate_global_state+0x28a/0x310 [amdgpu]
[Fri Nov  8 07:22:49 2019]  ? drm_modeset_lock+0x31/0xb0 [drm]
[Fri Nov  8 07:22:49 2019]  amdgpu_dm_atomic_check+0x5a2/0x800 [amdgpu]
[Fri Nov  8 07:22:49 2019]  drm_atomic_check_only+0x578/0x800 [drm]
[Fri Nov  8 07:22:49 2019]  ? _raw_spin_unlock_irqrestore+0x20/0x40
[Fri Nov  8 07:22:49 2019]  drm_atomic_commit+0x13/0x50 [drm]
[Fri Nov  8 07:22:49 2019]  drm_atomic_connector_commit_dpms+0xd7/0x100 [dr=
m]
[Fri Nov  8 07:22:49 2019]  drm_mode_obj_set_property_ioctl+0x169/0x2c0 [dr=
m]
[Fri Nov  8 07:22:49 2019]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[Fri Nov  8 07:22:49 2019]  drm_connector_property_set_ioctl+0x41/0x60 [drm]
[Fri Nov  8 07:22:49 2019]  drm_ioctl_kernel+0xb2/0x100 [drm]
[Fri Nov  8 07:22:49 2019]  drm_ioctl+0x209/0x360 [drm]
[Fri Nov  8 07:22:49 2019]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[Fri Nov  8 07:22:49 2019]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[Fri Nov  8 07:22:49 2019]  do_vfs_ioctl+0x43d/0x6c0
[Fri Nov  8 07:22:49 2019]  ksys_ioctl+0x5e/0x90
[Fri Nov  8 07:22:49 2019]  __x64_sys_ioctl+0x16/0x20
[Fri Nov  8 07:22:49 2019]  do_syscall_64+0x5b/0x1a0
[Fri Nov  8 07:22:49 2019]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[Fri Nov  8 07:22:49 2019] RIP: 0033:0x7f43fb26425b
[Fri Nov  8 07:22:49 2019] Code: 0f 1e fa 48 8b 05 25 9c 0c 00 64 c7 00 26 =
00
00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 =
0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f5 9b 0c 00 f7 d8 64 89 01 48
[Fri Nov  8 07:22:49 2019] RSP: 002b:00007fffa2ba75d8 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[Fri Nov  8 07:22:49 2019] RAX: ffffffffffffffda RBX: 00007fffa2ba7610 RCX:
00007f43fb26425b
[Fri Nov  8 07:22:49 2019] RDX: 00007fffa2ba7610 RSI: 00000000c01064ab RDI:
000000000000000d
[Fri Nov  8 07:22:49 2019] RBP: 00000000c01064ab R08: 0000000000000000 R09:
00007f43fb372d10
[Fri Nov  8 07:22:49 2019] R10: 00007f43fb372d20 R11: 0000000000000246 R12:
000055984f983b90
[Fri Nov  8 07:22:49 2019] R13: 000000000000000d R14: 0000000000000000 R15:
0000000000000000
[Fri Nov  8 07:22:49 2019] ---[ end trace 838cf1460840b9b2 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15731949910.Ad54ed9c5.28134
Date: Fri, 8 Nov 2019 06:36:31 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c41">Comme=
nt # 41</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;postfach.xyz" title=3D"Robert &lt;freedesktop&#64;postfach.=
xyz&gt;"> <span class=3D"fn">Robert</span></a>
</span></b>
        <pre>(In reply to Shmerl from <a href=3D"show_bug.cgi?id=3D111482#c=
39">comment #39</a>)
<span class=3D"quote">&gt; With kernel 5.4-rc6 I'm now seeing such errors o=
nce in 20 minutes or so:
&gt; </span >

I don't see it that often but I also getting it from time to time. I don't =
use
any patches. It's plain 5.4rc6. But I can't see any obvious consequences.

[Fri Nov  8 07:22:49 2019] WARNING: CPU: 22 PID: 2129 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:2801
dcn20_validate_bandwidth+0xc0/0xd0 [amdgpu]
[Fri Nov  8 07:22:49 2019] Modules linked in: msr ngene dm_mod vhost_net vh=
ost
tap tun fuse xt_nat veth xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_=
user
xfrm_algo iptable_nat br_netfilter overlay wireguard(OE) ip6_udp_tunnel
udp_tunnel ebtable_filter ebtables edac_mce_amd kvm_amd snd_usb_audio
snd_usbmidi_lib snd_rawmidi snd_seq_device nct6775(OE) hwmon_vid nls_iso885=
9_1
nls_cp437 vfat fat stv6110x eeepc_wmi lnbp21 asus_wmi battery sparse_keymap
wmi_bmof mxm_wmi kvm snd_hda_codec_realtek snd_hda_codec_generic ledtrig_au=
dio
snd_hda_codec_hdmi crct10dif_pclmul crc32_pclmul snd_hda_intel
ghash_clmulni_intel snd_intel_nhlt snd_hda_codec bridge snd_hda_core btusb
btrtl btbcm snd_hwdep stp btintel llc joydev aesni_intel mousedev crypto_si=
md
bluetooth stv090x input_leds cryptd snd_pcm glue_helper snd_timer pcspkr igb
k10temp ecdh_generic snd ccp rfkill sp5100_tco ecc rng_core i2c_piix4 sound=
core
dca dvb_core pinctrl_amd evdev mac_hid wmi acpi_cpufreq nf_log_ipv6 ip6t_RE=
JECT
nf_reject_ipv6 xt_hl ip6t_rt
[Fri Nov  8 07:22:49 2019]  nf_log_ipv4 nf_log_common ipt_REJECT nf_reject_=
ipv4
xt_LOG xt_multiport xt_limit xt_addrtype xt_tcpudp xt_conntrack ip6table_fi=
lter
ip6_tables nf_conntrack_netbios_ns nf_conntrack_broadcast nf_nat_ftp nf_nat
nf_conntrack_ftp nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c
iptable_filter nfsd uvcvideo videobuf2_vmalloc videobuf2_memops auth_rpcgss
videobuf2_v4l2 videobuf2_common nfs_acl videodev lockd grace mc sunrpc sg
crypto_user ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2
hid_logitech_hidpp hid_logitech_dj hid_generic usbhid hid sd_mod ahci libah=
ci
libata crc32c_intel xhci_pci scsi_mod xhci_hcd amdgpu gpu_sched i2c_algo_bit
ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
vfio_pci irqbypass vfio_virqfd vfio_iommu_type1 vfio [last unloaded: ngene]
[Fri Nov  8 07:22:49 2019] CPU: 22 PID: 2129 Comm: Xorg Tainted: G        W=
  OE
    5.4.0-rc6-mainline #1
[Fri Nov  8 07:22:49 2019] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-E GAMING, BIOS 1201 09/09/2019
[Fri Nov  8 07:22:49 2019] RIP: 0010:dcn20_validate_bandwidth+0xc0/0xd0
[amdgpu]
[Fri Nov  8 07:22:49 2019] Code: 5d 41 5c 41 5d e9 a0 fc ff ff f2 0f 11 85 =
70
21 00 00 31 d2 48 89 ee 4c 89 e7 e8 8b fc ff ff 41 89 c5 22 85 c8 1d 00 00 =
75
04 &lt;0f&gt; 0b eb 92 c6 85 c8 1d 00 00 00 41 89 c5 eb 86 0f 1f 44 00 00 41
[Fri Nov  8 07:22:49 2019] RSP: 0018:ffff959b49adbaa0 EFLAGS: 00010246
[Fri Nov  8 07:22:49 2019] RAX: 0000000000000000 RBX: ffff93672e822bf8 RCX:
000000000374a816
[Fri Nov  8 07:22:49 2019] RDX: 000000000374a616 RSI: ffff93673edaf1a0 RDI:
000000000002f1a0
[Fri Nov  8 07:22:49 2019] RBP: ffff93658ccc0000 R08: 0000000000000006 R09:
0000000000000000
[Fri Nov  8 07:22:49 2019] R10: 0000000000000001 R11: 0000000100000001 R12:
ffff93672faf0000
[Fri Nov  8 07:22:49 2019] R13: 0000000000000001 R14: 0000000000000000 R15:
ffff93672ef01400
[Fri Nov  8 07:22:49 2019] FS:  00007f43fa01adc0(0000)
GS:ffff93673ed80000(0000) knlGS:0000000000000000
[Fri Nov  8 07:22:49 2019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Fri Nov  8 07:22:49 2019] CR2: 00007f6c55528008 CR3: 0000000fad9c0000 CR4:
0000000000340ee0
[Fri Nov  8 07:22:49 2019] Call Trace:
[Fri Nov  8 07:22:49 2019]  dc_validate_global_state+0x28a/0x310 [amdgpu]
[Fri Nov  8 07:22:49 2019]  ? drm_modeset_lock+0x31/0xb0 [drm]
[Fri Nov  8 07:22:49 2019]  amdgpu_dm_atomic_check+0x5a2/0x800 [amdgpu]
[Fri Nov  8 07:22:49 2019]  drm_atomic_check_only+0x578/0x800 [drm]
[Fri Nov  8 07:22:49 2019]  ? _raw_spin_unlock_irqrestore+0x20/0x40
[Fri Nov  8 07:22:49 2019]  drm_atomic_commit+0x13/0x50 [drm]
[Fri Nov  8 07:22:49 2019]  drm_atomic_connector_commit_dpms+0xd7/0x100 [dr=
m]
[Fri Nov  8 07:22:49 2019]  drm_mode_obj_set_property_ioctl+0x169/0x2c0 [dr=
m]
[Fri Nov  8 07:22:49 2019]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[Fri Nov  8 07:22:49 2019]  drm_connector_property_set_ioctl+0x41/0x60 [drm]
[Fri Nov  8 07:22:49 2019]  drm_ioctl_kernel+0xb2/0x100 [drm]
[Fri Nov  8 07:22:49 2019]  drm_ioctl+0x209/0x360 [drm]
[Fri Nov  8 07:22:49 2019]  ? drm_connector_set_obj_prop+0x90/0x90 [drm]
[Fri Nov  8 07:22:49 2019]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[Fri Nov  8 07:22:49 2019]  do_vfs_ioctl+0x43d/0x6c0
[Fri Nov  8 07:22:49 2019]  ksys_ioctl+0x5e/0x90
[Fri Nov  8 07:22:49 2019]  __x64_sys_ioctl+0x16/0x20
[Fri Nov  8 07:22:49 2019]  do_syscall_64+0x5b/0x1a0
[Fri Nov  8 07:22:49 2019]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[Fri Nov  8 07:22:49 2019] RIP: 0033:0x7f43fb26425b
[Fri Nov  8 07:22:49 2019] Code: 0f 1e fa 48 8b 05 25 9c 0c 00 64 c7 00 26 =
00
00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 =
0f
05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d f5 9b 0c 00 f7 d8 64 89 01 48
[Fri Nov  8 07:22:49 2019] RSP: 002b:00007fffa2ba75d8 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[Fri Nov  8 07:22:49 2019] RAX: ffffffffffffffda RBX: 00007fffa2ba7610 RCX:
00007f43fb26425b
[Fri Nov  8 07:22:49 2019] RDX: 00007fffa2ba7610 RSI: 00000000c01064ab RDI:
000000000000000d
[Fri Nov  8 07:22:49 2019] RBP: 00000000c01064ab R08: 0000000000000000 R09:
00007f43fb372d10
[Fri Nov  8 07:22:49 2019] R10: 00007f43fb372d20 R11: 0000000000000246 R12:
000055984f983b90
[Fri Nov  8 07:22:49 2019] R13: 000000000000000d R14: 0000000000000000 R15:
0000000000000000
[Fri Nov  8 07:22:49 2019] ---[ end trace 838cf1460840b9b2 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15731949910.Ad54ed9c5.28134--

--===============1162086124==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1162086124==--
