Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E53485750
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 18:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C080110F7D9;
	Wed,  5 Jan 2022 17:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDFCF11229F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 17:34:09 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so6935870pjp.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jan 2022 09:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qzLkrKvzf4U9brrtJ/3zSRGG7qJqvKjcyzgpbg4OR7o=;
 b=bNxkLOSbNiE/cewnhs6irchlQbeHzqbhgGQrmOP9jDjSYoROJbonp3xgs8SAzJ1xpv
 PYeoKPrPjBoI3DGf3Krn5qcpuwy4t1CLIVFoPNMIxIUu0Ff4coPjxaDDbfRh0pwrjFte
 1Dyef/Z9uXNrBJWyP9xRupQ6+cPbfPOuLzLJrOkzxW3ayIsbhIYMRE1TLqTcESSdMWQZ
 R9WjbmUaIQr5WP9u1grncJhgiPf8S4D5wK1W01ZJtVtI9G9r9tNTbA/NsPqQ3g/wngsU
 QV5j5MciS99bhoO+Uz/S0wTjh1fTcI6nxh0ztsanPxJSCBiokkzACPbakcELefpTpdrc
 vCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzLkrKvzf4U9brrtJ/3zSRGG7qJqvKjcyzgpbg4OR7o=;
 b=ByuFd/HsOAAauN3m9qHIYKhh6GSyplhsURRKEPAOXd2DlccbL347IroxoGnlauGSos
 gl+T5OIb4iiX/tjEep1kbgB9NswPXRfuyreTBrSzLVs6CbW2pfFTkbx5VWe2GwTH/mS4
 +pweK+HFxFz/KGUcveF21+uxt+oeJ8A/ijHjzM+eaIb/ArMZlc3XtBjuJ9Ze6uMRJ1Xz
 BZJDhowX8VnT9KsivplxdSal9Hg6cyCC1onAaYtOAyFcgkL5zDrb8ZUerliCJB1751Z1
 zLIjmircLktTFiIFEZmFSD0nH7TSBXu720fqhObANzspfuI6vyzUdtyBH+A6hR3K4G71
 1l8w==
X-Gm-Message-State: AOAM533/jJUnEyzxOQpkDqlQjdpxcx3lw168QP10A8YMqLLIT92DRRs/
 kRa4QTIRacAejw5sXoyVQnRiim4pqSMjafCg8YbungR64XZQWA==
X-Google-Smtp-Source: ABdhPJxT9Zl9HHHjb3sOf7PjsVVoVZqqork5XhastH019KbAUFjsGdqiHG6cQ4Q0avYjek53MPn/pTeCYyCbAlABoj8=
X-Received: by 2002:a17:903:110c:b0:149:8018:e9d4 with SMTP id
 n12-20020a170903110c00b001498018e9d4mr41928668plh.117.1641404049262; Wed, 05
 Jan 2022 09:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20220105090802.73564-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220105090802.73564-1-angelogioacchino.delregno@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 5 Jan 2022 18:33:58 +0100
Message-ID: <CAG3jFytpm95P_VVkyrzRVPsFv2yP6QSJOaLM2en6afmR6WwteQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: parade-ps8640: Link device to ensure
 suspend/resume order
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Jan 2022 at 10:08, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Entering suspend while the display attached to this bridge is still on
> makes the resume sequence to resume the bridge first, display last:
> when this happens, we get a timeout while resuming the bridge, as its
> MCU will get stuck due to the display being unpowered.
>
> On the other hand, on mt8173-elm, closing the lid makes the display to
> get powered off first, bridge last, so at resume time the sequence is
> swapped (compared to the first example) and everything just works
> as expected.
>
> Add a stateless device link to the DRM device that this bridge belongs
> to, ensuring a correct resume sequence and solving the unability to
> correctly resume bridge operation in the first mentioned example.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 27 ++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 818704bf5e86..450bc9bdf295 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -102,6 +102,7 @@ struct ps8640 {
>         struct regulator_bulk_data supplies[2];
>         struct gpio_desc *gpio_reset;
>         struct gpio_desc *gpio_powerdown;
> +       struct device_link *link;
>         bool pre_enabled;
>  };
>
> @@ -456,14 +457,36 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
>                 return ret;
>         }
>
> +       ps_bridge->link = device_link_add(bridge->dev->dev, dev, DL_FLAG_STATELESS);
> +       if (!ps_bridge->link) {
> +               dev_err(dev, "failed to create device link");
> +               ret = -EINVAL;
> +               goto err_devlink;
> +       }
> +
>         /* Attach the panel-bridge to the dsi bridge */
> -       return drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
> +       ret = drm_bridge_attach(bridge->encoder, ps_bridge->panel_bridge,
>                                  &ps_bridge->bridge, flags);

Bad alignment according to checkpatch --strict

> +       if (ret)
> +               goto err_bridge_attach;
> +
> +       return 0;
> +
> +err_bridge_attach:
> +       device_link_del(ps_bridge->link);
> +err_devlink:
> +       drm_dp_aux_unregister(&ps_bridge->aux);
> +
> +       return ret;
>  }
>
>  static void ps8640_bridge_detach(struct drm_bridge *bridge)
>  {
> -       drm_dp_aux_unregister(&bridge_to_ps8640(bridge)->aux);
> +       struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +
> +       drm_dp_aux_unregister(&ps_bridge->aux);
> +       if (ps_bridge->link)
> +               device_link_del(ps_bridge->link);
>  }
>
>  static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
> --
> 2.33.1
>

Fixed alignment issue, applied to drm-misc-next and added r-b tag.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
