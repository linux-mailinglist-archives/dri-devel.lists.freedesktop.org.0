Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAFA7908C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 18:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659CF6E0F0;
	Mon, 29 Jul 2019 16:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0D1F76E0CC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 16:16:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 09B1E72167; Mon, 29 Jul 2019 16:16:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110381] Failed to updateMST allocation table forpipe idx:0
Date: Mon, 29 Jul 2019 16:16:10 +0000
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
Message-ID: <bug-110381-502-admLL42aKc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1259650351=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1259650351==
Content-Type: multipart/alternative; boundary="15644169700.f0e9eF9.32374"
Content-Transfer-Encoding: 7bit


--15644169700.f0e9eF9.32374
Date: Mon, 29 Jul 2019 16:16:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110381

--- Comment #9 from John Francis <john.e.francis@gmail.com> ---
I am still seeing this error on kernel 5.2.2. I think it happens when I swi=
tch
away the monitors to another host on the KVM switch.

Switching back later, I get only 1 display, problematic as some windows are=
 on
the non-working display. <alt><ctrl><f3> to console, both displays mirrored,
with text mode login prompt. Then <alt><ctrl><f2> back to graphical display,
gnome crashes, I get the gnome login screen. Things had improved a bit until
amd's latest updates in 5.2.x.

Jul 29 09:05:33 u24b6-nzxt kernel: [255451.664351] [drm] DM_MST: added
connector: 00000000629ccdae [id: 113] [master: 0000000088dc6666]
Jul 29 09:05:33 u24b6-nzxt kernel: [255451.664379] [drm] DM_MST: added
connector: 00000000a50ff579 [id: 118] [master: 0000000088dc6666]
Jul 29 09:05:33 u24b6-nzxt kernel: [255451.723246] [drm] Failed to updateMST
allocation table forpipe idx:0
Jul 29 09:05:34 u24b6-nzxt kernel: [255451.960729] [drm] Failed to updateMST
allocation table forpipe idx:0
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: Add Monitors ...
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: new: i1x1920y0w1920h1080
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: pi:0
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: i:0 x:0 y:0 w:1920 h:1080
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: i:1 x:1920 y:0 w:1920 h:1080
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: g_value_set_object: assertion
'G_IS_OBJECT (v_object)' failed
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020762] WARNING: CPU: 0 PID: 928=
9 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2404
update_mst_stream_alloc_table+0x11e/0x130 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020763] Modules linked in: tcp_d=
iag
inet_diag xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo
iptable_nat xt_addrtype iptable_filter bpfilter xt_conntrack nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc over=
lay
nls_iso8859_1 intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp
kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
aesni_intel aes_x86_64 crypto_simd cryptd glue_helper intel_cstate
intel_rapl_perf snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel snd_hda_codec snd_hda_core amdgpu snd_hwdep
snd_pcm snd_seq_midi snd_seq_midi_event eeepc_wmi asus_wmi sparse_keymap
snd_rawmidi video snd_seq amd_iommu_v2 gpu_sched ttm wmi_bmof drm_kms_helper
cp210x snd_seq_device mxm_wmi usbserial joydev input_leds snd_timer drm
i2c_algo_bit snd fb_sys_fops syscopyarea sysfillrect mei_me sysimgblt sound=
core
mei mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020783]  autofs4 raid10 raid1 ra=
id0
multipath linear raid456 async_raid6_recov async_memcpy async_pq async_xor
async_tx xor uas usb_storage raid6_pq libcrc32c hid_generic usbhid hid r8169
lpc_ich i2c_i801 e1000e realtek ahci libahci wmi
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020793] CPU: 0 PID: 9289 Comm:
gnome-shell Kdump: loaded Tainted: G        W         5.2.2-050202-generic
#201907231250
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020794] Hardware name: System
manufacturer System Product Name/X79-DELUXE, BIOS 4805 02/02/2016
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020838] RIP:
0010:update_mst_stream_alloc_table+0x11e/0x130 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020839] Code: 28 00 00 00 75 2b =
48
8d 65 e0 5b 41 5c 41 5d 41 5e 5d c3 0f b6 06 49 89 1c 24 41 88 44 24 08 0f =
b6
46 01 41 88 44 24 09 eb 93 <0f> 0b e9 2f ff ff ff e8 96 81 d9 e5 66 0f 1f 4=
4 00
00 0f 1f 44 00
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020840] RSP: 0018:ffff9a27c3f2f6=
50
EFLAGS: 00010202
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020840] RAX: 0000000000000002 RB=
X:
ffff8ea3507e4380 RCX: 0000000000000000
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020841] RDX: ffff9a27c3f2f714 RS=
I:
ffff8ea3507e4380 RDI: ffff9a27c3f2f6b0
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020842] RBP: ffff9a27c3f2f6e8 R0=
8:
ffffffffc0469df5 R09: 0000000000000000
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020842] R10: ffff8ea353eb8a00 R1=
1:
ffff9a27c3f2f650 R12: ffff8ea353eb8a00
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020842] R13: ffff8ea352f3d400 R1=
4:
0000000000000002 R15: ffff8ea353eb8a00
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020843] FS:  00007f530ace1cc0(00=
00)
GS:ffff8ea35f800000(0000) knlGS:0000000000000000
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020844] CS:  0010 DS: 0000 ES: 0=
000
CR0: 0000000080050033
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020845] CR2: 000015124f029000 CR=
3:
00000001b8150005 CR4: 00000000001606f0
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020845] Call Trace:
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020890]=20
core_link_enable_stream+0x5ee/0xa10 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020933]=20
dce110_apply_ctx_to_hw+0x441/0x4c0 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020976]=20
dc_commit_state_no_check+0x228/0x580 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021018]  dc_commit_state+0x96/0x=
b0
[amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021061]=20
amdgpu_dm_atomic_commit_tail+0x3b5/0xdb0 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021065]  ?
ttm_bo_handle_move_mem+0x10f/0x500 [ttm]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021067]  ?
ttm_bo_validate+0x128/0x140 [ttm]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021111]  ?
print_bw_calcs_data.isra.0+0x18ae/0x2470 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021140]  ?
amdgpu_bo_pin_restricted+0x266/0x2a0 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021144]  ? _cond_resched+0x19/0x=
30
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021145]  ?
wait_for_completion_timeout+0x3a/0x120
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021146]  ? _cond_resched+0x19/0x=
30
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021148]  ?
wait_for_completion_interruptible+0x37/0x160
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021156]  commit_tail+0x41/0x70
[drm_kms_helper]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021160]  ? commit_tail+0x41/0x70
[drm_kms_helper]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021164]=20
drm_atomic_helper_commit+0x118/0x120 [drm_kms_helper]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021207]=20
amdgpu_dm_atomic_commit+0xb1/0xf0 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021221]  drm_atomic_commit+0x4a/=
0x50
[drm]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15644169700.f0e9eF9.32374
Date: Mon, 29 Jul 2019 16:16:10 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381">bug 11038=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john.e.francis&#64;gmail.com" title=3D"John Francis &lt;john.e.francis&#64;=
gmail.com&gt;"> <span class=3D"fn">John Francis</span></a>
</span></b>
        <pre>I am still seeing this error on kernel 5.2.2. I think it happe=
ns when I switch
away the monitors to another host on the KVM switch.

Switching back later, I get only 1 display, problematic as some windows are=
 on
the non-working display. &lt;alt&gt;&lt;ctrl&gt;&lt;f3&gt; to console, both=
 displays mirrored,
with text mode login prompt. Then &lt;alt&gt;&lt;ctrl&gt;&lt;f2&gt; back to=
 graphical display,
gnome crashes, I get the gnome login screen. Things had improved a bit until
amd's latest updates in 5.2.x.

Jul 29 09:05:33 u24b6-nzxt kernel: [255451.664351] [drm] DM_MST: added
connector: 00000000629ccdae [id: 113] [master: 0000000088dc6666]
Jul 29 09:05:33 u24b6-nzxt kernel: [255451.664379] [drm] DM_MST: added
connector: 00000000a50ff579 [id: 118] [master: 0000000088dc6666]
Jul 29 09:05:33 u24b6-nzxt kernel: [255451.723246] [drm] Failed to updateMST
allocation table forpipe idx:0
Jul 29 09:05:34 u24b6-nzxt kernel: [255451.960729] [drm] Failed to updateMST
allocation table forpipe idx:0
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: Add Monitors ...
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: new: i1x1920y0w1920h1080
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: pi:0
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: i:0 x:0 y:0 w:1920 h:1080
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: i:1 x:1920 y:0 w:1920 h:1080
Jul 29 09:05:34 u24b6-nzxt gnome-shell[9289]: g_value_set_object: assertion
'G_IS_OBJECT (v_object)' failed
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020762] WARNING: CPU: 0 PID: 928=
9 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2404
update_mst_stream_alloc_table+0x11e/0x130 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020763] Modules linked in: tcp_d=
iag
inet_diag xt_MASQUERADE nf_conntrack_netlink nfnetlink xfrm_user xfrm_algo
iptable_nat xt_addrtype iptable_filter bpfilter xt_conntrack nf_nat
nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 br_netfilter bridge stp llc over=
lay
nls_iso8859_1 intel_rapl x86_pkg_temp_thermal intel_powerclamp coretemp
kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
aesni_intel aes_x86_64 crypto_simd cryptd glue_helper intel_cstate
intel_rapl_perf snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi snd_hda_intel snd_hda_codec snd_hda_core amdgpu snd_hwdep
snd_pcm snd_seq_midi snd_seq_midi_event eeepc_wmi asus_wmi sparse_keymap
snd_rawmidi video snd_seq amd_iommu_v2 gpu_sched ttm wmi_bmof drm_kms_helper
cp210x snd_seq_device mxm_wmi usbserial joydev input_leds snd_timer drm
i2c_algo_bit snd fb_sys_fops syscopyarea sysfillrect mei_me sysimgblt sound=
core
mei mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020783]  autofs4 raid10 raid1 ra=
id0
multipath linear raid456 async_raid6_recov async_memcpy async_pq async_xor
async_tx xor uas usb_storage raid6_pq libcrc32c hid_generic usbhid hid r8169
lpc_ich i2c_i801 e1000e realtek ahci libahci wmi
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020793] CPU: 0 PID: 9289 Comm:
gnome-shell Kdump: loaded Tainted: G        W         5.2.2-050202-generic
#201907231250
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020794] Hardware name: System
manufacturer System Product Name/X79-DELUXE, BIOS 4805 02/02/2016
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020838] RIP:
0010:update_mst_stream_alloc_table+0x11e/0x130 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020839] Code: 28 00 00 00 75 2b =
48
8d 65 e0 5b 41 5c 41 5d 41 5e 5d c3 0f b6 06 49 89 1c 24 41 88 44 24 08 0f =
b6
46 01 41 88 44 24 09 eb 93 &lt;0f&gt; 0b e9 2f ff ff ff e8 96 81 d9 e5 66 0=
f 1f 44 00
00 0f 1f 44 00
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020840] RSP: 0018:ffff9a27c3f2f6=
50
EFLAGS: 00010202
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020840] RAX: 0000000000000002 RB=
X:
ffff8ea3507e4380 RCX: 0000000000000000
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020841] RDX: ffff9a27c3f2f714 RS=
I:
ffff8ea3507e4380 RDI: ffff9a27c3f2f6b0
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020842] RBP: ffff9a27c3f2f6e8 R0=
8:
ffffffffc0469df5 R09: 0000000000000000
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020842] R10: ffff8ea353eb8a00 R1=
1:
ffff9a27c3f2f650 R12: ffff8ea353eb8a00
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020842] R13: ffff8ea352f3d400 R1=
4:
0000000000000002 R15: ffff8ea353eb8a00
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020843] FS:  00007f530ace1cc0(00=
00)
GS:ffff8ea35f800000(0000) knlGS:0000000000000000
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020844] CS:  0010 DS: 0000 ES: 0=
000
CR0: 0000000080050033
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020845] CR2: 000015124f029000 CR=
3:
00000001b8150005 CR4: 00000000001606f0
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020845] Call Trace:
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020890]=20
core_link_enable_stream+0x5ee/0xa10 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020933]=20
dce110_apply_ctx_to_hw+0x441/0x4c0 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.020976]=20
dc_commit_state_no_check+0x228/0x580 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021018]  dc_commit_state+0x96/0x=
b0
[amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021061]=20
amdgpu_dm_atomic_commit_tail+0x3b5/0xdb0 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021065]  ?
ttm_bo_handle_move_mem+0x10f/0x500 [ttm]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021067]  ?
ttm_bo_validate+0x128/0x140 [ttm]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021111]  ?
print_bw_calcs_data.isra.0+0x18ae/0x2470 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021140]  ?
amdgpu_bo_pin_restricted+0x266/0x2a0 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021144]  ? _cond_resched+0x19/0x=
30
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021145]  ?
wait_for_completion_timeout+0x3a/0x120
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021146]  ? _cond_resched+0x19/0x=
30
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021148]  ?
wait_for_completion_interruptible+0x37/0x160
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021156]  commit_tail+0x41/0x70
[drm_kms_helper]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021160]  ? commit_tail+0x41/0x70
[drm_kms_helper]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021164]=20
drm_atomic_helper_commit+0x118/0x120 [drm_kms_helper]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021207]=20
amdgpu_dm_atomic_commit+0xb1/0xf0 [amdgpu]
Jul 29 09:05:35 u24b6-nzxt kernel: [255453.021221]  drm_atomic_commit+0x4a/=
0x50
[drm]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15644169700.f0e9eF9.32374--

--===============1259650351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1259650351==--
