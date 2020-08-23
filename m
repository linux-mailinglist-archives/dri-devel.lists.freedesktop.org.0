Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC9624EAF7
	for <lists+dri-devel@lfdr.de>; Sun, 23 Aug 2020 04:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4596E127;
	Sun, 23 Aug 2020 02:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F8B6E124;
 Sun, 23 Aug 2020 02:54:11 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z18so5346225wrm.12;
 Sat, 22 Aug 2020 19:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JO459KxhJEzf2IEvI+josGJJ60W1ooA97Y5knTsxYNo=;
 b=Rb5WNI8n/gZRSeMt+vb40+nrepp/iM3BAw0azlstiR+TmHzSf13RqQXBLUE+Su0NLw
 fce1d1ywY5xSM/jbls95zUoVSn7t/r1AYVRsIzSGU6NfVWMsbkep9Vhtxw36ZeWRU1NY
 whI/eHHCx59CIvp2SlyiJwbmHXHvoCGowkEBZ8tMj7V0xT5q57zH8KAWqG7bkNvaSNKt
 2IqCrm54R7PLM0/IFnA4bVXzuDOHfd+SGvSkzCjICGk7EKpjmWdKOj6esTyEQ3ahlI3Q
 iwQh6GybEajGdzEhNyDFHdn4DND7Hm4lSxQeEjBeK8lKWeBqoAkBqc/TZWHOQAuBcTK6
 dsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JO459KxhJEzf2IEvI+josGJJ60W1ooA97Y5knTsxYNo=;
 b=Jftpzfs3t38wJrdsyQrv++uYEiYf69Qn4EnQ5ZsfjlyuK+gLfeanz3dHmpUmRezuUE
 1+KMS9rtL/+XUfU1JvoDIcqnwcghtcOD/kaZ+J/tB7AZ3JQm8KQRVvnczOZhQB6UNfhI
 iwIiGmkZNsL73VGQIEPXJcajSVsNVgYnQFtxo14h7If57XvCvImIxZM/lQgL4ul/wOFW
 Hulh8QipqZvqaqypEcg2UnFpzhLOvS3GesPVkhgYLDWxaRHealgiqD8OZfsBIQ9KT+fn
 fqWlYBwYx6i22G0pQsgYL7dk2Of61rpeGtXWNDcVqPRgwRzDauW3wIVF9aZfGPK8ivOX
 6ahg==
X-Gm-Message-State: AOAM530OfwPKgpEkbt5tiIJm5Qh3YjQt/8xHR69vMpIhbw0lCThKibHc
 2qwEY8w3nLYMo85xxkdXF0HaGz1Mk1LoOhldxdU=
X-Google-Smtp-Source: ABdhPJxVBi+fxXUP+tAoUQKNyIfnLypZr9quB2wxZNg+UUdCRFGmKVwAS0GkY0xptxxCJF0laNsknAkD1vUkiXyqd8Q=
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr147495wru.19.1598151250584;
 Sat, 22 Aug 2020 19:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597919647.git.viresh.kumar@linaro.org>
 <56f1c76a0061dc3ed2d6ea115a3ba8b2e2dee9fd.1597919647.git.viresh.kumar@linaro.org>
In-Reply-To: <56f1c76a0061dc3ed2d6ea115a3ba8b2e2dee9fd.1597919647.git.viresh.kumar@linaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Sun, 23 Aug 2020 10:53:59 +0800
Message-ID: <CAKGbVbukA=M=a5uNwPJ3=tXYVT3QTVSJKb5VJFCq2JGwV0TSCw@mail.gmail.com>
Subject: Re: [PATCH 2/8] drm/lima: Unconditionally call
 dev_pm_opp_of_remove_table()
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rafael Wysocki <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Stephen Boyd <sboyd@kernel.org>,
 rnayak@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good for me, patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Thu, Aug 20, 2020 at 6:44 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> find the OPP table with error -ENODEV (i.e. OPP table not present for
> the device). And we can call dev_pm_opp_of_remove_table()
> unconditionally here.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/gpu/drm/lima/lima_devfreq.c | 6 +-----
>  drivers/gpu/drm/lima/lima_devfreq.h | 1 -
>  2 files changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index bbe02817721b..cd290d866a04 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -105,10 +105,7 @@ void lima_devfreq_fini(struct lima_device *ldev)
>                 devfreq->devfreq = NULL;
>         }
>
> -       if (devfreq->opp_of_table_added) {
> -               dev_pm_opp_of_remove_table(ldev->dev);
> -               devfreq->opp_of_table_added = false;
> -       }
> +       dev_pm_opp_of_remove_table(ldev->dev);
>
>         if (devfreq->regulators_opp_table) {
>                 dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
> @@ -162,7 +159,6 @@ int lima_devfreq_init(struct lima_device *ldev)
>         ret = dev_pm_opp_of_add_table(dev);
>         if (ret)
>                 goto err_fini;
> -       ldevfreq->opp_of_table_added = true;
>
>         lima_devfreq_reset(ldevfreq);
>
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
> index 5eed2975a375..2d9b3008ce77 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.h
> +++ b/drivers/gpu/drm/lima/lima_devfreq.h
> @@ -18,7 +18,6 @@ struct lima_devfreq {
>         struct opp_table *clkname_opp_table;
>         struct opp_table *regulators_opp_table;
>         struct thermal_cooling_device *cooling;
> -       bool opp_of_table_added;
>
>         ktime_t busy_time;
>         ktime_t idle_time;
> --
> 2.25.0.rc1.19.g042ed3e048af
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
