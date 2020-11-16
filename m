Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DB92B3AD5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 01:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599B989B84;
	Mon, 16 Nov 2020 00:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE65589B84;
 Mon, 16 Nov 2020 00:40:24 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s13so22154685wmh.4;
 Sun, 15 Nov 2020 16:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iL9lxpBrBrFPICBKOKFu8c0itrIvAktEk+HvGD/57WU=;
 b=RIBUgFVzIehyrerUMVA16aCP2pidbc5aHBjBh/R0UdHr4tzUDUwyVwEDiWGmBJz2JR
 n1+RBo6KMRoziyaeAaoyyY1iaJ0hedkMNJqDg/+SYNpElQcNqUvGuJeIay/+m2GU86XZ
 H2FA5WH+9NoW3pr4DeqFWY2anXbofCrwB6xVPsaMSVaSkqnt0LWV0mqE2dx2NfnXDVXo
 aeCJ6KBFYWCOy4mupN1DDZe39FCQg7RoqyvPRA8rVBOtPmDfqxWQjeUFLQ/hknhk96/T
 v/ok88YsX53eNponOjd3wodpteGjdhm7tj1Az46mPi19M03K3ws4oF7TYTb9V1FwBEJX
 4LZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iL9lxpBrBrFPICBKOKFu8c0itrIvAktEk+HvGD/57WU=;
 b=IMg2p8Hp9tmRjx7VTP6dgmMyVGMV0aQ24VJefsKEios4fpFpPk5y5A7GP1rKUdlhK5
 jqSNfH/df8cH4eiihwjhISrGi19ockg0yRMczCfCwj6lz0gF/7vj+nPVXdCGLNN/K2/M
 5rsKxtOfE0Yxbb7G/pRPv3J+AKEUXixrLoC1j3oS3ZZbY742k6ceH85/bkMgfVe69evH
 NYZHvEaCEpDdLx74CzJTc6w/2jkeLlaho5yecn9BNl9Q0+yCqskUKENVl7AD/8mIGem7
 qeJ7iWFgja5wdwcwzFH6zQHavWp973b0eZwAe7xolFO4SAvFD0cfmnmshvUDryLwrkZS
 r0Hw==
X-Gm-Message-State: AOAM532oYxY7uBHaoXjiSsVBV3gevrbVYvdpTGq4ve18sKGJKpdNQ3/W
 J+trD+evSkIlBcadntOUxEXcVO4s40chSKvvDLEc+xjrugIn6XmL
X-Google-Smtp-Source: ABdhPJy83h9RCKQuWB+fCby7aMfjpLzevqYvBLH0EU2YJjVvMX9zHGkCsE5gQWjMTmUuHJ5fqiIwHtXtzCM3WME/5Sc=
X-Received: by 2002:a1c:9ec9:: with SMTP id h192mr12679379wme.8.1605487223649; 
 Sun, 15 Nov 2020 16:40:23 -0800 (PST)
MIME-Version: 1.0
References: <c995335d16d8b4b4ff47b1273869c33e14782b32.1603867405.git.viresh.kumar@linaro.org>
In-Reply-To: <c995335d16d8b4b4ff47b1273869c33e14782b32.1603867405.git.viresh.kumar@linaro.org>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 16 Nov 2020 08:40:12 +0800
Message-ID: <CAKGbVbumtz4qG186Eane+1JvoE2QfCCUMUEKcRCojX_sJhhKGw@mail.gmail.com>
Subject: Re: [PATCH V2 Resend 1/2] drm/lima: Unconditionally call
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, lima@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next.

On Wed, Oct 28, 2020 at 2:44 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
> find the OPP table with error -ENODEV (i.e. OPP table not present for
> the device). And we can call dev_pm_opp_of_remove_table()
> unconditionally here.
>
> Reviewed-by: Qiang Yu <yuq825@gmail.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>
> ---
> V2: Applied Reviewed by tag.
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
