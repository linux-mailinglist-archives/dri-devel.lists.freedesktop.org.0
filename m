Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0954FC1088
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 12:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A7E89A35;
	Sat, 28 Sep 2019 10:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 532BD89A35
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 10:02:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4884772162; Sat, 28 Sep 2019 10:02:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111849] X11 blank screen when starting plasma on amdgpu
Date: Sat, 28 Sep 2019 10:02:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: kommerz11@galois.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111849-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1566961906=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1566961906==
Content-Type: multipart/alternative; boundary="15696649510.d812C3c62.5552"
Content-Transfer-Encoding: 7bit


--15696649510.d812C3c62.5552
Date: Sat, 28 Sep 2019 10:02:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111849

            Bug ID: 111849
           Summary: X11 blank screen when starting plasma on amdgpu
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: kommerz11@galois.de

I can't open a plasma session anymore with xorg (wayland still works). Afte=
r a
few seconds the screen turns black, and I see the following log message:
[ 1752.242379] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 1762.482528] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 1772.722699] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[ 1782.962871] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CONNECTOR:71:DVI-D-1] flip_done timed out
[ 1782.969534] ------------[ cut here ]------------
[ 1782.969604] WARNING: CPU: 0 PID: 1208 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5456
amdgpu_dm_atomic_commit_tail.cold+0xa5/0x103 [amdgpu]
[ 1782.969605] Modules linked in: rfcomm xt_CHECKSUM xt_MASQUERADE tun brid=
ge
stp llc nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter
ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_c
onntrack ebtable_nat ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat iptable_mangle iptable_raw
iptable_security nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nfnetlink
ebtabl
e_filter ebtables ip6table_filter ip6_tables iptable_filter cmac bnep sunrpc
vfat fat dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua pktcdvd intel_r=
apl
btusb btrtl btbcm x86_pkg_temp_thermal btintel intel_p
owerclamp coretemp kvm_intel bluetooth iTCO_wdt iTCO_vendor_support mei_hdcp
kvm ecdh_generic ecc snd_hda_codec_realtek snd_hda_codec_generic ledtrig_au=
dio
snd_hda_codec_hdmi irqbypass snd_hda_intel snd_hda_cod
ec crct10dif_pclmul crc32_pclmul snd_hda_core snd_hwdep ghash_clmulni_intel
intel_cstate snd_seq intel_uncore snd_seq_device intel_rapl_perf eeepc_wmi
snd_pcm asus_wmi
[ 1782.969618]  sparse_keymap rfkill wmi_bmof snd_timer mxm_wmi i2c_i801
intel_wmi_thunderbolt snd mei_me mei soundcore pcc_cpufreq acpi_pad binfmt_=
misc
ip_tables uas usb_storage btrfs libcrc32c xor zstd_decomp
ress zstd_compress raid6_pq amdgpu e1000e amd_iommu_v2 gpu_sched i2c_algo_b=
it
ttm nvme drm_kms_helper crc32c_intel drm serio_raw nvme_core wmi video fuse
[ 1782.969627] CPU: 0 PID: 1208 Comm: Xorg Not tainted 5.2.17-200.fc30.x86_=
64
#1
[ 1782.969627] Hardware name: System manufacturer System Product Name/Z170-=
A,
BIOS 3802 03/15/2018
[ 1782.969667] RIP: 0010:amdgpu_dm_atomic_commit_tail.cold+0xa5/0x103 [amdg=
pu]
[ 1782.969669] Code: b0 12 6c c0 4c 89 85 f0 fd ff ff e8 83 dc b1 c9 0f 0b =
4c
8b 85 f0 fd ff ff e9 f0 99 f5 ff 48 c7 c7 b0 12 6c c0 e8 69 dc b1 c9 <0f> 0=
b e9
f0 9c f5 ff 48 c7 c7 b0 12 6c c0 e8 56 dc b1 c9 0f 0b e9
[ 1782.969669] RSP: 0018:ffffb09987b3f9a0 EFLAGS: 00010046
[ 1782.969670] RAX: 0000000000000024 RBX: 0000000000000206 RCX:
0000000000000000
[ 1782.969671] RDX: 0000000000000000 RSI: ffff97fe0ea17908 RDI:
ffff97fe0ea17908
[ 1782.969671] RBP: ffffb09987b3fbe0 R08: ffff97fe0ea17908 R09:
000000000000043f
[ 1782.969672] R10: ffffb09987b3f858 R11: ffffb09987b3f85d R12:
ffff97fe00cb1800
[ 1782.969673] R13: ffff97fdf2f03b80 R14: ffff97fdff880000 R15:
ffff97fd30fa3800
[ 1782.969673] FS:  00007f5d30dada80(0000) GS:ffff97fe0ea00000(0000)
knlGS:0000000000000000
[ 1782.969674] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1782.969675] CR2: 0000561f622d1eb0 CR3: 000000084605e004 CR4:
00000000003606f0
[ 1782.969675] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 1782.969676] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[ 1782.969676] Call Trace:
[ 1782.969685]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 1782.969689]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 1782.969693]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[ 1782.969697]  drm_atomic_helper_legacy_gamma_set+0x11b/0x170 [drm_kms_hel=
per]
[ 1782.969706]  drm_mode_gamma_set_ioctl+0x191/0x200 [drm]
[ 1782.969713]  ? drm_mode_crtc_set_gamma_size+0xa0/0xa0 [drm]
[ 1782.969719]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[ 1782.969724]  drm_ioctl+0x208/0x390 [drm]
[ 1782.969731]  ? drm_mode_crtc_set_gamma_size+0xa0/0xa0 [drm]
[ 1782.969752]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[ 1782.969755]  do_vfs_ioctl+0x405/0x660
[ 1782.969757]  ? handle_mm_fault+0xc4/0x1e0
[ 1782.969758]  ksys_ioctl+0x5e/0x90
[ 1782.969760]  __x64_sys_ioctl+0x16/0x20
[ 1782.969762]  do_syscall_64+0x5f/0x1a0
[ 1782.969764]  ? page_fault+0x8/0x30
[ 1782.969765]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1782.969766] RIP: 0033:0x7f5d3121b3bb
[ 1782.969768] Code: 0f 1e fa 48 8b 05 cd ca 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 9d ca 0c 00 f7 d8 64 89 01 48
[ 1782.969768] RSP: 002b:00007ffe16e74438 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[ 1782.969768] RSP: 002b:00007ffe16e74438 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[ 1782.969769] RAX: ffffffffffffffda RBX: 00007ffe16e74470 RCX:
00007f5d3121b3bb
[ 1782.969770] RDX: 00007ffe16e74470 RSI: 00000000c02064a5 RDI:
0000000000000012
[ 1782.969770] RBP: 00000000c02064a5 R08: 0000561f6224cc80 R09:
0000561f6224ce80
[ 1782.969771] R10: 0000561f6224ca80 R11: 0000000000003246 R12:
0000561f61f265c0
[ 1782.969771] R13: 0000000000000012 R14: 0000561f6224c5c0 R15:
0000561f622494e0
[ 1782.969773] ---[ end trace b610eed8a53be2de ]---

Any ideas? I have a Fedora 30 running with kernel 5.2.17 and mesa-dri-drive=
rs
19.1.7. The xorg server is version 1.20.5.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15696649510.d812C3c62.5552
Date: Sat, 28 Sep 2019 10:02:31 +0000
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
   title=3D"NEW - X11 blank screen when starting plasma on amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111849">111849</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X11 blank screen when starting plasma on amdgpu
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>kommerz11&#64;galois.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I can't open a plasma session anymore with xorg (wayland still=
 works). After a
few seconds the screen turns black, and I see the following log message:
[ 1752.242379] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 1762.482528] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 1772.722699] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[ 1782.962871] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CONNECTOR:71:DVI-D-1] flip_done timed out
[ 1782.969534] ------------[ cut here ]------------
[ 1782.969604] WARNING: CPU: 0 PID: 1208 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5456
amdgpu_dm_atomic_commit_tail.cold+0xa5/0x103 [amdgpu]
[ 1782.969605] Modules linked in: rfcomm xt_CHECKSUM xt_MASQUERADE tun brid=
ge
stp llc nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter
ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_c
onntrack ebtable_nat ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat iptable_mangle iptable_raw
iptable_security nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nfnetlink
ebtabl
e_filter ebtables ip6table_filter ip6_tables iptable_filter cmac bnep sunrpc
vfat fat dm_multipath scsi_dh_rdac scsi_dh_emc scsi_dh_alua pktcdvd intel_r=
apl
btusb btrtl btbcm x86_pkg_temp_thermal btintel intel_p
owerclamp coretemp kvm_intel bluetooth iTCO_wdt iTCO_vendor_support mei_hdcp
kvm ecdh_generic ecc snd_hda_codec_realtek snd_hda_codec_generic ledtrig_au=
dio
snd_hda_codec_hdmi irqbypass snd_hda_intel snd_hda_cod
ec crct10dif_pclmul crc32_pclmul snd_hda_core snd_hwdep ghash_clmulni_intel
intel_cstate snd_seq intel_uncore snd_seq_device intel_rapl_perf eeepc_wmi
snd_pcm asus_wmi
[ 1782.969618]  sparse_keymap rfkill wmi_bmof snd_timer mxm_wmi i2c_i801
intel_wmi_thunderbolt snd mei_me mei soundcore pcc_cpufreq acpi_pad binfmt_=
misc
ip_tables uas usb_storage btrfs libcrc32c xor zstd_decomp
ress zstd_compress raid6_pq amdgpu e1000e amd_iommu_v2 gpu_sched i2c_algo_b=
it
ttm nvme drm_kms_helper crc32c_intel drm serio_raw nvme_core wmi video fuse
[ 1782.969627] CPU: 0 PID: 1208 Comm: Xorg Not tainted 5.2.17-200.fc30.x86_=
64
#1
[ 1782.969627] Hardware name: System manufacturer System Product Name/Z170-=
A,
BIOS 3802 03/15/2018
[ 1782.969667] RIP: 0010:amdgpu_dm_atomic_commit_tail.cold+0xa5/0x103 [amdg=
pu]
[ 1782.969669] Code: b0 12 6c c0 4c 89 85 f0 fd ff ff e8 83 dc b1 c9 0f 0b =
4c
8b 85 f0 fd ff ff e9 f0 99 f5 ff 48 c7 c7 b0 12 6c c0 e8 69 dc b1 c9 &lt;0f=
&gt; 0b e9
f0 9c f5 ff 48 c7 c7 b0 12 6c c0 e8 56 dc b1 c9 0f 0b e9
[ 1782.969669] RSP: 0018:ffffb09987b3f9a0 EFLAGS: 00010046
[ 1782.969670] RAX: 0000000000000024 RBX: 0000000000000206 RCX:
0000000000000000
[ 1782.969671] RDX: 0000000000000000 RSI: ffff97fe0ea17908 RDI:
ffff97fe0ea17908
[ 1782.969671] RBP: ffffb09987b3fbe0 R08: ffff97fe0ea17908 R09:
000000000000043f
[ 1782.969672] R10: ffffb09987b3f858 R11: ffffb09987b3f85d R12:
ffff97fe00cb1800
[ 1782.969673] R13: ffff97fdf2f03b80 R14: ffff97fdff880000 R15:
ffff97fd30fa3800
[ 1782.969673] FS:  00007f5d30dada80(0000) GS:ffff97fe0ea00000(0000)
knlGS:0000000000000000
[ 1782.969674] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1782.969675] CR2: 0000561f622d1eb0 CR3: 000000084605e004 CR4:
00000000003606f0
[ 1782.969675] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 1782.969676] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[ 1782.969676] Call Trace:
[ 1782.969685]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 1782.969689]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 1782.969693]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[ 1782.969697]  drm_atomic_helper_legacy_gamma_set+0x11b/0x170 [drm_kms_hel=
per]
[ 1782.969706]  drm_mode_gamma_set_ioctl+0x191/0x200 [drm]
[ 1782.969713]  ? drm_mode_crtc_set_gamma_size+0xa0/0xa0 [drm]
[ 1782.969719]  drm_ioctl_kernel+0xaa/0xf0 [drm]
[ 1782.969724]  drm_ioctl+0x208/0x390 [drm]
[ 1782.969731]  ? drm_mode_crtc_set_gamma_size+0xa0/0xa0 [drm]
[ 1782.969752]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[ 1782.969755]  do_vfs_ioctl+0x405/0x660
[ 1782.969757]  ? handle_mm_fault+0xc4/0x1e0
[ 1782.969758]  ksys_ioctl+0x5e/0x90
[ 1782.969760]  __x64_sys_ioctl+0x16/0x20
[ 1782.969762]  do_syscall_64+0x5f/0x1a0
[ 1782.969764]  ? page_fault+0x8/0x30
[ 1782.969765]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1782.969766] RIP: 0033:0x7f5d3121b3bb
[ 1782.969768] Code: 0f 1e fa 48 8b 05 cd ca 0c 00 64 c7 00 26 00 00 00 48 =
c7
c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 9d ca 0c 00 f7 d8 64 89 01 48
[ 1782.969768] RSP: 002b:00007ffe16e74438 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[ 1782.969768] RSP: 002b:00007ffe16e74438 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[ 1782.969769] RAX: ffffffffffffffda RBX: 00007ffe16e74470 RCX:
00007f5d3121b3bb
[ 1782.969770] RDX: 00007ffe16e74470 RSI: 00000000c02064a5 RDI:
0000000000000012
[ 1782.969770] RBP: 00000000c02064a5 R08: 0000561f6224cc80 R09:
0000561f6224ce80
[ 1782.969771] R10: 0000561f6224ca80 R11: 0000000000003246 R12:
0000561f61f265c0
[ 1782.969771] R13: 0000000000000012 R14: 0000561f6224c5c0 R15:
0000561f622494e0
[ 1782.969773] ---[ end trace b610eed8a53be2de ]---

Any ideas? I have a Fedora 30 running with kernel 5.2.17 and mesa-dri-drive=
rs
19.1.7. The xorg server is version 1.20.5.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15696649510.d812C3c62.5552--

--===============1566961906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1566961906==--
