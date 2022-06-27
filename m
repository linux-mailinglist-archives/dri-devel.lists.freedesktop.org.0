Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67355BBE7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 22:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FE611B56D;
	Mon, 27 Jun 2022 20:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AAD11B4E8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 20:05:57 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id p31so16678897qvp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t/YNIIo1OfJZKBOf0su0gdSWMRajt9bfTLqLNeOeO4Y=;
 b=v0xAz+DZeFRyWeSKh+7LCrjx3NjVWydYH4Jjniy060BfBvCJ++TFGpNNnMMGMZmJL8
 ZETVJOqNENRp5YzTaPPF23EjOwQMsIKvJjDwt0v+xJgwdkTBJmwJr6NAadZr7HFSuPDb
 9bTuOwn03ON3kbc9rcwGxJE9ebcyH9sCzXyLMnLCeYfKIoSgr1TGsHcN170aUsspQ0bK
 WjmibuGKw1anaRM7too1lWzRIGIFnsne3c2NgMnkNDefryjg8wMCQsXMcp4HSIR9eB/T
 nhYqlcLL4IG/ZZaXaeRQYWH2nMFljQK+kU9+Bd8YRgYgcvpTYAwvJD4Fs2zAMh+mnVQE
 dW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t/YNIIo1OfJZKBOf0su0gdSWMRajt9bfTLqLNeOeO4Y=;
 b=PEWESocZj/6H0X6PKwjg3E4Gz09EF5inOSHD6bEBD//42Hf8rIVX2ALy/zuAABIYKJ
 Xzh26Ybh+O4e8yiMrNPzv3Pe0Ju2Q2w9Xw4QylzsAnPxvhRKPgrAPufQBcsYInpk+F7l
 PYVh7JzFbCk3J35418U+EjzOVEn/TB9SNj83VQ5gZZtQZ/bpIBWwpoIE7nwXiZky1yd/
 ZHRcfsSlVfm2ZOzU8F1fLxMSowNj079dRr62FICSCkZK1GdDyKA/H0gPROAlstUm1SHO
 zn7h18CvLZoiEDAokogDzat1ZgaY35rzZ2SEkLhIkS7cGGUCZw7EhszqsPzj1ILpJ1xq
 OXwg==
X-Gm-Message-State: AJIora9K1kzuR43MZvlTn7v8XALqEmPGhYd9aqI6bY3RfFszovxSf+30
 mAwBcXezdh9PeWGgGDsEOrlZy5UDDo7bpQLbfYu5+/s7tFN3mg==
X-Google-Smtp-Source: AGRyM1t8TUCoMm1sgNDxPUTsFBn9RdMMW4h/okgLyvJyGwbpiRC4mQQKp1jppN6JlrTCD13/QPtdnx+/ags1m87CMTs=
X-Received: by 2002:ad4:596d:0:b0:470:7f34:fa13 with SMTP id
 eq13-20020ad4596d000000b004707f34fa13mr1030321qvb.55.1656360356878; Mon, 27
 Jun 2022 13:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
 <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
In-Reply-To: <9f82dd3f-5ecc-4e1d-6cce-0749b8316d49@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 Jun 2022 23:05:45 +0300
Message-ID: <CAA8EJprR23ugdi926BDtGOGdGEqvWBgOQfekyJjD_OFE3yx0Aw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating num_descs
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jun 2022 at 22:26, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 6/27/2022 9:54 AM, Dmitry Baryshkov wrote:
> > If for some reason the msm_dp_config::descs array starts from non-zero
> > index or contains the hole, setting the msm_dp_config::num_descs might
> > be not that obvious and error-prone. Use ARRAY_SIZE to set this field
> > rather than encoding the value manually.
> >
> > Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 46 +++++++++++++++++------------
> >   1 file changed, 27 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index f87fa3ba1e25..6fed738a9467 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -131,35 +131,43 @@ struct msm_dp_config {
> >       size_t num_descs;
> >   };
> >
> > +static const struct msm_dp_desc sc7180_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +};
> > +
> >   static const struct msm_dp_config sc7180_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -     },
> > -     .num_descs = 1,
> > +     .descs = sc7180_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sc7180_dp_descs),
> > +};
> > +
>
> why you want to do that?
>
> It is very clear only one entry, why you want to make it 2 entry here?
>
> can you just embedded MSM_DP_COTROLLER_x into struct msm_dp_config?

Because we had enough stories of using a manually set 'number of
something' field. So I'd prefer to have it done automatically.
Also using the indexed array spares us from 'look for the DP
controller number N' functions. You can just get it.

>
> > +static const struct msm_dp_desc sc7280_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> >   };
> >
> >   static const struct msm_dp_config sc7280_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_en = true },
> > -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
> > -     },
> > -     .num_descs = 2,
> > +     .descs = sc7280_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sc7280_dp_descs),
> > +};
> > +
> > +static const struct msm_dp_desc sc8180x_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +     [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > +     [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> >   };
> >
> >   static const struct msm_dp_config sc8180x_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -             [MSM_DP_CONTROLLER_1] = { .io_start = 0x0ae98000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -             [MSM_DP_CONTROLLER_2] = { .io_start = 0x0ae9a000, .connector_type = DRM_MODE_CONNECTOR_eDP },
> > -     },
> > -     .num_descs = 3,
> > +     .descs = sc8180x_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sc8180x_dp_descs),
> > +};
> > +
> > +static const struct msm_dp_desc sm8350_dp_descs[] = {
> > +     [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> >   };
> >
> >   static const struct msm_dp_config sm8350_dp_cfg = {
> > -     .descs = (const struct msm_dp_desc[]) {
> > -             [MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> > -     },
> > -     .num_descs = 1,
> > +     .descs = sm8350_dp_descs,
> > +     .num_descs = ARRAY_SIZE(sm8350_dp_descs),
> >   };
> >
> >   static const struct of_device_id dp_dt_match[] = {



-- 
With best wishes
Dmitry
