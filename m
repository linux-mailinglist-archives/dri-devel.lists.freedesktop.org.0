Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3144D0BF4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 00:21:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948BB10E19C;
	Mon,  7 Mar 2022 23:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9695310E19C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 23:21:44 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z19so736762edb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x4LLMVs4SZ7QvseE6w5ftUNf9lVckC3RDBoYM0EFIDE=;
 b=ThMD+dbiLXkBNHXSUOp/TCqN39zftsJ2YeoVnCSVRgksqbEwShSMTLMQDxtpotpDPI
 UtnheIGCjS5S5J36Kmgg7Zfy4E31WE+cUU29Dkzdp6LTbSPvQbRzG+9UB5nzl+rHxN5d
 4dhxTaH+VrgM2Coi5dOnGVG7q5i2qwGS7J9MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x4LLMVs4SZ7QvseE6w5ftUNf9lVckC3RDBoYM0EFIDE=;
 b=GxODqKIDePwyArwLEAybw0uWpvVfJ36obacNZYxMJHyxFyTIqXRf6SyvtiulxtRNIt
 HeGjPdBg7x6b5zN/z2Y2mqB83XrmAuqKlqx/sVyyZYOF2ApvDrjQuIyE0t6GFI07st5/
 Q1jY6R/s2nlr1vnP8L+RKEmS0h2QwUhn1VZrlx5DKvdnF+TlBFovrxe37pnLTG3/i2jJ
 YTmDBufdW3EOwL4D9Gd8lbDMAdaNy5/dXVC9yw4rmOlKdKKbNMiuHkw79wj4TZgkaTMs
 yB4x06WYjtUwkzz+WuJusSf+WLFNYeuV4jpgx82FTWHip26HujmF300sYeLvqksiT/Vu
 cgyA==
X-Gm-Message-State: AOAM532tn7OF6D6fYpuHHb+SuvuSUYE4ckNk/aBmhhdf/68wkQhKNo+d
 OokyxYN1jmMeOjOo6jiYYamwhBCLUB7jghmB
X-Google-Smtp-Source: ABdhPJwbkrNR7jTfG7sbCY9J7HGLLIIVYBuIc5bJ3pcGea0lTyK3QB7bXwqlvq8Thufg+3F/ozFEtg==
X-Received: by 2002:a05:6402:1bc8:b0:416:2375:f815 with SMTP id
 ch8-20020a0564021bc800b004162375f815mr12294052edb.130.1646695302653; 
 Mon, 07 Mar 2022 15:21:42 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 et3-20020a170907294300b006d6534ef273sm5108755ejc.156.2022.03.07.15.21.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 15:21:41 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so401865wmj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 15:21:41 -0800 (PST)
X-Received: by 2002:a05:600c:1d08:b0:381:6eda:67d1 with SMTP id
 l8-20020a05600c1d0800b003816eda67d1mr1108164wms.88.1646695300817; Mon, 07 Mar
 2022 15:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20220307175955.363057-1-kieran.bingham+renesas@ideasonboard.com>
 <20220307175955.363057-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20220307175955.363057-3-kieran.bingham+renesas@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Mar 2022 15:21:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U5VPogd4Lf9TRhpqdpfyhxArkS=fgfXMJa-hC-JqnW1Q@mail.gmail.com>
Message-ID: <CAD=FV=U5VPogd4Lf9TRhpqdpfyhxArkS=fgfXMJa-hC-JqnW1Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/bridge: ti-sn65dsi86: Make connector creation
 optional
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
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
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
> Now that the driver supports the connector-related bridge operations,
> make the connector creation optional. This enables usage of the
> sn65dsi86 with the DRM bridge connector helper.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> ---
> Changes since v1:
>  - None
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)

Can you please CC me on this series next time you send it out? I was
pretty involved in previous reviews here. Luckily I got CCed on one of
the patches so I knew to look, but since that one is (probably)
getting dropped it'd be good to make sure I was on the others. It's
also pretty important to include +Sam Ravnborg since there's a lot of
overlap with his series [1]:


> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index ffb6c04f6c46..29f5f7123ed9 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -745,11 +745,6 @@ static int  (struct drm_bridge *bridge,
>         struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>         int ret;
>
> -       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> -               DRM_ERROR("Fix bridge driver to make connector optional!");
> -               return -EINVAL;
> -       }

That won't work without some other fixes, sorry!

The problem is that you'll break ti_sn_bridge_get_bpp(). That
absolutely relies on having our own connector so you need to fix that
_before_ making the connector optional.

Rob Clark made an attempt on this [2] but Laurent didn't like the
solution he came up with. Sam's series that I mentioned [1] also made
an attempt at this, specifically in patch 5 ("drm/bridge:
ti-sn65dsi86: Fetch bpc via drm_bridge_state") of his series.
Unfortunately, it didn't work because the "output_bus_cfg.format"
wasn't set to anything. Personally I wouldn't mind Rob's solution as a
stopgap if Laurent removes his NAK. Then we're not stuck while someone
tries to find time to fix this correctly.

One last problem here is that your patch doesn't actually apply to
drm-misc/drm-misc-next, which is likely where it would land. I believe
it conflicts with my recent commit e283820cbf80 ("drm/bridge:
ti-sn65dsi86: Use drm_bridge_connector"). It looks like you based your
series on mainline, but you should really be targeting drm-misc-next.

-Doug

[1] https://lore.kernel.org/r/20220206154405.1243333-1-sam@ravnborg.org/
[2] https://lore.kernel.org/all/20210920225801.227211-4-robdclark@gmail.com/
