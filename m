Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECF45C456
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 14:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956596E88D;
	Wed, 24 Nov 2021 13:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD816E88D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 13:45:23 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id be32so5365933oib.11
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 05:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ezc5SLXYJLrcaPOOVNtj0dFXr/h05ViAasuR4jr+DtU=;
 b=prhVnq+jspJN8tO7svxvNm6LLqqCGKgNJm0h1/gbAi9bMoO62Bgt+gaZGmTO8ygmHe
 1jpfmqreyFMRuecULaIPy77AX1KVrXoB56Y9Ey1adGizMdF2GaVfpkx4I9LsG096zH6E
 2B4ugnXtSe6owXWftoWVCGW5BM7oYZAZ7wZ+eDlcRtf+EMu4K0w359rGiJRgtMgOUY8I
 uWDDoiqxwvOianjY4NkDOcUU5ErnyatatGQAr3lqRB60wmHsRUrI2/Ej4tgIFwxQp4Gs
 W8/qGT9+bZMHJh3AW/6vnI//EcbcPrBHr601bXCKLhu5rR40y5jdkzY1syPbq3y2OEf/
 96Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ezc5SLXYJLrcaPOOVNtj0dFXr/h05ViAasuR4jr+DtU=;
 b=ELn4p5ry+vMbbQJRHFpsBfLKps58kWNQbF78DfYhRjBRcRHyew9Z3M5xOZewdTG2XJ
 4Lx8fMyIi5N+82vlrpnYDIx9p+uC29aSxD4M3nwYJpWnfR3F6HpHcHm25qkFP2s9FRQX
 uHGWZY63EWjpWVGlQHmOu1WezpQWE8cUm2j1xlv1vOXG5pNa8r3dPjY7ACbjLt2SuwSW
 MORj84592VuebXTrWpOFWAVxJHWgsoy9evfgyfMLyNeE1yFrUd6wAfjZqKaDFtGwPI9H
 UTM95yNF3Bp0zI1b/P5REPKSrdBUmM/XUarRFaasRuXI1UhHBLdhO4IyjR1kO98hiDAs
 7b1g==
X-Gm-Message-State: AOAM531NcHnItjg5bKxmRRxtcXx3LeHlF7YdOxDd8P+UkDFLVM/F5Kfj
 YJPmF4G6R7QIvdTpY9U5uTlbUij6XasYE9QKcpAcJQ==
X-Google-Smtp-Source: ABdhPJyrzuT29TUGqUWE0SuiTaUc649bJN8Z/sAvyk0smRQHoBAHlkq+0meoc3/Zexv9OZEpXCx6FlkwqL0K8VjBIJQ=
X-Received: by 2002:aca:2b02:: with SMTP id i2mr5980784oik.140.1637761522606; 
 Wed, 24 Nov 2021 05:45:22 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Nov 2021 13:45:21 +0000
MIME-Version: 1.0
In-Reply-To: <20211116145112.xyoxzfll6exysnvt@gilmour>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
 <20211115101129.lyxxmb6i7paaonwi@gilmour>
 <CABnWg9tNPGZSi1RLqF5+Qs1GHtynyVoOzAyw+i9mPRYEoByk8g@mail.gmail.com>
 <20211116145112.xyoxzfll6exysnvt@gilmour>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Wed, 24 Nov 2021 13:45:21 +0000
Message-ID: <CABnWg9uhuchdWyBeTacR6Cy0A9OHziUi051BQ5wsZVU0ajYjyA@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
Thanks for all your input, really appreciated.

Quoting Maxime Ripard (2021-11-16 15:51:12)
> Hi,
>
> On Mon, Nov 15, 2021 at 09:33:52AM -0500, Guillaume Ranquet wrote:
> > Quoting Maxime Ripard (2021-11-15 11:11:29)
> > > > The driver creates a child device for the phy. The child device will
> > > > never exist without the parent being active. As they are sharing a
> > > > register range, the parent passes a regmap pointer to the child so that
> > > > both can work with the same register range. The phy driver sets device
> > > > data that is read by the parent to get the phy device that can be used
> > > > to control the phy properties.
> > >
> > > If the PHY is in the same register space than the DP controller, why do
> > > you need a separate PHY driver in the first place?
> >
> > This has been asked by Chun-Kuang Hu in a previous revision of the series:
> >
> > https://lore.kernel.org/linux-mediatek/CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com/
>
> It's a bit of a circular argument though :)
>
> It's a separate phy driver because it needs to go through another
> maintainer's tree, but it needs to go through another maintainer's tree
> because it's a separate phy driver.
>
> It doesn't explain why it needs to be a separate phy driver? Why can't
> the phy setup be done directly in the DP driver, if it's essentially a
> single device?
>
> That being said, usually what those kind of questions mean is that
> you're missing a comment or something in the commit log to provide that
> context in the first place, so it would be great to add that context
> here.
>
> And it will avoid the situation we're now in where multiple reviewers
> ask the same questions over and over again :)
>
At first I didn't understand your reply, then I realized I gave you
the wrong link...
my bad! I'm struggling a bit with mail reviews, but I'll get there eventually.

The driver and phy were a single driver until v2 of this patch series
and the phy setup
was done directly in the driver (single driver, single C file).
Here's the relevant link to the discussion between Chun-Kuang and Markus

https://lore.kernel.org/linux-mediatek/CAAOTY__cJMqcAieEraJ2sz4gi0Zs-aiNXz38_x7dPQea6HvYEg@mail.gmail.com/#t

I'll try to find a way to make it clearer for v7.

> > > > +static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> > > > +                                     struct drm_bridge_state *old_state)
> > > > +{
> > > > +     struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> > > > +     struct drm_connector *conn;
> > > > +     struct drm_connector_state *conn_state;
> > > > +     struct drm_crtc *crtc;
> > > > +     struct drm_crtc_state *crtc_state;
> > > > +     int ret = 0;
> > > > +     int i;
> > > > +
> > > > +     conn = drm_atomic_get_new_connector_for_encoder(old_state->base.state,
> > > > +                                                     bridge->encoder);
> > > > +     if (!conn) {
> > > > +             drm_err(mtk_dp->drm_dev,
> > > > +                     "Can't enable bridge as connector is missing\n");
> > > > +             return;
> > > > +     }
> > > > +
> > > > +     memcpy(mtk_dp->connector_eld, conn->eld, MAX_ELD_BYTES);
> > >
> > > This should be protected by a mutex (just like any resource shared
> > > between KMS and ALSA)
> >
> > Ok.
>
> I forgot to ask (even though checkpatch does mention it iirc), but since
> you have multiple mutex it would be nice to have a comment for each
> mutex stating exactly what it protects, and against what.
>
> It's hard otherwise to remember or figure out what the locks are here
> for.
>
> > > > +     ret = mtk_dp_dt_parse_pdata(mtk_dp, pdev);
> > > > +     if (ret)
> > > > +             return ret;
> > >
> > > pdata?
> > >
> > can you elaborate?
>
> Sorry, yeah, pdata is usually the abbreviation used in linux for the
> platform_data mechanism, but you're using the DT to retrieve your
> resources (and platform_data usually don't involve any parsing), so the
> name is odd.
>
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > index 384074f69111b..e6e88e3cd811d 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
> > > >       MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> > > >  };
> > > >
> > > > +enum TVDPLL_CLK {
> > > > +     TVDPLL_PLL = 0,
> > > > +     TVDPLL_D2 = 2,
> > > > +     TVDPLL_D4 = 4,
> > > > +     TVDPLL_D8 = 8,
> > > > +     TVDPLL_D16 = 16,
> > > > +};
> > > > +
> > > >  struct mtk_dpi {
> > > >       struct drm_encoder encoder;
> > > >       struct drm_bridge bridge;
> > > > @@ -71,8 +79,10 @@ struct mtk_dpi {
> > > >       void __iomem *regs;
> > > >       struct device *dev;
> > > >       struct clk *engine_clk;
> > > > +     struct clk *dpi_ck_cg;
> > > >       struct clk *pixel_clk;
> > > >       struct clk *tvd_clk;
> > > > +     struct clk *pclk_src[5];
> > > >       int irq;
> > > >       struct drm_display_mode mode;
> > > >       const struct mtk_dpi_conf *conf;
> > > > @@ -135,6 +145,7 @@ struct mtk_dpi_conf {
> > > >       u32 hvsize_mask;
> > > >       u32 channel_swap_shift;
> > > >       u32 yuv422_en_bit;
> > > > +     u32 csc_enable_bit;
> > > >       const struct mtk_dpi_yc_limit *limit;
> > > >  };
> > > >
> > > > @@ -365,7 +376,7 @@ static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
> > > >
> > > >  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
> > > >  {
> > > > -     mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0, CSC_ENABLE);
> > > > +     mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit : 0, dpi->conf->csc_enable_bit);
> > > >  }
> > > >
> > > >  static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enable)
> > > > @@ -384,22 +395,45 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
> > > >               mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
> > > >  }
> > > >
> > > > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi_out_color_format format)
> > > > +{
> > > > +     u32 matrix_sel = 0;
> > > > +
> > > > +     switch (format) {
> > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > > > +     case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > > > +             if (dpi->mode.hdisplay <= 720)
> > > > +                     matrix_sel = 0x2;
> > > > +             break;
> > > > +     default:
> > > > +             break;
> > > > +     }
> > > > +     mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK);
> > > > +}
> > > > +
> > > >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> > > >                                       enum mtk_dpi_out_color_format format)
> > > >  {
> > > >       if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_444) ||
> > > >           (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> > > >               mtk_dpi_config_yuv422_enable(dpi, false);
> > > > -             if (dpi->conf->csc_support)
> > > > +             if (dpi->conf->csc_support) {
> > > >                       mtk_dpi_config_csc_enable(dpi, true);
> > > > +                     mtk_dpi_matrix_sel(dpi, format);
> > > > +             }
> > > >               if (dpi->conf->swap_input_support)
> > > >                       mtk_dpi_config_swap_input(dpi, false);
> > > >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> > > >       } else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> > > >                  (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> > > >               mtk_dpi_config_yuv422_enable(dpi, true);
> > > > -             if (dpi->conf->csc_support)
> > > > +             if (dpi->conf->csc_support) {
> > > >                       mtk_dpi_config_csc_enable(dpi, true);
> > > > +                     mtk_dpi_matrix_sel(dpi, format);
> > > > +             }
> > > >               if (dpi->conf->swap_input_support)
> > > >                       mtk_dpi_config_swap_input(dpi, true);
> > > >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> > > > @@ -441,6 +475,8 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
> > > >       mtk_dpi_disable(dpi);
> > > >       clk_disable_unprepare(dpi->pixel_clk);
> > > >       clk_disable_unprepare(dpi->engine_clk);
> > > > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > > > +     clk_disable_unprepare(dpi->tvd_clk);
> > > >  }
> > > >
> > > >  static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > > > @@ -450,12 +486,24 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > > >       if (++dpi->refcount != 1)
> > > >               return 0;
> > > >
> > > > +     ret = clk_prepare_enable(dpi->tvd_clk);
> > > > +     if (ret) {
> > > > +             dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
> > > > +             goto err_pixel;
> > > > +     }
> > > > +
> > > >       ret = clk_prepare_enable(dpi->engine_clk);
> > > >       if (ret) {
> > > >               dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
> > > >               goto err_refcount;
> > > >       }
> > > >
> > > > +     ret = clk_prepare_enable(dpi->dpi_ck_cg);
> > > > +     if (ret) {
> > > > +             dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock: %d\n", ret);
> > > > +             goto err_ck_cg;
> > > > +     }
> > > > +
> > > >       ret = clk_prepare_enable(dpi->pixel_clk);
> > > >       if (ret) {
> > > >               dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
> > > > @@ -465,10 +513,11 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > > >       if (dpi->pinctrl && dpi->pins_dpi)
> > > >               pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> > > >
> > > > -     mtk_dpi_enable(dpi);
> > > >       return 0;
> > > >
> > > >  err_pixel:
> > > > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > > > +err_ck_cg:
> > > >       clk_disable_unprepare(dpi->engine_clk);
> > > >  err_refcount:
> > > >       dpi->refcount--;
> > > > @@ -500,9 +549,16 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> > > >       pll_rate = clk_get_rate(dpi->tvd_clk);
> > > >
> > > >       vm.pixelclock = pll_rate / factor;
> > > > -     if (dpi->conf->is_dpintf)
> > > > -             clk_set_rate(dpi->pixel_clk, vm.pixelclock / 4);
> > > > -     else if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > > > +     if (dpi->conf->is_dpintf) {
> > > > +             if (factor == 1)
> > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
> > > > +             else if (factor == 2)
> > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[3]);
> > > > +             else if (factor == 4)
> > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[4]);
> > > > +             else
> > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
> > > > +     } else if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > > >                (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> > > >               clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> > > >       else
> > > > @@ -581,6 +637,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> > > >       }
> > > >       mtk_dpi_sw_reset(dpi, false);
> > > >
> > > > +     mtk_dpi_enable(dpi);
> > > > +
> > > >       return 0;
> > > >  }
> > > >
> > > > @@ -623,7 +681,6 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > > >       u32 *input_fmts;
> > > >
> > > >       *num_input_fmts = 0;
> > > > -
> > > >       input_fmts = kcalloc(1, sizeof(*input_fmts),
> > > >                            GFP_KERNEL);
> > > >       if (!input_fmts)
> > > > @@ -649,7 +706,7 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
> > > >               if (dpi->conf->num_output_fmts)
> > > >                       out_bus_format = dpi->conf->output_fmts[0];
> > > >
> > > > -     dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> > > > +     dev_info(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> > > >               bridge_state->input_bus_cfg.format,
> > > >               bridge_state->output_bus_cfg.format);
> > > >
> > > > @@ -657,7 +714,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
> > > >       dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> > > >       dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > > >       dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > > > -     dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > > +     if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> > > > +             dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
> > > > +     else
> > > > +             dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > >
> > > >       return 0;
> > > >  }
> > > > @@ -835,6 +895,12 @@ static const u32 mt8183_output_fmts[] = {
> > > >       MEDIA_BUS_FMT_RGB888_2X12_BE,
> > > >  };
> > > >
> > > > +static const u32 mt8195_output_fmts[] = {
> > > > +     MEDIA_BUS_FMT_RGB888_1X24,
> > > > +     MEDIA_BUS_FMT_YUV8_1X24,
> > > > +     MEDIA_BUS_FMT_YUYV8_1X16,
> > > > +};
> > > > +
> > > >  static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
> > > >       .c_bottom = 0x0010,
> > > >       .c_top = 0x0FE0,
> > > > @@ -862,6 +928,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
> > > >       .hvsize_mask = HSIZE_MASK,
> > > >       .channel_swap_shift = CH_SWAP,
> > > >       .yuv422_en_bit = YUV422_EN,
> > > > +     .csc_enable_bit = CSC_ENABLE,
> > > >       .limit = &mtk_dpi_limit,
> > > >  };
> > > >
> > > > @@ -879,6 +946,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
> > > >       .hvsize_mask = HSIZE_MASK,
> > > >       .channel_swap_shift = CH_SWAP,
> > > >       .yuv422_en_bit = YUV422_EN,
> > > > +     .csc_enable_bit = CSC_ENABLE,
> > > >       .limit = &mtk_dpi_limit,
> > > >  };
> > > >
> > > > @@ -895,6 +963,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
> > > >       .hvsize_mask = HSIZE_MASK,
> > > >       .channel_swap_shift = CH_SWAP,
> > > >       .yuv422_en_bit = YUV422_EN,
> > > > +     .csc_enable_bit = CSC_ENABLE,
> > > >       .limit = &mtk_dpi_limit,
> > > >  };
> > > >
> > > > @@ -911,18 +980,21 @@ static const struct mtk_dpi_conf mt8192_conf = {
> > > >       .hvsize_mask = HSIZE_MASK,
> > > >       .channel_swap_shift = CH_SWAP,
> > > >       .yuv422_en_bit = YUV422_EN,
> > > > +     .csc_enable_bit = CSC_ENABLE,
> > > >       .limit = &mtk_dpi_limit,
> > > >  };
> > > >
> > > >  static const struct mtk_dpi_conf mt8195_dpintf_conf = {
> > > >       .cal_factor = mt8195_dpintf_calculate_factor,
> > > > -     .output_fmts = mt8173_output_fmts,
> > > > -     .num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > > > +     .output_fmts = mt8195_output_fmts,
> > > > +     .num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> > > >       .is_dpintf = true,
> > > > +     .csc_support = true,
> > > >       .dimension_mask = DPINTF_HPW_MASK,
> > > >       .hvsize_mask = DPINTF_HSIZE_MASK,
> > > >       .channel_swap_shift = DPINTF_CH_SWAP,
> > > >       .yuv422_en_bit = DPINTF_YUV422_EN,
> > > > +     .csc_enable_bit = DPINTF_CSC_ENABLE,
> > > >       .limit = &mtk_dpintf_limit,
> > > >  };
> > > >
> > > > @@ -979,6 +1051,16 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> > > >               return ret;
> > > >       }
> > > >
> > > > +     dpi->dpi_ck_cg = devm_clk_get(dev, "ck_cg");
> > > > +     if (IS_ERR(dpi->dpi_ck_cg)) {
> > > > +             ret = PTR_ERR(dpi->dpi_ck_cg);
> > > > +             if (ret != -EPROBE_DEFER)
> > > > +                     dev_err(dev, "Failed to get dpi ck cg clock: %d\n",
> > > > +                             ret);
> > > > +
> > > > +             return ret;
> > > > +     }
> > > > +
> > > >       dpi->pixel_clk = devm_clk_get(dev, "pixel");
> > > >       if (IS_ERR(dpi->pixel_clk)) {
> > > >               ret = PTR_ERR(dpi->pixel_clk);
> > > > @@ -997,6 +1079,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> > > >               return ret;
> > > >       }
> > > >
> > > > +     dpi->pclk_src[1] = devm_clk_get(dev, "TVDPLL_D2");
> > > > +     dpi->pclk_src[2] = devm_clk_get(dev, "TVDPLL_D4");
> > > > +     dpi->pclk_src[3] = devm_clk_get(dev, "TVDPLL_D8");
> > > > +     dpi->pclk_src[4] = devm_clk_get(dev, "TVDPLL_D16");
> > > > +
> > > >       dpi->irq = platform_get_irq(pdev, 0);
> > > >       if (dpi->irq <= 0)
> > > >               return -EINVAL;
> > >
> > > All those changes look unrelated as well?
> > >
> > Do you mean all the changes in mtk_dpi.c ? They are in support of
> > enabling the mt8195 dpintf driver... so, not sure they are unlreated?
>
> I don't know that driver at all, so it's probably related if you say so
> :)
>
> The DPI interface seems to be a panel interface, so it's a bit weird to
> me why you would need to change things in the panel interface while
> claiming to support a DP output.
>
> Especially since it looks like you have some support for CSC, and
> support for additional output formats?
>
> I guess the DPI interface feeds the DP that essentially acts as a RGB ->
> DP bridge?
>
> If so, then the part adding support for CSC and additional formats
> should be split into a separate patch, and it should be mentioned in the
> commit log
>
> Maxime

I see what you mean, I'll split the patches functionally...
I'm discovering the gpu/drm tree, so It may take me a while to get it right :D

Thx,
Guillaume.
