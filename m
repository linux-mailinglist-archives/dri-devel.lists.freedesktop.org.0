Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDF6123BF2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 01:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C5DB6E1F5;
	Wed, 18 Dec 2019 00:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD8E6E1F5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:51:54 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id v15so209441iln.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/FqIFbxNZ4ErowQaQntfHCdnij1EjI9liJnlLkiqWQc=;
 b=mTE1+RmVS47pn7wwx1YUwxOkfF6sMrc/6gDreEAiPH52c208VuOmECL0FxLsJiOeSj
 xd6GbfHO5uLaojmq7ftwHPw2eJ7dBFFX2kd4qTD4vF6V9bgGaznbDPFQJ6EcBm3DRuBu
 Sf9wkS0+HVSXl95nXlUBbglpe3Om87S4go9Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/FqIFbxNZ4ErowQaQntfHCdnij1EjI9liJnlLkiqWQc=;
 b=NCi2DSXIFxwUI4kr0G72Uv45dR4krVTkHscyQYpQzm4cYv+5UOREZLU6a9VCY+j9yr
 LtRuevZJPdsQqt+5/BBZjy1uHqEKaxDEqYOh0t4Kwnrz5G5hCm7Mp+LqkWqFoJjim5CC
 0+zUKAThriisdtQB+nb+NMhC9DKNA2KwIveM7hMlGTXtxH3mRu4Z0sWHo6Tvq6ZeLBWZ
 Gkgr8lJFoWI6eSN9bemdzh4KcPOcob48ur59wfZMFd3qtXRZPe4IyNl/Twg+mO+k9EKZ
 ZTpRIo1GyWweWz5yRTTuagn+4FEAjEIH3LBjLjuPOAqyn2Ds84m7YcT976uv+IGkwJ11
 exWA==
X-Gm-Message-State: APjAAAXzM+rY2ZW+Lu9oDyYmnWmI3KQkdOkhBEfLJFahyBlRewlyxPkd
 +p55nDJWD5mtJ3+Ku5rWSEgZmeJpEjA=
X-Google-Smtp-Source: APXvYqwUBUtySnPLmHlwGvBLXd76GBL6j+6UrTGqo0drPjyc2xner58eju9IU15qiBVg+yWadYouWA==
X-Received: by 2002:a92:8655:: with SMTP id g82mr668317ild.2.1576630313247;
 Tue, 17 Dec 2019 16:51:53 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id z24sm129309ilf.31.2019.12.17.16.51.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 16:51:52 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id i11so125235ioi.12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:51:51 -0800 (PST)
X-Received: by 2002:a02:ba93:: with SMTP id g19mr919432jao.90.1576630311502;
 Tue, 17 Dec 2019 16:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20191022190120.25772-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20191022190120.25772-1-jeffrey.l.hugo@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Dec 2019 16:51:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V7HvXPkdjq_WeX+gN3s_Lc2zvX2rapcXNNBeKq2W_rtQ@mail.gmail.com>
Message-ID: <CAD=FV=V7HvXPkdjq_WeX+gN3s_Lc2zvX2rapcXNNBeKq2W_rtQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Decouple DP output lanes
 from DSI input lanes
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Oct 22, 2019 at 12:01 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> Based on work by Bjorn Andersson <bjorn.andersson@linaro.org>
>
> The bridge can be configured to use 1, 2, or 4 DP lanes.  This
> configuration is independent of the input DSI lanes.  Right now, the
> driver assumes that there is 1:1 mapping of input lanes to output lanes
> which is not correct and does not work for manu devices such as the
> Lenovo Miix 630 and Lenovo Yoga C630 laptops.
>
> The bridge can also be configured to use one of a number of data rates on
> the DP lanes.  Currently any of the supported rates is considered valid,
> however the configured rate must also be supported by the connected panel,
> and not all rates are supported or even valid for any particular panel.
>
> Luckily, we can determine what we need at runtime by reading the DPCD from
> the attached panel.  DPCD will tell us the maximum number of supported
> lanes, and the supported data rates.
>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>
> Bjorn, I think this should address the issue you pointed out concerning
> the data rate glitch I missed in your origional work.  Would you kindly
> give this a test and let me know if it appears to address all of the
> issues you were working around?
>
> v2:
> -Use DPCD instead of DT to address the issue of some panels not
> supporting all the rates
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 97 ++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+), 3 deletions(-)

Overall I'm suggesting moving over to my series and I've taken the
best stuff from your patch and put it atop my series.  Please yell if
you disagree.  You can find the cover letter for my v2 at:

https://lore.kernel.org/r/20191218004741.102067-1-dianders@chromium.org

A few misc comments below in any case.


> @@ -444,10 +447,91 @@ static void ti_sn_bridge_set_dsi_dp_rate(struct ti_sn_bridge *pdata)
>         regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
>
>         /* set DP data rate */
> -       dp_rate_mhz = ((bit_rate_mhz / pdata->dsi->lanes) * DP_CLK_FUDGE_NUM) /
> +       dp_rate_mhz = ((bit_rate_mhz / pdata->dp_lanes) * DP_CLK_FUDGE_NUM) /
>                                                         DP_CLK_FUDGE_DEN;

One note is that "bit_rate_mhz" is still calculated using the MIPI
pixel format, which is wrong.  It happens that (at the moment) we have
24 bits per pixel for both cases, though.


> +       /* read the panel capabilities to determine valid supported rates */
> +       val = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LINK_RATE, &dpcd_val);
> +       if (!val) {
> +               DRM_ERROR("Reading max link rate from DPCD failed\n");
> +               return;
> +       }
> +
> +       if (dpcd_val) {

I think your patch is assuming that the only case you want to use the
table is if dpcd_val is 0.  This doesn't appear to be the case.  In
Table 4-24 of the spec it states that you can have a non-zero value
here and still provide a table.  That might be useful if you want to
be backward compatible with an eDP 1.3 source but also provide an
optimized rate for a eDP 1.4 source.

We should be checking the eDP revision first and always using the
table if it's eDP 1.4.


> +               /* cap to the max rate supported by the bridge */
> +               if (dpcd_val > 0x14)
> +                       dpcd_val = 0x14;
> +
> +               switch (dpcd_val) {
> +               case 0x14:

There are constants.  Like DP_LINK_BW_5_4


> @@ -505,7 +589,14 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
>                            CHA_DSI_LANES_MASK, val);
>
>         /* DP lane config */
> -       val = DP_NUM_LANES(pdata->dsi->lanes - 1);
> +       ret = drm_dp_dpcd_readb(&pdata->aux, DP_MAX_LANE_COUNT, (u8 *)&val);

This is an iffy cast.  The function is only guaranteed to set the
first byte of val which could be the most or least significant byte.
Other bytes will remain as-is.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
