Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D58EC64A8B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 18:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B586E0EC;
	Wed, 10 Jul 2019 16:12:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B85B96E0EC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 16:12:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B088D72167; Wed, 10 Jul 2019 16:12:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111101] kernel warning with 2400G
Date: Wed, 10 Jul 2019 16:12:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bibitocarlos@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111101-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1112468561=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1112468561==
Content-Type: multipart/alternative; boundary="15627751300.09eb.11180"
Content-Transfer-Encoding: 7bit


--15627751300.09eb.11180
Date: Wed, 10 Jul 2019 16:12:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111101

            Bug ID: 111101
           Summary: kernel warning with 2400G
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: bibitocarlos@gmail.com

Hi,

I get this message in my dmesg, do i have to care (computer works)
"[   13.713042] WARNING: CPU: 7 PID: 907 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:1680
core_link_enable_stream+0xdbb/0x1120 [amdgpu]
[   13.713043] Modules linked in: ccm rc_dib0700_rc5 cmac bnep lm92 dib7000p
arc4 edac_mce_amd iwlmvm ccp rng_core wl(POE) kvm mac80211 irqbypass iwlwifi
dvb_usb_dib0700 dib7000m dib0090 dib0070 dib3000mc dibx000_common dvb_usb
wmi_bmof dvb_core snd_hda_codec_hdmi btusb btrtl btbcm videobuf2_vmalloc
btintel videobuf2_memops snd_hda_intel videobuf2_common bluetooth cfg80211
snd_hda_codec videodev crct10dif_pclmul crc32_pclmul joydev ghash_clmulni_i=
ntel
snd_hda_core snd_hwdep media snd_pcm rc_core snd_timer igb aesni_intel snd
mousedev aes_x86_64 crypto_simd cryptd glue_helper ecdh_generic rfkill dca
eeprom soundcore input_leds i2c_piix4 k10temp pcspkr wmi evdev pinctrl_amd
mac_hid gpio_amdpt pcc_cpufreq acpi_cpufreq nfsd auth_rpcgss nfs_acl lockd
grace sunrpc nct6775 hwmon_vid cpuid msr crypto_user ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 sd_mod hid_generic usbhid hid serio_raw a=
tkbd
libps2 crc32c_intel ahci libahci libata xhci_pci scsi_mod xhci_hcd i8042 se=
rio
amdgpu
[   13.713064]  i2c_algo_bit chash gpu_sched amd_iommu_v2 ttm drm_kms_helper
syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
[   13.713068] CPU: 7 PID: 907 Comm: Xorg Tainted: P        W  OE=20=20=20=
=20
5.1.16-1-ck-zen #1
[   13.713069] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X470 Gaming-ITX/ac, BIOS P1.80 12/17/2018
[   13.713106] RIP: 0010:core_link_enable_stream+0xdbb/0x1120 [amdgpu]
[   13.713107] Code: 60 44 89 fa 44 0f b6 44 24 61 44 0f b6 c8 48 c7 c6 40 =
00
59 c0 bf 04 00 00 00 44 89 cb e8 4d bf d0 ff 84 db 0f 85 0d ff ff ff <0f> 0=
b e9
06 ff ff ff 44 8b 5c 24 38 48 89 eb 4c 8b 64 24 20 4c 8b
[   13.713107] RSP: 0018:ffffaf1c030a7758 EFLAGS: 00010246
[   13.713108] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
000000000000000a
[   13.713109] RDX: 000000000000005d RSI: ffffffffc0590040 RDI:
0000000000000004
[   13.713109] RBP: ffff911f37d6c5c0 R08: 0000000000000017 R09:
0000000000000000
[   13.713110] R10: ffff911f90407a80 R11: ffffaf1c030a7578 R12:
ffffaf1c030a779e
[   13.713110] R13: ffffaf1c030a77b8 R14: 0000000000000000 R15:
000000000000005d
[   13.713111] FS:  00007f27944f7dc0(0000) GS:ffff911f909c0000(0000)
knlGS:0000000000000000
[   13.713111] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   13.713112] CR2: 00007fff6ff64ff8 CR3: 0000000388364000 CR4:
00000000003406e0
[   13.713112] Call Trace:
[   13.713152]  dce110_apply_ctx_to_hw+0x417/0x490 [amdgpu]
[   13.713189]  dc_commit_state+0x280/0x590 [amdgpu]
[   13.713230]  amdgpu_dm_atomic_commit_tail+0x3cf/0x18b0 [amdgpu]
[   13.713266]  ? generic_reg_get+0x31/0xc0 [amdgpu]
[   13.713305]  ? optc1_get_crtc_scanoutpos+0x66/0xa0 [amdgpu]
[   13.713342]  ? dc_stream_get_scanoutpos+0x52/0x60 [amdgpu]
[   13.713381]  ? dm_crtc_get_scanoutpos+0x6a/0xc0 [amdgpu]
[   13.713416]  ? generic_reg_get+0x31/0xc0 [amdgpu]
[   13.713446]  ? amdgpu_bo_pin_restricted+0x62/0x270 [amdgpu]
[   13.713447]  ? preempt_count_add+0x79/0xb0
[   13.713449]  ? _raw_spin_lock_irq+0x1a/0x40
[   13.713449]  ? _raw_spin_unlock_irq+0x1d/0x30
[   13.713450]  ? wait_for_common+0x128/0x170
[   13.713451]  ? wait_for_common+0x128/0x170
[   13.713490]  ? dm_plane_helper_prepare_fb+0x115/0x350 [amdgpu]
[   13.713496]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[   13.713500]  commit_tail+0x3c/0x70 [drm_kms_helper]
[   13.713504]  drm_atomic_helper_commit+0x10c/0x120 [drm_kms_helper]
[   13.713509]  drm_atomic_helper_set_config+0x81/0x90 [drm_kms_helper]
[   13.713517]  drm_mode_setcrtc+0x1a0/0x6a0 [drm]
[   13.713526]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[   13.713533]  drm_ioctl_kernel+0xb0/0xf0 [drm]
[   13.713540]  drm_ioctl+0x217/0x3c0 [drm]
[   13.713548]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[   13.713575]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[   13.713577]  do_vfs_ioctl+0x3fb/0x660
[   13.713579]  ? handle_mm_fault+0x10b/0x270
[   13.713580]  ksys_ioctl+0x5e/0x90
[   13.713581]  __x64_sys_ioctl+0x16/0x20
[   13.713583]  do_syscall_64+0x5b/0x190
[   13.713584]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   13.713585] RIP: 0033:0x7f2795b1f21b
[   13.713586] Code: 0f 1e fa 48 8b 05 75 8c 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 45 8c 0c 00 f7 d8 64 89 01 48
[   13.713586] RSP: 002b:00007ffd379c1888 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[   13.713587] RAX: ffffffffffffffda RBX: 00007ffd379c18c0 RCX:
00007f2795b1f21b
[   13.713587] RDX: 00007ffd379c18c0 RSI: 00000000c06864a2 RDI:
000000000000000e
[   13.713588] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
0000564bd4271730
[   13.713588] R10: 0000000000000000 R11: 0000000000003246 R12:
0000564bd3cd4780
[   13.713589] R13: 000000000000000e R14: 0000000000000000 R15:
0000564bd4271730
[   13.713590] ---[ end trace 7cb20fd7943a71fa ]---
"

Bibi

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15627751300.09eb.11180
Date: Wed, 10 Jul 2019 16:12:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - kernel warning with 2400G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111101">111101</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>kernel warning with 2400G
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>bibitocarlos&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

I get this message in my dmesg, do i have to care (computer works)
&quot;[   13.713042] WARNING: CPU: 7 PID: 907 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:1680
core_link_enable_stream+0xdbb/0x1120 [amdgpu]
[   13.713043] Modules linked in: ccm rc_dib0700_rc5 cmac bnep lm92 dib7000p
arc4 edac_mce_amd iwlmvm ccp rng_core wl(POE) kvm mac80211 irqbypass iwlwifi
dvb_usb_dib0700 dib7000m dib0090 dib0070 dib3000mc dibx000_common dvb_usb
wmi_bmof dvb_core snd_hda_codec_hdmi btusb btrtl btbcm videobuf2_vmalloc
btintel videobuf2_memops snd_hda_intel videobuf2_common bluetooth cfg80211
snd_hda_codec videodev crct10dif_pclmul crc32_pclmul joydev ghash_clmulni_i=
ntel
snd_hda_core snd_hwdep media snd_pcm rc_core snd_timer igb aesni_intel snd
mousedev aes_x86_64 crypto_simd cryptd glue_helper ecdh_generic rfkill dca
eeprom soundcore input_leds i2c_piix4 k10temp pcspkr wmi evdev pinctrl_amd
mac_hid gpio_amdpt pcc_cpufreq acpi_cpufreq nfsd auth_rpcgss nfs_acl lockd
grace sunrpc nct6775 hwmon_vid cpuid msr crypto_user ip_tables x_tables ext4
crc32c_generic crc16 mbcache jbd2 sd_mod hid_generic usbhid hid serio_raw a=
tkbd
libps2 crc32c_intel ahci libahci libata xhci_pci scsi_mod xhci_hcd i8042 se=
rio
amdgpu
[   13.713064]  i2c_algo_bit chash gpu_sched amd_iommu_v2 ttm drm_kms_helper
syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
[   13.713068] CPU: 7 PID: 907 Comm: Xorg Tainted: P        W  OE=20=20=20=
=20
5.1.16-1-ck-zen #1
[   13.713069] Hardware name: To Be Filled By O.E.M. To Be Filled By
O.E.M./X470 Gaming-ITX/ac, BIOS P1.80 12/17/2018
[   13.713106] RIP: 0010:core_link_enable_stream+0xdbb/0x1120 [amdgpu]
[   13.713107] Code: 60 44 89 fa 44 0f b6 44 24 61 44 0f b6 c8 48 c7 c6 40 =
00
59 c0 bf 04 00 00 00 44 89 cb e8 4d bf d0 ff 84 db 0f 85 0d ff ff ff &lt;0f=
&gt; 0b e9
06 ff ff ff 44 8b 5c 24 38 48 89 eb 4c 8b 64 24 20 4c 8b
[   13.713107] RSP: 0018:ffffaf1c030a7758 EFLAGS: 00010246
[   13.713108] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
000000000000000a
[   13.713109] RDX: 000000000000005d RSI: ffffffffc0590040 RDI:
0000000000000004
[   13.713109] RBP: ffff911f37d6c5c0 R08: 0000000000000017 R09:
0000000000000000
[   13.713110] R10: ffff911f90407a80 R11: ffffaf1c030a7578 R12:
ffffaf1c030a779e
[   13.713110] R13: ffffaf1c030a77b8 R14: 0000000000000000 R15:
000000000000005d
[   13.713111] FS:  00007f27944f7dc0(0000) GS:ffff911f909c0000(0000)
knlGS:0000000000000000
[   13.713111] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   13.713112] CR2: 00007fff6ff64ff8 CR3: 0000000388364000 CR4:
00000000003406e0
[   13.713112] Call Trace:
[   13.713152]  dce110_apply_ctx_to_hw+0x417/0x490 [amdgpu]
[   13.713189]  dc_commit_state+0x280/0x590 [amdgpu]
[   13.713230]  amdgpu_dm_atomic_commit_tail+0x3cf/0x18b0 [amdgpu]
[   13.713266]  ? generic_reg_get+0x31/0xc0 [amdgpu]
[   13.713305]  ? optc1_get_crtc_scanoutpos+0x66/0xa0 [amdgpu]
[   13.713342]  ? dc_stream_get_scanoutpos+0x52/0x60 [amdgpu]
[   13.713381]  ? dm_crtc_get_scanoutpos+0x6a/0xc0 [amdgpu]
[   13.713416]  ? generic_reg_get+0x31/0xc0 [amdgpu]
[   13.713446]  ? amdgpu_bo_pin_restricted+0x62/0x270 [amdgpu]
[   13.713447]  ? preempt_count_add+0x79/0xb0
[   13.713449]  ? _raw_spin_lock_irq+0x1a/0x40
[   13.713449]  ? _raw_spin_unlock_irq+0x1d/0x30
[   13.713450]  ? wait_for_common+0x128/0x170
[   13.713451]  ? wait_for_common+0x128/0x170
[   13.713490]  ? dm_plane_helper_prepare_fb+0x115/0x350 [amdgpu]
[   13.713496]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[   13.713500]  commit_tail+0x3c/0x70 [drm_kms_helper]
[   13.713504]  drm_atomic_helper_commit+0x10c/0x120 [drm_kms_helper]
[   13.713509]  drm_atomic_helper_set_config+0x81/0x90 [drm_kms_helper]
[   13.713517]  drm_mode_setcrtc+0x1a0/0x6a0 [drm]
[   13.713526]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[   13.713533]  drm_ioctl_kernel+0xb0/0xf0 [drm]
[   13.713540]  drm_ioctl+0x217/0x3c0 [drm]
[   13.713548]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[   13.713575]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[   13.713577]  do_vfs_ioctl+0x3fb/0x660
[   13.713579]  ? handle_mm_fault+0x10b/0x270
[   13.713580]  ksys_ioctl+0x5e/0x90
[   13.713581]  __x64_sys_ioctl+0x16/0x20
[   13.713583]  do_syscall_64+0x5b/0x190
[   13.713584]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   13.713585] RIP: 0033:0x7f2795b1f21b
[   13.713586] Code: 0f 1e fa 48 8b 05 75 8c 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 45 8c 0c 00 f7 d8 64 89 01 48
[   13.713586] RSP: 002b:00007ffd379c1888 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[   13.713587] RAX: ffffffffffffffda RBX: 00007ffd379c18c0 RCX:
00007f2795b1f21b
[   13.713587] RDX: 00007ffd379c18c0 RSI: 00000000c06864a2 RDI:
000000000000000e
[   13.713588] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
0000564bd4271730
[   13.713588] R10: 0000000000000000 R11: 0000000000003246 R12:
0000564bd3cd4780
[   13.713589] R13: 000000000000000e R14: 0000000000000000 R15:
0000564bd4271730
[   13.713590] ---[ end trace 7cb20fd7943a71fa ]---
&quot;

Bibi</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15627751300.09eb.11180--

--===============1112468561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1112468561==--
