Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBBF4DDEC9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 17:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C1010E6F1;
	Fri, 18 Mar 2022 16:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F21B10E6F1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 16:24:34 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w4so10848729edc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vJ9L0V5osggSMXilV0NUxdZ3YODQ2c0ZIQihzHn4ios=;
 b=L11FSvmMxR/S/6J58hseaebFIGaY1w0GQZO0yjGrp1k0/LWn77MPX3oLnVkjnLa5VR
 LTHnw3hZDmkoqVvtsOmvrvAv1apNvoCA4XOtpR8yn3emgjHbyE24KjF+ugN0bagp+Sau
 pFEAfzk+AtQzHPGhS9ydM1oyairTwvQlgkBS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vJ9L0V5osggSMXilV0NUxdZ3YODQ2c0ZIQihzHn4ios=;
 b=z8/W0NIBQSN0YXdDv0d2CIJu3E/kdJd87ua6VYnlktDmkXsIjPUA5o0xt448FEqgty
 QchoqBoU8U/TfaSMJAj3e34CRctnq2sYRi9iE5ZZRLP+TPapvI+9HlphWRboWMnlg5yi
 KkSjj0ZOA673OH+DwKxnlRX8heJ47Rkmhcft999Y+Hlm9e7alCjXvdBC1gA0BmCmrPxj
 TUW3O8UiYBPrSRVF2b5IPEETWr19BAvdwXUKq7/ozmpJQJE3TQMoNdsZJklamr9MeEDB
 me1y5y0mgXeWXliV/p0Ghoic8gbx90ecRFuTtHDdWqgKamGuKD75cxaOAQdTmFRT0i4I
 +51w==
X-Gm-Message-State: AOAM533d9oxn9J115CGtqB3beJ4KuUtBSZiqcJ/0rMkdcuY0N544uWel
 HvjaxOW3OR/HOUMtfW7gGqp9IBPQ21AUJUdNqJ0=
X-Google-Smtp-Source: ABdhPJwwhpCKiwhpITFQN0Y0uYXrh8fNCt54ZjEqSO33YkuDKC+0jtZtaLUPvOY4kwOhbuQvCh2YVw==
X-Received: by 2002:a05:6402:2753:b0:416:a97:e962 with SMTP id
 z19-20020a056402275300b004160a97e962mr10320510edd.315.1647620673171; 
 Fri, 18 Mar 2022 09:24:33 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 jl2-20020a17090775c200b006dabe8887b8sm3805532ejc.21.2022.03.18.09.24.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:24:33 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id r10so12428455wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 09:24:32 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr3246004wrq.342.1647620671999; Fri, 18
 Mar 2022 09:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
In-Reply-To: <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Mar 2022 09:24:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
Message-ID: <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
 interaction
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 quic_khsieh@quicinc.com, Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_vproddut@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, quic_kalyant <quic_kalyant@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, krzk+dt@kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 17, 2022 at 6:19 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Sankeerth Billakanti (2022-03-16 10:35:51)
> >         The source device should ensure the sink is ready before
> > proceeding to read the sink capability or performing any aux transactions.
> > The sink will indicate its readiness by asserting the HPD line.
> >
> >         The eDP sink requires power from the source and its HPD line will
> > be asserted only after the panel is powered on. The panel power will be
> > enabled from the panel-edp driver.
> >
> >         The controller driver needs to wait for the hpd line to be asserted
> > by the sink.
> >
> > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_aux.c     |  6 ++++++
> >  drivers/gpu/drm/msm/dp/dp_catalog.c | 23 +++++++++++++++++++++++
> >  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
> >  drivers/gpu/drm/msm/dp/dp_reg.h     |  7 ++++++-
> >  4 files changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> > index 6d36f63..2ddc303 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > @@ -337,6 +337,12 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
> >                 goto exit;
> >         }
> >
> > +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
>
> Why are we making aux transactions when hpd isn't asserted? Can we only
> register the aux device once we know that state is "connected"? I'm
> concerned that we're going to be possibly polling the connected bit up
> to some amount of time (0x0003FFFF usecs?) for each aux transfer when
> that doesn't make any sense to keep checking. We should be able to check
> it once, register aux, and then when disconnect happens we can
> unregister aux.

This is for eDP and, unless someone wants to redesign it again, is
just how it works.

Specifically:

1. On eDP you _always_ report "connected". This is because when an eDP
panel is turned off (but still there) you actually have no way to
detect it--you just have to assume it's there. And thus you _always_
register the AUX bus.

2. When we are asked to read the EDID that happens _before_ the normal
prepare/enable steps. The way that this should work is that the
request travels down to the panel. The panel turns itself on (waiting
for any hardcoded delays it knows about) and then initiates an AUX
transaction. The AUX transaction is in charge of waiting for HPD.


For the DP case this should not cause any significant overhead, right?
HPD should always be asserted so this is basically just one extra IO
read confirming that HPD is asserted which should be almost nothing...
You're just about to do a whole bunch of IO reads/writes in order to
program the AUX transaction anyway.


> > +       if (ret) {
> > +               DRM_DEBUG_DP("DP sink not ready for aux transactions\n");
> > +               goto exit;
> > +       }
> > +
> >         dp_aux_update_offset_and_segment(aux, msg);
> >         dp_aux_transfer_helper(aux, msg, true);
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > index fac815f..2c3b0f7 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > @@ -242,6 +242,29 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
> >         phy_calibrate(phy);
> >  }
> >
> > +int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
> > +{
> > +       u32 state, hpd_en, timeout;
> > +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> > +                               struct dp_catalog_private, dp_catalog);
> > +
> > +       hpd_en = dp_read_aux(catalog, REG_DP_DP_HPD_CTRL) &
> > +                                       DP_DP_HPD_CTRL_HPD_EN;
>
> Use two lines
>
>         hpd_en = dp_read_aux();
>         hpd_en &= DP_DP_HPD_CTRL_HPD_EN;
>
> > +
> > +       /* no-hpd case */
> > +       if (!hpd_en)
> > +               return 0;

I guess reading from hardware is fine, but I would have expected the
driver to simply know whether HPD is used or not. Don't need to read
it from hardware, do we? It's not like it's changing from minute to
minute--this is something known at probe time.


> > +       /* Poll for HPD connected status */
> > +       timeout = dp_read_aux(catalog, REG_DP_DP_HPD_EVENT_TIME_0) &
> > +                                       DP_HPD_CONNECT_TIME_MASK;
> > +
> > +       return readl_poll_timeout(catalog->io->dp_controller.aux.base +
> > +                               REG_DP_DP_HPD_INT_STATUS,
> > +                               state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
> > +                               2000, timeout);

The timeout that comes from hardware is really stored in microseconds?
That's the units of the value passed to readl_poll_timeout(), right?
Looking at your #defines, that means that your max value here is
0x3fff which is 16383 microseconds or ~16 ms. That doesn't seem like
nearly a long enough timeout to wait for a panel to power itself up.

Also: I'm not sure why exactly you're using the timeout in the
register here. Isn't the time you need to wait more about how long an
eDP panel might conceivably need to power itself on? Most eDP panels
I've seen have max delays of ~200 ms. I'd probably just wait 500 ms to
be on the safe side.

-Doug
