Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9994AB30B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 02:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6992D10E606;
	Mon,  7 Feb 2022 01:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A35610E2CC;
 Mon,  7 Feb 2022 01:18:57 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id j2so35803254ybu.0;
 Sun, 06 Feb 2022 17:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wF7wLYknrAguQRg8tSTIkfoRb2Q1jL2Myx81XhHaTX0=;
 b=boKjz6VniFotg9L1M4r51qKoS+gj2GSrZLEftSekUQtk9xP8ZLl1pFCkxQZldC/GE0
 D7ODLMupOoMZT5VDL664MHe1Pz/iQI7YI00lTwySRG+msmoV0+qBFundg3Gj7hadxC1T
 VwLYyCa9mOqzy7ZjjLJ+c1MjFCKVT+wa04wdbNwkRwvTMZvDw9+Kt2oYf7o+FC5EIxVL
 Zp3oYPE3y8dc+kOyDVmQXpyw6/31cYOkNn+Y6mFprWIwwUvLeL3ec/Sx+st0CcPMZp0R
 lLMxuzNRMsGWe5ZQlA1gujF267zV9ix6QPNEHLmacr3zxcZURPTbBMmYlVRLRzcW1U56
 e6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wF7wLYknrAguQRg8tSTIkfoRb2Q1jL2Myx81XhHaTX0=;
 b=2bmp49yWvzQyuTU9f7Vd8pZWHy3xN4adXu2kMB6pBWhSdnAtmreFmf2E9Pf81gC7ep
 ICGGkEgFH6fn8b4o5G7yTpATFXglGpvfGCY0Q+8MT6jAuZZXNnwz4/FOQMmfosJG3ecE
 P72Uj+nRnV223fy8d/Vkze/DV9zOSj/zEAdRKEUMdeFjjWooDQygNg7ZXS54y+4e3d39
 hxWpZMu/WbpcOKsTMiqC3gUkJgULB+zV1RQsE8VCnyF/WpOu1c7oirBtKe+HHqI3OwuB
 1QFFiPnFB1h1rSqkaubDfk/iOCYYSYAbWSQ+TDgTiPIi53CmeVqSWF/1ckE7mqSbg0Go
 NfVg==
X-Gm-Message-State: AOAM533cvHTZ7Foxqy0LRj+Vf0g1ioj2fMFIqf++UT7eUU8lp2qCdCLu
 Hbn6PFJlWmMrKZnrmqydPa29SLu1v2/FJm6JyuY=
X-Google-Smtp-Source: ABdhPJwxpTAT1hMwpB3AuslkxEXuPVtmbiBZWNr8UkvUpClzvuPZ4wfXfvx4LQhFpZ4/e1BOnV86QZfHSXxcD7D3Zu8=
X-Received: by 2002:a25:4489:: with SMTP id r131mr8279192yba.538.1644196736547; 
 Sun, 06 Feb 2022 17:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20220205185909.878643-1-nunes.erico@gmail.com>
In-Reply-To: <20220205185909.878643-1-nunes.erico@gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 7 Feb 2022 09:18:45 +0800
Message-ID: <CAKGbVbsBy5=b8bACbiQ57qMe2Jw_MN-4p=o7Qd+9BCS8U1ZQJw@mail.gmail.com>
Subject: Re: [PATCH] lima: avoid error task dump attempt when not enabled
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good for me, patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

On Sun, Feb 6, 2022 at 2:59 AM Erico Nunes <nunes.erico@gmail.com> wrote:
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
