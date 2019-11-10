Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35DEF6A9C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 18:45:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA59A6E0D1;
	Sun, 10 Nov 2019 17:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C13DE6E7AB
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 17:45:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BDBC6720E2; Sun, 10 Nov 2019 17:45:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 10 Nov 2019 17:45:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: phercek@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-srdTUmreeC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2034571513=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2034571513==
Content-Type: multipart/alternative; boundary="15734079378.203EdCD23.24027"
Content-Transfer-Encoding: 7bit


--15734079378.203EdCD23.24027
Date: Sun, 10 Nov 2019 17:45:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #170 from Peter Hercek <phercek@gmail.com> ---
Maybe this helps since there is a stack trace. GUI stopped to respond so I =
shut
it down over ssh. A kernel crash during the shutdown on 5.3.6-arch1-1-ARCH =
even
when amdgpu.dpm=3D0. That is the option which is supposed to work. It has b=
oth
the patch and also amdgpu.dpm=3D0.

Nov 04 17:38:58 phnm kernel: ------------[ cut here ]------------
Nov 04 17:38:58 phnm kernel: WARNING: CPU: 6 PID: 640 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5804
amdgpu_dm_atomic_commit_tail.cold+0x82/0xed [amdgpu]
Nov 04 17:38:58 phnm kernel: Modules linked in: fuse xt_CHECKSUM xt_MASQUER=
ADE
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_n=
at
iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
libcrc32c ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter=
 tun
bridge cfg80211 rfkill 8021q garp mrp stp llc intel_rapl_msr intel_rapl_com=
mon
amdgpu x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel hid_microso=
ft
radeon mousedev input_leds joydev ff_memless kvm gpu_sched
snd_hda_codec_realtek snd_hda_codec_generic i2c_algo_bit irqbypass
ledtrig_audio ttm crct10dif_pclmul snd_hda_intel crc32_pclmul hid_generic
ghash_clmulni_intel cdc_acm drm_kms_helper snd_hda_codec aesni_intel usbhid
iTCO_wdt iTCO_vendor_support snd_hda_core wmi_bmof aes_x86_64 hid crypto_si=
md
cryptd mxm_wmi snd_hwdep glue_helper drm intel_cstate snd_pcm agpgart r8169
syscopyarea intel_uncore sysfillrect realtek sysimgblt snd_timer pcspkr
i2c_i801 fb_sys_fops e1000e intel_rapl_perf
Nov 04 17:38:58 phnm kernel:  mei_me snd libphy mei soundcore lpc_ich wmi e=
vdev
mac_hid sg ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2
crc32c_intel firewire_ohci xhci_pci xhci_hcd firewire_core ehci_pci crc_itu=
_t
ehci_hcd sr_mod cdrom sd_mod ahci libahci libata scsi_mod
Nov 04 17:38:58 phnm kernel: CPU: 6 PID: 640 Comm: Xorg Not tainted
5.3.6-arch1-1-ARCH #1
Nov 04 17:38:58 phnm kernel: Hardware name: System manufacturer System Prod=
uct
Name/P9X79, BIOS 4502 10/15/2013
Nov 04 17:38:58 phnm kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail.cold+0x82/0xed [amdgpu]
Nov 04 17:38:58 phnm kernel: Code: c7 c7 08 1e db c0 e8 0f 59 a0 db 0f 0b 4=
1 83
7c 24 08 00 0f 85 92 ff f1 ff e9 ad ff f1 ff 48 c7 c7 08 1e db c0 e8 f0 58 =
a0
db <0f> 0b e9 32 f5 f1 ff 48 8b 85 00 fd ff ff 4c 89 f2 48 c7 c6 0d 0f
Nov 04 17:38:58 phnm kernel: RSP: 0018:ffffa98c410475a0 EFLAGS: 00010046
Nov 04 17:38:58 phnm kernel: RAX: 0000000000000024 RBX: ffff894125e06000 RC=
X:
0000000000000000
Nov 04 17:38:58 phnm kernel: RDX: 0000000000000000 RSI: 0000000000000003 RD=
I:
00000000ffffffff
Nov 04 17:38:58 phnm kernel: RBP: ffffa98c410478c0 R08: 000016b622fb648e R0=
9:
ffffffff9deb3254
Nov 04 17:38:58 phnm kernel: R10: 0000000000000616 R11: 000000000001d890 R1=
2:
0000000000000286
Nov 04 17:38:58 phnm kernel: R13: ffff8940f30b0400 R14: ffff894129c20000 R1=
5:
ffff894075ba6a00
Nov 04 17:38:58 phnm kernel: FS:  00007fbf9c35c500(0000)
GS:ffff89413fb80000(0000) knlGS:0000000000000000
Nov 04 17:38:58 phnm kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
Nov 04 17:38:58 phnm kernel: CR2: 0000559991d31420 CR3: 000000082a644002 CR=
4:
00000000000606e0
Nov 04 17:38:58 phnm kernel: Call Trace:
Nov 04 17:38:58 phnm kernel:  ? commit_tail+0x3c/0x70 [drm_kms_helper]
Nov 04 17:38:58 phnm kernel:  commit_tail+0x3c/0x70 [drm_kms_helper]
Nov 04 17:38:58 phnm kernel:  drm_atomic_helper_commit+0x108/0x110
[drm_kms_helper]
Nov 04 17:38:58 phnm kernel:  drm_client_modeset_commit_atomic+0x1e8/0x200
[drm]
Nov 04 17:38:58 phnm kernel:  drm_client_modeset_commit_force+0x50/0x150 [d=
rm]
Nov 04 17:38:58 phnm kernel:  drm_fb_helper_pan_display+0xc2/0x200
[drm_kms_helper]
Nov 04 17:38:58 phnm kernel:  fb_pan_display+0x83/0x100
Nov 04 17:38:58 phnm kernel:  fb_set_var+0x1e8/0x3d0
Nov 04 17:38:58 phnm kernel:  fbcon_blank+0x1dd/0x290
Nov 04 17:38:58 phnm kernel:  do_unblank_screen+0x98/0x130
Nov 04 17:38:58 phnm kernel:  vt_ioctl+0xeff/0x1290
Nov 04 17:38:58 phnm kernel:  tty_ioctl+0x37b/0x900
Nov 04 17:38:58 phnm kernel:  ? preempt_count_add+0x68/0xa0
Nov 04 17:38:58 phnm kernel:  do_vfs_ioctl+0x43d/0x6c0
Nov 04 17:38:58 phnm kernel:  ? syscall_trace_enter+0x1f2/0x2e0
Nov 04 17:38:58 phnm kernel:  ksys_ioctl+0x5e/0x90
Nov 04 17:38:58 phnm kernel:  __x64_sys_ioctl+0x16/0x20
Nov 04 17:38:58 phnm kernel:  do_syscall_64+0x5f/0x1c0
Nov 04 17:38:58 phnm kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Nov 04 17:38:58 phnm kernel: RIP: 0033:0x7fbf9d7b425b
Nov 04 17:38:58 phnm kernel: Code: 0f 1e fa 48 8b 05 25 9c 0c 00 64 c7 00 2=
6 00
00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 =
0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f5 9b 0c 00 f7 d8 64 89 01 48
Nov 04 17:38:58 phnm kernel: RSP: 002b:00007ffe21162798 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Nov 04 17:38:58 phnm kernel: RAX: ffffffffffffffda RBX: 000055d93ebf5180 RC=
X:
00007fbf9d7b425b
Nov 04 17:38:58 phnm kernel: RDX: 0000000000000000 RSI: 0000000000004b3a RD=
I:
000000000000000c
Nov 04 17:38:58 phnm kernel: RBP: 0000000000000000 R08: 0000000000000000 R0=
9:
0000000000000007
Nov 04 17:38:58 phnm kernel: R10: fffffffffffff4b4 R11: 0000000000000246 R1=
2:
ffffffffffffffff
Nov 04 17:38:58 phnm kernel: R13: 000055d93ebfa4a0 R14: 00007ffe21162968 R1=
5:
0000000000000000
Nov 04 17:38:58 phnm kernel: ---[ end trace 40ade9cecd96ffc0 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15734079378.203EdCD23.24027
Date: Sun, 10 Nov 2019 17:45:37 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c170">Comm=
ent # 170</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
phercek&#64;gmail.com" title=3D"Peter Hercek &lt;phercek&#64;gmail.com&gt;"=
> <span class=3D"fn">Peter Hercek</span></a>
</span></b>
        <pre>Maybe this helps since there is a stack trace. GUI stopped to =
respond so I shut
it down over ssh. A kernel crash during the shutdown on 5.3.6-arch1-1-ARCH =
even
when amdgpu.dpm=3D0. That is the option which is supposed to work. It has b=
oth
the patch and also amdgpu.dpm=3D0.

Nov 04 17:38:58 phnm kernel: ------------[ cut here ]------------
Nov 04 17:38:58 phnm kernel: WARNING: CPU: 6 PID: 640 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5804
amdgpu_dm_atomic_commit_tail.cold+0x82/0xed [amdgpu]
Nov 04 17:38:58 phnm kernel: Modules linked in: fuse xt_CHECKSUM xt_MASQUER=
ADE
xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_n=
at
iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
libcrc32c ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter=
 tun
bridge cfg80211 rfkill 8021q garp mrp stp llc intel_rapl_msr intel_rapl_com=
mon
amdgpu x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel hid_microso=
ft
radeon mousedev input_leds joydev ff_memless kvm gpu_sched
snd_hda_codec_realtek snd_hda_codec_generic i2c_algo_bit irqbypass
ledtrig_audio ttm crct10dif_pclmul snd_hda_intel crc32_pclmul hid_generic
ghash_clmulni_intel cdc_acm drm_kms_helper snd_hda_codec aesni_intel usbhid
iTCO_wdt iTCO_vendor_support snd_hda_core wmi_bmof aes_x86_64 hid crypto_si=
md
cryptd mxm_wmi snd_hwdep glue_helper drm intel_cstate snd_pcm agpgart r8169
syscopyarea intel_uncore sysfillrect realtek sysimgblt snd_timer pcspkr
i2c_i801 fb_sys_fops e1000e intel_rapl_perf
Nov 04 17:38:58 phnm kernel:  mei_me snd libphy mei soundcore lpc_ich wmi e=
vdev
mac_hid sg ip_tables x_tables ext4 crc32c_generic crc16 mbcache jbd2
crc32c_intel firewire_ohci xhci_pci xhci_hcd firewire_core ehci_pci crc_itu=
_t
ehci_hcd sr_mod cdrom sd_mod ahci libahci libata scsi_mod
Nov 04 17:38:58 phnm kernel: CPU: 6 PID: 640 Comm: Xorg Not tainted
5.3.6-arch1-1-ARCH #1
Nov 04 17:38:58 phnm kernel: Hardware name: System manufacturer System Prod=
uct
Name/P9X79, BIOS 4502 10/15/2013
Nov 04 17:38:58 phnm kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail.cold+0x82/0xed [amdgpu]
Nov 04 17:38:58 phnm kernel: Code: c7 c7 08 1e db c0 e8 0f 59 a0 db 0f 0b 4=
1 83
7c 24 08 00 0f 85 92 ff f1 ff e9 ad ff f1 ff 48 c7 c7 08 1e db c0 e8 f0 58 =
a0
db &lt;0f&gt; 0b e9 32 f5 f1 ff 48 8b 85 00 fd ff ff 4c 89 f2 48 c7 c6 0d 0f
Nov 04 17:38:58 phnm kernel: RSP: 0018:ffffa98c410475a0 EFLAGS: 00010046
Nov 04 17:38:58 phnm kernel: RAX: 0000000000000024 RBX: ffff894125e06000 RC=
X:
0000000000000000
Nov 04 17:38:58 phnm kernel: RDX: 0000000000000000 RSI: 0000000000000003 RD=
I:
00000000ffffffff
Nov 04 17:38:58 phnm kernel: RBP: ffffa98c410478c0 R08: 000016b622fb648e R0=
9:
ffffffff9deb3254
Nov 04 17:38:58 phnm kernel: R10: 0000000000000616 R11: 000000000001d890 R1=
2:
0000000000000286
Nov 04 17:38:58 phnm kernel: R13: ffff8940f30b0400 R14: ffff894129c20000 R1=
5:
ffff894075ba6a00
Nov 04 17:38:58 phnm kernel: FS:  00007fbf9c35c500(0000)
GS:ffff89413fb80000(0000) knlGS:0000000000000000
Nov 04 17:38:58 phnm kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
Nov 04 17:38:58 phnm kernel: CR2: 0000559991d31420 CR3: 000000082a644002 CR=
4:
00000000000606e0
Nov 04 17:38:58 phnm kernel: Call Trace:
Nov 04 17:38:58 phnm kernel:  ? commit_tail+0x3c/0x70 [drm_kms_helper]
Nov 04 17:38:58 phnm kernel:  commit_tail+0x3c/0x70 [drm_kms_helper]
Nov 04 17:38:58 phnm kernel:  drm_atomic_helper_commit+0x108/0x110
[drm_kms_helper]
Nov 04 17:38:58 phnm kernel:  drm_client_modeset_commit_atomic+0x1e8/0x200
[drm]
Nov 04 17:38:58 phnm kernel:  drm_client_modeset_commit_force+0x50/0x150 [d=
rm]
Nov 04 17:38:58 phnm kernel:  drm_fb_helper_pan_display+0xc2/0x200
[drm_kms_helper]
Nov 04 17:38:58 phnm kernel:  fb_pan_display+0x83/0x100
Nov 04 17:38:58 phnm kernel:  fb_set_var+0x1e8/0x3d0
Nov 04 17:38:58 phnm kernel:  fbcon_blank+0x1dd/0x290
Nov 04 17:38:58 phnm kernel:  do_unblank_screen+0x98/0x130
Nov 04 17:38:58 phnm kernel:  vt_ioctl+0xeff/0x1290
Nov 04 17:38:58 phnm kernel:  tty_ioctl+0x37b/0x900
Nov 04 17:38:58 phnm kernel:  ? preempt_count_add+0x68/0xa0
Nov 04 17:38:58 phnm kernel:  do_vfs_ioctl+0x43d/0x6c0
Nov 04 17:38:58 phnm kernel:  ? syscall_trace_enter+0x1f2/0x2e0
Nov 04 17:38:58 phnm kernel:  ksys_ioctl+0x5e/0x90
Nov 04 17:38:58 phnm kernel:  __x64_sys_ioctl+0x16/0x20
Nov 04 17:38:58 phnm kernel:  do_syscall_64+0x5f/0x1c0
Nov 04 17:38:58 phnm kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Nov 04 17:38:58 phnm kernel: RIP: 0033:0x7fbf9d7b425b
Nov 04 17:38:58 phnm kernel: Code: 0f 1e fa 48 8b 05 25 9c 0c 00 64 c7 00 2=
6 00
00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 =
0f
05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d f5 9b 0c 00 f7 d8 64 89 01 48
Nov 04 17:38:58 phnm kernel: RSP: 002b:00007ffe21162798 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
Nov 04 17:38:58 phnm kernel: RAX: ffffffffffffffda RBX: 000055d93ebf5180 RC=
X:
00007fbf9d7b425b
Nov 04 17:38:58 phnm kernel: RDX: 0000000000000000 RSI: 0000000000004b3a RD=
I:
000000000000000c
Nov 04 17:38:58 phnm kernel: RBP: 0000000000000000 R08: 0000000000000000 R0=
9:
0000000000000007
Nov 04 17:38:58 phnm kernel: R10: fffffffffffff4b4 R11: 0000000000000246 R1=
2:
ffffffffffffffff
Nov 04 17:38:58 phnm kernel: R13: 000055d93ebfa4a0 R14: 00007ffe21162968 R1=
5:
0000000000000000
Nov 04 17:38:58 phnm kernel: ---[ end trace 40ade9cecd96ffc0 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15734079378.203EdCD23.24027--

--===============2034571513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2034571513==--
