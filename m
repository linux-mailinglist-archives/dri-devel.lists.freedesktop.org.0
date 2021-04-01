Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6938351455
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 13:12:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1029B6EC86;
	Thu,  1 Apr 2021 11:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD0B6EC86
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 11:12:46 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so3679134wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bXbJ5DVv2ODi8qpZUW8ef/S0ZUd7MAex4+fYcH80Zr8=;
 b=FIGZavp1CZK2CtsIWpLlPGkPNG15SKTaRhWJJQ8SRAGa8ilx6wu99bqVTW2KeV6/zy
 CRI3ohmcip534C4spGMgwqNkzqLB2bweBIYmpxW3RD8i06YNcw0K6kdVT6j1cvhcAZmE
 o5KyYAeTmJTDFr4CCtk4puhVkcGBa55qBMiJ9HMnhvkvu9eHe+DE1fULow7KQEq7PIuQ
 U9hHQgkKKPLqUt2PYrTK+qgpDgIfF2GX8mwv2mfD4YZXa0716mzwxXWLzJAzdyt8oPF4
 oTJjkDSTlwuiQ4D86KvImST55DWNgPjXZ2dNo+aMZRfVEdik+8V/oF4vAouroYydj9ab
 Axaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bXbJ5DVv2ODi8qpZUW8ef/S0ZUd7MAex4+fYcH80Zr8=;
 b=qdLvIeaQN0gnjNCzDRrJX8U0Ky189oCiirQwzMMT6J3UBvTF8aRdei2MW5aQ1Ov/ex
 jBK7zAAoIjkTU3MexEQnE4ikSTo4dHR4ccPj4f5MEA0HSuJnhSxER1Ri4gnV9IRJpe7L
 iiTuCYVA/U6gpenutP6Hz2FgcOAWKh0ywkd8StzC1UWU3tVQ3BRfulfTRYyMYBrvPN7I
 xw8OP5Bi6m2BebRi8BIjlP6qe/P1XZAtX0XXurbueRCHZYKOxgC0GyrXbJWKf/kpraZo
 CZA0eCvAqWH8TIKO65A3bXUCDsSxs3ZNui3JuB+9ai3ARfrAYv2SQ6EfH5dcV+RKUFs0
 d13g==
X-Gm-Message-State: AOAM532QifBg/zOWKNysXfqD5JH3dSX6Y7/eW4u48MrLzOoINDl7+VuV
 35GNn7bzG7e53LEyTuG5NYbHItaTyp/1C6YMD7YrJg==
X-Google-Smtp-Source: ABdhPJyjb05J1rTLABe89usXn2ya30FR6tIhTRkUiE/gzAaNbgdY+LcSjxUoSEMWsvqRUT0vzSaFnpAGX1asKs9R/1E=
X-Received: by 2002:a05:600c:247:: with SMTP id
 7mr7554587wmj.116.1617275564700; 
 Thu, 01 Apr 2021 04:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210318092917.831995-1-maxime@cerno.tech>
 <20210318092917.831995-4-maxime@cerno.tech>
In-Reply-To: <20210318092917.831995-4-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Apr 2021 12:12:29 +0100
Message-ID: <CAPY8ntCOtqFoMe7XoxUgoZDed08ZYGeFxfyPZCYdQSR+Vr0fEw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/vc4: hdmi: Check and warn if we can't reach
 4kp60 frequencies
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 18 Mar 2021 at 09:29, Maxime Ripard <maxime@cerno.tech> wrote:
>
> In order to reach the frequencies needed to output at 594MHz, the
> firmware needs to be configured with the appropriate parameters in the
> config.txt file (enable_hdmi_4kp60 and force_turbo).
>
> Let's detect it at bind time, warn the user if we can't, and filter out
> the relevant modes.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  8 ++++++++
>  2 files changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index eaee853bb404..0924a1b9e186 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -210,6 +210,18 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
>         ret = drm_add_edid_modes(connector, edid);
>         kfree(edid);
>
> +       if (vc4_hdmi->disable_4kp60) {
> +               struct drm_device *drm = connector->dev;
> +               struct drm_display_mode *mode;
> +
> +               list_for_each_entry(mode, &connector->probed_modes, head) {
> +                       if ((mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK) {
> +                               drm_warn_once(drm, "The core clock cannot reach frequencies high enough to support 4k @ 60Hz.");
> +                               drm_warn_once(drm, "Please change your config.txt file to add hdmi_enable_4kp60.");
> +                       }
> +               }
> +       }
> +
>         return ret;
>  }
>
> @@ -959,6 +971,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>                 return -EINVAL;
>
> +       if (vc4_hdmi->disable_4kp60 && (pixel_rate > HDMI_14_MAX_TMDS_CLK))
> +               return -EINVAL;
> +
>         vc4_state->pixel_rate = pixel_rate;
>
>         return 0;
> @@ -978,6 +993,9 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>         if ((mode->clock * 1000) > vc4_hdmi->variant->max_pixel_clock)
>                 return MODE_CLOCK_HIGH;
>
> +       if (vc4_hdmi->disable_4kp60 && ((mode->clock * 1000) > HDMI_14_MAX_TMDS_CLK))
> +               return MODE_CLOCK_HIGH;
> +
>         return MODE_OK;
>  }
>
> @@ -1992,6 +2010,14 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         vc4_hdmi->disable_wifi_frequencies =
>                 of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
>
> +       if (variant->max_pixel_clock == 600000000) {
> +               struct vc4_dev *vc4 = to_vc4_dev(drm);
> +               long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
> +
> +               if (max_rate < 550000000)
> +                       vc4_hdmi->disable_4kp60 = true;
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
> 2.30.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
