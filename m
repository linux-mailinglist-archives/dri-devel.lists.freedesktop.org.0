Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D695D60E53B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1CA10E558;
	Wed, 26 Oct 2022 16:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3884410E552
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 16:06:58 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id r14so42310717edc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0ORj/pvdtzPbyC75AO9Kg6BGgPfKp/QVYaTue3ZmrRA=;
 b=BFlk/OpxBWsVDrKZiNZz+0s1lHoJg9kgPzCKm6ioDBHvhbs1dhIqTq6aUCWBGSFznU
 bMb4A9hxxZ4ZuiPZA1WMPuSGJzfreNjCg/7p1XDfAlQqNw/GIHB52LjyEp+oztMtJboH
 vXHhMKB+KMw9BPDzbFl0iyGTWo/YY/OP17A8eRuG5vQfCruv2Y4kbh2hHgYqUVlxNpxQ
 k/ux6Hi7Yh8K6Y1cl9G7tK7gdJVL7c+uuvHpRH/u88GfAC0w/taKCgLq8xZjKqEKJs5a
 L+fYqTq1YC35C06cSDXEPoqVafBs5nVw28oCZ7nKlARn5uBQv9KJOvA0h77TGscdW6Za
 hX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0ORj/pvdtzPbyC75AO9Kg6BGgPfKp/QVYaTue3ZmrRA=;
 b=DfCIQfUpAhQMOP6npChEwvGvT+Kd1jzpDCethwc85JmXQmI/uTms97ySrzhyPZ2ZIC
 u4SWGTo8zPX2BV/MOuxikcRXVoBZShgPKdQGK6HZn7wIYLxUdymPGj5f4o0kjxyeVW7v
 ib5F0gBaoLUMnhkdUqjUFkKi4gHoShLqmGl+TfAoj0neJsAadoPGB2pl9loqZCstiysH
 YIfNx42YP2A93NZN8g23T0HmM7SaXExypemZscqpUlMkmC1M+lMpmpXFa3RkncYotbSB
 TMn1HDdJVpyVaEZ7AcFWJDCk3Id5JUF0otzsoOYpVhY+A3631xjJ937M48pXWUAXlD5i
 DLbA==
X-Gm-Message-State: ACrzQf0oksG8GiIPNlxc9qNRCSLd1dZPfxo/+vFHY29Wr6wIuiRjddHH
 42zwMhmnaR3L2nVNRRKZKPHQBKOjYmcwdklhHU6Hlg==
X-Google-Smtp-Source: AMsMyM6HCqpgKsW7Z0HECXHfGf0TuGqN1gzuO/nXDpA9vz5bWcDJZwZEuFaU2AJwFsHzkbwi2QrNt47noa55K0dS9B4=
X-Received: by 2002:aa7:c6c1:0:b0:460:f684:901a with SMTP id
 b1-20020aa7c6c1000000b00460f684901amr30838971eds.6.1666800416797; Wed, 26 Oct
 2022 09:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
 <20220815-rpi-fix-4k-60-v4-6-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-6-a1b40526df3e@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 26 Oct 2022 17:06:41 +0100
Message-ID: <CAPY8ntBvF=yBv8zyWvvXUm598rOBRV+Q8QzYCcN_B5PbjYOdZg@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] drm/vc4: hdmi: Add more checks for 4k resolutions
To: maxime@cerno.tech
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Emma Anholt <emma@anholt.net>, Stephen Boyd <sboyd@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Oct 2022 at 10:14, <maxime@cerno.tech> wrote:
>
> From: Dom Cobley <popcornmix@gmail.com>
>
> At least the 4096x2160@60Hz mode requires some overclocking that isn't
> available by default, even if hdmi_enable_4kp60 is enabled.
>
> Let's add some logic to detect whether we can satisfy the core clock
> requirements for that mode, and prevent it from being used otherwise.
>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_drv.h  |  6 ++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++--
>  drivers/gpu/drm/vc4/vc4_hvs.c  |  3 +++
>  3 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 8b2b1af565f9..72a6b7151d23 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -347,6 +347,12 @@ struct vc4_hvs {
>          * available.
>          */
>         bool vc5_hdmi_enable_scrambling;
> +
> +       /*
> +        * 4096x2160@60 requires a core overclock to work, so register
> +        * whether that is sufficient.
> +        */
> +       bool vc5_hdmi_enable_4096by2160;
>  };
>
>  struct vc4_plane {
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index afe3daa2173e..fd3730ea976f 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1753,6 +1753,7 @@ vc4_hdmi_sink_supports_format_bpc(const struct vc4_hdmi *vc4_hdmi,
>
>  static enum drm_mode_status
>  vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
> +                            const struct drm_display_mode *mode,
>                              unsigned long long clock)
>  {
>         const struct drm_connector *connector = &vc4_hdmi->connector;
> @@ -1765,6 +1766,12 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
>         if (!vc4->hvs->vc5_hdmi_enable_scrambling && clock > HDMI_14_MAX_TMDS_CLK)
>                 return MODE_CLOCK_HIGH;
>
> +       /* 4096x2160@60 is not reliable without overclocking core */
> +       if (!vc4->hvs->vc5_hdmi_enable_4096by2160 &&
> +           mode->hdisplay > 3840 && mode->vdisplay >= 2160 &&
> +           drm_mode_vrefresh(mode) >= 50)
> +               return MODE_CLOCK_HIGH;
> +
>         if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
>                 return MODE_CLOCK_HIGH;
>
> @@ -1799,7 +1806,7 @@ vc4_hdmi_encoder_compute_clock(const struct vc4_hdmi *vc4_hdmi,
>         unsigned long long clock;
>
>         clock = vc4_hdmi_encoder_compute_mode_clock(mode, bpc, fmt);
> -       if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, clock) != MODE_OK)
> +       if (vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, clock) != MODE_OK)
>                 return -EINVAL;
>
>         vc4_state->tmds_char_rate = clock;
> @@ -1962,7 +1969,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
>              (mode->hsync_end % 2) || (mode->htotal % 2)))
>                 return MODE_H_ILLEGAL;
>
> -       return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode->clock * 1000);
> +       return vc4_hdmi_encoder_clock_valid(vc4_hdmi, mode, mode->clock * 1000);
>  }
>
>  static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 300ac0b57571..a68913f76687 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -818,6 +818,9 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>                 if (max_rate >= 550000000)
>                         hvs->vc5_hdmi_enable_scrambling = true;
>
> +               if (max_rate >= 600000000)
> +                       hvs->vc5_hdmi_enable_4096by2160 = true;
> +
>                 hvs->max_core_rate = max_rate;
>
>                 ret = clk_prepare_enable(hvs->core_clk);
>
> --
> b4 0.10.1
