Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114052ECBE3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 09:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D2F89BC2;
	Thu,  7 Jan 2021 08:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A6389805
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 08:49:53 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id k47so2031946uad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=30GZdV6yoZTjN43UUf8O6lUN7KtKnrac+ulwk7uWls4=;
 b=GiCjAe7ft9jSLyjN1BGwf4PaudJDU7KZ42niY+wmkRHQVtqecDJaNwFCIUBe4R4rHt
 Vg3DtlmutWOSt87PgWrRapf9Le7H1YSmZinxozgcevt+7HEYJi14kAmRvWO2RBPMzRRW
 /EPVC7c5U/G6FJQt1X4rUwlgFrj/a9ffb96xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=30GZdV6yoZTjN43UUf8O6lUN7KtKnrac+ulwk7uWls4=;
 b=Ojlga3WoDqGWBKFozo19QuxM+u9FyR8TPrck0M2iTw+XZ7oBAj8KrjPn9xTtr7LF+h
 yrE3mkx7S5ttgFOe/t1OO5Gzgnl6fkVF4dIkaMzyq42565Z3bJld8j2DzCOH7HR32adJ
 dV6+hEuaJCZqFUAQzmimGaULzHvsuKO+klrGOv7+3fCrgedl0YGQqSS/vClzdOzkemuy
 5tEAyn+LVZxBwDjirDY+QkX8tKBD32RrRF1aHeNcrlw6dwIRrxfWYt4Us2/Bzf4wl/7z
 PGoS6xQu/ntkOqC5zuk9lN9Yyg8DLwc0z3CLty41wXxiEv47R6qgUq5OD3Lz4OmiAAal
 HJzA==
X-Gm-Message-State: AOAM5303hEts+FcrEv1x6Q6tScvRT4BcLDsf9HvIsCJ23EzN6buuoIX8
 96nMoWSX/9NrQlZ7+Ubra0BF0GT1VYm8hV6EWSvj8g==
X-Google-Smtp-Source: ABdhPJzL1oFMG34f0SDGnJBCPatm0Dzl8SNmJQzSFw+e0Pd//cfRkKuxMWxZ3x0IbqcHCO8QiSYTwjFvSP7CTHEdI6E=
X-Received: by 2002:ab0:3894:: with SMTP id z20mr6702320uav.82.1610009392004; 
 Thu, 07 Jan 2021 00:49:52 -0800 (PST)
MIME-Version: 1.0
References: <20210107082653.3519337-1-drinkcat@chromium.org>
 <20210107162632.v7.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
 <a1367c40-7c30-95c2-0c7f-7eec58f04b9e@collabora.com>
In-Reply-To: <a1367c40-7c30-95c2-0c7f-7eec58f04b9e@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 7 Jan 2021 16:49:41 +0800
Message-ID: <CANMq1KDXomm4X8vyDPCHRy_KmHuqdschOhWRjiaR1Zzb6Rs8Pw@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
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
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Kristian Kristensen <hoegsberg@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 7, 2021 at 4:31 PM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>
> On 1/7/21 9:26 AM, Nicolas Boichat wrote:
> > GPUs with more than a single regulator (e.g. G72 on MT8183) will
> > require platform-specific handling, disable devfreq for now.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >
> > Changes in v7:
> >   - Fix GPU ID in commit message
> >
> > Changes in v6:
> >   - New change
> >
> >   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > index f44d28fad085..1f49043aae73 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> > @@ -92,6 +92,15 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
> >       struct thermal_cooling_device *cooling;
> >       struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
> >
> > +     if (pfdev->comp->num_supplies > 1) {
> > +             /*
> > +              * GPUs with more than 1 supply require platform-specific handling:
> > +              * continue without devfreq
> > +              */
> > +             DRM_DEV_ERROR(dev, "More than 1 supply is not supported yet\n");
>
> Should this be info instead?

Sure, will fix in v8.

>
> Regards,
>
> Tomeu
>
> > +             return 0;
> > +     }
> > +
> >       opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> >                                             pfdev->comp->num_supplies);
> >       if (IS_ERR(opp_table)) {
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
