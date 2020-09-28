Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6E27AA2A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 11:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1295689C9B;
	Mon, 28 Sep 2020 09:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D107D89C9B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 09:02:22 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id g96so164586otb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JTLdvESzKL3sin7nSAfmPRYlBKMWaQyO8M8qi1wB0vA=;
 b=P3WC+B+zbq6ccamhC8om9venVo4Ki4C0Jv56FZRlnkvjwh4JDCiZMfhtCBE2RVCFiY
 w8pwMUnH+ZhNY6o/sZ0pZavPl4aHNuk5yuWGmi6VD1Kn9ldnqlEbrjWgSrj66MTZ8Fiq
 Ke2bvKok1z5NI1SjBMmp5i1+K2WniOLRrQfsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JTLdvESzKL3sin7nSAfmPRYlBKMWaQyO8M8qi1wB0vA=;
 b=bR5oH9LRfBXhUxVUJPzn5BpOGl7GvkbtDA/fQK/2+rAMhaKZz2zemct4x31mc+KfRU
 uaZD0Gyd+Lpm5RGfANFFyymvFO3IBgHQCVyKiA5F793SC26T3ZRtXD0DFcPSgl6NtD4X
 4EtLy/ZBDWrx58xhhduDY3DrbmPpE/ocoekac3PloD2+3kuXo336sUKyYX5kCHhqVtKt
 alrjjqx09l7OwO0MWCMayT62fvOHHIx2/oRz+srtffQS2wj7US1d7/MtLc7Fe/TPcVuQ
 efgfLjZHbT23cYrjnq/Vulv532qsMhPb0u57PQDLkZbSONnIghTAFzEmvAz/VsOz2RN9
 PYnw==
X-Gm-Message-State: AOAM530b0lSsJ8VoQXiLLn0yc/U3E3E1Pmf4xYDzbjaP8zaIaQXnR5SG
 j99oA+iA1tQEpllGlpj2JRaMWcNYmi7cPVtWZPv25w==
X-Google-Smtp-Source: ABdhPJyU9867B8TXTjJniqPLDSpiY941W+DcOl0jwbG9DyQbz/8S6Go5xRxLVGl+hpcEAvncUjfrOTKeB+JK4nZSMxo=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr309022otq.188.1601283742161; 
 Mon, 28 Sep 2020 02:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200925130744.575725-1-maxime@cerno.tech>
In-Reply-To: <20200925130744.575725-1-maxime@cerno.tech>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 28 Sep 2020 11:02:11 +0200
Message-ID: <CAKMK7uG8=depCjWACjFxSph6o4rrPu1Ng28F7om_CYaiMj_HQQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/vc4: hdmi: Disable Wifi Frequencies
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 9:06 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> There's cross-talk on the RPi4 between the 2.4GHz channels used by the WiFi
> chip and some resolutions, most notably 1440p at 60Hz.
>
> In such a case, we can either reject entirely the mode, or lower slightly
> the pixel frequency to remove the overlap. Let's go for the latter.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        |  6 ++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c                     | 14 +++++++++++++-
>  drivers/gpu/drm/vc4/vc4_hdmi.h                     |  8 ++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 03a76729d26c..63e7fe999c0a 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -76,6 +76,12 @@ properties:
>    resets:
>      maxItems: 1
>
> +  raspberrypi,disable-wifi-frequencies:
> +    type: boolean
> +    description: >
> +      Should the pixel frequencies in the WiFi frequencies range be
> +      avoided?
> +
>  required:
>    - compatible
>    - reg
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index acfb4e235214..74da7c00ecd0 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -877,13 +877,22 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>         struct vc4_hdmi_connector_state *vc4_state = conn_state_to_vc4_hdmi_conn_state(conn_state);
>         struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -       unsigned long long pixel_rate = mode->clock * 1000;
> +       unsigned long long pixel_rate;
>
>         if (vc4_hdmi->variant->broken_odd_h_timings &&
>             ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
>              (mode->hsync_end % 2) || (mode->htotal % 2)))
>                 return -EINVAL;
>
> +       /*
> +        * The 1440p@60 pixel rate is in the same range than the WiFi
> +        * channels. Slightly lower the frequency to bring it out of the
> +        * WiFi range.
> +        */
> +       if (vc4_hdmi->disable_wifi_frequencies && mode->clock == 241500)
> +               mode->clock = 238560;

Don't you want to map for a (narrow) range of frequencies here? Just
for that infamous 60p vs 59.99p thing and similar. And I think that
would still be in that band you want to avoid.
-Daniel

> +
> +       pixel_rate = mode->clock * 1000;
>         if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>                 pixel_rate *= 2;
>
> @@ -1837,6 +1846,9 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>                 vc4_hdmi->hpd_active_low = hpd_gpio_flags & OF_GPIO_ACTIVE_LOW;
>         }
>
> +       vc4_hdmi->disable_wifi_frequencies =
> +               of_property_read_bool(dev->of_node, "raspberrypi,disable-wifi-frequencies");
> +
>         pm_runtime_enable(dev);
>
>         drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 40e51ece8efe..6618ee758890 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -143,6 +143,14 @@ struct vc4_hdmi {
>         int hpd_gpio;
>         bool hpd_active_low;
>
> +       /*
> +        * On some systems (like the RPi4), some modes are in the same
> +        * frequency range than the WiFi channels (1440p@60Hz for
> +        * example). Should we take evasive actions because that system
> +        * has a wifi adapter.
> +        */
> +       bool disable_wifi_frequencies;
> +
>         struct cec_adapter *cec_adap;
>         struct cec_msg cec_rx_msg;
>         bool cec_tx_ok;
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
