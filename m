Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72384B32F6
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 05:27:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2527910E373;
	Sat, 12 Feb 2022 04:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B90810E373;
 Sat, 12 Feb 2022 04:27:19 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id j12so8310333ybh.8;
 Fri, 11 Feb 2022 20:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DfQm6EEcsSkwyy63qL81Cd+ZyuEaHmK7nTBsAbZcXyA=;
 b=N/U6SUGgLU0tWcghD0vaA+qEFiL9RTFNdgbmxNjeyYV1uI6e4VfKjse2slU+uYzuaY
 onfplrXVmoZieT69Bj1Y7WBbbn9WE+9UjAP2LTrxQ4FXEZ+DJWJ5XbuFIJjbCD+8wPPi
 gLNI7478a4sCyxGpQmscGV/xbNpwSyAdllatujRSXVFGC9GUtQMpcylkgmEutE33LyuD
 1loKz9awPt1Y26EHtyWFam9tPYy1EknSoVJvytY9wJDG7bWbKmZbBVGWkfJ6cn25z2Cr
 tDwJA0l5NizNW9lN3R92ucC/XqnrzPkURBps8Pk7Xf5epsBxR0DVI2OoeYq1Se3pJ0r4
 UUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfQm6EEcsSkwyy63qL81Cd+ZyuEaHmK7nTBsAbZcXyA=;
 b=B9sxpmxwn4hIibqaCGZrX3I4yjhbGprbwfRXg9MEPuQJ+4WE7ehYtilM60i3rWQitu
 6fY85lF+xXoxhY39I1aBntxH3lAXaT7W6hjXHfaXoO7CGlcc2dV6KagP4iAhJqv4VpsM
 WRwafWuzsZ2EGO6Q1e26LeWKBAF+brGtOVo0Rg7FcAANNZ1TX/6gtfq8MO651HjELXvD
 iecYO9Hxzuz4x54wO/FiMHQnVwheLbIU7n6ehRiL/DvBIefgyVIjX55SCE6Saig6vQS3
 kd/qnR4/pNAlb7yfY71NrhQFY0KYNIXpizGFg2NWZ4MClJb9GaaYqOYDi4IoLxu/TMMQ
 7cGg==
X-Gm-Message-State: AOAM533N9gHZYvQLcrjVamKfzVZ4Uw3JO09PByqPvSFtwoNMOfczoY6o
 hscOFK0CRqGnE/KZrN7BYi/F+2tXlpIFeDv416U=
X-Google-Smtp-Source: ABdhPJwnVcqj2bnnlrVz0TB871Ta9JaGYSq8R4qZprEgvBVL41IXJsopEMqTiZY9h7f1L56RO+dopNhnzX3XJUJn9uU=
X-Received: by 2002:a81:4528:: with SMTP id s40mr5276837ywa.188.1644640038788; 
 Fri, 11 Feb 2022 20:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20220209093700.30901-1-nunes.erico@gmail.com>
In-Reply-To: <20220209093700.30901-1-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Sat, 12 Feb 2022 12:27:07 +0800
Message-ID: <CAKGbVbt2nxYQahrryGkU5RMwB81xqBLUtE9q8b4bxKpKHf5zPw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/lima: avoid error task dump attempt when not
 enabled
To: Erico Nunes <nunes.erico@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

On Wed, Feb 9, 2022 at 5:37 PM Erico Nunes <nunes.erico@gmail.com> wrote:
>
> Currently when users try to run an application with lima and that hits
> an issue such as a timeout, a message saying "fail to save task state"
> and "error task list is full" is shown in dmesg.
>
> The error task dump is a debug feature disabled by default, so the
> error task list is usually not going to be available at all.
> The message can be misleading and creates confusion in bug reports.
>
> We can avoid that code path and that particular message when the user
> has not explicitly set the max_error_tasks parameter to enable the
> feature.
>
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> v2:
> - collect review tags
> - update summary line to "drm/lima:"
> ---
>  drivers/gpu/drm/lima/lima_sched.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 5612d73f238f..12437e42cc76 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -409,7 +409,8 @@ static enum drm_gpu_sched_stat lima_sched_timedout_job(struct drm_sched_job *job
>
>         drm_sched_increase_karma(&task->base);
>
> -       lima_sched_build_error_task_list(task);
> +       if (lima_max_error_tasks)
> +               lima_sched_build_error_task_list(task);
>
>         pipe->task_error(pipe);
>
> --
> 2.34.1
>
