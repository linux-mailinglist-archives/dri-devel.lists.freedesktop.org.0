Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1258A3E2790
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 11:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD416EB71;
	Fri,  6 Aug 2021 09:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01786EB71
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 09:42:37 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so21919592pjr.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4HPNOHJF+FggNfCJseeN2/kUR7mznmygd2VV7qNoCFg=;
 b=SXu8xId+7S96lozM+9jNDTE8KKNGlgx6uPoKWwz+WwXMvz1d0rTofjoV4SQCFfBnSZ
 LTuYpkQ0CveluxulWfcAhp7m4fWmgzDpBIdavDKgZxUWtxzkDRb3q8BfjRwEcApD9YHh
 yJGyg9XNka6qwhtKSbTE7OZ0NRcPB3y6hgI4TbrUCKYm6diWoiNap6rtWPQQ/SmhTcUm
 BSlATxLy43GGhqInxcGTKxazNRM1Zg//uB/Jj7C4m/JnBpihK0FRyTFLTkq6UjMmbYXo
 m3jUv43U/G6Dkbjs3xy3kvWsunCj/DdxViD6qYM+wt+FTFCXB+AR2t9X2xTnai+47F9a
 0Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4HPNOHJF+FggNfCJseeN2/kUR7mznmygd2VV7qNoCFg=;
 b=ksXLhgSmvXwnLxU6evfPAYy1EQAOyKypuTZiezXCB/OZFNAY/boa2bfwyI6Nzzr9C6
 T1BvCQtAHLjPjz4puEUqNJu2uzjX76PWJMulBxxnkui0Emkg39s/na2XFIgKVivGW7Wf
 UlhIrfKOQlxWK40AhS0FaGCOk/1ErzJxeN/98jkA9oI1c4TLebERnn6Lhat9KLlV4wxr
 ELc8iaa2h63FKfYfyzlM3bGgrcj8crH73WgFQtAUcf5fXx1lNjFBEEIL0+qZf1Q9jwZ7
 lsMW7LYfYciGHlsZSLIy+eEgoz1FUxHxBbly5e2ayLyDWNmofyqyIkfri/XEYc/snLAo
 kNOQ==
X-Gm-Message-State: AOAM531hWtiVgq62Tm1W2ge2HBI6JLkfRIY8ZXdhXM0efH/TKnufbT9s
 n95uAZU8hcqDThUwFc7JyiCfnAdThpSWROvir+iEVQ==
X-Google-Smtp-Source: ABdhPJx+BDp+a/3ncBTlo6vu6+TXRvbaFZ9ImUS/1LbApSXQDKjL8eqWP8K5L9x04aHKdfGndP9XdWO+I9CX1KGMutQ=
X-Received: by 2002:aa7:90c8:0:b029:32c:935f:de5f with SMTP id
 k8-20020aa790c80000b029032c935fde5fmr9660331pfk.79.1628242957366; Fri, 06 Aug
 2021 02:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <a02c0a414bd3d0f67bf7d77c10415196743f1c0d.1628242192.git.xji@analogixsemi.com>
In-Reply-To: <a02c0a414bd3d0f67bf7d77c10415196743f1c0d.1628242192.git.xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 6 Aug 2021 11:42:26 +0200
Message-ID: <CAG3jFyvTsG1ZjqS+3yqspW+DCPX4zrs02tdmqC9n9mQxmvsJEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/bridge: anx7625: Tune K value for IVO panel
To: Xin Ji <xji@analogixsemi.com>
Cc: Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Torsten Duwe <duwe@lst.de>, 
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org
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

Thanks for implementing the suggestion so quickly.

Can you send this version of the patch out as v2? Versioning is
important and both tools and processes break if different versions
aren't submitted in different emails.

On Fri, 6 Aug 2021 at 11:35, Xin Ji <xji@analogixsemi.com> wrote:
>
> IVO panel require less input video clock variation than video clock
> variation in DP CTS spec.
>
> This patch decreases the K value of ANX7625 which will shrink eDP Tx
> video clock variation to meet IVO panel's requirement.
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 24 ++++++++++++++++++++---
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  4 +++-
>  2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a3d82377066b..9b9e3984dd38 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -384,6 +384,25 @@ static int anx7625_odfc_config(struct anx7625_data *ctx,
>         return ret;
>  }
>
> +/*
> + * The MIPI source video data exist large variation (e.g. 59Hz ~ 61Hz),
> + * anx7625 defined K ratio for matching MIPI input video clock and
> + * DP output video clock. Increase K value can match bigger video data
> + * variation. IVO panel has small variation than DP CTS spec, need
> + * decrease the K value.
> + */
> +static int anx7625_set_k_value(struct anx7625_data *ctx)
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
> @@ -470,9 +489,8 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
>                         MIPI_PLL_N_NUM_15_8, (n >> 8) & 0xff);
>         ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client, MIPI_PLL_N_NUM_7_0,
>                         (n & 0xff));
> -       /* Diff */
> -       ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> -                       MIPI_DIGITAL_ADJ_1, 0x3D);
> +
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
