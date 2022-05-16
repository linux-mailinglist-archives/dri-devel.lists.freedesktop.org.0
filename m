Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE0B5287A5
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 16:55:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E9D10FAD8;
	Mon, 16 May 2022 14:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEE210FAD8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 14:55:17 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id 204so14267057pfx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ViyfomiFUIHlARhjAPLqPB/6CtB3pATjwPpex7ghdQM=;
 b=vXwPWwZJ8zGVr7zOWuaq+zjIBLXFK34ubYpFo/LwM9kdJ5gujBVhQNf/S46wwwVOGx
 hfB+DfJQhsCW578dOsoQ7GW2D+TrZElznP86nSnc40pjxFs6pqTNjeQp84D+JQOY2dfn
 4EzrHTz9Gm+u0NyfIuKit63GVc6ezkt0lKHSjUsbI0SVHX7bt5v78Hjmw1wLA7NWLv7E
 JX6r/0S+JFP6ZH74cE2fiCGYdYJSDarSKsMoysY1XK6LIAjHEqo4JkgUDDcPlDkuxhNo
 ux/5H/Tis1SuR+UpFLn+ZBWMkQ3PnFZV1iQL8+Eq6Mk7Ow86GwZ1uYeDbUNDhyEkBH3u
 fEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ViyfomiFUIHlARhjAPLqPB/6CtB3pATjwPpex7ghdQM=;
 b=HS0ihPwed2M8/CHvPr0w0aoVZhNI+NhyY6f/RhPm0gwhXySP6rom8XatVsDv294Y69
 Fyl/J8It8hR62d7bENhmTeBXwtR+UJVUF4Mhj30abun+i5LJiDVKEKoWAgX3kLAwbIKA
 970if6tpDVjuymwvFkPB+a4xR+L9r1wgEYKYwGTjJ2FKjg5MHeJ3et0krtrWFVA6jyA5
 ib0iVUBPqUEovjneu4BsSifc7nXgxaq/mgliJWOUPAgVQ5v+PuoI0uG8YTH3rxSPiAwr
 yoAKxlCDR3bPBuFswo7U8e6vNqM56NuNdS7+8TpUQwP2w3HG68nE7jk60ph8XFz3bnOp
 h4Xg==
X-Gm-Message-State: AOAM532EYUQoq4xpHF0ZRsU6p7bQqXyTarzJa5zl2PJSY7db0We2qEF4
 egloODCxdm8x6NZLnYZ74KpAmu5FJBC+D2KqnxWIInvQY64=
X-Google-Smtp-Source: ABdhPJyhy7t07JIoruVvQavNgk31dQSXMpejs1IHWjVAig11EYsMYDWZhBsiEfYPALMcBGGn/BYCg3dF43c7QLNyYTU=
X-Received: by 2002:a65:4581:0:b0:3f2:638f:6f76 with SMTP id
 o1-20020a654581000000b003f2638f6f76mr6037420pgq.324.1652712917121; Mon, 16
 May 2022 07:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220430025020.640277-1-marex@denx.de>
In-Reply-To: <20220430025020.640277-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 16 May 2022 16:55:06 +0200
Message-ID: <CAG3jFyuMoAwMdGr6cbCYLOaPKtCrRF+dyghy4fSvrnt8x2jDhA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: icn6211: Register macro clean up
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 30 Apr 2022 at 04:50, Marek Vasut <marex@denx.de> wrote:
>
> Drop two unused register macros, ICN6211_MAX_REGISTER and MIPI_ATE_STATUS_1,
> neither of which is used and where the later should be specified using macro
> MIPI_ATE_STATUS(1) instead. Drop the _(n) underscore and keep only the (n)
> part of register macros. No functional change.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 5a9e7eb5dc8e..45bb89ac3fff 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -100,7 +100,7 @@
>  #define MIPI_PN_SWAP           0x87
>  #define MIPI_PN_SWAP_CLK               BIT(4)
>  #define MIPI_PN_SWAP_D(n)              BIT((n) & 0x3)
> -#define MIPI_SOT_SYNC_BIT_(n)  (0x88 + ((n) & 0x1)) /* 0..1 */
> +#define MIPI_SOT_SYNC_BIT(n)   (0x88 + ((n) & 0x1)) /* 0..1 */
>  #define MIPI_ULPS_CTRL         0x8a
>  #define MIPI_CLK_CHK_VAR       0x8e
>  #define MIPI_CLK_CHK_INI       0x8f
> @@ -115,7 +115,7 @@
>  #define MIPI_T_CLK_SETTLE      0x9a
>  #define MIPI_TO_HS_RX_L                0x9e
>  #define MIPI_TO_HS_RX_H                0x9f
> -#define MIPI_PHY_(n)           (0xa0 + ((n) & 0x7)) /* 0..5 */
> +#define MIPI_PHY(n)            (0xa0 + ((n) & 0x7)) /* 0..5 */
>  #define MIPI_PD_RX             0xb0
>  #define MIPI_PD_TERM           0xb1
>  #define MIPI_PD_HSRX           0xb2
> @@ -125,13 +125,11 @@
>  #define MIPI_FORCE_0           0xb6
>  #define MIPI_RST_CTRL          0xb7
>  #define MIPI_RST_NUM           0xb8
> -#define MIPI_DBG_SET_(n)       (0xc0 + ((n) & 0xf)) /* 0..9 */
> +#define MIPI_DBG_SET(n)                (0xc0 + ((n) & 0xf)) /* 0..9 */
>  #define MIPI_DBG_SEL           0xe0
>  #define MIPI_DBG_DATA          0xe1
>  #define MIPI_ATE_TEST_SEL      0xe2
> -#define MIPI_ATE_STATUS_(n)    (0xe3 + ((n) & 0x1)) /* 0..1 */
> -#define MIPI_ATE_STATUS_1      0xe4
> -#define ICN6211_MAX_REGISTER   MIPI_ATE_STATUS(1)
> +#define MIPI_ATE_STATUS(n)     (0xe3 + ((n) & 0x1)) /* 0..1 */
>
>  struct chipone {
>         struct device *dev;
> @@ -155,10 +153,10 @@ static const struct regmap_range chipone_dsi_readable_ranges[] = {
>         regmap_reg_range(MIPI_CLK_CHK_VAR, MIPI_T_TA_SURE_PRE),
>         regmap_reg_range(MIPI_T_LPX_SET, MIPI_INIT_TIME_H),
>         regmap_reg_range(MIPI_T_CLK_TERM_EN, MIPI_T_CLK_SETTLE),
> -       regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY_(5)),
> +       regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY(5)),
>         regmap_reg_range(MIPI_PD_RX, MIPI_RST_NUM),
> -       regmap_reg_range(MIPI_DBG_SET_(0), MIPI_DBG_SET_(9)),
> -       regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS_(1)),
> +       regmap_reg_range(MIPI_DBG_SET(0), MIPI_DBG_SET(9)),
> +       regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS(1)),
>  };
>
>  static const struct regmap_access_table chipone_dsi_readable_table = {
> @@ -172,10 +170,10 @@ static const struct regmap_range chipone_dsi_writeable_ranges[] = {
>         regmap_reg_range(MIPI_CLK_CHK_VAR, MIPI_T_TA_SURE_PRE),
>         regmap_reg_range(MIPI_T_LPX_SET, MIPI_INIT_TIME_H),
>         regmap_reg_range(MIPI_T_CLK_TERM_EN, MIPI_T_CLK_SETTLE),
> -       regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY_(5)),
> +       regmap_reg_range(MIPI_TO_HS_RX_L, MIPI_PHY(5)),
>         regmap_reg_range(MIPI_PD_RX, MIPI_RST_NUM),
> -       regmap_reg_range(MIPI_DBG_SET_(0), MIPI_DBG_SET_(9)),
> -       regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS_(1)),
> +       regmap_reg_range(MIPI_DBG_SET(0), MIPI_DBG_SET(9)),
> +       regmap_reg_range(MIPI_DBG_SEL, MIPI_ATE_STATUS(1)),
>  };
>
>  static const struct regmap_access_table chipone_dsi_writeable_table = {
> @@ -189,7 +187,7 @@ static const struct regmap_config chipone_regmap_config = {
>         .rd_table = &chipone_dsi_readable_table,
>         .wr_table = &chipone_dsi_writeable_table,
>         .cache_type = REGCACHE_RBTREE,
> -       .max_register = MIPI_ATE_STATUS_(1),
> +       .max_register = MIPI_ATE_STATUS(1),
>  };
>
>  static int chipone_dsi_read(void *context,

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
