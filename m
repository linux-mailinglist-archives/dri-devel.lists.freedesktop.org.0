Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E794D0BF9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 00:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F2B10E19F;
	Mon,  7 Mar 2022 23:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9866A10E19F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 23:22:15 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c20so3704961edr.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NtQPHi8MlejTb0WOYkUro+FgYs2jI22g5jze1Xz11Wc=;
 b=EDn3vpkM0MQwAwbvMPZgM+4OdqB7ZpPc9q1RFkFJr/ikmYNZUKI3PXVdTz9AODjcx4
 gzVtjQYGQmSseMru8nUKU6chiUchOkZOxR6fIMRcX9zdvOO2cZ9rD/Zmp3udjJpBSOCG
 uBO3oq/4FaIzk8ef+UNffI1feZv+ynCiuTZc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NtQPHi8MlejTb0WOYkUro+FgYs2jI22g5jze1Xz11Wc=;
 b=LwIL0Vd7Iy3pfcmlmZsF0rSMw6ZYLrslgArnV5R81iRAU9+rEM+0jnymqe80PDaaeP
 bS+Tr2/Nry7eAjpVGu2H+UbuMdJ5zL2Z7uCOjKmHIzKMgNfips+FfEegnnR91Afg2ZIi
 pkTHBMIj76nGYvuby37joOa6caLZXwgVk7Q9M9OJAzaDWECjkXiB3crDW0w1rmo8Gaiy
 g4DYqi9Y8jburpOl6uXmQA0VFnGsIxlaYzNGXiM11lUsPOabU6qb1H9ShXtvS6nYp74I
 02CqApOFDswSvBLyvLiaxzNMyC0e3I9+LyEFZZ7kh9V/J4lnaAkLlAoCX4te35YaEyNd
 O3rA==
X-Gm-Message-State: AOAM531A+asvL7w6LD9qX1SUEgMQv+KR/UU/utoeL51uYaa/TPXkPqd1
 9yMdtWO7p0pTVFxM6blw0skxrr4xvZici5+D
X-Google-Smtp-Source: ABdhPJw5NmCVWW7oUwmNOs4Bkw/VJJP8+4K83Irpo5EY1KhTwTr8ttYCf8XOXV69nlVteBLfzbWr9A==
X-Received: by 2002:aa7:d288:0:b0:416:3cc5:1eae with SMTP id
 w8-20020aa7d288000000b004163cc51eaemr8598081edq.306.1646695333770; 
 Mon, 07 Mar 2022 15:22:13 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056402060400b00415a1f9a4dasm6820041edv.91.2022.03.07.15.22.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 15:22:13 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so361889wmb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:22:13 -0800 (PST)
X-Received: by 2002:a7b:c0c1:0:b0:385:be1b:e6a with SMTP id
 s1-20020a7bc0c1000000b00385be1b0e6amr1048093wmh.73.1646695332499; Mon, 07 Mar
 2022 15:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220307175955.363057-4-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Mar 2022 15:22:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X=KuONU5NeFQvjTVix86CzyA2c6HWbg1HoqgS3TTy6Rg@mail.gmail.com>
Message-ID: <CAD=FV=X=KuONU5NeFQvjTVix86CzyA2c6HWbg1HoqgS3TTy6Rg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Support DisplayPort
 (non-eDP) mode
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Mar 7, 2022 at 10:00 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Despite the SN65DSI86 being an eDP bridge, on some systems its output is
> routed to a DisplayPort connector. Enable DisplayPort mode when the next
> component in the display pipeline is detected as a DisplayPort
> connector, and disable eDP features in that case.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reworked to set bridge type based on the next bridge/connector.
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> --
> Changes since v1/RFC:
>  - Rebased on top of "drm/bridge: ti-sn65dsi86: switch to
>    devm_drm_of_get_bridge"
>  - eDP/DP mode determined from the next bridge connector type.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 29f5f7123ed9..461f963faa0b 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -60,6 +60,7 @@
>  #define SN_LN_ASSIGN_REG                       0x59
>  #define  LN_ASSIGN_WIDTH                       2
>  #define SN_ENH_FRAME_REG                       0x5A
> +#define  ASSR_CONTROL                          BIT(0)
>  #define  VSTREAM_ENABLE                                BIT(3)
>  #define  LN_POLRS_OFFSET                       4
>  #define  LN_POLRS_MASK                         0xf0
> @@ -91,6 +92,8 @@
>  #define SN_DATARATE_CONFIG_REG                 0x94
>  #define  DP_DATARATE_MASK                      GENMASK(7, 5)
>  #define  DP_DATARATE(x)                                ((x) << 5)
> +#define SN_TRAINING_SETTING_REG                        0x95
> +#define  SCRAMBLE_DISABLE                      BIT(4)
>  #define SN_ML_TX_MODE_REG                      0x96
>  #define  ML_TX_MAIN_LINK_OFF                   0
>  #define  ML_TX_NORMAL_MODE                     BIT(0)
> @@ -1005,6 +1008,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>         regmap_update_bits(pdata->regmap, SN_DATARATE_CONFIG_REG,
>                            DP_DATARATE_MASK, DP_DATARATE(dp_rate_idx));
>
> +       /* For DisplayPort, use the standard DP scrambler seed. */
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG,
> +                                  ASSR_CONTROL, 0);

I thought it was agreed that this hunk wasn't doing anything and
should be removed? I did some research previously [1] and the manual
said that this bit is "read only" unless "TEST2" is pulled high. In
the previous discussion Laurent said that it wasn't. I also pointed
out that this conflicts with the bit of code in ti_sn_bridge_enable()
which tells the sink to enable the alternate scrambler.


>         /* enable DP PLL */
>         regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 1);
>
> @@ -1016,6 +1024,11 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
>                 goto exit;
>         }
>
> +       /* For DisplayPort, disable scrambling mode. */
> +       if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +               regmap_update_bits(pdata->regmap, SN_TRAINING_SETTING_REG,
> +                                  SCRAMBLE_DISABLE, SCRAMBLE_DISABLE);

In my previous review I asked for some comments to include the "why"
we disabling scrambling mode for DP. Can you please add that?

I also presume that for DP it's probably a good idea to avoid the code
in ti_sn_bridge_enable() that tells the sink to use the alternate
scrambler.


[1] https://lore.kernel.org/r/CAD=FV=Wwayx1Y-xv=RPuJbG+Q1wHrUWgh4P7wuzy_bAL=_FN0g@mail.gmail.com

-Doug
