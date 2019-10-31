Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E85EAB11
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 08:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1D26EBF5;
	Thu, 31 Oct 2019 07:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 57BE06EBF5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 07:42:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4EFB2720E2; Thu, 31 Oct 2019 07:42:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111659] Kernel panic when waking up after screens go to dpms
 sleep
Date: Thu, 31 Oct 2019 07:42:01 +0000
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
Message-ID: <bug-111659-502-SpwRCRcJTc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1572695229=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1572695229==
Content-Type: multipart/alternative; boundary="15725077210.F04afF1.29043"
Content-Transfer-Encoding: 7bit


--15725077210.F04afF1.29043
Date: Thu, 31 Oct 2019 07:42:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111659

--- Comment #7 from Brad Campbell <brad@fnarfbargle.com> ---
And another one.

Disturbingly in a different location. I'm starting to wonder if there is a
deeper issue at play.

[237702.755803] invalid opcode: 0000 [#1] SMP
[237702.755811] CPU: 2 PID: 15611 Comm: kworker/2:1 Not tainted 5.4.0-rc4-b=
kc1+
#3
[237702.755813] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BI=
OS
82.0.0.0.0 09/25/2018
[237702.755835] Workqueue: events radeon_dp_work_func [radeon]
[237702.755846] RIP: 0010:radeon_gart_table_vram_unpin+0x101/0x110 [radeon]
[237702.755848] Code: 00 fe ff ff 74 ed 5b 48 89 ea 48 c7 c6 64 ae 3c a0 48=
 8b
85 20 03 00 00 5d 41 5c 48 8b 38 e9 38 63 00 e1 4c 89 e7 e8 5e 4e ef <ff> e=
b a
0 66 90 66 2e 0f 1f 84 00 00 00 00 00 48 83 bf 68 04 00 00
[237702.755850] RSP: 0000:ffffc90003d07e50 EFLAGS: 00010292
[237702.755851] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[237702.755853] RDX: 0000000000000000 RSI: 0000000000000004 RDI:
ffffc90003d07e3a
[237702.755854] RBP: ffff888262c40000 R08: ffffffffa0213837 R09:
0000000000000006
[237702.755856] R10: 0000000000000006 R11: 0000000000000000 R12:
ffff8882639e1a40
[237702.755857] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[237702.755858] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[237702.755860] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[237702.755861] CR2: 00002bc12936d1e0 CR3: 0000000252db0004 CR4:
00000000000606a0
[237702.755862] Call Trace:
[237702.755878]  radeon_dp_work_func+0x28/0x40 [radeon]
[237702.755883]  process_one_work+0x1b4/0x330
[237702.755885]  worker_thread+0x44/0x3d0
[237702.755887]  ? set_worker_desc+0x90/0x90
[237702.755890]  kthread+0xec/0x120
[237702.755892]  ? kthread_create_worker_on_cpu+0x40/0x40
[237702.755895]  ret_from_fork+0x1f/0x30
[237702.755897] Modules linked in: cpufreq_userspace cpufreq_powersave
cpufreq_conservative nfsv4 nfsd auth_rpcgss nfs_acl nfs lockd grace fscache
sunrpc af_packet dm_crypt dm_mod dax coretemp applesmc input_polldev kvm_in=
tel
led_class kvm btusb btbcm uvcvideo irqbypass videobuf2_vmalloc videobuf2_me=
mops
btintel videobuf2_v4l2 bluetooth snd_usb_audio videodev snd_usbmidi_lib rfk=
ill
videobuf2_common ecdh_generic snd_rawmidi ecc joydev evdev snd_hda_codec_ci=
rrus
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel snd_intel_nhlt
snd_hda_codec snd_hwdep snd_hda_core snd_pcm snd_timer snd apple_bl button
soundcore ext4 crc32c_generic crc16 mbcache jbd2 netconsole configfs hid_ap=
ple
hid_appleir hid_generic usbhid hid usb_storage sg sr_mod cdrom sd_mod
aesni_intel glue_helper crypto_simd cryptd ahci libahci xhci_pci radeon
xhci_hcd i2c_algo_bit backlight drm_kms_helper syscopyarea sysfillrect
firewire_ohci sysimgblt fb_sys_fops ehci_pci firewire_core ttm uhci_hcd
crc_itu_t tg3 ehci_hcd libphy drm
[237702.755925]  usbcore usb_common i2c_core
[237702.755931] ---[ end trace 5f73030a00b66980 ]---
[237702.755941] RIP: 0010:radeon_gart_table_vram_unpin+0x101/0x110 [radeon]
[237702.755943] Code: 00 fe ff ff 74 ed 5b 48 89 ea 48 c7 c6 64 ae 3c a0 48=
 8b
85 20 03 00 00 5d 41 5c 48 8b 38 e9 38 63 00 e1 4c 89 e7 e8 5e 4e ef <ff> e=
b a0
66 90 66 2e 0f 1f 84 00 00 00 00 00 48 83 bf 68 04 00 00
[237702.755944] RSP: 0000:ffffc90003d07e50 EFLAGS: 00010292
[237702.755945] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[237702.755947] RDX: 0000000000000000 RSI: 0000000000000004 RDI:
ffffc90003d07e3a
[237702.755948] RBP: ffff888262c40000 R08: ffffffffa0213837 R09:
0000000000000006
[237702.755950] R10: 0000000000000006 R11: 0000000000000000 R12:
ffff8882639e1a40
[237702.755951] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[237702.755952] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[237702.755954] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[237702.755955] CR2: 00002bc12936d1e0 CR3: 0000000252db0004 CR4:
00000000000606a0
[237702.755957] Kernel panic - not syncing: Fatal exception
[237702.755981] Kernel Offset: disabled
[237702.755983] Rebooting in 10 seconds..
[237712.756129] ACPI MEMORY or I/O RESET_REG.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15725077210.F04afF1.29043
Date: Thu, 31 Oct 2019 07:42:01 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659#c7">Commen=
t # 7</a>
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
        <pre>And another one.

Disturbingly in a different location. I'm starting to wonder if there is a
deeper issue at play.

[237702.755803] invalid opcode: 0000 [#1] SMP
[237702.755811] CPU: 2 PID: 15611 Comm: kworker/2:1 Not tainted 5.4.0-rc4-b=
kc1+
#3
[237702.755813] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BI=
OS
82.0.0.0.0 09/25/2018
[237702.755835] Workqueue: events radeon_dp_work_func [radeon]
[237702.755846] RIP: 0010:radeon_gart_table_vram_unpin+0x101/0x110 [radeon]
[237702.755848] Code: 00 fe ff ff 74 ed 5b 48 89 ea 48 c7 c6 64 ae 3c a0 48=
 8b
85 20 03 00 00 5d 41 5c 48 8b 38 e9 38 63 00 e1 4c 89 e7 e8 5e 4e ef &lt;ff=
&gt; eb a
0 66 90 66 2e 0f 1f 84 00 00 00 00 00 48 83 bf 68 04 00 00
[237702.755850] RSP: 0000:ffffc90003d07e50 EFLAGS: 00010292
[237702.755851] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[237702.755853] RDX: 0000000000000000 RSI: 0000000000000004 RDI:
ffffc90003d07e3a
[237702.755854] RBP: ffff888262c40000 R08: ffffffffa0213837 R09:
0000000000000006
[237702.755856] R10: 0000000000000006 R11: 0000000000000000 R12:
ffff8882639e1a40
[237702.755857] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[237702.755858] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[237702.755860] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[237702.755861] CR2: 00002bc12936d1e0 CR3: 0000000252db0004 CR4:
00000000000606a0
[237702.755862] Call Trace:
[237702.755878]  radeon_dp_work_func+0x28/0x40 [radeon]
[237702.755883]  process_one_work+0x1b4/0x330
[237702.755885]  worker_thread+0x44/0x3d0
[237702.755887]  ? set_worker_desc+0x90/0x90
[237702.755890]  kthread+0xec/0x120
[237702.755892]  ? kthread_create_worker_on_cpu+0x40/0x40
[237702.755895]  ret_from_fork+0x1f/0x30
[237702.755897] Modules linked in: cpufreq_userspace cpufreq_powersave
cpufreq_conservative nfsv4 nfsd auth_rpcgss nfs_acl nfs lockd grace fscache
sunrpc af_packet dm_crypt dm_mod dax coretemp applesmc input_polldev kvm_in=
tel
led_class kvm btusb btbcm uvcvideo irqbypass videobuf2_vmalloc videobuf2_me=
mops
btintel videobuf2_v4l2 bluetooth snd_usb_audio videodev snd_usbmidi_lib rfk=
ill
videobuf2_common ecdh_generic snd_rawmidi ecc joydev evdev snd_hda_codec_ci=
rrus
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel snd_intel_nhlt
snd_hda_codec snd_hwdep snd_hda_core snd_pcm snd_timer snd apple_bl button
soundcore ext4 crc32c_generic crc16 mbcache jbd2 netconsole configfs hid_ap=
ple
hid_appleir hid_generic usbhid hid usb_storage sg sr_mod cdrom sd_mod
aesni_intel glue_helper crypto_simd cryptd ahci libahci xhci_pci radeon
xhci_hcd i2c_algo_bit backlight drm_kms_helper syscopyarea sysfillrect
firewire_ohci sysimgblt fb_sys_fops ehci_pci firewire_core ttm uhci_hcd
crc_itu_t tg3 ehci_hcd libphy drm
[237702.755925]  usbcore usb_common i2c_core
[237702.755931] ---[ end trace 5f73030a00b66980 ]---
[237702.755941] RIP: 0010:radeon_gart_table_vram_unpin+0x101/0x110 [radeon]
[237702.755943] Code: 00 fe ff ff 74 ed 5b 48 89 ea 48 c7 c6 64 ae 3c a0 48=
 8b
85 20 03 00 00 5d 41 5c 48 8b 38 e9 38 63 00 e1 4c 89 e7 e8 5e 4e ef &lt;ff=
&gt; eb a0
66 90 66 2e 0f 1f 84 00 00 00 00 00 48 83 bf 68 04 00 00
[237702.755944] RSP: 0000:ffffc90003d07e50 EFLAGS: 00010292
[237702.755945] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[237702.755947] RDX: 0000000000000000 RSI: 0000000000000004 RDI:
ffffc90003d07e3a
[237702.755948] RBP: ffff888262c40000 R08: ffffffffa0213837 R09:
0000000000000006
[237702.755950] R10: 0000000000000006 R11: 0000000000000000 R12:
ffff8882639e1a40
[237702.755951] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[237702.755952] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[237702.755954] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[237702.755955] CR2: 00002bc12936d1e0 CR3: 0000000252db0004 CR4:
00000000000606a0
[237702.755957] Kernel panic - not syncing: Fatal exception
[237702.755981] Kernel Offset: disabled
[237702.755983] Rebooting in 10 seconds..
[237712.756129] ACPI MEMORY or I/O RESET_REG.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15725077210.F04afF1.29043--

--===============1572695229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1572695229==--
