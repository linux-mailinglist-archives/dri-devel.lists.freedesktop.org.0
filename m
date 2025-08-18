Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F486B2AB0C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 16:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975B010E456;
	Mon, 18 Aug 2025 14:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fwxu9Egd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B0110E1E5;
 Mon, 18 Aug 2025 14:41:01 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b4717553e58so208317a12.2; 
 Mon, 18 Aug 2025 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755528061; x=1756132861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ga7x4F6HXFvk/iDnErF+LYjvyTvsTBsxWHavwkOdolE=;
 b=Fwxu9EgdWPECFvaR9xano04S0N82o9wzWUeEK/EzIBarTsA+NpCpkzqZnV3UU1Q3qS
 DvUm6wZ6tK3cnofUswpcKTPJvaJQ8vWTW1qqdgs3Rh4bpfqJq5EVYlrw8GDQPwoP9SHg
 pQaryXBz1+jT4n18y625QtuAnx89SoMFmorDUlmwuB5M4P6wH4KinyfGKsaTI+xrckAN
 h8qFODbm7nR4Uz+Q7vKDZULXRtdW9RFvZhtEwvliVTD2YIBRFjvNu8ohDc7oNcWWoJQP
 RZEasxCgP5STNQUD8IFWMS0xj+lboVxPlJEWxESBUxw0ofgaK9yUQqoG3+L88uKO9fXJ
 ABjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755528061; x=1756132861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ga7x4F6HXFvk/iDnErF+LYjvyTvsTBsxWHavwkOdolE=;
 b=Zi/bc21GUdyN5+VOx/4rlugytAWkGatijtFrCxEdxQGK7FlLlnS8uFSTB/CIDJaPMg
 XT2qF0IdYEjGx3iitfAFJjLJCH7/zGyeshbuyA9XLXGCh4wyiU1MUoO3BaNxyXSDA8qU
 9y3S3zjYwGB582MpQtBrLQboXv+gITU0hvWm0d6YQB5g22NeQxvHxN5K+hT9602ElO5K
 p3WZJkXwjIF0qEefF2owNvhNBHMEoyL0/CJFPGN9ztYQfmD3+GkEMeU/obbnK5cswVkF
 ARerDsINrm8g4PchM1Innz20tJ2jLfdX2CwyUCBDAewraxEzIEUI7dRDhRPVcWInGftW
 l5tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQssxe4NfAaesKBNhfNZRfeYfYKmNeU2Rwj1GpcEEcWVQgMVXdtWvU6wUcLvVs2u91qx7J0Pyq@lists.freedesktop.org,
 AJvYcCXSiRRanxTfrdsaznnFBmVLQH/xDGohSD1J0OnaL/HU8bqaqdyMFM4llcT/wYz5VBc+yx+2M1Oo4hto@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkVpWcbEheziyBFd6zPrzMK+XHYPCa7ycRhA9A9eRuFey5M8h5
 Ubtd5ViblknhF5OXjbwsDJ3hMAB8zxbUjTxhp8obHGLdaAzO/YWqmJoMETNEnlLqDP8piSZ1F61
 mPvBmiuUrOjpPug5jVo/gKCjJVR3HQHs=
X-Gm-Gg: ASbGncsTFT7Hunsa5aGs7b69nk1l+T6GRUM+vt4bqQm0B1bU57vTvgADxDxINpfJik9
 EQxNGctMnnTBnIEz6FN4ZvYVO3V0nFDpcBRG5s2G6nZ/lTWk5h//Q6uyP4zKGkWkCdQt8YzPmWA
 /qklSbADkhjh2kEUJGDV2EulMOZU7nVF2h39gEIGop1R7TWtsaIuxMj7fkzthtsPvUbBAhjURqA
 Cif178=
X-Google-Smtp-Source: AGHT+IFrZuHxnN6IEK2r0tU2rCISF4H6sQekXuMVPVLd12u6wT/T0WzrgzvbiXwK8pkxTScnu7v9TIQRfM72tM0NwgE=
X-Received: by 2002:a17:902:ce81:b0:240:b9c0:bc6f with SMTP id
 d9443c01a7336-2446d9b61a8mr85410995ad.10.1755528060990; Mon, 18 Aug 2025
 07:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsO+EmR0QgFGjCbq74gzwbQbb76wjt1vOOOJnsCqj9hAhg@mail.gmail.com>
In-Reply-To: <CABXGCsO+EmR0QgFGjCbq74gzwbQbb76wjt1vOOOJnsCqj9hAhg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Aug 2025 10:40:49 -0400
X-Gm-Features: Ac12FXwnCiAjxoLjrPm2Gg52sSUwUKE37VYAtOU7LySFLtZAWT--6c5O3IBbCZY
Message-ID: <CADnq5_PdzYSzFL7KDsPV7zqX2avwn-NhSJqyVVPYF9LOMEyhWg@mail.gmail.com>
Subject: Re: REGRESSION drm/amdgpu: Radeon 7900 XTX hang & gpu_sched "Trying
 to push to a killed entity" since 1f02f2044bda (6.17-rc)
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Gang.Ba@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
 Linux regressions mailing list <regressions@lists.linux.dev>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 18, 2025 at 10:32=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Hi Gang,
>
> Between commits 4b290aae788e and 89748acdf226 my Radeon 7900 XTX
> starts hanging when Steam performs shader compilation, with the
> following messages/stack trace:
>
> [ 9254.082549] kworker/u129:2 (15855) used greatest stack depth: 19656
> bytes left
> [ 9435.589185] [drm:drm_sched_entity_push_job [gpu_sched]] *ERROR*
> Trying to push to a killed entity
> [ 9435.590340] [drm:drm_sched_entity_push_job [gpu_sched]] *ERROR*
> Trying to push to a killed entity
> [ 9435.590465] [drm:drm_sched_entity_push_job [gpu_sched]] *ERROR*
> Trying to push to a killed entity
> [ 9435.590881] [drm:drm_sched_entity_push_job [gpu_sched]] *ERROR*
> Trying to push to a killed entity
> [ 9435.592513] [drm:drm_sched_entity_push_job [gpu_sched]] *ERROR*
> Trying to push to a killed entity
> [ 9435.594059] [drm:drm_sched_entity_push_job [gpu_sched]] *ERROR*
> Trying to push to a killed entity
> [ 9435.596428] [drm:drm_sched_entity_push_job [gpu_sched]] *ERROR*
> Trying to push to a killed entity
> [ 9435.597828] [drm:drm_sched_entity_push_job [gpu_sched]] *ERROR*
> Trying to push to a killed entity
> [ 9585.848993] INFO: task kworker/u132:12:18278 blocked for more than
> 122 seconds.
> [ 9585.849006]       Tainted: G             L     ------  ---
> 6.17.0-0.rc0.250801g89748acdf226.7.fc43.x86_64+debug #1
> [ 9585.849010] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message.
> [ 9585.849013] task:kworker/u132:12 state:D stack:28600 pid:18278
> tgid:18278 ppid:2      task_flags:0x4208060 flags:0x00004000
> [ 9585.849022] Workqueue: ttm ttm_bo_delayed_delete [ttm]
> [ 9585.849032] Call Trace:
> [ 9585.849034]  <TASK>
> [ 9585.849037]  __schedule+0x8d2/0x1be0
> [ 9585.849044]  ? __pfx___schedule+0x10/0x10
> [ 9585.849051]  ? __lock_release.isra.0+0x1cb/0x340
> [ 9585.849059]  schedule+0xd4/0x260
> [ 9585.849062]  schedule_timeout+0x17f/0x260
> [ 9585.849065]  ? __pfx_schedule_timeout+0x10/0x10
> [ 9585.849067]  ? find_held_lock+0x2b/0x80
> [ 9585.849074]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> [ 9585.849076]  ? trace_hardirqs_on+0x18/0x150
> [ 9585.849081]  dma_fence_default_wait+0x472/0x700
> [ 9585.849087]  ? find_held_lock+0x2b/0x80
> [ 9585.849089]  ? __pfx_dma_fence_default_wait+0x10/0x10
> [ 9585.849092]  ? __pfx_dma_fence_default_wait_cb+0x10/0x10
> [ 9585.849095]  ? mark_held_locks+0x40/0x70
> [ 9585.849098]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> [ 9585.849103]  dma_fence_wait_timeout+0x344/0x540
> [ 9585.849107]  dma_resv_wait_timeout+0xeb/0x190
> [ 9585.849111]  ? __pfx_dma_resv_wait_timeout+0x10/0x10
> [ 9585.849117]  ? rcu_is_watching+0x15/0xe0
> [ 9585.849122]  ttm_bo_delayed_delete+0x34/0x100 [ttm]
> [ 9585.849128]  process_one_work+0x87a/0x14d0
> [ 9585.849140]  ? __pfx_process_one_work+0x10/0x10
> [ 9585.849145]  ? find_held_lock+0x2b/0x80
> [ 9585.849153]  ? assign_work+0x156/0x390
> [ 9585.849161]  worker_thread+0x5f2/0xfd0
> [ 9585.849172]  ? __pfx_worker_thread+0x10/0x10
> [ 9585.849175]  kthread+0x3b0/0x770
> [ 9585.849178]  ? local_clock_noinstr+0xf/0x130
> [ 9585.849182]  ? __pfx_kthread+0x10/0x10
> [ 9585.849186]  ? rcu_is_watching+0x15/0xe0
> [ 9585.849188]  ? __pfx_kthread+0x10/0x10
> [ 9585.849192]  ret_from_fork+0x3ef/0x510
> [ 9585.849196]  ? __pfx_kthread+0x10/0x10
> [ 9585.849198]  ? __pfx_kthread+0x10/0x10
> [ 9585.849201]  ret_from_fork_asm+0x1a/0x30
> [ 9585.849210]  </TASK>
>
> I can also reproduce the same error when starting a campaign in Halo
> Infinite (without relying on Steam=E2=80=99s shader pre-cache UI), which =
made
> bisecting feasible.
>
> 1f02f2044bda1db1fd995bc35961ab075fa7b5a2 is the first bad commit
> commit 1f02f2044bda1db1fd995bc35961ab075fa7b5a2 (HEAD)
> Author: Gang Ba <Gang.Ba@amd.com>
> Date:   Tue Jul 8 14:36:13 2025 -0400
>
>     drm/amdgpu: Avoid extra evict-restore process.
>
>     If vm belongs to another process, this is fclose after fork,
>     wait may enable signaling KFD eviction fence and cause parent
> process queue evicted.
>
>     [677852.634569]  amdkfd_fence_enable_signaling+0x56/0x70 [amdgpu]
>     [677852.634814]  __dma_fence_enable_signaling+0x3e/0xe0
>     [677852.634820]  dma_fence_wait_timeout+0x3a/0x140
>     [677852.634825]  amddma_resv_wait_timeout+0x7f/0xf0 [amdkcl]
>     [677852.634831]  amdgpu_vm_wait_idle+0x2d/0x60 [amdgpu]
>     [677852.635026]  amdgpu_flush+0x34/0x50 [amdgpu]
>     [677852.635208]  filp_flush+0x38/0x90
>     [677852.635213]  filp_close+0x14/0x30
>     [677852.635216]  do_close_on_exec+0xdd/0x130
>     [677852.635221]  begin_new_exec+0x1da/0x490
>     [677852.635225]  load_elf_binary+0x307/0xea0
>     [677852.635231]  ? srso_alias_return_thunk+0x5/0xfbef5
>     [677852.635235]  ? ima_bprm_check+0xa2/0xd0
>     [677852.635240]  search_binary_handler+0xda/0x260
>     [677852.635245]  exec_binprm+0x58/0x1a0
>     [677852.635249]  bprm_execve.part.0+0x16f/0x210
>     [677852.635254]  bprm_execve+0x45/0x80
>     [677852.635257]  do_execveat_common.isra.0+0x190/0x200
>
>     Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>     Signed-off-by: Gang Ba <Gang.Ba@amd.com>
>     Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>     Cc: stable@vger.kernel.org
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> Reverting 1f02f2044bda on top of 6.17-rc2 fully eliminates the hang on
> my system.

Should be fixed in:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Daa5fc4362fac9351557eb27c745579159a2e4520

Alex

>
> Environment:
>     GPU: AMD Radeon 7900 XTX
>     Kernel: 6.17-rc2
>     Distro: Fedora Rawhide
>     Hardware probe: https://linux-hardware.org/?probe=3D99f5cf44a4
>     Kernel config and full dmesg are attached.
>
> Reproducer (two ways)
>     Launch Steam and trigger shader compilation (automatic background
> pre-cache or any action that compiles shaders).
>     Alternatively, launch Halo Infinite and start a campaign. Within a
> short time the GPU hang occurs and gpu_sched prints repeated
> *ERROR* Trying to push to a killed entity, followed by a blocked
> ttm_bo_delayed_delete worker as in the trace above.
>
> Impact / notes
>     This is a runtime GPU hang on a current RDNA3 card; the offending
> commit is CC=E2=80=99d to stable, so it would be good to fix or revert be=
fore
> it propagates.
>
> Thanks for looking into this.
>
> --
> Best Regards,
> Mike Gavrilov.
