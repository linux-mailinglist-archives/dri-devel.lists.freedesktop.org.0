Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E62435374
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7A66E095;
	Wed, 20 Oct 2021 19:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975386E095
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 19:08:24 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o24so13255887wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BpW9Y4HGoA+1LqnDwYZs0eioGqJSlxwROr7SPjbDQ+I=;
 b=eq0WIIqm/gMD7Oys38tm0QiNVgKLBqVh7ySMlG9YZTd3S+aHtxKzwbRYReu+Fhw7Uc
 xhNKSPxOQhaGMjsv3W97Sw2esUHmcPN8zyTwjCyT4dWp9j5yx3bMq2zBPY5NTHk/0w46
 njRlZI6BEURE4mXZzCPNFEbxfw3yRNvMlbu5NKJdY2L18vlCXZemGNzqduz8OPkwcVaq
 eR0CyXS69NArYcmG7WnzivbJpzzgkcUzXfXeMTyTw6tX5nW2/yujt3bKvOxjRZP2790/
 j1Avu2y45y0hY5wsgurVmuYXAYols+10n4S0z7LOJoGStdOWKeNfHc10ssaHabkjQ/Hr
 9A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BpW9Y4HGoA+1LqnDwYZs0eioGqJSlxwROr7SPjbDQ+I=;
 b=HLPAtDLzGeuMWTFxdns1P6lRLYFQjj5TD473ziiPHjds/kvEiK5/lTXBYCt7u38sG/
 bM541zUuJKuFMGQdhiCwAMWFhABd12j+J9tQ6sF9CGhkz4iBPthVY8yhMobIg7Ov2Ein
 HgmqZnTYOlzHoId2vGhMObZAcuWzrsTaw30J+hEomUGxwj84q0fmWjef0qLjPJb+vxoU
 PHW3ZfQGETxN/uCRqJaDOG3zzhdCGHeLKWAvC/kLChmuGqrAVd22VzCOuIjwnXXjRe4v
 uSXXe1XgFUk5ziCske0bmzA2zrvqSEFyC2bWRasLgdLziajYHNXhABiU4WUcHz1wiirN
 Utrw==
X-Gm-Message-State: AOAM530d97EF2GTuF0YF9u2b2t1waVekNORWULVtXrkRpdo66ybd0DUr
 rkEBG6YkJiyElq5iprTtDbQ0CA==
X-Google-Smtp-Source: ABdhPJzDxzw8uDT3asvSXe9q0cwhR84bOnUUBBSKoKwV4jBpMHmSoeudfCTrXUvUggSiQVA8PRKtTg==
X-Received: by 2002:a05:600c:1c8c:: with SMTP id
 k12mr1230046wms.74.1634756902899; 
 Wed, 20 Oct 2021 12:08:22 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id i24sm2825659wml.26.2021.10.20.12.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:08:21 -0700 (PDT)
Date: Wed, 20 Oct 2021 21:08:20 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 5/6] drm/mediatek: dpi: Add dpintf support
Message-ID: <20211020190820.dl3w5wetvy5sw2t7@blmsp>
References: <20211001094443.2770169-1-msp@baylibre.com>
 <20211001094443.2770169-6-msp@baylibre.com>
 <CAAOTY_9-H=AGhJJTgXb+mkTbAAkeGVj=Ur91gMcbOQY-5ND9aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAOTY_9-H=AGhJJTgXb+mkTbAAkeGVj=Ur91gMcbOQY-5ND9aQ@mail.gmail.com>
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

Hi Chun-Kuang,

On Fri, Oct 15, 2021 at 12:04:10AM +0800, Chun-Kuang Hu wrote:
> Hi, Markus:
> 
> Markus Schneider-Pargmann <msp@baylibre.com> 於 2021年10月1日 週五 下午5:44寫道：
> >
> > dpintf is the displayport interface hardware unit. This unit is similar
> > to dpi and can reuse most of the code.
> >
> > This patch adds support for mt8195-dpintf to this dpi driver. Main
> > differences are:
> >  - Some features/functional components are not available for dpintf
> >    which are now excluded from code execution once is_dpintf is set
> >  - dpintf can and needs to choose between different clockdividers based
> >    on the clockspeed. This is done by choosing a different clock parent.
> >  - There are two additional clocks that need to be managed. These are
> >    only set for dpintf and will be set to NULL if not supplied. The
> >    clk_* calls handle these as normal clocks then.
> >  - Some register contents differ slightly between the two components. To
> >    work around this I added register bits/masks with a DPINTF_ prefix
> >    and use them where different.
> >
> > Based on a separate driver for dpintf created by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> >
> > Notes:
> >     Changes RFC -> v1:
> >     - Remove setting parents and fully rely on the clock tree instead which already
> >       models a mux at the important place.
> >     - Integrated mtk_dpi dpintf changes into the mediatek drm driver.
> >
> >  drivers/gpu/drm/mediatek/mtk_dpi.c          | 248 ++++++++++++++++----
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  12 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   5 +-
> >  5 files changed, 218 insertions(+), 52 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4554e2de1430..87961ebf5d35 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -71,6 +71,8 @@ struct mtk_dpi {
> >         void __iomem *regs;
> >         struct device *dev;
> >         struct clk *engine_clk;
> > +       struct clk *hf_fmm_clk;
> > +       struct clk *hf_fdp_clk;
> >         struct clk *pixel_clk;
> >         struct clk *tvd_clk;
> >         int irq;
> > @@ -125,6 +127,7 @@ struct mtk_dpi_conf {
> >         bool edge_sel_en;
> >         const u32 *output_fmts;
> >         u32 num_output_fmts;
> > +       bool is_dpintf;
> >  };
> >
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
> > @@ -153,30 +156,52 @@ static void mtk_dpi_disable(struct mtk_dpi *dpi)
> >  static void mtk_dpi_config_hsync(struct mtk_dpi *dpi,
> >                                  struct mtk_dpi_sync_param *sync)
> >  {
> > -       mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
> > -                    sync->sync_width << HPW, HPW_MASK);
> > -       mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
> > -                    sync->back_porch << HBP, HBP_MASK);
> > -       mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
> > -                    HFP_MASK);
> > +       if (dpi->conf->is_dpintf) {
> > +               mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
> > +                            sync->sync_width << HPW, DPINTF_HPW_MASK);
> > +               mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
> > +                            sync->back_porch << HBP, DPINTF_HBP_MASK);
> > +               mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
> > +                            DPINTF_HFP_MASK);
> 
> define dpi->conf->hpw_mask
> define dpi->conf->hbp_mask
> define dpi->conf->hfp_mask

Thanks, I defined a dpi->conf->dimension_mask instead which I now use
for HWIDTH/HPORCH as well as VSYNC_WIDTH and VSYNC_PORCH as the only
difference is the width of the masks, not their positions. Hope that's
fine.

> 
> > +       } else {
> > +               mtk_dpi_mask(dpi, DPI_TGEN_HWIDTH,
> > +                            sync->sync_width << HPW, HPW_MASK);
> > +               mtk_dpi_mask(dpi, DPI_TGEN_HPORCH,
> > +                            sync->back_porch << HBP, HBP_MASK);
> > +               mtk_dpi_mask(dpi, DPI_TGEN_HPORCH, sync->front_porch << HFP,
> > +                            HFP_MASK);
> > +       }
> >  }
> >
> >  static void mtk_dpi_config_vsync(struct mtk_dpi *dpi,
> >                                  struct mtk_dpi_sync_param *sync,
> >                                  u32 width_addr, u32 porch_addr)
> >  {
> > -       mtk_dpi_mask(dpi, width_addr,
> > -                    sync->sync_width << VSYNC_WIDTH_SHIFT,
> > -                    VSYNC_WIDTH_MASK);
> >         mtk_dpi_mask(dpi, width_addr,
> >                      sync->shift_half_line << VSYNC_HALF_LINE_SHIFT,
> >                      VSYNC_HALF_LINE_MASK);
> > -       mtk_dpi_mask(dpi, porch_addr,
> > -                    sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
> > -                    VSYNC_BACK_PORCH_MASK);
> > -       mtk_dpi_mask(dpi, porch_addr,
> > -                    sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
> > -                    VSYNC_FRONT_PORCH_MASK);
> > +
> > +       if (dpi->conf->is_dpintf) {
> > +               mtk_dpi_mask(dpi, width_addr,
> > +                            sync->sync_width << VSYNC_WIDTH_SHIFT,
> > +                            DPINTF_VSYNC_WIDTH_MASK);
> > +               mtk_dpi_mask(dpi, porch_addr,
> > +                            sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
> > +                            DPINTF_VSYNC_BACK_PORCH_MASK);
> > +               mtk_dpi_mask(dpi, porch_addr,
> > +                            sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
> > +                            DPINTF_VSYNC_FRONT_PORCH_MASK);
> > +       } else {
> > +               mtk_dpi_mask(dpi, width_addr,
> > +                            sync->sync_width << VSYNC_WIDTH_SHIFT,
> > +                            VSYNC_WIDTH_MASK);
> > +               mtk_dpi_mask(dpi, porch_addr,
> > +                            sync->back_porch << VSYNC_BACK_PORCH_SHIFT,
> > +                            VSYNC_BACK_PORCH_MASK);
> > +               mtk_dpi_mask(dpi, porch_addr,
> > +                            sync->front_porch << VSYNC_FRONT_PORCH_SHIFT,
> > +                            VSYNC_FRONT_PORCH_MASK);
> > +       }
> >  }
> >
> >  static void mtk_dpi_config_vsync_lodd(struct mtk_dpi *dpi,
> > @@ -210,13 +235,20 @@ static void mtk_dpi_config_pol(struct mtk_dpi *dpi,
> >                                struct mtk_dpi_polarities *dpi_pol)
> >  {
> >         unsigned int pol;
> > +       unsigned int mask;
> >
> > -       pol = (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ? 0 : CK_POL) |
> > -             (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ? 0 : DE_POL) |
> > -             (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
> > +       mask = HSYNC_POL | VSYNC_POL;
> > +       pol = (dpi_pol->hsync_pol == MTK_DPI_POLARITY_RISING ? 0 : HSYNC_POL) |
> >               (dpi_pol->vsync_pol == MTK_DPI_POLARITY_RISING ? 0 : VSYNC_POL);
> > -       mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol,
> > -                    CK_POL | DE_POL | HSYNC_POL | VSYNC_POL);
> > +       if (!dpi->conf->is_dpintf) {
> 
> define dpi->conf->is_ck_de_pol

done

> 
> > +               mask |= CK_POL | DE_POL;
> > +               pol |= (dpi_pol->ck_pol == MTK_DPI_POLARITY_RISING ?
> > +                       0 : CK_POL) |
> > +                      (dpi_pol->de_pol == MTK_DPI_POLARITY_RISING ?
> > +                       0 : DE_POL);
> > +       }
> > +
> > +       mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, pol, mask);
> >  }
> >
> >  static void mtk_dpi_config_3d(struct mtk_dpi *dpi, bool en_3d)
> > @@ -231,8 +263,13 @@ static void mtk_dpi_config_interface(struct mtk_dpi *dpi, bool inter)
> >
> >  static void mtk_dpi_config_fb_size(struct mtk_dpi *dpi, u32 width, u32 height)
> >  {
> > -       mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
> > -       mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
> > +       if (dpi->conf->is_dpintf) {
> > +               mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, DPINTF_HSIZE_MASK);
> > +               mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, DPINTF_VSIZE_MASK);
> > +       } else {
> > +               mtk_dpi_mask(dpi, DPI_SIZE, width << HSIZE, HSIZE_MASK);
> > +               mtk_dpi_mask(dpi, DPI_SIZE, height << VSIZE, VSIZE_MASK);
> > +       }
> >  }
> >
> >  static void mtk_dpi_config_channel_limit(struct mtk_dpi *dpi,
> > @@ -332,12 +369,21 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
> >                 break;
> >         }
> >
> > -       mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_MASK);
> > +       if (dpi->conf->is_dpintf)
> > +               mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << DPINTF_CH_SWAP,
> > +                            DPINTF_CH_SWAP_MASK);
> > +       else
> > +               mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> > +                            CH_SWAP_MASK);
> >  }
> >
> >  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
> >  {
> > -       mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
> > +       if (dpi->conf->is_dpintf)
> > +               mtk_dpi_mask(dpi, DPI_CON, enable ? DPINTF_YUV422_EN : 0,
> > +                            DPINTF_YUV422_EN);
> > +       else
> > +               mtk_dpi_mask(dpi, DPI_CON, enable ? YUV422_EN : 0, YUV422_EN);
> >  }
> >
> >  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
> > @@ -367,19 +413,25 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> >         if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_444) ||
> >             (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> >                 mtk_dpi_config_yuv422_enable(dpi, false);
> > -               mtk_dpi_config_csc_enable(dpi, true);
> > -               mtk_dpi_config_swap_input(dpi, false);
> > +               if (!dpi->conf->is_dpintf) {
> > +                       mtk_dpi_config_csc_enable(dpi, true);
> 
> define dpi->conf->csc_support
> 
> > +                       mtk_dpi_config_swap_input(dpi, false);
> 
> define dpi->conf->swap_input_support

these two done as well.

> 
> > +               }
> >                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> >         } else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> >                    (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> >                 mtk_dpi_config_yuv422_enable(dpi, true);
> > -               mtk_dpi_config_csc_enable(dpi, true);
> > -               mtk_dpi_config_swap_input(dpi, true);
> > +               if (!dpi->conf->is_dpintf) {
> > +                       mtk_dpi_config_csc_enable(dpi, true);
> > +                       mtk_dpi_config_swap_input(dpi, true);
> > +               }
> >                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> >         } else {
> >                 mtk_dpi_config_yuv422_enable(dpi, false);
> > -               mtk_dpi_config_csc_enable(dpi, false);
> > -               mtk_dpi_config_swap_input(dpi, false);
> > +               if (!dpi->conf->is_dpintf) {
> > +                       mtk_dpi_config_csc_enable(dpi, false);
> > +                       mtk_dpi_config_swap_input(dpi, false);
> > +               }
> >                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> >         }
> >  }
> > @@ -410,6 +462,8 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
> >                 pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> >
> >         mtk_dpi_disable(dpi);
> > +       clk_disable_unprepare(dpi->hf_fdp_clk);
> > +       clk_disable_unprepare(dpi->hf_fmm_clk);
> >         clk_disable_unprepare(dpi->pixel_clk);
> >         clk_disable_unprepare(dpi->engine_clk);
> >  }
> > @@ -433,12 +487,28 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> >                 goto err_pixel;
> >         }
> >
> > +       ret = clk_prepare_enable(dpi->hf_fmm_clk);
> > +       if (ret) {
> > +               dev_err(dpi->dev, "Failed to enable hf_fmm clock: %d\n", ret);
> > +               goto err_hf_fmm;
> > +       }
> > +
> > +       ret = clk_prepare_enable(dpi->hf_fdp_clk);
> > +       if (ret) {
> > +               dev_err(dpi->dev, "Failed to enable hf_fdp clock: %d\n", ret);
> > +               goto err_hf_fdp;
> > +       }
> > +
> >         if (dpi->pinctrl && dpi->pins_dpi)
> >                 pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> >
> >         mtk_dpi_enable(dpi);
> >         return 0;
> >
> > +err_hf_fdp:
> > +       clk_disable_unprepare(dpi->hf_fmm_clk);
> > +err_hf_fmm:
> > +       clk_disable_unprepare(dpi->pixel_clk);
> >  err_pixel:
> >         clk_disable_unprepare(dpi->engine_clk);
> >  err_refcount:
> > @@ -472,22 +542,30 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >         pll_rate = clk_get_rate(dpi->tvd_clk);
> >
> >         vm.pixelclock = pll_rate / factor;
> > -       if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > -           (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> > +       if (dpi->conf->is_dpintf)
> > +               clk_set_rate(dpi->pixel_clk, vm.pixelclock / 4);
> > +       else if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > +                (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> >                 clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> >         else
> >                 clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> >
> > -
> >         vm.pixelclock = clk_get_rate(dpi->pixel_clk);
> >
> >         dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
> >                 pll_rate, vm.pixelclock);
> >
> > -       limit.c_bottom = 0x0010;
> > -       limit.c_top = 0x0FE0;
> > -       limit.y_bottom = 0x0010;
> > -       limit.y_top = 0x0FE0;
> > +       if (dpi->conf->is_dpintf) {
> > +               limit.c_bottom = 0x0000;
> > +               limit.c_top = 0xFFF;
> > +               limit.y_bottom = 0x0000;
> > +               limit.y_top = 0xFFF;
> > +       } else {
> > +               limit.c_bottom = 0x0010;
> > +               limit.c_top = 0x0FE0;
> > +               limit.y_bottom = 0x0010;
> > +               limit.y_top = 0x0FE0;
> > +       }
> >
> >         dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
> >         dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
> > @@ -495,9 +573,15 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >                             MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
> >         dpi_pol.vsync_pol = vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
> >                             MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_RISING;
> > -       hsync.sync_width = vm.hsync_len;
> > -       hsync.back_porch = vm.hback_porch;
> > -       hsync.front_porch = vm.hfront_porch;
> > +       if (dpi->conf->is_dpintf) {
> > +               hsync.sync_width = vm.hsync_len / 4;
> > +               hsync.back_porch = vm.hback_porch / 4;
> > +               hsync.front_porch = vm.hfront_porch / 4;
> > +       } else {
> > +               hsync.sync_width = vm.hsync_len;
> > +               hsync.back_porch = vm.hback_porch;
> > +               hsync.front_porch = vm.hfront_porch;
> > +       }
> >         hsync.shift_half_line = false;
> >         vsync_lodd.sync_width = vm.vsync_len;
> >         vsync_lodd.back_porch = vm.vback_porch;
> > @@ -539,11 +623,16 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >         mtk_dpi_config_channel_limit(dpi, &limit);
> >         mtk_dpi_config_bit_num(dpi, dpi->bit_num);
> >         mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> > -       mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> >         mtk_dpi_config_color_format(dpi, dpi->color_format);
> > -       mtk_dpi_config_2n_h_fre(dpi);
> > -       mtk_dpi_dual_edge(dpi);
> > -       mtk_dpi_config_disable_edge(dpi);
> > +       if (dpi->conf->is_dpintf) {
> > +               mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> > +                            DPINTF_INPUT_2P_EN);
> > +       } else {
> > +               mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> > +               mtk_dpi_config_2n_h_fre(dpi);
> > +               mtk_dpi_dual_edge(dpi);
> > +               mtk_dpi_config_disable_edge(dpi);
> > +       }
> >         mtk_dpi_sw_reset(dpi, false);
> >
> >         return 0;
> > @@ -687,6 +776,17 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
> >         .atomic_reset = drm_atomic_helper_bridge_reset,
> >  };
> >
> > +static const struct drm_bridge_funcs mtk_dpintf_bridge_funcs = {
> > +       .attach = mtk_dpi_bridge_attach,
> > +       .mode_set = mtk_dpi_bridge_mode_set,
> > +       .disable = mtk_dpi_bridge_disable,
> > +       .enable = mtk_dpi_bridge_enable,
> > +       .atomic_check = mtk_dpi_bridge_atomic_check,
> > +       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +       .atomic_reset = drm_atomic_helper_bridge_reset,
> > +};
> 
> I think mtk_dpintf_bridge_funcs is the same as mtk_dpi_bridge_func, so
> remove this and use mtk_dpi_bridge_func.

They weren't 100% identical as the output formats were missing. I looked
these up in the datasheet and recombined them.

> 
> > +
> >  void mtk_dpi_start(struct device *dev)
> >  {
> >         struct mtk_dpi *dpi = dev_get_drvdata(dev);
> > @@ -781,6 +881,16 @@ static unsigned int mt8183_calculate_factor(int clock)
> >                 return 2;
> >  }
> >
> > +static unsigned int mt8195_dpintf_calculate_factor(int clock)
> > +{
> > +       if (clock < 70000)
> > +               return 4;
> > +       else if (clock < 200000)
> > +               return 2;
> > +       else
> > +               return 1;
> > +}
> > +
> >  static const u32 mt8173_output_fmts[] = {
> >         MEDIA_BUS_FMT_RGB888_1X24,
> >  };
> > @@ -796,6 +906,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
> >         .max_clock_khz = 300000,
> >         .output_fmts = mt8173_output_fmts,
> >         .num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +       .is_dpintf = false,
> 
> Global variable is defualt zero, so remove this.

Done.

> 
> >  };
> >
> >  static const struct mtk_dpi_conf mt2701_conf = {
> > @@ -805,6 +916,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
> >         .max_clock_khz = 150000,
> >         .output_fmts = mt8173_output_fmts,
> >         .num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +       .is_dpintf = false,
> >  };
> >
> >  static const struct mtk_dpi_conf mt8183_conf = {
> > @@ -813,6 +925,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
> >         .max_clock_khz = 100000,
> >         .output_fmts = mt8183_output_fmts,
> >         .num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> > +       .is_dpintf = false,
> >  };
> >
> >  static const struct mtk_dpi_conf mt8192_conf = {
> > @@ -821,6 +934,12 @@ static const struct mtk_dpi_conf mt8192_conf = {
> >         .max_clock_khz = 150000,
> >         .output_fmts = mt8173_output_fmts,
> >         .num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > +       .is_dpintf = false,
> > +};
> > +
> > +static const struct mtk_dpi_conf mt8195_dpintf_conf = {
> > +       .cal_factor = mt8195_dpintf_calculate_factor,
> > +       .is_dpintf = true,
> >  };
> >
> >  static int mtk_dpi_probe(struct platform_device *pdev)
> > @@ -866,13 +985,16 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> >                 return ret;
> >         }
> >
> > -       dpi->engine_clk = devm_clk_get(dev, "engine");
> > -       if (IS_ERR(dpi->engine_clk)) {
> > -               ret = PTR_ERR(dpi->engine_clk);
> > -               if (ret != -EPROBE_DEFER)
> > -                       dev_err(dev, "Failed to get engine clock: %d\n", ret);
> > +       if (!dpi->conf->is_dpintf) {
> > +               dpi->engine_clk = devm_clk_get(dev, "engine");
> > +               if (IS_ERR(dpi->engine_clk)) {
> > +                       ret = PTR_ERR(dpi->engine_clk);
> > +                       if (ret != -EPROBE_DEFER)
> > +                               dev_err(dev, "Failed to get engine clock: %d\n",
> > +                                       ret);
> >
> > -               return ret;
> > +                       return ret;
> > +               }
> >         }
> >
> >         dpi->pixel_clk = devm_clk_get(dev, "pixel");
> > @@ -893,6 +1015,24 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> >                 return ret;
> >         }
> >
> > +       dpi->hf_fmm_clk = devm_clk_get_optional(dev, "hf_fmm");
> > +       if (IS_ERR(dpi->hf_fmm_clk)) {
> > +               ret = PTR_ERR(dpi->hf_fmm_clk);
> > +               if (ret != -EPROBE_DEFER)
> > +                       dev_err(dev, "Failed to get hf_fmm clock: %d\n", ret);
> > +
> > +               return ret;
> > +       }
> > +
> > +       dpi->hf_fdp_clk = devm_clk_get_optional(dev, "hf_fdp");
> > +       if (IS_ERR(dpi->hf_fdp_clk)) {
> > +               ret = PTR_ERR(dpi->hf_fdp_clk);
> > +               if (ret != -EPROBE_DEFER)
> > +                       dev_err(dev, "Failed to get hf_fdp clock: %d\n", ret);
> > +
> > +               return ret;
> > +       }
> 
> You does not send the device tree patch, so I found one in chromium
> gerrit [1]. Compare the clock of disp_dpi1 with dp_intf1, I think
> hf_fdp is likely the pixel clock and hf_fmm is likely the engine
> clock. Could you provide the information of the function of each
> clock?

Thank you. I checked with the original author and can now confirm that
they can be mapped to engine and pixel clock. I fixed that. Also the now
fdp_clk is the direct parent of the current pixel clock, so there was no
need for it. So basically it is now reduced to the clocks of the
original dpi driver again. That also means that I am removing the
separate binding document as there is no difference other than the name
of the block.

Thank you for your feedback Chun-Kuang.

Best,
Markus

> 
> [1] https://chromium.googlesource.com/chromiumos/third_party/kernel/+/refs/changes/99/2781499/219/arch/arm64/boot/dts/mediatek/mt8195.dtsi#3499
> 
> Regards,
> Chun-Kuang.
> 
> > +
> >         dpi->irq = platform_get_irq(pdev, 0);
> >         if (dpi->irq <= 0)
> >                 return -EINVAL;
> > @@ -906,7 +1046,10 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> >
> >         platform_set_drvdata(pdev, dpi);
> >
> > -       dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
> > +       if (dpi->conf->is_dpintf)
> > +               dpi->bridge.funcs = &mtk_dpintf_bridge_funcs;
> > +       else
> > +               dpi->bridge.funcs = &mtk_dpi_bridge_funcs;
> >         dpi->bridge.of_node = dev->of_node;
> >         dpi->bridge.type = DRM_MODE_CONNECTOR_DPI;
> >
> > @@ -945,6 +1088,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
> >         { .compatible = "mediatek,mt8192-dpi",
> >           .data = &mt8192_conf,
> >         },
> > +       { .compatible = "mediatek,mt8195-dpintf",
> > +         .data = &mt8195_dpintf_conf,
> > +       },
> >         { },
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > index 3a02fabe1662..72efe6ee2584 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> > @@ -40,10 +40,14 @@
> >  #define FAKE_DE_LEVEN                  BIT(21)
> >  #define FAKE_DE_RODD                   BIT(22)
> >  #define FAKE_DE_REVEN                  BIT(23)
> > +#define DPINTF_YUV422_EN               BIT(24)
> > +#define DPINTF_INPUT_2P_EN             BIT(29)
> >
> >  #define DPI_OUTPUT_SETTING     0x14
> >  #define CH_SWAP                                0
> > +#define DPINTF_CH_SWAP                 BIT(1)
> >  #define CH_SWAP_MASK                   (0x7 << 0)
> > +#define DPINTF_CH_SWAP_MASK            (0x7 << 1)
> >  #define SWAP_RGB                       0x00
> >  #define SWAP_GBR                       0x01
> >  #define SWAP_BRG                       0x02
> > @@ -80,8 +84,10 @@
> >  #define DPI_SIZE               0x18
> >  #define HSIZE                          0
> >  #define HSIZE_MASK                     (0x1FFF << 0)
> > +#define DPINTF_HSIZE_MASK              (0xFFFF << 0)
> >  #define VSIZE                          16
> >  #define VSIZE_MASK                     (0x1FFF << 16)
> > +#define DPINTF_VSIZE_MASK              (0xFFFF << 16)
> >
> >  #define DPI_DDR_SETTING                0x1C
> >  #define DDR_EN                         BIT(0)
> > @@ -93,24 +99,30 @@
> >  #define DPI_TGEN_HWIDTH                0x20
> >  #define HPW                            0
> >  #define HPW_MASK                       (0xFFF << 0)
> > +#define DPINTF_HPW_MASK                        (0xFFFF << 0)
> >
> >  #define DPI_TGEN_HPORCH                0x24
> >  #define HBP                            0
> >  #define HBP_MASK                       (0xFFF << 0)
> > +#define DPINTF_HBP_MASK                        (0xFFFF << 0)
> >  #define HFP                            16
> >  #define HFP_MASK                       (0xFFF << 16)
> > +#define DPINTF_HFP_MASK                        (0xFFFF << 16)
> >
> >  #define DPI_TGEN_VWIDTH                0x28
> >  #define DPI_TGEN_VPORCH                0x2C
> >
> >  #define VSYNC_WIDTH_SHIFT              0
> >  #define VSYNC_WIDTH_MASK               (0xFFF << 0)
> > +#define DPINTF_VSYNC_WIDTH_MASK                (0xFFFF << 0)
> >  #define VSYNC_HALF_LINE_SHIFT          16
> >  #define VSYNC_HALF_LINE_MASK           BIT(16)
> >  #define VSYNC_BACK_PORCH_SHIFT         0
> >  #define VSYNC_BACK_PORCH_MASK          (0xFFF << 0)
> > +#define DPINTF_VSYNC_BACK_PORCH_MASK   (0xFFFF << 0)
> >  #define VSYNC_FRONT_PORCH_SHIFT                16
> >  #define VSYNC_FRONT_PORCH_MASK         (0xFFF << 16)
> > +#define DPINTF_VSYNC_FRONT_PORCH_MASK  (0xFFFF << 16)
> >
> >  #define DPI_BG_HCNTL           0x30
> >  #define BG_RIGHT                       (0x1FFF << 0)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 99cbf44463e4..da9e059312a5 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -317,6 +317,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
> >         [MTK_DISP_UFOE] = "ufoe",
> >         [MTK_DSI] = "dsi",
> >         [MTK_DPI] = "dpi",
> > +       [MTK_DP_INTF] = "dp-intf",
> >         [MTK_DISP_PWM] = "pwm",
> >         [MTK_DISP_MUTEX] = "mutex",
> >         [MTK_DISP_OD] = "od",
> > @@ -339,6 +340,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> >         [DDP_COMPONENT_DITHER]  = { MTK_DISP_DITHER,    0, &ddp_dither },
> >         [DDP_COMPONENT_DPI0]    = { MTK_DPI,            0, &ddp_dpi },
> >         [DDP_COMPONENT_DPI1]    = { MTK_DPI,            1, &ddp_dpi },
> > +       [DDP_COMPONENT_DP_INTF0]= { MTK_DP_INTF,        0, &ddp_dpi },
> > +       [DDP_COMPONENT_DP_INTF1]= { MTK_DP_INTF,        1, &ddp_dpi },
> >         [DDP_COMPONENT_DSI0]    = { MTK_DSI,            0, &ddp_dsi },
> >         [DDP_COMPONENT_DSI1]    = { MTK_DSI,            1, &ddp_dsi },
> >         [DDP_COMPONENT_DSI2]    = { MTK_DSI,            2, &ddp_dsi },
> > @@ -476,6 +479,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
> >             type == MTK_DISP_COLOR ||
> >             type == MTK_DISP_GAMMA ||
> >             type == MTK_DPI ||
> > +           type == MTK_DP_INTF ||
> >             type == MTK_DSI ||
> >             type == MTK_DISP_OVL ||
> >             type == MTK_DISP_OVL_2L ||
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > index bb914d976cf5..ee9d853cfa1c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> > @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
> >         MTK_DISP_UFOE,
> >         MTK_DSI,
> >         MTK_DPI,
> > +       MTK_DP_INTF,
> >         MTK_DISP_PWM,
> >         MTK_DISP_MUTEX,
> >         MTK_DISP_OD,
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > index aec39724ebeb..1ff4e31c8634 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> > @@ -459,6 +459,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
> >           .data = (void *)MTK_DPI },
> >         { .compatible = "mediatek,mt8183-dpi",
> >           .data = (void *)MTK_DPI },
> > +       { .compatible = "mediatek,mt8195-dpintf",
> > +         .data = (void *)MTK_DP_INTF },
> >         { .compatible = "mediatek,mt2701-disp-mutex",
> >           .data = (void *)MTK_DISP_MUTEX },
> >         { .compatible = "mediatek,mt2712-disp-mutex",
> > @@ -569,7 +571,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
> >                     comp_type == MTK_DISP_OVL_2L ||
> >                     comp_type == MTK_DISP_RDMA ||
> >                     comp_type == MTK_DSI ||
> > -                   comp_type == MTK_DPI) {
> > +                   comp_type == MTK_DPI ||
> > +                   comp_type == MTK_DP_INTF) {
> >                         dev_info(dev, "Adding component match for %pOF\n",
> >                                  node);
> >                         drm_of_component_match_add(dev, &match, compare_of,
> > --
> > 2.33.0
> >
