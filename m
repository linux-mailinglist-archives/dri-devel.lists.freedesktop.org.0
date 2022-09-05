Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A5A5AD7D5
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039F210E327;
	Mon,  5 Sep 2022 16:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E9710E327
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:48:18 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id qh18so18146803ejb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=vFf1NC6e/rXutxdhKSLLrUKw8nDhPmH+BJYLwhNt7yw=;
 b=OxL4rVf+D+fKCzNOe9TQVDoMnh3EEoNcvQiMeDXPlP+kxFVp8p8JFZXkc3bdYqa3ak
 691sPhlXD/oheR4/nNStORcTlIGLbQuFwhfkpLd0it2H0SztxNxY4Re4xQL0y1K2WN/M
 YWc+c0t6TcZJLaBpJZ5hk/feOKsV/LnhkSZw8KEyBWY+0+BZSWjwkEY5bguyzzqRVup+
 bui6FbMAtvRVU5OMyOud6uBOjomUrAt6SQDWFc/cyDYs2KymJ1dzPOZeNUTT7nrOfef8
 oNyxRwxqdxnTuiXfEZDtQqc717YgrBFHmUmYYPSNdOqzap2vrefvja3picn38zkEVXs1
 xM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=vFf1NC6e/rXutxdhKSLLrUKw8nDhPmH+BJYLwhNt7yw=;
 b=BaHb0fALN0AYOqb7h2LAQjlqoSQAMdd7PsQnLIAIrJ9jWLeWajY2RLtWRJaqkXbLlp
 FNEnbFX9QHlnz+LLiAnAeT/+abawOBp+GfxsDMg0oYSISmXJeWK95ugWHrJQtowIvXwH
 wYmk2QBEFaSoNcKI694FyyrCG+A52MjD1kV295Olx42s25gP+f7jn5+0x8GKSj8h55T1
 XKWI6k5ziA3/mjNXJ3NBhCDBpnzCwFOjQdPlyQpn95uuUCNs0jSSmMUDTxA23OokXeca
 kBpXp+HpGdrn56sKUsBKraGOSf1ZLJDL3A+fSTvihJV2t/JX2kjwj1ZhslgoyrHAzHnJ
 KLqw==
X-Gm-Message-State: ACgBeo0HVy80fBYW8ko+9cZa3UjiLCmBcg5jL176tynRwU8LKo1yCJB9
 NW2T1Ul/OR1y1TrsbzrucgewHwYkp8ne2vlzmsWtTw==
X-Google-Smtp-Source: AA6agR5NLqtR8oGfFTf8feIBOe08qSCAQgSn3cBwuBtLBXKmRKosxUcLTwt7GXQEJ7mpo2ehybr7vEnFmXmgLF1srr4=
X-Received: by 2002:a17:907:6092:b0:731:59f0:49ac with SMTP id
 ht18-20020a170907609200b0073159f049acmr36298700ejc.383.1662396497455; Mon, 05
 Sep 2022 09:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220903130833.541463-1-xji@analogixsemi.com>
In-Reply-To: <20220903130833.541463-1-xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 5 Sep 2022 18:48:06 +0200
Message-ID: <CAG3jFyum5M8iGdW++c7rayUn4ogJ6izWaX7VaqMfV7ShAe_kRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Set HPD irq detect window to 2ms
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, qwen@analogixsemi.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, mliu@analogixsemi.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, hsinyi@chromium.org,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Xin,

On Sat, 3 Sept 2022 at 15:09, Xin Ji <xji@analogixsemi.com> wrote:
>
> Some panels trigger HPD irq due to noise, the HPD debounce
> may be 1.8ms, exceeding the default irq detect window, ~1.4ms.
> This patch set HPD irq detection window to 2ms to
> tolerate the HPD noise.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 14 ++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index c74b5df4cade..0c323b5a1c99 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1440,6 +1440,20 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
>
>  static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
>  {
> +       int ret;
> +
> +       /* Set irq detect window to 2ms */
> +       ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> +                               HPD_DET_TIMER_BIT0_7, HPD_TIME & 0xFF);
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> +                                HPD_DET_TIMER_BIT8_15,
> +                                (HPD_TIME >> 8) & 0xFF);
> +       ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> +                                HPD_DET_TIMER_BIT16_23,
> +                                (HPD_TIME >> 16) & 0xFF);

Does the HPD debounce timer register need to be written for every HPD
status read?

> +       if (ret < 0)
> +               return ret;
> +
>         return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
>  }
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index e257a84db962..14f33d6be289 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -132,6 +132,12 @@
>  #define I2S_SLAVE_MODE 0x08
>  #define AUDIO_LAYOUT   0x01
>
> +#define HPD_DET_TIMER_BIT0_7   0xea
> +#define HPD_DET_TIMER_BIT8_15  0xeb
> +#define HPD_DET_TIMER_BIT16_23 0xec
> +/* HPD debounce time 2ms for 27M clock */
> +#define HPD_TIME               54000
> +
>  #define AUDIO_CONTROL_REGISTER 0xe6
>  #define TDM_TIMING_MODE 0x08
>
> --
> 2.25.1
>
