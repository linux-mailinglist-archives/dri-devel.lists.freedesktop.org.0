Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2D48426D
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 14:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8E610E26E;
	Tue,  4 Jan 2022 13:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245DA10E26E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 13:28:36 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id jw3so31316558pjb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 05:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EiykEhSZQH33m3ajQa/aA+wadEsRCL/8i/TvE2RTsiY=;
 b=BkCbq3uEHO14PpHm71c/8R2CRRPvtAwqxDJrlRWabAIJt7CgdEr2RIcAfPtlHcYtZH
 0SBkMlKD6A9KQQyOA7fGsWFGVcyK+JnQS4cOdc/1iniQuy9VTQDYLD/wvX5Tsg3YuCAM
 nrdEGOKb0ipL1zd6RItW+vNnPraktIrsZkj5NJVj3jRNtxP1DR7OguMr5pkTIgRp3vLn
 BeeDRzu0BCqVRkjXctKUo4SKB4I/WnpVBjArb0en38w2fX73GNoacua9TAf4HKxapQk/
 AB92G2IaLOjw+gnkdW+0O4jKKkUWkkg6uFV6oMqN7vShtyipYVfvpc6uH1Yg5zrP33pZ
 xQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EiykEhSZQH33m3ajQa/aA+wadEsRCL/8i/TvE2RTsiY=;
 b=pkF2BvFUJRT42hBrcUjoGZzRwh9iDmt6sfsrNuIoxo7EejvCdpk8naXpO69abdOdgH
 O64HaRFdzLJbuomgsLtO59W5cyGVuUBCqirwZ/03cStdI3Ur5opJpEFIbDRHFrR0FqKP
 7C6dEjk2JW2tb4/HRFfp6D4/9CWwziZIW3o6uHwgPI70ScX43nEEV8kKtNILao3EGK+K
 fLCmY6BWoe70Nc+/2MxDR2I3o0WS7OeB8467BUBMJ2OUlag94837RgARo7PhRUUI1Jma
 RRlCcSqX32ey0ooHjMVN8SzVQexCY5PWXBimzUMfoyE6e+o3UsQ62MrSfdfk102PY7Xh
 lgeQ==
X-Gm-Message-State: AOAM533GduelgcdYL+VAG7swhZ+hsTFoI60ImUzFaSuW0iAT/t4CGalW
 Za4aInnHhJKmY6wJz1R9EuZxqtovn6mnPyBj+Ql7Yg==
X-Google-Smtp-Source: ABdhPJy3jWVaWJvW3/9SRtq903IIy6QcW3kXrjHFhswu1/taYE1Yv/d0R2asSmlKUDkmV8QU2da0Yt44/NFUCbRTlvw=
X-Received: by 2002:a17:90a:a6d:: with SMTP id
 o100mr61546397pjo.179.1641302915657; 
 Tue, 04 Jan 2022 05:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20211119145325.1775046-1-jagan@amarulasolutions.com>
 <20211119145325.1775046-2-jagan@amarulasolutions.com>
In-Reply-To: <20211119145325.1775046-2-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 14:28:24 +0100
Message-ID: <CAG3jFytiu9Q-KRsUWDDcHC7ONjjtsiA3Csgy7mciG+kV2t=feQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: chipone-icn6211: Add mode_set API
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Nov 2021 at 15:53, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Get the display mode settings via mode_set bridge
> function instead of explicitly de-reference.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 77b3e2c29461..e8f36dca56b3 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -31,6 +31,7 @@
>  struct chipone {
>         struct device *dev;
>         struct drm_bridge bridge;
> +       struct drm_display_mode mode;
>         struct drm_bridge *panel_bridge;
>         struct gpio_desc *enable_gpio;
>         struct regulator *vdd1;
> @@ -43,11 +44,6 @@ static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
>         return container_of(bridge, struct chipone, bridge);
>  }
>
> -static struct drm_display_mode *bridge_to_mode(struct drm_bridge *bridge)
> -{
> -       return &bridge->encoder->crtc->state->adjusted_mode;
> -}
> -
>  static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
>                                     size_t len)
>  {
> @@ -66,7 +62,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
>                                   struct drm_bridge_state *old_bridge_state)
>  {
>         struct chipone *icn = bridge_to_chipone(bridge);
> -       struct drm_display_mode *mode = bridge_to_mode(bridge);
> +       struct drm_display_mode *mode = &icn->mode;
>
>         ICN6211_DSI(icn, 0x7a, 0xc1);
>
> @@ -165,6 +161,15 @@ static void chipone_atomic_post_disable(struct drm_bridge *bridge,
>         gpiod_set_value(icn->enable_gpio, 0);
>  }
>
> +static void chipone_mode_set(struct drm_bridge *bridge,
> +                            const struct drm_display_mode *mode,
> +                            const struct drm_display_mode *adjusted_mode)
> +{
> +       struct chipone *icn = bridge_to_chipone(bridge);
> +
> +       drm_mode_copy(&icn->mode, adjusted_mode);
> +}
> +
>  static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
>  {
>         struct chipone *icn = bridge_to_chipone(bridge);
> @@ -179,6 +184,7 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
>         .atomic_pre_enable      = chipone_atomic_pre_enable,
>         .atomic_enable          = chipone_atomic_enable,
>         .atomic_post_disable    = chipone_atomic_post_disable,
> +       .mode_set               = chipone_mode_set,
>         .attach                 = chipone_attach,
>  };
>
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
