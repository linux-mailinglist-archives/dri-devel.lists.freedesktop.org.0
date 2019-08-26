Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E662D9CD57
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 12:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAA86E143;
	Mon, 26 Aug 2019 10:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A52F56E143
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 10:33:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9B90E72161; Mon, 26 Aug 2019 10:33:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111487] AMD vega - display off/on -> solid green display
Date: Mon, 26 Aug 2019 10:33:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: bzz@atomicbee.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111487-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0072898988=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0072898988==
Content-Type: multipart/alternative; boundary="15668156350.0bf8.18749"
Content-Transfer-Encoding: 7bit


--15668156350.0bf8.18749
Date: Mon, 26 Aug 2019 10:33:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111487

            Bug ID: 111487
           Summary: AMD vega - display off/on -> solid green display
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: bzz@atomicbee.cz

Created attachment 145168
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145168&action=3Dedit
dmesg after display turned off and on again

I have disabled all screensavers/sleep modes on my desktop and keeping it
running 24/7 only turning off the display.

Using Opensuse tumbleweed and started to get flickering in graphics (only w=
hen
for example scrolling or moving cursor over icons etc. not when the "image"=
 is
static)

Also when i turn off and then on the display, i got just solid green display
and following warning/errors in dmesg:

[37101.852459] WARNING: CPU: 2 PID: 2102 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
[37101.852460] Modules linked in: fuse vhost_net vhost tap tun ebtable_filt=
er
ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_tables bpfil=
ter
scsi_transport_iscsi af_packet br_netfilter bridge stp llc iscsi_ibft
iscsi_boot_sysfs msr nls_iso8859_1 nls_cp437 vfat fat edac_mce_amd kvm_amd =
ccp
kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel
snd_hda_codec_realtek snd_hda_codec_generic aes_x86_64 ledtrig_audio
crypto_simd cryptd glue_helper snd_hda_codec_hdmi eeepc_wmi asus_wmi
sparse_keymap wmi_bmof rfkill snd_hda_intel pcspkr k10temp snd_hda_codec
sp5100_tco snd_hda_core i2c_piix4 snd_hwdep snd_pcm r8169 snd_timer snd rea=
ltek
soundcore joydev libphy gpio_amdpt gpio_generic pcc_cpufreq button acpi_cpu=
freq
uas usb_storage hid_logitech_hidpp btrfs hid_logitech_dj libcrc32c xor raid=
6_pq
hid_generic usbhid amdgpu crc32c_intel amd_iommu_v2 gpu_sched i2c_algo_bit =
ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm xhci_pci
xhci_hcd usbcore wmi
[37101.852471]  video pinctrl_amd sg dm_multipath dm_mod scsi_dh_rdac
scsi_dh_emc scsi_dh_alua efivarfs
[37101.852473] CPU: 2 PID: 2102 Comm: X Tainted: G        W=20=20=20=20=20=
=20=20=20
5.2.9-1-default #1 openSUSE Tumbleweed (unreleased)
[37101.852474] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1804 07/29/2019
[37101.852514] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[amdgpu]
[37101.852515] Code: 83 c8 ff e9 a9 ca f9 ff 48 c7 c7 b8 aa 6c c0 e8 7c d5 =
2c
d0 0f 0b 83 c8 ff e9 93 ca f9 ff 48 c7 c7 b8 aa 6c c0 e8 66 d5 2c d0 <0f> 0=
b 80
bb 93 01 00 00 00 75 05 e9 79 ee f9 ff 48 8b 83 80 02 00
[37101.852515] RSP: 0018:ffffac1083c1b638 EFLAGS: 00010282
[37101.852516] RAX: 0000000000000024 RBX: ffff9257e5060000 RCX:
0000000000000006
[37101.852516] RDX: 0000000000000007 RSI: 0000000000000002 RDI:
ffff9257eea99a10
[37101.852517] RBP: ffff9252e0fd0ec0 R08: 000021be72bbc983 R09:
ffff9257ee800000
[37101.852517] R10: 000000000000b22e R11: 00000000001d545c R12:
ffff9252e0fd0000
[37101.852517] R13: ffff9257e5060000 R14: ffff9257e582e540 R15:
0000000000000003
[37101.852518] FS:  00007fddbce26940(0000) GS:ffff9257eea80000(0000)
knlGS:0000000000000000
[37101.852518] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[37101.852519] CR2: 00000008004354c8 CR3: 00000007d22e6000 CR4:
00000000003406e0
[37101.852519] Call Trace:
[37101.852558]  dcn10_program_pipe+0x1a7/0x270 [amdgpu]
[37101.852596]  dcn10_apply_ctx_for_surface+0x4d6/0x5e0 [amdgpu]
[37101.852634]  dc_commit_updates_for_stream+0x7f1/0xbe0 [amdgpu]
[37101.852671]  amdgpu_dm_commit_planes.constprop.0+0x6b4/0x880 [amdgpu]
[37101.852709]  amdgpu_dm_atomic_commit_tail+0x9be/0xd30 [amdgpu]
[37101.852714]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[37101.852718]  commit_tail+0x3c/0x70 [drm_kms_helper]
[37101.852722]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[37101.852726]  restore_fbdev_mode_atomic+0x1b3/0x1c0 [drm_kms_helper]
[37101.852729]  drm_fb_helper_pan_display+0xb6/0x1c0 [drm_kms_helper]
[37101.852731]  fb_pan_display+0x83/0x100
[37101.852732]  bit_update_start+0x1a/0x40
[37101.852733]  fbcon_switch+0x3a3/0x570
[37101.852734]  redraw_screen+0x128/0x210
[37101.852735]  fbcon_blank+0x277/0x2a0
[37101.852737]  do_unblank_screen+0xaa/0x150
[37101.852738]  complete_change_console+0x54/0xd0
[37101.852738]  vt_ioctl+0x1181/0x11c0
[37101.852744]  ? drm_setmaster_ioctl+0xb0/0xb0 [drm]
[37101.852745]  tty_ioctl+0x372/0x8c0
[37101.852746]  ? ktime_get_mono_fast_ns+0x4e/0x90
[37101.852747]  do_vfs_ioctl+0x447/0x640
[37101.852748]  ? do_futex+0x10a/0x1d0
[37101.852749]  ksys_ioctl+0x5e/0x90
[37101.852750]  ? trace_hardirqs_off_thunk+0x1a/0x33
[37101.852751]  __x64_sys_ioctl+0x16/0x20
[37101.852752]  do_syscall_64+0x6e/0x1e0
[37101.852753]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[37101.852754] RIP: 0033:0x7fddbd20a7c7
[37101.852755] Code: 00 00 90 48 8b 05 d1 86 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d a1 86 0c 00 f7 d8 64 89 01 48
[37101.852755] RSP: 002b:00007fff001ac908 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[37101.852756] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007fddbd20a7c7
[37101.852756] RDX: 0000000000000001 RSI: 0000000000005605 RDI:
000000000000000c
[37101.852756] RBP: 00005617c64392cc R08: 0000000000000000 R09:
00007fff001ac630
[37101.852757] R10: 0000000000000007 R11: 0000000000003246 R12:
00005617c6439390
[37101.852757] R13: 00005617c6439380 R14: 00005617c64392c8 R15:
00007fff001ac984
[37101.852758] ---[ end trace 4bb79af4c980bd53 ]---

attached full dmesg after turning off and on display (Dell U3014)

also attached glxinfo after reboot (because when i got solid green display,
nothing else that full reboot will fix it. Or i didn't find yet what could.
systemctl restart display-manager doesn't help)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668156350.0bf8.18749
Date: Mon, 26 Aug 2019 10:33:55 +0000
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
   title=3D"NEW - AMD vega - display off/on -&gt; solid green display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111487">111487</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>AMD vega - display off/on -&gt; solid green display
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>bzz&#64;atomicbee.cz
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145168=
" name=3D"attach_145168" title=3D"dmesg after display turned off and on aga=
in">attachment 145168</a> <a href=3D"attachment.cgi?id=3D145168&amp;action=
=3Dedit" title=3D"dmesg after display turned off and on again">[details]</a=
></span>
dmesg after display turned off and on again

I have disabled all screensavers/sleep modes on my desktop and keeping it
running 24/7 only turning off the display.

Using Opensuse tumbleweed and started to get flickering in graphics (only w=
hen
for example scrolling or moving cursor over icons etc. not when the &quot;i=
mage&quot; is
static)

Also when i turn off and then on the display, i got just solid green display
and following warning/errors in dmesg:

[37101.852459] WARNING: CPU: 2 PID: 2102 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
[37101.852460] Modules linked in: fuse vhost_net vhost tap tun ebtable_filt=
er
ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_tables bpfil=
ter
scsi_transport_iscsi af_packet br_netfilter bridge stp llc iscsi_ibft
iscsi_boot_sysfs msr nls_iso8859_1 nls_cp437 vfat fat edac_mce_amd kvm_amd =
ccp
kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel
snd_hda_codec_realtek snd_hda_codec_generic aes_x86_64 ledtrig_audio
crypto_simd cryptd glue_helper snd_hda_codec_hdmi eeepc_wmi asus_wmi
sparse_keymap wmi_bmof rfkill snd_hda_intel pcspkr k10temp snd_hda_codec
sp5100_tco snd_hda_core i2c_piix4 snd_hwdep snd_pcm r8169 snd_timer snd rea=
ltek
soundcore joydev libphy gpio_amdpt gpio_generic pcc_cpufreq button acpi_cpu=
freq
uas usb_storage hid_logitech_hidpp btrfs hid_logitech_dj libcrc32c xor raid=
6_pq
hid_generic usbhid amdgpu crc32c_intel amd_iommu_v2 gpu_sched i2c_algo_bit =
ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm xhci_pci
xhci_hcd usbcore wmi
[37101.852471]  video pinctrl_amd sg dm_multipath dm_mod scsi_dh_rdac
scsi_dh_emc scsi_dh_alua efivarfs
[37101.852473] CPU: 2 PID: 2102 Comm: X Tainted: G        W=20=20=20=20=20=
=20=20=20
5.2.9-1-default #1 openSUSE Tumbleweed (unreleased)
[37101.852474] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1804 07/29/2019
[37101.852514] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[amdgpu]
[37101.852515] Code: 83 c8 ff e9 a9 ca f9 ff 48 c7 c7 b8 aa 6c c0 e8 7c d5 =
2c
d0 0f 0b 83 c8 ff e9 93 ca f9 ff 48 c7 c7 b8 aa 6c c0 e8 66 d5 2c d0 &lt;0f=
&gt; 0b 80
bb 93 01 00 00 00 75 05 e9 79 ee f9 ff 48 8b 83 80 02 00
[37101.852515] RSP: 0018:ffffac1083c1b638 EFLAGS: 00010282
[37101.852516] RAX: 0000000000000024 RBX: ffff9257e5060000 RCX:
0000000000000006
[37101.852516] RDX: 0000000000000007 RSI: 0000000000000002 RDI:
ffff9257eea99a10
[37101.852517] RBP: ffff9252e0fd0ec0 R08: 000021be72bbc983 R09:
ffff9257ee800000
[37101.852517] R10: 000000000000b22e R11: 00000000001d545c R12:
ffff9252e0fd0000
[37101.852517] R13: ffff9257e5060000 R14: ffff9257e582e540 R15:
0000000000000003
[37101.852518] FS:  00007fddbce26940(0000) GS:ffff9257eea80000(0000)
knlGS:0000000000000000
[37101.852518] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[37101.852519] CR2: 00000008004354c8 CR3: 00000007d22e6000 CR4:
00000000003406e0
[37101.852519] Call Trace:
[37101.852558]  dcn10_program_pipe+0x1a7/0x270 [amdgpu]
[37101.852596]  dcn10_apply_ctx_for_surface+0x4d6/0x5e0 [amdgpu]
[37101.852634]  dc_commit_updates_for_stream+0x7f1/0xbe0 [amdgpu]
[37101.852671]  amdgpu_dm_commit_planes.constprop.0+0x6b4/0x880 [amdgpu]
[37101.852709]  amdgpu_dm_atomic_commit_tail+0x9be/0xd30 [amdgpu]
[37101.852714]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[37101.852718]  commit_tail+0x3c/0x70 [drm_kms_helper]
[37101.852722]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[37101.852726]  restore_fbdev_mode_atomic+0x1b3/0x1c0 [drm_kms_helper]
[37101.852729]  drm_fb_helper_pan_display+0xb6/0x1c0 [drm_kms_helper]
[37101.852731]  fb_pan_display+0x83/0x100
[37101.852732]  bit_update_start+0x1a/0x40
[37101.852733]  fbcon_switch+0x3a3/0x570
[37101.852734]  redraw_screen+0x128/0x210
[37101.852735]  fbcon_blank+0x277/0x2a0
[37101.852737]  do_unblank_screen+0xaa/0x150
[37101.852738]  complete_change_console+0x54/0xd0
[37101.852738]  vt_ioctl+0x1181/0x11c0
[37101.852744]  ? drm_setmaster_ioctl+0xb0/0xb0 [drm]
[37101.852745]  tty_ioctl+0x372/0x8c0
[37101.852746]  ? ktime_get_mono_fast_ns+0x4e/0x90
[37101.852747]  do_vfs_ioctl+0x447/0x640
[37101.852748]  ? do_futex+0x10a/0x1d0
[37101.852749]  ksys_ioctl+0x5e/0x90
[37101.852750]  ? trace_hardirqs_off_thunk+0x1a/0x33
[37101.852751]  __x64_sys_ioctl+0x16/0x20
[37101.852752]  do_syscall_64+0x6e/0x1e0
[37101.852753]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[37101.852754] RIP: 0033:0x7fddbd20a7c7
[37101.852755] Code: 00 00 90 48 8b 05 d1 86 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d a1 86 0c 00 f7 d8 64 89 01 48
[37101.852755] RSP: 002b:00007fff001ac908 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[37101.852756] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007fddbd20a7c7
[37101.852756] RDX: 0000000000000001 RSI: 0000000000005605 RDI:
000000000000000c
[37101.852756] RBP: 00005617c64392cc R08: 0000000000000000 R09:
00007fff001ac630
[37101.852757] R10: 0000000000000007 R11: 0000000000003246 R12:
00005617c6439390
[37101.852757] R13: 00005617c6439380 R14: 00005617c64392c8 R15:
00007fff001ac984
[37101.852758] ---[ end trace 4bb79af4c980bd53 ]---

attached full dmesg after turning off and on display (Dell U3014)

also attached glxinfo after reboot (because when i got solid green display,
nothing else that full reboot will fix it. Or i didn't find yet what could.
systemctl restart display-manager doesn't help)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668156350.0bf8.18749--

--===============0072898988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0072898988==--
