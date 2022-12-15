Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B264DA29
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8489F10E025;
	Thu, 15 Dec 2022 11:19:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7333610E025
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:18:57 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso20482987fac.12
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fn2zqsPP+08QxWZvX7V1h6FJWl/peZq+mwwcgAj4da0=;
 b=ZZXgJ0SUB44KDY6gXkxUTEMuEZUHXnx/FLPnvhTfEOkdbaTyTDGtld0l7ocT3gJJP1
 fDyF6DDXMrVgtV8HLG5c37Ocndoh/gV6V0gZ+jtMfRZO0eKaMF6oCMYXch9xs+JBqaHz
 wxEOhI1dVAW6b/vZN6SOPxfz+mTvr60HekVWYeMrGsU0FyjMb9FNCmTyQIkvACjZFmAP
 Tarf3aElOufDj2aK3j5Wt2FaExPBoY4W5rEQtD19fcTJNIulnl9rY5CHGVyVG5p8TGrF
 TYNcC6IvJ279xoyprGSysoMJmPfoMiVdjadER0cTL1AwO0CjsHFzzjaKIgMHM97lHQYe
 yfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fn2zqsPP+08QxWZvX7V1h6FJWl/peZq+mwwcgAj4da0=;
 b=G0e6y5OIFFOX8d/D11JJRsvglDXcr0OPWQVovp7BEPt4tVrl/eSztv3AqNCdK1egU1
 t+5vruoRYcvbhaOJMcPE6qEMLmGntdgpma+E7gD09EhWSgLXDSCG/9eoIWsVQIrpv14F
 U7ZtRRFnotOv7ErtmQHedMuj+QHI8hmj1Kpk9KwHeq3dlgJQ5XdVqfeu/HU7E48S0Cd8
 rx+q0RhnoHEuybbDGpiNE4c7URCBasC0XDd95AymkNtFxQ4lm5rK3/hn21Cvak44k2pP
 juX1o7Uj8PrtllFXOJm90gCHXwbhP1w7yNIhTh5oR7LC79HSBdpFXuuWDAdBIbfYXzmG
 rRPA==
X-Gm-Message-State: AFqh2kpT2ye32/jhH592GN49xEIVIo21H7xTZd8r7647NrabWe5qKjgK
 IAXiWM18eHs6zOi3Qzh+gyBa+YTYCU8J7uC3GvT4Kw==
X-Google-Smtp-Source: AA0mqf7lNFNsw3fiVzXlj6Pjt0dlhaKbZzy10b3twNK4qM4ipWgLYvYrtK45C3ko7zuvu182Y/pqDeRP/tjAflecsW0=
X-Received: by 2002:a05:6870:9e4c:b0:13c:33d0:22e2 with SMTP id
 pt12-20020a0568709e4c00b0013c33d022e2mr592979oab.14.1671103136728; Thu, 15
 Dec 2022 03:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-7-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-7-paul@crapouillou.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 12:18:46 +0100
Message-ID: <CAG3jFyvwQAXNsLBRj43ZcqX2kWkGT=iLr1NZshfXR6iRWkSdJA@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm: bridge: it66121: Don't use DDC error IRQs
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Dec 2022 at 13:59, Paul Cercueil <paul@crapouillou.net> wrote:
>
> The DDC error IRQs will fire on the IT6610 every time the FIFO is empty,
> which is not very helpful. To resolve this, we can simply disable them,
> and handle DDC errors in it66121_wait_ddc_ready().
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 49 ++++++----------------------
>  1 file changed, 10 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index bfb9c87a7019..06fa59ae5ffc 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -515,16 +515,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
>         offset = (block % 2) * len;
>         block = block / 2;
>
> -       ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
> -       if (ret)
> -               return ret;
> -
> -       if (val & IT66121_INT_STATUS1_DDC_BUSHANG) {
> -               ret = it66121_abort_ddc_ops(ctx);
> -               if (ret)
> -                       return ret;
> -       }
> -
>         ret = it66121_clear_ddc_fifo(ctx);
>         if (ret)
>                 return ret;
> @@ -545,16 +535,6 @@ static int it66121_get_edid_block(void *context, u8 *buf,
>                 if (ret)
>                         return ret;
>
> -               ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
> -               if (ret)
> -                       return ret;
> -
> -               if (val & IT66121_INT_STATUS1_DDC_BUSHANG) {
> -                       ret = it66121_abort_ddc_ops(ctx);
> -                       if (ret)
> -                               return ret;
> -               }
> -
>                 ret = it66121_preamble_ddc(ctx);
>                 if (ret)
>                         return ret;
> @@ -585,8 +565,10 @@ static int it66121_get_edid_block(void *context, u8 *buf,
>                 remain -= cnt;
>
>                 ret = it66121_wait_ddc_ready(ctx);
> -               if (ret)
> +               if (ret) {
> +                       it66121_abort_ddc_ops(ctx);
>                         return ret;
> +               }
>
>                 ret = regmap_noinc_read(ctx->regmap, IT66121_DDC_RD_FIFO_REG,
>                                         buf, cnt);
> @@ -671,11 +653,7 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
>         /* Per programming manual, sleep here for bridge to settle */
>         msleep(50);
>
> -       /* Start interrupts */
> -       return regmap_write_bits(ctx->regmap, IT66121_INT_MASK1_REG,
> -                                IT66121_INT_MASK1_DDC_NOACK |
> -                                IT66121_INT_MASK1_DDC_FIFOERR |
> -                                IT66121_INT_MASK1_DDC_BUSHANG, 0);
> +       return 0;
>  }
>
>  static int it66121_set_mute(struct it66121_ctx *ctx, bool mute)
> @@ -926,21 +904,14 @@ static irqreturn_t it66121_irq_threaded_handler(int irq, void *dev_id)
>         ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
>         if (ret) {
>                 dev_err(dev, "Cannot read STATUS1_REG %d\n", ret);
> -       } else {
> -               if (val & IT66121_INT_STATUS1_DDC_FIFOERR)
> -                       it66121_clear_ddc_fifo(ctx);
> -               if (val & (IT66121_INT_STATUS1_DDC_BUSHANG |
> -                          IT66121_INT_STATUS1_DDC_NOACK))
> -                       it66121_abort_ddc_ops(ctx);
> -               if (val & IT66121_INT_STATUS1_HPD_STATUS) {
> -                       regmap_write_bits(ctx->regmap, IT66121_INT_CLR1_REG,
> -                                         IT66121_INT_CLR1_HPD, IT66121_INT_CLR1_HPD);
> +       } else if (val & IT66121_INT_STATUS1_HPD_STATUS) {
> +               regmap_write_bits(ctx->regmap, IT66121_INT_CLR1_REG,
> +                                 IT66121_INT_CLR1_HPD, IT66121_INT_CLR1_HPD);
>
> -                       status = it66121_is_hpd_detect(ctx) ? connector_status_connected
> -                                                           : connector_status_disconnected;
> +               status = it66121_is_hpd_detect(ctx) ? connector_status_connected
> +                       : connector_status_disconnected;
>
> -                       event = true;
> -               }
> +               event = true;
>         }
>
>         regmap_write_bits(ctx->regmap, IT66121_SYS_STATUS_REG,
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
