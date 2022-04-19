Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D5B507666
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 19:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A885E10E2B1;
	Tue, 19 Apr 2022 17:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2AD10E2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 17:20:59 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q19so24712317pgm.6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+xGUYUShO/xhuZxiBUvJtrZcv8F78nOtSBH4jJeGyE=;
 b=mnW/n3Hexi/ObHP4lg8cTz2JaM0/M1W/xjrvtyHofQcvmNsf/vFP+ZB2mJDEEZTgNT
 4d9EAnCCk8qhc+rQkVui+mi82mbrLbwU4xcgSuu0vERPvdz72cUmBHqsPUjz0JVfH8/s
 vG4pyJ+W2p219F17NM5aXkhz5Vq8XTg9n1p8CExB8HfV2GdFkvrhAi7b285amdM7uiAk
 WiD9UgH/LveP/N/HPNtN2domLnEc8S3uNCcK6UKnhlfvUV3WUslPBfZECy48U3q1P6ev
 hJEc9yXZ6QrYMpoGzLjW6+8qvv+fFTjzJq/OROc3M3L8Y7lCEhTNv36bhKS09ByAPrOy
 KrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+xGUYUShO/xhuZxiBUvJtrZcv8F78nOtSBH4jJeGyE=;
 b=u3xOfpmLjp5rSSOQf0YUXtTBhGp6V94uxY3BXM1vRrMNfbnH6r7H6WfUlZHLAPV2kE
 5e+pys1cup1Iqs48jVZn26O8shUn0A7V6MYtaSoCEaGrx5eItTZBWvBY6BLhBLdoKgvo
 BefuSSuis+h3Nhxh0cuVmq3Zx1n82rdc4CkIEALtFSOQzmXhyvG9+o/NYfUC5bXo5sdN
 kCuUtVBbJs3N9h2PcsKbUZXXfUrNwoabCtPKM/WH8y2WnFJ/B+MTa6Krvax3ohvTuOAd
 49C9qZBz76t8eTl37Gd/JnVAXMvGGE2/0gI382WffRhMUyOaNx2DT51zk4knC5uTNP8o
 sRaw==
X-Gm-Message-State: AOAM533lVPTrj/qt3EBkmsyhlev2j5REU7jWzWvJdLHj1I4uXsgWZvnE
 Ps2mPXaO2lROTxi9hm0THcPSoedJH/PaC0I0i/K4BIXMHlA=
X-Google-Smtp-Source: ABdhPJxMSv5wIWohPO0hFrRCJ/FbmXNtRS6yTiv2YhAkU8mcPDoOs+AlieexhMk+TupcYq0FrwPhK2yYFz7Q3v852io=
X-Received: by 2002:a65:4b8f:0:b0:39c:c85d:7e7a with SMTP id
 t15-20020a654b8f000000b0039cc85d7e7amr15617281pgq.324.1650388858912; Tue, 19
 Apr 2022 10:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220407185617.179573-1-marex@denx.de>
 <20220407185617.179573-2-marex@denx.de>
In-Reply-To: <20220407185617.179573-2-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Apr 2022 19:20:47 +0200
Message-ID: <CAG3jFytsSTjOKoBC9rfymOr1GZ36MmSLLOcg4Nkxe338dRQF-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: bridge: icn6211: Add DSI lane count DT property
 parsing
To: Marek Vasut <marex@denx.de>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Apr 2022 at 20:56, Marek Vasut <marex@denx.de> wrote:
>
> The driver currently hard-codes DSI lane count to two, however the chip
> is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
> property and program the result into DSI_CTRL register.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 6ce0633d4c089..e2b599a44275c 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -395,6 +395,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
>         /* dsi specific sequence */
>         chipone_writeb(icn, SYNC_EVENT_DLY, 0x80);
>         chipone_writeb(icn, HFP_MIN, hfp & 0xff);
> +
> +       /* DSI data lane count */
> +       chipone_writeb(icn, DSI_CTRL,
> +                   DSI_CTRL_UNKNOWN | DSI_CTRL_DSI_LANES(icn->dsi->lanes - 1));
> +
>         chipone_writeb(icn, MIPI_PD_CK_LANE, 0xa0);
>         chipone_writeb(icn, PLL_CTRL(12), 0xff);
>         chipone_writeb(icn, MIPI_PN_SWAP, 0x00);
> @@ -480,9 +485,23 @@ static void chipone_mode_set(struct drm_bridge *bridge,
>  static int chipone_dsi_attach(struct chipone *icn)
>  {
>         struct mipi_dsi_device *dsi = icn->dsi;
> -       int ret;
> +       struct device *dev = icn->dev;
> +       struct device_node *endpoint;
> +       int dsi_lanes, ret;
> +
> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> +       of_node_put(endpoint);
> +
> +       /*
> +        * If the 'data-lanes' property does not exist in DT or is invalid,
> +        * default to previously hard-coded behavior, which was 4 data lanes.
> +        */
> +       if (dsi_lanes >= 1 && dsi_lanes <= 4)
> +               icn->dsi->lanes = dsi_lanes;
> +       else
> +               icn->dsi->lanes = 4;
>
> -       dsi->lanes = 4;
>         dsi->format = MIPI_DSI_FMT_RGB888;
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>                           MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Fixed checkpatch --strict format warning & applied to drm-misc-next.

Rob.
