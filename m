Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E4101038
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 01:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EFFD6E85A;
	Tue, 19 Nov 2019 00:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 406C26E85A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 00:30:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3C495720E2; Tue, 19 Nov 2019 00:30:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111659] Kernel panic when waking up after screens go to dpms
 sleep
Date: Tue, 19 Nov 2019 00:30:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brad@fnarfbargle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111659-502-uFaTDl945k@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111659-502@http.bugs.freedesktop.org/>
References: <bug-111659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0231553977=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0231553977==
Content-Type: multipart/alternative; boundary="15741234131.A47B.17538"
Content-Transfer-Encoding: 7bit


--15741234131.A47B.17538
Date: Tue, 19 Nov 2019 00:30:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111659

--- Comment #8 from Brad Campbell <brad@fnarfbargle.com> ---
I'm running out of ideas. I assume from the complete lack of interest I'm
either putting this in the wrong place or everyone is concentrating on new
hardware.

Recap. This is happening on two separate and different machines. Both iMac,=
 but
one with a 6770M and one with a 6970M just to rule out hardware failure.

Tried it with dpm off. That made it last a bit longer, but :=20

[925997.946677] BUG: kernel NULL pointer dereference, address: 000000000000=
03f0
[925997.946690] #PF: supervisor write access in kernel mode
[925997.946693] #PF: error_code(0x0002) - not-present page
[925997.946695] PGD 0 P4D 0=20
[925997.946701] Oops: 0002 [#1] SMP
[925997.946705] CPU: 3 PID: 26449 Comm: Xorg Not tainted 5.4.0-rc6-bkc1+ #4
[925997.946707] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BI=
OS
82.0.0.0.0 09/25/2018
[925997.946716] RIP: 0010:mutex_lock+0x14/0x30
[925997.946720] Code: e9 22 fd ff ff 90 be 02 00 00 00 e9 66 fb ff ff 66 0f=
 1f
44 00 00 53 48 89 fb e8 e7 ea ff ff 31 c0 65 48 8b 14 25 00 5d 01 00 <f0> 4=
8 0f
b1 13 75 02 5b c3 48 89 df 5b eb cd 0f 1f 00 66 2e 0f 1f
[925997.946723] RSP: 0018:ffffc90000357a90 EFLAGS: 00010246
[925997.946726] RAX: 0000000000000000 RBX: 00000000000003f0 RCX:
ffffc90000357b2f
[925997.946729] RDX: ffff888264e38000 RSI: 0000000000000008 RDI:
00000000000003f0
[925997.946732] RBP: 0000000000000000 R08: 0000000000000001 R09:
0000000000000000
[925997.946734] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000001
[925997.946737] R13: 00000000fffffffb R14: 00000000ffffffb9 R15:
0000000000000000
[925997.946741] FS:  00007f92358580c0(0000) GS:ffff888267b80000(0000)
knlGS:0000000000000000
[925997.946743] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[925997.946746] CR2: 00000000000003f0 CR3: 0000000263d9b004 CR4:
00000000000606a0
[925997.946748] Call Trace:
[925997.946761]  drm_dp_dpcd_access+0x57/0xf0 [drm_kms_helper]
[925997.946769]  drm_dp_dpcd_write+0x21/0x90 [drm_kms_helper]
[925997.946804]  radeon_dp_set_tp+0x4f/0x80 [radeon]
[925997.946832]  radeon_dp_link_train+0x54f/0x570 [radeon]
[925997.946862]  radeon_atom_encoder_dpms_dig+0x21a/0x4e0 [radeon]
[925997.946881]  ? atombios_blank_crtc+0x130/0x130 [radeon]
[925997.946907]  radeon_atom_encoder_dpms+0xa6/0x110 [radeon]
[925997.946913]  drm_helper_connector_dpms+0x10b/0x150 [drm_kms_helper]
[925997.946928]  drm_connector_set_obj_prop+0x56/0x70 [drm]
[925997.946941]  drm_mode_obj_set_property_ioctl+0x252/0x270 [drm]
[925997.946946]  ? schedule+0x34/0x90
[925997.946951]  ? __lock_page_killable+0x132/0x1c0
[925997.946963]  ? drm_connector_set_obj_prop+0x70/0x70 [drm]
[925997.946973]  drm_connector_property_set_ioctl+0x29/0x30 [drm]
[925997.946984]  drm_ioctl_kernel+0x83/0xd0 [drm]
[925997.946994]  drm_ioctl+0x2a5/0x320 [drm]
[925997.947005]  ? drm_connector_set_obj_prop+0x70/0x70 [drm]
[925997.947009]  ? filemap_map_pages+0x151/0x310
[925997.947023]  radeon_drm_ioctl+0x44/0x80 [radeon]
[925997.947029]  do_vfs_ioctl+0x8a/0x5d0
[925997.947033]  ksys_ioctl+0x35/0x60
[925997.947037]  __x64_sys_ioctl+0x11/0x20
[925997.947041]  do_syscall_64+0x3d/0x110
[925997.947045]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[925997.947048] RIP: 0033:0x7f923301c017
[925997.947052] Code: 00 00 00 48 8b 05 81 7e 2b 00 64 c7 00 26 00 00 00 48=
 c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 51 7e 2b 00 f7 d8 64 89 01 48
[925997.947055] RSP: 002b:00007ffd32cab5d8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[925997.947058] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f923301c017
[925997.947061] RDX: 00007ffd32cab610 RSI: 00000000c01064ab RDI:
000000000000000f
[925997.947063] RBP: 00007ffd32cab610 R08: 0000560d26e47aa0 R09:
0000000000000001
[925997.947068] R10: 0000000000000000 R11: 0000000000003246 R12:
00000000c01064ab
[925997.947070] R13: 000000000000000f R14: 0000560d26dc7c50 R15:
0000560d2517a580
[925997.947073] Modules linked in: ntfs msdos ext2 fuse cpuid loop isofs
nls_utf8 hfsplus nls_iso8859_1 nls_cp437 vfat fat cpufreq_userspace
cpufreq_powersave cpufreq_conservative nfsv4 nfsd auth_rpcgss nfs_acl nfs l=
ockd
grace fscache sunrpc af_packet dm_crypt dm_mod dax coretemp kvm_intel kvm
irqbypass applesmc inp
ut_polldev led_class btusb btbcm btintel uvcvideo bluetooth videobuf2_vmall=
oc
rfkill snd_usb_audio videobuf2_memops ecdh_generic videobuf2_v4l2 ecc
snd_usbmidi_lib videodev joydev snd_hda_codec_cirrus videobuf2_common evdev
snd_hda_codec_generic snd_rawmidi snd_hda_codec_hdmi snd_hda_intel
snd_intel_nhlt snd_hda_cod
ec snd_hwdep snd_hda_core snd_pcm snd_timer snd apple_bl soundcore button e=
xt4
crc32c_generic crc16 mbcache jbd2 netconsole configfs hid_apple hid_appleir=
 sg
hid_generic usbhid hid usb_storage sr_mod cdrom sd_mod aesni_intel glue_hel=
per
crypto_simd cryptd xhci_pci xhci_hcd ahci radeon firewire_ohci libahci
firewire_
core crc_itu_t i2c_algo_bit backlight drm_kms_helper
[925997.947119]  syscopyarea sysfillrect sysimgblt fb_sys_fops uhci_hcd
ehci_pci tg3 ttm ehci_hcd libphy drm usbcore usb_common i2c_core
[925997.947132] CR2: 00000000000003f0
[925997.947135] ---[ end trace 19041427bf8bf31b ]---
[925997.947140] RIP: 0010:mutex_lock+0x14/0x30
[925997.947160] Code: e9 22 fd ff ff 90 be 02 00 00 00 e9 66 fb ff ff 66 0f=
 1f
44 00 00 53 48 89 fb e8 e7 ea ff ff 31 c0 65 48 8b 14 25 00 5d 01 00 <f0> 4=
8 0f
b1 13 75 02 5b c3 48 89 df 5b eb cd 0f 1f 00 66 2e 0f 1f
[925997.947163] RSP: 0018:ffffc90000357a90 EFLAGS: 00010246
[925997.947166] RAX: 0000000000000000 RBX: 00000000000003f0 RCX:
ffffc90000357b2f
[925997.947168] RDX: ffff888264e38000 RSI: 0000000000000008 RDI:
00000000000003f0
[925997.947170] RBP: 0000000000000000 R08: 0000000000000001 R09:
0000000000000000
[925997.947173] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000001
[925997.947175] R13: 00000000fffffffb R14: 00000000ffffffb9 R15:
0000000000000000
[925997.947178] FS:  00007f92358580c0(0000) GS:ffff888267b80000(0000)
knlGS:0000000000000000
[925997.947181] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[925997.947183] CR2: 00000000000003f0 CR3: 0000000263d9b004 CR4:
00000000000606a0
[925997.947186] Kernel panic - not syncing: Fatal exception
[925997.947226] Kernel Offset: disabled
[925997.947230] Rebooting in 10 seconds..
[926007.947755] ACPI MEMORY or I/O RESET_REG.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15741234131.A47B.17538
Date: Tue, 19 Nov 2019 00:30:13 +0000
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
   title=3D"NEW - Kernel panic when waking up after screens go to dpms slee=
p"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel panic when waking up after screens go to dpms slee=
p"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659">bug 11165=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
brad&#64;fnarfbargle.com" title=3D"Brad Campbell &lt;brad&#64;fnarfbargle.c=
om&gt;"> <span class=3D"fn">Brad Campbell</span></a>
</span></b>
        <pre>I'm running out of ideas. I assume from the complete lack of i=
nterest I'm
either putting this in the wrong place or everyone is concentrating on new
hardware.

Recap. This is happening on two separate and different machines. Both iMac,=
 but
one with a 6770M and one with a 6970M just to rule out hardware failure.

Tried it with dpm off. That made it last a bit longer, but :=20

[925997.946677] BUG: kernel NULL pointer dereference, address: 000000000000=
03f0
[925997.946690] #PF: supervisor write access in kernel mode
[925997.946693] #PF: error_code(0x0002) - not-present page
[925997.946695] PGD 0 P4D 0=20
[925997.946701] Oops: 0002 [#1] SMP
[925997.946705] CPU: 3 PID: 26449 Comm: Xorg Not tainted 5.4.0-rc6-bkc1+ #4
[925997.946707] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BI=
OS
82.0.0.0.0 09/25/2018
[925997.946716] RIP: 0010:mutex_lock+0x14/0x30
[925997.946720] Code: e9 22 fd ff ff 90 be 02 00 00 00 e9 66 fb ff ff 66 0f=
 1f
44 00 00 53 48 89 fb e8 e7 ea ff ff 31 c0 65 48 8b 14 25 00 5d 01 00 &lt;f0=
&gt; 48 0f
b1 13 75 02 5b c3 48 89 df 5b eb cd 0f 1f 00 66 2e 0f 1f
[925997.946723] RSP: 0018:ffffc90000357a90 EFLAGS: 00010246
[925997.946726] RAX: 0000000000000000 RBX: 00000000000003f0 RCX:
ffffc90000357b2f
[925997.946729] RDX: ffff888264e38000 RSI: 0000000000000008 RDI:
00000000000003f0
[925997.946732] RBP: 0000000000000000 R08: 0000000000000001 R09:
0000000000000000
[925997.946734] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000001
[925997.946737] R13: 00000000fffffffb R14: 00000000ffffffb9 R15:
0000000000000000
[925997.946741] FS:  00007f92358580c0(0000) GS:ffff888267b80000(0000)
knlGS:0000000000000000
[925997.946743] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[925997.946746] CR2: 00000000000003f0 CR3: 0000000263d9b004 CR4:
00000000000606a0
[925997.946748] Call Trace:
[925997.946761]  drm_dp_dpcd_access+0x57/0xf0 [drm_kms_helper]
[925997.946769]  drm_dp_dpcd_write+0x21/0x90 [drm_kms_helper]
[925997.946804]  radeon_dp_set_tp+0x4f/0x80 [radeon]
[925997.946832]  radeon_dp_link_train+0x54f/0x570 [radeon]
[925997.946862]  radeon_atom_encoder_dpms_dig+0x21a/0x4e0 [radeon]
[925997.946881]  ? atombios_blank_crtc+0x130/0x130 [radeon]
[925997.946907]  radeon_atom_encoder_dpms+0xa6/0x110 [radeon]
[925997.946913]  drm_helper_connector_dpms+0x10b/0x150 [drm_kms_helper]
[925997.946928]  drm_connector_set_obj_prop+0x56/0x70 [drm]
[925997.946941]  drm_mode_obj_set_property_ioctl+0x252/0x270 [drm]
[925997.946946]  ? schedule+0x34/0x90
[925997.946951]  ? __lock_page_killable+0x132/0x1c0
[925997.946963]  ? drm_connector_set_obj_prop+0x70/0x70 [drm]
[925997.946973]  drm_connector_property_set_ioctl+0x29/0x30 [drm]
[925997.946984]  drm_ioctl_kernel+0x83/0xd0 [drm]
[925997.946994]  drm_ioctl+0x2a5/0x320 [drm]
[925997.947005]  ? drm_connector_set_obj_prop+0x70/0x70 [drm]
[925997.947009]  ? filemap_map_pages+0x151/0x310
[925997.947023]  radeon_drm_ioctl+0x44/0x80 [radeon]
[925997.947029]  do_vfs_ioctl+0x8a/0x5d0
[925997.947033]  ksys_ioctl+0x35/0x60
[925997.947037]  __x64_sys_ioctl+0x11/0x20
[925997.947041]  do_syscall_64+0x3d/0x110
[925997.947045]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[925997.947048] RIP: 0033:0x7f923301c017
[925997.947052] Code: 00 00 00 48 8b 05 81 7e 2b 00 64 c7 00 26 00 00 00 48=
 c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 51 7e 2b 00 f7 d8 64 89 01 48
[925997.947055] RSP: 002b:00007ffd32cab5d8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[925997.947058] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f923301c017
[925997.947061] RDX: 00007ffd32cab610 RSI: 00000000c01064ab RDI:
000000000000000f
[925997.947063] RBP: 00007ffd32cab610 R08: 0000560d26e47aa0 R09:
0000000000000001
[925997.947068] R10: 0000000000000000 R11: 0000000000003246 R12:
00000000c01064ab
[925997.947070] R13: 000000000000000f R14: 0000560d26dc7c50 R15:
0000560d2517a580
[925997.947073] Modules linked in: ntfs msdos ext2 fuse cpuid loop isofs
nls_utf8 hfsplus nls_iso8859_1 nls_cp437 vfat fat cpufreq_userspace
cpufreq_powersave cpufreq_conservative nfsv4 nfsd auth_rpcgss nfs_acl nfs l=
ockd
grace fscache sunrpc af_packet dm_crypt dm_mod dax coretemp kvm_intel kvm
irqbypass applesmc inp
ut_polldev led_class btusb btbcm btintel uvcvideo bluetooth videobuf2_vmall=
oc
rfkill snd_usb_audio videobuf2_memops ecdh_generic videobuf2_v4l2 ecc
snd_usbmidi_lib videodev joydev snd_hda_codec_cirrus videobuf2_common evdev
snd_hda_codec_generic snd_rawmidi snd_hda_codec_hdmi snd_hda_intel
snd_intel_nhlt snd_hda_cod
ec snd_hwdep snd_hda_core snd_pcm snd_timer snd apple_bl soundcore button e=
xt4
crc32c_generic crc16 mbcache jbd2 netconsole configfs hid_apple hid_appleir=
 sg
hid_generic usbhid hid usb_storage sr_mod cdrom sd_mod aesni_intel glue_hel=
per
crypto_simd cryptd xhci_pci xhci_hcd ahci radeon firewire_ohci libahci
firewire_
core crc_itu_t i2c_algo_bit backlight drm_kms_helper
[925997.947119]  syscopyarea sysfillrect sysimgblt fb_sys_fops uhci_hcd
ehci_pci tg3 ttm ehci_hcd libphy drm usbcore usb_common i2c_core
[925997.947132] CR2: 00000000000003f0
[925997.947135] ---[ end trace 19041427bf8bf31b ]---
[925997.947140] RIP: 0010:mutex_lock+0x14/0x30
[925997.947160] Code: e9 22 fd ff ff 90 be 02 00 00 00 e9 66 fb ff ff 66 0f=
 1f
44 00 00 53 48 89 fb e8 e7 ea ff ff 31 c0 65 48 8b 14 25 00 5d 01 00 &lt;f0=
&gt; 48 0f
b1 13 75 02 5b c3 48 89 df 5b eb cd 0f 1f 00 66 2e 0f 1f
[925997.947163] RSP: 0018:ffffc90000357a90 EFLAGS: 00010246
[925997.947166] RAX: 0000000000000000 RBX: 00000000000003f0 RCX:
ffffc90000357b2f
[925997.947168] RDX: ffff888264e38000 RSI: 0000000000000008 RDI:
00000000000003f0
[925997.947170] RBP: 0000000000000000 R08: 0000000000000001 R09:
0000000000000000
[925997.947173] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000001
[925997.947175] R13: 00000000fffffffb R14: 00000000ffffffb9 R15:
0000000000000000
[925997.947178] FS:  00007f92358580c0(0000) GS:ffff888267b80000(0000)
knlGS:0000000000000000
[925997.947181] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[925997.947183] CR2: 00000000000003f0 CR3: 0000000263d9b004 CR4:
00000000000606a0
[925997.947186] Kernel panic - not syncing: Fatal exception
[925997.947226] Kernel Offset: disabled
[925997.947230] Rebooting in 10 seconds..
[926007.947755] ACPI MEMORY or I/O RESET_REG.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15741234131.A47B.17538--

--===============0231553977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0231553977==--
