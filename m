Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF3730766
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 20:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1134810E16C;
	Wed, 14 Jun 2023 18:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D82810E165;
 Wed, 14 Jun 2023 18:38:46 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-55554c33bf3so811217eaf.2; 
 Wed, 14 Jun 2023 11:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686767925; x=1689359925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dFasYpxuVuMR2c+i0KyCPu3AC8KqubEgfSkCT0YwXqA=;
 b=J79YRRtIh5fpyD6VXFJHoH1PRy+EqF2NS/Ek6f3Sx5UIfcsIqTDLUWb3FZBMX3vcVx
 90qbomKfJ68LeCQFyaWSJ9QyJGbg8eXgh3mgYh3j6BccxEwkCdSXhSz8VQ79ZWjHB+V/
 SGoh4TDRNTa4l7+gODQwQkWrFvAdepqjoZRYg99tvYSOzqaZ95iQIMEiSVKrsEZ5qDui
 +j8oN1ZrG4RtxVW9dw3wf2Z8yIbpJ19H9Rt7l7PFjkRNIyXoiv2jFIyscdyx2+joNQlt
 TuNH8iVQ9FuFWF8XGAtGGIIqRO+8k+eTYKPfcg9JIXxSQF0R5zGTH7MJ1dmwAaR9gZFH
 Hayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686767925; x=1689359925;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dFasYpxuVuMR2c+i0KyCPu3AC8KqubEgfSkCT0YwXqA=;
 b=ON9xT0rngDOHi9szoToK0RZ3q+xRbXO6TZ1Bn9bdxg0uTqVuIn7ZCiNvaxwGBBOHnY
 U1Rmc4Jhr8ZA6lg22Tej7ElnYf83oC5VtuDOE8mufmUgNiBHI7Tep+MaqS5EHqrOjdtr
 cVSUkFuzlDIo17DQbtG3Rc1NHvtBLj2zgu/K5oOVuedhTKF/yM2K50XbN+ZoEKzJfs0s
 BXIz0ZRshPh8gXJ19bn5aZrKKxk3Jme+CwUnetix5VLjDCGo7wl/qdgzE3cfBWc7kKc4
 eiZIYkWc2OnmFbqbAiqyxT0jgA7c/w+g4tbIX5bCtPB0A+Buay0PMKtwdGjjPzszK8UF
 0cDA==
X-Gm-Message-State: AC+VfDz/4OJ0EB4IOHiFCPYqWAKjt7oQKzv6dI9AtPpf7l6CzTwUVUTN
 kocAOtPhUKRXRu2I5Gp3IsaVrx+U8t6DdHdKP+yo0uYpbKLtDw==
X-Google-Smtp-Source: ACHHUZ4SSWa4gMYNyHVGkJMlgrPbRdEfIWXhgdvwPbaS1OI5EZ7oIat3+4HtFm+W4X94Vp/ltWqREDyAEqYDyaOREDY=
X-Received: by 2002:a4a:d38c:0:b0:55d:cc04:4968 with SMTP id
 i12-20020a4ad38c000000b0055dcc044968mr2038256oos.3.1686767925492; Wed, 14 Jun
 2023 11:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
In-Reply-To: <20230607130223.3533464-1-l.stach@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 14 Jun 2023 20:38:34 +0200
Message-ID: <CAH9NwWcY9rwwHSa309bBOLcAfU+Vmupa+3_dWQ=H3qhJhNaHDw@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/etnaviv: move down etnaviv_gpu_recover_hang() in
 file
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel@pengutronix.de, patchwork-lst@pengutronix.de,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas

>
> So it can use the event_free function without adding another
> forward declaration. No functional change.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 88 +++++++++++++--------------
>  1 file changed, 44 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index de8c9894967c..6d4df9f1aeff 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1059,50 +1059,6 @@ int etnaviv_gpu_debugfs(struct etnaviv_gpu *gpu, struct seq_file *m)
>  }
>  #endif
>
> -void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
> -{
> -       struct etnaviv_gpu *gpu = submit->gpu;
> -       char *comm = NULL, *cmd = NULL;
> -       struct task_struct *task;
> -       unsigned int i;
> -
> -       dev_err(gpu->dev, "recover hung GPU!\n");
> -
> -       task = get_pid_task(submit->pid, PIDTYPE_PID);
> -       if (task) {
> -               comm = kstrdup(task->comm, GFP_KERNEL);
> -               cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
> -               put_task_struct(task);
> -       }
> -
> -       if (comm && cmd)
> -               dev_err(gpu->dev, "offending task: %s (%s)\n", comm, cmd);
> -
> -       kfree(cmd);
> -       kfree(comm);
> -
> -       if (pm_runtime_get_sync(gpu->dev) < 0)
> -               goto pm_put;
> -
> -       mutex_lock(&gpu->lock);
> -
> -       etnaviv_hw_reset(gpu);
> -
> -       /* complete all events, the GPU won't do it after the reset */
> -       spin_lock(&gpu->event_spinlock);
> -       for_each_set_bit(i, gpu->event_bitmap, ETNA_NR_EVENTS)
> -               complete(&gpu->event_free);
> -       bitmap_zero(gpu->event_bitmap, ETNA_NR_EVENTS);
> -       spin_unlock(&gpu->event_spinlock);
> -
> -       etnaviv_gpu_hw_init(gpu);
> -
> -       mutex_unlock(&gpu->lock);
> -       pm_runtime_mark_last_busy(gpu->dev);
> -pm_put:
> -       pm_runtime_put_autosuspend(gpu->dev);
> -}
> -
>  /* fence object management */
>  struct etnaviv_fence {
>         struct etnaviv_gpu *gpu;
> @@ -1454,6 +1410,50 @@ static void sync_point_worker(struct work_struct *work)
>         etnaviv_gpu_start_fe(gpu, addr + 2, 2);
>  }
>
> +void etnaviv_gpu_recover_hang(struct etnaviv_gem_submit *submit)
> +{
> +       struct etnaviv_gpu *gpu = submit->gpu;
> +       char *comm = NULL, *cmd = NULL;
> +       struct task_struct *task;
> +       unsigned int i;
> +
> +       dev_err(gpu->dev, "recover hung GPU!\n");
> +
> +       task = get_pid_task(submit->pid, PIDTYPE_PID);
> +       if (task) {
> +               comm = kstrdup(task->comm, GFP_KERNEL);
> +               cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
> +               put_task_struct(task);
> +       }
> +
> +       if (comm && cmd)
> +               dev_err(gpu->dev, "offending task: %s (%s)\n", comm, cmd);
> +
> +       kfree(cmd);
> +       kfree(comm);
> +
> +       if (pm_runtime_get_sync(gpu->dev) < 0)
> +               goto pm_put;
> +
> +       mutex_lock(&gpu->lock);
> +
> +       etnaviv_hw_reset(gpu);
> +
> +       /* complete all events, the GPU won't do it after the reset */
> +       spin_lock(&gpu->event_spinlock);
> +       for_each_set_bit(i, gpu->event_bitmap, ETNA_NR_EVENTS)
> +               complete(&gpu->event_free);
> +       bitmap_zero(gpu->event_bitmap, ETNA_NR_EVENTS);
> +       spin_unlock(&gpu->event_spinlock);
> +
> +       etnaviv_gpu_hw_init(gpu);
> +
> +       mutex_unlock(&gpu->lock);
> +       pm_runtime_mark_last_busy(gpu->dev);
> +pm_put:
> +       pm_runtime_put_autosuspend(gpu->dev);
> +}
> +
>  static void dump_mmu_fault(struct etnaviv_gpu *gpu)
>  {
>         static const char *fault_reasons[] = {
> --
> 2.39.2
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
