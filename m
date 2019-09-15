Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30156B2E2A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 06:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4CE6F590;
	Sun, 15 Sep 2019 04:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB3736F586
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 04:35:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E6F4172167; Sun, 15 Sep 2019 04:35:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 15 Sep 2019 04:35:43 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-109955-502-fZYEgsoJVk@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0927999402=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0927999402==
Content-Type: multipart/alternative; boundary="15685221431.26bed45A.8675"
Content-Transfer-Encoding: 7bit


--15685221431.26bed45A.8675
Date: Sun, 15 Sep 2019 04:35:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #102 from Rodney A Morris <rodamorris@gmail.com> ---
Created attachment 145367
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145367&action=3Dedit
Full dmesg from Stellaris crash

I had another crash and soft lockup tonight playing Stellaris through Steam=
.=20
Unfortunately, while I had the mesa debuginfo packages installed, I did not
have the debug kernel installed.

          /:-------------:\=20=20=20=20=20=20=20=20=20=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30.x86_64=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 27 (flatpak)=20
,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
:------------:MMMd-------    .---:   Resolution: 2560x1440=20
:----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
:--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
:-    -------:MMMd--------------:    WM Theme: Adwaita=20
:-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=20
:-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
:-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
:---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) @ 4.000GHz=20
:------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/64=20
:---------------------://            Memory: 2478MiB / 32084MiB=20

OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6

> Game being played:=20


Stellaris through Steam for Linux.  Like other times Discord is running.

> Native or Wine or Wine+DXVK:


Native

>=20
> Crash type: Game crash? Full System freeze? System freeze but still can d=
rop
> to tty?


Screen goes black suddenly while music continues plays for less than a minu=
te;
music begins to loop; and computer reboots.

>=20
> DMESG output after the crash:
Below is the pertinent dmesg messages.  Full file attached.

[ 5292.563342] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[ 5297.683350] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D97861046, emitted seq=3D97861048
[ 5297.683465] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[ 5297.683470] amdgpu 0000:06:00.0: GPU reset begin!
[ 5297.693302] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D1321512, emitted seq=3D1321513
[ 5297.693406] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process stellaris pid 5624 thread stellaris:cs0 pid 5625
[ 5297.693409] amdgpu 0000:06:00.0: GPU reset begin!
[ 5297.709624] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5297.709631] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5297.709634] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5297.709637] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5297.709706] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5302.803236] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 5307.923355] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-=
0]
hw_done or flip_done timed out
[ 5318.163235] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 5328.403235] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[ 5328.717149] amdgpu: [powerplay] No response from smu
[ 5328.717151] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[ 5329.031482] amdgpu: [powerplay] No response from smu
[ 5329.345845] amdgpu: [powerplay] No response from smu
[ 5329.345847] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[ 5329.659470] amdgpu: [powerplay] No response from smu
[ 5329.973320] amdgpu: [powerplay] No response from smu
[ 5329.973322] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[ 5330.044255] [drm] REG_WAIT timeout 10us * 3500 tries - dce_mi_free_dmif
line:634
[ 5330.044255] ------------[ cut here ]------------
[ 5330.044355] WARNING: CPU: 9 PID: 7317 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:329
generic_reg_wait.cold+0x31/0x53 [amdgpu]
[ 5330.044356] Modules linked in: rfcomm xt_CHECKSUM xt_MASQUERADE tun brid=
ge
stp llc nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter
ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_n=
at
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_=
nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables bnep nct6775 hwmon_vid
intel_rapl arc4 x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel vf=
at
fat kvm fuse irqbypass iwlmvm iTCO_wdt iTCO_vendor_support mac80211
crct10dif_pclmul crc32_pclmul snd_hda_codec_realtek ghash_clmulni_intel
intel_cstate btusb iwlwifi snd_hda_codec_generic btrtl btbcm btintel
ledtrig_audio snd_hda_codec_hdmi intel_uncore bluetooth snd_hda_intel
intel_rapl_perf snd_hda_codec cfg80211 snd_hda_core snd_hwdep mxm_wmi i2c_i=
801
joydev snd_seq snd_seq_device xpad ecdh_generic
[ 5330.044372]  ff_memless snd_pcm rfkill ecc snd_timer mei_me snd mei
soundcore lpc_ich pcc_cpufreq auth_rpcgss binfmt_misc sunrpc amdgpu
amd_iommu_v2 gpu_sched ttm drm_kms_helper drm mpt3sas igb crc32c_intel e100=
0e
nvme raid_class nvme_core dca i2c_algo_bit scsi_transport_sas wmi uas
usb_storage
[ 5330.044380] CPU: 9 PID: 7317 Comm: kworker/9:0 Not tainted
5.2.13-200.fc30.x86_64 #1
[ 5330.044381] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[ 5330.044384] Workqueue: events drm_sched_job_timedout [gpu_sched]
[ 5330.044424] RIP: 0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
[ 5330.044425] Code: 4c 24 18 44 89 fa 89 ee 48 c7 c7 b8 e2 7b c0 e8 fb d4 =
a2
fc 83 7b 20 01 0f 84 8d 14 fe ff 48 c7 c7 28 e2 7b c0 e8 e5 d4 a2 fc <0f> 0=
b e9
7a 14 fe ff 48 c7 c7 28 e2 7b c0 89 54 24 04 e8 ce d4 a2
[ 5330.044426] RSP: 0000:ffffb980493f37b8 EFLAGS: 00010246
[ 5330.044426] RAX: 0000000000000024 RBX: ffff911f70720780 RCX:
0000000000000006
[ 5330.044427] RDX: 0000000000000000 RSI: 0000000000000086 RDI:
ffff911f7fa57900
[ 5330.044427] RBP: 000000000000000a R08: 0000000000000001 R09:
0000000000000737
[ 5330.044428] R10: 0000000000026ddc R11: 0000000000000003 R12:
00000000000035af
[ 5330.044428] R13: 0000000000000dad R14: 0000000000000001 R15:
0000000000000dac
[ 5330.044429] FS:  0000000000000000(0000) GS:ffff911f7fa40000(0000)
knlGS:0000000000000000
[ 5330.044429] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 5330.044430] CR2: 000006af3a9fb000 CR3: 00000007ab40a003 CR4:
00000000003606e0
[ 5330.044430] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 5330.044431] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[ 5330.044431] Call Trace:
[ 5330.044487]  dce_mi_free_dmif+0xef/0x150 [amdgpu]
[ 5330.044524]  dce110_reset_hw_ctx_wrap+0x14a/0x1e0 [amdgpu]
[ 5330.044562]  dce110_apply_ctx_to_hw+0x4a/0x490 [amdgpu]
[ 5330.044588]  ? amdgpu_pm_compute_clocks.part.0+0xcb/0x610 [amdgpu]
[ 5330.044590]  ? _cond_resched+0x15/0x30
[ 5330.044629]  ? dm_pp_apply_display_requirements+0x1a8/0x1c0 [amdgpu]
[ 5330.044666]  dc_commit_state+0x27b/0x5c0 [amdgpu]
[ 5330.044669]  ? number+0x31c/0x360
[ 5330.044707]  amdgpu_dm_atomic_commit_tail+0xc15/0x1930 [amdgpu]
[ 5330.044710]  ? va_format.isra.0+0x6e/0xa0
[ 5330.044713]  ? sched_clock+0x5/0x10
[ 5330.044716]  ? sched_clock_cpu+0xc/0xa0
[ 5330.044719]  ? up+0x12/0x60
[ 5330.044721]  ? __irq_work_queue_local+0x50/0x60
[ 5330.044722]  ? irq_work_queue+0x46/0x50
[ 5330.044725]  ? wake_up_klogd+0x30/0x40
[ 5330.044726]  ? vprintk_emit+0x17c/0x260
[ 5330.044727]  ? printk+0x58/0x6f
[ 5330.044728]  ? __next_timer_interrupt+0xd0/0xd0
[ 5330.044736]  ? drm_atomic_helper_wait_for_dependencies+0x1e4/0x1f0
[drm_kms_helper]
[ 5330.044748]  ? drm_err+0x72/0x90 [drm]
[ 5330.044749]  ? _cond_resched+0x15/0x30
[ 5330.044750]  ? wait_for_completion_timeout+0x38/0x170
[ 5330.044754]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 5330.044791]  ? amdgpu_dm_atomic_check+0x6d0/0x6d0 [amdgpu]
[ 5330.044795]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 5330.044799]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[ 5330.044803]  drm_atomic_helper_disable_all+0x144/0x160 [drm_kms_helper]
[ 5330.044807]  drm_atomic_helper_suspend+0x60/0xf0 [drm_kms_helper]
[ 5330.044844]  dm_suspend+0x20/0x60 [amdgpu]
[ 5330.044867]  amdgpu_device_ip_suspend_phase1+0x8b/0xc0 [amdgpu]
[ 5330.044890]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[ 5330.044927]  amdgpu_device_pre_asic_reset+0x1f4/0x209 [amdgpu]
[ 5330.044965]  amdgpu_device_gpu_recover+0x77/0x785 [amdgpu]
[ 5330.044998]  amdgpu_job_timedout+0xf7/0x120 [amdgpu]
[ 5330.045000]  drm_sched_job_timedout+0x3a/0x70 [gpu_sched]
[ 5330.045003]  process_one_work+0x19d/0x380
[ 5330.045005]  worker_thread+0x50/0x3b0
[ 5330.045007]  kthread+0xfb/0x130
[ 5330.045008]  ? process_one_work+0x380/0x380
[ 5330.045009]  ? kthread_park+0x80/0x80
[ 5330.045010]  ret_from_fork+0x35/0x40
[ 5330.045012] ---[ end trace 7beee32e6101e37d ]---
[ 5330.358847] amdgpu: [powerplay] No response from smu
[ 5330.673262] amdgpu: [powerplay] No response from smu
[ 5330.673263] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x1,
error code: 0x0
[ 5330.987579] amdgpu: [powerplay] No response from smu
[ 5331.302073] amdgpu: [powerplay] No response from smu
[ 5331.302074] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x3,
error code: 0x0
[ 5331.616202] amdgpu: [powerplay] No response from smu
[ 5331.929678] amdgpu: [powerplay] No response from smu
[ 5331.929681] amdgpu: [powerplay] Failed message: 0x9, input parameter: 0x=
f4,
error code: 0x0
[ 5332.243534] amdgpu: [powerplay] No response from smu
[ 5332.557383] amdgpu: [powerplay] No response from smu
[ 5332.557384] amdgpu: [powerplay] Failed message: 0xa, input parameter:
0xa0b000, error code: 0x0
[ 5332.871126] amdgpu: [powerplay] No response from smu
[ 5333.185009] amdgpu: [powerplay] No response from smu
[ 5333.185011] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[ 5333.498596] amdgpu: [powerplay] No response from smu
[ 5333.812147] amdgpu: [powerplay] No response from smu
[ 5333.812155] amdgpu: [powerplay] Failed message: 0x4, input parameter: 0x=
400,
error code: 0x0
[ 5334.126013] amdgpu: [powerplay] No response from smu
[ 5334.440194] amdgpu: [powerplay] No response from smu
[ 5334.440197] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[ 5334.753930] amdgpu: [powerplay] No response from smu
[ 5335.067603] amdgpu: [powerplay] No response from smu
[ 5335.067605] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[ 5335.083579] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.083589] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.083599] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.083603] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.083694] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.101028] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.101034] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.101036] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.101039] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.101085] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.118568] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.118573] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.118575] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.118577] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.118621] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.136108] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.136113] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.136116] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.136118] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.136189] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.153649] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.153654] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.153656] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.153658] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.153702] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.171189] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.171194] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.171196] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.171199] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.171242] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.188769] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.188774] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.188776] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.188778] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.188819] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.206263] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.206266] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.206267] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.206268] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.206286] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.223806] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.223809] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.223811] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.223812] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.223837] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.241348] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[ 5335.469372] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.469374] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.469375] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.469405] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.469406] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0

> systemd logs output after the crash (If your system froze and you get logs
> after reboot):

Sep 14 20:52:48 ezra.blanchardmorris.net kernel: Command line:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.13-200.fc30.x86_64
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 14 20:52:48 ezra.blanchardmorris.net kernel: Kernel command line:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.13-200.fc30.x86_64
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 14 20:52:49 ezra.blanchardmorris.net dracut-cmdline[363]: Using kernel
command line parameters: BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.13-200.fc30.x8=
6_64
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: [drm] amdgpu kernel
modesetting enabled.
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 0: 0xe0000000 -> 0xefffffff
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 2: 0xf0000000 -> 0xf01fffff
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 5: 0xfb600000 -> 0xfb67ffff
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: fb0: switching to amdgpudr=
mfb
from EFI VGA
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: vgaar=
b:
deactivate vga console
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: No mo=
re
image in the PCI ROM
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: VRAM:
8176M 0x000000F400000000 - 0x000000F5FEFFFFFF (8176M used)
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GART:
512M 0x0000000000000000 - 0x000000001FFFFFFF
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: AGP:
267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: [drm] amdgpu: 8176M of VRAM
memory ready
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: [drm] amdgpu: 8176M of GTT
memory ready.
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: fbcon: amdgpudrmfb (fb0) is
primary device
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: fb0:
amdgpudrmfb frame buffer device
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
gfx
uses VM inv eng 0 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.0.0 uses VM inv eng 1 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.1.0 uses VM inv eng 4 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.2.0 uses VM inv eng 5 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.3.0 uses VM inv eng 6 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.0.1 uses VM inv eng 7 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.1.1 uses VM inv eng 8 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.2.1 uses VM inv eng 9 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.3.1 uses VM inv eng 10 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
kiq_2.1.0 uses VM inv eng 11 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
sdma0 uses VM inv eng 0 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
page0 uses VM inv eng 1 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
sdma1 uses VM inv eng 4 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
page1 uses VM inv eng 5 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_0 uses VM inv eng 6 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_enc_0.0 uses VM inv eng 7 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_enc_0.1 uses VM inv eng 8 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce0
uses VM inv eng 9 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce1
uses VM inv eng 10 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce2
uses VM inv eng 11 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: [drm] Initialized amdgpu
3.32.0 20150101 for 0000:06:00.0 on minor 0
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]:
Kernel command line: BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.13-200.fc30.x86_64
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]:=
=20=20=20=20=20
   loading driver: amdgpu
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]: =
(=3D=3D)
Matched amdgpu as autoconfigured driver 0
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]: =
(II)
LoadModule: "amdgpu"
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]: =
(II)
Loading /usr/lib64/xorg/modules/drivers/amdgpu_drv.so
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]: =
(II)
Module amdgpu: vendor=3D"X.Org Foundation"
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]:=
=20=20=20=20=20
   All GPUs supported by the amdgpu kernel driver
Sep 14 22:21:05 ezra.blanchardmorris.net kernel:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring page1 timeout, signaled seq=3D97861046, emitted
seq=3D97861048
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process  pid 0 thread  pid 0
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D1321512, emitted seq=3D1=
321513
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process stellaris pid 5624 thread
stellaris:cs0 pid 5625
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Sep 14 22:21:15 ezra.blanchardmorris.net kernel: [drm:amdgpu_dm_atomic_check
[amdgpu]] *ERROR* [CRTC:47:crtc-0] hw_done or flip_done timed out
Sep 14 22:21:36 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 14 22:21:36 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0xe, input parameter: 0x0, error code: 0x0
Sep 14 22:21:36 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 14 22:21:37 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15685221431.26bed45A.8675
Date: Sun, 15 Sep 2019 04:35:43 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c102">Comm=
ent # 102</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rodamorris&#64;gmail.com" title=3D"Rodney A Morris &lt;rodamorris&#64;gmail=
.com&gt;"> <span class=3D"fn">Rodney A Morris</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145367=
" name=3D"attach_145367" title=3D"Full dmesg from Stellaris crash">attachme=
nt 145367</a> <a href=3D"attachment.cgi?id=3D145367&amp;action=3Dedit" titl=
e=3D"Full dmesg from Stellaris crash">[details]</a></span>
Full dmesg from Stellaris crash

I had another crash and soft lockup tonight playing Stellaris through Steam=
.=20
Unfortunately, while I had the mesa debuginfo packages installed, I did not
have the debug kernel installed.

          /:-------------:\=20=20=20=20=20=20=20=20=20=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30.x86_64=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 27 (flatpak)=20
,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
:------------:MMMd-------    .---:   Resolution: 2560x1440=20
:----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
:--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
:-    -------:MMMd--------------:    WM Theme: Adwaita=20
:-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=20
:-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
:-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
:---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) &#64; 4.000GH=
z=20
:------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/64=20
:---------------------://            Memory: 2478MiB / 32084MiB=20

OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6

<span class=3D"quote">&gt; Game being played: </span >


Stellaris through Steam for Linux.  Like other times Discord is running.

<span class=3D"quote">&gt; Native or Wine or Wine+DXVK:</span >


Native

<span class=3D"quote">&gt;=20
&gt; Crash type: Game crash? Full System freeze? System freeze but still ca=
n drop
&gt; to tty?</span >


Screen goes black suddenly while music continues plays for less than a minu=
te;
music begins to loop; and computer reboots.

<span class=3D"quote">&gt;=20
&gt; DMESG output after the crash:</span >
Below is the pertinent dmesg messages.  Full file attached.

[ 5292.563342] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[ 5297.683350] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D97861046, emitted seq=3D97861048
[ 5297.683465] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[ 5297.683470] amdgpu 0000:06:00.0: GPU reset begin!
[ 5297.693302] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D1321512, emitted seq=3D1321513
[ 5297.693406] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process stellaris pid 5624 thread stellaris:cs0 pid 5625
[ 5297.693409] amdgpu 0000:06:00.0: GPU reset begin!
[ 5297.709624] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5297.709631] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5297.709634] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5297.709637] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5297.709706] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5302.803236] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 5307.923355] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-=
0]
hw_done or flip_done timed out
[ 5318.163235] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 5328.403235] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[ 5328.717149] amdgpu: [powerplay] No response from smu
[ 5328.717151] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[ 5329.031482] amdgpu: [powerplay] No response from smu
[ 5329.345845] amdgpu: [powerplay] No response from smu
[ 5329.345847] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[ 5329.659470] amdgpu: [powerplay] No response from smu
[ 5329.973320] amdgpu: [powerplay] No response from smu
[ 5329.973322] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[ 5330.044255] [drm] REG_WAIT timeout 10us * 3500 tries - dce_mi_free_dmif
line:634
[ 5330.044255] ------------[ cut here ]------------
[ 5330.044355] WARNING: CPU: 9 PID: 7317 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:329
generic_reg_wait.cold+0x31/0x53 [amdgpu]
[ 5330.044356] Modules linked in: rfcomm xt_CHECKSUM xt_MASQUERADE tun brid=
ge
stp llc nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter
ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_n=
at
ip6table_nat ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_=
nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables iptable_filter ip_tables bnep nct6775 hwmon_vid
intel_rapl arc4 x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel vf=
at
fat kvm fuse irqbypass iwlmvm iTCO_wdt iTCO_vendor_support mac80211
crct10dif_pclmul crc32_pclmul snd_hda_codec_realtek ghash_clmulni_intel
intel_cstate btusb iwlwifi snd_hda_codec_generic btrtl btbcm btintel
ledtrig_audio snd_hda_codec_hdmi intel_uncore bluetooth snd_hda_intel
intel_rapl_perf snd_hda_codec cfg80211 snd_hda_core snd_hwdep mxm_wmi i2c_i=
801
joydev snd_seq snd_seq_device xpad ecdh_generic
[ 5330.044372]  ff_memless snd_pcm rfkill ecc snd_timer mei_me snd mei
soundcore lpc_ich pcc_cpufreq auth_rpcgss binfmt_misc sunrpc amdgpu
amd_iommu_v2 gpu_sched ttm drm_kms_helper drm mpt3sas igb crc32c_intel e100=
0e
nvme raid_class nvme_core dca i2c_algo_bit scsi_transport_sas wmi uas
usb_storage
[ 5330.044380] CPU: 9 PID: 7317 Comm: kworker/9:0 Not tainted
5.2.13-200.fc30.x86_64 #1
[ 5330.044381] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[ 5330.044384] Workqueue: events drm_sched_job_timedout [gpu_sched]
[ 5330.044424] RIP: 0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
[ 5330.044425] Code: 4c 24 18 44 89 fa 89 ee 48 c7 c7 b8 e2 7b c0 e8 fb d4 =
a2
fc 83 7b 20 01 0f 84 8d 14 fe ff 48 c7 c7 28 e2 7b c0 e8 e5 d4 a2 fc &lt;0f=
&gt; 0b e9
7a 14 fe ff 48 c7 c7 28 e2 7b c0 89 54 24 04 e8 ce d4 a2
[ 5330.044426] RSP: 0000:ffffb980493f37b8 EFLAGS: 00010246
[ 5330.044426] RAX: 0000000000000024 RBX: ffff911f70720780 RCX:
0000000000000006
[ 5330.044427] RDX: 0000000000000000 RSI: 0000000000000086 RDI:
ffff911f7fa57900
[ 5330.044427] RBP: 000000000000000a R08: 0000000000000001 R09:
0000000000000737
[ 5330.044428] R10: 0000000000026ddc R11: 0000000000000003 R12:
00000000000035af
[ 5330.044428] R13: 0000000000000dad R14: 0000000000000001 R15:
0000000000000dac
[ 5330.044429] FS:  0000000000000000(0000) GS:ffff911f7fa40000(0000)
knlGS:0000000000000000
[ 5330.044429] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 5330.044430] CR2: 000006af3a9fb000 CR3: 00000007ab40a003 CR4:
00000000003606e0
[ 5330.044430] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[ 5330.044431] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[ 5330.044431] Call Trace:
[ 5330.044487]  dce_mi_free_dmif+0xef/0x150 [amdgpu]
[ 5330.044524]  dce110_reset_hw_ctx_wrap+0x14a/0x1e0 [amdgpu]
[ 5330.044562]  dce110_apply_ctx_to_hw+0x4a/0x490 [amdgpu]
[ 5330.044588]  ? amdgpu_pm_compute_clocks.part.0+0xcb/0x610 [amdgpu]
[ 5330.044590]  ? _cond_resched+0x15/0x30
[ 5330.044629]  ? dm_pp_apply_display_requirements+0x1a8/0x1c0 [amdgpu]
[ 5330.044666]  dc_commit_state+0x27b/0x5c0 [amdgpu]
[ 5330.044669]  ? number+0x31c/0x360
[ 5330.044707]  amdgpu_dm_atomic_commit_tail+0xc15/0x1930 [amdgpu]
[ 5330.044710]  ? va_format.isra.0+0x6e/0xa0
[ 5330.044713]  ? sched_clock+0x5/0x10
[ 5330.044716]  ? sched_clock_cpu+0xc/0xa0
[ 5330.044719]  ? up+0x12/0x60
[ 5330.044721]  ? __irq_work_queue_local+0x50/0x60
[ 5330.044722]  ? irq_work_queue+0x46/0x50
[ 5330.044725]  ? wake_up_klogd+0x30/0x40
[ 5330.044726]  ? vprintk_emit+0x17c/0x260
[ 5330.044727]  ? printk+0x58/0x6f
[ 5330.044728]  ? __next_timer_interrupt+0xd0/0xd0
[ 5330.044736]  ? drm_atomic_helper_wait_for_dependencies+0x1e4/0x1f0
[drm_kms_helper]
[ 5330.044748]  ? drm_err+0x72/0x90 [drm]
[ 5330.044749]  ? _cond_resched+0x15/0x30
[ 5330.044750]  ? wait_for_completion_timeout+0x38/0x170
[ 5330.044754]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 5330.044791]  ? amdgpu_dm_atomic_check+0x6d0/0x6d0 [amdgpu]
[ 5330.044795]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 5330.044799]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[ 5330.044803]  drm_atomic_helper_disable_all+0x144/0x160 [drm_kms_helper]
[ 5330.044807]  drm_atomic_helper_suspend+0x60/0xf0 [drm_kms_helper]
[ 5330.044844]  dm_suspend+0x20/0x60 [amdgpu]
[ 5330.044867]  amdgpu_device_ip_suspend_phase1+0x8b/0xc0 [amdgpu]
[ 5330.044890]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[ 5330.044927]  amdgpu_device_pre_asic_reset+0x1f4/0x209 [amdgpu]
[ 5330.044965]  amdgpu_device_gpu_recover+0x77/0x785 [amdgpu]
[ 5330.044998]  amdgpu_job_timedout+0xf7/0x120 [amdgpu]
[ 5330.045000]  drm_sched_job_timedout+0x3a/0x70 [gpu_sched]
[ 5330.045003]  process_one_work+0x19d/0x380
[ 5330.045005]  worker_thread+0x50/0x3b0
[ 5330.045007]  kthread+0xfb/0x130
[ 5330.045008]  ? process_one_work+0x380/0x380
[ 5330.045009]  ? kthread_park+0x80/0x80
[ 5330.045010]  ret_from_fork+0x35/0x40
[ 5330.045012] ---[ end trace 7beee32e6101e37d ]---
[ 5330.358847] amdgpu: [powerplay] No response from smu
[ 5330.673262] amdgpu: [powerplay] No response from smu
[ 5330.673263] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x1,
error code: 0x0
[ 5330.987579] amdgpu: [powerplay] No response from smu
[ 5331.302073] amdgpu: [powerplay] No response from smu
[ 5331.302074] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x3,
error code: 0x0
[ 5331.616202] amdgpu: [powerplay] No response from smu
[ 5331.929678] amdgpu: [powerplay] No response from smu
[ 5331.929681] amdgpu: [powerplay] Failed message: 0x9, input parameter: 0x=
f4,
error code: 0x0
[ 5332.243534] amdgpu: [powerplay] No response from smu
[ 5332.557383] amdgpu: [powerplay] No response from smu
[ 5332.557384] amdgpu: [powerplay] Failed message: 0xa, input parameter:
0xa0b000, error code: 0x0
[ 5332.871126] amdgpu: [powerplay] No response from smu
[ 5333.185009] amdgpu: [powerplay] No response from smu
[ 5333.185011] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[ 5333.498596] amdgpu: [powerplay] No response from smu
[ 5333.812147] amdgpu: [powerplay] No response from smu
[ 5333.812155] amdgpu: [powerplay] Failed message: 0x4, input parameter: 0x=
400,
error code: 0x0
[ 5334.126013] amdgpu: [powerplay] No response from smu
[ 5334.440194] amdgpu: [powerplay] No response from smu
[ 5334.440197] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[ 5334.753930] amdgpu: [powerplay] No response from smu
[ 5335.067603] amdgpu: [powerplay] No response from smu
[ 5335.067605] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[ 5335.083579] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.083589] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.083599] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.083603] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.083694] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.101028] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.101034] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.101036] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.101039] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.101085] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.118568] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.118573] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.118575] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.118577] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.118621] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.136108] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.136113] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.136116] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.136118] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.136189] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.153649] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.153654] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.153656] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.153658] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.153702] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.171189] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.171194] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.171196] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.171199] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.171242] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.188769] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.188774] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.188776] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.188778] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.188819] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.206263] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.206266] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.206267] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.206268] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.206286] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.223806] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 5335.223809] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.223811] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.223812] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.223837] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.241348] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[ 5335.469372] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 5335.469374] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 5335.469375] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 5335.469405] pcieport 0000:00:03.0: AER: Device recovery failed
[ 5335.469406] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0

<span class=3D"quote">&gt; systemd logs output after the crash (If your sys=
tem froze and you get logs
&gt; after reboot):</span >

Sep 14 20:52:48 ezra.blanchardmorris.net kernel: Command line:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.13-200.fc30.x86_64
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 14 20:52:48 ezra.blanchardmorris.net kernel: Kernel command line:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.13-200.fc30.x86_64
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 14 20:52:49 ezra.blanchardmorris.net dracut-cmdline[363]: Using kernel
command line parameters: BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.13-200.fc30.x8=
6_64
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: [drm] amdgpu kernel
modesetting enabled.
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 0: 0xe0000000 -&gt; 0xefffffff
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 2: 0xf0000000 -&gt; 0xf01fffff
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 5: 0xfb600000 -&gt; 0xfb67ffff
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: fb0: switching to amdgpudr=
mfb
from EFI VGA
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: vgaar=
b:
deactivate vga console
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: No mo=
re
image in the PCI ROM
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: VRAM:
8176M 0x000000F400000000 - 0x000000F5FEFFFFFF (8176M used)
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GART:
512M 0x0000000000000000 - 0x000000001FFFFFFF
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: AGP:
267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: [drm] amdgpu: 8176M of VRAM
memory ready
Sep 14 20:52:49 ezra.blanchardmorris.net kernel: [drm] amdgpu: 8176M of GTT
memory ready.
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: fbcon: amdgpudrmfb (fb0) is
primary device
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: fb0:
amdgpudrmfb frame buffer device
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
gfx
uses VM inv eng 0 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.0.0 uses VM inv eng 1 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.1.0 uses VM inv eng 4 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.2.0 uses VM inv eng 5 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.3.0 uses VM inv eng 6 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.0.1 uses VM inv eng 7 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.1.1 uses VM inv eng 8 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.2.1 uses VM inv eng 9 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.3.1 uses VM inv eng 10 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
kiq_2.1.0 uses VM inv eng 11 on hub 0
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
sdma0 uses VM inv eng 0 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
page0 uses VM inv eng 1 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
sdma1 uses VM inv eng 4 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
page1 uses VM inv eng 5 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_0 uses VM inv eng 6 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_enc_0.0 uses VM inv eng 7 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_enc_0.1 uses VM inv eng 8 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce0
uses VM inv eng 9 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce1
uses VM inv eng 10 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce2
uses VM inv eng 11 on hub 1
Sep 14 20:52:50 ezra.blanchardmorris.net kernel: [drm] Initialized amdgpu
3.32.0 20150101 for 0000:06:00.0 on minor 0
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]:
Kernel command line: BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.13-200.fc30.x86_64
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]:=
=20=20=20=20=20
   loading driver: amdgpu
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]: =
(=3D=3D)
Matched amdgpu as autoconfigured driver 0
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]: =
(II)
LoadModule: &quot;amdgpu&quot;
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]: =
(II)
Loading /usr/lib64/xorg/modules/drivers/amdgpu_drv.so
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]: =
(II)
Module amdgpu: vendor=3D&quot;X.Org Foundation&quot;
Sep 14 20:53:20 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1928]:=
=20=20=20=20=20
   All GPUs supported by the amdgpu kernel driver
Sep 14 22:21:05 ezra.blanchardmorris.net kernel:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring page1 timeout, signaled seq=3D97861046, emitted
seq=3D97861048
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process  pid 0 thread  pid 0
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D1321512, emitted seq=3D1=
321513
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process stellaris pid 5624 thread
stellaris:cs0 pid 5625
Sep 14 22:21:05 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Sep 14 22:21:15 ezra.blanchardmorris.net kernel: [drm:amdgpu_dm_atomic_check
[amdgpu]] *ERROR* [CRTC:47:crtc-0] hw_done or flip_done timed out
Sep 14 22:21:36 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 14 22:21:36 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0xe, input parameter: 0x0, error code: 0x0
Sep 14 22:21:36 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 14 22:21:37 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
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

--15685221431.26bed45A.8675--

--===============0927999402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0927999402==--
