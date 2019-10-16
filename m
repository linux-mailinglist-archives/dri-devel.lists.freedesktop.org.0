Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EA9D9886
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 19:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9FF6E9BD;
	Wed, 16 Oct 2019 17:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB6E56E9B8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 17:31:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C358F7296E; Wed, 16 Oct 2019 17:31:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109628] WARNING at dcn10_hw_sequencer.c:868
 dcn10_verify_allow_pstate_change_high()
Date: Wed, 16 Oct 2019 17:31:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: malkovjohnny@ukr.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109628-502-TYu7QZ101f@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1962566599=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1962566599==
Content-Type: multipart/alternative; boundary="15712471010.e2Ac0C81.29202"
Content-Transfer-Encoding: 7bit


--15712471010.e2Ac0C81.29202
Date: Wed, 16 Oct 2019 17:31:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109628

--- Comment #30 from peter m <malkovjohnny@ukr.net> ---
kernel 5.3.5-200.fc30.x86_64 (mockbuild@bkernel04.phx2.fedoraproject.org)
xfce - 4.14

kernel still crushing

------------[ cut here ]------------
WARNING: CPU: 2 PID: 184 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Modules linked in: ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT
nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute ip6table_nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables sunrpc
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi
snd_hda_intel edac_mce_amd snd_hda_codec snd_hda_core ccp kvm snd_hwdep snd=
_seq
snd_seq_device irqbypass snd_pcm snd_timer joydev snd soundcore
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel wmi_bmof sp5100_tco k10te=
mp
i2c_piix4 gpio_amdpt gpio_generic acpi_cpufreq amdgpu amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper crc32c_intel drm r8169 wmi video pinctrl_amd
CPU: 2 PID: 184 Comm: kworker/u32:8 Not tainted 5.3.5-200.fc30.x86_64 #1
Hardware name: Gigabyte Technology Co., Ltd. A320M-S2H V2/A320M-S2H V2-CF, =
BIOS
F2 12/25/2018
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Code: 83 c8 ff e9 00 1c f8 ff 48 c7 c7 70 6b 5a c0 e8 71 09 c6 de 0f 0b 83 =
c8
ff e9 ea 1b f8 ff 48 c7 c7 70 6b 5a c0 e8 5b 09 c6 de <0f> 0b 80 bb 9f 01 0=
0 00
00 75 05 e9 d2 42 f8 ff 48 8b 83 f8 02 00
RSP: 0018:ffffbc69803c7af0 EFLAGS: 00010246
RAX: 0000000000000024 RBX: ffff96890d220000 RCX: 0000000000000006
RDX: 0000000000000000 RSI: 0000000000000096 RDI: ffff968918a97900
RBP: ffff96890d220000 R08: 0000000000000001 R09: 0000000000000401
R10: 00000000000169fc R11: 0000000000000003 R12: ffff9688f09501b8
R13: ffff96890b32f800 R14: 0000000000000001 R15: 0000000000000004
FS:  0000000000000000(0000) GS:ffff968918a80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9eba01c000 CR3: 00000001e4092000 CR4: 00000000003406e0
Call Trace:
 dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
 dc_commit_updates_for_stream+0xfa5/0x1460 [amdgpu]
 amdgpu_dm_atomic_commit_tail+0xb61/0x1c40 [amdgpu]
 ? cpumask_next_and+0x1a/0x20
 ? load_balance+0x1a4/0xb50
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? _cond_resched+0x15/0x30
 ? wait_for_completion_timeout+0x38/0x170
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to+0x152/0x440
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 process_one_work+0x19d/0x340
 worker_thread+0x50/0x3b0
 kthread+0xfb/0x130
 ? process_one_work+0x340/0x340
 ? kthread_park+0x80/0x80
 ret_from_fork+0x22/0x40
---[ end trace 76057b23d3d7f433 ]---
[drm] pstate TEST_DEBUG_DATA: 0x36F60000
------------[ cut here ]------------

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15712471010.e2Ac0C81.29202
Date: Wed, 16 Oct 2019 17:31:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628#c30">Comme=
nt # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628">bug 10962=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
malkovjohnny&#64;ukr.net" title=3D"peter m &lt;malkovjohnny&#64;ukr.net&gt;=
"> <span class=3D"fn">peter m</span></a>
</span></b>
        <pre>kernel 5.3.5-200.fc30.x86_64 (<a href=3D"mailto:mockbuild&#64;=
bkernel04.phx2.fedoraproject.org">mockbuild&#64;bkernel04.phx2.fedoraprojec=
t.org</a>)
xfce - 4.14

kernel still crushing

------------[ cut here ]------------
WARNING: CPU: 2 PID: 184 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Modules linked in: ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT
nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute ip6table_nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables sunrpc
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_codec_hdmi
snd_hda_intel edac_mce_amd snd_hda_codec snd_hda_core ccp kvm snd_hwdep snd=
_seq
snd_seq_device irqbypass snd_pcm snd_timer joydev snd soundcore
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel wmi_bmof sp5100_tco k10te=
mp
i2c_piix4 gpio_amdpt gpio_generic acpi_cpufreq amdgpu amd_iommu_v2 gpu_sched
i2c_algo_bit ttm drm_kms_helper crc32c_intel drm r8169 wmi video pinctrl_amd
CPU: 2 PID: 184 Comm: kworker/u32:8 Not tainted 5.3.5-200.fc30.x86_64 #1
Hardware name: Gigabyte Technology Co., Ltd. A320M-S2H V2/A320M-S2H V2-CF, =
BIOS
F2 12/25/2018
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Code: 83 c8 ff e9 00 1c f8 ff 48 c7 c7 70 6b 5a c0 e8 71 09 c6 de 0f 0b 83 =
c8
ff e9 ea 1b f8 ff 48 c7 c7 70 6b 5a c0 e8 5b 09 c6 de &lt;0f&gt; 0b 80 bb 9=
f 01 00 00
00 75 05 e9 d2 42 f8 ff 48 8b 83 f8 02 00
RSP: 0018:ffffbc69803c7af0 EFLAGS: 00010246
RAX: 0000000000000024 RBX: ffff96890d220000 RCX: 0000000000000006
RDX: 0000000000000000 RSI: 0000000000000096 RDI: ffff968918a97900
RBP: ffff96890d220000 R08: 0000000000000001 R09: 0000000000000401
R10: 00000000000169fc R11: 0000000000000003 R12: ffff9688f09501b8
R13: ffff96890b32f800 R14: 0000000000000001 R15: 0000000000000004
FS:  0000000000000000(0000) GS:ffff968918a80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9eba01c000 CR3: 00000001e4092000 CR4: 00000000003406e0
Call Trace:
 dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
 dc_commit_updates_for_stream+0xfa5/0x1460 [amdgpu]
 amdgpu_dm_atomic_commit_tail+0xb61/0x1c40 [amdgpu]
 ? cpumask_next_and+0x1a/0x20
 ? load_balance+0x1a4/0xb50
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? _cond_resched+0x15/0x30
 ? wait_for_completion_timeout+0x38/0x170
 ? __switch_to_asm+0x40/0x70
 ? __switch_to_asm+0x34/0x70
 ? __switch_to_asm+0x40/0x70
 ? __switch_to+0x152/0x440
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 process_one_work+0x19d/0x340
 worker_thread+0x50/0x3b0
 kthread+0xfb/0x130
 ? process_one_work+0x340/0x340
 ? kthread_park+0x80/0x80
 ret_from_fork+0x22/0x40
---[ end trace 76057b23d3d7f433 ]---
[drm] pstate TEST_DEBUG_DATA: 0x36F60000
------------[ cut here ]------------</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15712471010.e2Ac0C81.29202--

--===============1962566599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1962566599==--
