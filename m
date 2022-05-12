Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C29525719
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 23:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA8610FA54;
	Thu, 12 May 2022 21:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A84C10FA3A;
 Thu, 12 May 2022 21:35:19 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id n24so7964162oie.12;
 Thu, 12 May 2022 14:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L5gv5Zb+MG8CuatNP0ouXOadYIejwOdoGFvDvbrOIzo=;
 b=Mnnzx325vu+wZAbGOyNrt6ZNXH3D0D7R/peML/FhypZsL+jQtnVs71QMOgyo+bnu2Y
 xuQkknGOub5R9srngOk2Qhz4PRXGCmVYjBw+uUMkoz5KntyTf9AGpv819qufMqTYVDjf
 susF6oaB477hy1Cn1xrTibPT/2d1OPYpAv/d8sVHQINHzxQb9UA/tJOYx+BZ9gAKN0/D
 yY9yQmQdfJIl1z6o4w2kzu7PAK3WI6E6wdAXECfdNR8Uwg77INIsSr/jOPOnYhwsWVWO
 DeYbKhSdQYFKqXjEp8r7zXgWiMTWFaC2X0v9qrCWnkJw27oqlnfwCnzq6lpv3SPravs+
 SLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L5gv5Zb+MG8CuatNP0ouXOadYIejwOdoGFvDvbrOIzo=;
 b=BFuvrNR4i1NSOl563fszKaNfD8L5vzal8Z8XtCARxx2iK1p8R3IveWFFl8xHMfd4EE
 G4PlOTFUI7Ah+4YWeFmuhdzQ9V8UlNzHxt7O/PClxH1J16j/s203hBRcuz3YQbH2NANj
 ctiYA41X5qdi0sgzD3KC6fnuShRHw8lu7mmvPgJ/aRn5puYNinDxoCNJ1gBtRCAfA/lH
 JPzSgOcmOuY7tC9MbUS+k48EzgKMpAqN2HssLY8bQtuP3A+UIKPgFGQqn+wvNmcrKfwU
 Dutl+EVQ3d3zAyyq6Kwih4xvSJiZKiVXmhWy9K/0qhznTYvV8jTbUMBPZwMlRtw9V5Wx
 dRhA==
X-Gm-Message-State: AOAM53161CyphcJ6VmDMyIyjnFTv4bYRV+UuU9ZmbGh8X1Opm7XeAYtt
 5+gjrFwYvuPuyKeDnEnzvuRUxnm4zRCqZwE8A3I=
X-Google-Smtp-Source: ABdhPJzb6OhsK7vyvPOnIJUX1g24rMfIVIS0yEtjLigtiyDB306cUEPSul1zhs7UqvlyrHy3asXAZijY3F/Dkws7zZw=
X-Received: by 2002:a05:6808:178d:b0:326:3fe9:7f03 with SMTP id
 bg13-20020a056808178d00b003263fe97f03mr5876066oib.200.1652391318641; Thu, 12
 May 2022 14:35:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220512204533.3924-1-hdegoede@redhat.com>
In-Reply-To: <20220512204533.3924-1-hdegoede@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 May 2022 17:35:07 -0400
Message-ID: <CADnq5_NNxaZoyJnLBHX5ijTVm7MSfgXBrfpnXQpga+k9xp6R8g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Move mutex_init(&smu->message_lock) to
 smu_early_init()
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, May 12, 2022 at 4:45 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Lockdep complains about the smu->message_lock mutex being used before
> it is initialized through the following call path:
>
> amdgpu_device_init()
>  amdgpu_dpm_mode2_reset()
>   smu_mode2_reset()
>    smu_v12_0_mode2_reset()
>     smu_cmn_send_smc_msg_with_param()
>
> Move the mutex_init() call to smu_early_init() to fix the mutex being
> used before it is initialized.
>
> This fixes the following lockdep splat:
>
> [    3.867331] ------------[ cut here ]------------
> [    3.867335] fbcon: Taking over console
> [    3.867338] DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> [    3.867340] WARNING: CPU: 14 PID: 491 at kernel/locking/mutex.c:579 __=
mutex_lock+0x44c/0x830
> [    3.867349] Modules linked in: amdgpu(+) crct10dif_pclmul drm_ttm_help=
er crc32_pclmul ttm crc32c_intel ghash_clmulni_intel hid_lg_g15 iommu_v2 sp=
5100_tco nvme gpu_sched drm_dp_helper nvme_core ccp wmi video hid_logitech_=
dj ip6_tables ip_tables ipmi_devintf ipmi_msghandler fuse i2c_dev
> [    3.867363] CPU: 14 PID: 491 Comm: systemd-udevd Tainted: G          I=
       5.18.0-rc5+ #33
> [    3.867366] Hardware name: Micro-Star International Co., Ltd. MS-7C95/=
B550M PRO-VDH WIFI (MS-7C95), BIOS 2.90 12/23/2021
> [    3.867369] RIP: 0010:__mutex_lock+0x44c/0x830
> [    3.867372] Code: ff 85 c0 0f 84 33 fc ff ff 8b 0d b7 50 25 01 85 c9 0=
f 85 25 fc ff ff 48 c7 c6 fb 41 82 99 48 c7 c7 6b 63 80 99 e8 88 2a f8 ff <=
0f> 0b e9 0b fc ff ff f6 83 b9 0c 00 00 01 0f 85 64 ff ff ff 4c 89
> [    3.867377] RSP: 0018:ffffaef8c0fc79f0 EFLAGS: 00010286
> [    3.867380] RAX: 0000000000000028 RBX: 0000000000000000 RCX: 000000000=
0000027
> [    3.867382] RDX: ffff9ccc0dda0928 RSI: 0000000000000001 RDI: ffff9ccc0=
dda0920
> [    3.867384] RBP: ffffaef8c0fc7a80 R08: 0000000000000000 R09: ffffaef8c=
0fc7820
> [    3.867386] R10: 0000000000000003 R11: ffff9ccc2a2fffe8 R12: 000000000=
0000002
> [    3.867388] R13: ffff9cc990808058 R14: 0000000000000000 R15: ffff9cc98=
bfc0000
> [    3.867390] FS:  00007fc4d830f580(0000) GS:ffff9ccc0dd80000(0000) knlG=
S:0000000000000000
> [    3.867394] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.867396] CR2: 0000560a77031410 CR3: 000000010f522000 CR4: 000000000=
0750ee0
> [    3.867398] PKRU: 55555554
> [    3.867399] Call Trace:
> [    3.867401]  <TASK>
> [    3.867403]  ? smu_cmn_send_smc_msg_with_param+0x98/0x240 [amdgpu]
> [    3.867533]  ? __mutex_lock+0x90/0x830
> [    3.867535]  ? amdgpu_dpm_mode2_reset+0x37/0x60 [amdgpu]
> [    3.867653]  ? smu_cmn_send_smc_msg_with_param+0x98/0x240 [amdgpu]
> [    3.867758]  smu_cmn_send_smc_msg_with_param+0x98/0x240 [amdgpu]
> [    3.867857]  smu_mode2_reset+0x2b/0x50 [amdgpu]
> [    3.867953]  amdgpu_dpm_mode2_reset+0x46/0x60 [amdgpu]
> [    3.868096]  amdgpu_device_init.cold+0x1069/0x1e78 [amdgpu]
> [    3.868219]  ? _raw_spin_unlock_irqrestore+0x30/0x50
> [    3.868222]  ? pci_conf1_read+0x9b/0xf0
> [    3.868226]  amdgpu_driver_load_kms+0x15/0x110 [amdgpu]
> [    3.868314]  amdgpu_pci_probe+0x1a9/0x3c0 [amdgpu]
> [    3.868398]  local_pci_probe+0x41/0x80
> [    3.868401]  pci_device_probe+0xab/0x200
> [    3.868404]  really_probe+0x1a1/0x370
> [    3.868407]  __driver_probe_device+0xfc/0x170
> [    3.868410]  driver_probe_device+0x1f/0x90
> [    3.868412]  __driver_attach+0xbf/0x1a0
> [    3.868414]  ? __device_attach_driver+0xe0/0xe0
> [    3.868416]  bus_for_each_dev+0x65/0x90
> [    3.868419]  bus_add_driver+0x151/0x1f0
> [    3.868421]  driver_register+0x89/0xd0
> [    3.868423]  ? 0xffffffffc0bd4000
> [    3.868425]  do_one_initcall+0x5d/0x300
> [    3.868428]  ? do_init_module+0x22/0x240
> [    3.868431]  ? rcu_read_lock_sched_held+0x3c/0x70
> [    3.868434]  ? trace_kmalloc+0x30/0xe0
> [    3.868437]  ? kmem_cache_alloc_trace+0x1e6/0x3a0
> [    3.868440]  do_init_module+0x4a/0x240
> [    3.868442]  __do_sys_finit_module+0x93/0xf0
> [    3.868446]  do_syscall_64+0x5b/0x80
> [    3.868449]  ? rcu_read_lock_sched_held+0x3c/0x70
> [    3.868451]  ? lockdep_hardirqs_on_prepare+0xd9/0x180
> [    3.868454]  ? do_syscall_64+0x67/0x80
> [    3.868456]  ? do_syscall_64+0x67/0x80
> [    3.868458]  ? do_syscall_64+0x67/0x80
> [    3.868460]  ? do_syscall_64+0x67/0x80
> [    3.868462]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [    3.868465] RIP: 0033:0x7fc4d8ec1ced
> [    3.868467] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 4=
8 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d fb 70 0e 00 f7 d8 64 89 01 48
> [    3.868472] RSP: 002b:00007fff687ae6b8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000139
> [    3.868475] RAX: ffffffffffffffda RBX: 0000560a76fbca60 RCX: 00007fc4d=
8ec1ced
> [    3.868477] RDX: 0000000000000000 RSI: 00007fc4d902343c RDI: 000000000=
0000011
> [    3.868479] RBP: 00007fc4d902343c R08: 0000000000000000 R09: 0000560a7=
6fb59c0
> [    3.868481] R10: 0000000000000011 R11: 0000000000000246 R12: 000000000=
0020000
> [    3.868484] R13: 0000560a76f8bfd0 R14: 0000000000000000 R15: 0000560a7=
6fc2d10
> [    3.868487]  </TASK>
> [    3.868489] irq event stamp: 120617
> [    3.868490] hardirqs last  enabled at (120617): [<ffffffff9817169e>] _=
_up_console_sem+0x5e/0x70
> [    3.868494] hardirqs last disabled at (120616): [<ffffffff98171683>] _=
_up_console_sem+0x43/0x70
> [    3.868497] softirqs last  enabled at (119684): [<ffffffff980ee83a>] _=
_irq_exit_rcu+0xca/0x100
> [    3.868501] softirqs last disabled at (119679): [<ffffffff980ee83a>] _=
_irq_exit_rcu+0xca/0x100
> [    3.868504] ---[ end trace 0000000000000000 ]---
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/=
amd/pm/swsmu/amdgpu_smu.c
> index f1544755d8b4..a44a6f41fa1e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -576,6 +576,8 @@ static int smu_early_init(void *handle)
>         smu->smu_baco.platform_support =3D false;
>         smu->user_dpm_profile.fan_mode =3D -1;
>
> +       mutex_init(&smu->message_lock);
> +
>         adev->powerplay.pp_handle =3D smu;
>         adev->powerplay.pp_funcs =3D &swsmu_pm_funcs;
>
> @@ -975,8 +977,6 @@ static int smu_sw_init(void *handle)
>         bitmap_zero(smu->smu_feature.supported, SMU_FEATURE_MAX);
>         bitmap_zero(smu->smu_feature.allowed, SMU_FEATURE_MAX);
>
> -       mutex_init(&smu->message_lock);
> -
>         INIT_WORK(&smu->throttling_logging_work, smu_throttling_logging_w=
ork_fn);
>         INIT_WORK(&smu->interrupt_work, smu_interrupt_work_fn);
>         atomic64_set(&smu->throttle_int_counter, 0);
> --
> 2.36.0
>
