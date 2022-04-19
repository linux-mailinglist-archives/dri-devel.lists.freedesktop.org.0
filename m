Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40195072AD
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 18:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC9610EF37;
	Tue, 19 Apr 2022 16:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2405710EF35
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 16:10:36 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so2373799pjf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t2zUDBVZeufodaZBNXLQJpGoBp+9yrpMkHJh0fQiqf0=;
 b=J+4gxcqoPhHaR+hm2f5I3WcEL8MofsAJ/pbl3RrfAaP7mLrBTP+JmjS4/QwVj3DY9S
 bHEclbIp2kARdIePLa0wyZ7DYtaOG0UBbQVSk1GGbWC7TmlGV7WYw3a2o9Hd3mYp2xgB
 /OHIXsW+qA2OhuvkS31eGQlZkAzUCXSVAXY/dXsM5kPbH0pCRE224YxhZWRMOSIpAGfC
 LB3FRhHrcgP6sRHgoICbrDCA2eJ4QUSNgt44nOgZSZrK7fkU2UYeOC0NEnMJBjxKu0By
 /lglHKovo6lSP09RkiPDmhkw+wg5V9gFIUedey4AtVnuhPNKdNN39Qu5k2+JlYysNcdx
 fbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t2zUDBVZeufodaZBNXLQJpGoBp+9yrpMkHJh0fQiqf0=;
 b=auFSM6AjPP1O3Q58/R/Kvyb/JgYETAKn+dqPq3zfYMFDQDCUegZkHKs/5/5pctnsb1
 y98XonVprpQxHO5Wmn4aGNbM1NmMRAb2/C16dQ/a+SKAk4ABlGKn+9KdnlK+BaeuvMRI
 C+jWIpQMT5IISBEvWJyMyRRN/+wzjy/rreidq8bbjdOT70gsL/KMie1cbHiHXZdNktGA
 TpWnrcvJ1f022Yly+MF4k46bocvQDONEjUW9l8p1HXd7HzHd3qCAjhFMGUTUKLRkIfav
 RqKblaC4Y9t39k31dxABWNAbyTC8y/bGTzlWm9sN+CQMN5X0Ex9yFXPLhw1nyK7gIGVj
 7P4A==
X-Gm-Message-State: AOAM532CU156csIhXJqVM6Rrn0OrwFA+oXgq1gcZougMhBPosgV/wkv6
 ZrKJ3Xmza2VAmJSdf8TYXrUciKsrlUvxs3Hwv7OMiA==
X-Google-Smtp-Source: ABdhPJxfhzMAM4PyybWFTYly1A2JBF1qg31SECQqXlnwLv87FBwbiKELjuIBwecIgyRvQhlreJfhF0QoBprPDxdXub0=
X-Received: by 2002:a17:90b:3e84:b0:1d2:c015:2182 with SMTP id
 rj4-20020a17090b3e8400b001d2c0152182mr6983945pjb.232.1650384635662; Tue, 19
 Apr 2022 09:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220419142453.48839-1-biju.das.jz@bp.renesas.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Apr 2022 18:10:24 +0200
Message-ID: <CAG3jFytYo66aTJXk-6C7uaUSOJk=JkYYv997gg+64Mm9uZP3ZA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Enable DRM_BRIDGE_OP_HPD based on
 HPD interrupt
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Apr 2022 at 16:25, Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> Connector detection using poll method won't work in case of bridge
> attached to the encoder with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR, as
> the code defaults to HPD.
>
> Enable DRM_BRIDGE_OP_HPD based on HPD interrupt availability, so that
> it will fall back to polling, if HPD is not available.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 668dcefbae17..b3f10c54e064 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1292,8 +1292,10 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>                 goto err_unregister_cec;
>
>         adv7511->bridge.funcs = &adv7511_bridge_funcs;
> -       adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> -                           | DRM_BRIDGE_OP_HPD;
> +       adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
> +       if (adv7511->i2c_main->irq)
> +               adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
> +
>         adv7511->bridge.of_node = dev->of_node;
>         adv7511->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next
