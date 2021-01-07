Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C665A2EE9F1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 00:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF546E563;
	Thu,  7 Jan 2021 23:51:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B56B86E563
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 23:51:41 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id x26so4635484vsq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 15:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=saxzFi2qg+LHi04jHDIQ3UvqFgOV5HAgl5X/y1F1t08=;
 b=dL/mVSlvGXthCVPyZ6Pe+O48W73y116kleZpYbPxK++MAfqzp1qMmveKDKu/OAi4qP
 qFOvto+IkJa192coHUzkjlT5xp9P5i270Vo9+7gDcXnbhVypCb4BQLgETBusGpkVch3+
 IR6xBKmCFQ9prL/01SEfafD6/FykeURCpL0Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=saxzFi2qg+LHi04jHDIQ3UvqFgOV5HAgl5X/y1F1t08=;
 b=Tyk6MZzDycZD3S8Qn4XBzTnTqbk0VAOEmM7zQWkFnjL5JKinpFA3jSz7RcUS/nNOfR
 rt//rgRueQvFi6g5eCerpjIfLWvv1M2Viv9W5V+MUMHd6WH7NQSWHdDeOXHdDp5XOQyj
 FvyU0e8xSsdLj4g1Ge9z40BdyVCMjO0tUihjJKdyWGfmf+c6uJRuTrzV0YHbCqf16kzz
 Y4lY+hpyIKd9WsBh0SCHgb22VnvEd5hUnYBqPx1FV4Pgl0GxOJxA2aXSJfb0dUw+10M2
 8Nqpi9KwVaf6OeI+h5xuJM1bJOk9ZbuvxIhpDwhkjikoaHXHcbyH/kUFLsuyIHZGuv61
 naGw==
X-Gm-Message-State: AOAM530ihKDX0KzGGSV/0JAWsq5jsrPuZBjBKqgPkFziMBQjoxTy8rFT
 ErhPDW1kdFcCVOWCaqtJAdnadwlkj7S6qVLpBGmAZw==
X-Google-Smtp-Source: ABdhPJw1C0m4sHMYXtQQD3eml75tEOs+sgZjRpT4W2AlK3r6i58wCDPPBx6s6G1r3niZh+Am9726r1aTlNXyks4MGyY=
X-Received: by 2002:a67:7993:: with SMTP id u141mr733890vsc.21.1610063500807; 
 Thu, 07 Jan 2021 15:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20210105001119.2129559-1-drinkcat@chromium.org>
 <20210105081111.v6.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
 <a373044b-3e24-4e00-432f-46b0bd91b213@arm.com>
In-Reply-To: <a373044b-3e24-4e00-432f-46b0bd91b213@arm.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 8 Jan 2021 07:51:29 +0800
Message-ID: <CANMq1KCbA9FawgtK4+rjBKO=dFomrAt7kpN8K_180mHRAeUkAg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
To: Steven Price <steven.price@arm.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Kristian Kristensen <hoegsberg@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 7, 2021 at 11:59 PM Steven Price <steven.price@arm.com> wrote:
>
> On 05/01/2021 00:11, Nicolas Boichat wrote:
> > GPUs with more than a single regulator (e.g. G-57 on MT8183) will
> > require platform-specific handling, disable devfreq for now.
>
> Can you explain what actually goes wrong here? AFAICT the existing code
> does support controlling multiple regulators - but clearly this is the
> first platform that exercises that code with num_supplies>1.

Sure, I should have expanded in the commit message, will do in v9.

We have support for >1 supplies, and we need to enable them to get the
GPU running _at all_ (and the default voltages should be safe by
design).

For devfreq though:
 1. There are constraints on the voltage difference between the core
and SRAM, we have this caterpillar logic downstream [1], so somebody
will need to port it (TBH I don't think it's overly critical at this
point, as Bifrost support is still not very mature from what I can
see, and devfreq is purely a performance thing).
 2. The core [2] does not support multiple regulators, so we'll need
custom code anyway. Even if we didn't have constraints.

[1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/heads/chromeos-4.19/drivers/gpu/arm/bifrost/platform/mediatek/mali_kbase_runtime_pm.c#367
[2] https://elixir.bootlin.com/linux/latest/source/drivers/opp/core.c#L679

>
> Steve
>
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
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
> > +             return 0;
> > +     }
> > +
> >       opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
> >                                             pfdev->comp->num_supplies);
> >       if (IS_ERR(opp_table)) {
> >
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
