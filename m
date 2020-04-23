Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 477FE1B5AD2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 13:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612E86E50E;
	Thu, 23 Apr 2020 11:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD196E4F9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 11:55:27 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id i5so5374473uaq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 04:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EsVqTT5wXXhdTLsomAwxroQ1T+w0e7VVQswoorQRWuI=;
 b=ijFQI1cUWrlnvFTSLmAmYANFQVYYT0KLtxIWD4KQV76dY3HQy5sXwhskWitkENgJUk
 FRJcj876X/B2f8QB/wEo76RAmYiaCyHuFafl3aMhOy5qhbMbaoXj4+aN5L7HBP44LxbZ
 MOKv7xfXQ2BiOXG2HXichEwQ0IHnAODo3VpkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EsVqTT5wXXhdTLsomAwxroQ1T+w0e7VVQswoorQRWuI=;
 b=QECJcc5HVI46i8xmaPPvH8nN7f2HsvcyAQI9FrW+Kv/Sd94zGqbxWXbpuCDv/APc5F
 D7HpQ1fb3G4ycxRrDP2GEECD+GJ88qLmG+8AD21lu0Ou3ePuVaALG7pf5dED5U8wiS4w
 xvvIpwePR0qvyakaMoiZbx7qi9xDe8uJAtOFCIf4Yw5kWtQ94KJ1wji55VQlvOZTcCEd
 cGrWBN2b0kb7o4edEbAOQ0rusyHBAzz4tc3fF+L7FnBr9Al9tGD8ih9Ojltppyx5gv2C
 KUoClBfcSADW4DFxqGENOnQR/8ThKL3WwQ6nK+R509pC8DdU+QHa/kLNDVCT+qMMJFim
 PR4g==
X-Gm-Message-State: AGi0PuZUuvYXhZcagz2uvNrauuUidt0VRaBZOJH2eOorHvqoA85stfUZ
 V5dVuzGmDZc4ti96fDPE/ZeywwQRiWV81x5HQSB0XQ==
X-Google-Smtp-Source: APiQypLuW645Sg7+l9AH4kIkM3J8fzdluHvCEFm1pFoq/7YjpI/mbTanqNvaw/UbOaEPxD+LGY9qmP//QPp/Bzlw/sw=
X-Received: by 2002:a05:6102:308b:: with SMTP id
 l11mr2597359vsb.14.1587642926008; 
 Thu, 23 Apr 2020 04:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1582529411.git.xji@analogixsemi.com>
 <a81adcf2e79d440edcb7b3989f31efcb80a6e9ff.1582529411.git.xji@analogixsemi.com>
In-Reply-To: <a81adcf2e79d440edcb7b3989f31efcb80a6e9ff.1582529411.git.xji@analogixsemi.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 23 Apr 2020 19:55:15 +0800
Message-ID: <CANMq1KBfB6tXFqYGvr=8fV_bpCV5GbVHeEbRs+fuaZba65-OPw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to
 DP bridge driver
To: Xin Ji <xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Pi-Hsun Shih <pihsun@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Just commenting on the mode_fixup function that was added in v7.

On Tue, Feb 25, 2020 at 2:15 PM Xin Ji <xji@analogixsemi.com> wrote:
>
> The ANX7625 is an ultra-low power 4K Mobile HD Transmitter designed
> for portable device. It converts MIPI DSI/DPI to DisplayPort 1.3 4K.
>
> The ANX7625 can support both USB Type-C PD feature and MIPI DSI/DPI
> to DP feature. This driver only enabled MIPI DSI/DPI to DP feature.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/Makefile           |    2 +-
>  drivers/gpu/drm/bridge/analogix/Kconfig   |    6 +
>  drivers/gpu/drm/bridge/analogix/Makefile  |    1 +
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2172 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  410 ++++++
>  5 files changed, 2590 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
>  create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h
>
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 4934fcf..bcd388a 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
[snip]
> +static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
> +                                     const struct drm_display_mode *mode,
> +                                     struct drm_display_mode *adj)
> +{
> +       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> +       struct device *dev = &ctx->client->dev;
> +       u32 hsync, hfp, hbp, hactive, hblanking;
> +       u32 adj_hsync, adj_hfp, adj_hbp, adj_hblanking, delta_adj;
> +       u32 vref, adj_clock;
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
> +
> +       mutex_lock(&ctx->lock);

Why do you need this lock?

> +
> +       hactive = mode->hdisplay;

This is never used, drop it?

> +       hsync = mode->hsync_end - mode->hsync_start;
> +       hfp = mode->hsync_start - mode->hdisplay;
> +       hbp = mode->htotal - mode->hsync_end;
> +       hblanking = mode->htotal - mode->hdisplay;
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "before mode fixup\n");
> +       DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d),hfp(%d),hbp(%d),clock(%d)\n",
> +                            hsync,
> +                            hfp,
> +                            hbp,
> +                            adj->clock);
> +       DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d),hsync_end(%d),htotal(%d)\n",
> +                            adj->hsync_start,
> +                            adj->hsync_end,
> +                            adj->htotal);
> +
> +       adj_hfp = hfp;
> +       adj_hsync = hsync;
> +       adj_hbp = hbp;
> +       adj_hblanking = hblanking;
> +
> +       /* plus 1 if hfp is odd */

A better way to word these comments is to say "hfp needs to be even",
otherwise, you're just repeating what we can already see in the code.

> +       if (hfp & 0x1) {
> +               adj_hfp = hfp + 1;

adj_hfp -= 1 for consistency?

> +               adj_hblanking += 1;
> +       }
> +
> +       /* minus 1 if hbp is odd */
> +       if (hbp & 0x1) {
> +               adj_hbp = hbp - 1;

ditto, adj_hbp -= 1;

> +               adj_hblanking -= 1;
> +       }
> +
> +       /* plus 1 if hsync is odd */
> +       if (hsync & 0x1) {
> +               if (adj_hblanking < hblanking)
> +                       adj_hsync = hsync + 1;

ditto

> +               else
> +                       adj_hsync = hsync - 1;

ditto

> +       }
> +
> +       /*
> +        * once illegal timing detected, use default HFP, HSYNC, HBP
> +        */
> +       if (hblanking < HBLANKING_MIN || (hfp < HP_MIN && hbp < HP_MIN)) {

should this be adj_hblanking/adj_hfp/adj_hbp?

> +               adj_hsync = SYNC_LEN_DEF;
> +               adj_hfp = HFP_HBP_DEF;
> +               adj_hbp = HFP_HBP_DEF;
> +               vref = adj->clock * 1000 / (adj->htotal * adj->vtotal);
> +               if (hblanking < HBLANKING_MIN) {
> +                       delta_adj = HBLANKING_MIN - hblanking;
> +                       adj_clock = vref * delta_adj * adj->vtotal;
> +                       adj->clock += DIV_ROUND_UP(adj_clock, 1000);
> +               } else {
> +                       delta_adj = hblanking - HBLANKING_MIN;
> +                       adj_clock = vref * delta_adj * adj->vtotal;
> +                       adj->clock -= DIV_ROUND_UP(adj_clock, 1000);
> +               }
> +
> +               DRM_WARN("illegal hblanking timing, use default.\n");
> +               DRM_WARN("hfp(%d),hbp(%d),hsync(%d).\n", hfp, hbp, hsync);

How likely is it that this mode is going to work? Can you just return
false here to reject the mode?

> +       } else if (adj_hfp < HP_MIN) {
> +               /* adjust hfp if hfp less than HP_MIN */
> +               delta_adj = HP_MIN - adj_hfp;
> +               adj_hfp = HP_MIN;
> +
> +               /*
> +                * balance total HBlanking pixel, if HBP hasn't enough space,

"does not have enough space"

> +                * adjust HSYNC length, otherwize adjust HBP

otherwise

> +                */
> +               if ((adj_hbp - delta_adj) < HP_MIN)
> +                       /* hbp not enough space */
> +                       adj_hsync -= delta_adj;
> +               else
> +                       adj_hbp -= delta_adj;
> +       } else if (adj_hbp < HP_MIN) {
> +               delta_adj = HP_MIN - adj_hbp;
> +               adj_hbp = HP_MIN;
> +
> +               /*
> +                * balance total HBlanking pixel, if HBP hasn't enough space,
> +                * adjust HSYNC length, otherwize adjust HBP
> +                */
> +               if ((adj_hfp - delta_adj) < HP_MIN)
> +                       /* hbp not enough space */
> +                       adj_hsync -= delta_adj;
> +               else
> +                       adj_hfp -= delta_adj;
> +       }
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "after mode fixup\n");
> +       DRM_DEV_DEBUG_DRIVER(dev, "hsync(%d),hfp(%d),hbp(%d),clock(%d)\n",

Add spaces after commas in your debug strings (same above and below).

> +                            adj_hsync,
> +                            adj_hfp,
> +                            adj_hbp,
> +                            adj->clock);

Put these 4 on a single line.

> +
> +       /* reconstruct timing */
> +       adj->hsync_start = adj->hdisplay + adj_hfp;
> +       adj->hsync_end = adj->hsync_start + adj_hsync;
> +       adj->htotal = adj->hsync_end + adj_hbp;
> +       DRM_DEV_DEBUG_DRIVER(dev, "hsync_start(%d),hsync_end(%d),htotal(%d)\n",
> +                            adj->hsync_start,
> +                            adj->hsync_end,
> +                            adj->htotal);
> +
> +       mutex_unlock(&ctx->lock);
> +
> +       return true;
> +}
> +
> [snip]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
