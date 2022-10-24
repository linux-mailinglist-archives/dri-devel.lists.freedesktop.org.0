Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A10260AE78
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:01:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6EE10E812;
	Mon, 24 Oct 2022 15:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D193710E80B;
 Mon, 24 Oct 2022 15:01:46 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 p24-20020a9d6958000000b00661c528849eso6027260oto.9; 
 Mon, 24 Oct 2022 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WrYoOZbKFCccOrtXPnngnmJRm0Dj9ejvdDDgWvdIOc4=;
 b=j2U/GyYCVlBhA/+vasoTYYyganc6QSHUuLmYGE461nM2B2j7L8BHyYJbCAxBhVG1XX
 acQEn8DfB15lQQ3cUHrYLqtiRlayPkTmfzIFDmBmW5dcYFdLQND9nnxZTdvKCr6uWVWP
 lQ/YxKxb8xTwyqrUVGSy4HmT9X8ii3nCf4v54hhleQEB63NKf+9vkZs57xlDOQZ3auCn
 ShBrinqTkg3S34wjdreAKCRKmFJec1d+fPErUSGV0Dis+Q+dbROR4jlIeogJ8DkVUOal
 yrAtF7Ri5T52VTE5VHwBXhGCANjLxUew9ZeBxt+lQ/waEnuFDltPYahUmXVQ3BlssTh+
 nQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WrYoOZbKFCccOrtXPnngnmJRm0Dj9ejvdDDgWvdIOc4=;
 b=fyGbtDEWXn+84HpqysIMynEtyq0NFIkBcUAIjpY/wGDF+hhXp6uZQfyjJSnNqx9NyN
 Oqy8X/tbWi4J+ZRaf7vXGgug3iOmootWL7SQf4GJwH0zPvoIdQtfDtVKOtnxP60TDw5I
 CYEeNx065gpsUlQweCLWLj5PjCW46zRXV3AttKB0DrmAzl7JiL3VhkNN5Qd5+35FjJlG
 Jme7Lrmf3QNi0RM+9jCjrxCkAe0DI2Znsog3sW8iozR1tTsst3nJcCrkPOsRNa8bJknB
 KofQVSF99Dz5r1dM20hqUUTgH4yy0AMG6jIhEZtV5OGVwf4CZsdpviJQtyF/THI/8lzK
 oQyQ==
X-Gm-Message-State: ACrzQf09w2ITihb4N9uyndagUmjSVELfr7ZXfe7GH+/8eC5GTleFVxel
 OjRH/Mlpw5lgr3Sm806CJhYJ+Pkyve4UfmHU64A=
X-Google-Smtp-Source: AMsMyM6EvysaHiUabvYs4baVZTymhfLHCC/g/dii9bVMJWWAuOyZVdmdE7eqTdRMvsDXi3jbZf8C43NqJDJvCUeug1s=
X-Received: by 2002:a9d:7859:0:b0:661:b842:80d2 with SMTP id
 c25-20020a9d7859000000b00661b84280d2mr16537790otm.328.1666623706022; Mon, 24
 Oct 2022 08:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <YymCll02tRIMb+9Z@hovoldconsulting.com>
 <Y1I77HYeOkx1fz1E@hovoldconsulting.com>
 <139426b9-0e5b-e4c3-27c6-584ab48517c2@quicinc.com>
 <Y1Z4HrEcLDhe6gQr@hovoldconsulting.com>
In-Reply-To: <Y1Z4HrEcLDhe6gQr@hovoldconsulting.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Oct 2022 08:01:55 -0700
Message-ID: <CAF6AEGuMFCSN2YtXiPmzL_4t82PPp_-K6DB+UHtScygD8PCQHw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drm/msm: probe deferral fixes
To: Johan Hovold <johan@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 4:34 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Oct 21, 2022 at 09:05:52AM -0700, Abhinav Kumar wrote:
> > Hi Johan
> >
> > On 10/20/2022 11:27 PM, Johan Hovold wrote:
> > > On Tue, Sep 20, 2022 at 11:06:30AM +0200, Johan Hovold wrote:
> > >> On Tue, Sep 13, 2022 at 10:53:10AM +0200, Johan Hovold wrote:
> > >>> The MSM DRM driver is currently broken in multiple ways with respect to
> > >>> probe deferral. Not only does the driver currently fail to probe again
> > >>> after a late deferral, but due to a related use-after-free bug this also
> > >>> triggers NULL-pointer dereferences.
> > >>>
> > >>> These bugs are not new but have become critical with the release of
> > >>> 5.19 where probe is deferred in case the aux-bus EP panel driver has not
> > >>> yet been loaded.
> > >>>
> > >>> The underlying problem is lifetime issues due to careless use of
> > >>> device-managed resources.
> > >>
> > >> Any chance of getting this merged for 6.1?
> > >
> > > Is anyone picking these up as fixes for 6.1-rc as we discussed?
> > >
> > > Johan
> >
> > All of these except the last two ( as discussed ) have landed in the
> > -fixes tree
> >
> > https://gitlab.freedesktop.org/drm/msm/-/commit/6808abdb33bf90330e70a687d29f038507e06ebb
>
> Ah, perfect, thanks.
>
> When do you expect to send these on so that they end up in linux-next
> and eventually Linus's tree?

I'll send a -fixes PR this week

> Note that it looks like something happened with the commit messages when
> you applied these. Specifically, the Fixes tags appears to now have a
> line break in them and there's also some random whitespace before your
> SoB:
>
>         Fixes: c3bf8e21
>
>          ("drm/msm/dp: Add eDP support via aux_bus")

naw, that is just some problem with gitlab's html generation, the
actual patch is fine ;-)

BR,
-R

>         Cc: stable@vger.kernel.org      # 5.19
>         Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>         Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>         Tested-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>         Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>         Patchwork: https://patchwork.freedesktop.org/patch/502667/
>         Link: https://lore.kernel.org/r/20220913085320.8577-8-johan+linaro@kernel.org
>
>
>         Signed-off-by: Abhinav Kumar's avatarAbhinav Kumar <quic_abhinavk@quicinc.com>
>
> It's possible just the gitlab UI that's messed up, but perhaps you can
> double check before they hit linux-next, which should complain about
> this otherwise.
>
> Johan
