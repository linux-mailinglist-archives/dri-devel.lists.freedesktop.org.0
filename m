Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2D101ACB
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F866EB5B;
	Tue, 19 Nov 2019 08:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CFE136EB6D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:02:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CC603720E2; Tue, 19 Nov 2019 08:02:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111659] Kernel panic when waking up after screens go to dpms
 sleep
Date: Tue, 19 Nov 2019 08:02:21 +0000
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
Message-ID: <bug-111659-502-4p4wHneRDK@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0393161214=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0393161214==
Content-Type: multipart/alternative; boundary="15741505400.F24A0b9.7849"
Content-Transfer-Encoding: 7bit


--15741505400.F24A0b9.7849
Date: Tue, 19 Nov 2019 08:02:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111659

--- Comment #9 from Brad Campbell <brad@fnarfbargle.com> ---
Another observation (after another lockup). I have the kernel set to reboot=
 on
panic. On reboot the machine displays a grey screen (as it does on a normal
boot) but never gets to the bootloader.

I have to hard power cycle the machine. I suppose that might imply the card=
 is
getting into a hardware state the firmware can't recover from.

I have observed this behaviour every time it has auto-rebooted. Still booti=
ng
with radeon.dpm=3D0.

.
[27018.029370] BUG: kernel NULL pointer dereference, address: 0000000000000=
2b8
[27018.029383] #PF: supervisor read access in kernel mode
[27018.029386] #PF: error_code(0x0000) - not-present page
[27018.029389] PGD 0 P4D 0=20
[27018.029394] Oops: 0000 [#1] SMP
[27018.029399] CPU: 2 PID: 6439 Comm: kworker/2:2 Not tainted 5.4.0-rc7-bkc=
1+
#5
[27018.029401] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BIOS
82.0.0.0.0 09/25/2018
[27018.029437] Workqueue: events radeon_dp_work_func [radeon]
[27018.029458] RIP: 0010:radeon_add_legacy_encoder+0x0/0x2d0 [radeon]
[27018.029462] Code: 3f a0 e8 f3 a1 d8 ff 4c 89 ef e8 db 42 e3 e0 eb d3 41 =
c6
45 08 00 e9 43 ff ff ff 48 c7 c7 b0 73 3e a0 e8 d3 a1 d8 ff eb de 90 <48> 8=
b 87
b8 02 00 00 4c 8d 87 b8 02 00 00 49 39 c0 74 24 3b 70 68
[27018.029466] RSP: 0018:ffffc90004dafe48 EFLAGS: 00010292
[27018.029469] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[27018.029471] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[27018.029473] RBP: ffff888262820000 R08: ffffffffa0115837 R09:
0000000000000006
[27018.029476] R10: 0000000000000006 R11: 000000000000024c R12:
ffff8882625c5ba0
[27018.029478] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[27018.029481] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[27018.029484] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[27018.029487] CR2: 00000000000002b8 CR3: 0000000001c09004 CR4:
00000000000606a0
[27018.029489] Call Trace:
[27018.029509]  radeon_get_legacy_connector_info_from_bios+0x399/0xb90 [rad=
eon]
[27018.029531]  ? radeon_dp_work_func+0x28/0x40 [radeon]
[27018.029537]  ? process_one_work+0x1b4/0x330
[27018.029540]  ? worker_thread+0x44/0x3d0
[27018.029544]  ? set_worker_desc+0x90/0x90
[27018.029548]  ? kthread+0xec/0x120
[27018.029552]  ? kthread_create_worker_on_cpu+0x40/0x40
[27018.029556]  ? ret_from_fork+0x1f/0x30
[27018.029558] Modules linked in: cpufreq_userspace cpufreq_powersave
cpufreq_conservative nfsv4 nfsd auth_rpcgss nfs_acl nfs lockd grace fscache
sunrpc af_packet dm_crypt dm_mod dax coretemp kvm_intel kvm irqbypass apple=
smc
btusb input_polldev btbcm led_class btintel uvcvideo bluetooth
videobuf2_vmalloc rfkill videobuf2_memops snd_usb_audio videobuf2_v4l2 vide=
odev
snd_usbmidi_lib ecdh_generic ecc joydev videobuf2_common snd_rawmidi evdev
snd_hda_codec_cirrus snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel
snd_intel_nhlt snd_hda_codec snd_hwdep snd_hda_core snd_pcm snd_timer snd
soundcore apple_bl button ext4 crc32c_generic crc16 mbcache jbd2 netconsole
configfs hid_apple hid_appleir usb_storage hid_generic usbhid hid sg sr_mod
cdrom sd_mod aesni_intel glue_helper crypto_simd cryptd radeon ahci libahci
i2c_algo_bit xhci_pci backlight xhci_hcd firewire_ohci drm_kms_helper ehci_=
pci
syscopyarea sysfillrect sysimgblt fb_sys_fops uhci_hcd tg3 ttm firewire_core
ehci_hcd libphy crc_itu_t drm
[27018.029601]  usbcore usb_common i2c_core
[27018.029610] CR2: 00000000000002b8
[27018.029613] ---[ end trace 7d5e64a9e69d86f6 ]---
[27018.029632] RIP: 0010:radeon_add_legacy_encoder+0x0/0x2d0 [radeon]
[27018.029636] Code: 3f a0 e8 f3 a1 d8 ff 4c 89 ef e8 db 42 e3 e0 eb d3 41 =
c6
45 08 00 e9 43 ff ff ff 48 c7 c7 b0 73 3e a0 e8 d3 a1 d8 ff eb de 90 <48> 8=
b 87
b8 02 00 00 4c 8d 87 b8 02 00 00 49 39 c0 74 24 3b 70 68
[27018.029639] RSP: 0018:ffffc90004dafe48 EFLAGS: 00010292
[27018.029641] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[27018.029643] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[27018.029646] RBP: ffff888262820000 R08: ffffffffa0115837 R09:
0000000000000006
[27018.029648] R10: 0000000000000006 R11: 000000000000024c R12:
ffff8882625c5ba0
[27018.029651] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[27018.029653] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[27018.029656] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[27018.029658] CR2: 00000000000002b8 CR3: 0000000001c09004 CR4:
00000000000606a0
[27018.029661] Kernel panic - not syncing: Fatal exception
[27018.029705] Kernel Offset: disabled
[27018.029709] Rebooting in 10 seconds..
[27028.030118] ACPI MEMORY or I/O RESET_REG.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15741505400.F24A0b9.7849
Date: Tue, 19 Nov 2019 08:02:20 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659#c9">Commen=
t # 9</a>
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
        <pre>Another observation (after another lockup). I have the kernel =
set to reboot on
panic. On reboot the machine displays a grey screen (as it does on a normal
boot) but never gets to the bootloader.

I have to hard power cycle the machine. I suppose that might imply the card=
 is
getting into a hardware state the firmware can't recover from.

I have observed this behaviour every time it has auto-rebooted. Still booti=
ng
with radeon.dpm=3D0.

.
[27018.029370] BUG: kernel NULL pointer dereference, address: 0000000000000=
2b8
[27018.029383] #PF: supervisor read access in kernel mode
[27018.029386] #PF: error_code(0x0000) - not-present page
[27018.029389] PGD 0 P4D 0=20
[27018.029394] Oops: 0000 [#1] SMP
[27018.029399] CPU: 2 PID: 6439 Comm: kworker/2:2 Not tainted 5.4.0-rc7-bkc=
1+
#5
[27018.029401] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BIOS
82.0.0.0.0 09/25/2018
[27018.029437] Workqueue: events radeon_dp_work_func [radeon]
[27018.029458] RIP: 0010:radeon_add_legacy_encoder+0x0/0x2d0 [radeon]
[27018.029462] Code: 3f a0 e8 f3 a1 d8 ff 4c 89 ef e8 db 42 e3 e0 eb d3 41 =
c6
45 08 00 e9 43 ff ff ff 48 c7 c7 b0 73 3e a0 e8 d3 a1 d8 ff eb de 90 &lt;48=
&gt; 8b 87
b8 02 00 00 4c 8d 87 b8 02 00 00 49 39 c0 74 24 3b 70 68
[27018.029466] RSP: 0018:ffffc90004dafe48 EFLAGS: 00010292
[27018.029469] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[27018.029471] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[27018.029473] RBP: ffff888262820000 R08: ffffffffa0115837 R09:
0000000000000006
[27018.029476] R10: 0000000000000006 R11: 000000000000024c R12:
ffff8882625c5ba0
[27018.029478] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[27018.029481] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[27018.029484] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[27018.029487] CR2: 00000000000002b8 CR3: 0000000001c09004 CR4:
00000000000606a0
[27018.029489] Call Trace:
[27018.029509]  radeon_get_legacy_connector_info_from_bios+0x399/0xb90 [rad=
eon]
[27018.029531]  ? radeon_dp_work_func+0x28/0x40 [radeon]
[27018.029537]  ? process_one_work+0x1b4/0x330
[27018.029540]  ? worker_thread+0x44/0x3d0
[27018.029544]  ? set_worker_desc+0x90/0x90
[27018.029548]  ? kthread+0xec/0x120
[27018.029552]  ? kthread_create_worker_on_cpu+0x40/0x40
[27018.029556]  ? ret_from_fork+0x1f/0x30
[27018.029558] Modules linked in: cpufreq_userspace cpufreq_powersave
cpufreq_conservative nfsv4 nfsd auth_rpcgss nfs_acl nfs lockd grace fscache
sunrpc af_packet dm_crypt dm_mod dax coretemp kvm_intel kvm irqbypass apple=
smc
btusb input_polldev btbcm led_class btintel uvcvideo bluetooth
videobuf2_vmalloc rfkill videobuf2_memops snd_usb_audio videobuf2_v4l2 vide=
odev
snd_usbmidi_lib ecdh_generic ecc joydev videobuf2_common snd_rawmidi evdev
snd_hda_codec_cirrus snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel
snd_intel_nhlt snd_hda_codec snd_hwdep snd_hda_core snd_pcm snd_timer snd
soundcore apple_bl button ext4 crc32c_generic crc16 mbcache jbd2 netconsole
configfs hid_apple hid_appleir usb_storage hid_generic usbhid hid sg sr_mod
cdrom sd_mod aesni_intel glue_helper crypto_simd cryptd radeon ahci libahci
i2c_algo_bit xhci_pci backlight xhci_hcd firewire_ohci drm_kms_helper ehci_=
pci
syscopyarea sysfillrect sysimgblt fb_sys_fops uhci_hcd tg3 ttm firewire_core
ehci_hcd libphy crc_itu_t drm
[27018.029601]  usbcore usb_common i2c_core
[27018.029610] CR2: 00000000000002b8
[27018.029613] ---[ end trace 7d5e64a9e69d86f6 ]---
[27018.029632] RIP: 0010:radeon_add_legacy_encoder+0x0/0x2d0 [radeon]
[27018.029636] Code: 3f a0 e8 f3 a1 d8 ff 4c 89 ef e8 db 42 e3 e0 eb d3 41 =
c6
45 08 00 e9 43 ff ff ff 48 c7 c7 b0 73 3e a0 e8 d3 a1 d8 ff eb de 90 &lt;48=
&gt; 8b 87
b8 02 00 00 4c 8d 87 b8 02 00 00 49 39 c0 74 24 3b 70 68
[27018.029639] RSP: 0018:ffffc90004dafe48 EFLAGS: 00010292
[27018.029641] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[27018.029643] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[27018.029646] RBP: ffff888262820000 R08: ffffffffa0115837 R09:
0000000000000006
[27018.029648] R10: 0000000000000006 R11: 000000000000024c R12:
ffff8882625c5ba0
[27018.029651] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[27018.029653] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[27018.029656] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[27018.029658] CR2: 00000000000002b8 CR3: 0000000001c09004 CR4:
00000000000606a0
[27018.029661] Kernel panic - not syncing: Fatal exception
[27018.029705] Kernel Offset: disabled
[27018.029709] Rebooting in 10 seconds..
[27028.030118] ACPI MEMORY or I/O RESET_REG.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15741505400.F24A0b9.7849--

--===============0393161214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0393161214==--
