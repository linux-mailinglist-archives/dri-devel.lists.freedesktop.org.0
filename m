Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 759144F1A4D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 23:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB7210E133;
	Mon,  4 Apr 2022 21:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFB810E133
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 21:15:28 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id br1so2707232qvb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 14:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=McouKnSmKFWKF2SpoB2peGm/9//rXoQgWM99Hh1/NkM=;
 b=M++cEUJlbCPGoHHxmMxvBelMxqgIBsOO1jFQ1hxhkxPZWCi9yjs3IOyz3DUBfIHTby
 hMf7DehfSJgg5MS33J2RzV6Za5Fx8CpIeYOhknWnvbkUyNPUbjCU1EClkx377aee23Ed
 /y2xV0M0VEAKcVJVW4ThuGCUzAzjmK5dWYPIeEid3dAv9np5b1dmU0a7JCY1I2torFM1
 M6nthhJ5f/2xyZRhP6slKdYv7VnlT0ixAW+jcKuz4py1y6qx+s1NzcMzRyRThP0QKRKk
 szde6JHOfXwsnWGShpS3m4bdH2QYtwUy0mKBrdcCSwrjhSMVy+rkK12oEdm0q6uHT0XH
 Y84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McouKnSmKFWKF2SpoB2peGm/9//rXoQgWM99Hh1/NkM=;
 b=UVPEoIc46HBbmOT+krk6rBtlTXD0wOlwww1RT2M+LmK6joP7iQ8v1x6Wv0LselRbmj
 GB9Z4MDuK2hhOTXNXHySrNG8sgIBabOKnZDjQ6NDaMt9NX5XFBgrOcNXbLuwP668/OE9
 25iWYF3U6HFcyv+iu+V8ORI3FvQfoyXNOxufmoeT2t+1gwfM4irB1fdCfQAhPGo06lcO
 2CvGuUE2jCYi6cX2I7Mg0AOGMQoruO+aRRBZ/+Bn/dNTn3a5H8ePuOg9RBcSD3ZQ7WWg
 d/y87vmejGBUUry/FUTBRxKLLKzBv+K/kYqkMyD2tCe7vnTCfkpPG811qF1GA5CZICg8
 5dUg==
X-Gm-Message-State: AOAM5307znzFhzJ5fhGtJu7PJfNxZcMNJZhecNRNsg7gp8xyu0pLVCXx
 t8C/ZZvVHobgebzu1Z2I8kR6pyDADkKiUId8+c2ISg==
X-Google-Smtp-Source: ABdhPJyqLSrz27bQaT6seA8R1kJrL/P/oL9NsM1rXGrEtJEpPWrptpkqYtU5VF/Yo5B/E+1043jo5A794bfO5ijjnMc=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr99107qvv.115.1649106927946; Mon, 04 Apr
 2022 14:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-8-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=V92j=yEoaM4REO6ws=AXpBjM6zWwBtZ8SbPiFd2cu3yw@mail.gmail.com>
 <MW4PR02MB7186DD14809500D97C3ABDBBE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB7186DD14809500D97C3ABDBBE1E59@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Apr 2022 00:15:16 +0300
Message-ID: <CAA8EJppB8s=myUG+swLF5vQU+b+mGSjrNsn1-=1cgO9rKXC7Xw@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] drm/msm/dp: Support edp/dp without hpd
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 4 Apr 2022 at 21:32, Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Doug,
>
> > On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
> > <quic_sbillaka@quicinc.com> wrote:
> > >
> > > Some eDP sinks or platform boards will not support hpd.
> > > This patch adds support for those cases.
> >
> > You could say more, like:
> >
> > If we're not using HPD then _both_ the panel node and the eDP controller
> > node will have "no-hpd". This tells the eDP panel code to hardcode the
> > maximum possible delay for a panel to power up and tells the eDP driver that
> > it should continue to do transfers even if HPD isn't asserted.
> >
>
> Okay. I will add it
>
> >
> > > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_catalog.c | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > index 1809ce2..8f1fc71 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > > @@ -244,10 +244,17 @@ void dp_catalog_aux_update_cfg(struct
> > dp_catalog
> > > *dp_catalog)
> > >
> > >  int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog
> > > *dp_catalog)  {
> > > -       u32 state;
> > > +       u32 state, hpd_en;
> > >         struct dp_catalog_private *catalog = container_of(dp_catalog,
> > >                                 struct dp_catalog_private,
> > > dp_catalog);
> > >
> > > +       hpd_en = dp_read_aux(catalog, REG_DP_DP_HPD_CTRL);
> > > +       hpd_en &= DP_DP_HPD_CTRL_HPD_EN;
> > > +
> > > +       /* no-hpd case */
> > > +       if (!hpd_en)
> > > +               return 0;
> > > +
> > >         /* poll for hpd connected status every 2ms and timeout after 500ms */
> > >         return readl_poll_timeout(catalog->io->dp_controller.aux.base +
> > >                                 REG_DP_DP_HPD_INT_STATUS, @@ -586,8
> > > +593,10 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog
> > *dp_catalog)
> > >         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
> > >         dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
> > >
> > > -       /* Enable HPD */
> > > -       dp_write_aux(catalog, REG_DP_DP_HPD_CTRL,
> > DP_DP_HPD_CTRL_HPD_EN);
> > > +       /* Enable HPD if supported*/
> > > +       if (!of_property_read_bool(catalog->dev->of_node, "no-hpd"))
> >
> > I don't think this is a particularly lightweight operation. It's literally iterating
> > through all of our device tree properties and doing string compares on them.
> > ...but this function is called somewhat often, isn't it? It feels like the kind of
> > thing that should happen at probe time and be stored in a boolean.
> >
> > ...and then you can use that same boolean in
> > dp_catalog_aux_wait_for_hpd_connect_state() rather than reading the
> > register value, right?
> >
> It is called twice for DP. Once while booting through a thread scheduled from kms_obj_init
> and when resuming from PM suspend.
>
> With aux_bus addition, this function will be called thrice for eDP. Once during bootup with
> aux_bus, then from scheduled event from kms_obj_init and pm resume like DP.
>
> I will check if we can use a no-hpd Boolean flag instead.

As the driver has a separate dp_parser code, it might be a good fit to
parse the DT once and then to use boolean flag afterwards.

-- 
With best wishes
Dmitry
