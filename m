Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8452520E
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 18:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F059B11273D;
	Thu, 12 May 2022 16:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F6911273D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:06:08 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso8297502pjw.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6c4L3XPXq81rVoXynvsz7O71O9u2rCs0fYZen1cqfro=;
 b=CKS2WPp8JqzDT//8wWJk/UNbZ5l+fZUtFJOQqLT7ZdH6maQAV5EgpQGTnuySfH6xtw
 WW1oeCbWok1OHbgQTpxptESi8BmTWhTF+qZmvjQmMvOkcUn62v029EKHeQSJq+X8+9VN
 3vZa5vt9ZtBGLu4xZ+o3SUa3Mh57eCTLHhNnyYOM02Um1eMA9z2smD4UAkrB4Yf6PMMs
 WetA8eRCT308s3RSwnpUh690FvHxGd/bqaT1eTDlEun3o5eGoWJzJvYzQ1ilCXp1k/Gu
 MBEskXQK3Wseqgx9kJIHdrRX09sH4+8dDycvl326pBxcnYEM7ZTMzKOrJiWni9GmCJk0
 NtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6c4L3XPXq81rVoXynvsz7O71O9u2rCs0fYZen1cqfro=;
 b=0wKJlfFcToTHyy5PHn98w5zNeQtSd1yybkpI1h5JXMrEcsZVPI/8gRj9QxCAJ74zLL
 Lktg810gQWf9kOggMBcIEBueqDSCTzNFA1U9QKZcKLUH6YzwQ/nfQgkmy/sHtN//Ro1C
 1Y6df+BT9pAXuAXwNZXUtN0F5Tk8UE2C1A4pax/WJYDkV3k/g3LRGArUU9yRMGQvxu7O
 cTYwGlZtXP39KzoE7yccoxLeFC8y8DBVki6wI8k0PThuZGzEoXvgqubUbTT5vlCDe9Kn
 R0BXKcdqmfU/KIhIHnRYmHkTjxLQUGlUWhrivbHnM+t2QwvjmCVWFC+LhAgAEouyrDzU
 hurg==
X-Gm-Message-State: AOAM5327RVr1KnRD/8c2nvbixp1awICuysjs4DAoeiiVWvjZ03hNmvw4
 1z48XcHwfJTUSt27Q9Af0yeRQ4oxphK09f+2cubf7g==
X-Google-Smtp-Source: ABdhPJxUYXZs/6GQyqKr701aCXf/KbHYzV5C0Msz8h3wWxRqQvVzLtyggpMbwE2XpTVLUlXJRRPR6W3EOpaZJJS1lNM=
X-Received: by 2002:a17:903:228f:b0:15e:be12:a181 with SMTP id
 b15-20020a170903228f00b0015ebe12a181mr268567plh.21.1652371567919; Thu, 12 May
 2022 09:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220429205644.245480-1-marex@denx.de>
 <20220429205644.245480-2-marex@denx.de>
In-Reply-To: <20220429205644.245480-2-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 12 May 2022 18:05:57 +0200
Message-ID: <CAG3jFyum+XNnVajNeh6iV0AH6UwT63SpDke1rbRSFkdeUkXz7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: tc358767: Add DSI-to-(e)DP mode support
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 at 22:56, Marek Vasut <marex@denx.de> wrote:
>
> Implement DSI-to-e(DP) mode, which is a mix of currently supported
> DSI-to-DPI and DPI-to-(e)DP modes. The input side is configured as
> either DSI or DPI, the DP AUX channel is registered for both input
> side options, and the DSI host is attached for both DPI and (e)DP
> output side options.
>
> One notable detail is that the DSI-to-(e)DP mode requires the Pixel
> PLL to be always enabled, which is not needed for DPI-to-(e)DP mode
> which gets the matching clock direct from DPI Pixel Clock instead.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 40 +++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index e72dd5cd9700..798da0e4d086 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -309,6 +309,9 @@ struct tc_data {
>         /* do we have IRQ */
>         bool                    have_irq;
>
> +       /* Input connector type, DSI and not DPI. */
> +       bool                    input_connector_dsi;
> +
>         /* HPD pin number (0 or 1) or -ENODEV */
>         int                     hpd_pin;
>  };
> @@ -1353,8 +1356,18 @@ static int tc_edp_stream_enable(struct tc_data *tc)
>
>         dev_dbg(tc->dev, "enable video stream\n");
>
> -       /* PXL PLL setup */
> -       if (tc_test_pattern) {
> +       /*
> +        * Pixel PLL must be enabled for DSI input mode and test pattern.
> +        *
> +        * Per TC9595XBG datasheet Revision 0.1 2018-12-27 Figure 4.18
> +        * "Clock Mode Selection and Clock Sources", either Pixel PLL
> +        * or DPI_PCLK supplies StrmClk. DPI_PCLK is only available in
> +        * case valid Pixel Clock are supplied to the chip DPI input.
> +        * In case built-in test pattern is desired OR DSI input mode
> +        * is used, DPI_PCLK is not available and thus Pixel PLL must
> +        * be used instead.
> +        */
> +       if (tc->input_connector_dsi || tc_test_pattern) {
>                 ret = tc_pxl_pll_en(tc, clk_get_rate(tc->refclk),
>                                     1000 * tc->mode.clock);
>                 if (ret)
> @@ -1394,7 +1407,10 @@ static int tc_edp_stream_enable(struct tc_data *tc)
>                 return ret;
>
>         /* Set input interface */
> -       return tc_dpi_rx_enable(tc);
> +       if (tc->input_connector_dsi)
> +               return tc_dsi_rx_enable(tc);
> +       else
> +               return tc_dpi_rx_enable(tc);
>  }
>
>  static int tc_edp_stream_disable(struct tc_data *tc)
> @@ -2004,14 +2020,18 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>                 mode |= BIT(endpoint.port);
>         }
>
> -       if (mode == mode_dpi_to_edp || mode == mode_dpi_to_dp)
> +       if (mode == mode_dpi_to_edp || mode == mode_dpi_to_dp) {
> +               tc->input_connector_dsi = false;
>                 return tc_probe_edp_bridge_endpoint(tc);
> -       else if (mode == mode_dsi_to_dpi)
> +       } else if (mode == mode_dsi_to_dpi) {
> +               tc->input_connector_dsi = true;
>                 return tc_probe_dpi_bridge_endpoint(tc);
> -       else if (mode == mode_dsi_to_edp || mode == mode_dsi_to_dp)
> -               dev_warn(dev, "The mode DSI-to-(e)DP is not supported!\n");
> -       else
> -               dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);
> +       } else if (mode == mode_dsi_to_edp || mode == mode_dsi_to_dp) {
> +               tc->input_connector_dsi = true;
> +               return tc_probe_edp_bridge_endpoint(tc);
> +       }
> +
> +       dev_warn(dev, "Invalid mode (0x%x) is not supported!\n", mode);
>
>         return -EINVAL;
>  }
> @@ -2149,7 +2169,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>
>         i2c_set_clientdata(client, tc);
>
> -       if (tc->bridge.type == DRM_MODE_CONNECTOR_DPI) { /* DPI output */
> +       if (tc->input_connector_dsi) {                  /* DSI input */
>                 ret = tc_mipi_dsi_host_attach(tc);
>                 if (ret) {
>                         drm_bridge_remove(&tc->bridge);

Reviewed-by: Robert Foss <robert.foss@linaro.org>
