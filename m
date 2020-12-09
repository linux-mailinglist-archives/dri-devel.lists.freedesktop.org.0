Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07B2D453F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9776EA85;
	Wed,  9 Dec 2020 15:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF72C6EA85
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:23:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c1so2155130wrq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 07:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GM6vPfw71wsuCy3EIGt3nfjwATjXmwSfePSCbbfMVvU=;
 b=DyxV4QYpWpgS+WDrrMLc/LRBQ9EtOlesn7HOjNxPuolAhACBW8+Pqlsf8LSutuV85J
 ZAm4KFvWW4P9Ib/xKCKTkK8FR1UPaf4ish0OqdRD0/wSS1Gq0U+r2EUmrmRNd/zYBH8S
 lxNmSIDw7EnRNdmC+G3JIYPgdd4t5jVUiZFfA+rnWHSRzNzzuU7LECToWQA4fn9UUbbc
 tlb29Ft3LfgQe89WvcRi7EbVihWSc8VpnGvEQ7npw2IPy9p9jZYbcYhQSC/K2ZnY3ukC
 Rn6ukIg7Bj04ZbA3BQGY2iWkSJmuS7QsWx5D3q6fkqv05X+tAJ7AzaOqqHq/o5fhlOn9
 8s8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GM6vPfw71wsuCy3EIGt3nfjwATjXmwSfePSCbbfMVvU=;
 b=W1H23jJvV1sNLPrC59M2uUyvhaZ2YrYl4eZFy6I+utyM4v6bqxon65SF7ol5lSBJBp
 WlHuwDf/EL0EYLgdxQ8mKX6Kjl0VONaJfkGY8bewcJ3WsLDM9dVZ5ASkr3gohuvPeNU+
 fP9nYA83kHPxpgPGmaMf+B+6HK5zsP91VJ+tLq842EvJsOa/1smKQn3Kz4p1q4mYUEIE
 i2O7oWpOh90gEDzC1VfBIMxYTHYUVoKyKvQQ2ERw+u97Ag9LfKgZm/gaRn+utV9csZAx
 ihQIHr5du+ohUKpnENmZjJKmjWVFrSkRe/qMoKSGjLSztSlzkK7nwjGz526OWER8ytDD
 2nTw==
X-Gm-Message-State: AOAM533WokQq1nc3jd8yfV49cGyCAeFsxjTKCKwd3xb7g9HcQXuMEs8x
 NFdmWGW2IiQXBIB89KCGQGHZtYSRVyZ16KPUVS0bZw==
X-Google-Smtp-Source: ABdhPJzgUgX7AN3LGfS9+kLwd+VEbieIZhKP36iljIIbyO/5+LIRvCl3iC+WwZqTjlMK0A36UywhfVM8HoPJC4tfmy8=
X-Received: by 2002:a5d:65ca:: with SMTP id e10mr3341212wrw.42.1607527421638; 
 Wed, 09 Dec 2020 07:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-8-maxime@cerno.tech>
In-Reply-To: <20201207155719.17149-8-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Dec 2020 15:23:26 +0000
Message-ID: <CAPY8ntCyY9MS4_KSLWYiRYSRK=JiqRaBC+jUue_14uKRzAEGfw@mail.gmail.com>
Subject: Re: [PATCH v5 7/9] drm/vc4: hdmi: Use the connector state pixel rate
 for the PHY
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Mon, 7 Dec 2020 at 15:57, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The PHY initialisation parameters are not based on the pixel clock but
> the TMDS clock rate which can be the pixel clock in the standard case,
> but could be adjusted based on some parameters like the bits per color.
>
> Since the TMDS clock rate is stored in our custom connector state
> already, let's reuse it from there instead of computing it again.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c     |  2 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.h     | 11 +++++------
>  drivers/gpu/drm/vc4/vc4_hdmi_phy.c |  8 +++++---
>  3 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 83699105c7a5..5310e06efc82 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -714,7 +714,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>                 vc4_hdmi->variant->reset(vc4_hdmi);
>
>         if (vc4_hdmi->variant->phy_init)
> -               vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
> +               vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
>
>         HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
>                    HDMI_READ(HDMI_SCHEDULER_CONTROL) |
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index bca6943de884..60c53d7c9bad 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -21,10 +21,9 @@ to_vc4_hdmi_encoder(struct drm_encoder *encoder)
>         return container_of(encoder, struct vc4_hdmi_encoder, base.base);
>  }
>
> -struct drm_display_mode;
> -
>  struct vc4_hdmi;
>  struct vc4_hdmi_register;
> +struct vc4_hdmi_connector_state;
>
>  enum vc4_hdmi_phy_channel {
>         PHY_LANE_0 = 0,
> @@ -80,9 +79,9 @@ struct vc4_hdmi_variant {
>         void (*set_timings)(struct vc4_hdmi *vc4_hdmi,
>                             struct drm_display_mode *mode);
>
> -       /* Callback to initialize the PHY according to the mode */
> +       /* Callback to initialize the PHY according to the connector state */
>         void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
> -                        struct drm_display_mode *mode);
> +                        struct vc4_hdmi_connector_state *vc4_conn_state);
>
>         /* Callback to disable the PHY */
>         void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
> @@ -192,13 +191,13 @@ conn_state_to_vc4_hdmi_conn_state(struct drm_connector_state *conn_state)
>  }
>
>  void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
> -                      struct drm_display_mode *mode);
> +                      struct vc4_hdmi_connector_state *vc4_conn_state);
>  void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
>  void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
>  void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
>
>  void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
> -                      struct drm_display_mode *mode);
> +                      struct vc4_hdmi_connector_state *vc4_conn_state);
>  void vc5_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
>  void vc5_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
>  void vc5_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> index 057796b54c51..36535480f8e2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> @@ -127,7 +127,8 @@
>
>  #define OSCILLATOR_FREQUENCY   54000000
>
> -void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_mode *mode)
> +void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
> +                      struct vc4_hdmi_connector_state *conn_state)
>  {
>         /* PHY should be in reset, like
>          * vc4_hdmi_encoder_disable() does.
> @@ -339,11 +340,12 @@ static void vc5_hdmi_reset_phy(struct vc4_hdmi *vc4_hdmi)
>         HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL, BIT(10));
>  }
>
> -void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_mode *mode)
> +void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
> +                      struct vc4_hdmi_connector_state *conn_state)
>  {
>         const struct phy_lane_settings *chan0_settings, *chan1_settings, *chan2_settings, *clock_settings;
>         const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
> -       unsigned long long pixel_freq = mode->clock * 1000;
> +       unsigned long long pixel_freq = conn_state->pixel_rate;
>         unsigned long long vco_freq;
>         unsigned char word_sel;
>         u8 vco_sel, vco_div;
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
