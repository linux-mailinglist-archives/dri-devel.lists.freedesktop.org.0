Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 351AABED85
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089EA6ED41;
	Thu, 26 Sep 2019 08:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7397E6EE73
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:37:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 707E972162; Thu, 26 Sep 2019 08:37:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109628] WARNING at dcn10_hw_sequencer.c:868
 dcn10_verify_allow_pstate_change_high()
Date: Thu, 26 Sep 2019 08:37:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: anode.dev@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109628-502-KivabmNRpb@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0935083375=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0935083375==
Content-Type: multipart/alternative; boundary="15694870244.3cF0.31225"
Content-Transfer-Encoding: 7bit


--15694870244.3cF0.31225
Date: Thu, 26 Sep 2019 08:37:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109628

--- Comment #25 from devbazilio <anode.dev@gmail.com> ---
I have the same problem with kernel 5.3.1 - after opening of lid cower after
suspen the screen is black, however I can ssh to laptop

CPU/GPU AMD Ryzen 3 2300U with Radeon Vega 6 Mobile Gfx

Please let me know if you need more help or debugging


[drm] pstate TEST_DEBUG_DATA: 0xB7F60000
------------[ cut here ]------------
WARNING: CPU: 3 PID: 50 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Modules linked in: rfcomm mousedev edac_mce_amd kvm_amd ccp rng_core kvm
irqbypass cmac algif_hash algif_skcipher af_alg bnep crct10dif_pclmul
crc32_pclmul ghash_clmulni_intel hp_wmi wmi_b>
 i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_f=
ops
drm agpgart
CPU: 3 PID: 50 Comm: kworker/u32:1 Tainted: G           OE=20=20=20=20
5.3.1-arch1-1-ARCH #1
Hardware name: HP HP Pavilion Laptop 15-cw0xxx/84E7, BIOS F.34 07/31/2019
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Code: 83 c8 ff e9 c1 ee f7 ff 48 c7 c7 18 fa 6c c0 e8 62 d4 4e f9 0f 0b 83 =
c8
ff e9 ab ee f7 ff 48 c7 c7 18 fa 6c c0 e8 4c d4 4e f9 <0f> 0b 80 bb 9f 01 0=
0 00
00 75 05 e9 93 17 f8 ff 48 8b >
RSP: 0018:ffffb30b002d3a80 EFLAGS: 00010246
RAX: 0000000000000024 RBX: ffff9b7d149d0000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000082 RDI: 00000000ffffffff
RBP: ffff9b7d149d0000 R08: 0000000000000706 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000001 R12: ffff9b7d15d101b8
R13: ffff9b7d15d113f8 R14: ffff9b7d15d101b8 R15: 0000000000000004
FS:  0000000000000000(0000) GS:ffff9b7d1b2c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffcc82adca8 CR3: 0000000076132000 CR4: 00000000003406e0
Call Trace:
 dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
 dc_commit_updates_for_stream+0xec8/0x1390 [amdgpu]
 ? _raw_spin_lock+0x13/0x30
 amdgpu_dm_atomic_commit_tail+0x12a6/0x1d00 [amdgpu]
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 process_one_work+0x1d1/0x3a0
 worker_thread+0x4a/0x3d0
 kthread+0xfb/0x130
 ? process_one_work+0x3a0/0x3a0
 ? kthread_park+0x80/0x80
 ret_from_fork+0x22/0x40
---[ end trace 3a22aec33a206936 ]---
[drm] pstate TEST_DEBUG_DATA: 0x37F60000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694870244.3cF0.31225
Date: Thu, 26 Sep 2019 08:37:04 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628#c25">Comme=
nt # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628">bug 10962=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
anode.dev&#64;gmail.com" title=3D"devbazilio &lt;anode.dev&#64;gmail.com&gt=
;"> <span class=3D"fn">devbazilio</span></a>
</span></b>
        <pre>I have the same problem with kernel 5.3.1 - after opening of l=
id cower after
suspen the screen is black, however I can ssh to laptop

CPU/GPU AMD Ryzen 3 2300U with Radeon Vega 6 Mobile Gfx

Please let me know if you need more help or debugging


[drm] pstate TEST_DEBUG_DATA: 0xB7F60000
------------[ cut here ]------------
WARNING: CPU: 3 PID: 50 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Modules linked in: rfcomm mousedev edac_mce_amd kvm_amd ccp rng_core kvm
irqbypass cmac algif_hash algif_skcipher af_alg bnep crct10dif_pclmul
crc32_pclmul ghash_clmulni_intel hp_wmi wmi_b&gt;
 i2c_algo_bit ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_f=
ops
drm agpgart
CPU: 3 PID: 50 Comm: kworker/u32:1 Tainted: G           OE=20=20=20=20
5.3.1-arch1-1-ARCH #1
Hardware name: HP HP Pavilion Laptop 15-cw0xxx/84E7, BIOS F.34 07/31/2019
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
Code: 83 c8 ff e9 c1 ee f7 ff 48 c7 c7 18 fa 6c c0 e8 62 d4 4e f9 0f 0b 83 =
c8
ff e9 ab ee f7 ff 48 c7 c7 18 fa 6c c0 e8 4c d4 4e f9 &lt;0f&gt; 0b 80 bb 9=
f 01 00 00
00 75 05 e9 93 17 f8 ff 48 8b &gt;
RSP: 0018:ffffb30b002d3a80 EFLAGS: 00010246
RAX: 0000000000000024 RBX: ffff9b7d149d0000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000082 RDI: 00000000ffffffff
RBP: ffff9b7d149d0000 R08: 0000000000000706 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000001 R12: ffff9b7d15d101b8
R13: ffff9b7d15d113f8 R14: ffff9b7d15d101b8 R15: 0000000000000004
FS:  0000000000000000(0000) GS:ffff9b7d1b2c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffcc82adca8 CR3: 0000000076132000 CR4: 00000000003406e0
Call Trace:
 dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
 dc_commit_updates_for_stream+0xec8/0x1390 [amdgpu]
 ? _raw_spin_lock+0x13/0x30
 amdgpu_dm_atomic_commit_tail+0x12a6/0x1d00 [amdgpu]
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 process_one_work+0x1d1/0x3a0
 worker_thread+0x4a/0x3d0
 kthread+0xfb/0x130
 ? process_one_work+0x3a0/0x3a0
 ? kthread_park+0x80/0x80
 ret_from_fork+0x22/0x40
---[ end trace 3a22aec33a206936 ]---
[drm] pstate TEST_DEBUG_DATA: 0x37F60000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694870244.3cF0.31225--

--===============0935083375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0935083375==--
