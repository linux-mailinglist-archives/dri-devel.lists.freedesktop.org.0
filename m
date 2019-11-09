Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB0F5F5A
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 14:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C66E6E320;
	Sat,  9 Nov 2019 13:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 508456E313
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 13:14:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4B1C8720E2; Sat,  9 Nov 2019 13:14:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110381] Failed to updateMST allocation table forpipe idx:0
Date: Sat, 09 Nov 2019 13:14:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: carbenium@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110381-502-7SpBob4EeF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110381-502@http.bugs.freedesktop.org/>
References: <bug-110381-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1047535041=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1047535041==
Content-Type: multipart/alternative; boundary="15733052861.cA24.15975"
Content-Transfer-Encoding: 7bit


--15733052861.cA24.15975
Date: Sat, 9 Nov 2019 13:14:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110381

--- Comment #12 from carbenium@outlook.com ---
Still happening on 5.3.8-300.fc31.x86_64

[ 5800.613189] WARNING: CPU: 7 PID: 1924 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2462
update_mst_stream_alloc_table.cold+0x15/0x28 [amdgpu]
[ 5800.613190] Modules linked in: uinput xt_CHECKSUM xt_MASQUERADE xt_connt=
rack
ipt_REJECT nf_reject_ipv4 ip6table_mangle ip6table_nat iptable_mangle
iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter tun bridge
stp llc sunrpc intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal
intel_powerclamp coretemp kvm_intel kvm snd_hda_codec_hdmi irqbypass
snd_hda_intel ipmi_ssif snd_hda_codec crct10dif_pclmul crc32_pclmul iTCO_wdt
snd_hda_core iTCO_vendor_support snd_hwdep ghash_clmulni_intel intel_cstate
snd_seq intel_uncore intel_rapl_perf snd_seq_device snd_pcm joydev snd_timer
intel_pch_thermal snd mei_me mei soundcore lpc_ich i2c_i801 ie31200_edac
ipmi_si ipmi_devintf ipmi_msghandler acpi_pad binfmt_misc ip_tables
hid_logitech_hidpp hid_corsair hid_logitech_dj uas usb_storage amdgpu
amd_iommu_v2 gpu_sched ttm drm_kms_helper drm igb crc32c_intel dca i2c_algo=
_bit
video fuse
[ 5800.613216] CPU: 7 PID: 1924 Comm: gnome-shell Tainted: G        W=20=20=
=20=20=20=20=20=20
5.3.8-300.fc31.x86_64 #1
[ 5800.613217] Hardware name: Supermicro PIO-518D-TLN4F-ST031/X10SLM+-LN4F,
BIOS 3.2a 05/31/2019
[ 5800.613299] RIP: 0010:update_mst_stream_alloc_table.cold+0x15/0x28 [amdg=
pu]
[ 5800.613301] Code: fd ff 48 c7 c7 70 fc 6b c0 e8 37 d7 b4 f2 0f 0b e9 9f =
06
fd ff 48 c7 c7 b8 fd 6b c0 48 89 14 24 48 89 74 24 08 e8 1b d7 b4 f2 <0f> 0=
b 48
8b 14 24 48 8b 74 24 08 44 8b 32 e9 3a 07 fd ff 48 c7 c7
[ 5800.613302] RSP: 0018:ffffb83e8272b630 EFLAGS: 00010246
[ 5800.613303] RAX: 0000000000000024 RBX: ffff997ec409c800 RCX:
0000000000000000
[ 5800.613304] RDX: 0000000000000000 RSI: ffff997ecfbd7908 RDI:
ffff997ecfbd7908
[ 5800.613305] RBP: ffffb83e8272b6d0 R08: ffff997ecfbd7908 R09:
00000000000004be
[ 5800.613306] R10: 000000000001ab18 R11: 0000000000000003 R12:
ffffb83e8272b640
[ 5800.613306] R13: ffff997ecac53800 R14: 0000000000000002 R15:
ffff997ec409c800
[ 5800.613308] FS:  00007fe6cea30d00(0000) GS:ffff997ecfbc0000(0000)
knlGS:0000000000000000
[ 5800.613309] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 5800.613309] CR2: 00007f00643fa428 CR3: 000000037f0ce004 CR4:
00000000001606e0
[ 5800.613310] Call Trace:
[ 5800.613391]  core_link_enable_stream+0x665/0x870 [amdgpu]
[ 5800.613469]  ? dce110_apply_ctx_to_hw+0x4b0/0x530 [amdgpu]
[ 5800.613545]  dce110_apply_ctx_to_hw+0x4b0/0x530 [amdgpu]
[ 5800.613623]  dc_commit_state+0x280/0x5c0 [amdgpu]
[ 5800.613701]  amdgpu_dm_atomic_commit_tail+0xcfc/0x1c40 [amdgpu]
[ 5800.613752]  ? amdgpu_move_blit.constprop.0+0x9c/0x110 [amdgpu]
[ 5800.613801]  ? amdgpu_bo_move+0x142/0x280 [amdgpu]
[ 5800.613807]  ? ttm_bo_handle_move_mem+0x10b/0x4f0 [ttm]
[ 5800.613811]  ? ttm_bo_validate+0x11b/0x130 [ttm]
[ 5800.613861]  ? amdgpu_bo_pin_restricted+0x62/0x270 [amdgpu]
[ 5800.613865]  ? ttm_eu_backoff_reservation+0x44/0x80 [ttm]
[ 5800.613943]  ? dm_plane_helper_prepare_fb+0x16a/0x2a0 [amdgpu]
[ 5800.613946]  ? _cond_resched+0x15/0x30
[ 5800.613948]  ? wait_for_completion_timeout+0x38/0x170
[ 5800.613961]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 5800.614038]  ? amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
[ 5800.614046]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 5800.614053]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[ 5800.614060]  drm_atomic_helper_set_config+0x81/0x90 [drm_kms_helper]
[ 5800.614081]  drm_mode_setcrtc+0x194/0x6a0 [drm]
[ 5800.614094]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[ 5800.614103]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[ 5800.614113]  drm_ioctl+0x208/0x390 [drm]
[ 5800.614124]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[ 5800.614170]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[ 5800.614173]  do_vfs_ioctl+0x405/0x660
[ 5800.614175]  ksys_ioctl+0x5e/0x90
[ 5800.614177]  __x64_sys_ioctl+0x16/0x20
[ 5800.614181]  do_syscall_64+0x5f/0x1a0
[ 5800.614184]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 5800.614186] RIP: 0033:0x7fe6d26ff2fb
[ 5800.614188] Code: 0f 1e fa 48 8b 05 8d 9b 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 5d 9b 0c 00 f7 d8 64 89 01 48
[ 5800.614189] RSP: 002b:00007ffca21673a8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 5800.614190] RAX: ffffffffffffffda RBX: 00007ffca21673e0 RCX:
00007fe6d26ff2fb
[ 5800.614191] RDX: 00007ffca21673e0 RSI: 00000000c06864a2 RDI:
0000000000000009
[ 5800.614192] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
000055edeef02df0
[ 5800.614193] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[ 5800.614193] R13: 0000000000000009 R14: 000055edeef02df0 R15:
000055edee809a80
[ 5800.614195] ---[ end trace b48771c5bafc50fa ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733052861.cA24.15975
Date: Sat, 9 Nov 2019 13:14:46 +0000
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
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381">bug 11038=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carbenium&#64;outlook.com" title=3D"carbenium&#64;outlook.com">carbenium&#6=
4;outlook.com</a>
</span></b>
        <pre>Still happening on 5.3.8-300.fc31.x86_64

[ 5800.613189] WARNING: CPU: 7 PID: 1924 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2462
update_mst_stream_alloc_table.cold+0x15/0x28 [amdgpu]
[ 5800.613190] Modules linked in: uinput xt_CHECKSUM xt_MASQUERADE xt_connt=
rack
ipt_REJECT nf_reject_ipv4 ip6table_mangle ip6table_nat iptable_mangle
iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter tun bridge
stp llc sunrpc intel_rapl_msr intel_rapl_common x86_pkg_temp_thermal
intel_powerclamp coretemp kvm_intel kvm snd_hda_codec_hdmi irqbypass
snd_hda_intel ipmi_ssif snd_hda_codec crct10dif_pclmul crc32_pclmul iTCO_wdt
snd_hda_core iTCO_vendor_support snd_hwdep ghash_clmulni_intel intel_cstate
snd_seq intel_uncore intel_rapl_perf snd_seq_device snd_pcm joydev snd_timer
intel_pch_thermal snd mei_me mei soundcore lpc_ich i2c_i801 ie31200_edac
ipmi_si ipmi_devintf ipmi_msghandler acpi_pad binfmt_misc ip_tables
hid_logitech_hidpp hid_corsair hid_logitech_dj uas usb_storage amdgpu
amd_iommu_v2 gpu_sched ttm drm_kms_helper drm igb crc32c_intel dca i2c_algo=
_bit
video fuse
[ 5800.613216] CPU: 7 PID: 1924 Comm: gnome-shell Tainted: G        W=20=20=
=20=20=20=20=20=20
5.3.8-300.fc31.x86_64 #1
[ 5800.613217] Hardware name: Supermicro PIO-518D-TLN4F-ST031/X10SLM+-LN4F,
BIOS 3.2a 05/31/2019
[ 5800.613299] RIP: 0010:update_mst_stream_alloc_table.cold+0x15/0x28 [amdg=
pu]
[ 5800.613301] Code: fd ff 48 c7 c7 70 fc 6b c0 e8 37 d7 b4 f2 0f 0b e9 9f =
06
fd ff 48 c7 c7 b8 fd 6b c0 48 89 14 24 48 89 74 24 08 e8 1b d7 b4 f2 &lt;0f=
&gt; 0b 48
8b 14 24 48 8b 74 24 08 44 8b 32 e9 3a 07 fd ff 48 c7 c7
[ 5800.613302] RSP: 0018:ffffb83e8272b630 EFLAGS: 00010246
[ 5800.613303] RAX: 0000000000000024 RBX: ffff997ec409c800 RCX:
0000000000000000
[ 5800.613304] RDX: 0000000000000000 RSI: ffff997ecfbd7908 RDI:
ffff997ecfbd7908
[ 5800.613305] RBP: ffffb83e8272b6d0 R08: ffff997ecfbd7908 R09:
00000000000004be
[ 5800.613306] R10: 000000000001ab18 R11: 0000000000000003 R12:
ffffb83e8272b640
[ 5800.613306] R13: ffff997ecac53800 R14: 0000000000000002 R15:
ffff997ec409c800
[ 5800.613308] FS:  00007fe6cea30d00(0000) GS:ffff997ecfbc0000(0000)
knlGS:0000000000000000
[ 5800.613309] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 5800.613309] CR2: 00007f00643fa428 CR3: 000000037f0ce004 CR4:
00000000001606e0
[ 5800.613310] Call Trace:
[ 5800.613391]  core_link_enable_stream+0x665/0x870 [amdgpu]
[ 5800.613469]  ? dce110_apply_ctx_to_hw+0x4b0/0x530 [amdgpu]
[ 5800.613545]  dce110_apply_ctx_to_hw+0x4b0/0x530 [amdgpu]
[ 5800.613623]  dc_commit_state+0x280/0x5c0 [amdgpu]
[ 5800.613701]  amdgpu_dm_atomic_commit_tail+0xcfc/0x1c40 [amdgpu]
[ 5800.613752]  ? amdgpu_move_blit.constprop.0+0x9c/0x110 [amdgpu]
[ 5800.613801]  ? amdgpu_bo_move+0x142/0x280 [amdgpu]
[ 5800.613807]  ? ttm_bo_handle_move_mem+0x10b/0x4f0 [ttm]
[ 5800.613811]  ? ttm_bo_validate+0x11b/0x130 [ttm]
[ 5800.613861]  ? amdgpu_bo_pin_restricted+0x62/0x270 [amdgpu]
[ 5800.613865]  ? ttm_eu_backoff_reservation+0x44/0x80 [ttm]
[ 5800.613943]  ? dm_plane_helper_prepare_fb+0x16a/0x2a0 [amdgpu]
[ 5800.613946]  ? _cond_resched+0x15/0x30
[ 5800.613948]  ? wait_for_completion_timeout+0x38/0x170
[ 5800.613961]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 5800.614038]  ? amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
[ 5800.614046]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 5800.614053]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[ 5800.614060]  drm_atomic_helper_set_config+0x81/0x90 [drm_kms_helper]
[ 5800.614081]  drm_mode_setcrtc+0x194/0x6a0 [drm]
[ 5800.614094]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[ 5800.614103]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[ 5800.614113]  drm_ioctl+0x208/0x390 [drm]
[ 5800.614124]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[ 5800.614170]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[ 5800.614173]  do_vfs_ioctl+0x405/0x660
[ 5800.614175]  ksys_ioctl+0x5e/0x90
[ 5800.614177]  __x64_sys_ioctl+0x16/0x20
[ 5800.614181]  do_syscall_64+0x5f/0x1a0
[ 5800.614184]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 5800.614186] RIP: 0033:0x7fe6d26ff2fb
[ 5800.614188] Code: 0f 1e fa 48 8b 05 8d 9b 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 5d 9b 0c 00 f7 d8 64 89 01 48
[ 5800.614189] RSP: 002b:00007ffca21673a8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 5800.614190] RAX: ffffffffffffffda RBX: 00007ffca21673e0 RCX:
00007fe6d26ff2fb
[ 5800.614191] RDX: 00007ffca21673e0 RSI: 00000000c06864a2 RDI:
0000000000000009
[ 5800.614192] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
000055edeef02df0
[ 5800.614193] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[ 5800.614193] R13: 0000000000000009 R14: 000055edeef02df0 R15:
000055edee809a80
[ 5800.614195] ---[ end trace b48771c5bafc50fa ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733052861.cA24.15975--

--===============1047535041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1047535041==--
