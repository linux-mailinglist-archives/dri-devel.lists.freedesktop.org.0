Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7077065F
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 18:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A281710E73B;
	Fri,  4 Aug 2023 16:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9577B10E73B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 16:53:50 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-99c10ba30afso732122466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691168026; x=1691772826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJBmkmEh4tIQvRXOQXuVwSoqtbGfmztVlpgp70p2KyA=;
 b=Tnpvonw5h0BNNiNJ7nghxV5NJxmm7ASKEzQzAox2dNxpU2Duhw0u/f7dT75OdB1rww
 IF/z57j2lDos2JOgpRnP/1t4ZjnMw7sJjv/3rT8Nux8hcB2Y2Pe/VCZw0WflewKnK2QA
 KKG2pCluQzboijIPyp+LL335IliRzrRfthHqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691168026; x=1691772826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJBmkmEh4tIQvRXOQXuVwSoqtbGfmztVlpgp70p2KyA=;
 b=akq6V78p5od+M99abTP0jJwLOJykLaIXSdn//CMhZJhjKfHVIHoIMRmb7MiiJbY3d1
 nlDQxp5SCkls22e8tFVd6gH6BAL7hC9n0lfl11cw6h0lX7RUtBPuRMITfN5PA86p6u1o
 WGZHkN6BQzKfGRlmCZGtNO+IqEsjCpNKhZT1vzDz8CKFN2nkD/gDKxRK0Hv+fR5Lu0g2
 6/mGbVZr8U/Wr2UnUDTaXIjSekpsaG8FeN0lbM6C/DwYSWfsRGuvriEyoMLCzSSgNuMJ
 oDY9mqNMEA/G0FmQfuMuIRVUSFxOdikOX+wb6b4i/TLFHy6/gaLJDoneqoip4g/k20CG
 RNPQ==
X-Gm-Message-State: AOJu0YzHGmHl/EyF89lROQ+p3/wmrr8OgM0xY5QNntKHWLuoOssk+M6J
 ReVnIsFhyVRDxyQzaWbAhA9rqFLBvhMfRmHm/Jl7cIVj
X-Google-Smtp-Source: AGHT+IGi5xLVxCThz7LtA8y6/OTZXYvyyDZ/MnXkSQ/90kYICVtApr9HpIKUorD+8hrdGHa46ZQ23w==
X-Received: by 2002:a17:907:9687:b0:99b:fcd7:2d7a with SMTP id
 hd7-20020a170907968700b0099bfcd72d7amr258109ejc.34.1691168026726; 
 Fri, 04 Aug 2023 09:53:46 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 fx15-20020a170906b74f00b0099c157cba46sm1538976ejb.119.2023.08.04.09.53.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Aug 2023 09:53:46 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5223910acf2so467a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 09:53:45 -0700 (PDT)
X-Received: by 2002:a50:a6cf:0:b0:523:13df:297b with SMTP id
 f15-20020a50a6cf000000b0052313df297bmr2177edc.1.1691168025532; Fri, 04 Aug
 2023 09:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230803173431.48947-1-robdclark@gmail.com>
In-Reply-To: <20230803173431.48947-1-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Aug 2023 09:53:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5huQ3YxM0EMsG_3U==YdZGN9677O=-oa5+DPQPhEhiw@mail.gmail.com>
Message-ID: <CAD=FV=U5huQ3YxM0EMsG_3U==YdZGN9677O=-oa5+DPQPhEhiw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix GMU lockdep splat
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 3, 2023 at 10:34=E2=80=AFAM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> For normal GPU devfreq, we need to acquire the GMU lock while already
> holding devfreq locks.  But in the teardown path, we were calling
> dev_pm_domain_detach() while already holding the GMU lock, resulting in
> this lockdep splat:
>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>    WARNING: possible circular locking dependency detected
>    6.4.3-debug+ #3 Not tainted
>    ------------------------------------------------------
>    ring0/391 is trying to acquire lock:
>    ffffff80a025c078 (&devfreq->lock){+.+.}-{3:3}, at: qos_notifier_call+0=
x30/0x74
>
>    but task is already holding lock:
>    ffffff809b8c1ce8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocking_no=
tifier_call_chain+0x34/0x78
>
>    which lock already depends on the new lock.
>
>    the existing dependency chain (in reverse order) is:
>
>    -> #4 (&(c->notifiers)->rwsem){++++}-{3:3}:
>           down_write+0x58/0x74
>           __blocking_notifier_chain_register+0x64/0x84
>           blocking_notifier_chain_register+0x1c/0x28
>           freq_qos_add_notifier+0x5c/0x7c
>           dev_pm_qos_add_notifier+0xd4/0xf0
>           devfreq_add_device+0x42c/0x560
>           devm_devfreq_add_device+0x6c/0xb8
>           msm_devfreq_init+0xa8/0x16c [msm]
>           msm_gpu_init+0x368/0x54c [msm]
>           adreno_gpu_init+0x248/0x2b0 [msm]
>           a6xx_gpu_init+0x2d0/0x384 [msm]
>           adreno_bind+0x264/0x2bc [msm]
>           component_bind_all+0x124/0x1f4
>           msm_drm_bind+0x2d0/0x5f4 [msm]
>           try_to_bring_up_aggregate_device+0x88/0x1a4
>           __component_add+0xd4/0x128
>           component_add+0x1c/0x28
>           dp_display_probe+0x37c/0x3c0 [msm]
>           platform_probe+0x70/0xc0
>           really_probe+0x148/0x280
>           __driver_probe_device+0xfc/0x114
>           driver_probe_device+0x44/0x100
>           __device_attach_driver+0x64/0xdc
>           bus_for_each_drv+0xb0/0xd8
>           __device_attach+0xe4/0x140
>           device_initial_probe+0x1c/0x28
>           bus_probe_device+0x44/0xb0
>           deferred_probe_work_func+0xb0/0xc8
>           process_one_work+0x288/0x3d8
>           worker_thread+0x1f0/0x260
>           kthread+0xf0/0x100
>           ret_from_fork+0x10/0x20
>
>    -> #3 (dev_pm_qos_mtx){+.+.}-{3:3}:
>           __mutex_lock+0xc8/0x388
>           mutex_lock_nested+0x2c/0x38
>           dev_pm_qos_remove_notifier+0x3c/0xc8
>           genpd_remove_device+0x40/0x11c
>           genpd_dev_pm_detach+0x88/0x130
>           dev_pm_domain_detach+0x2c/0x3c
>           a6xx_gmu_remove+0x44/0xdc [msm]
>           a6xx_destroy+0x7c/0xa4 [msm]
>           adreno_unbind+0x50/0x64 [msm]
>           component_unbind+0x44/0x64
>           component_unbind_all+0xb4/0xbc
>           msm_drm_uninit.isra.0+0x124/0x17c [msm]
>           msm_drm_bind+0x340/0x5f4 [msm]
>           try_to_bring_up_aggregate_device+0x88/0x1a4
>           __component_add+0xd4/0x128
>           component_add+0x1c/0x28
>           dp_display_probe+0x37c/0x3c0 [msm]
>           platform_probe+0x70/0xc0
>           really_probe+0x148/0x280
>           __driver_probe_device+0xfc/0x114
>           driver_probe_device+0x44/0x100
>           __device_attach_driver+0x64/0xdc
>           bus_for_each_drv+0xb0/0xd8
>           __device_attach+0xe4/0x140
>           device_initial_probe+0x1c/0x28
>           bus_probe_device+0x44/0xb0
>           deferred_probe_work_func+0xb0/0xc8
>           process_one_work+0x288/0x3d8
>           worker_thread+0x1f0/0x260
>           kthread+0xf0/0x100
>           ret_from_fork+0x10/0x20
>
>    -> #2 (&a6xx_gpu->gmu.lock){+.+.}-{3:3}:
>           __mutex_lock+0xc8/0x388
>           mutex_lock_nested+0x2c/0x38
>           a6xx_gpu_set_freq+0x38/0x64 [msm]
>           msm_devfreq_target+0x170/0x18c [msm]
>           devfreq_set_target+0x90/0x1e4
>           devfreq_update_target+0xb4/0xf0
>           update_devfreq+0x1c/0x28
>           devfreq_monitor+0x3c/0x10c
>           process_one_work+0x288/0x3d8
>           worker_thread+0x1f0/0x260
>           kthread+0xf0/0x100
>           ret_from_fork+0x10/0x20
>
>    -> #1 (&df->lock){+.+.}-{3:3}:
>           __mutex_lock+0xc8/0x388
>           mutex_lock_nested+0x2c/0x38
>           msm_devfreq_get_dev_status+0x4c/0x104 [msm]
>           devfreq_simple_ondemand_func+0x5c/0x128
>           devfreq_update_target+0x68/0xf0
>           update_devfreq+0x1c/0x28
>           devfreq_monitor+0x3c/0x10c
>           process_one_work+0x288/0x3d8
>           worker_thread+0x1f0/0x260
>           kthread+0xf0/0x100
>           ret_from_fork+0x10/0x20
>
>    -> #0 (&devfreq->lock){+.+.}-{3:3}:
>           __lock_acquire+0xdf8/0x109c
>           lock_acquire+0x234/0x284
>           __mutex_lock+0xc8/0x388
>           mutex_lock_nested+0x2c/0x38
>           qos_notifier_call+0x30/0x74
>           qos_min_notifier_call+0x1c/0x28
>           notifier_call_chain+0xf4/0x114
>           blocking_notifier_call_chain+0x4c/0x78
>           pm_qos_update_target+0x184/0x190
>           freq_qos_apply+0x4c/0x64
>           apply_constraint+0xf8/0xfc
>           __dev_pm_qos_update_request+0x138/0x164
>           dev_pm_qos_update_request+0x44/0x68
>           msm_devfreq_boost+0x40/0x70 [msm]
>           msm_devfreq_active+0xc0/0xf0 [msm]
>           msm_gpu_submit+0xc8/0x12c [msm]
>           msm_job_run+0x88/0x128 [msm]
>           drm_sched_main+0x240/0x324 [gpu_sched]
>           kthread+0xf0/0x100
>           ret_from_fork+0x10/0x20
>
>    other info that might help us debug this:
>    Chain exists of:
>      &devfreq->lock --> dev_pm_qos_mtx --> &(c->notifiers)->rwsem
>     Possible unsafe locking scenario:
>           CPU0                    CPU1
>           ----                    ----
>      rlock(&(c->notifiers)->rwsem);
>                                   lock(dev_pm_qos_mtx);
>                                   lock(&(c->notifiers)->rwsem);
>      lock(&devfreq->lock);
>
>     *** DEADLOCK ***
>    4 locks held by ring0/391:
>     #0: ffffff809c811170 (&gpu->lock){+.+.}-{3:3}, at: msm_job_run+0x7c/0=
x128 [msm]
>     #1: ffffff809c811208 (&gpu->active_lock){+.+.}-{3:3}, at: msm_gpu_sub=
mit+0xa8/0x12c [msm]
>     #2: ffffffecbbb46600 (dev_pm_qos_mtx){+.+.}-{3:3}, at: dev_pm_qos_upd=
ate_request+0x38/0x68
>     #3: ffffff809b8c1ce8 (&(c->notifiers)->rwsem){++++}-{3:3}, at: blocki=
ng_notifier_call_chain+0x34/0x78
>
>    stack backtrace:
>    CPU: 6 PID: 391 Comm: ring0 Not tainted 6.4.3debug+ #3
>    Hardware name: Google Villager (rev1+) with LTE (DT)
>    Call trace:
>     dump_backtrace+0xb4/0xf0
>     show_stack+0x20/0x30
>     dump_stack_lvl+0x60/0x84
>     dump_stack+0x18/0x24
>     print_circular_bug+0x1cc/0x234
>     check_noncircular+0x78/0xac
>     __lock_acquire+0xdf8/0x109c
>     lock_acquire+0x234/0x284
>     __mutex_lock+0xc8/0x388
>     mutex_lock_nested+0x2c/0x38
>     qos_notifier_call+0x30/0x74
>     qos_min_notifier_call+0x1c/0x28
>     notifier_call_chain+0xf4/0x114
>     blocking_notifier_call_chain+0x4c/0x78
>     pm_qos_update_target+0x184/0x190
>     freq_qos_apply+0x4c/0x64
>     apply_constraint+0xf8/0xfc
>     __dev_pm_qos_update_request+0x138/0x164
>     dev_pm_qos_update_request+0x44/0x68
>     msm_devfreq_boost+0x40/0x70 [msm]
>     msm_devfreq_active+0xc0/0xf0 [msm]
>     msm_gpu_submit+0xc8/0x12c [msm]
>     msm_job_run+0x88/0x128 [msm]
>     drm_sched_main+0x240/0x324 [gpu_sched]
>     kthread+0xf0/0x100
>     ret_from_fork+0x10/0x20
>
> Fix this by only synchronizing access to gmu->initialized.
>
> Fixes: 4cd15a3e8b36 ("drm/msm/a6xx: Make GPU destroy a bit safer")
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 11 ++++++++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 --
>  2 files changed, 8 insertions(+), 5 deletions(-)

While this is tangled enough that I can't necessarily think through
every aspect of it, this seems to me like it should do the trick.
Thanks for the fix!

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
