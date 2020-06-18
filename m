Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5741FEBAF
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 08:44:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFD86EA81;
	Thu, 18 Jun 2020 06:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104DF6EA81;
 Thu, 18 Jun 2020 06:44:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so4797094wru.0;
 Wed, 17 Jun 2020 23:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C5he0LX9AkSF3dLJiFJLP7+SSZu9EadmKeCoEaXRlto=;
 b=j8ggOw7MNFWei7kz45vHodyTQzqUmaHKVX/Raj4Tnd5xdvxTGLhUu1oG5GfqZ3nviz
 il75HFEtqNN180CM/2x/uK62oT3uf+a+G4e9JL0EFkyZLR7SbY4G/m/oDF4ulEJPtK5O
 8NxY1VRptQZybaiBG1XKQTDKzXj3N2XAIrDstCgWa6pKu7g8n91eL2smuRuVGWPWULnN
 4fHzESZPFKIq5hXZVWRo/zA11a+OZFKCCfU43NKr6zCY/rbh6DMSpxH8Ab9VUi1jWpIF
 xMsb4GOJ9fUFchT1tmkCYsPH/4LZ87rS/5LhKMTZxKyk39I/w2VboyEl4IEHZ0Kjoxmm
 mqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C5he0LX9AkSF3dLJiFJLP7+SSZu9EadmKeCoEaXRlto=;
 b=XAAJimCKSHMwf+Grk7zrQXD24GIry/4+4n2NtVzDUnKJEmG7MBBbHSpRL4Ima9Mksk
 0DWPFTGtLAiSHub4MI7RjyZ0YDLXpoJyuRNlZpIboU2SQvmhnMFBVYxWSxXb4hidQBFu
 uobMoa3os4mIW+VpJxX7kiC5AGQBoVDeuH+8PWDjBpr5i3lRYgUx2otlzsZk4zewbw4a
 UElgYOs6p0vmWZhVjs62gOBk/4rwMU2jOqAmCQAA080n4mbzbBgMVCn9DWfxT4J6FYTw
 PIAaM7Ra5pVe+96yzrhqthFY8RMP46gIVTclcby1f/MSXVDJitfAGp3MAJszMO+8M12z
 EyOQ==
X-Gm-Message-State: AOAM532B1BIfntJ/sWekRiPwZQr4F245SrU50UknmzaVFLKxO3y0WnaP
 U31MZK2QUd6Mlki62EoSvYEKSWNfzLtAbSyyI18=
X-Google-Smtp-Source: ABdhPJxqxOCbKY2b3RyKbmPC9Y4yvEuh2t9F+Ipw012eO0XCOCOaKkMXZBLhuPa40MM9LxD5BB8yXANspaH1O4LM2ow=
X-Received: by 2002:a5d:60c3:: with SMTP id x3mr2856502wrt.48.1592462644689;
 Wed, 17 Jun 2020 23:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200617175447.2681047-1-andrey.lebedev@gmail.com>
In-Reply-To: <20200617175447.2681047-1-andrey.lebedev@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Thu, 18 Jun 2020 14:43:53 +0800
Message-ID: <CAKGbVbuV8meZji9PqFUwt4CpFEy6efpX63hJBgMY7fzAnZS4Rg@mail.gmail.com>
Subject: Re: [PATCH] drm/lima: Expose job_hang_limit module parameter
To: Andrey Lebedev <andrey.lebedev@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, andrey@lebedev.lt
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 1:57 AM Andrey Lebedev <andrey.lebedev@gmail.com> wrote:
>
> From: Andrey Lebedev <andrey@lebedev.lt>
>
> Some pp or gp jobs can be successfully repeated even after they time outs.
> Introduce lima module parameter to specify number of times a job can hang
> before being dropped.
>
> Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> ---
>
> Hello,
>
> This patch allows to work around a freezing problem as discussed in
> https://gitlab.freedesktop.org/lima/linux/-/issues/33
>
>  drivers/gpu/drm/lima/lima_drv.c   | 4 ++++
>  drivers/gpu/drm/lima/lima_drv.h   | 1 +
>  drivers/gpu/drm/lima/lima_sched.c | 5 +++--
>  3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
> index a831565af813..2807eba26c55 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -19,6 +19,7 @@
>  int lima_sched_timeout_ms;
>  uint lima_heap_init_nr_pages = 8;
>  uint lima_max_error_tasks;
> +int lima_job_hang_limit;

Better be an "uint" to avoid negative check. With this fixed, patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

>
>  MODULE_PARM_DESC(sched_timeout_ms, "task run timeout in ms");
>  module_param_named(sched_timeout_ms, lima_sched_timeout_ms, int, 0444);
> @@ -29,6 +30,9 @@ module_param_named(heap_init_nr_pages, lima_heap_init_nr_pages, uint, 0444);
>  MODULE_PARM_DESC(max_error_tasks, "max number of error tasks to save");
>  module_param_named(max_error_tasks, lima_max_error_tasks, uint, 0644);
>
> +MODULE_PARM_DESC(job_hang_limit, "number of times to allow a job to hang before dropping it (default 0)");
> +module_param_named(job_hang_limit, lima_job_hang_limit, int, 0444);
> +
>  static int lima_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
>  {
>         struct drm_lima_get_param *args = data;
> diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
> index fdbd4077c768..39fd98e3b14d 100644
> --- a/drivers/gpu/drm/lima/lima_drv.h
> +++ b/drivers/gpu/drm/lima/lima_drv.h
> @@ -11,6 +11,7 @@
>  extern int lima_sched_timeout_ms;
>  extern uint lima_heap_init_nr_pages;
>  extern uint lima_max_error_tasks;
> +extern int lima_job_hang_limit;
>
>  struct lima_vm;
>  struct lima_bo;
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index e6cefda00279..1602985dfa04 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -503,8 +503,9 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
>
>         INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
>
> -       return drm_sched_init(&pipe->base, &lima_sched_ops, 1, 0,
> -                             msecs_to_jiffies(timeout), name);
> +       return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
> +                             lima_job_hang_limit, msecs_to_jiffies(timeout),
> +                             name);
>  }
>
>  void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
