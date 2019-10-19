Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4713FDDB33
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 23:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D36B89C1C;
	Sat, 19 Oct 2019 21:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A1AD789D1D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 21:26:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9E59E720E2; Sat, 19 Oct 2019 21:26:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 19 Oct 2019 21:26:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodamorris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-qyNKZMYoWH@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0045920798=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0045920798==
Content-Type: multipart/alternative; boundary="15715204195.Fba0e4b.6266"
Content-Transfer-Encoding: 7bit


--15715204195.Fba0e4b.6266
Date: Sat, 19 Oct 2019 21:26:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #114 from Rodney A Morris <rodamorris@gmail.com> ---
To rule out possible hardware issues, I purchased another Vega 64 card.  Th=
is
time a factory overclocked card.  Since installing the card, I have experie=
nced
three lock ups.  Two playing Stellaris and one while playing a youtube vide=
o.=20
After playing Stellaris without issue two weeks ago, the computer locked up
twice last night.  While my previous problems seemed to be, in part, linked=
 to
a circular lock dependence, the last logs indicate something different.  I'm
seeing a lot of powerplay errors after the fence timeout.  Hope this new
information provides some insight into the problem.

         /:-------------:\          rmorris@ezra.blanchardmorris.net=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.3.6-200.fc30.x86_64=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 16 hours, 21 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2214 (rpm), 36 (flatpak)=20
,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
:------------:MMMd-------    .---:   Resolution: 2560x1440=20
:----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
:--     .+shhhMMMmhhy++   .------/   WM: Mutter=20
:-    -------:MMMd--------------:    WM Theme: Adwaita=20
:-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=20
:-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
:-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
:---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) @ 4.000GHz=20
:------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/64=20
:---------------------://            Memory: 2814MiB / 32036MiB=20


Card:

MSI Vega 64 OC (Card works fine under windows 10)

Game being played:

Stellaris

Native Game

Description of Event:
Screen goes blank and music and sound continues to play before computer loc=
ks
up or reboots.

relevant dmesg from crash:
[ 4244.670269] perf: interrupt took too long (2502 > 2500), lowering
kernel.perf_event_max_sample_rate to 79000
[ 4298.241156] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[ 4304.385587] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D60549844, emitted seq=3D60549846
[ 4304.385634] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[ 4304.385637] amdgpu 0000:06:00.0: GPU reset begin!
[ 4304.402938] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4304.402945] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4304.402947] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4304.402948] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4304.404006] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4308.481068] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 4314.625180] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-=
0]
hw_done or flip_done timed out
[ 4324.865057] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 4335.105035] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[ 4336.695112] amdgpu: [powerplay] No response from smu
[ 4336.695128] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[ 4338.307125] amdgpu: [powerplay] No response from smu
[ 4339.922039] amdgpu: [powerplay] No response from smu
[ 4339.922043] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[ 4341.541675] amdgpu: [powerplay] No response from smu
[ 4343.162102] amdgpu: [powerplay] No response from smu
[ 4343.162105] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[ 4343.221953] [drm] REG_WAIT timeout 10us * 3500 tries - dce_mi_free_dmif
line:634
[ 4343.221962] ------------[ cut here ]------------
[ 4343.222070] WARNING: CPU: 0 PID: 16500 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:332
generic_reg_wait.cold+0x31/0x53 [amdgpu]
[ 4343.222072] Modules linked in: rfcomm xt_CHECKSUM xt_MASQUERADE tun brid=
ge
stp llc nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter
ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_n=
at
ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security
iptable_nat nf_nat iptable_mangle iptable_raw iptable_security nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter
ebtables ip6table_filter ip6_tables iptable_filter ip_tables cmac bnep nct6=
775
hwmon_vid intel_rapl_msr intel_rapl_common vfat fat fuse x86_pkg_temp_therm=
al
intel_powerclamp coretemp iwlmvm kvm_intel iTCO_wdt iTCO_vendor_support
mac80211 kvm snd_hda_codec_realtek irqbypass snd_hda_codec_generic
snd_hda_codec_hdmi libarc4 ledtrig_audio crct10dif_pclmul snd_hda_intel
crc32_pclmul iwlwifi snd_hda_codec snd_hda_core btusb ghash_clmulni_intel b=
trtl
intel_cstate snd_hwdep btbcm btintel intel_uncore snd_seq snd_seq_device
intel_rapl_perf bluetooth
[ 4343.222099]  mxm_wmi cfg80211 snd_pcm joydev ecdh_generic ecc mei_me
snd_timer rfkill snd mei i2c_i801 soundcore lpc_ich binfmt_misc auth_rpcgss
sunrpc amdgpu amd_iommu_v2 gpu_sched ttm drm_kms_helper crc32c_intel uas
mpt3sas igb drm e1000e nvme usb_storage dca i2c_algo_bit raid_class nvme_co=
re
scsi_transport_sas wmi
[ 4343.222114] CPU: 0 PID: 16500 Comm: kworker/0:1 Not tainted
5.3.6-200.fc30.x86_64+debug #1
[ 4343.222115] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[ 4343.222119] Workqueue: events drm_sched_job_timedout [gpu_sched]
[ 4343.222167] RIP: 0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
[ 4343.222169] Code: 4c 24 18 44 89 fa 89 ee 48 c7 c7 f8 9d 73 c0 e8 60 46 =
b0
fa 83 7b 20 01 0f 84 02 ee fd ff 48 c7 c7 f0 9c 73 c0 e8 4a 46 b0 fa <0f> 0=
b e9
ef ed fd ff 48 c7 c7 f0 9c 73 c0 89 54 24 04 e8 33 46 b0
[ 4343.222170] RSP: 0018:ffffabda8729b690 EFLAGS: 00010246
[ 4343.222172] RAX: 0000000000000024 RBX: ffff9ceeab58f700 RCX:
0000000000000006
[ 4343.222173] RDX: 0000000000000000 RSI: ffff9ceeb50c8e50 RDI:
ffff9ceebe5d9e00
[ 4343.222174] RBP: 000000000000000a R08: 000003f33c33ca38 R09:
0000000000000000
[ 4343.222175] R10: 0000000000000000 R11: 0000000000000000 R12:
00000000000035af
[ 4343.222176] R13: 0000000000000dad R14: 0000000000000001 R15:
0000000000000dac
[ 4343.222178] FS:  0000000000000000(0000) GS:ffff9ceebe400000(0000)
knlGS:0000000000000000
[ 4343.222179] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4343.222180] CR2: 00007f1480ef70c0 CR3: 0000000703f30002 CR4:
00000000003606f0
[ 4343.222182] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 4343.222183] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[ 4343.222184] Call Trace:
[ 4343.222237]  dce_mi_free_dmif+0xef/0x150 [amdgpu]
[ 4343.222285]  dce110_reset_hw_ctx_wrap+0x15f/0x200 [amdgpu]
[ 4343.222333]  dce110_apply_ctx_to_hw+0x4b/0x530 [amdgpu]
[ 4343.222365]  ? amdgpu_pm_compute_clocks+0xc9/0x5f0 [amdgpu]
[ 4343.222414]  ? dm_pp_apply_display_requirements+0x1a8/0x1c0 [amdgpu]
[ 4343.222461]  dc_commit_state+0x26b/0x590 [amdgpu]
[ 4343.222514]  amdgpu_dm_atomic_commit_tail+0xd18/0x1cf0 [amdgpu]
[ 4343.222521]  ? __lock_acquire+0x247/0x1910
[ 4343.222525]  ? find_held_lock+0x32/0x90
[ 4343.222529]  ? find_held_lock+0x32/0x90
[ 4343.222533]  ? sched_clock+0x5/0x10
[ 4343.222536]  ? mark_held_locks+0x50/0x80
[ 4343.222540]  ? __lock_acquire+0x247/0x1910
[ 4343.222545]  ? wake_up_klogd+0x37/0x40
[ 4343.222549]  ? find_held_lock+0x32/0x90
[ 4343.222552]  ? mark_held_locks+0x50/0x80
[ 4343.222556]  ? _raw_spin_unlock_irq+0x29/0x40
[ 4343.222559]  ? lockdep_hardirqs_on+0xf0/0x180
[ 4343.222561]  ? _raw_spin_unlock_irq+0x29/0x40
[ 4343.222564]  ? wait_for_completion_timeout+0x75/0x190
[ 4343.222576]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4343.222622]  ? amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
[ 4343.222628]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4343.222634]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[ 4343.222640]  drm_atomic_helper_disable_all+0x14c/0x160 [drm_kms_helper]
[ 4343.222647]  drm_atomic_helper_suspend+0x66/0x100 [drm_kms_helper]
[ 4343.222698]  dm_suspend+0x20/0x60 [amdgpu]
[ 4343.222726]  amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
[ 4343.222755]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[ 4343.222801]  amdgpu_device_pre_asic_reset+0x191/0x1a4 [amdgpu]
[ 4343.222849]  amdgpu_device_gpu_recover+0x260/0x934 [amdgpu]
[ 4343.222893]  amdgpu_job_timedout+0x115/0x140 [amdgpu]
[ 4343.222899]  drm_sched_job_timedout+0x44/0xa0 [gpu_sched]
[ 4343.222903]  process_one_work+0x272/0x5a0
[ 4343.222908]  worker_thread+0x50/0x3b0
[ 4343.222915]  kthread+0x108/0x140
[ 4343.222916]  ? process_one_work+0x5a0/0x5a0
[ 4343.222918]  ? kthread_park+0x80/0x80
[ 4343.222921]  ret_from_fork+0x3a/0x50
[ 4343.222929] irq event stamp: 82808
[ 4343.222931] hardirqs last  enabled at (82807): [<ffffffffbb1716eb>]
console_unlock+0x46b/0x5d0
[ 4343.222935] hardirqs last disabled at (82808): [<ffffffffbb0038da>]
trace_hardirqs_off_thunk+0x1a/0x20
[ 4343.222938] softirqs last  enabled at (82794): [<ffffffffbbe0035d>]
__do_softirq+0x35d/0x45d
[ 4343.222942] softirqs last disabled at (82787): [<ffffffffbb0f2077>]
irq_exit+0xf7/0x100
[ 4343.222943] ---[ end trace 71731c9cc205c24d ]---
[ 4344.758203] amdgpu: [powerplay] No response from smu
[ 4346.363061] amdgpu: [powerplay] No response from smu
[ 4346.363065] amdgpu: [powerplay] Failed to send message: 0x26, ret value:=
 0x0
[ 4347.973948] amdgpu: [powerplay] No response from smu
[ 4349.588168] amdgpu: [powerplay] No response from smu
[ 4349.588173] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x1,
error code: 0x0
[ 4351.152764] amdgpu: [powerplay] No response from smu
[ 4352.722063] amdgpu: [powerplay] No response from smu
[ 4352.722068] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x3,
error code: 0x0
[ 4354.325541] amdgpu: [powerplay] No response from smu
[ 4355.924138] amdgpu: [powerplay] No response from smu
[ 4355.924141] amdgpu: [powerplay] Failed to send message: 0x63, ret value:=
 0x0
[ 4357.537736] amdgpu: [powerplay] No response from smu
[ 4359.154141] amdgpu: [powerplay] No response from smu
[ 4359.154146] amdgpu: [powerplay] Failed message: 0x9, input parameter: 0x=
f4,
error code: 0x0
[ 4360.760856] amdgpu: [powerplay] No response from smu
[ 4362.372410] amdgpu: [powerplay] No response from smu
[ 4362.372414] amdgpu: [powerplay] Failed message: 0xa, input parameter:
0xa0b000, error code: 0x0
[ 4363.985961] amdgpu: [powerplay] No response from smu
[ 4365.599325] amdgpu: [powerplay] No response from smu
[ 4365.599331] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[ 4367.214945] amdgpu: [powerplay] No response from smu
[ 4368.829650] amdgpu: [powerplay] No response from smu
[ 4368.829655] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[ 4370.443783] amdgpu: [powerplay] No response from smu
[ 4372.057288] amdgpu: [powerplay] No response from smu
[ 4372.057293] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[ 4372.074301] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.074308] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.074310] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.074312] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.074569] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.091832] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.091837] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.091839] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.091840] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.091889] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.109371] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.109376] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.109378] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.109380] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.126998] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.127002] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.127009] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.127021] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.127024] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.127083] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.144452] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.144457] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.144458] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.144460] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.144514] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.161992] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.161997] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.161999] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.162001] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.162086] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.179534] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.179538] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.179540] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.179542] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.179674] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.197074] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.197079] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.197081] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.197082] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.197131] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.214616] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[ 4372.267239] amdgpu: [powerplay] Failed to send message: 0x61, ret value:
0xffffffff

Relevant journalctl messages:

Oct 18 21:49:47 ezra.blanchardmorris.net kernel: perf: interrupt took too l=
ong
(2502 > 2500), lowering kernel.perf_event_max_sample_rate to 79000
Oct 18 21:50:47 ezra.blanchardmorris.net kernel:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring page1 timeout, signaled seq=3D60549844, emitted
seq=3D60549846
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process  pid 0 thread  pid 0
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER:
Uncorrected (Non-Fatal) error received: 0000:00:03.0
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER:
PCIe Bus Error: severity=3DUncorrected (Non-Fatal), type=3DTransaction Laye=
r,
(Requester ID)
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER=
:=20=20
device [8086:6f08] error status/mask=3D00004000/00000000
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER=
:=20=20=20
[14] CmpltTO                (First)
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER:
Device recovery failed
Oct 18 21:50:51 ezra.blanchardmorris.net kernel:
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
Oct 18 21:50:57 ezra.blanchardmorris.net kernel: [drm:amdgpu_dm_atomic_check
[amdgpu]] *ERROR* [CRTC:47:crtc-0] hw_done or flip_done timed out
Oct 18 21:51:07 ezra.blanchardmorris.net kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
Oct 18 21:51:18 ezra.blanchardmorris.net kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[PLANE:45:plane-5] flip_done timed out
Oct 18 21:51:19 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:19 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0xe, input parameter: 0x0, error code: 0x0
Oct 18 21:51:21 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:22 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:22 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x42, input parameter: 0x1, error code: 0x0
Oct 18 21:51:24 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x24, input parameter: 0x0, error code: 0x0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: [drm] REG_WAIT timeout 10u=
s *
3500 tries - dce_mi_free_dmif line:634
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: ------------[ cut here
]------------
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: WARNING: CPU: 0 PID: 16500=
 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:332
generic_reg_wait.cold+0x31/0x53 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Modules linked in: rfcomm
xt_CHECKSUM xt_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6
ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables cmac bnep nct6775 hwmon=
_vid
intel_rapl_msr intel_rapl_common vfat fat fuse x86_pkg_temp_thermal
intel_powerclamp coretemp iwlmvm kvm_intel iTCO_wdt iTCO_vendor_support
mac80211 kvm snd_hda_codec_realtek irqbypass snd_hda_codec_generic
snd_hda_codec_hdmi libarc4 ledtrig_audio crct10dif_pclmul snd_hda_intel
crc32_pclmul iwlwifi snd_hda_codec snd_hda_core btusb ghash_clmulni_intel b=
trtl
intel_cstate snd_hwdep btbcm btintel intel_uncore snd_seq snd_seq_device
intel_rapl_perf bluetooth
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  mxm_wmi cfg80211 snd_pcm
joydev ecdh_generic ecc mei_me snd_timer rfkill snd mei i2c_i801 soundcore
lpc_ich binfmt_misc auth_rpcgss sunrpc amdgpu amd_iommu_v2 gpu_sched ttm
drm_kms_helper crc32c_intel uas mpt3sas igb drm e1000e nvme usb_storage dca
i2c_algo_bit raid_class nvme_core scsi_transport_sas wmi
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: CPU: 0 PID: 16500 Comm:
kworker/0:1 Not tainted 5.3.6-200.fc30.x86_64+debug #1
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Hardware name: To Be Fille=
d By
O.E.M. To Be Filled By O.E.M./X99 Taichi, BIOS P1.80 04/06/2018
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Workqueue: events
drm_sched_job_timedout [gpu_sched]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RIP:
0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Code: 4c 24 18 44 89 fa 89=
 ee
48 c7 c7 f8 9d 73 c0 e8 60 46 b0 fa 83 7b 20 01 0f 84 02 ee fd ff 48 c7 c7 =
f0
9c 73 c0 e8 4a 46 b0 fa <0f> 0b e9 ef ed fd ff 48 c7 c7 f0 9c 73 c0 89 54 2=
4 04
e8 33 46 b0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RSP: 0018:ffffabda8729b690
EFLAGS: 00010246
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RAX: 0000000000000024 RBX:
ffff9ceeab58f700 RCX: 0000000000000006
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RDX: 0000000000000000 RSI:
ffff9ceeb50c8e50 RDI: ffff9ceebe5d9e00
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RBP: 000000000000000a R08:
000003f33c33ca38 R09: 0000000000000000
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: R10: 0000000000000000 R11:
0000000000000000 R12: 00000000000035af
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: R13: 0000000000000dad R14:
0000000000000001 R15: 0000000000000dac
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: FS:  0000000000000000(0000)
GS:ffff9ceebe400000(0000) knlGS:0000000000000000
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: CR2: 00007f1480ef70c0 CR3:
0000000703f30002 CR4: 00000000003606f0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Call Trace:
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  dce_mi_free_dmif+0xef/0x1=
50
[amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
dce110_reset_hw_ctx_wrap+0x15f/0x200 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
dce110_apply_ctx_to_hw+0x4b/0x530 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
amdgpu_pm_compute_clocks+0xc9/0x5f0 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
dm_pp_apply_display_requirements+0x1a8/0x1c0 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  dc_commit_state+0x26b/0x5=
90
[amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_dm_atomic_commit_tail+0xd18/0x1cf0 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? __lock_acquire+0x247/0x=
1910
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? find_held_lock+0x32/0x90
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? find_held_lock+0x32/0x90
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? sched_clock+0x5/0x10
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? mark_held_locks+0x50/0x=
80
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? __lock_acquire+0x247/0x=
1910
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? wake_up_klogd+0x37/0x40
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? find_held_lock+0x32/0x90
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? mark_held_locks+0x50/0x=
80
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
_raw_spin_unlock_irq+0x29/0x40
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
lockdep_hardirqs_on+0xf0/0x180
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
_raw_spin_unlock_irq+0x29/0x40
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
wait_for_completion_timeout+0x75/0x190
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? commit_tail+0x3c/0x70
[drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  commit_tail+0x3c/0x70
[drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
drm_atomic_helper_disable_all+0x14c/0x160 [drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
drm_atomic_helper_suspend+0x66/0x100 [drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  dm_suspend+0x20/0x60 [amd=
gpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_device_pre_asic_reset+0x191/0x1a4 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_device_gpu_recover+0x260/0x934 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_job_timedout+0x115/0x140 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
drm_sched_job_timedout+0x44/0xa0 [gpu_sched]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  process_one_work+0x272/0x=
5a0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  worker_thread+0x50/0x3b0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  kthread+0x108/0x140
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
process_one_work+0x5a0/0x5a0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? kthread_park+0x80/0x80
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ret_from_fork+0x3a/0x50
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: irq event stamp: 82808
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: hardirqs last  enabled at
(82807): [<ffffffffbb1716eb>] console_unlock+0x46b/0x5d0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: hardirqs last disabled at
(82808): [<ffffffffbb0038da>] trace_hardirqs_off_thunk+0x1a/0x20
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: softirqs last  enabled at
(82794): [<ffffffffbbe0035d>] __do_softirq+0x35d/0x45d
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: softirqs last disabled at
(82787): [<ffffffffbb0f2077>] irq_exit+0xf7/0x100
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: ---[ end trace
71731c9cc205c24d ]---
Oct 18 21:51:27 ezra.blanchardmorris.net abrt-dump-journal-oops[1493]:
abrt-dump-journal-oops: Found oopses: 1
Oct 18 21:51:27 ezra.blanchardmorris.net abrt-dump-journal-oops[1493]:
abrt-dump-journal-oops: Creating problem directories
Oct 18 21:51:27 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:28 ezra.blanchardmorris.net abrt-dump-journal-oops[1493]: Repo=
rted
1 kernel oopses to Abrt
Oct 18 21:51:29 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:29 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed=
 to
send message: 0x26, ret value: 0x0
Oct 18 21:51:30 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:32 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:32 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x4c, input parameter: 0x1, error code: 0x0
Oct 18 21:51:34 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:35 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:35 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x4c, input parameter: 0x3, error code: 0x0
Oct 18 21:51:37 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:38 ezra.blanchardmorris.net abrt-server[16691]: Can't find a
meaningful backtrace for hashing in '.'
Oct 18 21:51:38 ezra.blanchardmorris.net abrt-server[16691]: Option
'DropNotReportableOopses' is not configured
Oct 18 21:51:38 ezra.blanchardmorris.net abrt-server[16691]: Preserving oops
'.' because DropNotReportableOopses is 'no'
Oct 18 21:51:38 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:38 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed=
 to
send message: 0x63, ret value: 0x0
Oct 18 21:51:40 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:42 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:42 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x9, input parameter: 0xf4, error code: 0x0
Oct 18 21:51:42 ezra.blanchardmorris.net abrt-notification[16713]: System
encountered a non-fatal error in ??()
Oct 18 21:51:43 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:45 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15715204195.Fba0e4b.6266
Date: Sat, 19 Oct 2019 21:26:59 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c114">Comm=
ent # 114</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rodamorris&#64;gmail.com" title=3D"Rodney A Morris &lt;rodamorris&#64;gmail=
.com&gt;"> <span class=3D"fn">Rodney A Morris</span></a>
</span></b>
        <pre>To rule out possible hardware issues, I purchased another Vega=
 64 card.  This
time a factory overclocked card.  Since installing the card, I have experie=
nced
three lock ups.  Two playing Stellaris and one while playing a youtube vide=
o.=20
After playing Stellaris without issue two weeks ago, the computer locked up
twice last night.  While my previous problems seemed to be, in part, linked=
 to
a circular lock dependence, the last logs indicate something different.  I'm
seeing a lot of powerplay errors after the fence timeout.  Hope this new
information provides some insight into the problem.

         /:-------------:\          <a href=3D"mailto:rmorris&#64;ezra.blan=
chardmorris.net">rmorris&#64;ezra.blanchardmorris.net</a>=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.3.6-200.fc30.x86_64=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 16 hours, 21 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2214 (rpm), 36 (flatpak)=20
,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
:------------:MMMd-------    .---:   Resolution: 2560x1440=20
:----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
:--     .+shhhMMMmhhy++   .------/   WM: Mutter=20
:-    -------:MMMd--------------:    WM Theme: Adwaita=20
:-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=20
:-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
:-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
:---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) &#64; 4.000GH=
z=20
:------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/64=20
:---------------------://            Memory: 2814MiB / 32036MiB=20


Card:

MSI Vega 64 OC (Card works fine under windows 10)

Game being played:

Stellaris

Native Game

Description of Event:
Screen goes blank and music and sound continues to play before computer loc=
ks
up or reboots.

relevant dmesg from crash:
[ 4244.670269] perf: interrupt took too long (2502 &gt; 2500), lowering
kernel.perf_event_max_sample_rate to 79000
[ 4298.241156] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[ 4304.385587] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D60549844, emitted seq=3D60549846
[ 4304.385634] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[ 4304.385637] amdgpu 0000:06:00.0: GPU reset begin!
[ 4304.402938] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4304.402945] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4304.402947] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4304.402948] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4304.404006] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4308.481068] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 4314.625180] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-=
0]
hw_done or flip_done timed out
[ 4324.865057] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 4335.105035] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[ 4336.695112] amdgpu: [powerplay] No response from smu
[ 4336.695128] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[ 4338.307125] amdgpu: [powerplay] No response from smu
[ 4339.922039] amdgpu: [powerplay] No response from smu
[ 4339.922043] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[ 4341.541675] amdgpu: [powerplay] No response from smu
[ 4343.162102] amdgpu: [powerplay] No response from smu
[ 4343.162105] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[ 4343.221953] [drm] REG_WAIT timeout 10us * 3500 tries - dce_mi_free_dmif
line:634
[ 4343.221962] ------------[ cut here ]------------
[ 4343.222070] WARNING: CPU: 0 PID: 16500 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:332
generic_reg_wait.cold+0x31/0x53 [amdgpu]
[ 4343.222072] Modules linked in: rfcomm xt_CHECKSUM xt_MASQUERADE tun brid=
ge
stp llc nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter
ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_n=
at
ebtable_broute ip6table_nat ip6table_mangle ip6table_raw ip6table_security
iptable_nat nf_nat iptable_mangle iptable_raw iptable_security nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter
ebtables ip6table_filter ip6_tables iptable_filter ip_tables cmac bnep nct6=
775
hwmon_vid intel_rapl_msr intel_rapl_common vfat fat fuse x86_pkg_temp_therm=
al
intel_powerclamp coretemp iwlmvm kvm_intel iTCO_wdt iTCO_vendor_support
mac80211 kvm snd_hda_codec_realtek irqbypass snd_hda_codec_generic
snd_hda_codec_hdmi libarc4 ledtrig_audio crct10dif_pclmul snd_hda_intel
crc32_pclmul iwlwifi snd_hda_codec snd_hda_core btusb ghash_clmulni_intel b=
trtl
intel_cstate snd_hwdep btbcm btintel intel_uncore snd_seq snd_seq_device
intel_rapl_perf bluetooth
[ 4343.222099]  mxm_wmi cfg80211 snd_pcm joydev ecdh_generic ecc mei_me
snd_timer rfkill snd mei i2c_i801 soundcore lpc_ich binfmt_misc auth_rpcgss
sunrpc amdgpu amd_iommu_v2 gpu_sched ttm drm_kms_helper crc32c_intel uas
mpt3sas igb drm e1000e nvme usb_storage dca i2c_algo_bit raid_class nvme_co=
re
scsi_transport_sas wmi
[ 4343.222114] CPU: 0 PID: 16500 Comm: kworker/0:1 Not tainted
5.3.6-200.fc30.x86_64+debug #1
[ 4343.222115] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[ 4343.222119] Workqueue: events drm_sched_job_timedout [gpu_sched]
[ 4343.222167] RIP: 0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
[ 4343.222169] Code: 4c 24 18 44 89 fa 89 ee 48 c7 c7 f8 9d 73 c0 e8 60 46 =
b0
fa 83 7b 20 01 0f 84 02 ee fd ff 48 c7 c7 f0 9c 73 c0 e8 4a 46 b0 fa &lt;0f=
&gt; 0b e9
ef ed fd ff 48 c7 c7 f0 9c 73 c0 89 54 24 04 e8 33 46 b0
[ 4343.222170] RSP: 0018:ffffabda8729b690 EFLAGS: 00010246
[ 4343.222172] RAX: 0000000000000024 RBX: ffff9ceeab58f700 RCX:
0000000000000006
[ 4343.222173] RDX: 0000000000000000 RSI: ffff9ceeb50c8e50 RDI:
ffff9ceebe5d9e00
[ 4343.222174] RBP: 000000000000000a R08: 000003f33c33ca38 R09:
0000000000000000
[ 4343.222175] R10: 0000000000000000 R11: 0000000000000000 R12:
00000000000035af
[ 4343.222176] R13: 0000000000000dad R14: 0000000000000001 R15:
0000000000000dac
[ 4343.222178] FS:  0000000000000000(0000) GS:ffff9ceebe400000(0000)
knlGS:0000000000000000
[ 4343.222179] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4343.222180] CR2: 00007f1480ef70c0 CR3: 0000000703f30002 CR4:
00000000003606f0
[ 4343.222182] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 4343.222183] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[ 4343.222184] Call Trace:
[ 4343.222237]  dce_mi_free_dmif+0xef/0x150 [amdgpu]
[ 4343.222285]  dce110_reset_hw_ctx_wrap+0x15f/0x200 [amdgpu]
[ 4343.222333]  dce110_apply_ctx_to_hw+0x4b/0x530 [amdgpu]
[ 4343.222365]  ? amdgpu_pm_compute_clocks+0xc9/0x5f0 [amdgpu]
[ 4343.222414]  ? dm_pp_apply_display_requirements+0x1a8/0x1c0 [amdgpu]
[ 4343.222461]  dc_commit_state+0x26b/0x590 [amdgpu]
[ 4343.222514]  amdgpu_dm_atomic_commit_tail+0xd18/0x1cf0 [amdgpu]
[ 4343.222521]  ? __lock_acquire+0x247/0x1910
[ 4343.222525]  ? find_held_lock+0x32/0x90
[ 4343.222529]  ? find_held_lock+0x32/0x90
[ 4343.222533]  ? sched_clock+0x5/0x10
[ 4343.222536]  ? mark_held_locks+0x50/0x80
[ 4343.222540]  ? __lock_acquire+0x247/0x1910
[ 4343.222545]  ? wake_up_klogd+0x37/0x40
[ 4343.222549]  ? find_held_lock+0x32/0x90
[ 4343.222552]  ? mark_held_locks+0x50/0x80
[ 4343.222556]  ? _raw_spin_unlock_irq+0x29/0x40
[ 4343.222559]  ? lockdep_hardirqs_on+0xf0/0x180
[ 4343.222561]  ? _raw_spin_unlock_irq+0x29/0x40
[ 4343.222564]  ? wait_for_completion_timeout+0x75/0x190
[ 4343.222576]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4343.222622]  ? amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
[ 4343.222628]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 4343.222634]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[ 4343.222640]  drm_atomic_helper_disable_all+0x14c/0x160 [drm_kms_helper]
[ 4343.222647]  drm_atomic_helper_suspend+0x66/0x100 [drm_kms_helper]
[ 4343.222698]  dm_suspend+0x20/0x60 [amdgpu]
[ 4343.222726]  amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
[ 4343.222755]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[ 4343.222801]  amdgpu_device_pre_asic_reset+0x191/0x1a4 [amdgpu]
[ 4343.222849]  amdgpu_device_gpu_recover+0x260/0x934 [amdgpu]
[ 4343.222893]  amdgpu_job_timedout+0x115/0x140 [amdgpu]
[ 4343.222899]  drm_sched_job_timedout+0x44/0xa0 [gpu_sched]
[ 4343.222903]  process_one_work+0x272/0x5a0
[ 4343.222908]  worker_thread+0x50/0x3b0
[ 4343.222915]  kthread+0x108/0x140
[ 4343.222916]  ? process_one_work+0x5a0/0x5a0
[ 4343.222918]  ? kthread_park+0x80/0x80
[ 4343.222921]  ret_from_fork+0x3a/0x50
[ 4343.222929] irq event stamp: 82808
[ 4343.222931] hardirqs last  enabled at (82807): [&lt;ffffffffbb1716eb&gt;]
console_unlock+0x46b/0x5d0
[ 4343.222935] hardirqs last disabled at (82808): [&lt;ffffffffbb0038da&gt;]
trace_hardirqs_off_thunk+0x1a/0x20
[ 4343.222938] softirqs last  enabled at (82794): [&lt;ffffffffbbe0035d&gt;]
__do_softirq+0x35d/0x45d
[ 4343.222942] softirqs last disabled at (82787): [&lt;ffffffffbb0f2077&gt;]
irq_exit+0xf7/0x100
[ 4343.222943] ---[ end trace 71731c9cc205c24d ]---
[ 4344.758203] amdgpu: [powerplay] No response from smu
[ 4346.363061] amdgpu: [powerplay] No response from smu
[ 4346.363065] amdgpu: [powerplay] Failed to send message: 0x26, ret value:=
 0x0
[ 4347.973948] amdgpu: [powerplay] No response from smu
[ 4349.588168] amdgpu: [powerplay] No response from smu
[ 4349.588173] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x1,
error code: 0x0
[ 4351.152764] amdgpu: [powerplay] No response from smu
[ 4352.722063] amdgpu: [powerplay] No response from smu
[ 4352.722068] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x3,
error code: 0x0
[ 4354.325541] amdgpu: [powerplay] No response from smu
[ 4355.924138] amdgpu: [powerplay] No response from smu
[ 4355.924141] amdgpu: [powerplay] Failed to send message: 0x63, ret value:=
 0x0
[ 4357.537736] amdgpu: [powerplay] No response from smu
[ 4359.154141] amdgpu: [powerplay] No response from smu
[ 4359.154146] amdgpu: [powerplay] Failed message: 0x9, input parameter: 0x=
f4,
error code: 0x0
[ 4360.760856] amdgpu: [powerplay] No response from smu
[ 4362.372410] amdgpu: [powerplay] No response from smu
[ 4362.372414] amdgpu: [powerplay] Failed message: 0xa, input parameter:
0xa0b000, error code: 0x0
[ 4363.985961] amdgpu: [powerplay] No response from smu
[ 4365.599325] amdgpu: [powerplay] No response from smu
[ 4365.599331] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[ 4367.214945] amdgpu: [powerplay] No response from smu
[ 4368.829650] amdgpu: [powerplay] No response from smu
[ 4368.829655] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[ 4370.443783] amdgpu: [powerplay] No response from smu
[ 4372.057288] amdgpu: [powerplay] No response from smu
[ 4372.057293] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[ 4372.074301] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.074308] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.074310] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.074312] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.074569] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.091832] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.091837] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.091839] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.091840] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.091889] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.109371] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.109376] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.109378] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.109380] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.126998] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.127002] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.127009] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.127021] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.127024] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.127083] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.144452] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.144457] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.144458] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.144460] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.144514] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.161992] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.161997] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.161999] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.162001] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.162086] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.179534] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.179538] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.179540] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.179542] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.179674] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.197074] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 4372.197079] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 4372.197081] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 4372.197082] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 4372.197131] pcieport 0000:00:03.0: AER: Device recovery failed
[ 4372.214616] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[ 4372.267239] amdgpu: [powerplay] Failed to send message: 0x61, ret value:
0xffffffff

Relevant journalctl messages:

Oct 18 21:49:47 ezra.blanchardmorris.net kernel: perf: interrupt took too l=
ong
(2502 &gt; 2500), lowering kernel.perf_event_max_sample_rate to 79000
Oct 18 21:50:47 ezra.blanchardmorris.net kernel:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring page1 timeout, signaled seq=3D60549844, emitted
seq=3D60549846
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process  pid 0 thread  pid 0
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER:
Uncorrected (Non-Fatal) error received: 0000:00:03.0
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER:
PCIe Bus Error: severity=3DUncorrected (Non-Fatal), type=3DTransaction Laye=
r,
(Requester ID)
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER=
:=20=20
device [8086:6f08] error status/mask=3D00004000/00000000
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER=
:=20=20=20
[14] CmpltTO                (First)
Oct 18 21:50:47 ezra.blanchardmorris.net kernel: pcieport 0000:00:03.0: AER:
Device recovery failed
Oct 18 21:50:51 ezra.blanchardmorris.net kernel:
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
Oct 18 21:50:57 ezra.blanchardmorris.net kernel: [drm:amdgpu_dm_atomic_check
[amdgpu]] *ERROR* [CRTC:47:crtc-0] hw_done or flip_done timed out
Oct 18 21:51:07 ezra.blanchardmorris.net kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
Oct 18 21:51:18 ezra.blanchardmorris.net kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[PLANE:45:plane-5] flip_done timed out
Oct 18 21:51:19 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:19 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0xe, input parameter: 0x0, error code: 0x0
Oct 18 21:51:21 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:22 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:22 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x42, input parameter: 0x1, error code: 0x0
Oct 18 21:51:24 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x24, input parameter: 0x0, error code: 0x0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: [drm] REG_WAIT timeout 10u=
s *
3500 tries - dce_mi_free_dmif line:634
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: ------------[ cut here
]------------
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: WARNING: CPU: 0 PID: 16500=
 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:332
generic_reg_wait.cold+0x31/0x53 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Modules linked in: rfcomm
xt_CHECKSUM xt_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6
ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ebtable_broute ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables cmac bnep nct6775 hwmon=
_vid
intel_rapl_msr intel_rapl_common vfat fat fuse x86_pkg_temp_thermal
intel_powerclamp coretemp iwlmvm kvm_intel iTCO_wdt iTCO_vendor_support
mac80211 kvm snd_hda_codec_realtek irqbypass snd_hda_codec_generic
snd_hda_codec_hdmi libarc4 ledtrig_audio crct10dif_pclmul snd_hda_intel
crc32_pclmul iwlwifi snd_hda_codec snd_hda_core btusb ghash_clmulni_intel b=
trtl
intel_cstate snd_hwdep btbcm btintel intel_uncore snd_seq snd_seq_device
intel_rapl_perf bluetooth
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  mxm_wmi cfg80211 snd_pcm
joydev ecdh_generic ecc mei_me snd_timer rfkill snd mei i2c_i801 soundcore
lpc_ich binfmt_misc auth_rpcgss sunrpc amdgpu amd_iommu_v2 gpu_sched ttm
drm_kms_helper crc32c_intel uas mpt3sas igb drm e1000e nvme usb_storage dca
i2c_algo_bit raid_class nvme_core scsi_transport_sas wmi
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: CPU: 0 PID: 16500 Comm:
kworker/0:1 Not tainted 5.3.6-200.fc30.x86_64+debug #1
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Hardware name: To Be Fille=
d By
O.E.M. To Be Filled By O.E.M./X99 Taichi, BIOS P1.80 04/06/2018
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Workqueue: events
drm_sched_job_timedout [gpu_sched]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RIP:
0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Code: 4c 24 18 44 89 fa 89=
 ee
48 c7 c7 f8 9d 73 c0 e8 60 46 b0 fa 83 7b 20 01 0f 84 02 ee fd ff 48 c7 c7 =
f0
9c 73 c0 e8 4a 46 b0 fa &lt;0f&gt; 0b e9 ef ed fd ff 48 c7 c7 f0 9c 73 c0 8=
9 54 24 04
e8 33 46 b0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RSP: 0018:ffffabda8729b690
EFLAGS: 00010246
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RAX: 0000000000000024 RBX:
ffff9ceeab58f700 RCX: 0000000000000006
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RDX: 0000000000000000 RSI:
ffff9ceeb50c8e50 RDI: ffff9ceebe5d9e00
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: RBP: 000000000000000a R08:
000003f33c33ca38 R09: 0000000000000000
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: R10: 0000000000000000 R11:
0000000000000000 R12: 00000000000035af
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: R13: 0000000000000dad R14:
0000000000000001 R15: 0000000000000dac
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: FS:  0000000000000000(0000)
GS:ffff9ceebe400000(0000) knlGS:0000000000000000
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: CR2: 00007f1480ef70c0 CR3:
0000000703f30002 CR4: 00000000003606f0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: Call Trace:
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  dce_mi_free_dmif+0xef/0x1=
50
[amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
dce110_reset_hw_ctx_wrap+0x15f/0x200 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
dce110_apply_ctx_to_hw+0x4b/0x530 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
amdgpu_pm_compute_clocks+0xc9/0x5f0 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
dm_pp_apply_display_requirements+0x1a8/0x1c0 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  dc_commit_state+0x26b/0x5=
90
[amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_dm_atomic_commit_tail+0xd18/0x1cf0 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? __lock_acquire+0x247/0x=
1910
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? find_held_lock+0x32/0x90
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? find_held_lock+0x32/0x90
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? sched_clock+0x5/0x10
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? mark_held_locks+0x50/0x=
80
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? __lock_acquire+0x247/0x=
1910
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? wake_up_klogd+0x37/0x40
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? find_held_lock+0x32/0x90
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? mark_held_locks+0x50/0x=
80
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
_raw_spin_unlock_irq+0x29/0x40
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
lockdep_hardirqs_on+0xf0/0x180
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
_raw_spin_unlock_irq+0x29/0x40
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
wait_for_completion_timeout+0x75/0x190
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? commit_tail+0x3c/0x70
[drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
amdgpu_dm_audio_eld_notify+0x60/0x60 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  commit_tail+0x3c/0x70
[drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
drm_atomic_helper_disable_all+0x14c/0x160 [drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
drm_atomic_helper_suspend+0x66/0x100 [drm_kms_helper]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  dm_suspend+0x20/0x60 [amd=
gpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_device_pre_asic_reset+0x191/0x1a4 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_device_gpu_recover+0x260/0x934 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
amdgpu_job_timedout+0x115/0x140 [amdgpu]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:=20
drm_sched_job_timedout+0x44/0xa0 [gpu_sched]
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  process_one_work+0x272/0x=
5a0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  worker_thread+0x50/0x3b0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  kthread+0x108/0x140
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ?
process_one_work+0x5a0/0x5a0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ? kthread_park+0x80/0x80
Oct 18 21:51:26 ezra.blanchardmorris.net kernel:  ret_from_fork+0x3a/0x50
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: irq event stamp: 82808
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: hardirqs last  enabled at
(82807): [&lt;ffffffffbb1716eb&gt;] console_unlock+0x46b/0x5d0
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: hardirqs last disabled at
(82808): [&lt;ffffffffbb0038da&gt;] trace_hardirqs_off_thunk+0x1a/0x20
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: softirqs last  enabled at
(82794): [&lt;ffffffffbbe0035d&gt;] __do_softirq+0x35d/0x45d
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: softirqs last disabled at
(82787): [&lt;ffffffffbb0f2077&gt;] irq_exit+0xf7/0x100
Oct 18 21:51:26 ezra.blanchardmorris.net kernel: ---[ end trace
71731c9cc205c24d ]---
Oct 18 21:51:27 ezra.blanchardmorris.net abrt-dump-journal-oops[1493]:
abrt-dump-journal-oops: Found oopses: 1
Oct 18 21:51:27 ezra.blanchardmorris.net abrt-dump-journal-oops[1493]:
abrt-dump-journal-oops: Creating problem directories
Oct 18 21:51:27 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:28 ezra.blanchardmorris.net abrt-dump-journal-oops[1493]: Repo=
rted
1 kernel oopses to Abrt
Oct 18 21:51:29 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:29 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed=
 to
send message: 0x26, ret value: 0x0
Oct 18 21:51:30 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:32 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:32 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x4c, input parameter: 0x1, error code: 0x0
Oct 18 21:51:34 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:35 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:35 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x4c, input parameter: 0x3, error code: 0x0
Oct 18 21:51:37 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:38 ezra.blanchardmorris.net abrt-server[16691]: Can't find a
meaningful backtrace for hashing in '.'
Oct 18 21:51:38 ezra.blanchardmorris.net abrt-server[16691]: Option
'DropNotReportableOopses' is not configured
Oct 18 21:51:38 ezra.blanchardmorris.net abrt-server[16691]: Preserving oops
'.' because DropNotReportableOopses is 'no'
Oct 18 21:51:38 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:38 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed=
 to
send message: 0x63, ret value: 0x0
Oct 18 21:51:40 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:42 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:42 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x9, input parameter: 0xf4, error code: 0x0
Oct 18 21:51:42 ezra.blanchardmorris.net abrt-notification[16713]: System
encountered a non-fatal error in ??()
Oct 18 21:51:43 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Oct 18 21:51:45 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15715204195.Fba0e4b.6266--

--===============0045920798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0045920798==--
