Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1569310374
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 04:21:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931716E156;
	Fri,  5 Feb 2021 03:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591246E156
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Feb 2021 03:21:36 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id q12so7772876lfo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3pb9e/xdQGDLFkoDNDeMMQMJFh8zeB5fbZnoZcPjiLU=;
 b=NEltKwuQrOCgSsU/eEWxiRMVRvhXADHvOVfCHRhjMc3nvuoHmlrtlckY1bJ+/ynFYv
 LzgGk/ZW0XvT+KkaFH0sfyJKfBZI8GdgfCn7Vu1ZpgQeGJLgsktnvcISePwY0W7RKqoM
 31TGzG+/UsilJBaL3MsWJX/9weJluRJfV55kjIMg5WaXyLzbAgL65/RIB396gLGI/SmQ
 DNVvdOBr3EIdbIXqMmWvwZ8BNQZqOYOxwCq4SPbSV7LuZuLFwquD66ST5h0KYWrupxo2
 d91yCmbNZ73dZQn7oZlojQInj/917ILPkpQDtQAygdINQrvP/Hx8/r2a4a9fSV5Klvfz
 hjfQ==
X-Gm-Message-State: AOAM530zklJbSaWWAXCImnfIuh8vfWgH3Py0OZNwz9TaUiyajVQYkl/o
 ClSYi2fjTtUuRXQf5H5kjyG75BAzBC9ApQ==
X-Google-Smtp-Source: ABdhPJyLhCV4oRT6grLU/WzyoNe8WbAUI1lweES8/R78O7CRVJWWaP7huR0ifyV4fWgOFN3uXVYuGA==
X-Received: by 2002:ac2:5f04:: with SMTP id 4mr1332556lfq.357.1612495294262;
 Thu, 04 Feb 2021 19:21:34 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com.
 [209.85.208.172])
 by smtp.gmail.com with ESMTPSA id j15sm829021lfj.146.2021.02.04.19.21.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 19:21:33 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id v15so5995215ljk.13
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 19:21:33 -0800 (PST)
X-Received: by 2002:a2e:9d04:: with SMTP id t4mr1458674lji.56.1612495293179;
 Thu, 04 Feb 2021 19:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20210204184710.1880895-1-jernej.skrabec@siol.net>
 <20210204184710.1880895-3-jernej.skrabec@siol.net>
In-Reply-To: <20210204184710.1880895-3-jernej.skrabec@siol.net>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 Feb 2021 11:21:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com>
Message-ID: <CAGb2v64qww4pFwMVrY5UpHOQtM43Q0VPx=3PwJGbB5Oh0qnx=w@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/sun4i: tcon: set sync polarity for tcon1 channel
To: Jernej Skrabec <jernej.skrabec@siol.net>
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
Cc: Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 5, 2021 at 2:48 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> Channel 1 has polarity bits for vsync and hsync signals but driver never
> sets them. It turns out that with pre-HDMI2 controllers seemingly there
> is no issue if polarity is not set. However, with HDMI2 controllers
> (H6) there often comes to de-synchronization due to phase shift. This
> causes flickering screen. It's safe to assume that similar issues might
> happen also with pre-HDMI2 controllers.
>
> Solve issue with setting vsync and hsync polarity. Note that display
> stacks with tcon top have polarity bits actually in tcon0 polarity
> register.
>
> Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
> Tested-by: Andre Heider <a.heider@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  5 +++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> index 6b9af4c08cd6..0d132dae58c0 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -672,6 +672,29 @@ static void sun4i_tcon1_mode_set(struct sun4i_tcon *tcon,
>                      SUN4I_TCON1_BASIC5_V_SYNC(vsync) |
>                      SUN4I_TCON1_BASIC5_H_SYNC(hsync));
>
> +       /* Setup the polarity of sync signals */
> +       if (tcon->quirks->polarity_in_ch0) {
> +               val = 0;
> +
> +               if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +                       val |= SUN4I_TCON0_IO_POL_HSYNC_POSITIVE;
> +
> +               if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +                       val |= SUN4I_TCON0_IO_POL_VSYNC_POSITIVE;
> +
> +               regmap_write(tcon->regs, SUN4I_TCON0_IO_POL_REG, val);
> +       } else {
> +               val = SUN4I_TCON1_IO_POL_UNKNOWN;

I think a comment for the origin of this is warranted.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> +
> +               if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +                       val |= SUN4I_TCON1_IO_POL_HSYNC_POSITIVE;
> +
> +               if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +                       val |= SUN4I_TCON1_IO_POL_VSYNC_POSITIVE;
> +
> +               regmap_write(tcon->regs, SUN4I_TCON1_IO_POL_REG, val);
> +       }
> +
>         /* Map output pins to channel 1 */
>         regmap_update_bits(tcon->regs, SUN4I_TCON_GCTL_REG,
>                            SUN4I_TCON_GCTL_IOMAP_MASK,
> @@ -1500,6 +1523,7 @@ static const struct sun4i_tcon_quirks sun8i_a83t_tv_quirks = {
>
>  static const struct sun4i_tcon_quirks sun8i_r40_tv_quirks = {
>         .has_channel_1          = true,
> +       .polarity_in_ch0        = true,
>         .set_mux                = sun8i_r40_tcon_tv_set_mux,
>  };
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> index c5ac1b02482c..b504fb2d3de5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> @@ -154,6 +154,10 @@
>  #define SUN4I_TCON1_BASIC5_V_SYNC(height)              (((height) - 1) & 0x3ff)
>
>  #define SUN4I_TCON1_IO_POL_REG                 0xf0
> +#define SUN4I_TCON1_IO_POL_UNKNOWN                     BIT(26)
> +#define SUN4I_TCON1_IO_POL_HSYNC_POSITIVE              BIT(25)
> +#define SUN4I_TCON1_IO_POL_VSYNC_POSITIVE              BIT(24)
> +
>  #define SUN4I_TCON1_IO_TRI_REG                 0xf4
>
>  #define SUN4I_TCON_ECC_FIFO_REG                        0xf8
> @@ -236,6 +240,7 @@ struct sun4i_tcon_quirks {
>         bool    needs_de_be_mux; /* sun6i needs mux to select backend */
>         bool    needs_edp_reset; /* a80 edp reset needed for tcon0 access */
>         bool    supports_lvds;   /* Does the TCON support an LVDS output? */
> +       bool    polarity_in_ch0; /* some tcon1 channels have polarity bits in tcon0 pol register */
>         u8      dclk_min_div;   /* minimum divider for TCON0 DCLK */
>
>         /* callback to handle tcon muxing options */
> --
> 2.30.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
