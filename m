Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA953E1C18
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5774C6EB29;
	Thu,  5 Aug 2021 19:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0D46EB27
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 19:05:40 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 u5-20020a17090ae005b029017842fe8f82so2635344pjy.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 12:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ZFFq7OM5nVkToszzdtX9QSlNl/eY89U4a4AO5gbJ0c=;
 b=dgxIBWU0u0EHXfPQrJsNfrQ8leeNYIxMblGPZfdM3Ua7Qj+jQjx5zoz/UaSUmzqj6q
 tIX67J0aXI+Av+ptQljjWXFQeGYLxwdbj2qhFwEWL90k+N25uxQ1rDEDrKiPb4wqRVe3
 rT23r+cBkDJ9g8JijWw84nFgPxCSpV4PQn+iMphpfz4y04ObSCyLuI60Z07KnNlfZ+oj
 NY/2x7Jo2MqimtJzymKazggA5aIuIkvFjUWcsmy7w2hBG3tGQFpqsSt6Hkknt5XLIM/T
 +rW8B1o1WfkgB4tUvMQfipkFb2KUbdd/DxggqQFa/z8Ii/CpEAG2KWbvZi0Sw8VZXi/R
 Bq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ZFFq7OM5nVkToszzdtX9QSlNl/eY89U4a4AO5gbJ0c=;
 b=ce3G6tvUeQS9rTq2wnO02x3z4J+uKfYyQcaymqvChgE46ctD5b8ZtlFBe/64roQkCg
 vsquDC+qdFMdxCx86Y7axXjFkCE1iN74BcV13ChGjocPcGnzhELIXZHad80jmDuHX9j9
 limJcU4ZLkFRdFWAAIS3W7IebhKg5AqSuZrFPPaY5481gTLMr+zEN8GDfDWCiqt1EyOE
 AS9AANuUz4QuaTQWPvDuYeiH8SoqxB5g4shxDgdrpKuVgyKru9LPVRp4rMwebDxLFgj4
 RyQ2ys80nu7jF/r7uvyiXQyqLXG3wep8NLyN+B+VfWFl4CcNVmk3+FvxU8gYnbBSDT8O
 AQdw==
X-Gm-Message-State: AOAM532i6w6EncbGpHim0x9cOb2pdnX6DTT6wZCq5WqRmhlwywevEahk
 Rp9xoBheUghIwVScbRw63b4olZNSMeEkiNPNjQ7uXw==
X-Google-Smtp-Source: ABdhPJxKXPQWKZYVNFugMmvukgwEvPM1+RUaAfvu87Y0aIiNAm/MX3SlelYUjvZdxUxr63cktsycKHW5sNSqYYm9sU0=
X-Received: by 2002:aa7:90c8:0:b029:32c:935f:de5f with SMTP id
 k8-20020aa790c80000b029032c935fde5fmr6578542pfk.79.1628190340250; Thu, 05 Aug
 2021 12:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <a565cb1662d2f8300905a369c575e19176fd8e4c.1628148418.git.xji@analogixsemi.com>
In-Reply-To: <a565cb1662d2f8300905a369c575e19176fd8e4c.1628148418.git.xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 5 Aug 2021 21:05:29 +0200
Message-ID: <CAG3jFyuGJZ4ig6nFxXJJ0d-7ob2+=po2cxSuN29wedV5xVE+gA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/bridge: anx7625: Tune K value for IVO panel
To: Xin Ji <xji@analogixsemi.com>
Cc: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Torsten Duwe <duwe@lst.de>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Bernie Liang <bliang@analogixsemi.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org, 
 Qilin Wen <qwen@analogixsemi.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Xin,

Thanks for submitting this.

On Thu, 5 Aug 2021 at 09:31, Xin Ji <xji@analogixsemi.com> wrote:
>
> IVO panel require less input video clock variation than video clock
> variation in DP CTS spec.
>
> This patch decreases the K value of ANX7625 which will shrink eDP Tx
> video clock variation to meet IVO panel's requirement.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 17 ++++++++++++++---
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  4 +++-
>  2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a3d82377066b..ceed1c7f3f28 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -384,6 +384,18 @@ static int anx7625_odfc_config(struct anx7625_data *ctx,
>         return ret;
>  }
>
> +static int anx7625_set_k_value(struct anx7625_data *ctx)

Pardon my ignorance, but I don't know what a K-value is. Could you add
a comment detailing
what the K-value does?

> +{
> +       struct edid *edid = (struct edid *)ctx->slimport_edid_p.edid_raw_data;
> +
> +       if (edid->mfg_id[0] == IVO_MID0 && edid->mfg_id[1] == IVO_MID1)
> +               return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +                                        MIPI_DIGITAL_ADJ_1, 0x3B);
> +
> +       return anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +                                MIPI_DIGITAL_ADJ_1, 0x3D);
> +}
> +
>  static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
>  {
>         struct device *dev = &ctx->client->dev;
> @@ -470,9 +482,8 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
>                         MIPI_PLL_N_NUM_15_8, (n >> 8) & 0xff);
>         ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client, MIPI_PLL_N_NUM_7_0,
>                         (n & 0xff));
> -       /* Diff */
> -       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> -                       MIPI_DIGITAL_ADJ_1, 0x3D);
> +       /* Diff and K value */

With a proper comment above, this comment is no longer needed.

> +       anx7625_set_k_value(ctx);
>
>         ret |= anx7625_odfc_config(ctx, post_divider - 1);
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index 034c3840028f..6dcf64c703f9 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -210,7 +210,9 @@
>  #define  MIPI_VIDEO_STABLE_CNT           0x0A
>
>  #define  MIPI_LANE_CTRL_10               0x0F
> -#define  MIPI_DIGITAL_ADJ_1   0x1B
> +#define  MIPI_DIGITAL_ADJ_1     0x1B
> +#define  IVO_MID0               0x26
> +#define  IVO_MID1               0xCF
>
>  #define  MIPI_PLL_M_NUM_23_16   0x1E
>  #define  MIPI_PLL_M_NUM_15_8    0x1F
> --
> 2.25.1
>

LGTM with the above fix.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
