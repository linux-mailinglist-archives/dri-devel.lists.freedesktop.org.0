Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5B5A9618
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 13:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1088310E694;
	Thu,  1 Sep 2022 11:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3C310E694
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 11:54:51 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id gb36so13264143ejc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 04:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=7ku7vR7HRNgBC+9TdlBkQp34+lUKYAH7n6Kb36qLREg=;
 b=mFg/401Il4EWtSKxLHLFaMntDzh3V/kCkipAWgIdX5r5y+IpMeAgamZcOeCpWR9JAG
 20gvy8kn6Fx5QFhhWx02eL/xWl7XbJGcVqpqKUhFO+r4mzU/wQcxGprpuFTjdZ4kGKM0
 tuNfeIK2/VazUrAOYZC+dO6WGui2J8WqmorDBqyHqNCBC0BiJmtYmuqhZWaK6fSXyY+y
 blMQn85wmZC2aveQaxo9iLSBNUiN7fsCp75liTSpkpEPmm2D7bir4vXLKR2Z8k6xQgXf
 OG+ekiOORCIMLIvyl2jLXhiVBz7mliKSbmEp1AdlVLCKEkTWfcF4XFxPH8qSglz7lS6y
 yHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=7ku7vR7HRNgBC+9TdlBkQp34+lUKYAH7n6Kb36qLREg=;
 b=UZbemkH1+lc2fl5Hsxml11s7TSfZm9TqMfCdmmQKM6yD7hwz3Yzh7tIsVUQgYeR1b0
 zhRbTisVf32xUHsWXOJu17t6cC/HZLKOgspLR9ap+wzbLMsoH3RKTMhXfY07xV31CxgQ
 Q125wBwaxSoMI+Iadw8igHxFLrpWdjgVdpuH596AebxEtrxb2NwrrsyCykg0VjEWZUB/
 8NarG2gQjKLfEUxudw2fmF2nH90NFTzeI8ZHVVE6NJERX5bCy1sBzF9Ta9s+hC6zq7wT
 Df1tauvX3JTcDMm5Cbpfz4jhh7oett9JarI09jtCL+PI3qN76JRMw+55Ej3dJTPTPf5o
 RpiA==
X-Gm-Message-State: ACgBeo2pNFRRHKrslE0Mdux5bDRo3XFr+gpQRboGc29BXWF0HsOTY6DY
 z6g1sg/wU8V/B28pIu+nbUMIEOIgaQe3n54k3u5gKg==
X-Google-Smtp-Source: AA6agR7wDik4CQise327pDeJlSfRwkRjJnhYhNOYWSu1XYgxyFCA3Jot/9HirJteZ2P5zLLPnDvENBe/YCm2zVWZnoE=
X-Received: by 2002:a17:907:743:b0:740:ef93:2ffc with SMTP id
 xc3-20020a170907074300b00740ef932ffcmr19687953ejb.514.1662033290331; Thu, 01
 Sep 2022 04:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220831082653.20449-1-tomi.valkeinen@ideasonboard.com>
 <20220831082653.20449-2-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220831082653.20449-2-tomi.valkeinen@ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 1 Sep 2022 13:54:39 +0200
Message-ID: <CAG3jFyt0xh4S629WfTa-dy=TsaL-K9R0Gaw_Djrwhrsktrw2_Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] drm/bridge: ti-sn65dsi86: Reject modes with too
 large blanking
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 31 Aug 2022 at 10:27, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> The front and back porch registers are 8 bits, and pulse width registers
> are 15 bits, so reject any modes with larger periods.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 90bbabde1595..09d3c65fa2ba 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -747,6 +747,29 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
>         if (mode->clock > 594000)
>                 return MODE_CLOCK_HIGH;
>
> +       /*
> +        * The front and back porch registers are 8 bits, and pulse width
> +        * registers are 15 bits, so reject any modes with larger periods.
> +        */
> +
> +       if ((mode->hsync_start - mode->hdisplay) > 0xff)
> +               return MODE_HBLANK_WIDE;
> +
> +       if ((mode->vsync_start - mode->vdisplay) > 0xff)
> +               return MODE_VBLANK_WIDE;
> +
> +       if ((mode->hsync_end - mode->hsync_start) > 0x7fff)
> +               return MODE_HSYNC_WIDE;
> +
> +       if ((mode->vsync_end - mode->vsync_start) > 0x7fff)
> +               return MODE_VSYNC_WIDE;
> +
> +       if ((mode->htotal - mode->hsync_end) > 0xff)
> +               return MODE_HBLANK_WIDE;
> +
> +       if ((mode->vtotal - mode->vsync_end) > 0xff)
> +               return MODE_VBLANK_WIDE;
> +
>         return MODE_OK;
>  }
>
> --
> 2.34.1
>


Reviewed-by: Robert Foss <robert.foss@linaro.org>
