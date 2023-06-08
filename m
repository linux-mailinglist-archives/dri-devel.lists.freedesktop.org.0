Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E90728A1B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 23:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2DE10E621;
	Thu,  8 Jun 2023 21:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13CA10E620;
 Thu,  8 Jun 2023 21:17:57 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5559cd68b67so756968eaf.3; 
 Thu, 08 Jun 2023 14:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686259077; x=1688851077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ph1P5g/ydE4Fv0AaeusLGMjc57FCAOjuKJBDHrXp40=;
 b=BRdaYTy9k0dHzngwQd9h8bdi/ISO9Cy281AV5kNdgGhi0qQCSsVp5+DQO0+c1odNLw
 IAzrTqHB8sw+6WwnyDh/cgNF4vtmiPxc/RK615cLLY6bfQMmq9itVMPjecxgrVbPLn8Z
 KvfMomctYVGLZuM+PlFbzVtuRos+YSneV5WIneJXKSf14mrzSYXSPMCgygSVSdbBI1oe
 IMUTmeTFW8SAFmEDvvKyuYTJNgiv/KbvtSfY6to1jw+Iu79e18pqKr7NxqsImyljsomr
 PfP5vq6OQxRmqTFLtgQveQ3eXPQGX/iXSUkFn/tmsMA75drElRS8rJSfRjApoSJ+dIly
 FQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686259077; x=1688851077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ph1P5g/ydE4Fv0AaeusLGMjc57FCAOjuKJBDHrXp40=;
 b=WCzmv+tRvvSComUhUCmjnanrgm3NT6SY+NAZ2O0x/JYDG8zZhb+yjLnoJ4aXVT1SJ8
 2JjzSe8en1GS4y+2gsRiDnh2V+QFUKkNENUknpU1xWVgUVLNz+oN5vZADXazgmIkOLQk
 O6pK705ZeUTwRlks0zJOHqiztk1jZQ+DCv52zR4zre1lx9rrqP78BbKljEjxsIiWT7dc
 BN1BsUEK7fr2CskkvqqresZxhfJrSB1GIALlQqZ4e3MiOAf/ZHD3sA9gNuG4Mpa3NI9m
 M4ozbqzoCeuUgG++4FCn+WVZtvRdT+b2uhk91QEHA9J+Gpnts/P/je1x1Pezk0/HpJTK
 8RkQ==
X-Gm-Message-State: AC+VfDyu+CqsFTlXiZfIpom3YdwoK3GtfPryF8NWz6rOnf06a2p7DjYr
 f3czOTbq8SG/woiMGYsdD3VhV82Av77k//kaLyU=
X-Google-Smtp-Source: ACHHUZ6a3njgabVwW8LMu5H+hKoXM9xDBnuTICalDRFZDrbEAPedff7njpTJLvEUipVWSUVSsviWhhgatnPRZPJQ2+o=
X-Received: by 2002:a4a:ce88:0:b0:558:b5c7:4832 with SMTP id
 f8-20020a4ace88000000b00558b5c74832mr804427oos.3.1686259076654; Thu, 08 Jun
 2023 14:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <ZBGNmXwQoW330Wr8@hovoldconsulting.com>
 <ZIHh95IeOPBTvB00@hovoldconsulting.com>
In-Reply-To: <ZIHh95IeOPBTvB00@hovoldconsulting.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 8 Jun 2023 14:17:45 -0700
Message-ID: <CAF6AEGv3y3C6nAq7nrkgbv5-9-tVgj+BtY1yU+fXXFFm_N7fcQ@mail.gmail.com>
Subject: Re: Adreno devfreq lockdep splat with 6.3-rc2
To: Johan Hovold <johan@kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 8, 2023 at 7:12=E2=80=AFAM Johan Hovold <johan@kernel.org> wrot=
e:
>
> Hi Rob,
>
> Have you had a chance to look at this regression yet? It prevents us
> from using lockdep on the X13s as it is disabled as soon as we start
> the GPU.

Hmm, curious what is different between x13s and sc7180/sc7280 things?
Or did lockdep recently get more clever (or more annotation)?

I did spend some time a while back trying to bring some sense to
devfreq/pm-qos/icc locking:
https://patchwork.freedesktop.org/series/115028/

but haven't had time to revisit that for a while

BR,
-R

> On Wed, Mar 15, 2023 at 10:19:21AM +0100, Johan Hovold wrote:
> >
> > Since 6.3-rc2 (or possibly -rc1), I'm now seeing the below
> > devfreq-related lockdep splat.
> >
> > I noticed that you posted a fix for something similar here:
> >
> >       https://lore.kernel.org/r/20230312204150.1353517-9-robdclark@gmai=
l.com
> >
> > but that particular patch makes no difference.
> >
> > From skimming the calltraces below and qos/devfreq related changes in
> > 6.3-rc1 it seems like this could be related to:
> >
> >       fadcc3ab1302 ("drm/msm/gpu: Bypass PM QoS constraint for idle cla=
mp")
>
> Below is an updated splat from 6.4-rc5.
>
> Johan
>
> [ 2941.931507] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [ 2941.931509] WARNING: possible circular locking dependency detected
> [ 2941.931513] 6.4.0-rc5 #64 Not tainted
> [ 2941.931516] ------------------------------------------------------
> [ 2941.931518] ring0/359 is trying to acquire lock:
> [ 2941.931520] ffff63310e35c078 (&devfreq->lock){+.+.}-{3:3}, at: qos_min=
_notifier_call+0x28/0x88
> [ 2941.931541]
>                but task is already holding lock:
> [ 2941.931543] ffff63310e3cace8 (&(c->notifiers)->rwsem){++++}-{3:3}, at:=
 blocking_notifier_call_chain+0x30/0x70
> [ 2941.931553]
>                which lock already depends on the new lock.
>
> [ 2941.931555]
>                the existing dependency chain (in reverse order) is:
> [ 2941.931556]
>                -> #4 (&(c->notifiers)->rwsem){++++}-{3:3}:
> [ 2941.931562]        down_write+0x50/0x198
> [ 2941.931567]        blocking_notifier_chain_register+0x30/0x8c
> [ 2941.931570]        freq_qos_add_notifier+0x68/0x7c
> [ 2941.931574]        dev_pm_qos_add_notifier+0xa0/0xf8
> [ 2941.931579]        devfreq_add_device.part.0+0x360/0x5a4
> [ 2941.931583]        devm_devfreq_add_device+0x74/0xe0
> [ 2941.931587]        msm_devfreq_init+0xa0/0x154 [msm]
> [ 2941.931624]        msm_gpu_init+0x2fc/0x588 [msm]
> [ 2941.931649]        adreno_gpu_init+0x160/0x2d0 [msm]
> [ 2941.931675]        a6xx_gpu_init+0x2c0/0x74c [msm]
> [ 2941.931699]        adreno_bind+0x180/0x290 [msm]
> [ 2941.931723]        component_bind_all+0x124/0x288
> [ 2941.931728]        msm_drm_bind+0x1d8/0x6cc [msm]
> [ 2941.931752]        try_to_bring_up_aggregate_device+0x1ec/0x2f4
> [ 2941.931755]        __component_add+0xa8/0x194
> [ 2941.931758]        component_add+0x14/0x20
> [ 2941.931761]        dp_display_probe+0x2b4/0x474 [msm]
> [ 2941.931785]        platform_probe+0x68/0xd8
> [ 2941.931789]        really_probe+0x184/0x3c8
> [ 2941.931792]        __driver_probe_device+0x7c/0x16c
> [ 2941.931794]        driver_probe_device+0x3c/0x110
> [ 2941.931797]        __device_attach_driver+0xbc/0x158
> [ 2941.931800]        bus_for_each_drv+0x84/0xe0
> [ 2941.931802]        __device_attach+0xa8/0x1d4
> [ 2941.931805]        device_initial_probe+0x14/0x20
> [ 2941.931807]        bus_probe_device+0xb0/0xb4
> [ 2941.931810]        deferred_probe_work_func+0xa0/0xf4
> [ 2941.931812]        process_one_work+0x288/0x5bc
> [ 2941.931816]        worker_thread+0x74/0x450
> [ 2941.931818]        kthread+0x124/0x128
> [ 2941.931822]        ret_from_fork+0x10/0x20
> [ 2941.931826]
>                -> #3 (dev_pm_qos_mtx){+.+.}-{3:3}:
> [ 2941.931831]        __mutex_lock+0xa0/0x840
> [ 2941.931833]        mutex_lock_nested+0x24/0x30
> [ 2941.931836]        dev_pm_qos_remove_notifier+0x34/0x140
> [ 2941.931838]        genpd_remove_device+0x3c/0x174
> [ 2941.931841]        genpd_dev_pm_detach+0x78/0x1b4
> [ 2941.931844]        dev_pm_domain_detach+0x24/0x34
> [ 2941.931846]        a6xx_gmu_remove+0x34/0xc4 [msm]
> [ 2941.931869]        a6xx_destroy+0xd0/0x160 [msm]
> [ 2941.931892]        adreno_unbind+0x40/0x64 [msm]
> [ 2941.931916]        component_unbind+0x38/0x6c
> [ 2941.931919]        component_unbind_all+0xc8/0xd4
> [ 2941.931921]        msm_drm_uninit.isra.0+0x150/0x1c4 [msm]
> [ 2941.931945]        msm_drm_bind+0x310/0x6cc [msm]
> [ 2941.931967]        try_to_bring_up_aggregate_device+0x1ec/0x2f4
> [ 2941.931970]        __component_add+0xa8/0x194
> [ 2941.931973]        component_add+0x14/0x20
> [ 2941.931976]        dp_display_probe+0x2b4/0x474 [msm]
> [ 2941.932000]        platform_probe+0x68/0xd8
> [ 2941.932003]        really_probe+0x184/0x3c8
> [ 2941.932005]        __driver_probe_device+0x7c/0x16c
> [ 2941.932008]        driver_probe_device+0x3c/0x110
> [ 2941.932011]        __device_attach_driver+0xbc/0x158
> [ 2941.932014]        bus_for_each_drv+0x84/0xe0
> [ 2941.932016]        __device_attach+0xa8/0x1d4
> [ 2941.932018]        device_initial_probe+0x14/0x20
> [ 2941.932021]        bus_probe_device+0xb0/0xb4
> [ 2941.932023]        deferred_probe_work_func+0xa0/0xf4
> [ 2941.932026]        process_one_work+0x288/0x5bc
> [ 2941.932028]        worker_thread+0x74/0x450
> [ 2941.932031]        kthread+0x124/0x128
> [ 2941.932035]        ret_from_fork+0x10/0x20
> [ 2941.932037]
>                -> #2 (&gmu->lock){+.+.}-{3:3}:
> [ 2941.932043]        __mutex_lock+0xa0/0x840
> [ 2941.932045]        mutex_lock_nested+0x24/0x30
> [ 2941.932047]        a6xx_gpu_set_freq+0x30/0x5c [msm]
> [ 2941.932071]        msm_devfreq_target+0xb8/0x1a8 [msm]
> [ 2941.932094]        devfreq_set_target+0x84/0x27c
> [ 2941.932098]        devfreq_update_target+0xc4/0xec
> [ 2941.932102]        devfreq_monitor+0x38/0x170
> [ 2941.932105]        process_one_work+0x288/0x5bc
> [ 2941.932108]        worker_thread+0x74/0x450
> [ 2941.932110]        kthread+0x124/0x128
> [ 2941.932113]        ret_from_fork+0x10/0x20
> [ 2941.932116]
>                -> #1 (&df->lock){+.+.}-{3:3}:
> [ 2941.932121]        __mutex_lock+0xa0/0x840
> [ 2941.932124]        mutex_lock_nested+0x24/0x30
> [ 2941.932126]        msm_devfreq_get_dev_status+0x48/0x134 [msm]
> [ 2941.932149]        devfreq_simple_ondemand_func+0x3c/0x144
> [ 2941.932153]        devfreq_update_target+0x4c/0xec
> [ 2941.932157]        devfreq_monitor+0x38/0x170
> [ 2941.932160]        process_one_work+0x288/0x5bc
> [ 2941.932162]        worker_thread+0x74/0x450
> [ 2941.932165]        kthread+0x124/0x128
> [ 2941.932168]        ret_from_fork+0x10/0x20
> [ 2941.932171]
>                -> #0 (&devfreq->lock){+.+.}-{3:3}:
> [ 2941.932175]        __lock_acquire+0x13d8/0x2188
> [ 2941.932178]        lock_acquire+0x1e8/0x310
> [ 2941.932180]        __mutex_lock+0xa0/0x840
> [ 2941.932182]        mutex_lock_nested+0x24/0x30
> [ 2941.932184]        qos_min_notifier_call+0x28/0x88
> [ 2941.932188]        notifier_call_chain+0xa0/0x17c
> [ 2941.932190]        blocking_notifier_call_chain+0x48/0x70
> [ 2941.932193]        pm_qos_update_target+0xdc/0x1d0
> [ 2941.932195]        freq_qos_apply+0x68/0x74
> [ 2941.932198]        apply_constraint+0x100/0x148
> [ 2941.932201]        __dev_pm_qos_update_request+0xb8/0x1fc
> [ 2941.932203]        dev_pm_qos_update_request+0x3c/0x64
> [ 2941.932206]        msm_devfreq_active+0xf8/0x194 [msm]
> [ 2941.932227]        msm_gpu_submit+0x18c/0x1a8 [msm]
> [ 2941.932249]        msm_job_run+0x98/0x11c [msm]
> [ 2941.932272]        drm_sched_main+0x1a0/0x444 [gpu_sched]
> [ 2941.932281]        kthread+0x124/0x128
> [ 2941.932284]        ret_from_fork+0x10/0x20
> [ 2941.932287]
>                other info that might help us debug this:
>
> [ 2941.932289] Chain exists of:
>                  &devfreq->lock --> dev_pm_qos_mtx --> &(c->notifiers)->r=
wsem
>
> [ 2941.932296]  Possible unsafe locking scenario:
>
> [ 2941.932298]        CPU0                    CPU1
> [ 2941.932300]        ----                    ----
> [ 2941.932301]   rlock(&(c->notifiers)->rwsem);
> [ 2941.932304]                                lock(dev_pm_qos_mtx);
> [ 2941.932307]                                lock(&(c->notifiers)->rwsem=
);
> [ 2941.932309]   lock(&devfreq->lock);
> [ 2941.932312]
>                 *** DEADLOCK ***
>
> [ 2941.932313] 4 locks held by ring0/359:
> [ 2941.932315]  #0: ffff633110966170 (&gpu->lock){+.+.}-{3:3}, at: msm_jo=
b_run+0x8c/0x11c [msm]
> [ 2941.932342]  #1: ffff633110966208 (&gpu->active_lock){+.+.}-{3:3}, at:=
 msm_gpu_submit+0xdc/0x1a8 [msm]
> [ 2941.932368]  #2: ffffa40da2f91ed0 (dev_pm_qos_mtx){+.+.}-{3:3}, at: de=
v_pm_qos_update_request+0x30/0x64
> [ 2941.932374]  #3: ffff63310e3cace8 (&(c->notifiers)->rwsem){++++}-{3:3}=
, at: blocking_notifier_call_chain+0x30/0x70
> [ 2941.932381]
>                stack backtrace:
> [ 2941.932383] CPU: 7 PID: 359 Comm: ring0 Not tainted 6.4.0-rc5 #64
> [ 2941.932386] Hardware name: LENOVO 21BYZ9SRUS/21BYZ9SRUS, BIOS N3HET53W=
 (1.25 ) 10/12/2022
> [ 2941.932389] Call trace:
> [ 2941.932391]  dump_backtrace+0x9c/0x11c
> [ 2941.932395]  show_stack+0x18/0x24
> [ 2941.932398]  dump_stack_lvl+0x60/0xac
> [ 2941.932402]  dump_stack+0x18/0x24
> [ 2941.932405]  print_circular_bug+0x26c/0x348
> [ 2941.932407]  check_noncircular+0x134/0x148
> [ 2941.932409]  __lock_acquire+0x13d8/0x2188
> [ 2941.932411]  lock_acquire+0x1e8/0x310
> [ 2941.932414]  __mutex_lock+0xa0/0x840
> [ 2941.932416]  mutex_lock_nested+0x24/0x30
> [ 2941.932418]  qos_min_notifier_call+0x28/0x88
> [ 2941.932421]  notifier_call_chain+0xa0/0x17c
> [ 2941.932424]  blocking_notifier_call_chain+0x48/0x70
> [ 2941.932426]  pm_qos_update_target+0xdc/0x1d0
> [ 2941.932428]  freq_qos_apply+0x68/0x74
> [ 2941.932431]  apply_constraint+0x100/0x148
> [ 2941.932433]  __dev_pm_qos_update_request+0xb8/0x1fc
> [ 2941.932435]  dev_pm_qos_update_request+0x3c/0x64
> [ 2941.932437]  msm_devfreq_active+0xf8/0x194 [msm]
> [ 2941.932460]  msm_gpu_submit+0x18c/0x1a8 [msm]
> [ 2941.932482]  msm_job_run+0x98/0x11c [msm]
> [ 2941.932504]  drm_sched_main+0x1a0/0x444 [gpu_sched]
> [ 2941.932511]  kthread+0x124/0x128
> [ 2941.932514]  ret_from_fork+0x10/0x20
