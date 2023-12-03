Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F9802943
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 00:53:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9466210E172;
	Sun,  3 Dec 2023 23:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38C010E172
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Dec 2023 23:53:04 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5d81c24cef2so6767067b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Dec 2023 15:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701647584; x=1702252384; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=umHKCdd8mcaMX1GrRwwQrr+KtgCj3XsjoFuYSfy+SGo=;
 b=qkPknT+PNM2uG3g8/dsDrtSMQeYTw7u9MuKDJLk4jwTHrdD1iZ3ZugD2VzR2H+yK11
 TwYoNfUXRqLY3toiWBHeLRVd3For8O9iQq5rqFwuDSMbolgXgkuJfsSfvZusAwRfBpNe
 NkQh4M1DxKWb/dWT79PZ5fwfP2h+V8lK74wDt0IsZduGOco+JxcE0WuAvErmByVk0EWq
 lFKpm15oX27xdh29mlpmxnK6pbWOguYDeW9gGTzH2+8Z8lPw5oMi9V6gfkZReo7S2WMy
 8mB4b0JpyN2CkO8rj7tnMXUt2GOuLmMBNgLT2kiWKS4dOIMjP4sjFfPFWiNBY1Z1ztmT
 JE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701647584; x=1702252384;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=umHKCdd8mcaMX1GrRwwQrr+KtgCj3XsjoFuYSfy+SGo=;
 b=iEYUipvBw+0VxWIm4NzC3t/yQiXPcS4X2ht4vFEcQvAgH/jJNqLCnFjtEMyPyze7nu
 jZ7tCbIqqnLGphL+5bmi0rCmC9pacQTQBsFG1CRXG9eXWvdVmQ082fnRCSQXZsVLoZkt
 x2btjfN4+6pP9DeKqsG3UEXumBSanDwfJSrsiLFoOX8qYdrN2gi2I+MKzXEtjJQXRJer
 1PXbnL8xExQjS/o+0YpZSXRk547ApYol36MltFM7eUUItMVPQOWwWM6zFHMJbZEAO4pp
 XikjA6HfD5gaCi1blpcCaD4h7YnNhbObaEuLRUVb7j6OQ23WnsyvMwm2ItnhMFrJngvB
 znLg==
X-Gm-Message-State: AOJu0YzTI4AaqnTLfNQ5kRePkwiIxmXQosJ17zphIaPNEgLWkL9agcLl
 u/Qsq00ashYW35GmXuB8mhOeF2e0PX/Ku3/TIe2mhw==
X-Google-Smtp-Source: AGHT+IFmccx32ByjNTrdogvzC+AYsxYTd8jOVha5RXT2AcnbmFOc+mBkdHRAInGNYkRIvCOiLQkDz2eXKBLiKTaIcFM=
X-Received: by 2002:a05:690c:4510:b0:5d3:4ef0:8be with SMTP id
 gt16-20020a05690c451000b005d34ef008bemr586519ywb.37.1701647584084; Sun, 03
 Dec 2023 15:53:04 -0800 (PST)
MIME-Version: 1.0
References: <20231202075514.44474-1-tony@atomide.com>
 <20231202075514.44474-10-tony@atomide.com>
In-Reply-To: <20231202075514.44474-10-tony@atomide.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Dec 2023 01:52:52 +0200
Message-ID: <CAA8EJppYoBxYaFnu7UHxCgNiRwcjmVgPXXcQboaeu_dGCosJXg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] drm/bridge: tc358775: Add support for tc358765
To: Tony Lindgren <tony@atomide.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simha BN <simhavcs@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Merlijn Wajer <merlijn@wizzup.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Carl Philipp Klemm <philipp@uvos.xyz>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Sebastian Reichel <sre@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2 Dec 2023 at 10:04, Tony Lindgren <tony@atomide.com> wrote:
>
> The tc358775 bridge is pin compatible with earlier tc358765 according to
> the tc358774xbg_datasheet_en_20190118.pdf documentation. Compared to the
> tc358765, the tc358775 supports a STBY GPIO and higher data rates.
>
> The tc358765 has a register bit for video event mode vs video pulse mode.
> We must set it to video event mode for the LCD output to work, and on the
> tc358775, this bit no longer exists.
>
> Looks like the registers seem to match otherwise based on a quick glance
> comparing the defines to the earlier Android kernel tc358765 driver.
>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -15,6 +15,7 @@
>  #include <linux/kernel.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>
> @@ -107,6 +108,7 @@
>  #define RDPKTLN         0x0404  /* Command Read Packet Length */
>
>  #define VPCTRL          0x0450  /* Video Path Control */
> +#define EVTMODE                BIT(5)  /* Video event mode enable, tc35876x only */
>  #define HTIM1           0x0454  /* Horizontal Timing Control 1 */
>  #define HTIM2           0x0458  /* Horizontal Timing Control 2 */
>  #define VTIM1           0x045C  /* Vertical Timing Control 1 */
> @@ -254,6 +256,11 @@ enum tc358775_ports {
>         TC358775_LVDS_OUT1,
>  };
>
> +enum tc3587x5_type {
> +       TC358765,

I'd suggest adding = 1 or =0x65 so that the specified type differs
from 'no data' = 0 / NULL.

> +       TC358775,
> +};
> +
>  struct tc_data {
>         struct i2c_client       *i2c;
>         struct device           *dev;
> @@ -271,6 +278,8 @@ struct tc_data {
>         struct gpio_desc        *stby_gpio;
>         u8                      lvds_link; /* single-link or dual-link */
>         u8                      bpc;
> +
> +       enum tc3587x5_type      type;
>  };
>
>  static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
> @@ -424,10 +433,16 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>         d2l_write(tc->i2c, PPI_STARTPPI, PPI_START_FUNCTION);
>         d2l_write(tc->i2c, DSI_STARTDSI, DSI_RX_START);
>
> +       /* Video event mode vs pulse mode bit, does not exist for tc358775 */
> +       if (tc->type == TC358765)
> +               val = EVTMODE;
> +       else
> +               val = 0;
> +
>         if (tc->bpc == 8)
> -               val = TC358775_VPCTRL_OPXLFMT(1);
> +               val |= TC358775_VPCTRL_OPXLFMT(1);
>         else /* bpc = 6; */
> -               val = TC358775_VPCTRL_MSF(1);
> +               val |= TC358775_VPCTRL_MSF(1);
>
>         dsiclk = mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1000;
>         clkdiv = dsiclk / (tc->lvds_link == DUAL_LINK ? DIVIDE_BY_6 : DIVIDE_BY_3);
> @@ -643,6 +658,7 @@ static int tc_probe(struct i2c_client *client)
>
>         tc->dev = dev;
>         tc->i2c = client;
> +       tc->type = (enum tc3587x5_type)of_device_get_match_data(dev);

Would it make sense to use i2c_get_match_data() instead?

>
>         tc->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
>                                                   TC358775_LVDS_OUT0, 0);
> @@ -704,13 +720,15 @@ static void tc_remove(struct i2c_client *client)
>  }
>
>  static const struct i2c_device_id tc358775_i2c_ids[] = {
> -       { "tc358775", 0 },
> +       { "tc358765", TC358765, },
> +       { "tc358775", TC358775, },
>         { }
>  };
>  MODULE_DEVICE_TABLE(i2c, tc358775_i2c_ids);
>
>  static const struct of_device_id tc358775_of_ids[] = {
> -       { .compatible = "toshiba,tc358775", },
> +       { .compatible = "toshiba,tc358765", .data = (void *)TC358765, },
> +       { .compatible = "toshiba,tc358775", .data = (void *)TC358775, },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, tc358775_of_ids);
> --
> 2.43.0



-- 
With best wishes
Dmitry
