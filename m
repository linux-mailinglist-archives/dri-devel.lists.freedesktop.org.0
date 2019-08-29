Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48619A2941
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 23:54:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B9A8932A;
	Thu, 29 Aug 2019 21:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2BE118932A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 21:54:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2352C72161; Thu, 29 Aug 2019 21:54:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109628] WARNING at dcn10_hw_sequencer.c:868
 dcn10_verify_allow_pstate_change_high()
Date: Thu, 29 Aug 2019 21:54:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.hirte@datenkhaos.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109628-502-GX1NIYtQss@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109628-502@http.bugs.freedesktop.org/>
References: <bug-109628-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1661509512=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1661509512==
Content-Type: multipart/alternative; boundary="15671156810.Ef8CBCA3.10547"
Content-Transfer-Encoding: 7bit


--15671156810.Ef8CBCA3.10547
Date: Thu, 29 Aug 2019 21:54:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109628

--- Comment #6 from Johannes Hirte <johannes.hirte@datenkhaos.de> ---
seeing similar with a Dell Latitude 5495 with AMD Ryzen 5 PRO 2500U:

kernel is 5.2.10

[ 1795.534761] ------------[ cut here ]------------
[ 1795.534791] WARNING: CPU: 7 PID: 765 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229
[ 1795.534793] Modules linked in: uas usb_storage algif_aead ecb algif_skci=
pher
cmac sha512_ssse3 sha512_generic md4 algif_hash af_alg btusb btrtl btbcm
btintel bluetooth ecdh_generic ecc hid_logitech_hidpp uvcvideo
videobuf2_vmalloc videobuf2_memops snd_hda_codec_generic snd_hda_codec_hdmi
videobuf2_v4l2 videodev videobuf2_common snd_hda_intel snd_hda_codec snd_hw=
dep
snd_hda_core kvm_amd snd_pcm ccp snd_timer snd kvm soundcore irqbypass
crc32_pclmul rtsx_pci_sdmmc mmc_core wmi_bmof dell_wmi joydev dell_laptop
aesni_intel ledtrig_audio dell_smbios ath10k_pci dell_wmi_descriptor aes_x8=
6_64
crypto_simd dcdbas ath10k_core cryptd glue_helper ath mac80211 psmouse
i2c_piix4 k10temp cfg80211 tg3 ucsi_acpi typec_ucsi libphy rtsx_pci typec w=
mi
dell_rbtn dell_smo8800 rfkill i2c_amd_mp2_plat i2c_amd_mp2_pci hid_logitech=
_dj
pkcs8_key_parser xhci_pci xhci_hcd pinctrl_amd i2c_hid efivarfs autofs4
[ 1795.534838] CPU: 7 PID: 765 Comm: Xorg Not tainted 5.2.10 #2
[ 1795.534841] Hardware name: Dell Inc. Latitude 5495/0G9F45, BIOS 1.2.14
05/29/2019
[ 1795.534844] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[ 1795.534847] Code: 83 c8 ff e9 9e b6 ff ff 48 c7 c7 30 8a 72 af e8 61 8a =
95
ff 0f 0b 83 c8 ff e9 88 b6 ff ff 48 c7 c7 30 8a 72 af e8 4b 8a 95 ff <0f> 0=
b 80
bb 93 01 00 00 00 75 05 e9 f2 db ff ff 48 8b 83 80 02 00
[ 1795.534849] RSP: 0018:ffffac7ec25578c8 EFLAGS: 00010246
[ 1795.534851] RAX: 0000000000000024 RBX: ffff8be1235ef000 RCX:
0000000000000000
[ 1795.534852] RDX: 0000000000000000 RSI: 0000000000000096 RDI:
00000000ffffffff
[ 1795.534855] RBP: ffff8be1235ef000 R08: 000000000000043a R09:
0000000000000033
[ 1795.534856] R10: ffffac7ec2557788 R11: ffffac7ec255778d R12:
ffff8be1260d7c00
[ 1795.534858] R13: 0000000000000002 R14: ffff8be1235ef000 R15:
ffff8bdf02588000
[ 1795.534860] FS:  00007f06ae67fd80(0000) GS:ffff8be127fc0000(0000)
knlGS:0000000000000000
[ 1795.534862] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1795.534864] CR2: 00007f6fb5fe8b08 CR3: 00000002180a0000 CR4:
00000000003406e0
[ 1795.534868] Call Trace:
[ 1795.534880]  dcn10_prepare_bandwidth+0xff/0x120
[ 1795.534884]  dc_commit_updates_for_stream+0xb02/0xc00
[ 1795.534888]  amdgpu_dm_atomic_commit_tail+0xa9b/0x1970
[ 1795.534897]  ? commit_tail+0x37/0x60
[ 1795.534903]  commit_tail+0x37/0x60
[ 1795.534911]  drm_atomic_helper_commit+0x103/0x110
[ 1795.534919]  drm_mode_obj_set_property_ioctl+0x121/0x2b1
[ 1795.534922]  ? drm_mode_obj_find_prop_id+0x40/0x40
[ 1795.534925]  drm_ioctl_kernel+0xad/0xf0
[ 1795.534928]  drm_ioctl+0x1e6/0x33f
[ 1795.534930]  ? drm_mode_obj_find_prop_id+0x40/0x40
[ 1795.534934]  amdgpu_drm_ioctl+0x44/0x80
[ 1795.534938]  do_vfs_ioctl+0x428/0x6b0
[ 1795.534941]  ? __fget+0x6c/0xa0
[ 1795.534944]  ksys_ioctl+0x59/0x90
[ 1795.534946]  __x64_sys_ioctl+0x11/0x20
[ 1795.534949]  do_syscall_64+0x54/0x1c0
[ 1795.534952]  ? page_fault+0x8/0x30
[ 1795.534954]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1795.534957] RIP: 0033:0x7f06aed32dc7
[ 1795.534960] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
7d
d9 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 99 00 0d 00 f7 d8 64 89 01 48
[ 1795.534962] RSP: 002b:00007ffcf32eaf68 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 1795.534964] RAX: ffffffffffffffda RBX: 00007ffcf32eafa0 RCX:
00007f06aed32dc7
[ 1795.534965] RDX: 00007ffcf32eafa0 RSI: 00000000c01864ba RDI:
000000000000000c
[ 1795.534967] RBP: 00000000c01864ba R08: 0000000000000052 R09:
00000000cccccccc
[ 1795.534968] R10: 00005598b65824c4 R11: 0000000000000246 R12:
00005598b5438ed0
[ 1795.534969] R13: 000000000000000c R14: 0000000000000003 R15:
0000000000000fff
[ 1795.534972] ---[ end trace 2954f837eadb53a4 ]---


Do you need more infos?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15671156810.Ef8CBCA3.10547
Date: Thu, 29 Aug 2019 21:54:41 +0000
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
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628">bug 10962=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
johannes.hirte&#64;datenkhaos.de" title=3D"Johannes Hirte &lt;johannes.hirt=
e&#64;datenkhaos.de&gt;"> <span class=3D"fn">Johannes Hirte</span></a>
</span></b>
        <pre>seeing similar with a Dell Latitude 5495 with AMD Ryzen 5 PRO =
2500U:

kernel is 5.2.10

[ 1795.534761] ------------[ cut here ]------------
[ 1795.534791] WARNING: CPU: 7 PID: 765 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229
[ 1795.534793] Modules linked in: uas usb_storage algif_aead ecb algif_skci=
pher
cmac sha512_ssse3 sha512_generic md4 algif_hash af_alg btusb btrtl btbcm
btintel bluetooth ecdh_generic ecc hid_logitech_hidpp uvcvideo
videobuf2_vmalloc videobuf2_memops snd_hda_codec_generic snd_hda_codec_hdmi
videobuf2_v4l2 videodev videobuf2_common snd_hda_intel snd_hda_codec snd_hw=
dep
snd_hda_core kvm_amd snd_pcm ccp snd_timer snd kvm soundcore irqbypass
crc32_pclmul rtsx_pci_sdmmc mmc_core wmi_bmof dell_wmi joydev dell_laptop
aesni_intel ledtrig_audio dell_smbios ath10k_pci dell_wmi_descriptor aes_x8=
6_64
crypto_simd dcdbas ath10k_core cryptd glue_helper ath mac80211 psmouse
i2c_piix4 k10temp cfg80211 tg3 ucsi_acpi typec_ucsi libphy rtsx_pci typec w=
mi
dell_rbtn dell_smo8800 rfkill i2c_amd_mp2_plat i2c_amd_mp2_pci hid_logitech=
_dj
pkcs8_key_parser xhci_pci xhci_hcd pinctrl_amd i2c_hid efivarfs autofs4
[ 1795.534838] CPU: 7 PID: 765 Comm: Xorg Not tainted 5.2.10 #2
[ 1795.534841] Hardware name: Dell Inc. Latitude 5495/0G9F45, BIOS 1.2.14
05/29/2019
[ 1795.534844] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[ 1795.534847] Code: 83 c8 ff e9 9e b6 ff ff 48 c7 c7 30 8a 72 af e8 61 8a =
95
ff 0f 0b 83 c8 ff e9 88 b6 ff ff 48 c7 c7 30 8a 72 af e8 4b 8a 95 ff &lt;0f=
&gt; 0b 80
bb 93 01 00 00 00 75 05 e9 f2 db ff ff 48 8b 83 80 02 00
[ 1795.534849] RSP: 0018:ffffac7ec25578c8 EFLAGS: 00010246
[ 1795.534851] RAX: 0000000000000024 RBX: ffff8be1235ef000 RCX:
0000000000000000
[ 1795.534852] RDX: 0000000000000000 RSI: 0000000000000096 RDI:
00000000ffffffff
[ 1795.534855] RBP: ffff8be1235ef000 R08: 000000000000043a R09:
0000000000000033
[ 1795.534856] R10: ffffac7ec2557788 R11: ffffac7ec255778d R12:
ffff8be1260d7c00
[ 1795.534858] R13: 0000000000000002 R14: ffff8be1235ef000 R15:
ffff8bdf02588000
[ 1795.534860] FS:  00007f06ae67fd80(0000) GS:ffff8be127fc0000(0000)
knlGS:0000000000000000
[ 1795.534862] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1795.534864] CR2: 00007f6fb5fe8b08 CR3: 00000002180a0000 CR4:
00000000003406e0
[ 1795.534868] Call Trace:
[ 1795.534880]  dcn10_prepare_bandwidth+0xff/0x120
[ 1795.534884]  dc_commit_updates_for_stream+0xb02/0xc00
[ 1795.534888]  amdgpu_dm_atomic_commit_tail+0xa9b/0x1970
[ 1795.534897]  ? commit_tail+0x37/0x60
[ 1795.534903]  commit_tail+0x37/0x60
[ 1795.534911]  drm_atomic_helper_commit+0x103/0x110
[ 1795.534919]  drm_mode_obj_set_property_ioctl+0x121/0x2b1
[ 1795.534922]  ? drm_mode_obj_find_prop_id+0x40/0x40
[ 1795.534925]  drm_ioctl_kernel+0xad/0xf0
[ 1795.534928]  drm_ioctl+0x1e6/0x33f
[ 1795.534930]  ? drm_mode_obj_find_prop_id+0x40/0x40
[ 1795.534934]  amdgpu_drm_ioctl+0x44/0x80
[ 1795.534938]  do_vfs_ioctl+0x428/0x6b0
[ 1795.534941]  ? __fget+0x6c/0xa0
[ 1795.534944]  ksys_ioctl+0x59/0x90
[ 1795.534946]  __x64_sys_ioctl+0x11/0x20
[ 1795.534949]  do_syscall_64+0x54/0x1c0
[ 1795.534952]  ? page_fault+0x8/0x30
[ 1795.534954]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1795.534957] RIP: 0033:0x7f06aed32dc7
[ 1795.534960] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
7d
d9 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 99 00 0d 00 f7 d8 64 89 01 48
[ 1795.534962] RSP: 002b:00007ffcf32eaf68 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 1795.534964] RAX: ffffffffffffffda RBX: 00007ffcf32eafa0 RCX:
00007f06aed32dc7
[ 1795.534965] RDX: 00007ffcf32eafa0 RSI: 00000000c01864ba RDI:
000000000000000c
[ 1795.534967] RBP: 00000000c01864ba R08: 0000000000000052 R09:
00000000cccccccc
[ 1795.534968] R10: 00005598b65824c4 R11: 0000000000000246 R12:
00005598b5438ed0
[ 1795.534969] R13: 000000000000000c R14: 0000000000000003 R15:
0000000000000fff
[ 1795.534972] ---[ end trace 2954f837eadb53a4 ]---


Do you need more infos?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15671156810.Ef8CBCA3.10547--

--===============1661509512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1661509512==--
