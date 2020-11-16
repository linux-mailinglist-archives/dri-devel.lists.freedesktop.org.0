Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF022B3AD7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 01:42:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEB089B84;
	Mon, 16 Nov 2020 00:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069C189B84;
 Mon, 16 Nov 2020 00:42:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k2so16966524wrx.2;
 Sun, 15 Nov 2020 16:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Lixo7STShzvL4Shbmq3YhowNswAkb873wBmSE1Y13w=;
 b=dBRO2LdMURQbXCYeOgDMFzwf9OpuawKxB98cUFbNWVMA+RAYjhHucrv3WRdwgwkRYP
 a/R5o7COE0K/39wPh4FgBCsPWhB5AQ3ehckhoM2XFIctfyLfvCg9zgNCyvcf9UhPWC4T
 9Js530aun26joscwa9VQV5OiebElbvCgREXj6uNmIcnySJ+kNMerTe/LUYHEp6k18aoh
 pcqozalBW3KfH7xaOdWzramtIEhLdPN23YMjihoiWfU3Z+OumikPx2yvU5KSKKdXh5Qz
 Fl+gKv2iTWqfArr4izj/gNkVaz1NPQipG3gdGnFwSZD0gYYwXRIHzaAAnlz28zhzPfO+
 +ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Lixo7STShzvL4Shbmq3YhowNswAkb873wBmSE1Y13w=;
 b=jOR70Ejwj5v7jeX27ArMyScjFRFB8KDg2lHo+l/4yVCEYYD+MjQ31zvGbLy7c9lLGA
 N/ZUEdzIo8J5MQX5zetxVXSXwh2ZzezSYOwljtbu5pDd71c/xdmzuUqFyESOSNWy2sgm
 4jpdOsp/ylND2K3Uny1pQmRzSLo7czzPo3ZQfpdEQGG5vUn46sANzSJkPyLrwMcDX3Fw
 U+5iZt1rbZLRAFEJ5mNRlMOLI5pzNpAQnt0r9JAkpPuX2aEd6o308VPy5/FbRwMyugyt
 sbOYCQdn0L3fuAqlYEPBSHqUpanldfqxh2KxJUBs7Z5E9r5nOKFHy/feTFlG9Lbv6G7z
 mQ+w==
X-Gm-Message-State: AOAM533HKGIKuEahxR4zKHYV8+jrJ56PkrsZTbGVK0b5bA6HzPO1gN9Y
 i7bqd7paB9h1MhZQiR6qbFZGMKes6ZVubEfG/qM=
X-Google-Smtp-Source: ABdhPJyCi0a9S7gjdZqwzODzPyvwyWgMmD8zlfJqg3PCOAe7bH5Q8KR/A7tGoTxSfEe28LjiQ281DhlKdg/CthtF5R8=
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr15636451wrr.85.1605487351726; 
 Sun, 15 Nov 2020 16:42:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604646059.git.viresh.kumar@linaro.org>
 <2518c14df2f16cc3c4fee35499895a32513c174b.1604646059.git.viresh.kumar@linaro.org>
In-Reply-To: <2518c14df2f16cc3c4fee35499895a32513c174b.1604646059.git.viresh.kumar@linaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 16 Nov 2020 08:42:20 +0800
Message-ID: <CAKGbVbth8X84xv7rU3TcnUFbHuX4-=Ny9gexQMsd89DYwvveaQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/lima: dev_pm_opp_put_*() accepts NULL argument
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
 digetx@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks good for me, patch is:
Reviewed-by: Qiang Yu <yuq825@gmail.com>

Regards,
Qiang

On Fri, Nov 6, 2020 at 3:05 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> The dev_pm_opp_put_*() APIs now accepts a NULL opp_table pointer and so
> there is no need for us to carry the extra check. Drop them.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/gpu/drm/lima/lima_devfreq.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
> index bbe02817721b..e7b7b8dfd792 100644
> --- a/drivers/gpu/drm/lima/lima_devfreq.c
> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
> @@ -110,15 +110,10 @@ void lima_devfreq_fini(struct lima_device *ldev)
>                 devfreq->opp_of_table_added = false;
>         }
>
> -       if (devfreq->regulators_opp_table) {
> -               dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
> -               devfreq->regulators_opp_table = NULL;
> -       }
> -
> -       if (devfreq->clkname_opp_table) {
> -               dev_pm_opp_put_clkname(devfreq->clkname_opp_table);
> -               devfreq->clkname_opp_table = NULL;
> -       }
> +       dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
> +       dev_pm_opp_put_clkname(devfreq->clkname_opp_table);
> +       devfreq->regulators_opp_table = NULL;
> +       devfreq->clkname_opp_table = NULL;
>  }
>
>  int lima_devfreq_init(struct lima_device *ldev)
> --
> 2.25.0.rc1.19.g042ed3e048af
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
