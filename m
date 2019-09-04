Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEEFA86BF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 18:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FED389C82;
	Wed,  4 Sep 2019 16:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5750889C82
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 16:57:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5314472161; Wed,  4 Sep 2019 16:57:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111459] AMDg black screen
Date: Wed, 04 Sep 2019 16:57:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: malkovjohnny@ukr.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111459-502-3EWo35YlOc@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111459-502@http.bugs.freedesktop.org/>
References: <bug-111459-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0497933528=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0497933528==
Content-Type: multipart/alternative; boundary="15676162361.E2B2f7B.27825"
Content-Transfer-Encoding: 7bit


--15676162361.E2B2f7B.27825
Date: Wed, 4 Sep 2019 16:57:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111459

--- Comment #3 from peter m <malkovjohnny@ukr.net> ---
Unfortunately I don't know how to apply this patch/patches.

Updated to new kernel 5.2.11-200.fc30.x86_64, problem still exists.

Sep 04 19:45:23 kernel: WARNING: CPU: 2 PID: 1014 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Sep 04 19:45:23 kernel: Modules linked in: ip6t_rpfilter ip6t_REJECT
nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables sunrpc
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi
snd_hda_intel snd_hda_codec snd_hda_core edac_mce_amd snd_hwdep snd_seq ccp
snd_seq_device snd_pcm snd_timer kvm snd irqbypass joydev soundcore sp5100_=
tco
i2c_piix4 crct10dif_pclmul wmi_bmof crc32_pclmul k10temp ghash_clmulni_intel
pcc_cpufreq gpio_amdpt gpio_generic acpi_cpufreq amdgpu amd_iommu_v2 gpu_sc=
hed
i2c_algo_bit ttm drm_kms_helper crc32c_intel drm r8169 wmi video pinctrl_amd
Sep 04 19:45:23 kernel: CPU: 2 PID: 1014 Comm: InputThread Not tainted
5.2.11-200.fc30.x86_64 #1
Sep 04 19:45:23 kernel: Hardware name: Gigabyte Technology Co., Ltd. A320M-=
S2H
V2/A320M-S2H V2-CF, BIOS F2 12/25/2018
Sep 04 19:45:23 kernel: RIP:
0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Sep 04 19:45:23 kernel: Code: 83 c8 ff e9 85 af f9 ff 48 c7 c7 f8 20 78 c0 =
e8
e8 27 a6 f0 0f 0b 83 c8 ff e9 6f af f9 ff 48 c7 c7 f8 20 78 c0 e8 d2 27 a6 =
f0
<0f> 0b 80 bb 93 01 00 00 00 75 05 e9 c9 d3 f9 ff 48 8b 83 80 02 00
Sep 04 19:45:23 kernel: RSP: 0018:ffff9ba201da3a00 EFLAGS: 00010246
Sep 04 19:45:23 kernel: RAX: 0000000000000024 RBX: ffff8a12ce72c000 RCX:
0000000000000006
Sep 04 19:45:23 kernel: RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff8a12d8a97900
Sep 04 19:45:23 kernel: RBP: ffff8a12ce72c000 R08: 0000000000000001 R09:
00000000000003f9
Sep 04 19:45:23 kernel: R10: ffffffffb2bf03e0 R11: 0000000000000003 R12:
ffff8a12caef81b8
Sep 04 19:45:23 kernel: R13: ffff8a12caef9bc8 R14: ffff8a12caef81b8 R15:
ffff8a12b8420200
Sep 04 19:45:23 kernel: FS:  00007fc4cec4b700(0000) GS:ffff8a12d8a80000(000=
0)
knlGS:0000000000000000
Sep 04 19:45:23 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Sep 04 19:45:23 kernel: CR2: 00007f19f6f298a0 CR3: 00000001fb7e4000 CR4:
00000000003406e0
Sep 04 19:45:23 kernel: Call Trace:
Sep 04 19:45:23 kernel:  dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
Sep 04 19:45:23 kernel:  dc_stream_set_cursor_attributes+0x121/0x170 [amdgp=
u]
Sep 04 19:45:23 kernel:  handle_cursor_update.isra.0+0x1af/0x310 [amdgpu]
Sep 04 19:45:23 kernel:  drm_atomic_helper_async_commit+0x63/0xd0
[drm_kms_helper]
Sep 04 19:45:23 kernel:  drm_atomic_helper_commit+0xdb/0x110 [drm_kms_helpe=
r]
Sep 04 19:45:23 kernel:  drm_atomic_helper_update_plane+0xec/0x100
[drm_kms_helper]
Sep 04 19:45:23 kernel:  drm_mode_cursor_universal+0x12c/0x240 [drm]
Sep 04 19:45:23 kernel:  drm_mode_cursor_common+0xc9/0x220 [drm]
Sep 04 19:45:23 kernel:  ? drm_mode_setplane+0x2a0/0x2a0 [drm]
Sep 04 19:45:23 kernel:  drm_mode_cursor_ioctl+0x4d/0x70 [drm]
Sep 04 19:45:23 kernel:  drm_ioctl_kernel+0xaa/0xf0 [drm]
Sep 04 19:45:23 kernel:  drm_ioctl+0x208/0x390 [drm]
Sep 04 19:45:23 kernel:  ? drm_mode_setplane+0x2a0/0x2a0 [drm]
Sep 04 19:45:23 kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Sep 04 19:45:23 kernel:  do_vfs_ioctl+0x405/0x660
Sep 04 19:45:23 kernel:  ksys_ioctl+0x5e/0x90
Sep 04 19:45:23 kernel:  ? ksys_read+0xc4/0xe0
Sep 04 19:45:23 kernel:  __x64_sys_ioctl+0x16/0x20
Sep 04 19:45:23 kernel:  do_syscall_64+0x5f/0x1a0
Sep 04 19:45:23 kernel:  ? page_fault+0x8/0x30
Sep 04 19:45:23 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Sep 04 19:45:23 kernel: RIP: 0033:0x7fc4f687e1fb
Sep 04 19:45:23 kernel: Code: 0f 1e fa 48 8b 05 8d dc 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 5d dc 0c 00 f7 d8 64 89 01 48
Sep 04 19:45:23 kernel: RSP: 002b:00007fc4cec492e8 EFLAGS: 00003246 ORIG_RA=
X:
0000000000000010
Sep 04 19:45:23 kernel: RAX: ffffffffffffffda RBX: 00007fc4cec49320 RCX:
00007fc4f687e1fb
Sep 04 19:45:23 kernel: RDX: 00007fc4cec49320 RSI: 00000000c01c64a3 RDI:
0000000000000010
Sep 04 19:45:23 kernel: RBP: 00000000c01c64a3 R08: 0000000000000276 R09:
0000000000000001
Sep 04 19:45:23 kernel: R10: 0000000000000000 R11: 0000000000003246 R12:
00005591448cec60
Sep 04 19:45:23 kernel: R13: 0000000000000010 R14: 000000000000027a R15:
0000000000000155
Sep 04 19:45:23 kernel: ---[ end trace 5a51309b874ce6f0 ]---
Sep 04 19:45:23 kernel: [drm] pstate TEST_DEBUG_DATA: 0x3FF60000
Sep 04 19:45:23 kernel: ------------[ cut here ]------------

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676162361.E2B2f7B.27825
Date: Wed, 4 Sep 2019 16:57:16 +0000
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
   title=3D"NEW - AMDg black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111459#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMDg black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111459">bug 11145=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
malkovjohnny&#64;ukr.net" title=3D"peter m &lt;malkovjohnny&#64;ukr.net&gt;=
"> <span class=3D"fn">peter m</span></a>
</span></b>
        <pre>Unfortunately I don't know how to apply this patch/patches.

Updated to new kernel 5.2.11-200.fc30.x86_64, problem still exists.

Sep 04 19:45:23 kernel: WARNING: CPU: 2 PID: 1014 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Sep 04 19:45:23 kernel: Modules linked in: ip6t_rpfilter ip6t_REJECT
nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables sunrpc
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi
snd_hda_intel snd_hda_codec snd_hda_core edac_mce_amd snd_hwdep snd_seq ccp
snd_seq_device snd_pcm snd_timer kvm snd irqbypass joydev soundcore sp5100_=
tco
i2c_piix4 crct10dif_pclmul wmi_bmof crc32_pclmul k10temp ghash_clmulni_intel
pcc_cpufreq gpio_amdpt gpio_generic acpi_cpufreq amdgpu amd_iommu_v2 gpu_sc=
hed
i2c_algo_bit ttm drm_kms_helper crc32c_intel drm r8169 wmi video pinctrl_amd
Sep 04 19:45:23 kernel: CPU: 2 PID: 1014 Comm: InputThread Not tainted
5.2.11-200.fc30.x86_64 #1
Sep 04 19:45:23 kernel: Hardware name: Gigabyte Technology Co., Ltd. A320M-=
S2H
V2/A320M-S2H V2-CF, BIOS F2 12/25/2018
Sep 04 19:45:23 kernel: RIP:
0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Sep 04 19:45:23 kernel: Code: 83 c8 ff e9 85 af f9 ff 48 c7 c7 f8 20 78 c0 =
e8
e8 27 a6 f0 0f 0b 83 c8 ff e9 6f af f9 ff 48 c7 c7 f8 20 78 c0 e8 d2 27 a6 =
f0
&lt;0f&gt; 0b 80 bb 93 01 00 00 00 75 05 e9 c9 d3 f9 ff 48 8b 83 80 02 00
Sep 04 19:45:23 kernel: RSP: 0018:ffff9ba201da3a00 EFLAGS: 00010246
Sep 04 19:45:23 kernel: RAX: 0000000000000024 RBX: ffff8a12ce72c000 RCX:
0000000000000006
Sep 04 19:45:23 kernel: RDX: 0000000000000000 RSI: 0000000000000082 RDI:
ffff8a12d8a97900
Sep 04 19:45:23 kernel: RBP: ffff8a12ce72c000 R08: 0000000000000001 R09:
00000000000003f9
Sep 04 19:45:23 kernel: R10: ffffffffb2bf03e0 R11: 0000000000000003 R12:
ffff8a12caef81b8
Sep 04 19:45:23 kernel: R13: ffff8a12caef9bc8 R14: ffff8a12caef81b8 R15:
ffff8a12b8420200
Sep 04 19:45:23 kernel: FS:  00007fc4cec4b700(0000) GS:ffff8a12d8a80000(000=
0)
knlGS:0000000000000000
Sep 04 19:45:23 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Sep 04 19:45:23 kernel: CR2: 00007f19f6f298a0 CR3: 00000001fb7e4000 CR4:
00000000003406e0
Sep 04 19:45:23 kernel: Call Trace:
Sep 04 19:45:23 kernel:  dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
Sep 04 19:45:23 kernel:  dc_stream_set_cursor_attributes+0x121/0x170 [amdgp=
u]
Sep 04 19:45:23 kernel:  handle_cursor_update.isra.0+0x1af/0x310 [amdgpu]
Sep 04 19:45:23 kernel:  drm_atomic_helper_async_commit+0x63/0xd0
[drm_kms_helper]
Sep 04 19:45:23 kernel:  drm_atomic_helper_commit+0xdb/0x110 [drm_kms_helpe=
r]
Sep 04 19:45:23 kernel:  drm_atomic_helper_update_plane+0xec/0x100
[drm_kms_helper]
Sep 04 19:45:23 kernel:  drm_mode_cursor_universal+0x12c/0x240 [drm]
Sep 04 19:45:23 kernel:  drm_mode_cursor_common+0xc9/0x220 [drm]
Sep 04 19:45:23 kernel:  ? drm_mode_setplane+0x2a0/0x2a0 [drm]
Sep 04 19:45:23 kernel:  drm_mode_cursor_ioctl+0x4d/0x70 [drm]
Sep 04 19:45:23 kernel:  drm_ioctl_kernel+0xaa/0xf0 [drm]
Sep 04 19:45:23 kernel:  drm_ioctl+0x208/0x390 [drm]
Sep 04 19:45:23 kernel:  ? drm_mode_setplane+0x2a0/0x2a0 [drm]
Sep 04 19:45:23 kernel:  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
Sep 04 19:45:23 kernel:  do_vfs_ioctl+0x405/0x660
Sep 04 19:45:23 kernel:  ksys_ioctl+0x5e/0x90
Sep 04 19:45:23 kernel:  ? ksys_read+0xc4/0xe0
Sep 04 19:45:23 kernel:  __x64_sys_ioctl+0x16/0x20
Sep 04 19:45:23 kernel:  do_syscall_64+0x5f/0x1a0
Sep 04 19:45:23 kernel:  ? page_fault+0x8/0x30
Sep 04 19:45:23 kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Sep 04 19:45:23 kernel: RIP: 0033:0x7fc4f687e1fb
Sep 04 19:45:23 kernel: Code: 0f 1e fa 48 8b 05 8d dc 0c 00 64 c7 00 26 00 =
00
00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f =
05
&lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 5d dc 0c 00 f7 d8 64 89 01 48
Sep 04 19:45:23 kernel: RSP: 002b:00007fc4cec492e8 EFLAGS: 00003246 ORIG_RA=
X:
0000000000000010
Sep 04 19:45:23 kernel: RAX: ffffffffffffffda RBX: 00007fc4cec49320 RCX:
00007fc4f687e1fb
Sep 04 19:45:23 kernel: RDX: 00007fc4cec49320 RSI: 00000000c01c64a3 RDI:
0000000000000010
Sep 04 19:45:23 kernel: RBP: 00000000c01c64a3 R08: 0000000000000276 R09:
0000000000000001
Sep 04 19:45:23 kernel: R10: 0000000000000000 R11: 0000000000003246 R12:
00005591448cec60
Sep 04 19:45:23 kernel: R13: 0000000000000010 R14: 000000000000027a R15:
0000000000000155
Sep 04 19:45:23 kernel: ---[ end trace 5a51309b874ce6f0 ]---
Sep 04 19:45:23 kernel: [drm] pstate TEST_DEBUG_DATA: 0x3FF60000
Sep 04 19:45:23 kernel: ------------[ cut here ]------------</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676162361.E2B2f7B.27825--

--===============0497933528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0497933528==--
