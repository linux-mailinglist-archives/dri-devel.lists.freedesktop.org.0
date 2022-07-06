Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26185689C0
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 15:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A970411AFC7;
	Wed,  6 Jul 2022 13:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A61D11B384
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 13:42:38 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id i3so19888595oif.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 06:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pwXpporGBrh2vPam61ccyHgP72+OSTmsQcN2nueaNYg=;
 b=uz+nhisJOJYV6nP7e8GcmFLdBRDBAcgMTUSZuSWlJ8PuEhgs0Br1v7GXICt1D+5PC+
 dR9tSS9TbM2pJucVtO8PG0DjekrctOykWN9syOU+z8nhi17DNhDujVoknpweb9jCB8fL
 A5Ifg9IKvfo4+QSvdy8Q/vxXdi2CozUuthFynwq2/BKc+uZY0l1sdze/ds3jc3Fv9fuW
 7Vca3ceG9HbtK2teNK7Sg8vdHzjCcIJdKIzVoVPTU28ul1QpNxyByz3WVtgnm12y4aY5
 5rFt0UO1+4GDpEnAhKQo4yKt/JmyRvjcJ5IWR/EVFcVxgmdDs8BtjKTPfXmFbZtNoX1O
 N48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pwXpporGBrh2vPam61ccyHgP72+OSTmsQcN2nueaNYg=;
 b=f7T8JKn+HQH/8BmQrl+66qfQk0ZHAZumIy1APXKuvOT9AmhOKrOvGrIymoLTAGyndZ
 M5bP8nsOPunQwbspRCf7XdA4hzrHyPjKYipxuXs89quRpYUp/pbieIZkuzjg5pBCcJD5
 Ajw2TBSATlO1ozHsb95tz0Bb+l/Cz9iT7+S3Xov0k1muiBW9uRvNZjfOUC1U0raCbzXO
 LCmELghqou/GbAxPUqsnWxcv22Hl4GaQP6vBEL/bb1AleoU4b/mk6g/nrY+KJ74D8Zqu
 E3KYdfaf2oVo4Y/vrsshF8RNknyORLP6JSqvnzWSaGkQ3fLhQdK0shFguuipGpj//riX
 5+zw==
X-Gm-Message-State: AJIora/fiRitA2kGc63iJXi8Xxl9PiY0gHUAoqGA7TKeOl2I7NCsj0vh
 DYhaZD4ul0aAjlnTXMX/0lSKp0aXMqgKW2hcl0DqjA==
X-Google-Smtp-Source: AGRyM1vFidvgmPygsQWI63TdbrNVuaRRz0y9igLsuN9p3evihgLEkBFKYIxlMDqoqOvru7fWThMRS0uY73DfiqSRdoo=
X-Received: by 2002:a05:6808:14ca:b0:335:b401:9054 with SMTP id
 f10-20020a05680814ca00b00335b4019054mr20350449oiw.241.1657114957546; Wed, 06
 Jul 2022 06:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220706132812.2171250-1-l.stach@pengutronix.de>
 <20220706132812.2171250-3-l.stach@pengutronix.de>
In-Reply-To: <20220706132812.2171250-3-l.stach@pengutronix.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Jul 2022 15:42:25 +0200
Message-ID: <CAG3jFytKthxb27FHRG7wPvtU6T=t314Nw-SCo75qFxTe3ij_OA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: tc358767: disable main link PHYs on main
 link disable
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, patchwork-lst@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 6 Jul 2022 at 15:28, Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Disable the main link PHYs and put them into reset when the main link
> is disabled. When the PHYs stay enabled while the rest of the DP link
> circuits are disabled there is some noise on the data lanes, which some
> displays try to lock onto, waking them up from their low power state.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index fd4936215b55..615b4988bf34 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1249,7 +1249,13 @@ static int tc_main_link_disable(struct tc_data *tc)
>         if (ret)
>                 return ret;
>
> -       return regmap_write(tc->regmap, DP0CTL, 0);
> +       ret = regmap_write(tc->regmap, DP0CTL, 0);
> +       if (ret)
> +               return ret;
> +
> +       return regmap_update_bits(tc->regmap, DP_PHY_CTRL,
> +                                 PHY_M0_RST | PHY_M1_RST | PHY_M0_EN,
> +                                 PHY_M0_RST | PHY_M1_RST);
>  }
>
>  static int tc_dsi_rx_enable(struct tc_data *tc)
> --
> 2.30.2
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
