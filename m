Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7569842D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 21:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47676E97E;
	Wed, 21 Aug 2019 19:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2AD3C6E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 19:16:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 226CA72161; Wed, 21 Aug 2019 19:16:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111459] AMDg black screen
Date: Wed, 21 Aug 2019 19:16:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111459-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1245790251=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1245790251==
Content-Type: multipart/alternative; boundary="15664150180.2d3F6.31810"
Content-Transfer-Encoding: 7bit


--15664150180.2d3F6.31810
Date: Wed, 21 Aug 2019 19:16:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111459

            Bug ID: 111459
           Summary: AMDg black screen
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: malkovjohnny@ukr.net

Update kernel from 5.1.20-300.fc30.x86_64 to newer versions cause black scr=
een.
After entering password in welcome screen it turns completely black.

Problem exists on new kernels:
- 5.2.8-200.fc30.x86_64
- 5.2.9-200.fc30.x86_64

Environment:
CPU - AMD Ryzen 3 2200G with Radeon Vega Graphics
video - VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] R=
aven
Ridge [Radeon Vega Series / Radeon Vega Mobile Series] (rev c8)
XFCE: xfce4-panel 4.13.7 (Xfce 4.14pre2)
Xorg: Build ID: xorg-x11-server 1.20.5-4.fc30

Aug 21 21:06:57 kernel: ------------[ cut here ]------------
Aug 21 21:06:57 kernel: WARNING: CPU: 0 PID: 182 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Aug 21 21:06:57 kernel: Modules linked in: ip6t_rpfilter ip6t_REJECT
nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables sunrpc
snd_hda_codec_realtek snd_hda_codec_generic snd_hda_codec_hdmi ledtrig_audio
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_seq edac_mce_amd
snd_seq_device joydev snd_pcm snd_timer ccp kvm snd soundcore irqbypass
crct10dif_pclmul pcc_cpufreq crc32_pclmul ghash_clmulni_intel acpi_cpufreq
wmi_bmof k10temp sp5100_tco i2c_piix4 gpio_amdpt gpio_generic amdgpu
amd_iommu_v2 gpu_sched i2c_algo_bit ttm drm_kms_helper crc32c_intel drm r81=
69
wmi pinctrl_amd video
Aug 21 21:06:57 kernel: CPU: 0 PID: 182 Comm: kworker/u32:7 Not tainted
5.2.9-200.fc30.x86_64 #1
Aug 21 21:06:57 kernel: Hardware name: Gigabyte Technology Co., Ltd. A320M-=
S2H
V2/A320M-S2H V2-CF, BIOS F2 12/25/2018
Aug 21 21:06:57 kernel: Workqueue: events_unbound commit_work [drm_kms_help=
er]
Aug 21 21:06:57 kernel: RIP:
0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Aug 21 21:06:57 kernel: Code: 83 c8 ff e9 31 b0 f9 ff 48 c7 c7 f8 80 68 c0 =
e8
f4 d0 b5 c1 0f 0b 83 c8 ff e9 1b b0 f9 ff 48 c7 c7 f8 80 68 c0 e8 de d0 b5 =
c1
<0f> 0b 80 bb 93 01 00 00 00 75 05 e9 75 d4 f9 ff 48 8b 83 80 02 00
Aug 21 21:06:57 kernel: RSP: 0018:ffffb5b741037b58 EFLAGS: 00010246
Aug 21 21:06:57 kernel: RAX: 0000000000000024 RBX: ffff9cfa0d83d000 RCX:
0000000000000006
Aug 21 21:06:57 kernel: RDX: 0000000000000000 RSI: 0000000000000092 RDI:
ffff9cfa18a17900
Aug 21 21:06:57 kernel: RBP: ffff9cfa0d83d000 R08: 0000000000000001 R09:
00000000000003fd
Aug 21 21:06:57 kernel: R10: ffffffff83bef4e4 R11: 0000000000000003 R12:
ffff9cf9f68b81b8
Aug 21 21:06:57 kernel: R13: 0000000000000000 R14: ffff9cf9f68b81b8 R15:
0000000000000004
Aug 21 21:06:57 kernel: FS:  0000000000000000(0000) GS:ffff9cfa18a00000(000=
0)
knlGS:0000000000000000
Aug 21 21:06:57 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 21 21:06:57 kernel: CR2: 000055afe80cca08 CR3: 00000001ea35a000 CR4:
00000000003406f0
Aug 21 21:06:57 kernel: Call Trace:
Aug 21 21:06:57 kernel:  dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
Aug 21 21:06:57 kernel:  dc_commit_updates_for_stream+0x84c/0xc10 [amdgpu]
Aug 21 21:06:57 kernel:  amdgpu_dm_atomic_commit_tail+0xa79/0x1940 [amdgpu]
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? _cond_resched+0x15/0x30
Aug 21 21:06:57 kernel:  ? wait_for_completion_timeout+0x38/0x170
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to+0x152/0x440
Aug 21 21:06:57 kernel:  ? commit_tail+0x3c/0x70 [drm_kms_helper]
Aug 21 21:06:57 kernel:  commit_tail+0x3c/0x70 [drm_kms_helper]
Aug 21 21:06:57 kernel:  process_one_work+0x19d/0x380
Aug 21 21:06:57 kernel:  worker_thread+0x50/0x3b0
Aug 21 21:06:57 kernel:  kthread+0xfb/0x130
Aug 21 21:06:57 kernel:  ? process_one_work+0x380/0x380
Aug 21 21:06:57 kernel:  ? kthread_park+0x80/0x80
Aug 21 21:06:57 kernel:  ret_from_fork+0x22/0x40
Aug 21 21:06:57 kernel: ---[ end trace 4ef68d388d918f99 ]---
Aug 21 21:06:57 kernel: [drm] pstate TEST_DEBUG_DATA: 0x36F60000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15664150180.2d3F6.31810
Date: Wed, 21 Aug 2019 19:16:58 +0000
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
   title=3D"NEW - AMDg black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111459">111459</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>AMDg black screen
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
          <td>not set
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
          <td>malkovjohnny&#64;ukr.net
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Update kernel from 5.1.20-300.fc30.x86_64 to newer versions ca=
use black screen.
After entering password in welcome screen it turns completely black.

Problem exists on new kernels:
- 5.2.8-200.fc30.x86_64
- 5.2.9-200.fc30.x86_64

Environment:
CPU - AMD Ryzen 3 2200G with Radeon Vega Graphics
video - VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] R=
aven
Ridge [Radeon Vega Series / Radeon Vega Mobile Series] (rev c8)
XFCE: xfce4-panel 4.13.7 (Xfce 4.14pre2)
Xorg: Build ID: xorg-x11-server 1.20.5-4.fc30

Aug 21 21:06:57 kernel: ------------[ cut here ]------------
Aug 21 21:06:57 kernel: WARNING: CPU: 0 PID: 182 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Aug 21 21:06:57 kernel: Modules linked in: ip6t_rpfilter ip6t_REJECT
nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables sunrpc
snd_hda_codec_realtek snd_hda_codec_generic snd_hda_codec_hdmi ledtrig_audio
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_seq edac_mce_amd
snd_seq_device joydev snd_pcm snd_timer ccp kvm snd soundcore irqbypass
crct10dif_pclmul pcc_cpufreq crc32_pclmul ghash_clmulni_intel acpi_cpufreq
wmi_bmof k10temp sp5100_tco i2c_piix4 gpio_amdpt gpio_generic amdgpu
amd_iommu_v2 gpu_sched i2c_algo_bit ttm drm_kms_helper crc32c_intel drm r81=
69
wmi pinctrl_amd video
Aug 21 21:06:57 kernel: CPU: 0 PID: 182 Comm: kworker/u32:7 Not tainted
5.2.9-200.fc30.x86_64 #1
Aug 21 21:06:57 kernel: Hardware name: Gigabyte Technology Co., Ltd. A320M-=
S2H
V2/A320M-S2H V2-CF, BIOS F2 12/25/2018
Aug 21 21:06:57 kernel: Workqueue: events_unbound commit_work [drm_kms_help=
er]
Aug 21 21:06:57 kernel: RIP:
0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Aug 21 21:06:57 kernel: Code: 83 c8 ff e9 31 b0 f9 ff 48 c7 c7 f8 80 68 c0 =
e8
f4 d0 b5 c1 0f 0b 83 c8 ff e9 1b b0 f9 ff 48 c7 c7 f8 80 68 c0 e8 de d0 b5 =
c1
&lt;0f&gt; 0b 80 bb 93 01 00 00 00 75 05 e9 75 d4 f9 ff 48 8b 83 80 02 00
Aug 21 21:06:57 kernel: RSP: 0018:ffffb5b741037b58 EFLAGS: 00010246
Aug 21 21:06:57 kernel: RAX: 0000000000000024 RBX: ffff9cfa0d83d000 RCX:
0000000000000006
Aug 21 21:06:57 kernel: RDX: 0000000000000000 RSI: 0000000000000092 RDI:
ffff9cfa18a17900
Aug 21 21:06:57 kernel: RBP: ffff9cfa0d83d000 R08: 0000000000000001 R09:
00000000000003fd
Aug 21 21:06:57 kernel: R10: ffffffff83bef4e4 R11: 0000000000000003 R12:
ffff9cf9f68b81b8
Aug 21 21:06:57 kernel: R13: 0000000000000000 R14: ffff9cf9f68b81b8 R15:
0000000000000004
Aug 21 21:06:57 kernel: FS:  0000000000000000(0000) GS:ffff9cfa18a00000(000=
0)
knlGS:0000000000000000
Aug 21 21:06:57 kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
Aug 21 21:06:57 kernel: CR2: 000055afe80cca08 CR3: 00000001ea35a000 CR4:
00000000003406f0
Aug 21 21:06:57 kernel: Call Trace:
Aug 21 21:06:57 kernel:  dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
Aug 21 21:06:57 kernel:  dc_commit_updates_for_stream+0x84c/0xc10 [amdgpu]
Aug 21 21:06:57 kernel:  amdgpu_dm_atomic_commit_tail+0xa79/0x1940 [amdgpu]
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? _cond_resched+0x15/0x30
Aug 21 21:06:57 kernel:  ? wait_for_completion_timeout+0x38/0x170
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x34/0x70
Aug 21 21:06:57 kernel:  ? __switch_to_asm+0x40/0x70
Aug 21 21:06:57 kernel:  ? __switch_to+0x152/0x440
Aug 21 21:06:57 kernel:  ? commit_tail+0x3c/0x70 [drm_kms_helper]
Aug 21 21:06:57 kernel:  commit_tail+0x3c/0x70 [drm_kms_helper]
Aug 21 21:06:57 kernel:  process_one_work+0x19d/0x380
Aug 21 21:06:57 kernel:  worker_thread+0x50/0x3b0
Aug 21 21:06:57 kernel:  kthread+0xfb/0x130
Aug 21 21:06:57 kernel:  ? process_one_work+0x380/0x380
Aug 21 21:06:57 kernel:  ? kthread_park+0x80/0x80
Aug 21 21:06:57 kernel:  ret_from_fork+0x22/0x40
Aug 21 21:06:57 kernel: ---[ end trace 4ef68d388d918f99 ]---
Aug 21 21:06:57 kernel: [drm] pstate TEST_DEBUG_DATA: 0x36F60000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15664150180.2d3F6.31810--

--===============1245790251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1245790251==--
