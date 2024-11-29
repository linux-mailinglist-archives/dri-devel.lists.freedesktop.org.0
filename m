Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548509DBECC
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 03:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC9310ED3C;
	Fri, 29 Nov 2024 02:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="immzUK87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C800710ECBE;
 Fri, 29 Nov 2024 02:51:45 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-5f1e79c2f81so600723eaf.2; 
 Thu, 28 Nov 2024 18:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732848705; x=1733453505; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hTDWXU7a1GroAbQyi6OFMJaNXGCrsIxc9k/JH4be/VE=;
 b=immzUK87qbDNV+GRu/59WM4slVIVqhfY9b5S33xlPZ/1zFbAH2xRG7M22d+b29Bqse
 v9yX11EoOLgtBue6hU2VpLqcG11qGpw4yXDogtiifYzd5DJHMWmmrCN+toYD6JWtafI9
 yNc4acNM0q0CAhX6tdCigNDEQXGJ83b/25PPyvmBZM0fHPthcOlbZJ1eRhF4xfKE71Ja
 yqBk9qpkmoU4D0M2OBI2Yc7ngk/ehwIOEXreCGy+nrqvsNV7Y7VqOR9JXc0yhkkErTf3
 rYKL+kmEjCXtpHJCoG73fYh/hAJB4qhlAryj+ysJr2qhWFLMommvPEt7r9CjBtRY/TZP
 4XAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732848705; x=1733453505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hTDWXU7a1GroAbQyi6OFMJaNXGCrsIxc9k/JH4be/VE=;
 b=pzdKDl/J1pqRVRfp6v4wl3k/JyaEduIopDNExqqDPGsdKsL/G0hOtpzhdc4W1OAmo1
 T3k/rKhoEKyOdV0hBdn82+xmsqVbvpzPxKkum0NkT2d3H/lwyqtWGBQWvj3rR2lUo9eR
 7/YBYTs60K6YknHgeTijOU3fqbhw/YtsMjw24UW1GZ701GSd3jH3nsPzEXjVbQqjDoMD
 rCULor9Y4bI9jSmVwhFomDPWf6fj9TzRXVVnkLJzNtMi9D9dzJDZKJw8Cc+RNLD2pTxn
 XB7s8u4ZSbNJKOg6tH6hdpPTcfFyIVrAHnWg+g3R5EV1Qa8oh1HU8TiFsgn9pO+vm6Qb
 sFXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVt1gTg0gp9qeqxBUs9MvueWUN7EU6L8PMO/VxUB63+MmLKYFbdTTF54zl9QxyuttzfwPC+6M79@lists.freedesktop.org,
 AJvYcCW9B+vdXtLz1OlmdwKpfEdNoW1he14oVIUkLCRO59/BCyjhweuDTKDcjcv+ovAqiO6+atll5Z61oDi3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOi51Q+dIh7bi5iX8GIjG9jSaXRKvi9FRfOd/jWDh+bTWYo5dU
 0yr1ERwIgBj+2O1Y5UbhFoZQTyF1S9bsFGfUSM3ynUJaHY15SNzkaxgitcLpgaFQVYVd8t+1RKv
 kQPAdW5IR6GBztaRRlrs+2A0JdUA=
X-Gm-Gg: ASbGncsbdN8gR7iwB/QGGguVasTrUQEScg+/s+0eqg8+y42tdFxJ0SheTcvLsUi6m40
 xCk38F9yqrqObRFExYXi1lbTtDDhAMA==
X-Google-Smtp-Source: AGHT+IHtRRmMEO4CCKHIFmsn6MPdIqC7fELoYypYWvCLswW04Y5MRX0Ng7ER4nFXW2eCDd6ZAHIgjnduGiTsNU8jcis=
X-Received: by 2002:a05:6820:3082:b0:5e5:c517:4d88 with SMTP id
 006d021491bc7-5f209fc793cmr6825413eaf.0.1732848704854; Thu, 28 Nov 2024
 18:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20241127114638.11216-1-lamikr@gmail.com>
 <20241127114638.11216-2-lamikr@gmail.com>
 <8266003e-eb98-44cb-a326-1e4f688eeb4c@amd.com>
 <744cb13e-d46c-40b0-8d88-b223db5178da@amd.com>
In-Reply-To: <744cb13e-d46c-40b0-8d88-b223db5178da@amd.com>
From: Mika Laitio <lamikr@gmail.com>
Date: Thu, 28 Nov 2024 18:51:33 -0800
Message-ID: <CAJ+8kEYDRozboMpybdqMVZx+S77s_zHNXURJ-pp_Lrx_fESkgA@mail.gmail.com>
Subject: Re: [PATCH 1/1] amdgpu fix for gfx1103 queue evict/restore crash
To: Felix Kuehling <felix.kuehling@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, Hawking.Zhang@amd.com, 
 sunil.khatri@amd.com, lijo.lazar@amd.com, kevinyang.wang@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="00000000000080a51206280447f8"
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000080a51206280447f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback, the problem is anyway real breaking userspace apps
if my patch is not in use. I have actually spend this day for investigating
and testing another gpu hang bug that has been reported originally by
others on gfx1010/AMD RX 5700. I thought originally that the bug is
different because I was not able to trigger it in the test app that crashes
the kernel on gfx1103.

With gfx1010 I need to run the pytorch gpu benchmark which does more heavy
calculation. In kernel side the symptom is same, kernel fails to remove the
queue on similar type of evict/restore cycle that the kernel seems to do
constantly. This bug has one annoying side-effect, regular user level
reboot will hang requiring to use power button to shut down the device.
(echo b >/proc/sysrq-trigger works sometimes)

Anyway, I have managed to get the gfx1010 to also stay stable and finish
the benchmarks if I do a similar type of fix/workaround that prevents the
queue remove/restore to happen on evict and restore methods.

It may or may not be in reality a firmware bug, hard to debug as I do not
access to firmware code. But I think this should be fixed somehow anyway.
(Kernel has tons of workaround anyway for other broken firmware and hw
problems)

I can however try to approach this in some other way also, would you have
any suggestion? I have played with the recent AMD gpu kernel driver stack
for a couple of days, so I probably miss something but here are 2
observations/questions I have in my mind?

1) Is it really necessary to evict/restore the queues also on firmware
until they really need to be deleted more permanently? I mean would it be
just enough to mark queues disabled/enabled in kernel-structure when
pre-emption happens?

2) dqm_lock that is used to protect the queue-lists that are
removed/restored uses memalloc_noreclaim_save/restore calls that according
to documentation can easily cause problems if there happens some fs calls
or recursions. Could the userspace be able to trigger that problem by using
some amdgpu specific sysfs interface calls. Or can the MES firmware somehow
call back to kernel functions that cause recursive loop while performing
the queue remove method calls?

Below is the gfx1010 dmesg with added trace calls that reveals kernel
problems with queues while using that device.
I have again added some extra strace to to print out the function name when
its started and what is the caller method.

884.437695] amdgpu: kgd2kfd_quiesce_mm called by amdgpu_amdkfd_evict_userpt=
r
[  884.437704] amdgpu: evict_process_queues_cpsch started
[  884.443511] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  884.443520] amdgpu: restore_process_queues_cpsch started
[  907.375917] amdgpu: evict_process_queues_cpsch started
[  907.375981] amdgpu: evict_process_worker Finished evicting pasid 0x8005
[  907.483535] amdgpu: restore_process_queues_cpsch started
[  909.013279] amdgpu: kgd2kfd_quiesce_mm called by svm_range_evict
[  909.013286] amdgpu: evict_process_queues_cpsch started
[  909.033675] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  909.033681] amdgpu: evict_process_queues_cpsch started
[  909.059674] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  909.059680] amdgpu: restore_process_queues_cpsch started
[  909.082565] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  909.082572] amdgpu: evict_process_queues_cpsch started
[  909.295184] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  909.295190] amdgpu: restore_process_queues_cpsch started
[  909.608840] amdgpu: kgd2kfd_resume_mm called by svm_range_restore_work
[  909.608846] amdgpu: restore_process_queues_cpsch started
[  966.354867] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  966.354876] amdgpu: evict_process_queues_cpsch started
[  966.361293] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  966.361303] amdgpu: restore_process_queues_cpsch started
[  984.457200] amdgpu: evict_process_queues_cpsch started
[  984.457261] amdgpu: evict_process_worker Finished evicting pasid 0x8005
[  984.562403] amdgpu: restore_process_queues_cpsch started
[  984.628620] amdgpu: kgd2kfd_quiesce_mm called by svm_range_evict
[  984.628627] amdgpu: evict_process_queues_cpsch started
[  984.650436] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  984.650443] amdgpu: evict_process_queues_cpsch started
[  984.718544] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  984.718550] amdgpu: restore_process_queues_cpsch started
[  984.738360] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  984.738367] amdgpu: evict_process_queues_cpsch started
[  984.765031] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  984.765038] amdgpu: restore_process_queues_cpsch started
[  984.785180] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  984.785187] amdgpu: evict_process_queues_cpsch started
[  984.907430] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  984.907435] amdgpu: restore_process_queues_cpsch started
[  984.930399] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  984.930405] amdgpu: evict_process_queues_cpsch started
[  984.956551] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  984.956561] amdgpu: restore_process_queues_cpsch started
[  985.288614] amdgpu: kgd2kfd_resume_mm called by svm_range_restore_work
[  985.288621] amdgpu: restore_process_queues_cpsch started
[  998.410978] amdgpu: evict_process_queues_cpsch started
[  998.411041] amdgpu: evict_process_worker Finished evicting pasid 0x8005
[  998.513922] amdgpu: restore_process_queues_cpsch started
[  998.531861] amdgpu: kgd2kfd_quiesce_mm called by svm_range_evict
[  998.531867] amdgpu: evict_process_queues_cpsch started
[  998.553650] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  998.553656] amdgpu: evict_process_queues_cpsch started
[  998.581235] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  998.581241] amdgpu: restore_process_queues_cpsch started
[  998.607168] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  998.607174] amdgpu: evict_process_queues_cpsch started
[  998.700499] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  998.700506] amdgpu: restore_process_queues_cpsch started
[  998.718179] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  998.718187] amdgpu: evict_process_queues_cpsch started
[  998.810595] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  998.810603] amdgpu: restore_process_queues_cpsch started
[  998.831776] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  998.831782] amdgpu: evict_process_queues_cpsch started
[  998.858199] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  998.858205] amdgpu: restore_process_queues_cpsch started
[  998.880604] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[  998.880611] amdgpu: evict_process_queues_cpsch started
[  998.912335] amdgpu: kgd2kfd_resume_mm called by
amdgpu_amdkfd_restore_userptr_worker
[  998.912343] amdgpu: restore_process_queues_cpsch started
[  999.237449] amdgpu: kgd2kfd_resume_mm called by svm_range_restore_work
[  999.237455] amdgpu: restore_process_queues_cpsch started
[ 1058.513361] amdgpu: kgd2kfd_quiesce_mm called by
amdgpu_amdkfd_evict_userptr
[ 1058.513373] amdgpu: evict_process_queues_cpsch started
[ 1062.513487] amdgpu 0000:03:00.0: amdgpu: Queue preemption failed for
queue with doorbell_id: 80004008
[ 1062.513500] amdgpu 0000:03:00.0: amdgpu: Failed to evict process queue
0, caller: kgd2kfd_quiesce_mm
[ 1062.513503] amdgpu: Failed to quiesce KFD
[ 1062.513551] amdgpu 0000:03:00.0: amdgpu: GPU reset begin!
[ 1062.513628] amdgpu: evict_process_queues_cpsch started
[ 1062.513694] amdgpu 0000:03:00.0: amdgpu: Dumping IP State
[ 1062.517229] amdgpu 0000:03:00.0: amdgpu: Dumping IP State Completed
[ 1062.866910] amdgpu 0000:03:00.0: [drm:amdgpu_ring_test_helper [amdgpu]]
*ERROR* ring kiq_0.2.1.0 test failed (-110)
[ 1062.867435] [drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed
[ 1062.915075] amdgpu 0000:03:00.0: amdgpu: BACO reset
[ 1062.937902] amdgpu: kgd2kfd_quiesce_mm called by svm_range_evict
[ 1062.937907] amdgpu: evict_process_queues_cpsch started




On Wed, Nov 27, 2024 at 3:50=E2=80=AFPM Felix Kuehling <felix.kuehling@amd.=
com>
wrote:

>
> On 2024-11-27 06:51, Christian K=C3=B6nig wrote:
> > Am 27.11.24 um 12:46 schrieb Mika Laitio:
> >> AMD gfx1103 / M780 iGPU will crash eventually when used for
> >> pytorch ML/AI operations on rocm sdk stack. After kernel error
> >> the application exits on error and linux desktop can itself
> >> sometimes either freeze or reset back to login screen.
> >>
> >> Error will happen randomly when kernel calls
> >> evict_process_queues_cpsch and
> >> restore_process_queues_cpsch methods to remove and restore the queues
> >> that has been created earlier.
> >>
> >> The fix is to remove the evict and restore calls when device used is
> >> iGPU. The queues that has been added during the user space
> >> application execution
> >> time will still be removed when the application exits
> >
> > As far as I can see that is absolutely not a fix but rather a
> > obviously broken workaround.
> >
> > Evicting and restoring queues is usually mandatory for correct operatio=
n.
> >
> > So just ignore that this doesn't work will just is not something you
> > can do.
>
> I agree. Eviction happens for example in MMU notifiers where we need to
> assure the kernel that memory won't be accessed by the GPU once the
> notifier returns, until the memory mappings in the GPU page tables can
> be revalidated.
>
> This looks like a crude workaround for an MES firmware problem or some
> other kind of intermittent hang that needs to be root-caused. It's a
> NACK from me as well.
>
> Regards,
>    Felix
>
>
> >
> > Regards,
> > Christian.
> >
> >>
> >> On evety test attempts the crash has always happened on the
> >> same location while removing the 2nd queue of 3 with doorbell id 0x100=
2.
> >>
> >> Below is the trace captured by adding more printouts to problem
> >> location to print message also when the queue is evicted or resrored
> >> succesfully.
> >>
> >> [  948.324174] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
> >> hardware queue to MES, doorbell=3D0x1202, queue: 2, caller:
> >> restore_process_queues_cpsch
> >> [  948.334344] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
> >> hardware queue to MES, doorbell=3D0x1002, queue: 1, caller:
> >> restore_process_queues_cpsch
> >> [  948.344499] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
> >> hardware queue to MES, doorbell=3D0x1000, queue: 0, caller:
> >> restore_process_queues_cpsch
> >> [  952.380614] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed
> >> hardware queue from MES, doorbell=3D0x1202, queue: 2, caller:
> >> evict_process_queues_cpsch
> >> [  952.391330] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed
> >> hardware queue from MES, doorbell=3D0x1002, queue: 1, caller:
> >> evict_process_queues_cpsch
> >> [  952.401634] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed
> >> hardware queue from MES, doorbell=3D0x1000, queue: 0, caller:
> >> evict_process_queues_cpsch
> >> [  952.414507] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
> >> hardware queue to MES, doorbell=3D0x1202, queue: 2, caller:
> >> restore_process_queues_cpsch
> >> [  952.424618] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
> >> hardware queue to MES, doorbell=3D0x1002, queue: 1, caller:
> >> restore_process_queues_cpsch
> >> [  952.434922] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes added
> >> hardware queue to MES, doorbell=3D0x1000, queue: 0, caller:
> >> restore_process_queues_cpsch
> >> [  952.446272] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes removed
> >> hardware queue from MES, doorbell=3D0x1202, queue: 2, caller:
> >> evict_process_queues_cpsch
> >> [  954.460341] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to
> >> msg=3DREMOVE_QUEUE
> >> [  954.460356] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes failed
> >> to remove hardware queue from MES, doorbell=3D0x1002, queue: 1, caller=
:
> >> evict_process_queues_cpsch
> >> [  954.460360] amdgpu 0000:c4:00.0: amdgpu: MES might be in
> >> unrecoverable state, issue a GPU reset
> >> [  954.460366] amdgpu 0000:c4:00.0: amdgpu: Failed to evict queue 1
> >> [  954.460368] amdgpu 0000:c4:00.0: amdgpu: Failed to evict process
> >> queues
> >> [  954.460439] amdgpu 0000:c4:00.0: amdgpu: GPU reset begin!
> >> [  954.460464] amdgpu 0000:c4:00.0: amdgpu: remove_all_queues_mes:
> >> Failed to remove queue 0 for dev 5257
> >> [  954.460515] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State
> >> [  954.462637] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State Completed
> >> [  955.865591] amdgpu: process_termination_cpsch started
> >> [  955.866432] amdgpu: process_termination_cpsch started
> >> [  955.866445] amdgpu 0000:c4:00.0: amdgpu: Failed to remove queue 0
> >> [  956.503043] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to
> >> msg=3DREMOVE_QUEUE
> >> [  956.503059] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR*
> >> failed to unmap legacy queue
> >> [  958.507491] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to
> >> msg=3DREMOVE_QUEUE
> >> [  958.507507] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR*
> >> failed to unmap legacy queue
> >> [  960.512077] amdgpu 0000:c4:00.0: amdgpu: MES failed to respond to
> >> msg=3DREMOVE_QUEUE
> >> [  960.512093] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR*
> >> failed to unmap legacy queue
> >> [  960.785816] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* failed to
> >> halt cp gfx
> >>
> >> Signed-off-by: Mika Laitio <lamikr@gmail.com>
> >> ---
> >>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 24 ++++++++++++-----=
--
> >>   1 file changed, 16 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> >> b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> >> index c79fe9069e22..96088d480e09 100644
> >> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> >> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> >> @@ -1187,9 +1187,12 @@ static int evict_process_queues_cpsch(struct
> >> device_queue_manager *dqm,
> >>       struct kfd_process_device *pdd;
> >>       int retval =3D 0;
> >>   +    // gfx1103 APU can fail to remove queue on evict/restore cycle
> >> +    if (dqm->dev->adev->flags & AMD_IS_APU)
> >> +        goto out;
> >>       dqm_lock(dqm);
> >>       if (qpd->evicted++ > 0) /* already evicted, do nothing */
> >> -        goto out;
> >> +        goto out_unlock;
> >>         pdd =3D qpd_to_pdd(qpd);
> >>   @@ -1198,7 +1201,7 @@ static int evict_process_queues_cpsch(struct
> >> device_queue_manager *dqm,
> >>        * Skip queue eviction on process eviction.
> >>        */
> >>       if (!pdd->drm_priv)
> >> -        goto out;
> >> +        goto out_unlock;
> >>         pr_debug_ratelimited("Evicting PASID 0x%x queues\n",
> >>                   pdd->process->pasid);
> >> @@ -1219,7 +1222,7 @@ static int evict_process_queues_cpsch(struct
> >> device_queue_manager *dqm,
> >>               if (retval) {
> >>                   dev_err(dev, "Failed to evict queue %d\n",
> >>                       q->properties.queue_id);
> >> -                goto out;
> >> +                goto out_unlock;
> >>               }
> >>           }
> >>       }
> >> @@ -1231,8 +1234,9 @@ static int evict_process_queues_cpsch(struct
> >> device_queue_manager *dqm,
> >> KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,
> >>                             USE_DEFAULT_GRACE_PERIOD);
> >>   -out:
> >> +out_unlock:
> >>       dqm_unlock(dqm);
> >> +out:
> >>       return retval;
> >>   }
> >>   @@ -1326,14 +1330,17 @@ static int
> >> restore_process_queues_cpsch(struct device_queue_manager *dqm,
> >>       uint64_t eviction_duration;
> >>       int retval =3D 0;
> >>   +    // gfx1103 APU can fail to remove queue on evict/restore cycle
> >> +    if (dqm->dev->adev->flags & AMD_IS_APU)
> >> +        goto out;
> >>       pdd =3D qpd_to_pdd(qpd);
> >>         dqm_lock(dqm);
> >>       if (WARN_ON_ONCE(!qpd->evicted)) /* already restored, do
> >> nothing */
> >> -        goto out;
> >> +        goto out_unlock;
> >>       if (qpd->evicted > 1) { /* ref count still > 0, decrement &
> >> quit */
> >>           qpd->evicted--;
> >> -        goto out;
> >> +        goto out_unlock;
> >>       }
> >>         /* The debugger creates processes that temporarily have not
> >> acquired
> >> @@ -1364,7 +1371,7 @@ static int restore_process_queues_cpsch(struct
> >> device_queue_manager *dqm,
> >>               if (retval) {
> >>                   dev_err(dev, "Failed to restore queue %d\n",
> >>                       q->properties.queue_id);
> >> -                goto out;
> >> +                goto out_unlock;
> >>               }
> >>           }
> >>       }
> >> @@ -1375,8 +1382,9 @@ static int restore_process_queues_cpsch(struct
> >> device_queue_manager *dqm,
> >>       atomic64_add(eviction_duration, &pdd->evict_duration_counter);
> >>   vm_not_acquired:
> >>       qpd->evicted =3D 0;
> >> -out:
> >> +out_unlock:
> >>       dqm_unlock(dqm);
> >> +out:
> >>       return retval;
> >>   }
> >
>

--00000000000080a51206280447f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the feedback, the problem is anyway real b=
reaking userspace apps if my patch is not in use. I have actually spend thi=
s day for investigating and testing another gpu hang bug that has been repo=
rted originally by others on gfx1010/AMD RX 5700. I thought originally that=
 the bug is different because I was not able to trigger it in the test app =
that crashes the kernel on gfx1103.</div><div><br></div><div>With gfx1010 I=
 need to run the pytorch gpu benchmark which does more heavy calculation. I=
n kernel side the symptom is same, kernel fails to remove the queue on simi=
lar type of evict/restore cycle that the kernel seems to do constantly. Thi=
s bug has one annoying side-effect, regular user level reboot will hang req=
uiring to use power button to shut down the device. (echo b &gt;/proc/sysrq=
-trigger works sometimes)</div><div><br></div><div>Anyway, I have managed t=
o get the gfx1010 to also stay stable and finish the benchmarks if I do a s=
imilar type of fix/workaround that prevents the queue remove/restore to hap=
pen on evict and restore methods.<br></div><div><br></div><div>It may or ma=
y not be in reality a firmware bug, hard to debug as I do not access to fir=
mware code. But I think this should be fixed somehow anyway. (Kernel has to=
ns of workaround anyway for other broken firmware and hw problems)<br></div=
><div><br></div><div>I can however try to approach this in some other way a=
lso, would you have any suggestion? I have played with the recent AMD gpu k=
ernel driver stack for a couple of days, so I probably miss something but h=
ere are 2 observations/questions I have in my mind?<br></div><div><br></div=
><div>1) Is it really necessary to evict/restore the queues also on firmwar=
e until they really need to be deleted more permanently? I mean would it be=
 just enough to mark queues disabled/enabled in kernel-structure when pre-e=
mption happens?<br></div><div><br></div><div>2) dqm_lock that is used to pr=
otect the queue-lists that are removed/restored uses memalloc_noreclaim_sav=
e/restore calls that according to documentation can easily cause problems i=
f there happens some fs calls or recursions. Could the userspace be able to=
 trigger that problem by using some amdgpu specific sysfs interface calls. =
Or can the MES firmware somehow call back to kernel functions that cause re=
cursive loop while performing the queue remove method calls?</div><div><br>=
</div><div>Below is the gfx1010 dmesg with added trace calls that reveals k=
ernel problems with queues while using that device.</div><div>I have again =
added some extra strace to to print out the function name when its started =
and what is the caller method.<br></div><div><br></div><div>884.437695] amd=
gpu: kgd2kfd_quiesce_mm called by amdgpu_amdkfd_evict_userptr<br>[ =C2=A088=
4.437704] amdgpu: evict_process_queues_cpsch started<br>[ =C2=A0884.443511]=
 amdgpu: kgd2kfd_resume_mm called by amdgpu_amdkfd_restore_userptr_worker<b=
r>[ =C2=A0884.443520] amdgpu: restore_process_queues_cpsch started<br>[ =C2=
=A0907.375917] amdgpu: evict_process_queues_cpsch started<br>[ =C2=A0907.37=
5981] amdgpu: evict_process_worker Finished evicting pasid 0x8005<br>[ =C2=
=A0907.483535] amdgpu: restore_process_queues_cpsch started<br>[ =C2=A0909.=
013279] amdgpu: kgd2kfd_quiesce_mm called by svm_range_evict<br>[ =C2=A0909=
.013286] amdgpu: evict_process_queues_cpsch started<br>[ =C2=A0909.033675] =
amdgpu: kgd2kfd_quiesce_mm called by amdgpu_amdkfd_evict_userptr<br>[ =C2=
=A0909.033681] amdgpu: evict_process_queues_cpsch started<br>[ =C2=A0909.05=
9674] amdgpu: kgd2kfd_resume_mm called by amdgpu_amdkfd_restore_userptr_wor=
ker<br>[ =C2=A0909.059680] amdgpu: restore_process_queues_cpsch started<br>=
[ =C2=A0909.082565] amdgpu: kgd2kfd_quiesce_mm called by amdgpu_amdkfd_evic=
t_userptr<br>[ =C2=A0909.082572] amdgpu: evict_process_queues_cpsch started=
<br>[ =C2=A0909.295184] amdgpu: kgd2kfd_resume_mm called by amdgpu_amdkfd_r=
estore_userptr_worker<br>[ =C2=A0909.295190] amdgpu: restore_process_queues=
_cpsch started<br>[ =C2=A0909.608840] amdgpu: kgd2kfd_resume_mm called by s=
vm_range_restore_work<br>[ =C2=A0909.608846] amdgpu: restore_process_queues=
_cpsch started<br>[ =C2=A0966.354867] amdgpu: kgd2kfd_quiesce_mm called by =
amdgpu_amdkfd_evict_userptr<br>[ =C2=A0966.354876] amdgpu: evict_process_qu=
eues_cpsch started<br>[ =C2=A0966.361293] amdgpu: kgd2kfd_resume_mm called =
by amdgpu_amdkfd_restore_userptr_worker<br>[ =C2=A0966.361303] amdgpu: rest=
ore_process_queues_cpsch started<br>[ =C2=A0984.457200] amdgpu: evict_proce=
ss_queues_cpsch started<br>[ =C2=A0984.457261] amdgpu: evict_process_worker=
 Finished evicting pasid 0x8005<br>[ =C2=A0984.562403] amdgpu: restore_proc=
ess_queues_cpsch started<br>[ =C2=A0984.628620] amdgpu: kgd2kfd_quiesce_mm =
called by svm_range_evict<br>[ =C2=A0984.628627] amdgpu: evict_process_queu=
es_cpsch started<br>[ =C2=A0984.650436] amdgpu: kgd2kfd_quiesce_mm called b=
y amdgpu_amdkfd_evict_userptr<br>[ =C2=A0984.650443] amdgpu: evict_process_=
queues_cpsch started<br>[ =C2=A0984.718544] amdgpu: kgd2kfd_resume_mm calle=
d by amdgpu_amdkfd_restore_userptr_worker<br>[ =C2=A0984.718550] amdgpu: re=
store_process_queues_cpsch started<br>[ =C2=A0984.738360] amdgpu: kgd2kfd_q=
uiesce_mm called by amdgpu_amdkfd_evict_userptr<br>[ =C2=A0984.738367] amdg=
pu: evict_process_queues_cpsch started<br>[ =C2=A0984.765031] amdgpu: kgd2k=
fd_resume_mm called by amdgpu_amdkfd_restore_userptr_worker<br>[ =C2=A0984.=
765038] amdgpu: restore_process_queues_cpsch started<br>[ =C2=A0984.785180]=
 amdgpu: kgd2kfd_quiesce_mm called by amdgpu_amdkfd_evict_userptr<br>[ =C2=
=A0984.785187] amdgpu: evict_process_queues_cpsch started<br>[ =C2=A0984.90=
7430] amdgpu: kgd2kfd_resume_mm called by amdgpu_amdkfd_restore_userptr_wor=
ker<br>[ =C2=A0984.907435] amdgpu: restore_process_queues_cpsch started<br>=
[ =C2=A0984.930399] amdgpu: kgd2kfd_quiesce_mm called by amdgpu_amdkfd_evic=
t_userptr<br>[ =C2=A0984.930405] amdgpu: evict_process_queues_cpsch started=
<br>[ =C2=A0984.956551] amdgpu: kgd2kfd_resume_mm called by amdgpu_amdkfd_r=
estore_userptr_worker<br>[ =C2=A0984.956561] amdgpu: restore_process_queues=
_cpsch started<br>[ =C2=A0985.288614] amdgpu: kgd2kfd_resume_mm called by s=
vm_range_restore_work<br>[ =C2=A0985.288621] amdgpu: restore_process_queues=
_cpsch started<br>[ =C2=A0998.410978] amdgpu: evict_process_queues_cpsch st=
arted<br>[ =C2=A0998.411041] amdgpu: evict_process_worker Finished evicting=
 pasid 0x8005<br>[ =C2=A0998.513922] amdgpu: restore_process_queues_cpsch s=
tarted<br>[ =C2=A0998.531861] amdgpu: kgd2kfd_quiesce_mm called by svm_rang=
e_evict<br>[ =C2=A0998.531867] amdgpu: evict_process_queues_cpsch started<b=
r>[ =C2=A0998.553650] amdgpu: kgd2kfd_quiesce_mm called by amdgpu_amdkfd_ev=
ict_userptr<br>[ =C2=A0998.553656] amdgpu: evict_process_queues_cpsch start=
ed<br>[ =C2=A0998.581235] amdgpu: kgd2kfd_resume_mm called by amdgpu_amdkfd=
_restore_userptr_worker<br>[ =C2=A0998.581241] amdgpu: restore_process_queu=
es_cpsch started<br>[ =C2=A0998.607168] amdgpu: kgd2kfd_quiesce_mm called b=
y amdgpu_amdkfd_evict_userptr<br>[ =C2=A0998.607174] amdgpu: evict_process_=
queues_cpsch started<br>[ =C2=A0998.700499] amdgpu: kgd2kfd_resume_mm calle=
d by amdgpu_amdkfd_restore_userptr_worker<br>[ =C2=A0998.700506] amdgpu: re=
store_process_queues_cpsch started<br>[ =C2=A0998.718179] amdgpu: kgd2kfd_q=
uiesce_mm called by amdgpu_amdkfd_evict_userptr<br>[ =C2=A0998.718187] amdg=
pu: evict_process_queues_cpsch started<br>[ =C2=A0998.810595] amdgpu: kgd2k=
fd_resume_mm called by amdgpu_amdkfd_restore_userptr_worker<br>[ =C2=A0998.=
810603] amdgpu: restore_process_queues_cpsch started<br>[ =C2=A0998.831776]=
 amdgpu: kgd2kfd_quiesce_mm called by amdgpu_amdkfd_evict_userptr<br>[ =C2=
=A0998.831782] amdgpu: evict_process_queues_cpsch started<br>[ =C2=A0998.85=
8199] amdgpu: kgd2kfd_resume_mm called by amdgpu_amdkfd_restore_userptr_wor=
ker<br>[ =C2=A0998.858205] amdgpu: restore_process_queues_cpsch started<br>=
[ =C2=A0998.880604] amdgpu: kgd2kfd_quiesce_mm called by amdgpu_amdkfd_evic=
t_userptr<br>[ =C2=A0998.880611] amdgpu: evict_process_queues_cpsch started=
<br>[ =C2=A0998.912335] amdgpu: kgd2kfd_resume_mm called by amdgpu_amdkfd_r=
estore_userptr_worker<br>[ =C2=A0998.912343] amdgpu: restore_process_queues=
_cpsch started<br>[ =C2=A0999.237449] amdgpu: kgd2kfd_resume_mm called by s=
vm_range_restore_work<br>[ =C2=A0999.237455] amdgpu: restore_process_queues=
_cpsch started<br>[ 1058.513361] amdgpu: kgd2kfd_quiesce_mm called by amdgp=
u_amdkfd_evict_userptr<br>[ 1058.513373] amdgpu: evict_process_queues_cpsch=
 started<br>[ 1062.513487] amdgpu 0000:03:00.0: amdgpu: Queue preemption fa=
iled for queue with doorbell_id: 80004008<br>[ 1062.513500] amdgpu 0000:03:=
00.0: amdgpu: Failed to evict process queue 0, caller: kgd2kfd_quiesce_mm<b=
r>[ 1062.513503] amdgpu: Failed to quiesce KFD<br>[ 1062.513551] amdgpu 000=
0:03:00.0: amdgpu: GPU reset begin!<br>[ 1062.513628] amdgpu: evict_process=
_queues_cpsch started<br>[ 1062.513694] amdgpu 0000:03:00.0: amdgpu: Dumpin=
g IP State<br>[ 1062.517229] amdgpu 0000:03:00.0: amdgpu: Dumping IP State =
Completed<br>[ 1062.866910] amdgpu 0000:03:00.0: [drm:amdgpu_ring_test_help=
er [amdgpu]] *ERROR* ring kiq_0.2.1.0 test failed (-110)<br>[ 1062.867435] =
[drm:gfx_v10_0_hw_fini [amdgpu]] *ERROR* KCQ disable failed<br>[ 1062.91507=
5] amdgpu 0000:03:00.0: amdgpu: BACO reset<br>[ 1062.937902] amdgpu: kgd2kf=
d_quiesce_mm called by svm_range_evict<br>[ 1062.937907] amdgpu: evict_proc=
ess_queues_cpsch started</div><div><br></div><br><div><br></div></div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Nov 27, 2024 at 3:50=E2=80=AFPM Felix Kuehling &lt;<a hr=
ef=3D"mailto:felix.kuehling@amd.com">felix.kuehling@amd.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2024-11-27 06:51, Christian K=C3=B6nig wrote:<br>
&gt; Am 27.11.24 um 12:46 schrieb Mika Laitio:<br>
&gt;&gt; AMD gfx1103 / M780 iGPU will crash eventually when used for<br>
&gt;&gt; pytorch ML/AI operations on rocm sdk stack. After kernel error<br>
&gt;&gt; the application exits on error and linux desktop can itself<br>
&gt;&gt; sometimes either freeze or reset back to login screen.<br>
&gt;&gt;<br>
&gt;&gt; Error will happen randomly when kernel calls <br>
&gt;&gt; evict_process_queues_cpsch and<br>
&gt;&gt; restore_process_queues_cpsch methods to remove and restore the que=
ues<br>
&gt;&gt; that has been created earlier.<br>
&gt;&gt;<br>
&gt;&gt; The fix is to remove the evict and restore calls when device used =
is<br>
&gt;&gt; iGPU. The queues that has been added during the user space <br>
&gt;&gt; application execution<br>
&gt;&gt; time will still be removed when the application exits<br>
&gt;<br>
&gt; As far as I can see that is absolutely not a fix but rather a <br>
&gt; obviously broken workaround.<br>
&gt;<br>
&gt; Evicting and restoring queues is usually mandatory for correct operati=
on.<br>
&gt;<br>
&gt; So just ignore that this doesn&#39;t work will just is not something y=
ou <br>
&gt; can do.<br>
<br>
I agree. Eviction happens for example in MMU notifiers where we need to <br=
>
assure the kernel that memory won&#39;t be accessed by the GPU once the <br=
>
notifier returns, until the memory mappings in the GPU page tables can <br>
be revalidated.<br>
<br>
This looks like a crude workaround for an MES firmware problem or some <br>
other kind of intermittent hang that needs to be root-caused. It&#39;s a <b=
r>
NACK from me as well.<br>
<br>
Regards,<br>
=C2=A0=C2=A0 Felix<br>
<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Christian.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; On evety test attempts the crash has always happened on the<br>
&gt;&gt; same location while removing the 2nd queue of 3 with doorbell id 0=
x1002.<br>
&gt;&gt;<br>
&gt;&gt; Below is the trace captured by adding more printouts to problem<br=
>
&gt;&gt; location to print message also when the queue is evicted or resror=
ed<br>
&gt;&gt; succesfully.<br>
&gt;&gt;<br>
&gt;&gt; [=C2=A0 948.324174] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes add=
ed <br>
&gt;&gt; hardware queue to MES, doorbell=3D0x1202, queue: 2, caller: <br>
&gt;&gt; restore_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 948.334344] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes add=
ed <br>
&gt;&gt; hardware queue to MES, doorbell=3D0x1002, queue: 1, caller: <br>
&gt;&gt; restore_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 948.344499] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes add=
ed <br>
&gt;&gt; hardware queue to MES, doorbell=3D0x1000, queue: 0, caller: <br>
&gt;&gt; restore_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 952.380614] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes =
removed <br>
&gt;&gt; hardware queue from MES, doorbell=3D0x1202, queue: 2, caller: <br>
&gt;&gt; evict_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 952.391330] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes =
removed <br>
&gt;&gt; hardware queue from MES, doorbell=3D0x1002, queue: 1, caller: <br>
&gt;&gt; evict_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 952.401634] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes =
removed <br>
&gt;&gt; hardware queue from MES, doorbell=3D0x1000, queue: 0, caller: <br>
&gt;&gt; evict_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 952.414507] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes add=
ed <br>
&gt;&gt; hardware queue to MES, doorbell=3D0x1202, queue: 2, caller: <br>
&gt;&gt; restore_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 952.424618] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes add=
ed <br>
&gt;&gt; hardware queue to MES, doorbell=3D0x1002, queue: 1, caller: <br>
&gt;&gt; restore_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 952.434922] amdgpu 0000:c4:00.0: amdgpu: add_queue_mes add=
ed <br>
&gt;&gt; hardware queue to MES, doorbell=3D0x1000, queue: 0, caller: <br>
&gt;&gt; restore_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 952.446272] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes =
removed <br>
&gt;&gt; hardware queue from MES, doorbell=3D0x1202, queue: 2, caller: <br>
&gt;&gt; evict_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 954.460341] amdgpu 0000:c4:00.0: amdgpu: MES failed to res=
pond to <br>
&gt;&gt; msg=3DREMOVE_QUEUE<br>
&gt;&gt; [=C2=A0 954.460356] amdgpu 0000:c4:00.0: amdgpu: remove_queue_mes =
failed <br>
&gt;&gt; to remove hardware queue from MES, doorbell=3D0x1002, queue: 1, ca=
ller: <br>
&gt;&gt; evict_process_queues_cpsch<br>
&gt;&gt; [=C2=A0 954.460360] amdgpu 0000:c4:00.0: amdgpu: MES might be in <=
br>
&gt;&gt; unrecoverable state, issue a GPU reset<br>
&gt;&gt; [=C2=A0 954.460366] amdgpu 0000:c4:00.0: amdgpu: Failed to evict q=
ueue 1<br>
&gt;&gt; [=C2=A0 954.460368] amdgpu 0000:c4:00.0: amdgpu: Failed to evict p=
rocess <br>
&gt;&gt; queues<br>
&gt;&gt; [=C2=A0 954.460439] amdgpu 0000:c4:00.0: amdgpu: GPU reset begin!<=
br>
&gt;&gt; [=C2=A0 954.460464] amdgpu 0000:c4:00.0: amdgpu: remove_all_queues=
_mes: <br>
&gt;&gt; Failed to remove queue 0 for dev 5257<br>
&gt;&gt; [=C2=A0 954.460515] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State<=
br>
&gt;&gt; [=C2=A0 954.462637] amdgpu 0000:c4:00.0: amdgpu: Dumping IP State =
Completed<br>
&gt;&gt; [=C2=A0 955.865591] amdgpu: process_termination_cpsch started<br>
&gt;&gt; [=C2=A0 955.866432] amdgpu: process_termination_cpsch started<br>
&gt;&gt; [=C2=A0 955.866445] amdgpu 0000:c4:00.0: amdgpu: Failed to remove =
queue 0<br>
&gt;&gt; [=C2=A0 956.503043] amdgpu 0000:c4:00.0: amdgpu: MES failed to res=
pond to <br>
&gt;&gt; msg=3DREMOVE_QUEUE<br>
&gt;&gt; [=C2=A0 956.503059] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *=
ERROR* <br>
&gt;&gt; failed to unmap legacy queue<br>
&gt;&gt; [=C2=A0 958.507491] amdgpu 0000:c4:00.0: amdgpu: MES failed to res=
pond to <br>
&gt;&gt; msg=3DREMOVE_QUEUE<br>
&gt;&gt; [=C2=A0 958.507507] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *=
ERROR* <br>
&gt;&gt; failed to unmap legacy queue<br>
&gt;&gt; [=C2=A0 960.512077] amdgpu 0000:c4:00.0: amdgpu: MES failed to res=
pond to <br>
&gt;&gt; msg=3DREMOVE_QUEUE<br>
&gt;&gt; [=C2=A0 960.512093] [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *=
ERROR* <br>
&gt;&gt; failed to unmap legacy queue<br>
&gt;&gt; [=C2=A0 960.785816] [drm:gfx_v11_0_hw_fini [amdgpu]] *ERROR* faile=
d to <br>
&gt;&gt; halt cp gfx<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Mika Laitio &lt;<a href=3D"mailto:lamikr@gmail.com"=
 target=3D"_blank">lamikr@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0 .../drm/amd/amdkfd/kfd_device_queue_manager.c | 24 ++++++++=
++++-------<br>
&gt;&gt; =C2=A0 1 file changed, 16 insertions(+), 8 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c=
 <br>
&gt;&gt; b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c<br>
&gt;&gt; index c79fe9069e22..96088d480e09 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c<br>
&gt;&gt; @@ -1187,9 +1187,12 @@ static int evict_process_queues_cpsch(struc=
t <br>
&gt;&gt; device_queue_manager *dqm,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct kfd_process_device *pdd;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int retval =3D 0;<br>
&gt;&gt; =C2=A0 +=C2=A0=C2=A0=C2=A0 // gfx1103 APU can fail to remove queue=
 on evict/restore cycle<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (dqm-&gt;dev-&gt;adev-&gt;flags &amp; AMD_I=
S_APU)<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dqm_lock(dqm);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (qpd-&gt;evicted++ &gt; 0) /* al=
ready evicted, do nothing */<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unlock;<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdd =3D qpd_to_pdd(qpd);<br>
&gt;&gt; =C2=A0 @@ -1198,7 +1201,7 @@ static int evict_process_queues_cpsch=
(struct <br>
&gt;&gt; device_queue_manager *dqm,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Skip queue eviction on proc=
ess eviction.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pdd-&gt;drm_priv)<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unlock;<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_debug_ratelimited(&quot;E=
victing PASID 0x%x queues\n&quot;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdd-&gt;process-&gt;pasid);<br>
&gt;&gt; @@ -1219,7 +1222,7 @@ static int evict_process_queues_cpsch(struct=
 <br>
&gt;&gt; device_queue_manager *dqm,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (retval) {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, &quot;Failed to evict que=
ue %d\n&quot;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q-&gt;properti=
es.queue_id);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unlock;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; @@ -1231,8 +1234,9 @@ static int evict_process_queues_cpsch(struct=
 <br>
&gt;&gt; device_queue_manager *dqm,<br>
&gt;&gt; KFD_UNMAP_QUEUES_FILTER_DYNAMIC_QUEUES, 0,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 USE_DEFAULT_GRACE_PERIOD);<br>
&gt;&gt; =C2=A0 -out:<br>
&gt;&gt; +out_unlock:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dqm_unlock(dqm);<br>
&gt;&gt; +out:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return retval;<br>
&gt;&gt; =C2=A0 }<br>
&gt;&gt; =C2=A0 @@ -1326,14 +1330,17 @@ static int <br>
&gt;&gt; restore_process_queues_cpsch(struct device_queue_manager *dqm,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t eviction_duration;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int retval =3D 0;<br>
&gt;&gt; =C2=A0 +=C2=A0=C2=A0=C2=A0 // gfx1103 APU can fail to remove queue=
 on evict/restore cycle<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 if (dqm-&gt;dev-&gt;adev-&gt;flags &amp; AMD_I=
S_APU)<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pdd =3D qpd_to_pdd(qpd);<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dqm_lock(dqm);<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (WARN_ON_ONCE(!qpd-&gt;evicted))=
 /* already restored, do <br>
&gt;&gt; nothing */<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unlock;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (qpd-&gt;evicted &gt; 1) { /* re=
f count still &gt; 0, decrement &amp; <br>
&gt;&gt; quit */<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qpd-&gt;evi=
cted--;<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unlock;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The debugger creates proc=
esses that temporarily have not <br>
&gt;&gt; acquired<br>
&gt;&gt; @@ -1364,7 +1371,7 @@ static int restore_process_queues_cpsch(stru=
ct <br>
&gt;&gt; device_queue_manager *dqm,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if (retval) {<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, &quot;Failed to restore q=
ueue %d\n&quot;,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q-&gt;properti=
es.queue_id);<br>
&gt;&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out_unlock;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;&gt; @@ -1375,8 +1382,9 @@ static int restore_process_queues_cpsch(stru=
ct <br>
&gt;&gt; device_queue_manager *dqm,<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic64_add(eviction_duration, &am=
p;pdd-&gt;evict_duration_counter);<br>
&gt;&gt; =C2=A0 vm_not_acquired:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qpd-&gt;evicted =3D 0;<br>
&gt;&gt; -out:<br>
&gt;&gt; +out_unlock:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dqm_unlock(dqm);<br>
&gt;&gt; +out:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return retval;<br>
&gt;&gt; =C2=A0 }<br>
&gt;<br>
</blockquote></div>

--00000000000080a51206280447f8--
