Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C32BABACC8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 05:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAB56E02C;
	Mon, 23 Sep 2019 03:06:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F8106E0DD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 03:06:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7C1C972162; Mon, 23 Sep 2019 03:06:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Mon, 23 Sep 2019 03:06:55 +0000
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
Message-ID: <bug-109955-502-Mlw9Qkb5rm@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1508033586=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1508033586==
Content-Type: multipart/alternative; boundary="15692080164.636c0.22561"
Content-Transfer-Encoding: 7bit


--15692080164.636c0.22561
Date: Mon, 23 Sep 2019 03:06:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #105 from Rodney A Morris <rodamorris@gmail.com> ---
Created attachment 145462
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145462&action=3Dedit
dmesg from Stellaris crash 2019-09-20

I had another lockup on Friday while playing Stellaris again.  This time I =
had
the debug kernel running and the mesa debug packages installed.  I do not p=
lan
to post dmesg and journalctl dumps for future crashes unless the logs  indi=
cate
a new problem, or I can obtain more information than I previously provided.=
=20
Like the crash I reported for Hearts of Iron IV, this Stellaris crash seems=
 to
be caused by a circular lock dependency.

If someone believes my problems are caused by faulty hardware, please let me
know.  As an FYI, this problem does not seem to manifest under Windows 10,
playing the same game.

Card:

Sapphire Radeon Vega 64

OS Info:

          /:-------------:\=20=20=20=20=20=20=20=20=20=20=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.2.15-200.fc30.x86_64=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 1 day, 22 hours, 37 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2211 (rpm), 30 (flatpak)=20
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
:---------------------://            Memory: 3097MiB / 32084MiB=20

Mesa info:

OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6

Game being played:

Stellaris through steam for Linux

Native or Wine:

Native

Crash Type:

Screen goes black suddenly while music continues plays for less than a minu=
te;
music begins to loop; and computer reboots.

Full dmesg attached.  Pertinent part of dmesg with debug kernel:

[ 2383.732727] perf: interrupt took too long (2502 > 2500), lowering
kernel.perf_event_max_sample_rate to 79000
[ 2923.530873] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[ 2928.651952] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D51954680, emitted seq=3D51954682
[ 2928.652090] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[ 2928.652098] amdgpu 0000:06:00.0: GPU reset begin!
[ 2928.661852] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D734676, emitted seq=3D734677
[ 2928.661898] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process stellaris pid 5395 thread stellaris:cs0 pid 5397
[ 2928.661901] amdgpu 0000:06:00.0: GPU reset begin!

[ 2928.661997] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 2928.661999] WARNING: possible circular locking dependency detected
[ 2928.662003] 5.2.15-200.fc30.x86_64+debug #1 Not tainted
[ 2928.662005] ------------------------------------------------------
[ 2928.662007] kworker/10:2/974 is trying to acquire lock:
[ 2928.662010] 00000000d514cf70 (&(&ring->fence_drv.lock)->rlock){-.-.}, at:
dma_fence_remove_callback+0x1a/0x60
[ 2928.662021]=20
               but task is already holding lock:
[ 2928.662023] 00000000e6ce7c0d (&(&sched->job_list_lock)->rlock){-.-.}, at:
drm_sched_stop+0x34/0x130 [gpu_sched]
[ 2928.662031]=20
               which lock already depends on the new lock.

[ 2928.662033]=20
               the existing dependency chain (in reverse order) is:
[ 2928.662035]=20
               -> #1 (&(&sched->job_list_lock)->rlock){-.-.}:
[ 2928.662044]        _raw_spin_lock_irqsave+0x49/0x83
[ 2928.662049]        drm_sched_process_job+0x4d/0x180 [gpu_sched]
[ 2928.662052]        dma_fence_signal+0x111/0x1a0
[ 2928.662128]        amdgpu_fence_process+0xa3/0x100 [amdgpu]
[ 2928.662223]        sdma_v4_0_process_trap_irq+0x8d/0xa0 [amdgpu]
[ 2928.662310]        amdgpu_irq_dispatch+0xc0/0x250 [amdgpu]
[ 2928.662398]        amdgpu_ih_process+0x8d/0x110 [amdgpu]
[ 2928.662482]        amdgpu_irq_handler+0x1b/0x50 [amdgpu]
[ 2928.662487]        __handle_irq_event_percpu+0x3f/0x290
[ 2928.662491]        handle_irq_event_percpu+0x31/0x80
[ 2928.662495]        handle_irq_event+0x34/0x51
[ 2928.662498]        handle_edge_irq+0x83/0x1a0
[ 2928.662502]        handle_irq+0x1c/0x30
[ 2928.662507]        do_IRQ+0x61/0x120
[ 2928.662511]        ret_from_intr+0x0/0x22
[ 2928.662517]        cpuidle_enter_state+0xc9/0x450
[ 2928.662519]        cpuidle_enter+0x29/0x40
[ 2928.662524]        do_idle+0x1ec/0x280
[ 2928.662528]        cpu_startup_entry+0x19/0x20
[ 2928.662531]        start_secondary+0x189/0x1e0
[ 2928.662537]        secondary_startup_64+0xa4/0xb0
[ 2928.662539]=20
               -> #0 (&(&ring->fence_drv.lock)->rlock){-.-.}:
[ 2928.662548]        lock_acquire+0xa2/0x1b0
[ 2928.662551]        _raw_spin_lock_irqsave+0x49/0x83
[ 2928.662555]        dma_fence_remove_callback+0x1a/0x60
[ 2928.662560]        drm_sched_stop+0x59/0x130 [gpu_sched]
[ 2928.662709]        amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
[ 2928.662866]        amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[ 2928.663007]        amdgpu_job_timedout+0x109/0x130 [amdgpu]
[ 2928.663018]        drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[ 2928.663024]        process_one_work+0x272/0x5e0
[ 2928.663029]        worker_thread+0x50/0x3b0
[ 2928.663037]        kthread+0x108/0x140
[ 2928.663045]        ret_from_fork+0x3a/0x50
[ 2928.663048]=20
               other info that might help us debug this:

[ 2928.663051]  Possible unsafe locking scenario:

[ 2928.663055]        CPU0                    CPU1
[ 2928.663059]        ----                    ----
[ 2928.663062]   lock(&(&sched->job_list_lock)->rlock);
[ 2928.663068]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
lock(&(&ring->fence_drv.lock)->rlock);
[ 2928.663072]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
lock(&(&sched->job_list_lock)->rlock);
[ 2928.663076]   lock(&(&ring->fence_drv.lock)->rlock);
[ 2928.663080]=20
                *** DEADLOCK ***

[ 2928.663085] 5 locks held by kworker/10:2/974:
[ 2928.663090]  #0: 0000000057c9a435 ((wq_completion)events){+.+.}, at:
process_one_work+0x1e9/0x5e0
[ 2928.663100]  #1: 00000000aadd5dda
((work_completion)(&(&sched->work_tdr)->work)){+.+.}, at:
process_one_work+0x1e9/0x5e0
[ 2928.663108]  #2: 0000000007db378b (&adev->lock_reset){+.+.}, at:
amdgpu_device_lock_adev+0x17/0x39 [amdgpu]
[ 2928.663261]  #3: 000000001e0a2926 (&dqm->lock_hidden){+.+.}, at:
kgd2kfd_pre_reset+0x30/0x60 [amdgpu]
[ 2928.663392]  #4: 00000000e6ce7c0d (&(&sched->job_list_lock)->rlock){-.-.=
},
at: drm_sched_stop+0x34/0x130 [gpu_sched]
[ 2928.663403]=20
               stack backtrace:
[ 2928.663409] CPU: 10 PID: 974 Comm: kworker/10:2 Not tainted
5.2.15-200.fc30.x86_64+debug #1
[ 2928.663413] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[ 2928.663423] Workqueue: events drm_sched_job_timedout [gpu_sched]
[ 2928.663428] Call Trace:
[ 2928.663442]  dump_stack+0x85/0xc0
[ 2928.663453]  print_circular_bug.cold+0x15c/0x195
[ 2928.663462]  __lock_acquire+0x167c/0x1c90
[ 2928.663475]  lock_acquire+0xa2/0x1b0
[ 2928.663482]  ? dma_fence_remove_callback+0x1a/0x60
[ 2928.663494]  _raw_spin_lock_irqsave+0x49/0x83
[ 2928.663499]  ? dma_fence_remove_callback+0x1a/0x60
[ 2928.663506]  dma_fence_remove_callback+0x1a/0x60
[ 2928.663515]  drm_sched_stop+0x59/0x130 [gpu_sched]
[ 2928.663663]  amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
[ 2928.663818]  amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[ 2928.663960]  amdgpu_job_timedout+0x109/0x130 [amdgpu]
[ 2928.663974]  drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[ 2928.663981]  process_one_work+0x272/0x5e0
[ 2928.663991]  worker_thread+0x50/0x3b0
[ 2928.664000]  kthread+0x108/0x140
[ 2928.664005]  ? process_one_work+0x5e0/0x5e0
[ 2928.664011]  ? kthread_park+0x80/0x80
[ 2928.664021]  ret_from_fork+0x3a/0x50
[ 2928.681831] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 2928.681846] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 2928.681851] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 2928.681857] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 2928.681963] pcieport 0000:00:03.0: AER: Device recovery failed
[ 2933.771664] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 2938.890758] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-=
0]
hw_done or flip_done timed out
[ 2939.118467] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 2939.118475] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 2939.118477] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 2939.118479] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 2939.118536] pcieport 0000:00:03.0: AER: Device recovery failed
[ 2939.141034] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[ 2939.369014] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 2939.369018] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 2939.369021] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 2939.369072] pcieport 0000:00:03.0: AER: Device recovery failed
[ 2939.369075] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[ 2939.597051] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 2939.597055] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 2939.597057] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 2939.597103] pcieport 0000:00:03.0: AER: Device recovery failed
[ 2939.597106] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0

systemd logs:

Nothing interesting appears in the logs, not even the information from dmes=
g.=20
I'm unsure if systemd captured anything from the crash.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15692080164.636c0.22561
Date: Mon, 23 Sep 2019 03:06:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c105">Comm=
ent # 105</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rodamorris&#64;gmail.com" title=3D"Rodney A Morris &lt;rodamorris&#64;gmail=
.com&gt;"> <span class=3D"fn">Rodney A Morris</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145462=
" name=3D"attach_145462" title=3D"dmesg from Stellaris crash 2019-09-20">at=
tachment 145462</a> <a href=3D"attachment.cgi?id=3D145462&amp;action=3Dedit=
" title=3D"dmesg from Stellaris crash 2019-09-20">[details]</a></span>
dmesg from Stellaris crash 2019-09-20

I had another lockup on Friday while playing Stellaris again.  This time I =
had
the debug kernel running and the mesa debug packages installed.  I do not p=
lan
to post dmesg and journalctl dumps for future crashes unless the logs  indi=
cate
a new problem, or I can obtain more information than I previously provided.=
=20
Like the crash I reported for Hearts of Iron IV, this Stellaris crash seems=
 to
be caused by a circular lock dependency.

If someone believes my problems are caused by faulty hardware, please let me
know.  As an FYI, this problem does not seem to manifest under Windows 10,
playing the same game.

Card:

Sapphire Radeon Vega 64

OS Info:

          /:-------------:\=20=20=20=20=20=20=20=20=20=20=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.2.15-200.fc30.x86_64=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 1 day, 22 hours, 37 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2211 (rpm), 30 (flatpak)=20
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
:---------------------://            Memory: 3097MiB / 32084MiB=20

Mesa info:

OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6

Game being played:

Stellaris through steam for Linux

Native or Wine:

Native

Crash Type:

Screen goes black suddenly while music continues plays for less than a minu=
te;
music begins to loop; and computer reboots.

Full dmesg attached.  Pertinent part of dmesg with debug kernel:

[ 2383.732727] perf: interrupt took too long (2502 &gt; 2500), lowering
kernel.perf_event_max_sample_rate to 79000
[ 2923.530873] [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting =
for
fences timed out or interrupted!
[ 2928.651952] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D51954680, emitted seq=3D51954682
[ 2928.652090] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[ 2928.652098] amdgpu 0000:06:00.0: GPU reset begin!
[ 2928.661852] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D734676, emitted seq=3D734677
[ 2928.661898] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process stellaris pid 5395 thread stellaris:cs0 pid 5397
[ 2928.661901] amdgpu 0000:06:00.0: GPU reset begin!

[ 2928.661997] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 2928.661999] WARNING: possible circular locking dependency detected
[ 2928.662003] 5.2.15-200.fc30.x86_64+debug #1 Not tainted
[ 2928.662005] ------------------------------------------------------
[ 2928.662007] kworker/10:2/974 is trying to acquire lock:
[ 2928.662010] 00000000d514cf70 (&amp;(&amp;ring-&gt;fence_drv.lock)-&gt;rl=
ock){-.-.}, at:
dma_fence_remove_callback+0x1a/0x60
[ 2928.662021]=20
               but task is already holding lock:
[ 2928.662023] 00000000e6ce7c0d (&amp;(&amp;sched-&gt;job_list_lock)-&gt;rl=
ock){-.-.}, at:
drm_sched_stop+0x34/0x130 [gpu_sched]
[ 2928.662031]=20
               which lock already depends on the new lock.

[ 2928.662033]=20
               the existing dependency chain (in reverse order) is:
[ 2928.662035]=20
               -&gt; #1 (&amp;(&amp;sched-&gt;job_list_lock)-&gt;rlock){-.-=
.}:
[ 2928.662044]        _raw_spin_lock_irqsave+0x49/0x83
[ 2928.662049]        drm_sched_process_job+0x4d/0x180 [gpu_sched]
[ 2928.662052]        dma_fence_signal+0x111/0x1a0
[ 2928.662128]        amdgpu_fence_process+0xa3/0x100 [amdgpu]
[ 2928.662223]        sdma_v4_0_process_trap_irq+0x8d/0xa0 [amdgpu]
[ 2928.662310]        amdgpu_irq_dispatch+0xc0/0x250 [amdgpu]
[ 2928.662398]        amdgpu_ih_process+0x8d/0x110 [amdgpu]
[ 2928.662482]        amdgpu_irq_handler+0x1b/0x50 [amdgpu]
[ 2928.662487]        __handle_irq_event_percpu+0x3f/0x290
[ 2928.662491]        handle_irq_event_percpu+0x31/0x80
[ 2928.662495]        handle_irq_event+0x34/0x51
[ 2928.662498]        handle_edge_irq+0x83/0x1a0
[ 2928.662502]        handle_irq+0x1c/0x30
[ 2928.662507]        do_IRQ+0x61/0x120
[ 2928.662511]        ret_from_intr+0x0/0x22
[ 2928.662517]        cpuidle_enter_state+0xc9/0x450
[ 2928.662519]        cpuidle_enter+0x29/0x40
[ 2928.662524]        do_idle+0x1ec/0x280
[ 2928.662528]        cpu_startup_entry+0x19/0x20
[ 2928.662531]        start_secondary+0x189/0x1e0
[ 2928.662537]        secondary_startup_64+0xa4/0xb0
[ 2928.662539]=20
               -&gt; #0 (&amp;(&amp;ring-&gt;fence_drv.lock)-&gt;rlock){-.-=
.}:
[ 2928.662548]        lock_acquire+0xa2/0x1b0
[ 2928.662551]        _raw_spin_lock_irqsave+0x49/0x83
[ 2928.662555]        dma_fence_remove_callback+0x1a/0x60
[ 2928.662560]        drm_sched_stop+0x59/0x130 [gpu_sched]
[ 2928.662709]        amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
[ 2928.662866]        amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[ 2928.663007]        amdgpu_job_timedout+0x109/0x130 [amdgpu]
[ 2928.663018]        drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[ 2928.663024]        process_one_work+0x272/0x5e0
[ 2928.663029]        worker_thread+0x50/0x3b0
[ 2928.663037]        kthread+0x108/0x140
[ 2928.663045]        ret_from_fork+0x3a/0x50
[ 2928.663048]=20
               other info that might help us debug this:

[ 2928.663051]  Possible unsafe locking scenario:

[ 2928.663055]        CPU0                    CPU1
[ 2928.663059]        ----                    ----
[ 2928.663062]   lock(&amp;(&amp;sched-&gt;job_list_lock)-&gt;rlock);
[ 2928.663068]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
lock(&amp;(&amp;ring-&gt;fence_drv.lock)-&gt;rlock);
[ 2928.663072]=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
lock(&amp;(&amp;sched-&gt;job_list_lock)-&gt;rlock);
[ 2928.663076]   lock(&amp;(&amp;ring-&gt;fence_drv.lock)-&gt;rlock);
[ 2928.663080]=20
                *** DEADLOCK ***

[ 2928.663085] 5 locks held by kworker/10:2/974:
[ 2928.663090]  #0: 0000000057c9a435 ((wq_completion)events){+.+.}, at:
process_one_work+0x1e9/0x5e0
[ 2928.663100]  #1: 00000000aadd5dda
((work_completion)(&amp;(&amp;sched-&gt;work_tdr)-&gt;work)){+.+.}, at:
process_one_work+0x1e9/0x5e0
[ 2928.663108]  #2: 0000000007db378b (&amp;adev-&gt;lock_reset){+.+.}, at:
amdgpu_device_lock_adev+0x17/0x39 [amdgpu]
[ 2928.663261]  #3: 000000001e0a2926 (&amp;dqm-&gt;lock_hidden){+.+.}, at:
kgd2kfd_pre_reset+0x30/0x60 [amdgpu]
[ 2928.663392]  #4: 00000000e6ce7c0d (&amp;(&amp;sched-&gt;job_list_lock)-&=
gt;rlock){-.-.},
at: drm_sched_stop+0x34/0x130 [gpu_sched]
[ 2928.663403]=20
               stack backtrace:
[ 2928.663409] CPU: 10 PID: 974 Comm: kworker/10:2 Not tainted
5.2.15-200.fc30.x86_64+debug #1
[ 2928.663413] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M.=
/X99
Taichi, BIOS P1.80 04/06/2018
[ 2928.663423] Workqueue: events drm_sched_job_timedout [gpu_sched]
[ 2928.663428] Call Trace:
[ 2928.663442]  dump_stack+0x85/0xc0
[ 2928.663453]  print_circular_bug.cold+0x15c/0x195
[ 2928.663462]  __lock_acquire+0x167c/0x1c90
[ 2928.663475]  lock_acquire+0xa2/0x1b0
[ 2928.663482]  ? dma_fence_remove_callback+0x1a/0x60
[ 2928.663494]  _raw_spin_lock_irqsave+0x49/0x83
[ 2928.663499]  ? dma_fence_remove_callback+0x1a/0x60
[ 2928.663506]  dma_fence_remove_callback+0x1a/0x60
[ 2928.663515]  drm_sched_stop+0x59/0x130 [gpu_sched]
[ 2928.663663]  amdgpu_device_pre_asic_reset+0x41/0x20c [amdgpu]
[ 2928.663818]  amdgpu_device_gpu_recover+0x77/0x788 [amdgpu]
[ 2928.663960]  amdgpu_job_timedout+0x109/0x130 [amdgpu]
[ 2928.663974]  drm_sched_job_timedout+0x40/0x70 [gpu_sched]
[ 2928.663981]  process_one_work+0x272/0x5e0
[ 2928.663991]  worker_thread+0x50/0x3b0
[ 2928.664000]  kthread+0x108/0x140
[ 2928.664005]  ? process_one_work+0x5e0/0x5e0
[ 2928.664011]  ? kthread_park+0x80/0x80
[ 2928.664021]  ret_from_fork+0x3a/0x50
[ 2928.681831] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 2928.681846] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 2928.681851] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 2928.681857] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 2928.681963] pcieport 0000:00:03.0: AER: Device recovery failed
[ 2933.771664] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[ 2938.890758] [drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-=
0]
hw_done or flip_done timed out
[ 2939.118467] pcieport 0000:00:03.0: AER: Uncorrected (Non-Fatal) error
received: 0000:00:03.0
[ 2939.118475] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 2939.118477] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 2939.118479] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 2939.118536] pcieport 0000:00:03.0: AER: Device recovery failed
[ 2939.141034] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[ 2939.369014] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 2939.369018] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 2939.369021] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 2939.369072] pcieport 0000:00:03.0: AER: Device recovery failed
[ 2939.369075] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0
[ 2939.597051] pcieport 0000:00:03.0: AER: PCIe Bus Error: severity=3DUncor=
rected
(Non-Fatal), type=3DTransaction Layer, (Requester ID)
[ 2939.597055] pcieport 0000:00:03.0: AER:   device [8086:6f08] error
status/mask=3D00004000/00000000
[ 2939.597057] pcieport 0000:00:03.0: AER:    [14] CmpltTO=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
(First)
[ 2939.597103] pcieport 0000:00:03.0: AER: Device recovery failed
[ 2939.597106] pcieport 0000:00:03.0: AER: Multiple Uncorrected (Non-Fatal)
error received: 0000:00:03.0

systemd logs:

Nothing interesting appears in the logs, not even the information from dmes=
g.=20
I'm unsure if systemd captured anything from the crash.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15692080164.636c0.22561--

--===============1508033586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1508033586==--
