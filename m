Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630171FFFFE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 04:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CA86E49A;
	Fri, 19 Jun 2020 02:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AA76E49A;
 Fri, 19 Jun 2020 02:03:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t18so8105177wru.6;
 Thu, 18 Jun 2020 19:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RODJZYn4iFbMvRSnqNgS+uD53dBjoKERg29X6MlC140=;
 b=s3itQqvOv37ouSFDWwtHgxc+PavKGYTvFT8wNWbcTjv2Chl+4PCfUoJSHCRvgILzmF
 aurtvht8u9WNnw9YPQh41vKtG3ahKgLQ6hmBjvJ9FVqqXt5OmFRm/ajwlf8WRdg+rWRo
 02RZf9LUbdLi27wOmRjWVtpKk7uPhdptduczocA/H7k0qcYkEyq7bSFwVNmuTfjW1DcK
 0Nx8cuF7wTTYhh7cThkwc+T206FBcFLiCH9HjMYzl9saks+kuMgbPY1YLfN9eV6yY7VW
 DoIPOAWkl71uJKyopDxbek3UweL21NXqzOmxUQ9VJWor9LyRVRDkf/sB2gkBne6NCN1v
 c8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RODJZYn4iFbMvRSnqNgS+uD53dBjoKERg29X6MlC140=;
 b=g2BwoqTq3L/zbEZjsEHeU8o5xvPCrHnv1c0WZ/MBSwRs9BoCtMqEKcfPzyKpVTe1zE
 hySUwEThTVCY0GMzYOycd0s1oRAaLT/KZa5dsxjL16n78bhSb7HHyzP+aPysYzc9r8MX
 ga62Vymc6mIW6UDEl6nqhJRONjisViXrSGZen3iPUTk+RPad/NaVowuvtF081WVua+vn
 HeuO1WRZqxtOduMpn1RzYjuXgHgs9dzBQE3dt3hM1MYPHT9EOFg2K8pnJSYN6b24mjcn
 aiXKjC1JUCapvSy5i2Erp6bTlt4+wCZx4uop7aboC+WUEKkykY4e6w7xNUKFgBDmwZop
 ZrHQ==
X-Gm-Message-State: AOAM530frfgnuzLxheQ1HVEjyvaIWtvqOYEFlLc0WTsuPcZ+Sne66hHE
 uUW9TO5roJL1+J4oNIJIn0voTT2+3nbjemzN5ZA=
X-Google-Smtp-Source: ABdhPJzn5PrCq5NL5cXS+bqcFGUOPR0i9ys88AV1yxcZr8JHsO7R4rcKc5Q6oB/imNxQ71nysuXJYLNFTr35c5+C61g=
X-Received: by 2002:a5d:60c3:: with SMTP id x3mr1365729wrt.48.1592532196588;
 Thu, 18 Jun 2020 19:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAKGbVbuV8meZji9PqFUwt4CpFEy6efpX63hJBgMY7fzAnZS4Rg@mail.gmail.com>
 <20200618145838.2956591-1-andrey.lebedev@gmail.com>
In-Reply-To: <20200618145838.2956591-1-andrey.lebedev@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Fri, 19 Jun 2020 10:03:05 +0800
Message-ID: <CAKGbVbtYusvURFcUyQtgUycNJPAQyDGDaLXW8qw-x49DqfKmQA@mail.gmail.com>
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
Cc: kernel test robot <lkp@intel.com>, lima@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrey Lebedev <andrey@lebedev.lt>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 10:58 PM Andrey Lebedev
<andrey.lebedev@gmail.com> wrote:
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
> Fixes for the embarrassing build error
> Reported-by: kernel test robot <lkp@intel.com>
>
>  drivers/gpu/drm/lima/lima_drv.c   | 4 ++++
>  drivers/gpu/drm/lima/lima_drv.h   | 1 +
>  drivers/gpu/drm/lima/lima_sched.c | 5 +++--
>  3 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
> index a831565af813..2400b8d52d92 100644
> --- a/drivers/gpu/drm/lima/lima_drv.c
> +++ b/drivers/gpu/drm/lima/lima_drv.c
> @@ -19,6 +19,7 @@
>  int lima_sched_timeout_ms;
>  uint lima_heap_init_nr_pages = 8;
>  uint lima_max_error_tasks;
> +uint lima_job_hang_limit;
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
Still miss this "int" to "uint".

Regards,
Qiang

>  static int lima_ioctl_get_param(struct drm_device *dev, void *data, struct drm_file *file)
>  {
>         struct drm_lima_get_param *args = data;
> diff --git a/drivers/gpu/drm/lima/lima_drv.h b/drivers/gpu/drm/lima/lima_drv.h
> index fdbd4077c768..c738d288547b 100644
> --- a/drivers/gpu/drm/lima/lima_drv.h
> +++ b/drivers/gpu/drm/lima/lima_drv.h
> @@ -11,6 +11,7 @@
>  extern int lima_sched_timeout_ms;
>  extern uint lima_heap_init_nr_pages;
>  extern uint lima_max_error_tasks;
> +extern uint lima_job_hang_limit;
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
