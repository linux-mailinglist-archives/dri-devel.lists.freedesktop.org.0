Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A37E5A734
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 00:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE736E989;
	Fri, 28 Jun 2019 22:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B6826E989
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 22:52:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 42C8072167; Fri, 28 Jun 2019 22:52:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111021] [amdgpu][CIK] cp queue preemption time out, BUG: kernel
 NULL pointer dereference, address: 0000000000000038
Date: Fri, 28 Jun 2019 22:52:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111021-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2114137073=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2114137073==
Content-Type: multipart/alternative; boundary="15617623480.8cdE.18648"
Content-Transfer-Encoding: 7bit


--15617623480.8cdE.18648
Date: Fri, 28 Jun 2019 22:52:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111021

            Bug ID: 111021
           Summary: [amdgpu][CIK] cp queue preemption time out, BUG:
                    kernel NULL pointer dereference, address:
                    0000000000000038
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: erhard_f@mailbox.org

Created attachment 144678
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144678&action=3Dedit
kernel .dmesg (5.2-rc6)

[...]
[  440.685185] cp queue preemption time out
[  440.685338] Resetting wave fronts (nocpsch) on dev 00000000feee3825
[  440.685426] BUG: kernel NULL pointer dereference, address: 0000000000000=
038
[  440.685432] #PF: supervisor read access in kernel mode
[  440.685436] #PF: error_code(0x0000) - not-present page
[  440.685440] PGD 0 P4D 0=20
[  440.685448] Oops: 0000 [#1] SMP NOPTI
[  440.685455] CPU: 3 PID: 1026 Comm: xmr-stak Not tainted 5.2.0-rc6 #1
[  440.685459] Hardware name: System manufacturer System Product Name/M5A78=
L-M
LX3, BIOS 1401    05/05/2016
[  440.685610] RIP: 0010:amdgpu_ib_schedule+0x4b/0x520 [amdgpu]
[  440.685616] Code: 89 f5 49 89 ff 48 89 54 24 08 0f b6 87 38 04 00 00 48 =
85
c9 0f 84 5d 03 00 00 48 8b 91 b0 00 00 00 48 89 54 24 10 48 8b 51 10 <48> 8=
b 52
38 48 89 14 24 84 c0 0f 84 09 e2 17 00 48 83 7c 24 10 00
[  440.685621] RSP: 0018:ffffac368c2a7ad0 EFLAGS: 00010286
[  440.685626] RAX: 0000000000000001 RBX: ffff97d66533dc00 RCX:
ffff97d66533dc00
[  440.685630] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff97d685fe7d48
[  440.685634] RBP: 0000000000000001 R08: ffffac368c2a7b48 R09:
0000000000000001
[  440.685638] R10: 0000000000000000 R11: 0000000000000001 R12:
0000000000000007
[  440.685642] R13: 0000000000ffd000 R14: ffff97d685fe0000 R15:
ffff97d685fe7d48
[  440.685647] FS:  00007f2115109700(0000) GS:ffff97d6a6ac0000(0000)
knlGS:0000000000000000
[  440.685651] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  440.685655] CR2: 0000000000000038 CR3: 00000003e4236000 CR4:
00000000000406e0
[  440.685659] Call Trace:
[  440.685669]  ? rcu_read_lock_sched_held+0x50/0x60
[  440.685807]  amdgpu_amdkfd_submit_ib+0xb6/0x170 [amdgpu]
[  440.685949]  deallocate_vmid.isra.12+0xe4/0xf0 [amdgpu]
[  440.686091]  destroy_queue_nocpsch_locked+0x176/0x190 [amdgpu]
[  440.686233]  process_termination_nocpsch+0x5e/0x130 [amdgpu]
[  440.686373]  kfd_process_dequeue_from_all_devices+0x36/0x50 [amdgpu]
[  440.686512]  kfd_process_notifier_release+0xf4/0x180 [amdgpu]
[  440.686519]  __mmu_notifier_release+0x65/0x110
[  440.686527]  exit_mmap+0x3b/0x170
[  440.686534]  mmput+0x45/0x110
[  440.686539]  do_exit+0x27d/0xb90
[  440.686546]  ? find_held_lock+0x2d/0x90
[  440.686551]  ? get_signal+0xcc/0xaa0
[  440.686556]  do_group_exit+0x42/0xb0
[  440.686561]  get_signal+0x119/0xaa0
[  440.686568]  do_signal+0x3e/0x620
[  440.686574]  ? find_held_lock+0x2d/0x90
[  440.686580]  exit_to_usermode_loop+0x4b/0xa0
[  440.686585]  do_syscall_64+0x149/0x1a0
[  440.686591]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  440.686596] RIP: 0033:0x7f212b976f6c
[  440.686604] Code: Bad RIP value.
[  440.686608] RSP: 002b:00007f2115108d30 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[  440.686614] RAX: fffffffffffffe00 RBX: 00007f211d838c48 RCX:
00007f212b976f6c
[  440.686618] RDX: 0000000000000000 RSI: 0000000000000080 RDI:
00007f211d838c70
[  440.686622] RBP: 0000000000000000 R08: 0000000000000000 R09:
00007f2115109700
[  440.686626] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000010
[  440.686630] R13: 00007f211d838c20 R14: 0000000000000000 R15:
00007f211d838c70
[  440.686634] Modules linked in: fuse sha256_ssse3 sha256_generic cfg80211
rfkill dm_crypt nhpoly1305_sse2 nhpoly1305 chacha_x86_64 chacha_generic
adiantum poly1305_generic algif_skcipher af_alg ext4 crc16 mbcache jbd2
input_leds led_class joydev hid_generic usbhid hid crct10dif_pclmul
crc32_generic crc32_pclmul ghash_generic gf128mul gcm xts ctr dm_mod cbc am=
dgpu
ecb evdev gpu_sched ohci_pci i2c_algo_bit ttm snd_hda_codec_realtek
snd_hda_codec_generic snd_hda_codec_hdmi drm_kms_helper ehci_pci ohci_hcd
cfbfillrect syscopyarea snd_hda_intel cfbimgblt k10temp sysfillrect ehci_hcd
aesni_intel sysimgblt fb_sys_fops snd_hda_codec cfbcopyarea fb snd_hwdep
usbcore aes_x86_64 snd_hda_core fam15h_power hwmon i2c_piix4 usb_common font
glue_helper crypto_simd sr_mod snd_pcm cryptd fbdev cdrom button snd_timer =
drm
acpi_cpufreq snd alx drm_panel_orientation_quirks soundcore processor backl=
ight
mdio lzo nfsd auth_rpcgss lockd grace zstd sunrpc sg zram zsmalloc
[  440.686714] CR2: 0000000000000038
[  440.686720] ---[ end trace 39cfe5e575b273f7 ]---
[  440.686847] RIP: 0010:amdgpu_ib_schedule+0x4b/0x520 [amdgpu]
[  440.686852] Code: 89 f5 49 89 ff 48 89 54 24 08 0f b6 87 38 04 00 00 48 =
85
c9 0f 84 5d 03 00 00 48 8b 91 b0 00 00 00 48 89 54 24 10 48 8b 51 10 <48> 8=
b 52
38 48 89 14 24 84 c0 0f 84 09 e2 17 00 48 83 7c 24 10 00
[  440.686857] RSP: 0018:ffffac368c2a7ad0 EFLAGS: 00010286
[  440.686862] RAX: 0000000000000001 RBX: ffff97d66533dc00 RCX:
ffff97d66533dc00
[  440.686866] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff97d685fe7d48
[  440.686869] RBP: 0000000000000001 R08: ffffac368c2a7b48 R09:
0000000000000001
[  440.686873] R10: 0000000000000000 R11: 0000000000000001 R12:
0000000000000007
[  440.686877] R13: 0000000000ffd000 R14: ffff97d685fe0000 R15:
ffff97d685fe7d48
[  440.686882] FS:  00007f2115109700(0000) GS:ffff97d6a6ac0000(0000)
knlGS:0000000000000000
[  440.686887] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  440.686890] CR2: 00007f212b976f42 CR3: 00000003e4236000 CR4:
00000000000406e0
[  440.686894] Fixing recursive fault but reboot is needed!

This happens every time when xmr-stak 2.10.5 (w. ROCm 2.5) tries to compile
shaders for this R9 290X. An ~/.AMD archive is generated but the compilation
process never finishes. When I close the shell with xmr-stak running (CTRL-C
xmr-stack does not work), I get this kernel BUG. I used a 5.2-rc6 debug ker=
nel,
but it happens on 5.1.15 too.

Card is a Sapphire Radeon R9 290X Tri-X OC (11226-18-20G), additional info
about the the system:

Machine:   Type: Desktop Mobo: ASUSTeK model: M5A78L-M LX3 v: Rev X.0x seri=
al:
<root required> BIOS: American Megatrends=20
           v: 1401 date: 05/05/2016=20
CPU:       6-Core: AMD FX-6300 type: MCP speed: 3817 MHz min/max: 1400/3800=
 MHz=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Hawaii XT / Grenada XT
[Radeon R9 290X/390X] driver: amdgpu v: kernel=20
           Display: x11 server: X.Org 1.20.4 driver: amdgpu,ati unloaded:
modesetting,radeon resolution: 1920x1080~60Hz=20
           OpenGL: renderer: AMD Radeon R9 200 Series (HAWAII DRM 3.30.0
5.1.15-gentoo LLVM 8.0.0) v: 4.5 Mesa 19.0.8

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15617623480.8cdE.18648
Date: Fri, 28 Jun 2019 22:52:28 +0000
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
   title=3D"NEW - [amdgpu][CIK] cp queue preemption time out, BUG: kernel N=
ULL pointer dereference, address: 0000000000000038"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111021">111021</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[amdgpu][CIK] cp queue preemption time out, BUG: kernel NULL =
pointer dereference, address: 0000000000000038
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>erhard_f&#64;mailbox.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144678=
" name=3D"attach_144678" title=3D"kernel .dmesg (5.2-rc6)">attachment 14467=
8</a> <a href=3D"attachment.cgi?id=3D144678&amp;action=3Dedit" title=3D"ker=
nel .dmesg (5.2-rc6)">[details]</a></span>
kernel .dmesg (5.2-rc6)

[...]
[  440.685185] cp queue preemption time out
[  440.685338] Resetting wave fronts (nocpsch) on dev 00000000feee3825
[  440.685426] BUG: kernel NULL pointer dereference, address: 0000000000000=
038
[  440.685432] #PF: supervisor read access in kernel mode
[  440.685436] #PF: error_code(0x0000) - not-present page
[  440.685440] PGD 0 P4D 0=20
[  440.685448] Oops: 0000 [#1] SMP NOPTI
[  440.685455] CPU: 3 PID: 1026 Comm: xmr-stak Not tainted 5.2.0-rc6 #1
[  440.685459] Hardware name: System manufacturer System Product Name/M5A78=
L-M
LX3, BIOS 1401    05/05/2016
[  440.685610] RIP: 0010:amdgpu_ib_schedule+0x4b/0x520 [amdgpu]
[  440.685616] Code: 89 f5 49 89 ff 48 89 54 24 08 0f b6 87 38 04 00 00 48 =
85
c9 0f 84 5d 03 00 00 48 8b 91 b0 00 00 00 48 89 54 24 10 48 8b 51 10 &lt;48=
&gt; 8b 52
38 48 89 14 24 84 c0 0f 84 09 e2 17 00 48 83 7c 24 10 00
[  440.685621] RSP: 0018:ffffac368c2a7ad0 EFLAGS: 00010286
[  440.685626] RAX: 0000000000000001 RBX: ffff97d66533dc00 RCX:
ffff97d66533dc00
[  440.685630] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff97d685fe7d48
[  440.685634] RBP: 0000000000000001 R08: ffffac368c2a7b48 R09:
0000000000000001
[  440.685638] R10: 0000000000000000 R11: 0000000000000001 R12:
0000000000000007
[  440.685642] R13: 0000000000ffd000 R14: ffff97d685fe0000 R15:
ffff97d685fe7d48
[  440.685647] FS:  00007f2115109700(0000) GS:ffff97d6a6ac0000(0000)
knlGS:0000000000000000
[  440.685651] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  440.685655] CR2: 0000000000000038 CR3: 00000003e4236000 CR4:
00000000000406e0
[  440.685659] Call Trace:
[  440.685669]  ? rcu_read_lock_sched_held+0x50/0x60
[  440.685807]  amdgpu_amdkfd_submit_ib+0xb6/0x170 [amdgpu]
[  440.685949]  deallocate_vmid.isra.12+0xe4/0xf0 [amdgpu]
[  440.686091]  destroy_queue_nocpsch_locked+0x176/0x190 [amdgpu]
[  440.686233]  process_termination_nocpsch+0x5e/0x130 [amdgpu]
[  440.686373]  kfd_process_dequeue_from_all_devices+0x36/0x50 [amdgpu]
[  440.686512]  kfd_process_notifier_release+0xf4/0x180 [amdgpu]
[  440.686519]  __mmu_notifier_release+0x65/0x110
[  440.686527]  exit_mmap+0x3b/0x170
[  440.686534]  mmput+0x45/0x110
[  440.686539]  do_exit+0x27d/0xb90
[  440.686546]  ? find_held_lock+0x2d/0x90
[  440.686551]  ? get_signal+0xcc/0xaa0
[  440.686556]  do_group_exit+0x42/0xb0
[  440.686561]  get_signal+0x119/0xaa0
[  440.686568]  do_signal+0x3e/0x620
[  440.686574]  ? find_held_lock+0x2d/0x90
[  440.686580]  exit_to_usermode_loop+0x4b/0xa0
[  440.686585]  do_syscall_64+0x149/0x1a0
[  440.686591]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[  440.686596] RIP: 0033:0x7f212b976f6c
[  440.686604] Code: Bad RIP value.
[  440.686608] RSP: 002b:00007f2115108d30 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[  440.686614] RAX: fffffffffffffe00 RBX: 00007f211d838c48 RCX:
00007f212b976f6c
[  440.686618] RDX: 0000000000000000 RSI: 0000000000000080 RDI:
00007f211d838c70
[  440.686622] RBP: 0000000000000000 R08: 0000000000000000 R09:
00007f2115109700
[  440.686626] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000010
[  440.686630] R13: 00007f211d838c20 R14: 0000000000000000 R15:
00007f211d838c70
[  440.686634] Modules linked in: fuse sha256_ssse3 sha256_generic cfg80211
rfkill dm_crypt nhpoly1305_sse2 nhpoly1305 chacha_x86_64 chacha_generic
adiantum poly1305_generic algif_skcipher af_alg ext4 crc16 mbcache jbd2
input_leds led_class joydev hid_generic usbhid hid crct10dif_pclmul
crc32_generic crc32_pclmul ghash_generic gf128mul gcm xts ctr dm_mod cbc am=
dgpu
ecb evdev gpu_sched ohci_pci i2c_algo_bit ttm snd_hda_codec_realtek
snd_hda_codec_generic snd_hda_codec_hdmi drm_kms_helper ehci_pci ohci_hcd
cfbfillrect syscopyarea snd_hda_intel cfbimgblt k10temp sysfillrect ehci_hcd
aesni_intel sysimgblt fb_sys_fops snd_hda_codec cfbcopyarea fb snd_hwdep
usbcore aes_x86_64 snd_hda_core fam15h_power hwmon i2c_piix4 usb_common font
glue_helper crypto_simd sr_mod snd_pcm cryptd fbdev cdrom button snd_timer =
drm
acpi_cpufreq snd alx drm_panel_orientation_quirks soundcore processor backl=
ight
mdio lzo nfsd auth_rpcgss lockd grace zstd sunrpc sg zram zsmalloc
[  440.686714] CR2: 0000000000000038
[  440.686720] ---[ end trace 39cfe5e575b273f7 ]---
[  440.686847] RIP: 0010:amdgpu_ib_schedule+0x4b/0x520 [amdgpu]
[  440.686852] Code: 89 f5 49 89 ff 48 89 54 24 08 0f b6 87 38 04 00 00 48 =
85
c9 0f 84 5d 03 00 00 48 8b 91 b0 00 00 00 48 89 54 24 10 48 8b 51 10 &lt;48=
&gt; 8b 52
38 48 89 14 24 84 c0 0f 84 09 e2 17 00 48 83 7c 24 10 00
[  440.686857] RSP: 0018:ffffac368c2a7ad0 EFLAGS: 00010286
[  440.686862] RAX: 0000000000000001 RBX: ffff97d66533dc00 RCX:
ffff97d66533dc00
[  440.686866] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff97d685fe7d48
[  440.686869] RBP: 0000000000000001 R08: ffffac368c2a7b48 R09:
0000000000000001
[  440.686873] R10: 0000000000000000 R11: 0000000000000001 R12:
0000000000000007
[  440.686877] R13: 0000000000ffd000 R14: ffff97d685fe0000 R15:
ffff97d685fe7d48
[  440.686882] FS:  00007f2115109700(0000) GS:ffff97d6a6ac0000(0000)
knlGS:0000000000000000
[  440.686887] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  440.686890] CR2: 00007f212b976f42 CR3: 00000003e4236000 CR4:
00000000000406e0
[  440.686894] Fixing recursive fault but reboot is needed!

This happens every time when xmr-stak 2.10.5 (w. ROCm 2.5) tries to compile
shaders for this R9 290X. An ~/.AMD archive is generated but the compilation
process never finishes. When I close the shell with xmr-stak running (CTRL-C
xmr-stack does not work), I get this kernel BUG. I used a 5.2-rc6 debug ker=
nel,
but it happens on 5.1.15 too.

Card is a Sapphire Radeon R9 290X Tri-X OC (11226-18-20G), additional info
about the the system:

Machine:   Type: Desktop Mobo: ASUSTeK model: M5A78L-M LX3 v: Rev X.0x seri=
al:
&lt;root required&gt; BIOS: American Megatrends=20
           v: 1401 date: 05/05/2016=20
CPU:       6-Core: AMD FX-6300 type: MCP speed: 3817 MHz min/max: 1400/3800=
 MHz=20
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Hawaii XT / Grenada XT
[Radeon R9 290X/390X] driver: amdgpu v: kernel=20
           Display: x11 server: X.Org 1.20.4 driver: amdgpu,ati unloaded:
modesetting,radeon resolution: 1920x1080~60Hz=20
           OpenGL: renderer: AMD Radeon R9 200 Series (HAWAII DRM 3.30.0
5.1.15-gentoo LLVM 8.0.0) v: 4.5 Mesa 19.0.8</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15617623480.8cdE.18648--

--===============2114137073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2114137073==--
