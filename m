Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0C3D6F2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 21:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A31889204;
	Tue, 11 Jun 2019 19:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A388C891D9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 19:38:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9F9FA72167; Tue, 11 Jun 2019 19:38:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110381] Failed to updateMST allocation table forpipe idx:0
Date: Tue, 11 Jun 2019 19:38:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: john.e.francis@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110381-502-OK6BQqcukx@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0608157885=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0608157885==
Content-Type: multipart/alternative; boundary="15602819371.2f6C4C.25250"
Content-Transfer-Encoding: 7bit


--15602819371.2f6C4C.25250
Date: Tue, 11 Jun 2019 19:38:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110381

--- Comment #6 from John Francis <john.e.francis@gmail.com> ---
I get this on kernel 5.1.8 when I use a KVM switch with DisplayPort
daisy-chained MST monitors. It occurs when I switch back.

I can workaround by powering off the last monitor in the chain, and then
powering it back on.=20

Jun 11 15:29:05 u24b6-nzxt kernel: [97725.438966] [drm] Failed to updateMST
allocation table forpipe idx:0
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687046] WARNING: CPU: 8 PID: 3551=
 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2361
update_mst_stream_alloc_table+0x143/0x150 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687047] Modules linked in: tcp_di=
ag
inet_diag ipt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo
iptable_nat xt_addrtype iptable_filter bpfilter xt_conntrack nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc over=
lay
intel_rapl nls_iso8859_1 x86_pkg_temp_thermal intel_powerclamp coretemp
kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
aesni_intel aes_x86_64 crypto_simd cryptd glue_helper intel_cstate
intel_rapl_perf snd_hda_codec_realtek snd_hda_codec_generic snd_hda_codec_h=
dmi
ledtrig_audio eeepc_wmi asus_wmi sparse_keymap video amdgpu wmi_bmof
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_seq_midi
snd_seq_midi_event chash mxm_wmi gpu_sched snd_rawmidi amd_iommu_v2 ttm
drm_kms_helper cp210x usbserial snd_seq drm snd_seq_device i2c_algo_bit
snd_timer fb_sys_fops syscopyarea sysfillrect sysimgblt snd mei_me soundcore
mei joydev input_leds mac_hid sch_fq_codel parport_pc ppdev lp parport
ip_tables
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687068]  x_tables autofs4 raid10
raid1 raid0 multipath linear raid456 async_raid6_recov async_memcpy async_pq
async_xor async_tx uas xor usb_storage raid6_pq libcrc32c hid_generic usbhid
hid r8169 lpc_ich i2c_i801 e1000e realtek ahci libahci wmi
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687078] CPU: 8 PID: 3551 Comm:
gnome-shell Kdump: loaded Tainted: G        W         5.1.8-050108-generic
#201906090832
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687078] Hardware name: System
manufacturer System Product Name/X79-DELUXE, BIOS 4805 02/02/2016
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687121] RIP:
0010:update_mst_stream_alloc_table+0x143/0x150 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687122] Code: 00 48 83 c0 10 48 8=
3 f8
60 75 dd 48 8b 44 24 68 65 48 33 04 25 28 00 00 00 75 16 48 8d 65 d8 5b 41 =
5c
41 5d 41 5e 41 5f 5d c3 <0f> 0b e9 09 ff ff ff e8 01 10 12 d1 90 0f 1f 44 0=
0 00
55 48 89 e5
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687123] RSP: 0018:ffff9efc03faf650
EFLAGS: 00010202
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687124] RAX: 0000000000000002 RBX:
ffff9120f30085c0 RCX: 0000000000000000
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687124] RDX: ffff9efc03faf73c RSI:
ffff912613584400 RDI: ffff9efc03faf6b0
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687125] RBP: ffff9efc03faf6e8 R08:
ffff9126145f0200 R09: ffff91245c560800
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687125] R10: 0000000000000001 R11:
ffff9efc03faf650 R12: ffff912614459000
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687126] R13: ffff9126145f0200 R14:
ffff9126145f0200 R15: 0000000000000002
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687127] FS:  00007ff189d41cc0(000=
0)
GS:ffff91261ea00000(0000) knlGS:0000000000000000
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687127] CS:  0010 DS: 0000 ES: 00=
00
CR0: 0000000080050033
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687128] CR2: 00007fdda4457000 CR3:
00000006d63d2006 CR4: 00000000001606e0
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687128] Call Trace:
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687172]=20
core_link_enable_stream+0x4c0/0x10d0 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687216]  ?
dig_connect_to_otg+0x75/0xe0 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687258]=20
dce110_apply_ctx_to_hw+0x441/0x4b0 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687298]  dc_commit_state+0x2cf/0x=
5a0
[amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687312]  ?
drm_calc_timestamping_constants+0x106/0x150 [drm]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687355]=20
amdgpu_dm_atomic_commit_tail+0x1c8/0xa40 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687358]  ?
ttm_bo_handle_move_mem+0x10f/0x500 [ttm]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687361]  ?
ttm_bo_validate+0x11b/0x130 [ttm]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687404]  ? bw_calcs+0x106f/0x1e50
[amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687435]  ?
amdgpu_bo_pin_restricted+0x61/0x270 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687438]  ? _cond_resched+0x19/0x30
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687439]  ?
wait_for_completion_timeout+0x38/0x140
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687441]  ? _cond_resched+0x19/0x30
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687442]  ?
wait_for_completion_interruptible+0x35/0x1a0
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687450]  commit_tail+0x42/0x70
[drm_kms_helper]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687454]  ? commit_tail+0x42/0x70
[drm_kms_helper]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602819371.2f6C4C.25250
Date: Tue, 11 Jun 2019 19:38:57 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381">bug 11038=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john.e.francis&#64;gmail.com" title=3D"John Francis &lt;john.e.francis&#64;=
gmail.com&gt;"> <span class=3D"fn">John Francis</span></a>
</span></b>
        <pre>I get this on kernel 5.1.8 when I use a KVM switch with Displa=
yPort
daisy-chained MST monitors. It occurs when I switch back.

I can workaround by powering off the last monitor in the chain, and then
powering it back on.=20

Jun 11 15:29:05 u24b6-nzxt kernel: [97725.438966] [drm] Failed to updateMST
allocation table forpipe idx:0
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687046] WARNING: CPU: 8 PID: 3551=
 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2361
update_mst_stream_alloc_table+0x143/0x150 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687047] Modules linked in: tcp_di=
ag
inet_diag ipt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo
iptable_nat xt_addrtype iptable_filter bpfilter xt_conntrack nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc over=
lay
intel_rapl nls_iso8859_1 x86_pkg_temp_thermal intel_powerclamp coretemp
kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
aesni_intel aes_x86_64 crypto_simd cryptd glue_helper intel_cstate
intel_rapl_perf snd_hda_codec_realtek snd_hda_codec_generic snd_hda_codec_h=
dmi
ledtrig_audio eeepc_wmi asus_wmi sparse_keymap video amdgpu wmi_bmof
snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_seq_midi
snd_seq_midi_event chash mxm_wmi gpu_sched snd_rawmidi amd_iommu_v2 ttm
drm_kms_helper cp210x usbserial snd_seq drm snd_seq_device i2c_algo_bit
snd_timer fb_sys_fops syscopyarea sysfillrect sysimgblt snd mei_me soundcore
mei joydev input_leds mac_hid sch_fq_codel parport_pc ppdev lp parport
ip_tables
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687068]  x_tables autofs4 raid10
raid1 raid0 multipath linear raid456 async_raid6_recov async_memcpy async_pq
async_xor async_tx uas xor usb_storage raid6_pq libcrc32c hid_generic usbhid
hid r8169 lpc_ich i2c_i801 e1000e realtek ahci libahci wmi
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687078] CPU: 8 PID: 3551 Comm:
gnome-shell Kdump: loaded Tainted: G        W         5.1.8-050108-generic
#201906090832
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687078] Hardware name: System
manufacturer System Product Name/X79-DELUXE, BIOS 4805 02/02/2016
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687121] RIP:
0010:update_mst_stream_alloc_table+0x143/0x150 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687122] Code: 00 48 83 c0 10 48 8=
3 f8
60 75 dd 48 8b 44 24 68 65 48 33 04 25 28 00 00 00 75 16 48 8d 65 d8 5b 41 =
5c
41 5d 41 5e 41 5f 5d c3 &lt;0f&gt; 0b e9 09 ff ff ff e8 01 10 12 d1 90 0f 1=
f 44 00 00
55 48 89 e5
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687123] RSP: 0018:ffff9efc03faf650
EFLAGS: 00010202
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687124] RAX: 0000000000000002 RBX:
ffff9120f30085c0 RCX: 0000000000000000
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687124] RDX: ffff9efc03faf73c RSI:
ffff912613584400 RDI: ffff9efc03faf6b0
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687125] RBP: ffff9efc03faf6e8 R08:
ffff9126145f0200 R09: ffff91245c560800
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687125] R10: 0000000000000001 R11:
ffff9efc03faf650 R12: ffff912614459000
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687126] R13: ffff9126145f0200 R14:
ffff9126145f0200 R15: 0000000000000002
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687127] FS:  00007ff189d41cc0(000=
0)
GS:ffff91261ea00000(0000) knlGS:0000000000000000
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687127] CS:  0010 DS: 0000 ES: 00=
00
CR0: 0000000080050033
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687128] CR2: 00007fdda4457000 CR3:
00000006d63d2006 CR4: 00000000001606e0
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687128] Call Trace:
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687172]=20
core_link_enable_stream+0x4c0/0x10d0 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687216]  ?
dig_connect_to_otg+0x75/0xe0 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687258]=20
dce110_apply_ctx_to_hw+0x441/0x4b0 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687298]  dc_commit_state+0x2cf/0x=
5a0
[amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687312]  ?
drm_calc_timestamping_constants+0x106/0x150 [drm]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687355]=20
amdgpu_dm_atomic_commit_tail+0x1c8/0xa40 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687358]  ?
ttm_bo_handle_move_mem+0x10f/0x500 [ttm]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687361]  ?
ttm_bo_validate+0x11b/0x130 [ttm]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687404]  ? bw_calcs+0x106f/0x1e50
[amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687435]  ?
amdgpu_bo_pin_restricted+0x61/0x270 [amdgpu]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687438]  ? _cond_resched+0x19/0x30
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687439]  ?
wait_for_completion_timeout+0x38/0x140
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687441]  ? _cond_resched+0x19/0x30
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687442]  ?
wait_for_completion_interruptible+0x35/0x1a0
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687450]  commit_tail+0x42/0x70
[drm_kms_helper]
Jun 11 15:29:05 u24b6-nzxt kernel: [97725.687454]  ? commit_tail+0x42/0x70
[drm_kms_helper]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602819371.2f6C4C.25250--

--===============0608157885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0608157885==--
