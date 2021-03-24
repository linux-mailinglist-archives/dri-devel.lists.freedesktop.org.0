Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85653484DD
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 23:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EE06EAB1;
	Wed, 24 Mar 2021 22:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF516EAB0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 22:47:21 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id m7so313484qtq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8WdGt1t0T8Zm9fu1FD2a5P7lZ9YFS8pFD0IMcWsA6ng=;
 b=isY5DCYNbVu/s92nJ7NtbWIJq7KSn6z6GsqA2Ent70ODNyDKcZnsLCDoP2EfDmu1I8
 54glC6krK7SW1xwp8+qtFmk6JVhQdttu313b024myEqYQQcvEqqFb3jTp99VLBH/cCH3
 Ys10NMAQBTlxHhfx9gQKrs8jVWOhxHmrVDw5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8WdGt1t0T8Zm9fu1FD2a5P7lZ9YFS8pFD0IMcWsA6ng=;
 b=hYA3QRQRK6d1iNxR2FqX13L+Ui7Cw1x01XpyYtotyd+lKx5lPl9OeVrUCKqd6MfPHP
 41akdbnisv8NOq6tGuRT1LpQNL3CfLcm0R3urEaMWgA5JMGPnd1T8iL1iNvEJhKPTLe5
 0F3pFTub3RXaW69b6phbm7II45Dv4l8Vm2CJ11TFg0AFak03uNyrqI4UGmZOLw3x9/4q
 x3VJ4ds6XygVCwt4THlOC6DUGSCSpIPAA/V65+/1CGwJZ4tPMFwNfbseqTqaswwh6eYX
 l8vdVdxR/zlv0iSNleLs1WRckzdSPD3M3pkZQapKft2fU6HH14yg79Aa2tJ6s9v/yD3F
 oTsg==
X-Gm-Message-State: AOAM533ZACXhhl+9i39nBOdhizvGX7dX8AWFYT4IOXPMeg04cn5ZIUks
 et38lLuEZrPf3+SlVAW+gnizWGdRLAf1bw==
X-Google-Smtp-Source: ABdhPJxqVemgTyEepHdJnfJLS2Iiprtr8fzgd+QM8jf/IgHagB1bT6w2BiTQXChRy+6ZDFyVcmN/XA==
X-Received: by 2002:aed:2bc1:: with SMTP id e59mr5164364qtd.16.1616626039907; 
 Wed, 24 Mar 2021 15:47:19 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id z11sm2888749qkg.52.2021.03.24.15.47.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 15:47:19 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id i9so291346ybp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 15:47:19 -0700 (PDT)
X-Received: by 2002:a25:ab54:: with SMTP id u78mr8254860ybi.276.1616626038338; 
 Wed, 24 Mar 2021 15:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20210322030128.2283-11-laurent.pinchart+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Mar 2021 15:47:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
Message-ID: <CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com>
Subject: Re: [RFC PATCH 10/11] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Mar 21, 2021 at 8:02 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Despite the SN65DSI86 being an eDP bridge, on some systems its output is
> routed to a DisplayPort connector. Enable DisplayPort mode when the next
> component in the display pipeline is not a panel, and disable eDP
> features in that case.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 32 ++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index e2527d597ccb..f792227142a7 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -55,6 +55,7 @@
>  #define SN_LN_ASSIGN_REG                       0x59
>  #define  LN_ASSIGN_WIDTH                       2
>  #define SN_ENH_FRAME_REG                       0x5A
> +#define  ASSR_CONTROL                          BIT(0)
>  #define  VSTREAM_ENABLE                                BIT(3)
>  #define  LN_POLRS_OFFSET                       4
>  #define  LN_POLRS_MASK                         0xf0
> @@ -86,6 +87,8 @@
>  #define SN_DATARATE_CONFIG_REG                 0x94
>  #define  DP_DATARATE_MASK                      GENMASK(7, 5)
>  #define  DP_DATARATE(x)                                ((x) << 5)
> +#define SN_TRAINING_SETTING_REG                        0x95
> +#define  SCRAMBLE_DISABLE                      BIT(4)
>  #define SN_ML_TX_MODE_REG                      0x96
>  #define  ML_TX_MAIN_LINK_OFF                   0
>  #define  ML_TX_NORMAL_MODE                     BIT(0)
> @@ -723,6 +726,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
>         regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
>                            DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
>
> +       /* For DisplayPort, use the standard DP scrambler seed. */
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
> +                                  ASSR_CONTROL, 0);

I don't actually know anything about DP scrambler seeds. However:

1. From reading the docs, this field seems to be documented to be
"read only" unless:

1a) The "TEST2" pin is pulled high when you power on the bridge.
1b) You set "ASSR_OVERRIDE" (page select to page 7, write to register
0x16, page select back to page 0).

I don't know if TEST2 is being pulled high in your hardware, but at
least I can see that 1b) isn't done. So I'm guessing that this line is
a no-op? If I had to guess from all the hoops they're making you jump
through there's some sort of errata around standard scrambling on this
bridge chip. Are you sure it works OK?


2. The docs I see claim that this field is 2 bits big. It seems like
it would be nice to honor. Yeah, it's silly because 0x11 and 0x10 are
"reserved" so it's really more like a 1-bit field, but still seems
like it would be better to set both bits, or at least add a comment
explaining why you're not matching the datasheet.


3. Your patch doesn't seem to touch the bit of code in
ti_sn_bridge_enable() that says this:

/**
 * The SN65DSI86 only supports ASSR Display Authentication method and
 * this method is enabled by default. An eDP panel must support this
 * authentication method. We need to enable this method in the eDP panel
 * at DisplayPort address 0x0010A prior to link training.
 */
drm_dp_dpcd_writeb(&pdata->aux, DP_EDP_CONFIGURATION_SET,
   DP_ALTERNATE_SCRAMBLER_RESET_ENABLE);

Won't that be a problem?


> +
>         /* enable DP PLL */
>         regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
>
> @@ -734,6 +742,11 @@ static int ti_sn_link_training(struct ti_sn_bridge *pdata, int dp_rate_idx,
>                 goto exit;
>         }
>
> +       /* For DisplayPort, disable scrambling mode. */
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
> +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);

I'm assuming that this is the important part of your patch? Would be
sorta nice to include the "why" in your comment. Why do you want to
disable scrambling mode for DP but not for eDP? Maybe you care about
compatibility but not EMI if you're hooking up to random DP things?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
