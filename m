Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9BDC86E6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 13:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC206E92B;
	Wed,  2 Oct 2019 11:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BF5776E92B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 11:03:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B578A72162; Wed,  2 Oct 2019 11:03:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111881] [kernel 5.4-rc1][amdgpu][CIK]: FW bug: No PASID in KFD
 interrupt
Date: Wed, 02 Oct 2019 11:03:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/amdkfd
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111881-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1544005509=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1544005509==
Content-Type: multipart/alternative; boundary="15700142060.7E8A478.3100"
Content-Transfer-Encoding: 7bit


--15700142060.7E8A478.3100
Date: Wed, 2 Oct 2019 11:03:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111881

            Bug ID: 111881
           Summary: [kernel 5.4-rc1][amdgpu][CIK]: FW bug: No PASID in KFD
                    interrupt
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/amdkfd
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: erhard_f@mailbox.org

Created attachment 145612
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145612&action=3Dedit
dmesg (kernel 5.4-rc1)

Card is a Sapphire Radeon R9 290 Tri-X running on a Supermicro H8SGL (Opter=
on
6380) with Gentoo Linux. OpenCL driver is ROCm 2.8.0.

clinfo segfaults, also the kernel gets a hit:

[...]
Okt 02 12:47:51 yea kernel: clinfo[1138]: segfault at 1000 ip 00007f78d4f52=
971
sp 00007ffd81ab7170 error 6 in libhsa-runtime64.so.1.1.9[7f78d4f34000+c7000]
Okt 02 12:47:51 yea kernel: Code: ff ff ff 48 8b 85 58 ff ff ff 48 8b 80 b8=
 03
00 00 48 8b 95 78 ff ff ff 48 c1 e2 03 48 01 c2 48 8b 85 68 ff ff ff 48 8b =
40
18 <48> 89 02 c6 45 b0 01 bb 00 00 00 00 0f b6 45 b0 83 f0 01 84 c0 74
Okt 02 12:47:59 yea kernel: Evicting PASID 32770 queues
Okt 02 12:47:59 yea kernel: ------------[ cut here ]------------
Okt 02 12:47:59 yea kernel: FW bug: No PASID in KFD interrupt
Okt 02 12:47:59 yea kernel: WARNING: CPU: 5 PID: 0 at
drivers/gpu/drm/amd/amdgpu/../amdkfd/cik_event_interrupt.c:70
cik_event_interrupt_isr+0x223/0x230 [amdgpu]
Okt 02 12:47:59 yea kernel: Modules linked in: fuse dm_crypt nhpoly1305_sse2
nhpoly1305 chacha_x86_64 chacha_generic adiantum poly1305_generic
algif_skcipher amd64_edac_mod crct10dif_pclmul crc32_generic crc32_pclmul
dm_mod joydev input_leds ghash_generic gf128mul gcm hid_generic usbhid hid =
xts
ext4 crc16 mbcache ctr jbd2 ath5k led_class amdgpu cbc mac80211 ath ohci_pci
ecb evdev cfg80211 gpu_sched ehci_pci ohci_hcd snd_oxygen i2c_algo_bit ehci=
_hcd
fam15h_power snd_oxygen_lib aesni_intel ttm snd_mpu401_uart sr_mod glue_hel=
per
rfkill snd_rawmidi usbcore crypto_simd k10temp libarc4 cdrom cryptd
drm_kms_helper snd_hda_codec_hdmi hwmon snd_seq_device i2c_piix4 usb_common
cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt snd_hda_intel
fb_sys_fops cfbcopyarea snd_intel_nhlt fb snd_hda_codec font snd_hwdep fbdev
snd_hda_core drm e1000e snd_pcm snd_timer snd drm_panel_orientation_quirks
backlight soundcore button acpi_cpufreq processor lzo zstd sg zram zsmalloc
Okt 02 12:47:59 yea kernel: CPU: 5 PID: 0 Comm: swapper/5 Not tainted 5.4.0=
-rc1
#1
Okt 02 12:47:59 yea kernel: Hardware name: Supermicro H8SGL/H8SGL, BIOS 3.5=
b=20=20=20
   03/18/2016
Okt 02 12:47:59 yea kernel: RIP: 0010:cik_event_interrupt_isr+0x223/0x230
[amdgpu]
Okt 02 12:47:59 yea kernel: Code: ff 0f b6 05 53 15 49 00 84 c0 74 07 31 c0=
 e9
b0 fe ff ff 48 c7 c7 c0 b2 88 c1 88 44 24 08 c6 05 36 15 49 00 01 e8 81 0f =
a5
f8 <0f> 0b 0f b6 44 24 08 e9 8d fe ff ff 90 48 b8 00 00 00 00 00 fc ff
Okt 02 12:47:59 yea kernel: RSP: 0018:ffff8883e7888c08 EFLAGS: 00010086
Okt 02 12:47:59 yea kernel: RAX: 0000000000000000 RBX: ffff8883cc044b48 RCX:
ffffffffba10693f
Okt 02 12:47:59 yea kernel: RDX: 0000000000000003 RSI: dffffc0000000000 RDI:
ffff8883e5704f80
Okt 02 12:47:59 yea kernel: RBP: ffff8883e7888c40 R08: fffffbfff76d3d31 R09:
fffffbfff76d3d31
Okt 02 12:47:59 yea kernel: R10: fffffbfff76d3d30 R11: ffffffffbb69e983 R12:
0000000000000008
Okt 02 12:47:59 yea kernel: R13: 00000000000000b5 R14: 0000000000000023 R15:
0000000000000000
Okt 02 12:47:59 yea kernel: FS:  0000000000000000(0000)
GS:ffff8883e7880000(0000) knlGS:0000000000000000
Okt 02 12:47:59 yea kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
Okt 02 12:47:59 yea kernel: CR2: 00007fea9066f000 CR3: 00000007f52c2000 CR4:
00000000000406e0
Okt 02 12:47:59 yea kernel: Call Trace:
Okt 02 12:47:59 yea kernel:  <IRQ>
Okt 02 12:47:59 yea kernel:  kgd2kfd_interrupt+0x151/0x1a0 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? kgd2kfd_resume+0xa0/0xa0 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? check_flags.part.41+0x82/0x210
Okt 02 12:47:59 yea kernel:  ? amdgpu_fence_process+0x95/0x1b0 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? amdgpu_irq_dispatch+0x184/0x390 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? gfx_v7_0_eop_irq+0xba/0x100 [amdgpu]
Okt 02 12:47:59 yea kernel:  amdgpu_irq_dispatch+0x1c6/0x390 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? amdgpu_irq_add_id+0x160/0x160 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? lock_downgrade+0x390/0x390
Okt 02 12:47:59 yea kernel:  amdgpu_ih_process+0xf4/0x1d0 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? amdgpu_irq_disable_all+0x1b0/0x1b0 [amdgpu]
Okt 02 12:47:59 yea kernel:  amdgpu_irq_handler+0x20/0x60 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? amdgpu_irq_disable_all+0x1b0/0x1b0 [amdgpu]
Okt 02 12:47:59 yea kernel:  __handle_irq_event_percpu+0x72/0x390
Okt 02 12:47:59 yea kernel:  handle_irq_event_percpu+0x6a/0xe0
Okt 02 12:47:59 yea kernel:  ? __handle_irq_event_percpu+0x390/0x390
Okt 02 12:47:59 yea kernel:  ? rwlock_bug.part.2+0x50/0x50
Okt 02 12:47:59 yea kernel:  ? do_raw_spin_unlock+0x9d/0x130
Okt 02 12:47:59 yea kernel:  handle_irq_event+0x4f/0x7e
Okt 02 12:47:59 yea kernel:  handle_edge_irq+0x100/0x2d0
Okt 02 12:47:59 yea kernel:  do_IRQ+0x72/0x160
Okt 02 12:47:59 yea kernel:  common_interrupt+0xf/0xf
Okt 02 12:47:59 yea kernel:  </IRQ>
Okt 02 12:47:59 yea kernel: RIP: 0010:cpuidle_enter_state+0xcd/0x640
Okt 02 12:47:59 yea kernel: Code: 00 31 ff e8 a5 86 80 ff 80 7c 24 10 00 74=
 12
9c 58 f6 c4 02 0f 85 42 05 00 00 31 ff e8 cc 5e 89 ff e8 f7 be 8f ff fb 45 =
85
e4 <0f> 88 fb 03 00 00 4d 63 ec 4f 8d 74 6d 00 49 c1 e6 05 4a 8d 7c 33
Okt 02 12:47:59 yea kernel: RSP: 0018:ffff8883e571fd98 EFLAGS: 00000202
ORIG_RAX: ffffffffffffffdd
Okt 02 12:47:59 yea kernel: RAX: 0000000000000000 RBX: ffffffffc0316680 RCX:
ffffffffba1067e0
Okt 02 12:47:59 yea kernel: RDX: 0000000000000007 RSI: dffffc0000000000 RDI:
ffff8883e5704fb4
Okt 02 12:47:59 yea kernel: RBP: ffff888812779028 R08: 0000000000000002 R09:
0000000000000000
Okt 02 12:47:59 yea kernel: R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000002
Okt 02 12:47:59 yea kernel: R13: 0000000000000002 R14: ffffffffc0316740 R15:
ffffffffc0316780
Okt 02 12:47:59 yea kernel:  ? lockdep_hardirqs_on+0x190/0x280
Okt 02 12:47:59 yea kernel:  ? cpuidle_enter_state+0xc9/0x640
Okt 02 12:47:59 yea kernel:  cpuidle_enter+0x37/0x60
Okt 02 12:47:59 yea kernel:  do_idle+0x2e7/0x380
Okt 02 12:47:59 yea kernel:  ? arch_cpu_idle_exit+0x40/0x40
Okt 02 12:47:59 yea kernel:  ? schedule_idle+0x41/0x50
Okt 02 12:47:59 yea kernel:  cpu_startup_entry+0x14/0x20
Okt 02 12:47:59 yea kernel:  start_secondary+0x1fd/0x240
Okt 02 12:47:59 yea kernel:  ? set_cpu_sibling_map+0xbc0/0xbc0
Okt 02 12:47:59 yea kernel:  secondary_startup_64+0xa4/0xb0
Okt 02 12:47:59 yea kernel: irq event stamp: 450550
Okt 02 12:47:59 yea kernel: hardirqs last  enabled at (450547):
[<ffffffffba8c30b9>] cpuidle_enter_state+0xc9/0x640
Okt 02 12:47:59 yea kernel: hardirqs last disabled at (450548):
[<ffffffffba00276a>] trace_hardirqs_off_thunk+0x1a/0x20
Okt 02 12:47:59 yea kernel: softirqs last  enabled at (450550):
[<ffffffffba07b210>] irq_enter+0x70/0x80
Okt 02 12:47:59 yea kernel: softirqs last disabled at (450549):
[<ffffffffba07b1f5>] irq_enter+0x55/0x80
Okt 02 12:47:59 yea kernel: ---[ end trace 5951fa91933dcafd ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700142060.7E8A478.3100
Date: Wed, 2 Oct 2019 11:03:26 +0000
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
   title=3D"NEW - [kernel 5.4-rc1][amdgpu][CIK]: FW bug: No PASID in KFD in=
terrupt"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111881">111881</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[kernel 5.4-rc1][amdgpu][CIK]: FW bug: No PASID in KFD interr=
upt
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/amdkfd
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>erhard_f&#64;mailbox.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145612=
" name=3D"attach_145612" title=3D"dmesg (kernel 5.4-rc1)">attachment 145612=
</a> <a href=3D"attachment.cgi?id=3D145612&amp;action=3Dedit" title=3D"dmes=
g (kernel 5.4-rc1)">[details]</a></span>
dmesg (kernel 5.4-rc1)

Card is a Sapphire Radeon R9 290 Tri-X running on a Supermicro H8SGL (Opter=
on
6380) with Gentoo Linux. OpenCL driver is ROCm 2.8.0.

clinfo segfaults, also the kernel gets a hit:

[...]
Okt 02 12:47:51 yea kernel: clinfo[1138]: segfault at 1000 ip 00007f78d4f52=
971
sp 00007ffd81ab7170 error 6 in libhsa-runtime64.so.1.1.9[7f78d4f34000+c7000]
Okt 02 12:47:51 yea kernel: Code: ff ff ff 48 8b 85 58 ff ff ff 48 8b 80 b8=
 03
00 00 48 8b 95 78 ff ff ff 48 c1 e2 03 48 01 c2 48 8b 85 68 ff ff ff 48 8b =
40
18 &lt;48&gt; 89 02 c6 45 b0 01 bb 00 00 00 00 0f b6 45 b0 83 f0 01 84 c0 74
Okt 02 12:47:59 yea kernel: Evicting PASID 32770 queues
Okt 02 12:47:59 yea kernel: ------------[ cut here ]------------
Okt 02 12:47:59 yea kernel: FW bug: No PASID in KFD interrupt
Okt 02 12:47:59 yea kernel: WARNING: CPU: 5 PID: 0 at
drivers/gpu/drm/amd/amdgpu/../amdkfd/cik_event_interrupt.c:70
cik_event_interrupt_isr+0x223/0x230 [amdgpu]
Okt 02 12:47:59 yea kernel: Modules linked in: fuse dm_crypt nhpoly1305_sse2
nhpoly1305 chacha_x86_64 chacha_generic adiantum poly1305_generic
algif_skcipher amd64_edac_mod crct10dif_pclmul crc32_generic crc32_pclmul
dm_mod joydev input_leds ghash_generic gf128mul gcm hid_generic usbhid hid =
xts
ext4 crc16 mbcache ctr jbd2 ath5k led_class amdgpu cbc mac80211 ath ohci_pci
ecb evdev cfg80211 gpu_sched ehci_pci ohci_hcd snd_oxygen i2c_algo_bit ehci=
_hcd
fam15h_power snd_oxygen_lib aesni_intel ttm snd_mpu401_uart sr_mod glue_hel=
per
rfkill snd_rawmidi usbcore crypto_simd k10temp libarc4 cdrom cryptd
drm_kms_helper snd_hda_codec_hdmi hwmon snd_seq_device i2c_piix4 usb_common
cfbfillrect syscopyarea cfbimgblt sysfillrect sysimgblt snd_hda_intel
fb_sys_fops cfbcopyarea snd_intel_nhlt fb snd_hda_codec font snd_hwdep fbdev
snd_hda_core drm e1000e snd_pcm snd_timer snd drm_panel_orientation_quirks
backlight soundcore button acpi_cpufreq processor lzo zstd sg zram zsmalloc
Okt 02 12:47:59 yea kernel: CPU: 5 PID: 0 Comm: swapper/5 Not tainted 5.4.0=
-rc1
#1
Okt 02 12:47:59 yea kernel: Hardware name: Supermicro H8SGL/H8SGL, BIOS 3.5=
b=20=20=20
   03/18/2016
Okt 02 12:47:59 yea kernel: RIP: 0010:cik_event_interrupt_isr+0x223/0x230
[amdgpu]
Okt 02 12:47:59 yea kernel: Code: ff 0f b6 05 53 15 49 00 84 c0 74 07 31 c0=
 e9
b0 fe ff ff 48 c7 c7 c0 b2 88 c1 88 44 24 08 c6 05 36 15 49 00 01 e8 81 0f =
a5
f8 &lt;0f&gt; 0b 0f b6 44 24 08 e9 8d fe ff ff 90 48 b8 00 00 00 00 00 fc ff
Okt 02 12:47:59 yea kernel: RSP: 0018:ffff8883e7888c08 EFLAGS: 00010086
Okt 02 12:47:59 yea kernel: RAX: 0000000000000000 RBX: ffff8883cc044b48 RCX:
ffffffffba10693f
Okt 02 12:47:59 yea kernel: RDX: 0000000000000003 RSI: dffffc0000000000 RDI:
ffff8883e5704f80
Okt 02 12:47:59 yea kernel: RBP: ffff8883e7888c40 R08: fffffbfff76d3d31 R09:
fffffbfff76d3d31
Okt 02 12:47:59 yea kernel: R10: fffffbfff76d3d30 R11: ffffffffbb69e983 R12:
0000000000000008
Okt 02 12:47:59 yea kernel: R13: 00000000000000b5 R14: 0000000000000023 R15:
0000000000000000
Okt 02 12:47:59 yea kernel: FS:  0000000000000000(0000)
GS:ffff8883e7880000(0000) knlGS:0000000000000000
Okt 02 12:47:59 yea kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
Okt 02 12:47:59 yea kernel: CR2: 00007fea9066f000 CR3: 00000007f52c2000 CR4:
00000000000406e0
Okt 02 12:47:59 yea kernel: Call Trace:
Okt 02 12:47:59 yea kernel:  &lt;IRQ&gt;
Okt 02 12:47:59 yea kernel:  kgd2kfd_interrupt+0x151/0x1a0 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? kgd2kfd_resume+0xa0/0xa0 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? check_flags.part.41+0x82/0x210
Okt 02 12:47:59 yea kernel:  ? amdgpu_fence_process+0x95/0x1b0 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? amdgpu_irq_dispatch+0x184/0x390 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? gfx_v7_0_eop_irq+0xba/0x100 [amdgpu]
Okt 02 12:47:59 yea kernel:  amdgpu_irq_dispatch+0x1c6/0x390 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? amdgpu_irq_add_id+0x160/0x160 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? lock_downgrade+0x390/0x390
Okt 02 12:47:59 yea kernel:  amdgpu_ih_process+0xf4/0x1d0 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? amdgpu_irq_disable_all+0x1b0/0x1b0 [amdgpu]
Okt 02 12:47:59 yea kernel:  amdgpu_irq_handler+0x20/0x60 [amdgpu]
Okt 02 12:47:59 yea kernel:  ? amdgpu_irq_disable_all+0x1b0/0x1b0 [amdgpu]
Okt 02 12:47:59 yea kernel:  __handle_irq_event_percpu+0x72/0x390
Okt 02 12:47:59 yea kernel:  handle_irq_event_percpu+0x6a/0xe0
Okt 02 12:47:59 yea kernel:  ? __handle_irq_event_percpu+0x390/0x390
Okt 02 12:47:59 yea kernel:  ? rwlock_bug.part.2+0x50/0x50
Okt 02 12:47:59 yea kernel:  ? do_raw_spin_unlock+0x9d/0x130
Okt 02 12:47:59 yea kernel:  handle_irq_event+0x4f/0x7e
Okt 02 12:47:59 yea kernel:  handle_edge_irq+0x100/0x2d0
Okt 02 12:47:59 yea kernel:  do_IRQ+0x72/0x160
Okt 02 12:47:59 yea kernel:  common_interrupt+0xf/0xf
Okt 02 12:47:59 yea kernel:  &lt;/IRQ&gt;
Okt 02 12:47:59 yea kernel: RIP: 0010:cpuidle_enter_state+0xcd/0x640
Okt 02 12:47:59 yea kernel: Code: 00 31 ff e8 a5 86 80 ff 80 7c 24 10 00 74=
 12
9c 58 f6 c4 02 0f 85 42 05 00 00 31 ff e8 cc 5e 89 ff e8 f7 be 8f ff fb 45 =
85
e4 &lt;0f&gt; 88 fb 03 00 00 4d 63 ec 4f 8d 74 6d 00 49 c1 e6 05 4a 8d 7c 33
Okt 02 12:47:59 yea kernel: RSP: 0018:ffff8883e571fd98 EFLAGS: 00000202
ORIG_RAX: ffffffffffffffdd
Okt 02 12:47:59 yea kernel: RAX: 0000000000000000 RBX: ffffffffc0316680 RCX:
ffffffffba1067e0
Okt 02 12:47:59 yea kernel: RDX: 0000000000000007 RSI: dffffc0000000000 RDI:
ffff8883e5704fb4
Okt 02 12:47:59 yea kernel: RBP: ffff888812779028 R08: 0000000000000002 R09:
0000000000000000
Okt 02 12:47:59 yea kernel: R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000002
Okt 02 12:47:59 yea kernel: R13: 0000000000000002 R14: ffffffffc0316740 R15:
ffffffffc0316780
Okt 02 12:47:59 yea kernel:  ? lockdep_hardirqs_on+0x190/0x280
Okt 02 12:47:59 yea kernel:  ? cpuidle_enter_state+0xc9/0x640
Okt 02 12:47:59 yea kernel:  cpuidle_enter+0x37/0x60
Okt 02 12:47:59 yea kernel:  do_idle+0x2e7/0x380
Okt 02 12:47:59 yea kernel:  ? arch_cpu_idle_exit+0x40/0x40
Okt 02 12:47:59 yea kernel:  ? schedule_idle+0x41/0x50
Okt 02 12:47:59 yea kernel:  cpu_startup_entry+0x14/0x20
Okt 02 12:47:59 yea kernel:  start_secondary+0x1fd/0x240
Okt 02 12:47:59 yea kernel:  ? set_cpu_sibling_map+0xbc0/0xbc0
Okt 02 12:47:59 yea kernel:  secondary_startup_64+0xa4/0xb0
Okt 02 12:47:59 yea kernel: irq event stamp: 450550
Okt 02 12:47:59 yea kernel: hardirqs last  enabled at (450547):
[&lt;ffffffffba8c30b9&gt;] cpuidle_enter_state+0xc9/0x640
Okt 02 12:47:59 yea kernel: hardirqs last disabled at (450548):
[&lt;ffffffffba00276a&gt;] trace_hardirqs_off_thunk+0x1a/0x20
Okt 02 12:47:59 yea kernel: softirqs last  enabled at (450550):
[&lt;ffffffffba07b210&gt;] irq_enter+0x70/0x80
Okt 02 12:47:59 yea kernel: softirqs last disabled at (450549):
[&lt;ffffffffba07b1f5&gt;] irq_enter+0x55/0x80
Okt 02 12:47:59 yea kernel: ---[ end trace 5951fa91933dcafd ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700142060.7E8A478.3100--

--===============1544005509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1544005509==--
