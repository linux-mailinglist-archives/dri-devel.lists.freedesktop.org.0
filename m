Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEADAC43F
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 05:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5F389F75;
	Sat,  7 Sep 2019 03:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB95589F8B
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2019 03:48:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C83E272161; Sat,  7 Sep 2019 03:48:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 07 Sep 2019 03:48:56 +0000
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
Message-ID: <bug-109955-502-JQBJtZ6GWy@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0010374679=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0010374679==
Content-Type: multipart/alternative; boundary="15678281375.C952C.25929"
Content-Transfer-Encoding: 7bit


--15678281375.C952C.25929
Date: Sat, 7 Sep 2019 03:48:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #96 from Rodney A Morris <rodamorris@gmail.com> ---
(In reply to Mauro Gaspari from comment #90)

I am experiencing periodic lockups with various games, including Hearts of =
Iron
IV, BATTLETECH, and Stellaris all being played through Steam.  Below is the
most recent crash from playing less than 5 minutes of Hearts of Iron IV.



>=20
> OS Info can be taken from neofetch:
> System info:

           /:-------------:\=20=20=20=20=20=20=20=20=20=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.2.11-200.fc30.x86_64+debug=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 11 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2198 (rpm), 27 (flatpak)=20
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
:---------------------://            Memory: 1666MiB / 32045MiB=20

>=20
> Mesa info can be taken from this command:
> glxinfo | grep "OpenGL version"=20

OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.5

>=20
> Game being played:=20

Hearts of Iron IV through Steam for Linux

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
> sudo dmesg | grep amdgpu

Here is the pertinent part dmesg with kernel debugging turned on.  Some of =
the
information the crash would not be captured by grepping amdgpu.  Entire dme=
sg
provided as an attachment.

[46957.810300] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[46962.941366] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D2446766, emitted seq=3D2446767
[46962.941453] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process hoi4 pid 24014 thread hoi4:cs0 pid 24015
[46962.941459] amdgpu 0000:06:00.0: GPU reset begin!

[46962.942698] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[46962.942700] WARNING: possible circular locking dependency detected
[46962.942702] 5.2.11-200.fc30.x86_64+debug #1 Not tainted
[46962.942704] ------------------------------------------------------
[46962.942705] kworker/3:0/20416 is trying to acquire lock:
[46962.942708] 00000000a4a3593f (&(&ring->fence_drv.lock)->rlock){-.-.}, at:
dma_fence_remove_callback+0x1a/0x60
[46962.942717]=20
               but task is already holding lock:
[46962.942718] 00000000d45cbf2b (&(&sched->job_list_lock)->rlock){-.-.}, at:
drm_sched_stop+0x34/0x130 [gpu_sched]
[46962.942724]=20
               which lock already depends on the new lock.

[46962.942725]=20
               the existing dependency chain (in reverse order) is:
[46962.942727]=20
               -> #1 (&(&sched->job_list_lock)->rlock){-.-.}:
[46962.942735]        _raw_spin_lock_irqsave+0x49/0x83
[46962.942738]        drm_sched_process_job+0x4d/0x180 [gpu_sched]
[46962.942741]        dma_fence_signal+0x111/0x1a0
[46962.942794]        amdgpu_fence_process+0xa3/0x100 [amdgpu]
[46962.942858]        sdma_v4_0_process_trap_irq+0x8d/0xa0 [amdgpu]
[46962.942918]        amdgpu_irq_dispatch+0xc0/0x250 [amdgpu]
[46962.942978]        amdgpu_ih_process+0x8d/0x110 [amdgpu]
[46962.943038]        amdgpu_irq_handler+0x1b/0x50 [amdgpu]
[46962.943043]        __handle_irq_event_percpu+0x3f/0x290
[46962.943046]        handle_irq_event_percpu+0x31/0x80
[46962.943048]        handle_irq_event+0x34/0x51
[46962.943053]        handle_edge_irq+0x83/0x1a0
[46962.943057]        handle_irq+0x1c/0x30
[46962.943059]        do_IRQ+0x61/0x120
[46962.943063]        ret_from_intr+0x0/0x22
[46962.943067]        cpuidle_enter_state+0xc9/0x450
[46962.943069]        cpuidle_enter+0x29/0x40
[46962.943074]        do_idle+0x1ec/0x280
[46962.943076]        cpu_startup_entry+0x19/0x20
[46962.943079]        start_secondary+0x189/0x1e0
[46962.943083]        secondary_startup_64+0xa4/0xb0
[46962.943087]=20
               -> #0 (&(&ring->fence_drv.lock)->rlock){-.-.}:
[46962.943095]        lock_acquire+0xa2/0x1b0
[46962.943105]        _raw_spin_lock_irqsave+0x49/0x83
[46962.943109]        dma_fence_remove_callback+0x1a/0x60
[46962.943114]        drm_sched_stop+0x59/0x130 [gpu_sched]
[46962.943225]        amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
[46962.943338]        amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[46962.943413]        amdgpu_job_timedout+0x109/0x130 [amdgpu]
[46962.943418]        drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[46962.943421]        process_one_work+0x272/0x5e0
[46962.943423]        worker_thread+0x50/0x3b0
[46962.943427]        kthread+0x108/0x140
[46962.943431]        ret_from_fork+0x3a/0x50
[46962.943432]=20
               other info that might help us debug this:

[46962.943435]  Possible unsafe locking scenario:

[46962.943437]        CPU0                    CPU1
[46962.943438]        ----                    ----
[46962.943439]   lock(&(&sched->job_list_lock)->rlock);
[46962.943441]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
lock(&(&ring->fence_drv.lock)->rlock);
[46962.943443]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
lock(&(&sched->job_list_lock)->rlock);
[46962.943445]   lock(&(&ring->fence_drv.lock)->rlock);
[46962.943447]=20
                *** DEADLOCK ***

[46962.943449] 5 locks held by kworker/3:0/20416:
[46962.943450]  #0: 0000000043c92b99 ((wq_completion)events){+.+.}, at:
process_one_work+0x1e9/0x5e0
[46962.943456]  #1: 000000000c360f0c
((work_completion)(&(&sched->work_tdr)->work)){+.+.}, at:
process_one_work+0x1e9/0x5e0
[46962.943459]  #2: 000000007a135814 (&adev->lock_reset){+.+.}, at:
amdgpu_device_lock_adev+0x17/0x39 [amdgpu]
[46962.943543]  #3: 00000000e83f7d6b (&dqm->lock_hidden){+.+.}, at:
kgd2kfd_pre_reset+0x30/0x60 [amdgpu]
[46962.943614]  #4: 00000000d45cbf2b (&(&sched->job_list_lock)->rlock){-.-.=
},
at: drm_sched_stop+0x34/0x130 [gpu_sched]
[46962.943620]=20
               stack backtrace:
[46962.943629] CPU: 3 PID: 20416 Comm: kworker/3:0 Not tainted
5.2.11-200.fc30.x86_64+debug #1
[46962.943631] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[46962.943636] Workqueue: events drm_sched_job_timedout [gpu_sched]
[46962.943638] Call Trace:
[46962.943648]  dump_stack+0x85/0xc0
[46962.943654]  print_circular_bug.cold+0x15c/0x195
[46962.943658]  __lock_acquire+0x167c/0x1c90
[46962.943664]  lock_acquire+0xa2/0x1b0
[46962.943668]  ? dma_fence_remove_callback+0x1a/0x60
[46962.943674]  _raw_spin_lock_irqsave+0x49/0x83
[46962.943677]  ? dma_fence_remove_callback+0x1a/0x60
[46962.943680]  dma_fence_remove_callback+0x1a/0x60
[46962.943684]  drm_sched_stop+0x59/0x130 [gpu_sched]
[46962.943764]  amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
[46962.943847]  amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[46962.943923]  amdgpu_job_timedout+0x109/0x130 [amdgpu]
[46962.943930]  drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[46962.943934]  process_one_work+0x272/0x5e0
[46962.943938]  worker_thread+0x50/0x3b0
[46962.943942]  kthread+0x108/0x140
[46962.943945]  ? process_one_work+0x5e0/0x5e0
[46962.943948]  ? kthread_park+0x80/0x80
[46962.943952]  ret_from_fork+0x3a/0x50
[46962.961034] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[46962.961044] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[46962.961048] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[46962.961051] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[46962.961149] pcieport 0000:00:03.0: AER: Device recovery failed
[46963.955209] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D95391072, emitted seq=3D95391072
[46963.955328] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[46963.955336] amdgpu 0000:06:00.0: GPU reset begin!
[46968.050083] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[46973.170223] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-=
0]
hw_done or flip_done timed out
[46983.410080] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[46993.650098] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[46993.962192] amdgpu: [powerplay] No response from smu
[46993.962195] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[46994.277773] amdgpu: [powerplay] No response from smu
[46994.593416] amdgpu: [powerplay] No response from smu
[46994.593420] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[46994.908354] amdgpu: [powerplay] No response from smu
[46995.223718] amdgpu: [powerplay] No response from smu
[46995.223722] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[46995.286504] [drm] REG_WAIT timeout 10us * 3500 tries - dce_mi_free_dmif
line:634
[46995.286506] ------------[ cut here ]------------
[46995.286605] WARNING: CPU: 3 PID: 20416 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:329
generic_reg_wait.cold+0x31/0x53 [amdgpu]
[46995.286606] Modules linked in: vhost_net vhost tap rfcomm xt_CHECKSUM
xt_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns nf_conntrack_broad=
cast
xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4
xt_conntrack ebtable_nat ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat iptable_mangle iptable_raw
iptable_security nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c ip_set
nfnetlink ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter
ip_tables bnep nct6775 hwmon_vid intel_rapl vfat fat arc4 x86_pkg_temp_ther=
mal
intel_powerclamp coretemp fuse kvm_intel kvm iwlmvm irqbypass iTCO_wdt
iTCO_vendor_support mac80211 crct10dif_pclmul crc32_pclmul
snd_hda_codec_realtek ghash_clmulni_intel intel_cstate snd_hda_codec_generic
iwlwifi snd_hda_codec_hdmi ledtrig_audio intel_uncore snd_hda_intel
intel_rapl_perf cfg80211 snd_hda_codec btusb mxm_wmi snd_hda_core btrtl btb=
cm
snd_hwdep btintel snd_seq i2c_i801 lpc_ich bluetooth
[46995.286626]  snd_seq_device joydev snd_pcm ecdh_generic snd_timer rfkill=
 ecc
mei_me snd mei soundcore pcc_cpufreq binfmt_misc auth_rpcgss sunrpc amdgpu
amd_iommu_v2 gpu_sched ttm drm_kms_helper crc32c_intel igb uas drm usb_stor=
age
dca mpt3sas i2c_algo_bit e1000e nvme raid_class nvme_core scsi_transport_sas
wmi
[46995.286638] CPU: 3 PID: 20416 Comm: kworker/3:0 Not tainted
5.2.11-200.fc30.x86_64+debug #1
[46995.286639] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[46995.286643] Workqueue: events drm_sched_job_timedout [gpu_sched]
[46995.286682] RIP: 0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
[46995.286684] Code: 4c 24 18 44 89 fa 89 ee 48 c7 c7 78 93 80 c0 e8 45 fd =
a0
ca 83 7b 20 01 0f 84 27 11 fe ff 48 c7 c7 70 92 80 c0 e8 2f fd a0 ca <0f> 0=
b e9
14 11 fe ff 48 c7 c7 70 92 80 c0 89 54 24 04 e8 18 fd a0
[46995.286685] RSP: 0018:ffff9cd009b3f728 EFLAGS: 00010246
[46995.286687] RAX: 0000000000000024 RBX: ffff8ada6be8a780 RCX:
0000000000000006
[46995.286688] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff8ada7ebd9c80
[46995.286689] RBP: 000000000000000a R08: 0000000000000001 R09:
0000000000000000
[46995.286690] R10: 0000000000000000 R11: 0000000000000000 R12:
00000000000035af
[46995.286691] R13: 0000000000000dad R14: 0000000000000001 R15:
0000000000000dac
[46995.286692] FS:  0000000000000000(0000) GS:ffff8ada7ea00000(0000)
knlGS:0000000000000000
[46995.286694] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[46995.286695] CR2: 0000085777c78000 CR3: 00000003cb612005 CR4:
00000000003606e0
[46995.286696] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[46995.286697] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[46995.286698] Call Trace:
[46995.286741]  dce_mi_free_dmif+0xef/0x150 [amdgpu]
[46995.286780]  dce110_reset_hw_ctx_wrap+0x14a/0x1e0 [amdgpu]
[46995.286819]  dce110_apply_ctx_to_hw+0x4a/0x490 [amdgpu]
[46995.286843]  ? amdgpu_pm_compute_clocks.part.0+0xcb/0x610 [amdgpu]
[46995.286882]  ? dm_pp_apply_display_requirements+0x19e/0x1c0 [amdgpu]
[46995.286920]  dc_commit_state+0x262/0x580 [amdgpu]
[46995.286925]  ? vsnprintf+0x3aa/0x4f0
[46995.286965]  amdgpu_dm_atomic_commit_tail+0xc34/0x1970 [amdgpu]
[46995.286971]  ? console_unlock+0x363/0x5d0
[46995.286976]  ? __irq_work_queue_local+0x50/0x60
[46995.286977]  ? irq_work_queue+0x4d/0x60
[46995.286979]  ? wake_up_klogd+0x37/0x40
[46995.286984]  ? wait_for_completion_timeout+0x4c/0x190
[46995.286987]  ? _raw_spin_unlock_irq+0x29/0x40
[46995.286989]  ? wait_for_completion_timeout+0x75/0x190
[46995.287016]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[46995.287021]  commit_tail+0x3c/0x70 [drm_kms_helper]
[46995.287026]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[46995.287031]  drm_atomic_helper_disable_all+0x14c/0x160 [drm_kms_helper]
[46995.287035]  drm_atomic_helper_suspend+0x66/0x100 [drm_kms_helper]
[46995.287076]  dm_suspend+0x20/0x60 [amdgpu]
[46995.287098]  amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
[46995.287123]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[46995.287164]  amdgpu_device_pre_asic_reset+0x1f7/0x20c [amdgpu]
[46995.287204]  amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[46995.287242]  amdgpu_job_timedout+0x109/0x130 [amdgpu]
[46995.287246]  drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[46995.287249]  process_one_work+0x272/0x5e0
[46995.287252]  worker_thread+0x50/0x3b0
[46995.287256]  kthread+0x108/0x140
[46995.287258]  ? process_one_work+0x5e0/0x5e0
[46995.287260]  ? kthread_park+0x80/0x80
[46995.287263]  ret_from_fork+0x3a/0x50
[46995.287267] irq event stamp: 6288284
[46995.287269] hardirqs last  enabled at (6288283): [<ffffffff8bb04d8b>]
_raw_spin_unlock_irqrestore+0x4b/0x60
[46995.287271] hardirqs last disabled at (6288284): [<ffffffff8bb05533>]
_raw_spin_lock_irqsave+0x23/0x83
[46995.287273] softirqs last  enabled at (6288276): [<ffffffff8be0035d>]
__do_softirq+0x35d/0x468
[46995.287276] softirqs last disabled at (6288269): [<ffffffff8b0f07a2>]
irq_exit+0x102/0x110
[46995.287277] ---[ end trace 6a2158c4cfef5172 ]---
[46995.603082] amdgpu: [powerplay] No response from smu
[46995.918767] amdgpu: [powerplay] No response from smu
[46995.918770] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x1,
error code: 0x0
[46996.233769] amdgpu: [powerplay] No response from smu
[46996.549255] amdgpu: [powerplay] No response from smu
[46996.549258] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x3,
error code: 0x0
[46996.865320] amdgpu: [powerplay] No response from smu
[46997.181203] amdgpu: [powerplay] No response from smu
[46997.181206] amdgpu: [powerplay] Failed message: 0x9, input parameter: 0x=
f4,
error code: 0x0
[46997.495804] amdgpu: [powerplay] No response from smu
[46997.811227] amdgpu: [powerplay] No response from smu
[46997.811231] amdgpu: [powerplay] Failed message: 0xa, input parameter:
0xa0b000, error code: 0x0
[46998.126794] amdgpu: [powerplay] No response from smu
[46998.442559] amdgpu: [powerplay] No response from smu
[46998.442561] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[46998.756884] amdgpu: [powerplay] No response from smu
[46999.072680] amdgpu: [powerplay] No response from smu
[46999.072684] amdgpu: [powerplay] Failed message: 0x4, input parameter: 0x=
400,
error code: 0x0
[46999.388310] amdgpu: [powerplay] No response from smu
[46999.704067] amdgpu: [powerplay] No response from smu
[46999.704069] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[47000.019626] amdgpu: [powerplay] No response from smu
[47000.334247] amdgpu: [powerplay] No response from smu
[47000.334251] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[47000.350026] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.350043] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.350052] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.350061] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.350202] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.367437] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.367443] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.367444] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.367446] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.367486] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.384977] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.384982] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.384983] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.384985] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.385055] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.402521] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.402530] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.402532] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.402535] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.402578] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.420068] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.420079] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.420085] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.420090] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.420186] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.437608] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.437617] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.437621] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.437625] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.437726] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.455143] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.455151] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.455154] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.455157] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.455209] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.472688] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.472698] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.472703] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.472708] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.472826] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.490225] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.490232] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.490236] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.490239] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.490289] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.507760] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[47000.735787] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.735791] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.735793] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.735824] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.735826] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0


> systemd logs output after the crash (If your system froze and you get logs
> after reboot):

Sep 06 08:36:58 ezra.blanchardmorris.net kernel: Command line:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.11-200.fc30.x86_64+debug
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 06 08:36:58 ezra.blanchardmorris.net kernel: Kernel command line:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.11-200.fc30.x86_64+debug
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 06 08:36:59 ezra.blanchardmorris.net dracut-cmdline[361]: Using kernel
command line parameters:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.11-200.fc30.x86_64+debug
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: [drm] amdgpu kernel
modesetting enabled.
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 0: 0xe0000000 -> 0xefffffff
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 2: 0xf0000000 -> 0xf01fffff
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 5: 0xfb600000 -> 0xfb67ffff
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: fb0: switching to amdgpudr=
mfb
from EFI VGA
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: vgaar=
b:
deactivate vga console
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: No mo=
re
image in the PCI ROM
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: VRAM:
8176M 0x000000F400000000 - 0x000000F5FEFFFFFF (8176M used)
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GART:
512M 0x0000000000000000 - 0x000000001FFFFFFF
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: AGP:
267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: [drm] amdgpu: 8176M of VRAM
memory ready
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: [drm] amdgpu: 8176M of GTT
memory ready.
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: fbcon: amdgpudrmfb (fb0) is
primary device
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: fb0:
amdgpudrmfb frame buffer device
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
gfx
uses VM inv eng 0 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.0.0 uses VM inv eng 1 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.1.0 uses VM inv eng 4 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.2.0 uses VM inv eng 5 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.3.0 uses VM inv eng 6 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.0.1 uses VM inv eng 7 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.1.1 uses VM inv eng 8 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.2.1 uses VM inv eng 9 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.3.1 uses VM inv eng 10 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
kiq_2.1.0 uses VM inv eng 11 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
sdma0 uses VM inv eng 0 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
page0 uses VM inv eng 1 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
sdma1 uses VM inv eng 4 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
page1 uses VM inv eng 5 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_0 uses VM inv eng 6 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_enc_0.0 uses VM inv eng 7 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_enc_0.1 uses VM inv eng 8 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce0
uses VM inv eng 9 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce1
uses VM inv eng 10 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce2
uses VM inv eng 11 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: [drm] Initialized amdgpu
3.32.0 20150101 for 0000:06:00.0 on minor 0
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]:
Kernel command line: BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.11-200.fc30.x86_64=
+debug
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]:=
=20=20=20=20=20
   loading driver: amdgpu
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]: =
(=3D=3D)
Matched amdgpu as autoconfigured driver 0
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]: =
(II)
LoadModule: "amdgpu"
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]: =
(II)
Loading /usr/lib64/xorg/modules/drivers/amdgpu_drv.so
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]: =
(II)
Module amdgpu: vendor=3D"X.Org Foundation"
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]:=
=20=20=20=20=20
   All GPUs supported by the amdgpu kernel driver
Sep 06 16:13:18 ezra.blanchardmorris.net net.lutris.Lutris.desktop[2234]:
2019-09-06 16:13:18,530: GPU: 1002:687F 1002:0B36 using amdgpu drivers
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
Sep 06 21:39:39 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D2446766, emitted seq=3D2=
446767
Sep 06 21:39:39 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process hoi4 pid 24014 thread hoi4:c=
s0
pid 24015
Sep 06 21:39:39 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_fence_process+0xa3/0x100 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
sdma_v4_0_process_trap_irq+0x8d/0xa0 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_irq_dispatch+0xc0/0x250 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_ih_process+0x8d/0x110 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_irq_handler+0x1b/0x50 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_job_timedout+0x109/0x130 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:  #2: 000000007a135814
(&adev->lock_reset){+.+.}, at: amdgpu_device_lock_adev+0x17/0x39 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:  #3: 00000000e83f7d6b
(&dqm->lock_hidden){+.+.}, at: kgd2kfd_pre_reset+0x30/0x60 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20
amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20
amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20
amdgpu_job_timedout+0x109/0x130 [amdgpu]
Sep 06 21:39:40 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring page1 timeout, signaled seq=3D95391072, emitted
seq=3D95391072
Sep 06 21:39:40 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process  pid 0 thread  pid 0
Sep 06 21:39:40 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Sep 06 21:39:49 ezra.blanchardmorris.net kernel: [drm:amdgpu_dm_atomic_check
[amdgpu]] *ERROR* [CRTC:47:crtc-0] hw_done or flip_done timed out
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0xe, input parameter: 0x0, error code: 0x0
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x42, input parameter: 0x1, error code: 0x0
Sep 06 21:40:11 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu

I will try to run apitrace on Hearts of Iron IV to try to capture more
information.  Please let me know if I can be of further assistance in squas=
hing
this annoying bug, like providing crash information with the mesa debug
packages installed.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15678281375.C952C.25929
Date: Sat, 7 Sep 2019 03:48:57 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c96">Comme=
nt # 96</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rodamorris&#64;gmail.com" title=3D"Rodney A Morris &lt;rodamorris&#64;gmail=
.com&gt;"> <span class=3D"fn">Rodney A Morris</span></a>
</span></b>
        <pre>(In reply to Mauro Gaspari from <a href=3D"show_bug.cgi?id=3D1=
09955#c90">comment #90</a>)

I am experiencing periodic lockups with various games, including Hearts of =
Iron
IV, BATTLETECH, and Stellaris all being played through Steam.  Below is the
most recent crash from playing less than 5 minutes of Hearts of Iron IV.



<span class=3D"quote">&gt;=20
&gt; OS Info can be taken from neofetch:
&gt; System info:</span >

           /:-------------:\=20=20=20=20=20=20=20=20=20=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.2.11-200.fc30.x86_64+debug=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 11 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2198 (rpm), 27 (flatpak)=20
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
:---------------------://            Memory: 1666MiB / 32045MiB=20

<span class=3D"quote">&gt;=20
&gt; Mesa info can be taken from this command:
&gt; glxinfo | grep &quot;OpenGL version&quot; </span >

OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.5

<span class=3D"quote">&gt;=20
&gt; Game being played: </span >

Hearts of Iron IV through Steam for Linux

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
&gt; DMESG output after the crash:
&gt; sudo dmesg | grep amdgpu</span >

Here is the pertinent part dmesg with kernel debugging turned on.  Some of =
the
information the crash would not be captured by grepping amdgpu.  Entire dme=
sg
provided as an attachment.

[46957.810300] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[46962.941366] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D2446766, emitted seq=3D2446767
[46962.941453] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process hoi4 pid 24014 thread hoi4:cs0 pid 24015
[46962.941459] amdgpu 0000:06:00.0: GPU reset begin!

[46962.942698] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[46962.942700] WARNING: possible circular locking dependency detected
[46962.942702] 5.2.11-200.fc30.x86_64+debug #1 Not tainted
[46962.942704] ------------------------------------------------------
[46962.942705] kworker/3:0/20416 is trying to acquire lock:
[46962.942708] 00000000a4a3593f (&amp;(&amp;ring-&gt;fence_drv.lock)-&gt;rl=
ock){-.-.}, at:
dma_fence_remove_callback+0x1a/0x60
[46962.942717]=20
               but task is already holding lock:
[46962.942718] 00000000d45cbf2b (&amp;(&amp;sched-&gt;job_list_lock)-&gt;rl=
ock){-.-.}, at:
drm_sched_stop+0x34/0x130 [gpu_sched]
[46962.942724]=20
               which lock already depends on the new lock.

[46962.942725]=20
               the existing dependency chain (in reverse order) is:
[46962.942727]=20
               -&gt; #1 (&amp;(&amp;sched-&gt;job_list_lock)-&gt;rlock){-.-=
.}:
[46962.942735]        _raw_spin_lock_irqsave+0x49/0x83
[46962.942738]        drm_sched_process_job+0x4d/0x180 [gpu_sched]
[46962.942741]        dma_fence_signal+0x111/0x1a0
[46962.942794]        amdgpu_fence_process+0xa3/0x100 [amdgpu]
[46962.942858]        sdma_v4_0_process_trap_irq+0x8d/0xa0 [amdgpu]
[46962.942918]        amdgpu_irq_dispatch+0xc0/0x250 [amdgpu]
[46962.942978]        amdgpu_ih_process+0x8d/0x110 [amdgpu]
[46962.943038]        amdgpu_irq_handler+0x1b/0x50 [amdgpu]
[46962.943043]        __handle_irq_event_percpu+0x3f/0x290
[46962.943046]        handle_irq_event_percpu+0x31/0x80
[46962.943048]        handle_irq_event+0x34/0x51
[46962.943053]        handle_edge_irq+0x83/0x1a0
[46962.943057]        handle_irq+0x1c/0x30
[46962.943059]        do_IRQ+0x61/0x120
[46962.943063]        ret_from_intr+0x0/0x22
[46962.943067]        cpuidle_enter_state+0xc9/0x450
[46962.943069]        cpuidle_enter+0x29/0x40
[46962.943074]        do_idle+0x1ec/0x280
[46962.943076]        cpu_startup_entry+0x19/0x20
[46962.943079]        start_secondary+0x189/0x1e0
[46962.943083]        secondary_startup_64+0xa4/0xb0
[46962.943087]=20
               -&gt; #0 (&amp;(&amp;ring-&gt;fence_drv.lock)-&gt;rlock){-.-=
.}:
[46962.943095]        lock_acquire+0xa2/0x1b0
[46962.943105]        _raw_spin_lock_irqsave+0x49/0x83
[46962.943109]        dma_fence_remove_callback+0x1a/0x60
[46962.943114]        drm_sched_stop+0x59/0x130 [gpu_sched]
[46962.943225]        amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
[46962.943338]        amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[46962.943413]        amdgpu_job_timedout+0x109/0x130 [amdgpu]
[46962.943418]        drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[46962.943421]        process_one_work+0x272/0x5e0
[46962.943423]        worker_thread+0x50/0x3b0
[46962.943427]        kthread+0x108/0x140
[46962.943431]        ret_from_fork+0x3a/0x50
[46962.943432]=20
               other info that might help us debug this:

[46962.943435]  Possible unsafe locking scenario:

[46962.943437]        CPU0                    CPU1
[46962.943438]        ----                    ----
[46962.943439]   lock(&amp;(&amp;sched-&gt;job_list_lock)-&gt;rlock);
[46962.943441]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
lock(&amp;(&amp;ring-&gt;fence_drv.lock)-&gt;rlock);
[46962.943443]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
lock(&amp;(&amp;sched-&gt;job_list_lock)-&gt;rlock);
[46962.943445]   lock(&amp;(&amp;ring-&gt;fence_drv.lock)-&gt;rlock);
[46962.943447]=20
                *** DEADLOCK ***

[46962.943449] 5 locks held by kworker/3:0/20416:
[46962.943450]  #0: 0000000043c92b99 ((wq_completion)events){+.+.}, at:
process_one_work+0x1e9/0x5e0
[46962.943456]  #1: 000000000c360f0c
((work_completion)(&amp;(&amp;sched-&gt;work_tdr)-&gt;work)){+.+.}, at:
process_one_work+0x1e9/0x5e0
[46962.943459]  #2: 000000007a135814 (&amp;adev-&gt;lock_reset){+.+.}, at:
amdgpu_device_lock_adev+0x17/0x39 [amdgpu]
[46962.943543]  #3: 00000000e83f7d6b (&amp;dqm-&gt;lock_hidden){+.+.}, at:
kgd2kfd_pre_reset+0x30/0x60 [amdgpu]
[46962.943614]  #4: 00000000d45cbf2b (&amp;(&amp;sched-&gt;job_list_lock)-&=
gt;rlock){-.-.},
at: drm_sched_stop+0x34/0x130 [gpu_sched]
[46962.943620]=20
               stack backtrace:
[46962.943629] CPU: 3 PID: 20416 Comm: kworker/3:0 Not tainted
5.2.11-200.fc30.x86_64+debug #1
[46962.943631] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[46962.943636] Workqueue: events drm_sched_job_timedout [gpu_sched]
[46962.943638] Call Trace:
[46962.943648]  dump_stack+0x85/0xc0
[46962.943654]  print_circular_bug.cold+0x15c/0x195
[46962.943658]  __lock_acquire+0x167c/0x1c90
[46962.943664]  lock_acquire+0xa2/0x1b0
[46962.943668]  ? dma_fence_remove_callback+0x1a/0x60
[46962.943674]  _raw_spin_lock_irqsave+0x49/0x83
[46962.943677]  ? dma_fence_remove_callback+0x1a/0x60
[46962.943680]  dma_fence_remove_callback+0x1a/0x60
[46962.943684]  drm_sched_stop+0x59/0x130 [gpu_sched]
[46962.943764]  amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
[46962.943847]  amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[46962.943923]  amdgpu_job_timedout+0x109/0x130 [amdgpu]
[46962.943930]  drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[46962.943934]  process_one_work+0x272/0x5e0
[46962.943938]  worker_thread+0x50/0x3b0
[46962.943942]  kthread+0x108/0x140
[46962.943945]  ? process_one_work+0x5e0/0x5e0
[46962.943948]  ? kthread_park+0x80/0x80
[46962.943952]  ret_from_fork+0x3a/0x50
[46962.961034] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[46962.961044] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[46962.961048] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[46962.961051] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[46962.961149] pcieport 0000:00:03.0: AER: Device recovery failed
[46963.955209] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D95391072, emitted seq=3D95391072
[46963.955328] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[46963.955336] amdgpu 0000:06:00.0: GPU reset begin!
[46968.050083] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[46973.170223] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-=
0]
hw_done or flip_done timed out
[46983.410080] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[46993.650098] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[46993.962192] amdgpu: [powerplay] No response from smu
[46993.962195] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[46994.277773] amdgpu: [powerplay] No response from smu
[46994.593416] amdgpu: [powerplay] No response from smu
[46994.593420] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[46994.908354] amdgpu: [powerplay] No response from smu
[46995.223718] amdgpu: [powerplay] No response from smu
[46995.223722] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[46995.286504] [drm] REG_WAIT timeout 10us * 3500 tries - dce_mi_free_dmif
line:634
[46995.286506] ------------[ cut here ]------------
[46995.286605] WARNING: CPU: 3 PID: 20416 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:329
generic_reg_wait.cold+0x31/0x53 [amdgpu]
[46995.286606] Modules linked in: vhost_net vhost tap rfcomm xt_CHECKSUM
xt_MASQUERADE tun bridge stp llc nf_conntrack_netbios_ns nf_conntrack_broad=
cast
xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECT nf_reject_ipv4
xt_conntrack ebtable_nat ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat iptable_mangle iptable_raw
iptable_security nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c ip_set
nfnetlink ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter
ip_tables bnep nct6775 hwmon_vid intel_rapl vfat fat arc4 x86_pkg_temp_ther=
mal
intel_powerclamp coretemp fuse kvm_intel kvm iwlmvm irqbypass iTCO_wdt
iTCO_vendor_support mac80211 crct10dif_pclmul crc32_pclmul
snd_hda_codec_realtek ghash_clmulni_intel intel_cstate snd_hda_codec_generic
iwlwifi snd_hda_codec_hdmi ledtrig_audio intel_uncore snd_hda_intel
intel_rapl_perf cfg80211 snd_hda_codec btusb mxm_wmi snd_hda_core btrtl btb=
cm
snd_hwdep btintel snd_seq i2c_i801 lpc_ich bluetooth
[46995.286626]  snd_seq_device joydev snd_pcm ecdh_generic snd_timer rfkill=
 ecc
mei_me snd mei soundcore pcc_cpufreq binfmt_misc auth_rpcgss sunrpc amdgpu
amd_iommu_v2 gpu_sched ttm drm_kms_helper crc32c_intel igb uas drm usb_stor=
age
dca mpt3sas i2c_algo_bit e1000e nvme raid_class nvme_core scsi_transport_sas
wmi
[46995.286638] CPU: 3 PID: 20416 Comm: kworker/3:0 Not tainted
5.2.11-200.fc30.x86_64+debug #1
[46995.286639] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[46995.286643] Workqueue: events drm_sched_job_timedout [gpu_sched]
[46995.286682] RIP: 0010:generic_reg_wait.cold+0x31/0x53 [amdgpu]
[46995.286684] Code: 4c 24 18 44 89 fa 89 ee 48 c7 c7 78 93 80 c0 e8 45 fd =
a0
ca 83 7b 20 01 0f 84 27 11 fe ff 48 c7 c7 70 92 80 c0 e8 2f fd a0 ca &lt;0f=
&gt; 0b e9
14 11 fe ff 48 c7 c7 70 92 80 c0 89 54 24 04 e8 18 fd a0
[46995.286685] RSP: 0018:ffff9cd009b3f728 EFLAGS: 00010246
[46995.286687] RAX: 0000000000000024 RBX: ffff8ada6be8a780 RCX:
0000000000000006
[46995.286688] RDX: 0000000000000000 RSI: 0000000000000001 RDI:
ffff8ada7ebd9c80
[46995.286689] RBP: 000000000000000a R08: 0000000000000001 R09:
0000000000000000
[46995.286690] R10: 0000000000000000 R11: 0000000000000000 R12:
00000000000035af
[46995.286691] R13: 0000000000000dad R14: 0000000000000001 R15:
0000000000000dac
[46995.286692] FS:  0000000000000000(0000) GS:ffff8ada7ea00000(0000)
knlGS:0000000000000000
[46995.286694] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[46995.286695] CR2: 0000085777c78000 CR3: 00000003cb612005 CR4:
00000000003606e0
[46995.286696] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[46995.286697] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[46995.286698] Call Trace:
[46995.286741]  dce_mi_free_dmif+0xef/0x150 [amdgpu]
[46995.286780]  dce110_reset_hw_ctx_wrap+0x14a/0x1e0 [amdgpu]
[46995.286819]  dce110_apply_ctx_to_hw+0x4a/0x490 [amdgpu]
[46995.286843]  ? amdgpu_pm_compute_clocks.part.0+0xcb/0x610 [amdgpu]
[46995.286882]  ? dm_pp_apply_display_requirements+0x19e/0x1c0 [amdgpu]
[46995.286920]  dc_commit_state+0x262/0x580 [amdgpu]
[46995.286925]  ? vsnprintf+0x3aa/0x4f0
[46995.286965]  amdgpu_dm_atomic_commit_tail+0xc34/0x1970 [amdgpu]
[46995.286971]  ? console_unlock+0x363/0x5d0
[46995.286976]  ? __irq_work_queue_local+0x50/0x60
[46995.286977]  ? irq_work_queue+0x4d/0x60
[46995.286979]  ? wake_up_klogd+0x37/0x40
[46995.286984]  ? wait_for_completion_timeout+0x4c/0x190
[46995.286987]  ? _raw_spin_unlock_irq+0x29/0x40
[46995.286989]  ? wait_for_completion_timeout+0x75/0x190
[46995.287016]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[46995.287021]  commit_tail+0x3c/0x70 [drm_kms_helper]
[46995.287026]  drm_atomic_helper_commit+0xe3/0x150 [drm_kms_helper]
[46995.287031]  drm_atomic_helper_disable_all+0x14c/0x160 [drm_kms_helper]
[46995.287035]  drm_atomic_helper_suspend+0x66/0x100 [drm_kms_helper]
[46995.287076]  dm_suspend+0x20/0x60 [amdgpu]
[46995.287098]  amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
[46995.287123]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[46995.287164]  amdgpu_device_pre_asic_reset+0x1f7/0x20c [amdgpu]
[46995.287204]  amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[46995.287242]  amdgpu_job_timedout+0x109/0x130 [amdgpu]
[46995.287246]  drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[46995.287249]  process_one_work+0x272/0x5e0
[46995.287252]  worker_thread+0x50/0x3b0
[46995.287256]  kthread+0x108/0x140
[46995.287258]  ? process_one_work+0x5e0/0x5e0
[46995.287260]  ? kthread_park+0x80/0x80
[46995.287263]  ret_from_fork+0x3a/0x50
[46995.287267] irq event stamp: 6288284
[46995.287269] hardirqs last  enabled at (6288283): [&lt;ffffffff8bb04d8b&g=
t;]
_raw_spin_unlock_irqrestore+0x4b/0x60
[46995.287271] hardirqs last disabled at (6288284): [&lt;ffffffff8bb05533&g=
t;]
_raw_spin_lock_irqsave+0x23/0x83
[46995.287273] softirqs last  enabled at (6288276): [&lt;ffffffff8be0035d&g=
t;]
__do_softirq+0x35d/0x468
[46995.287276] softirqs last disabled at (6288269): [&lt;ffffffff8b0f07a2&g=
t;]
irq_exit+0x102/0x110
[46995.287277] ---[ end trace 6a2158c4cfef5172 ]---
[46995.603082] amdgpu: [powerplay] No response from smu
[46995.918767] amdgpu: [powerplay] No response from smu
[46995.918770] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x1,
error code: 0x0
[46996.233769] amdgpu: [powerplay] No response from smu
[46996.549255] amdgpu: [powerplay] No response from smu
[46996.549258] amdgpu: [powerplay] Failed message: 0x4c, input parameter: 0=
x3,
error code: 0x0
[46996.865320] amdgpu: [powerplay] No response from smu
[46997.181203] amdgpu: [powerplay] No response from smu
[46997.181206] amdgpu: [powerplay] Failed message: 0x9, input parameter: 0x=
f4,
error code: 0x0
[46997.495804] amdgpu: [powerplay] No response from smu
[46997.811227] amdgpu: [powerplay] No response from smu
[46997.811231] amdgpu: [powerplay] Failed message: 0xa, input parameter:
0xa0b000, error code: 0x0
[46998.126794] amdgpu: [powerplay] No response from smu
[46998.442559] amdgpu: [powerplay] No response from smu
[46998.442561] amdgpu: [powerplay] Failed message: 0xe, input parameter: 0x=
0,
error code: 0x0
[46998.756884] amdgpu: [powerplay] No response from smu
[46999.072680] amdgpu: [powerplay] No response from smu
[46999.072684] amdgpu: [powerplay] Failed message: 0x4, input parameter: 0x=
400,
error code: 0x0
[46999.388310] amdgpu: [powerplay] No response from smu
[46999.704067] amdgpu: [powerplay] No response from smu
[46999.704069] amdgpu: [powerplay] Failed message: 0x42, input parameter: 0=
x1,
error code: 0x0
[47000.019626] amdgpu: [powerplay] No response from smu
[47000.334247] amdgpu: [powerplay] No response from smu
[47000.334251] amdgpu: [powerplay] Failed message: 0x24, input parameter: 0=
x0,
error code: 0x0
[47000.350026] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.350043] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.350052] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.350061] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.350202] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.367437] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.367443] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.367444] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.367446] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.367486] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.384977] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.384982] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.384983] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.384985] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.385055] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.402521] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.402530] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.402532] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.402535] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.402578] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.420068] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.420079] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.420085] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.420090] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.420186] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.437608] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.437617] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.437621] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.437625] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.437726] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.455143] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.455151] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.455154] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.455157] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.455209] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.472688] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.472698] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.472703] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.472708] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.472826] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.490225] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[47000.490232] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.490236] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.490239] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.490289] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.507760] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[47000.735787] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[47000.735791] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[47000.735793] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[47000.735824] pcieport 0000:00:03.0: AER: Device recovery failed
[47000.735826] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0


<span class=3D"quote">&gt; systemd logs output after the crash (If your sys=
tem froze and you get logs
&gt; after reboot):</span >

Sep 06 08:36:58 ezra.blanchardmorris.net kernel: Command line:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.11-200.fc30.x86_64+debug
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 06 08:36:58 ezra.blanchardmorris.net kernel: Kernel command line:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.11-200.fc30.x86_64+debug
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 06 08:36:59 ezra.blanchardmorris.net dracut-cmdline[361]: Using kernel
command line parameters:
BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.11-200.fc30.x86_64+debug
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: [drm] amdgpu kernel
modesetting enabled.
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 0: 0xe0000000 -&gt; 0xefffffff
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 2: 0xf0000000 -&gt; 0xf01fffff
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0:
remove_conflicting_pci_framebuffers: bar 5: 0xfb600000 -&gt; 0xfb67ffff
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: fb0: switching to amdgpudr=
mfb
from EFI VGA
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: vgaar=
b:
deactivate vga console
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: No mo=
re
image in the PCI ROM
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: VRAM:
8176M 0x000000F400000000 - 0x000000F5FEFFFFFF (8176M used)
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GART:
512M 0x0000000000000000 - 0x000000001FFFFFFF
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: AGP:
267419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: [drm] amdgpu: 8176M of VRAM
memory ready
Sep 06 08:37:00 ezra.blanchardmorris.net kernel: [drm] amdgpu: 8176M of GTT
memory ready.
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: fbcon: amdgpudrmfb (fb0) is
primary device
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: fb0:
amdgpudrmfb frame buffer device
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
gfx
uses VM inv eng 0 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.0.0 uses VM inv eng 1 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.1.0 uses VM inv eng 4 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.2.0 uses VM inv eng 5 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.3.0 uses VM inv eng 6 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.0.1 uses VM inv eng 7 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.1.1 uses VM inv eng 8 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.2.1 uses VM inv eng 9 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
comp_1.3.1 uses VM inv eng 10 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
kiq_2.1.0 uses VM inv eng 11 on hub 0
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
sdma0 uses VM inv eng 0 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
page0 uses VM inv eng 1 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
sdma1 uses VM inv eng 4 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
page1 uses VM inv eng 5 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_0 uses VM inv eng 6 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_enc_0.0 uses VM inv eng 7 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring
uvd_enc_0.1 uses VM inv eng 8 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce0
uses VM inv eng 9 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce1
uses VM inv eng 10 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: ring =
vce2
uses VM inv eng 11 on hub 1
Sep 06 08:37:01 ezra.blanchardmorris.net kernel: [drm] Initialized amdgpu
3.32.0 20150101 for 0000:06:00.0 on minor 0
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]:
Kernel command line: BOOT_IMAGE=3D(hd4,gpt6)/vmlinuz-5.2.11-200.fc30.x86_64=
+debug
root=3DUUID=3De7b8b34a-e17f-4c2b-b223-eaa636249d2d ro
resume=3DUUID=3D52cc8cd8-b06f-4613-8781-a105d0ebf44a rhgb quiet amdgpu.vm_d=
ebug=3D1
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]:=
=20=20=20=20=20
   loading driver: amdgpu
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]: =
(=3D=3D)
Matched amdgpu as autoconfigured driver 0
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]: =
(II)
LoadModule: &quot;amdgpu&quot;
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]: =
(II)
Loading /usr/lib64/xorg/modules/drivers/amdgpu_drv.so
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]: =
(II)
Module amdgpu: vendor=3D&quot;X.Org Foundation&quot;
Sep 06 08:37:48 ezra.blanchardmorris.net /usr/libexec/gdm-x-session[1969]:=
=20=20=20=20=20
   All GPUs supported by the amdgpu kernel driver
Sep 06 16:13:18 ezra.blanchardmorris.net net.lutris.Lutris.desktop[2234]:
2019-09-06 16:13:18,530: GPU: 1002:687F 1002:0B36 using amdgpu drivers
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
Sep 06 21:39:39 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx timeout, signaled seq=3D2446766, emitted seq=3D2=
446767
Sep 06 21:39:39 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process hoi4 pid 24014 thread hoi4:c=
s0
pid 24015
Sep 06 21:39:39 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_fence_process+0xa3/0x100 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
sdma_v4_0_process_trap_irq+0x8d/0xa0 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_irq_dispatch+0xc0/0x250 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_ih_process+0x8d/0x110 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_irq_handler+0x1b/0x50 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20=20=20=20=20=20=20
amdgpu_job_timedout+0x109/0x130 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:  #2: 000000007a135814
(&amp;adev-&gt;lock_reset){+.+.}, at: amdgpu_device_lock_adev+0x17/0x39 [am=
dgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:  #3: 00000000e83f7d6b
(&amp;dqm-&gt;lock_hidden){+.+.}, at: kgd2kfd_pre_reset+0x30/0x60 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20
amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20
amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
Sep 06 21:39:39 ezra.blanchardmorris.net kernel:=20
amdgpu_job_timedout+0x109/0x130 [amdgpu]
Sep 06 21:39:40 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring page1 timeout, signaled seq=3D95391072, emitted
seq=3D95391072
Sep 06 21:39:40 ezra.blanchardmorris.net kernel: [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process  pid 0 thread  pid 0
Sep 06 21:39:40 ezra.blanchardmorris.net kernel: amdgpu 0000:06:00.0: GPU r=
eset
begin!
Sep 06 21:39:49 ezra.blanchardmorris.net kernel: [drm:amdgpu_dm_atomic_check
[amdgpu]] *ERROR* [CRTC:47:crtc-0] hw_done or flip_done timed out
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0xe, input parameter: 0x0, error code: 0x0
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu
Sep 06 21:40:10 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] Failed
message: 0x42, input parameter: 0x1, error code: 0x0
Sep 06 21:40:11 ezra.blanchardmorris.net kernel: amdgpu: [powerplay] No
response from smu

I will try to run apitrace on Hearts of Iron IV to try to capture more
information.  Please let me know if I can be of further assistance in squas=
hing
this annoying bug, like providing crash information with the mesa debug
packages installed.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15678281375.C952C.25929--

--===============0010374679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0010374679==--
