Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2F24EE4C4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 01:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AAB810E18F;
	Thu, 31 Mar 2022 23:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FFA10E18F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 23:29:20 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bh17so2384191ejb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oU/P0lUIzx1uZfbuXoLmvC/k7etlrfD8HbND/4uBtMs=;
 b=CVm3r8sEiJHudIn3wBe5psgjEjOXEvg7kAXV5xw19t+3DbObpkYUHppzcz6qWIyEKC
 iD+uGmLJdXzgNCcEVX3/o2rL3pH35aBBGYvKh1WC1iiWOWhQglndY1DyhfDoBvDHciUT
 HKdhiizGnGLfo9pL1ZqNneKf5bIxKreY/JwCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oU/P0lUIzx1uZfbuXoLmvC/k7etlrfD8HbND/4uBtMs=;
 b=oQq9Ex2BxJz64vNUJ2onZBJOySJiQ5lmAzb3bkmY6wD+mZQucqP1mTrX8zD0Dk8Xse
 xvFjycHTEyND2aMz4LbxmEnQ2zKnBL5I/cClio4EgU6ECiNFjbJtHEk7R0uWnTnJAB7y
 FR68B9C+2EuVA4scAVw2zy4aQ8rDKbeiWe9dLQU2vcOgwlONoa5dU6ubPHmJWvxKfzH0
 uVmb2V8uSQ++nkW6+QALWFpUr/s0+iq4Ty104ewQmqhgtajCexSU28bhzB7J8aL+XTnc
 jARG9zYoPbruNwL1WfH2uh1v3ZJKbNluSl4x2KR2tjnf2wPLY6mhcEAHGmT574NczAT9
 Xe7A==
X-Gm-Message-State: AOAM531oF9102mrg8MXHhpI6hrx3LLsxDaAlsD/2HPI4+BokG3ouYiC3
 6xwwVzTB5LB66ewlNnemik+0Nri7QlYVmg3z0zs=
X-Google-Smtp-Source: ABdhPJwhsPcr72vq+2mXLHNvYqQc35K8ZoCANpPdjm+4iVUZNouyu+MBxXhMt0usuTm2DEXd7KGdOA==
X-Received: by 2002:a17:906:4787:b0:6e1:409f:8deb with SMTP id
 cw7-20020a170906478700b006e1409f8debmr6922478ejc.80.1648769358445; 
 Thu, 31 Mar 2022 16:29:18 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com.
 [209.85.218.51]) by smtp.gmail.com with ESMTPSA id
 w6-20020a170906d20600b006ca00cb99e0sm324653ejz.34.2022.03.31.16.29.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 16:29:18 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id o10so2462825ejd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:29:18 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr5618171wrq.342.1648769032444; Thu, 31
 Mar 2022 16:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-8-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-8-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Mar 2022 16:23:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V92j=yEoaM4REO6ws=AXpBjM6zWwBtZ8SbPiFd2cu3yw@mail.gmail.com>
Message-ID: <CAD=FV=V92j=yEoaM4REO6ws=AXpBjM6zWwBtZ8SbPiFd2cu3yw@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] drm/msm/dp: Support edp/dp without hpd
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Some eDP sinks or platform boards will not support hpd.
> This patch adds support for those cases.

You could say more, like:

If we're not using HPD then _both_ the panel node and the eDP
controller node will have "no-hpd". This tells the eDP panel code to
hardcode the maximum possible delay for a panel to power up and tells
the eDP driver that it should continue to do transfers even if HPD
isn't asserted.


> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 1809ce2..8f1fc71 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -244,10 +244,17 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
>
>  int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
>  {
> -       u32 state;
> +       u32 state, hpd_en;
>         struct dp_catalog_private *catalog = container_of(dp_catalog,
>                                 struct dp_catalog_private, dp_catalog);
>
> +       hpd_en = dp_read_aux(catalog, REG_DP_DP_HPD_CTRL);
> +       hpd_en &= DP_DP_HPD_CTRL_HPD_EN;
> +
> +       /* no-hpd case */
> +       if (!hpd_en)
> +               return 0;
> +
>         /* poll for hpd connected status every 2ms and timeout after 500ms */
>         return readl_poll_timeout(catalog->io->dp_controller.aux.base +
>                                 REG_DP_DP_HPD_INT_STATUS,
> @@ -586,8 +593,10 @@ void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog)
>         reftimer |= DP_DP_HPD_REFTIMER_ENABLE;
>         dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
>
> -       /* Enable HPD */
> -       dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
> +       /* Enable HPD if supported*/
> +       if (!of_property_read_bool(catalog->dev->of_node, "no-hpd"))

I don't think this is a particularly lightweight operation. It's
literally iterating through all of our device tree properties and
doing string compares on them. ...but this function is called somewhat
often, isn't it? It feels like the kind of thing that should happen at
probe time and be stored in a boolean.

...and then you can use that same boolean in
dp_catalog_aux_wait_for_hpd_connect_state() rather than reading the
register value, right?


-Doug
