Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C2ECA1B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 22:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EF76F87D;
	Fri,  1 Nov 2019 21:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 168DA6F87D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 21:03:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 13698720E2; Fri,  1 Nov 2019 21:03:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110381] Failed to updateMST allocation table forpipe idx:0
Date: Fri, 01 Nov 2019 21:03:36 +0000
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
Message-ID: <bug-110381-502-RgVW2aYSKH@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0823046948=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0823046948==
Content-Type: multipart/alternative; boundary="15726422160.dAcb4845.4797"
Content-Transfer-Encoding: 7bit


--15726422160.dAcb4845.4797
Date: Fri, 1 Nov 2019 21:03:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110381

--- Comment #11 from carbenium@outlook.com ---
Seems to happen as well on 5.3.7 when waking two daisy-chained monitors from
sleep.

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Ellesmere [Radeon RX 470/480/570/570X/580/580X/590] (rev ef)


[ 4511.360909] WARNING: CPU: 5 PID: 1848 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2462
update_mst_stream_alloc_table.cold+0x15/0x28 [amdgpu]
[ 4511.360910] Modules linked in: uinput xt_CHECKSUM xt_MASQUERADE nf_nat_t=
ftp
nf_conntrack_tftp tun bridge stp llc nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_ipv6 ip6t_rpfilter
ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter sunrpc intel_rapl_msr
intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel =
kvm
irqbypass ipmi_ssif snd_hda_codec_hdmi snd_hda_intel crct10dif_pclmul iTCO_=
wdt
crc32_pclmul iTCO_vendor_support snd_hda_codec ghash_clmulni_intel intel_cs=
tate
snd_hda_core snd_hwdep snd_seq intel_uncore snd_seq_device intel_rapl_perf
i2c_i801 intel_pch_thermal snd_pcm mei_me joydev lpc_ich snd_timer mei snd
soundcore ipmi_si ipmi_devintf ipmi_msghandler ie31200_edac
[ 4511.360925]  acpi_pad binfmt_misc ip_tables hid_logitech_hidpp hid_corsa=
ir
hid_logitech_dj uas usb_storage amdgpu amd_iommu_v2 gpu_sched ttm
drm_kms_helper drm igb crc32c_intel dca i2c_algo_bit video fuse
[ 4511.360931] CPU: 5 PID: 1848 Comm: gnome-shell Tainted: G        W=20=20=
=20=20=20=20=20=20
5.3.7-301.fc31.x86_64 #1
[ 4511.360932] Hardware name: Supermicro PIO-518D-TLN4F-ST031/X10SLM+-LN4F,
BIOS 3.2a 05/31/2019
[ 4511.360976] RIP: 0010:update_mst_stream_alloc_table.cold+0x15/0x28 [amdg=
pu]
[ 4511.360977] Code: fd ff 48 c7 c7 70 fc a2 c0 e8 63 d9 7d f3 0f 0b e9 0b =
06
fd ff 48 c7 c7 b8 fd a2 c0 48 89 14 24 48 89 74 24 08 e8 47 d9 7d f3 <0f> 0=
b 48
8b 14 24 48 8b 74 24 08 44 8b 32 e9 a6 06 fd ff 48 c7 c7
[ 4511.360978] RSP: 0018:ffffb88400b5f630 EFLAGS: 00010246
[ 4511.360978] RAX: 0000000000000024 RBX: ffffa04003a72000 RCX:
0000000000000000
[ 4511.360979] RDX: 0000000000000000 RSI: ffffa0400fb57908 RDI:
ffffa0400fb57908
[ 4511.360979] RBP: ffffb88400b5f6d0 R08: ffffa0400fb57908 R09:
00000000000004b1
[ 4511.360980] R10: 000000000001a4b8 R11: 0000000000000003 R12:
ffffb88400b5f640
[ 4511.360980] R13: ffffa0400a675800 R14: 0000000000000002 R15:
ffffa04003a72000
[ 4511.360981] FS:  00007f8e2aa65d00(0000) GS:ffffa0400fb40000(0000)
knlGS:0000000000000000
[ 4511.360981] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4511.360982] CR2: 00007fb99e333c88 CR3: 000000040bf04005 CR4:
00000000001606e0
[ 4511.360982] Call Trace:
[ 4511.361026]  core_link_enable_stream+0x665/0x870 [amdgpu]
[ 4511.361068]  ? dce110_apply_ctx_to_hw+0x4b0/0x530 [amdgpu]
[ 4511.361108]  dce110_apply_ctx_to_hw+0x4b0/0x530 [amdgpu]
[ 4511.361149]  dc_commit_state+0x280/0x5c0 [amdgpu]
[ 4511.361190]  amdgpu_dm_atomic_commit_tail+0xcfc/0x1c40 [amdgpu]
[ 4511.361216]  ? amdgpu_move_blit.constprop.0+0x9c/0x110 [amdgpu]
[ 4511.361242]  ? amdgpu_bo_move+0x142/0x280 [amdgpu]
[ 4511.361244]  ? ttm_bo_handle_move_mem+0x10b/0x4f0 [ttm]
[ 4511.361247]  ? ttm_bo_validate+0x11b/0x130 [ttm]
[ 4511.361272]  ? amdgpu_bo_pin_restricted+0x62/0x270 [amdgpu]
[ 4511.361274]  ? ttm_eu_backoff_reservation+0x44/0x80 [ttm]
[ 4511.361315]  ? dm_plane_helper_prepare_fb+0x16a/0x2a0 [amdgpu]
[ 4511.361318]  ? _cond_resched+0x15/0x30
[ 4511.361319]  ? wait_for_completion_timeout+0x38/0x170
[ 4511.361326]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4511.361367]  ? amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
[ 4511.361371]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4511.361375]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[ 4511.361379]  drm_atomic_helper_set_config+0x81/0x90 [drm_kms_helper]
[ 4511.361390]  drm_mode_setcrtc+0x194/0x6a0 [drm]
[ 4511.361397]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[ 4511.361402]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[ 4511.361408]  drm_ioctl+0x208/0x390 [drm]
[ 4511.361414]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[ 4511.361437]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[ 4511.361440]  do_vfs_ioctl+0x405/0x660
[ 4511.361441]  ksys_ioctl+0x5e/0x90
[ 4511.361442]  __x64_sys_ioctl+0x16/0x20
[ 4511.361444]  do_syscall_64+0x5f/0x1a0
[ 4511.361446]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 4511.361447] RIP: 0033:0x7f8e2e72a2fb
[ 4511.361448] Code: 0f 1e fa 48 8b 05 8d 9b 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 5d 9b 0c 00 f7 d8 64 89 01 48
[ 4511.361449] RSP: 002b:00007ffed440abf8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 4511.361450] RAX: ffffffffffffffda RBX: 00007ffed440ac30 RCX:
00007f8e2e72a2fb
[ 4511.361450] RDX: 00007ffed440ac30 RSI: 00000000c06864a2 RDI:
0000000000000009
[ 4511.361450] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
0000562b0979c8a0
[ 4511.361451] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[ 4511.361451] R13: 0000000000000009 R14: 0000562b0979c8a0 R15:
0000562b0cf98280
[ 4511.361452] ---[ end trace 61c74c75b25fddce ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726422160.dAcb4845.4797
Date: Fri, 1 Nov 2019 21:03:36 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381">bug 11038=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carbenium&#64;outlook.com" title=3D"carbenium&#64;outlook.com">carbenium&#6=
4;outlook.com</a>
</span></b>
        <pre>Seems to happen as well on 5.3.7 when waking two daisy-chained=
 monitors from
sleep.

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Ellesmere [Radeon RX 470/480/570/570X/580/580X/590] (rev ef)


[ 4511.360909] WARNING: CPU: 5 PID: 1848 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2462
update_mst_stream_alloc_table.cold+0x15/0x28 [amdgpu]
[ 4511.360910] Modules linked in: uinput xt_CHECKSUM xt_MASQUERADE nf_nat_t=
ftp
nf_conntrack_tftp tun bridge stp llc nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_REJECT nf_reject_ipv6 ip6t_rpfilter
ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter sunrpc intel_rapl_msr
intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel =
kvm
irqbypass ipmi_ssif snd_hda_codec_hdmi snd_hda_intel crct10dif_pclmul iTCO_=
wdt
crc32_pclmul iTCO_vendor_support snd_hda_codec ghash_clmulni_intel intel_cs=
tate
snd_hda_core snd_hwdep snd_seq intel_uncore snd_seq_device intel_rapl_perf
i2c_i801 intel_pch_thermal snd_pcm mei_me joydev lpc_ich snd_timer mei snd
soundcore ipmi_si ipmi_devintf ipmi_msghandler ie31200_edac
[ 4511.360925]  acpi_pad binfmt_misc ip_tables hid_logitech_hidpp hid_corsa=
ir
hid_logitech_dj uas usb_storage amdgpu amd_iommu_v2 gpu_sched ttm
drm_kms_helper drm igb crc32c_intel dca i2c_algo_bit video fuse
[ 4511.360931] CPU: 5 PID: 1848 Comm: gnome-shell Tainted: G        W=20=20=
=20=20=20=20=20=20
5.3.7-301.fc31.x86_64 #1
[ 4511.360932] Hardware name: Supermicro PIO-518D-TLN4F-ST031/X10SLM+-LN4F,
BIOS 3.2a 05/31/2019
[ 4511.360976] RIP: 0010:update_mst_stream_alloc_table.cold+0x15/0x28 [amdg=
pu]
[ 4511.360977] Code: fd ff 48 c7 c7 70 fc a2 c0 e8 63 d9 7d f3 0f 0b e9 0b =
06
fd ff 48 c7 c7 b8 fd a2 c0 48 89 14 24 48 89 74 24 08 e8 47 d9 7d f3 &lt;0f=
&gt; 0b 48
8b 14 24 48 8b 74 24 08 44 8b 32 e9 a6 06 fd ff 48 c7 c7
[ 4511.360978] RSP: 0018:ffffb88400b5f630 EFLAGS: 00010246
[ 4511.360978] RAX: 0000000000000024 RBX: ffffa04003a72000 RCX:
0000000000000000
[ 4511.360979] RDX: 0000000000000000 RSI: ffffa0400fb57908 RDI:
ffffa0400fb57908
[ 4511.360979] RBP: ffffb88400b5f6d0 R08: ffffa0400fb57908 R09:
00000000000004b1
[ 4511.360980] R10: 000000000001a4b8 R11: 0000000000000003 R12:
ffffb88400b5f640
[ 4511.360980] R13: ffffa0400a675800 R14: 0000000000000002 R15:
ffffa04003a72000
[ 4511.360981] FS:  00007f8e2aa65d00(0000) GS:ffffa0400fb40000(0000)
knlGS:0000000000000000
[ 4511.360981] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4511.360982] CR2: 00007fb99e333c88 CR3: 000000040bf04005 CR4:
00000000001606e0
[ 4511.360982] Call Trace:
[ 4511.361026]  core_link_enable_stream+0x665/0x870 [amdgpu]
[ 4511.361068]  ? dce110_apply_ctx_to_hw+0x4b0/0x530 [amdgpu]
[ 4511.361108]  dce110_apply_ctx_to_hw+0x4b0/0x530 [amdgpu]
[ 4511.361149]  dc_commit_state+0x280/0x5c0 [amdgpu]
[ 4511.361190]  amdgpu_dm_atomic_commit_tail+0xcfc/0x1c40 [amdgpu]
[ 4511.361216]  ? amdgpu_move_blit.constprop.0+0x9c/0x110 [amdgpu]
[ 4511.361242]  ? amdgpu_bo_move+0x142/0x280 [amdgpu]
[ 4511.361244]  ? ttm_bo_handle_move_mem+0x10b/0x4f0 [ttm]
[ 4511.361247]  ? ttm_bo_validate+0x11b/0x130 [ttm]
[ 4511.361272]  ? amdgpu_bo_pin_restricted+0x62/0x270 [amdgpu]
[ 4511.361274]  ? ttm_eu_backoff_reservation+0x44/0x80 [ttm]
[ 4511.361315]  ? dm_plane_helper_prepare_fb+0x16a/0x2a0 [amdgpu]
[ 4511.361318]  ? _cond_resched+0x15/0x30
[ 4511.361319]  ? wait_for_completion_timeout+0x38/0x170
[ 4511.361326]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4511.361367]  ? amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
[ 4511.361371]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4511.361375]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[ 4511.361379]  drm_atomic_helper_set_config+0x81/0x90 [drm_kms_helper]
[ 4511.361390]  drm_mode_setcrtc+0x194/0x6a0 [drm]
[ 4511.361397]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[ 4511.361402]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[ 4511.361408]  drm_ioctl+0x208/0x390 [drm]
[ 4511.361414]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[ 4511.361437]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[ 4511.361440]  do_vfs_ioctl+0x405/0x660
[ 4511.361441]  ksys_ioctl+0x5e/0x90
[ 4511.361442]  __x64_sys_ioctl+0x16/0x20
[ 4511.361444]  do_syscall_64+0x5f/0x1a0
[ 4511.361446]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 4511.361447] RIP: 0033:0x7f8e2e72a2fb
[ 4511.361448] Code: 0f 1e fa 48 8b 05 8d 9b 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 5d 9b 0c 00 f7 d8 64 89 01 48
[ 4511.361449] RSP: 002b:00007ffed440abf8 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[ 4511.361450] RAX: ffffffffffffffda RBX: 00007ffed440ac30 RCX:
00007f8e2e72a2fb
[ 4511.361450] RDX: 00007ffed440ac30 RSI: 00000000c06864a2 RDI:
0000000000000009
[ 4511.361450] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
0000562b0979c8a0
[ 4511.361451] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000000000000
[ 4511.361451] R13: 0000000000000009 R14: 0000562b0979c8a0 R15:
0000562b0cf98280
[ 4511.361452] ---[ end trace 61c74c75b25fddce ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726422160.dAcb4845.4797--

--===============0823046948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0823046948==--
