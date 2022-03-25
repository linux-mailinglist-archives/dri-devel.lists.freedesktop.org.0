Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1F4E78A1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 17:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD9010E97A;
	Fri, 25 Mar 2022 16:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C613D10E97A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 16:06:07 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b24so9761895edu.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 09:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yMwLgpBMsPacoyetf0Jh9z411mlnHCKLxH5G5J9Bol4=;
 b=Y/hl4bV1BEodjTa26V56UFW7xKKqtQqV6DPIWr1GJnYIF/hoTalbgulB3gdkxC3WMu
 XQSVwQKZUG2sZ3ETMy3ROt+OUqrF9D6QN04UTPaN6gbN3wyxUFGruTKWHtEDwcTGXgCT
 NQ7DKJpWM/09QfTXA3AQLleirinBmBKZv4PFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yMwLgpBMsPacoyetf0Jh9z411mlnHCKLxH5G5J9Bol4=;
 b=mbBvN3bVBq8ssQRcNvmG3+m2sGHG64QU5NIleIioNCF2BpNwD80qNGoFnQQq+hAdbN
 20yq47yPS0WIAL8sRKmBlK7iKPX+sodkKoFJL+FWA6EQn8xEaTI28Vn7odX3zureVOO1
 5dMLLXxlZX5GC0S9ZV1ywbrsqeYGGpW5vzc2zyTjeWIEi5SWSiJUxCix70kTgbUNviRN
 XiIV76dNVwMtZGAXSkZeFj/I16zqpL+9s++ADc3fIZ9c3ACNd5vQWmvXVanZOJsI/FV5
 WULK9XV3KYOEOPvoUsbSyecmTchhHXWXKU3I0zKfBMoauJoFSW4Ww7Ix5UN6AD06cYVT
 yObA==
X-Gm-Message-State: AOAM533caGEh15fDI5jTpn4fhc3KE70VaHzE3eLOuq9E+PB2pk1KftAp
 Z6oH4RZp08S5UTGyrpkZ6mQqqnFxwLCcuVpnUxk=
X-Google-Smtp-Source: ABdhPJyuIJelvHRKXgibpAUFq5CykYWmWc7uTAAQaJrh1DmKKtTEWOkRryiLNueTmgiujFbP/KpO3Q==
X-Received: by 2002:a05:6402:1e90:b0:419:4cdc:8b05 with SMTP id
 f16-20020a0564021e9000b004194cdc8b05mr14001299edf.211.1648224365879; 
 Fri, 25 Mar 2022 09:06:05 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44]) by smtp.gmail.com with ESMTPSA id
 g2-20020aa7dc42000000b00418ef55eabcsm3018443edu.83.2022.03.25.09.06.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 09:06:05 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id r7so10386353wrc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 09:06:04 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr9797547wrs.301.1648224364037; Fri, 25
 Mar 2022 09:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
 <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
 <CAE-0n53U=bqPTGtPx2Ho5axtO6EL6WtOtmFisxSufC6OZERV1Q@mail.gmail.com>
 <CAD=FV=WaK8VFC-BvsFpnUv3mW4svGggQTw1hh+zRCEhGvbgYMQ@mail.gmail.com>
 <CAE-0n52v2m4U0wK6NYf4KBwXmp+TEVhjnGpW4rQHuZSf7TYfgA@mail.gmail.com>
 <CAD=FV=WFkXdXVdqhBcfa48JKcUcbUe2M0bW6-V8zjP8jgvjvHA@mail.gmail.com>
 <MW4PR02MB7186835E0D762E51EB9F9515E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
In-Reply-To: <MW4PR02MB7186835E0D762E51EB9F9515E11A9@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Mar 2022 09:05:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDXScN6vt9PTe0YnoDGQmY-cja3wVyV9D1zJxyPwCMRQ@mail.gmail.com>
Message-ID: <CAD=FV=UDXScN6vt9PTe0YnoDGQmY-cja3wVyV9D1zJxyPwCMRQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
 interaction
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_kalyant <quic_kalyant@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, Andy Gross <agross@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Mar 25, 2022 at 8:54 AM Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> > -----Original Message-----
> > From: Doug Anderson <dianders@chromium.org>
> > Sent: Saturday, March 19, 2022 5:26 AM
> > To: Stephen Boyd <swboyd@chromium.org>
> > Cc: Sankeerth Billakanti (QUIC) <quic_sbillaka@quicinc.com>; open list:OPEN
> > FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> > <devicetree@vger.kernel.org>; dri-devel <dri-devel@lists.freedesktop.org>;
> > freedreno <freedreno@lists.freedesktop.org>; linux-arm-msm <linux-arm-
> > msm@vger.kernel.org>; LKML <linux-kernel@vger.kernel.org>; Rob Clark
> > <robdclark@gmail.com>; Sean Paul <seanpaul@chromium.org>;
> > quic_kalyant <quic_kalyant@quicinc.com>; Abhinav Kumar (QUIC)
> > <quic_abhinavk@quicinc.com>; Kuogee Hsieh (QUIC)
> > <quic_khsieh@quicinc.com>; Andy Gross <agross@kernel.org>;
> > bjorn.andersson@linaro.org; Rob Herring <robh+dt@kernel.org>;
> > krzk+dt@kernel.org; Sean Paul <sean@poorly.run>; David Airlie
> > <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Thierry Reding
> > <thierry.reding@gmail.com>; Sam Ravnborg <sam@ravnborg.org>;
> > dmitry.baryshkov@linaro.org; quic_vproddut <quic_vproddut@quicinc.com>
> > Subject: Re: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink
> > interaction
> >
> > Hi,
> >
> > On Fri, Mar 18, 2022 at 4:27 PM Stephen Boyd <swboyd@chromium.org>
> > wrote:
> > >
> > > > > Pushing hpd state checking into aux transactions looks like the
> > > > > wrong direction. Also, as I said up above I am concerned that even
> > > > > checking the GPIO won't work and we need some way to ask the
> > > > > bridge if HPD is asserted or not and then fallback to the GPIO
> > > > > method if the display phy/controller doesn't have support to check
> > > > > HPD internally. Something on top of DRM_BRIDGE_OP_HPD?
> > > >
> > > > If we could somehow get the HPD status from the bridge in the panel
> > > > driver it definitely would be convenient. It does feel like that's
> > > > an improvement that could be done later, though. We've already
> > > > landed a few instances of doing what's done here, like for
> > > > parade-ps8640 and analogix_dp. I suspect designing a new mechanism
> > > > might not be the most trivial.
> > >
> > > What is done in the bridge drivers is to wait for a fixed timeout and
> > > assume aux is ready? Or is it something else? If there's just a fixed
> > > timeout for the eDP case it sounds OK to do that for now and we can
> > > fine tune it later to actually check HPD status register before the
> > > panel tries to read EDID.
> >
> > Right. For the parade chip (which is only used for eDP as far as I know--never
> > DP) waits for up to 200 ms. See ps8640_ensure_hpd().
> >
> > So I guess tl;dr to Sankeerth that it's OK for his patch to have the wait in the
> > aux transfer function, but only for eDP. Other discussions here are about
> > how we could make it better in future patches.
> >
> >
>
> The aux transactions for external DP are initiated by the dp_display driver only after the
> display is hot plugged to the connector. The phy_init is necessary for the aux transactions
> to take place. So, for the DP case, like Doug mentioned below, this patch is introducing
> an overhead of three register reads to detect hpd_high before performing aux transactions.
> So, we felt this was okay to do for DP.

Personally I'm not that upset about the 3 register reads. The problem
Stephen pointed out is bigger. It's possible that a DP cable is
unplugged _just_ as we started an AUX transaction. In that case we'll
have a big delay here when we don't actually need one.


> On the other hand, for eDP, it is necessary to wait for panel ready through this hpd connect status.
> Currently there is no way to know which type of connector it is in the dp_aux sub-module.
>
> However, as the discussion suggested, to have the wait only for eDP, I am thinking to pass the
> connector_type information to aux sub-module and register different aux_transfer functions
> for eDP and DP. The eDP transfer function will wait for hpd_high and the DP transfer function
> will be same as the one before this patch.

Personally I wouldn't register two separate functions. You could just
store a boolean in your structure and only wait for HPD if this is
eDP. One extra "if" test doesn't seem like it justifies splitting off
into two functions...

-Doug
