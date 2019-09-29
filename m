Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEDFC13B0
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2019 08:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D39E6E2D7;
	Sun, 29 Sep 2019 06:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 77D4A6E2D7
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2019 06:54:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7117A72162; Sun, 29 Sep 2019 06:54:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111729] RX480 : random NULL pointer dereference on resume from
 suspend
Date: Sun, 29 Sep 2019 06:54:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: phg@phi-gamma.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111729-502-ZAAKa24Ldb@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111729-502@http.bugs.freedesktop.org/>
References: <bug-111729-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0784797825=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0784797825==
Content-Type: multipart/alternative; boundary="15697400901.C7b82d.15634"
Content-Transfer-Encoding: 7bit


--15697400901.C7b82d.15634
Date: Sun, 29 Sep 2019 06:54:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111729

--- Comment #2 from phg@phi-gamma.net ---
I can confirm this bug.

Same phenomenology here with 5.2.11, two screens, and a
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] L=
exa
PRO [Radeon RX 550/550X] (rev c7)


Sep 29 08:26:39 phlegethon kernel: PM: suspend exit
Sep 29 08:26:40 phlegethon kernel: [drm] schedsdma0 is not ready, skipping
Sep 29 08:26:58 phlegethon kernel: [drm] schedsdma1 is not ready, skipping
Sep 29 08:26:58 phlegethon kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000008
Sep 29 08:26:58 phlegethon kernel: #PF: supervisor read access in kernel mo=
de
Sep 29 08:26:58 phlegethon kernel: #PF: error_code(0x0000) - not-present pa=
ge
Sep 29 08:26:59 phlegethon kernel: PGD 6032ef067 P4D 6032ef067 PUD 603c09067
PMD 0=20
Sep 29 08:26:59 phlegethon kernel: Oops: 0000 [#1] SMP NOPTI
Sep 29 08:26:59 phlegethon kernel: CPU: 0 PID: 1429 Comm: X Tainted: G     =
   W
        5.2.11 #1-NixOS
Sep 29 08:26:59 phlegethon kernel: Hardware name: Gigabyte Technology Co., =
Ltd.
GA-78LMT-USB3 6.0/GA-78LMT-USB3 6.0, BIOS F2 11/25/2014
Sep 29 08:26:59 phlegethon kernel: RIP: 0010:amdgpu_vm_sdma_commit+0x46/0x1=
40
[amdgpu]
Sep 29 08:26:59 phlegethon kernel: Code: 18 65 48 8b 04 25 28 00 00 00 48 8=
9 44
24 08 31 c0 48 8b 47 08 48 8b aa a8 01 00 00 4c 8b a8 80 00 00 00 48 8b 80 =
c8
00 00 00 <4c> 8b 70 08 8b 45 08 85 c0 4d 8d 7e 88 0f 84 c2 00 00 00 49 8b 46
Sep 29 08:26:59 phlegethon kernel: RSP: 0018:ffff99bb838ffad8 EFLAGS: 00010=
246
Sep 29 08:26:59 phlegethon kernel: RAX: 0000000000000000 RBX: ffff99bb838ff=
b20
RCX: 0000000000103c00
Sep 29 08:26:59 phlegethon kernel: RDX: ffff89abd64a4000 RSI: ffff99bb838ff=
ba8
RDI: ffff99bb838ffb20
Sep 29 08:26:59 phlegethon kernel: RBP: ffff89abd64a4210 R08: ffff99bb838ff=
a6c
R09: ffff99bb838ffa70
Sep 29 08:26:59 phlegethon kernel: R10: 0000000000103804 R11: 0000000000000=
021
R12: ffff99bb838ffba8
Sep 29 08:26:59 phlegethon kernel: R13: ffff89ac48fc6000 R14: 0000000000103=
803
R15: 0000000000000000
Sep 29 08:26:59 phlegethon kernel: FS:  00007fd089d18e40(0000)
GS:ffff89ac67a00000(0000) knlGS:0000000000000000
Sep 29 08:26:59 phlegethon kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Sep 29 08:26:59 phlegethon kernel: CR2: 0000000000000008 CR3: 0000000603afa=
000
CR4: 00000000000006f0
Sep 29 08:26:59 phlegethon kernel: Call Trace:
Sep 29 08:26:59 phlegethon kernel:  amdgpu_vm_bo_update_mapping+0xcd/0xe0
[amdgpu]
Sep 29 08:26:59 phlegethon kernel:  amdgpu_vm_clear_freed+0xbe/0x190 [amdgp=
u]
Sep 29 08:26:59 phlegethon kernel:  amdgpu_gem_va_ioctl+0x488/0x4f0 [amdgpu]
Sep 29 08:26:59 phlegethon kernel:  ? amdgpu_gem_metadata_ioctl+0x1b0/0x1b0
[amdgpu]
Sep 29 08:26:59 phlegethon kernel:  ? drm_ioctl_kernel+0xac/0xf0 [drm]
Sep 29 08:26:59 phlegethon kernel:  drm_ioctl_kernel+0xac/0xf0 [drm]
Sep 29 08:26:59 phlegethon kernel:  ? sock_write_iter+0x8f/0xf0
Sep 29 08:26:59 phlegethon kernel:  drm_ioctl+0x2e6/0x3a0 [drm]
Sep 29 08:26:59 phlegethon kernel:  ? amdgpu_gem_metadata_ioctl+0x1b0/0x1b0
[amdgpu]
Sep 29 08:26:59 phlegethon kernel:  ? do_iter_write+0xe2/0x190
Sep 29 08:26:59 phlegethon kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Sep 29 08:26:59 phlegethon kernel:  do_vfs_ioctl+0xa4/0x630
Sep 29 08:26:59 phlegethon kernel:  ksys_ioctl+0x70/0x80
Sep 29 08:26:59 phlegethon kernel:  __x64_sys_ioctl+0x16/0x20
Sep 29 08:26:59 phlegethon kernel:  do_syscall_64+0x4e/0x130
Sep 29 08:26:59 phlegethon kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Sep 29 08:26:59 phlegethon kernel: RIP: 0033:0x7fd08a3c4b57
Sep 29 08:26:59 phlegethon kernel: Code: 00 00 00 48 8b 05 29 53 0c 00 64 c=
7 00
26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 =
00
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f9 52 0c 00 f7 d8 64 89 01 48
Sep 29 08:26:59 phlegethon kernel: RSP: 002b:00007fff6a6738b8 EFLAGS: 00000=
246
ORIG_RAX: 0000000000000010
Sep 29 08:26:59 phlegethon kernel: RAX: ffffffffffffffda RBX: 0000000000000=
000
RCX: 00007fd08a3c4b57
Sep 29 08:26:59 phlegethon kernel: RDX: 00007fff6a673900 RSI: 00000000c0286=
448
RDI: 0000000000000012
Sep 29 08:26:59 phlegethon kernel: RBP: 00007fff6a673900 R08: 0000000103400=
000
R09: 000000000000000e
Sep 29 08:26:59 phlegethon kernel: R10: 0000000000000026 R11: 0000000000000=
246
R12: 00000000c0286448
Sep 29 08:26:59 phlegethon kernel: R13: 0000000000000012 R14: 0000000000000=
002
R15: 00000000043d74a0
Sep 29 08:26:59 phlegethon kernel: Modules linked in: fuse bridge stp llc
cfg80211 msr rfkill 8021q ext4 crc16 mbcache jbd2 amdgpu wmi_bmof ppdev
gpu_sched edac_core ttm drm_kms_helper snd_hda_codec_realtek k10temp
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi drm snd_hda_intel jo=
ydev
r8169 ata_generic snd_hda_codec sp5100_tco uas agpgart watchdog i2c_algo_bit
pata_acpi evdev fb_sys_fops syscopyarea i2c_piix4 mousedev sysfillrect real=
tek
sysimgblt mac_hid snd_hda_core backlight libphy i2c_core parport_pc snd_hwd=
ep
parport wmi button pcc_cpufreq acpi_cpufreq iptable_nat nf_nat xt_conntrack
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6t_rpfilter ipt_rpfilter
ip6table_raw iptable_raw xt_pkttype nf_log_ipv6 nf_log_ipv4 nf_log_common
xt_LOG xt_tcpudp ip6table_filter ip6_tables iptable_filter snd_pcm_oss
snd_mixer_oss snd_pcm snd_timer snd soundcore atkbd libps2 serio loop
cpufreq_ondemand edac_mce_amd kvm irqbypass ip_tables x_tables ipv6 crc_cci=
tt
autofs4 crypto_simd cryptd glue_helper input_leds led_class
Sep 29 08:26:59 phlegethon kernel:  usb_storage sd_mod xhci_pci pata_atiixp
ahci xhci_hcd ohci_pci libahci libata ehci_pci ohci_hcd scsi_mod ehci_hcd
rtc_cmos aes_x86_64 serpent_generic btrfs zstd_decompress zstd_compress
libcrc32c crc32c_generic xor raid6_pq dm_crypt dm_mod usbhid usbcore usb_co=
mmon
hid_generic hid_microsoft ff_memless hid
Sep 29 08:26:59 phlegethon kernel: CR2: 0000000000000008
Sep 29 08:26:59 phlegethon kernel: ---[ end trace b0432b776c251e2d ]---
Sep 29 08:26:59 phlegethon kernel: RIP: 0010:amdgpu_vm_sdma_commit+0x46/0x1=
40
[amdgpu]
Sep 29 08:26:59 phlegethon kernel: Code: 18 65 48 8b 04 25 28 00 00 00 48 8=
9 44
24 08 31 c0 48 8b 47 08 48 8b aa a8 01 00 00 4c 8b a8 80 00 00 00 48 8b 80 =
c8
00 00 00 <4c> 8b 70 08 8b 45 08 85 c0 4d 8d 7e 88 0f 84 c2 00 00 00 49 8b 46
Sep 29 08:26:59 phlegethon kernel: RSP: 0018:ffff99bb838ffad8 EFLAGS: 00010=
246
Sep 29 08:26:59 phlegethon kernel: RAX: 0000000000000000 RBX: ffff99bb838ff=
b20
RCX: 0000000000103c00
Sep 29 08:26:59 phlegethon kernel: RDX: ffff89abd64a4000 RSI: ffff99bb838ff=
ba8
RDI: ffff99bb838ffb20
Sep 29 08:26:59 phlegethon kernel: RBP: ffff89abd64a4210 R08: ffff99bb838ff=
a6c
R09: ffff99bb838ffa70
Sep 29 08:26:59 phlegethon kernel: R10: 0000000000103804 R11: 0000000000000=
021
R12: ffff99bb838ffba8
Sep 29 08:26:59 phlegethon kernel: R13: ffff89ac48fc6000 R14: 0000000000103=
803
R15: 0000000000000000
Sep 29 08:26:59 phlegethon kernel: FS:  00007fd089d18e40(0000)
GS:ffff89ac67a00000(0000) knlGS:0000000000000000
Sep 29 08:26:59 phlegethon kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Sep 29 08:26:59 phlegethon kernel: CR2: 0000000000000008 CR3: 0000000603afa=
000
CR4: 00000000000006f0
Sep 29 08:30:10 phlegethon kernel: sysrq: Keyboard mode set to system defau=
lt

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15697400901.C7b82d.15634
Date: Sun, 29 Sep 2019 06:54:50 +0000
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
   title=3D"NEW - RX480 : random NULL pointer dereference on resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111729#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX480 : random NULL pointer dereference on resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111729">bug 11172=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
phg&#64;phi-gamma.net" title=3D"phg&#64;phi-gamma.net">phg&#64;phi-gamma.ne=
t</a>
</span></b>
        <pre>I can confirm this bug.

Same phenomenology here with 5.2.11, two screens, and a
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] L=
exa
PRO [Radeon RX 550/550X] (rev c7)


Sep 29 08:26:39 phlegethon kernel: PM: suspend exit
Sep 29 08:26:40 phlegethon kernel: [drm] schedsdma0 is not ready, skipping
Sep 29 08:26:58 phlegethon kernel: [drm] schedsdma1 is not ready, skipping
Sep 29 08:26:58 phlegethon kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000008
Sep 29 08:26:58 phlegethon kernel: #PF: supervisor read access in kernel mo=
de
Sep 29 08:26:58 phlegethon kernel: #PF: error_code(0x0000) - not-present pa=
ge
Sep 29 08:26:59 phlegethon kernel: PGD 6032ef067 P4D 6032ef067 PUD 603c09067
PMD 0=20
Sep 29 08:26:59 phlegethon kernel: Oops: 0000 [#1] SMP NOPTI
Sep 29 08:26:59 phlegethon kernel: CPU: 0 PID: 1429 Comm: X Tainted: G     =
   W
        5.2.11 #1-NixOS
Sep 29 08:26:59 phlegethon kernel: Hardware name: Gigabyte Technology Co., =
Ltd.
GA-78LMT-USB3 6.0/GA-78LMT-USB3 6.0, BIOS F2 11/25/2014
Sep 29 08:26:59 phlegethon kernel: RIP: 0010:amdgpu_vm_sdma_commit+0x46/0x1=
40
[amdgpu]
Sep 29 08:26:59 phlegethon kernel: Code: 18 65 48 8b 04 25 28 00 00 00 48 8=
9 44
24 08 31 c0 48 8b 47 08 48 8b aa a8 01 00 00 4c 8b a8 80 00 00 00 48 8b 80 =
c8
00 00 00 &lt;4c&gt; 8b 70 08 8b 45 08 85 c0 4d 8d 7e 88 0f 84 c2 00 00 00 4=
9 8b 46
Sep 29 08:26:59 phlegethon kernel: RSP: 0018:ffff99bb838ffad8 EFLAGS: 00010=
246
Sep 29 08:26:59 phlegethon kernel: RAX: 0000000000000000 RBX: ffff99bb838ff=
b20
RCX: 0000000000103c00
Sep 29 08:26:59 phlegethon kernel: RDX: ffff89abd64a4000 RSI: ffff99bb838ff=
ba8
RDI: ffff99bb838ffb20
Sep 29 08:26:59 phlegethon kernel: RBP: ffff89abd64a4210 R08: ffff99bb838ff=
a6c
R09: ffff99bb838ffa70
Sep 29 08:26:59 phlegethon kernel: R10: 0000000000103804 R11: 0000000000000=
021
R12: ffff99bb838ffba8
Sep 29 08:26:59 phlegethon kernel: R13: ffff89ac48fc6000 R14: 0000000000103=
803
R15: 0000000000000000
Sep 29 08:26:59 phlegethon kernel: FS:  00007fd089d18e40(0000)
GS:ffff89ac67a00000(0000) knlGS:0000000000000000
Sep 29 08:26:59 phlegethon kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Sep 29 08:26:59 phlegethon kernel: CR2: 0000000000000008 CR3: 0000000603afa=
000
CR4: 00000000000006f0
Sep 29 08:26:59 phlegethon kernel: Call Trace:
Sep 29 08:26:59 phlegethon kernel:  amdgpu_vm_bo_update_mapping+0xcd/0xe0
[amdgpu]
Sep 29 08:26:59 phlegethon kernel:  amdgpu_vm_clear_freed+0xbe/0x190 [amdgp=
u]
Sep 29 08:26:59 phlegethon kernel:  amdgpu_gem_va_ioctl+0x488/0x4f0 [amdgpu]
Sep 29 08:26:59 phlegethon kernel:  ? amdgpu_gem_metadata_ioctl+0x1b0/0x1b0
[amdgpu]
Sep 29 08:26:59 phlegethon kernel:  ? drm_ioctl_kernel+0xac/0xf0 [drm]
Sep 29 08:26:59 phlegethon kernel:  drm_ioctl_kernel+0xac/0xf0 [drm]
Sep 29 08:26:59 phlegethon kernel:  ? sock_write_iter+0x8f/0xf0
Sep 29 08:26:59 phlegethon kernel:  drm_ioctl+0x2e6/0x3a0 [drm]
Sep 29 08:26:59 phlegethon kernel:  ? amdgpu_gem_metadata_ioctl+0x1b0/0x1b0
[amdgpu]
Sep 29 08:26:59 phlegethon kernel:  ? do_iter_write+0xe2/0x190
Sep 29 08:26:59 phlegethon kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Sep 29 08:26:59 phlegethon kernel:  do_vfs_ioctl+0xa4/0x630
Sep 29 08:26:59 phlegethon kernel:  ksys_ioctl+0x70/0x80
Sep 29 08:26:59 phlegethon kernel:  __x64_sys_ioctl+0x16/0x20
Sep 29 08:26:59 phlegethon kernel:  do_syscall_64+0x4e/0x130
Sep 29 08:26:59 phlegethon kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Sep 29 08:26:59 phlegethon kernel: RIP: 0033:0x7fd08a3c4b57
Sep 29 08:26:59 phlegethon kernel: Code: 00 00 00 48 8b 05 29 53 0c 00 64 c=
7 00
26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 =
00
00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d f9 52 0c 00 f7 d8 64 8=
9 01 48
Sep 29 08:26:59 phlegethon kernel: RSP: 002b:00007fff6a6738b8 EFLAGS: 00000=
246
ORIG_RAX: 0000000000000010
Sep 29 08:26:59 phlegethon kernel: RAX: ffffffffffffffda RBX: 0000000000000=
000
RCX: 00007fd08a3c4b57
Sep 29 08:26:59 phlegethon kernel: RDX: 00007fff6a673900 RSI: 00000000c0286=
448
RDI: 0000000000000012
Sep 29 08:26:59 phlegethon kernel: RBP: 00007fff6a673900 R08: 0000000103400=
000
R09: 000000000000000e
Sep 29 08:26:59 phlegethon kernel: R10: 0000000000000026 R11: 0000000000000=
246
R12: 00000000c0286448
Sep 29 08:26:59 phlegethon kernel: R13: 0000000000000012 R14: 0000000000000=
002
R15: 00000000043d74a0
Sep 29 08:26:59 phlegethon kernel: Modules linked in: fuse bridge stp llc
cfg80211 msr rfkill 8021q ext4 crc16 mbcache jbd2 amdgpu wmi_bmof ppdev
gpu_sched edac_core ttm drm_kms_helper snd_hda_codec_realtek k10temp
snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi drm snd_hda_intel jo=
ydev
r8169 ata_generic snd_hda_codec sp5100_tco uas agpgart watchdog i2c_algo_bit
pata_acpi evdev fb_sys_fops syscopyarea i2c_piix4 mousedev sysfillrect real=
tek
sysimgblt mac_hid snd_hda_core backlight libphy i2c_core parport_pc snd_hwd=
ep
parport wmi button pcc_cpufreq acpi_cpufreq iptable_nat nf_nat xt_conntrack
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6t_rpfilter ipt_rpfilter
ip6table_raw iptable_raw xt_pkttype nf_log_ipv6 nf_log_ipv4 nf_log_common
xt_LOG xt_tcpudp ip6table_filter ip6_tables iptable_filter snd_pcm_oss
snd_mixer_oss snd_pcm snd_timer snd soundcore atkbd libps2 serio loop
cpufreq_ondemand edac_mce_amd kvm irqbypass ip_tables x_tables ipv6 crc_cci=
tt
autofs4 crypto_simd cryptd glue_helper input_leds led_class
Sep 29 08:26:59 phlegethon kernel:  usb_storage sd_mod xhci_pci pata_atiixp
ahci xhci_hcd ohci_pci libahci libata ehci_pci ohci_hcd scsi_mod ehci_hcd
rtc_cmos aes_x86_64 serpent_generic btrfs zstd_decompress zstd_compress
libcrc32c crc32c_generic xor raid6_pq dm_crypt dm_mod usbhid usbcore usb_co=
mmon
hid_generic hid_microsoft ff_memless hid
Sep 29 08:26:59 phlegethon kernel: CR2: 0000000000000008
Sep 29 08:26:59 phlegethon kernel: ---[ end trace b0432b776c251e2d ]---
Sep 29 08:26:59 phlegethon kernel: RIP: 0010:amdgpu_vm_sdma_commit+0x46/0x1=
40
[amdgpu]
Sep 29 08:26:59 phlegethon kernel: Code: 18 65 48 8b 04 25 28 00 00 00 48 8=
9 44
24 08 31 c0 48 8b 47 08 48 8b aa a8 01 00 00 4c 8b a8 80 00 00 00 48 8b 80 =
c8
00 00 00 &lt;4c&gt; 8b 70 08 8b 45 08 85 c0 4d 8d 7e 88 0f 84 c2 00 00 00 4=
9 8b 46
Sep 29 08:26:59 phlegethon kernel: RSP: 0018:ffff99bb838ffad8 EFLAGS: 00010=
246
Sep 29 08:26:59 phlegethon kernel: RAX: 0000000000000000 RBX: ffff99bb838ff=
b20
RCX: 0000000000103c00
Sep 29 08:26:59 phlegethon kernel: RDX: ffff89abd64a4000 RSI: ffff99bb838ff=
ba8
RDI: ffff99bb838ffb20
Sep 29 08:26:59 phlegethon kernel: RBP: ffff89abd64a4210 R08: ffff99bb838ff=
a6c
R09: ffff99bb838ffa70
Sep 29 08:26:59 phlegethon kernel: R10: 0000000000103804 R11: 0000000000000=
021
R12: ffff99bb838ffba8
Sep 29 08:26:59 phlegethon kernel: R13: ffff89ac48fc6000 R14: 0000000000103=
803
R15: 0000000000000000
Sep 29 08:26:59 phlegethon kernel: FS:  00007fd089d18e40(0000)
GS:ffff89ac67a00000(0000) knlGS:0000000000000000
Sep 29 08:26:59 phlegethon kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Sep 29 08:26:59 phlegethon kernel: CR2: 0000000000000008 CR3: 0000000603afa=
000
CR4: 00000000000006f0
Sep 29 08:30:10 phlegethon kernel: sysrq: Keyboard mode set to system defau=
lt</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15697400901.C7b82d.15634--

--===============0784797825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0784797825==--
