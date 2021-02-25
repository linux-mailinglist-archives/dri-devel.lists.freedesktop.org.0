Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A893253A9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:38:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05A76ECD4;
	Thu, 25 Feb 2021 16:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C62C6ECD4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 16:38:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b3so5885271wrj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 08:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e+HMCPKo8jukqE6muWYS/MvNE0zd3FwHLxo7lcUmejQ=;
 b=U6/eMioLvfuOpfMtGgJpjZKrXkxyyBFg4kxc5xJkVOcAvI5wd6Y4yDnsadmnHOrwAo
 z3MKOhlOFY4sqNGPI0H3coleNgViqehQtv8gEXHgk0XrnqAA4WaIpHhoVVkpK3OXoyOJ
 biAd/lKGVp6NJda5NIm3HUgrMnaIYR38zB3WHNsfOEQ3A6Oamz1V8YDWQuLHepsvoB44
 QvipjXBkpHrqpGoOhEpvKqdoOST0x61Ws/M721LBM99BEE7J2YWsYBXQqMvBzrjXAP7R
 Pf7AEC8T9FBAV7g+6DK15ICnlqwApEAHPxQXJbpeV4kmXWGZJqk0W8rf7BeOxIALbYjV
 /fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e+HMCPKo8jukqE6muWYS/MvNE0zd3FwHLxo7lcUmejQ=;
 b=eukN3hjyZdlUDaHMZLVMm4s9cYm4TtUePql9HjzvgT29GVZg1XgxFzBC8MjiP9s6+C
 wyf2RNzrKX5WOw58BGUazwLXyTA5zBRt7hQDYXp12c7gXurH+xvj3iL54Qc54t6tlJHX
 lq43TaWAaaVtdHu2B0FBweJkwESwfNqrqGSj6pSRmrSGlqax8WR1ze1oUBqUqJr78N6j
 4s00UDkRe4HInBcP/0UGifWAaSIsctQOKyM+pjoK3dDUa0nmY60DPnd1Bf4EoLxpsbY/
 PViHsEdjsdUDPOroBBVyIYVr6HKereXfNyrf5peu7u0zaP+pixjHl0Xmje1nEQYKCk+g
 f+UA==
X-Gm-Message-State: AOAM531PrYSWIn9nzQKYItr74Yl2Py4qAXajxVNwEu7AR1+dR3aOt2l/
 RZnhtWoxkVkkKGrcpo/TS1AQIEMgLG9JrzyKHNZ6aA==
X-Google-Smtp-Source: ABdhPJw9hCt0clHdCEKhUwceEuvI+jlIHmLo7tu/s2LP0kKZc59ewxGhhHgMzFlYozVNSoBo3lEhnOBb7Od9BhziTas=
X-Received: by 2002:adf:f681:: with SMTP id v1mr4432438wrp.150.1614271133038; 
 Thu, 25 Feb 2021 08:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-5-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-5-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 25 Feb 2021 16:38:37 +0000
Message-ID: <CAPY8ntDwQG1Ax8wgc2zZMKZgXk2+efBtFFiu7YF=_RX4Y4YUiA@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/vc4: hdmi: Check and warn if we can't reach 4kp60
 frequencies
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Stephen Boyd <sboyd@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> In order to reach the frequencies needed to output at 594MHz, the
> firmware needs to be configured with the appropriate parameters in the
> config.txt file (enable_hdmi_4kp60 and force_turbo).

force_turbo isn't the right way to go about this as it permanently
bumps all the clocks up, even if running the display at VGA.

> Let's detect it at bind time, warn the user if we can't, and filter out
> the relevant modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index b5bc742993a4..f05f6da286f7 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -953,6 +953,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>                 return -EINVAL;
>
> +       if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
> +               return -EINVAL;
> +
>         vc4_state->pixel_rate = pixel_rate;
>
>         return 0;
> @@ -972,6 +975,9 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>         if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
>                 return MODE_CLOCK_HIGH;
>
> +       if (vc4_hdmi->disable_4kp60 && ((mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK))
> +               return MODE_CLOCK_HIGH;
> +
>         return MODE_OK;
>  }
>
> @@ -1986,6 +1992,17 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         vc4_hdmi->disable_wifi_frequencies =
>                 of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
>
> +       if (variant->max_pixel_clock == 600000000) {
> +               struct vc4_dev *vc4 = to_vc4_dev(drm);
> +               long max_rate = clk_get_max_rate(vc4->hvs->core_clk);
> +
> +               if (max_rate < 550000000) {
> +                       drm_warn(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
> +                       drm_warn(drm, "Please change your config.txt file to add hdmi_enable_4kp60 and force_turbo");

Do we really want to warn in bind? Again you could have a VGA
resolution monitor attached but that would trigger this warning.
Can we warn (once) on processing the mode list and filtering out a clk
> HDMI_14_MAX_TMDS_CLK mode instead?

And mentioning force_turbo is again wrong.

  Dave

> +                       vc4_hdmi->disable_4kp60 = true;
> +               }
> +       }
> +
>         if (vc4_hdmi->variant->reset)
>                 vc4_hdmi->variant->reset(vc4_hdmi);
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 3cebd1fd00fc..3cd021136402 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -154,6 +154,14 @@ struct vc4_hdmi {
>          */
>         bool disable_wifi_frequencies;
>
> +       /*
> +        * Even if HDMI0 on the RPi4 can output modes requiring a pixel
> +        * rate higher than 297MHz, it needs some adjustments in the
> +        * config.txt file to be able to do so and thus won't always be
> +        * available.
> +        */
> +       bool disable_4kp60;
> +
>         struct cec_adapter *cec_adap;
>         struct cec_msg cec_rx_msg;
>         bool cec_tx_ok;
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
