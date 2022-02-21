Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28004BD4BF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 05:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE5410E5F1;
	Mon, 21 Feb 2022 04:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DCD10E5F2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 04:34:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35803B80E06
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 04:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B1EC340F8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 04:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645418088;
 bh=C/nB/E0piAZGYQQYp2cV4LFsLeiH3pqTgoIEL6E+3hQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rM23tV35JywzlZV+mU/o4lt0Dk6gDdp4TeZQ49qjHo6PDSuUOBoMGndz4BDvQ4vDT
 Ah5OsxbiZjqFQLeDC32Fxw6klGnQu5OLJuPnadnyZTEsSJDQuv9VUDhynJNt6JI4mY
 bkwlOntmhSYZ4W38T/zccFJwFwlKiij3mLuEnCCRrbHKZ1CDvQlArsXpWJDAWMPH5d
 RazWNlkzJ6wQcwurYsApx1puSjfuaCKQsQGEopturK8kQESx+k47Qbb/NlcFxCQCKb
 wGp3MSDt/Tb5i5D1WOmz3gFFN93b2lLL9fYyxFnlMQyDH5q978pqQSIf1+A5dtvW9r
 90eqcZzOzVNMA==
Received: by mail-ed1-f54.google.com with SMTP id h15so9774385edv.7
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 20:34:48 -0800 (PST)
X-Gm-Message-State: AOAM532Sl0BCQJHdMEIsR0AvoR0bMa46osT+q9xJD6I2oqD4AW6MhfTc
 qcT75WAr4kLh+zDxp4oxcobmA9C+t4+mK7y7Hw==
X-Google-Smtp-Source: ABdhPJx8oTS5v5LNdZ9qmsaBpdp7Ht+mdjtSUFNlrFS0s9Rwpt/Lr80iK0bS3pTKa24uc4xlEQl6LWXw16D6/vRCIM0=
X-Received: by 2002:aa7:c391:0:b0:410:83fb:abab with SMTP id
 k17-20020aa7c391000000b0041083fbababmr19652501edq.435.1645418086329; Sun, 20
 Feb 2022 20:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-14-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-14-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 12:34:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_89ka=ZC5U2V0+2awFmQp4efrxcy7K+XR0QfdNPC88o3g@mail.gmail.com>
Message-ID: <CAAOTY_89ka=ZC5U2V0+2awFmQp4efrxcy7K+XR0QfdNPC88o3g@mail.gmail.com>
Subject: Re: [PATCH v8 13/19] drm/mediatek: dpi: Add dpintf support
To: Guillaume Ranquet <granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-phy@lists.infradead.org, deller@gmx.de,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'.Hi, Guillaume:

Guillaume Ranquet <granquet@baylibre.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=88=
18=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:56=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
>
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>  - Some features/functional components are not available for dpintf
>    which are now excluded from code execution once is_dpintf is set
>  - dpintf can and needs to choose between different clockdividers based
>    on the clockspeed. This is done by choosing a different clock parent.
>  - There are two additional clocks that need to be managed. These are
>    only set for dpintf and will be set to NULL if not supplied. The
>    clk_* calls handle these as normal clocks then.
>  - Some register contents differ slightly between the two components. To
>    work around this I added register bits/masks with a DPINTF_ prefix
>    and use them where different.
>
> Based on a separate driver for dpintf created by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c          | 164 +++++++++++++++++---
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  38 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   8 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   5 +-
>  include/linux/soc/mediatek/mtk-mmsys.h      |   2 +
>  6 files changed, 198 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediate=
k/mtk_dpi.c
> index be99399faf1bb..c5639ada868f8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
>         MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
>  };
>
> +enum TVDPLL_CLK {
> +       TVDPLL_PLL =3D 0,
> +       TVDPLL_D2 =3D 2,
> +       TVDPLL_D4 =3D 4,
> +       TVDPLL_D8 =3D 8,
> +       TVDPLL_D16 =3D 16,
> +};
> +
>  struct mtk_dpi {
>         struct drm_encoder encoder;
>         struct drm_bridge bridge;
> @@ -71,8 +79,10 @@ struct mtk_dpi {
>         void __iomem *regs;
>         struct device *dev;
>         struct clk *engine_clk;
> +       struct clk *dpi_ck_cg;
>         struct clk *pixel_clk;
>         struct clk *tvd_clk;
> +       struct clk *pclk_src[5];
>         int irq;
>         struct drm_display_mode mode;
>         const struct mtk_dpi_conf *conf;
> @@ -126,6 +136,7 @@ struct mtk_dpi_conf {
>         const u32 *output_fmts;
>         u32 num_output_fmts;
>         bool is_ck_de_pol;
> +       bool is_dpintf;
>         bool swap_input_support;
>         // Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no =
shift)
>         u32 dimension_mask;
> @@ -384,6 +395,25 @@ static void mtk_dpi_config_disable_edge(struct mtk_d=
pi *dpi)
>                 mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_E=
N);
>  }
>
> +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi_out_col=
or_format format)
> +{
> +       u32 matrix_sel =3D 0;
> +
> +       switch (format) {
> +       case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> +       case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> +       case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> +       case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> +       case MTK_DPI_COLOR_FORMAT_XV_YCC:
> +               if (dpi->mode.hdisplay <=3D 720)
> +                       matrix_sel =3D 0x2;
> +               break;
> +       default:
> +               break;
> +       }
> +       mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK=
);
> +}
> +
>  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
>                                         enum mtk_dpi_out_color_format for=
mat)
>  {
> @@ -391,6 +421,7 @@ static void mtk_dpi_config_color_format(struct mtk_dp=
i *dpi,
>             (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
>                 mtk_dpi_config_yuv422_enable(dpi, false);
>                 mtk_dpi_config_csc_enable(dpi, true);
> +               mtk_dpi_matrix_sel(dpi, format);
>                 if (dpi->conf->swap_input_support)
>                         mtk_dpi_config_swap_input(dpi, false);
>                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP=
_BGR);
> @@ -398,6 +429,7 @@ static void mtk_dpi_config_color_format(struct mtk_dp=
i *dpi,
>                    (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
>                 mtk_dpi_config_yuv422_enable(dpi, true);
>                 mtk_dpi_config_csc_enable(dpi, true);
> +               mtk_dpi_matrix_sel(dpi, format);

Why add this? If this is necessary, separate this to an independent patch.

>                 if (dpi->conf->swap_input_support)
>                         mtk_dpi_config_swap_input(dpi, true);
>                 mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP=
_RGB);
> @@ -438,6 +470,8 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>         mtk_dpi_disable(dpi);
>         clk_disable_unprepare(dpi->pixel_clk);
>         clk_disable_unprepare(dpi->engine_clk);
> +       clk_disable_unprepare(dpi->dpi_ck_cg);
> +       clk_disable_unprepare(dpi->tvd_clk);
>  }
>
>  static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> @@ -447,12 +481,24 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>         if (++dpi->refcount !=3D 1)
>                 return 0;
>
> +       ret =3D clk_prepare_enable(dpi->tvd_clk);
> +       if (ret) {
> +               dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
> +               goto err_pixel;
> +       }
> +
>         ret =3D clk_prepare_enable(dpi->engine_clk);
>         if (ret) {
>                 dev_err(dpi->dev, "Failed to enable engine clock: %d\n", =
ret);
>                 goto err_refcount;
>         }
>
> +       ret =3D clk_prepare_enable(dpi->dpi_ck_cg);
> +       if (ret) {
> +               dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock: %d\n=
", ret);
> +               goto err_ck_cg;
> +       }
> +
>         ret =3D clk_prepare_enable(dpi->pixel_clk);
>         if (ret) {
>                 dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", r=
et);
> @@ -462,10 +508,11 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>         if (dpi->pinctrl && dpi->pins_dpi)
>                 pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
>
> -       mtk_dpi_enable(dpi);

Why remove this, If this is necessary, separate this to an independent patc=
h.

>         return 0;
>
>  err_pixel:
> +       clk_disable_unprepare(dpi->dpi_ck_cg);
> +err_ck_cg:
>         clk_disable_unprepare(dpi->engine_clk);
>  err_refcount:
>         dpi->refcount--;
> @@ -497,12 +544,21 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi =
*dpi,
>         pll_rate =3D clk_get_rate(dpi->tvd_clk);
>
>         vm.pixelclock =3D pll_rate / factor;
> -       if ((dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> -           (dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_BE))
> +       if (dpi->conf->is_dpintf) {
> +               if (factor =3D=3D 1)
> +                       clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
> +               else if (factor =3D=3D 2)
> +                       clk_set_parent(dpi->pixel_clk, dpi->pclk_src[3]);
> +               else if (factor =3D=3D 4)
> +                       clk_set_parent(dpi->pixel_clk, dpi->pclk_src[4]);
> +               else
> +                       clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
> +       } else if ((dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_LE) =
||
> +                (dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_BE)) {
>                 clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> -       else
> +       } else {
>                 clk_set_rate(dpi->pixel_clk, vm.pixelclock);
> -
> +       }
>
>         vm.pixelclock =3D clk_get_rate(dpi->pixel_clk);
>
> @@ -515,9 +571,15 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *=
dpi,
>                             MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_R=
ISING;
>         dpi_pol.vsync_pol =3D vm.flags & DISPLAY_FLAGS_VSYNC_HIGH ?
>                             MTK_DPI_POLARITY_FALLING : MTK_DPI_POLARITY_R=
ISING;
> -       hsync.sync_width =3D vm.hsync_len;
> -       hsync.back_porch =3D vm.hback_porch;
> -       hsync.front_porch =3D vm.hfront_porch;
> +       if (dpi->conf->is_dpintf) {

Use the name of this function instead of 'is_dpintf'.

> +               hsync.sync_width =3D vm.hsync_len / 4;
> +               hsync.back_porch =3D vm.hback_porch / 4;
> +               hsync.front_porch =3D vm.hfront_porch / 4;
> +       } else {
> +               hsync.sync_width =3D vm.hsync_len;
> +               hsync.back_porch =3D vm.hback_porch;
> +               hsync.front_porch =3D vm.hfront_porch;
> +       }
>         hsync.shift_half_line =3D false;
>         vsync_lodd.sync_width =3D vm.vsync_len;
>         vsync_lodd.back_porch =3D vm.vback_porch;
> @@ -559,13 +621,20 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi =
*dpi,
>         mtk_dpi_config_channel_limit(dpi);
>         mtk_dpi_config_bit_num(dpi, dpi->bit_num);
>         mtk_dpi_config_channel_swap(dpi, dpi->channel_swap);
> -       mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>         mtk_dpi_config_color_format(dpi, dpi->color_format);
> -       mtk_dpi_config_2n_h_fre(dpi);
> -       mtk_dpi_dual_edge(dpi);
> -       mtk_dpi_config_disable_edge(dpi);
> +       if (dpi->conf->is_dpintf) {

Use the name of this function instead of 'is_dpintf'.

> +               mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
> +                            DPINTF_INPUT_2P_EN);
> +       } else {
> +               mtk_dpi_config_yc_map(dpi, dpi->yc_map);
> +               mtk_dpi_config_2n_h_fre(dpi);
> +               mtk_dpi_dual_edge(dpi);
> +               mtk_dpi_config_disable_edge(dpi);
> +       }
>         mtk_dpi_sw_reset(dpi, false);
>
> +       mtk_dpi_enable(dpi);

Why add this? If this is necessary, separate this to an independent patch.

> +
>         return 0;
>  }
>
> @@ -608,7 +677,6 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(=
struct drm_bridge *bridge,
>         u32 *input_fmts;
>
>         *num_input_fmts =3D 0;
> -
>         input_fmts =3D kcalloc(1, sizeof(*input_fmts),
>                              GFP_KERNEL);
>         if (!input_fmts)
> @@ -634,15 +702,18 @@ static int mtk_dpi_bridge_atomic_check(struct drm_b=
ridge *bridge,
>                 if (dpi->conf->num_output_fmts)
>                         out_bus_format =3D dpi->conf->output_fmts[0];
>
> -       dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> -               bridge_state->input_bus_cfg.format,
> -               bridge_state->output_bus_cfg.format);
> +       dev_info(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> +                bridge_state->input_bus_cfg.format,
> +                bridge_state->output_bus_cfg.format);

Why change dbg to info? if this is necessary, separate this to an
independent patch.

>
>         dpi->output_fmt =3D out_bus_format;
>         dpi->bit_num =3D MTK_DPI_OUT_BIT_NUM_8BITS;
>         dpi->channel_swap =3D MTK_DPI_OUT_CHANNEL_SWAP_RGB;
>         dpi->yc_map =3D MTK_DPI_OUT_YC_MAP_RGB;
> -       dpi->color_format =3D MTK_DPI_COLOR_FORMAT_RGB;
> +       if (out_bus_format =3D=3D MEDIA_BUS_FMT_YUYV8_1X16)
> +               dpi->color_format =3D MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL=
;
> +       else
> +               dpi->color_format =3D MTK_DPI_COLOR_FORMAT_RGB;

Separate this to an independent patch.

>
>         return 0;
>  }
> @@ -687,7 +758,7 @@ mtk_dpi_bridge_mode_valid(struct drm_bridge *bridge,
>  {
>         struct mtk_dpi *dpi =3D bridge_to_dpi(bridge);
>
> -       if (mode->clock > dpi->conf->max_clock_khz)
> +       if (dpi->conf->max_clock_khz && mode->clock > dpi->conf->max_cloc=
k_khz)

Separate this to an independent patch.

>                 return MODE_CLOCK_HIGH;
>
>         return MODE_OK;
> @@ -801,6 +872,16 @@ static unsigned int mt8183_calculate_factor(int cloc=
k)
>                 return 2;
>  }
>
> +static unsigned int mt8195_dpintf_calculate_factor(int clock)
> +{
> +       if (clock < 70000)
> +               return 4;
> +       else if (clock < 200000)
> +               return 2;
> +       else
> +               return 1;
> +}
> +
>  static const u32 mt8173_output_fmts[] =3D {
>         MEDIA_BUS_FMT_RGB888_1X24,
>  };
> @@ -810,6 +891,12 @@ static const u32 mt8183_output_fmts[] =3D {
>         MEDIA_BUS_FMT_RGB888_2X12_BE,
>  };
>
> +static const u32 mt8195_output_fmts[] =3D {
> +       MEDIA_BUS_FMT_RGB888_1X24,
> +       MEDIA_BUS_FMT_YUV8_1X24,
> +       MEDIA_BUS_FMT_YUYV8_1X16,
> +};
> +
>  static const struct mtk_dpi_yc_limit mtk_dpi_limit =3D {
>         .c_bottom =3D 0x0010,
>         .c_top =3D 0x0FE0,
> @@ -817,6 +904,13 @@ static const struct mtk_dpi_yc_limit mtk_dpi_limit =
=3D {
>         .y_top =3D 0x0FE0,
>  };
>
> +static const struct mtk_dpi_yc_limit mtk_dpintf_limit =3D {
> +       .c_bottom =3D 0x0000,
> +       .c_top =3D 0xFFF,
> +       .y_bottom =3D 0x0000,
> +       .y_top =3D 0xFFF,
> +};
> +
>  static const struct mtk_dpi_conf mt8173_conf =3D {
>         .cal_factor =3D mt8173_calculate_factor,
>         .reg_h_fre_con =3D 0xe0,
> @@ -882,6 +976,19 @@ static const struct mtk_dpi_conf mt8192_conf =3D {
>         .limit =3D &mtk_dpi_limit,
>  };
>
> +static const struct mtk_dpi_conf mt8195_dpintf_conf =3D {
> +       .cal_factor =3D mt8195_dpintf_calculate_factor,
> +       .output_fmts =3D mt8195_output_fmts,
> +       .num_output_fmts =3D ARRAY_SIZE(mt8195_output_fmts),
> +       .is_dpintf =3D true,
> +       .dimension_mask =3D DPINTF_HPW_MASK,
> +       .hvsize_mask =3D DPINTF_HSIZE_MASK,
> +       .channel_swap_shift =3D DPINTF_CH_SWAP,
> +       .yuv422_en_bit =3D DPINTF_YUV422_EN,
> +       .csc_enable_bit =3D DPINTF_CSC_ENABLE,
> +       .limit =3D &mtk_dpintf_limit,
> +};
> +
>  static int mtk_dpi_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -929,7 +1036,18 @@ static int mtk_dpi_probe(struct platform_device *pd=
ev)
>         if (IS_ERR(dpi->engine_clk)) {
>                 ret =3D PTR_ERR(dpi->engine_clk);
>                 if (ret !=3D -EPROBE_DEFER)
> -                       dev_err(dev, "Failed to get engine clock: %d\n", =
ret);
> +                       dev_err(dev, "Failed to get engine clock: %d\n",
> +                               ret);

Why two line?

> +
> +               return ret;
> +       }
> +
> +       dpi->dpi_ck_cg =3D devm_clk_get_optional(dev, "ck_cg");

Not defined in binding document.

> +       if (IS_ERR(dpi->dpi_ck_cg)) {
> +               ret =3D PTR_ERR(dpi->dpi_ck_cg);
> +               if (ret !=3D -EPROBE_DEFER)
> +                       dev_err(dev, "Failed to get dpi ck cg clock: %d\n=
",
> +                               ret);
>
>                 return ret;
>         }
> @@ -952,6 +1070,11 @@ static int mtk_dpi_probe(struct platform_device *pd=
ev)
>                 return ret;
>         }
>
> +       dpi->pclk_src[1] =3D devm_clk_get(dev, "TVDPLL_D2");
> +       dpi->pclk_src[2] =3D devm_clk_get(dev, "TVDPLL_D4");
> +       dpi->pclk_src[3] =3D devm_clk_get(dev, "TVDPLL_D8");
> +       dpi->pclk_src[4] =3D devm_clk_get(dev, "TVDPLL_D16");

Not defined in binding document.

> +
>         dpi->irq =3D platform_get_irq(pdev, 0);
>         if (dpi->irq <=3D 0)
>                 return -EINVAL;
> @@ -1004,6 +1127,9 @@ static const struct of_device_id mtk_dpi_of_ids[] =
=3D {
>         { .compatible =3D "mediatek,mt8192-dpi",
>           .data =3D &mt8192_conf,
>         },
> +       { .compatible =3D "mediatek,mt8195-dpintf",
> +         .data =3D &mt8195_dpintf_conf,
> +       },
>         { },
>  };
>  MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/me=
diatek/mtk_dpi_regs.h
> index 3a02fabe16627..91b32dfffced2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
> @@ -40,10 +40,15 @@
>  #define FAKE_DE_LEVEN                  BIT(21)
>  #define FAKE_DE_RODD                   BIT(22)
>  #define FAKE_DE_REVEN                  BIT(23)
> +#define DPINTF_YUV422_EN               BIT(24)
> +#define DPINTF_CSC_ENABLE              BIT(26)
> +#define DPINTF_INPUT_2P_EN             BIT(29)
>
>  #define DPI_OUTPUT_SETTING     0x14
>  #define CH_SWAP                                0
> +#define DPINTF_CH_SWAP                 BIT(1)
>  #define CH_SWAP_MASK                   (0x7 << 0)
> +#define DPINTF_CH_SWAP_MASK            (0x7 << 1)
>  #define SWAP_RGB                       0x00
>  #define SWAP_GBR                       0x01
>  #define SWAP_BRG                       0x02
> @@ -80,8 +85,10 @@
>  #define DPI_SIZE               0x18
>  #define HSIZE                          0
>  #define HSIZE_MASK                     (0x1FFF << 0)
> +#define DPINTF_HSIZE_MASK              (0xFFFF << 0)
>  #define VSIZE                          16
>  #define VSIZE_MASK                     (0x1FFF << 16)
> +#define DPINTF_VSIZE_MASK              (0xFFFF << 16)
>
>  #define DPI_DDR_SETTING                0x1C
>  #define DDR_EN                         BIT(0)
> @@ -93,24 +100,30 @@
>  #define DPI_TGEN_HWIDTH                0x20
>  #define HPW                            0
>  #define HPW_MASK                       (0xFFF << 0)
> +#define DPINTF_HPW_MASK                        (0xFFFF << 0)
>
>  #define DPI_TGEN_HPORCH                0x24
>  #define HBP                            0
>  #define HBP_MASK                       (0xFFF << 0)
> +#define DPINTF_HBP_MASK                        (0xFFFF << 0)
>  #define HFP                            16
>  #define HFP_MASK                       (0xFFF << 16)
> +#define DPINTF_HFP_MASK                        (0xFFFF << 16)
>
>  #define DPI_TGEN_VWIDTH                0x28
>  #define DPI_TGEN_VPORCH                0x2C
>
>  #define VSYNC_WIDTH_SHIFT              0
>  #define VSYNC_WIDTH_MASK               (0xFFF << 0)
> +#define DPINTF_VSYNC_WIDTH_MASK                (0xFFFF << 0)
>  #define VSYNC_HALF_LINE_SHIFT          16
>  #define VSYNC_HALF_LINE_MASK           BIT(16)
>  #define VSYNC_BACK_PORCH_SHIFT         0
>  #define VSYNC_BACK_PORCH_MASK          (0xFFF << 0)
> +#define DPINTF_VSYNC_BACK_PORCH_MASK   (0xFFFF << 0)
>  #define VSYNC_FRONT_PORCH_SHIFT                16
>  #define VSYNC_FRONT_PORCH_MASK         (0xFFF << 16)
> +#define DPINTF_VSYNC_FRONT_PORCH_MASK  (0xFFFF << 16)
>
>  #define DPI_BG_HCNTL           0x30
>  #define BG_RIGHT                       (0x1FFF << 0)
> @@ -217,4 +230,29 @@
>
>  #define EDGE_SEL_EN                    BIT(5)
>  #define H_FRE_2N                       BIT(25)
> +
> +#define DPI_MATRIX_SET 0xB4
> +#define INT_MATRIX_SEL                 BIT(0)
> +#define INT_MATRIX_SEL_MASK            (0x1F << 0)
> +#define RGB_TO_JPEG                    0x00
> +#define RGB_TO_FULL709                 0x01
> +#define RGB_TO_BT601                   0x02
> +#define RGB_TO_BT709                   0x03
> +#define JPEG_TO_RGB                    0x04
> +#define FULL709_TO_RGB                 0x05
> +#define BT601_TO_RGB                   0x06
> +#define BT709_TO_RGB                   0x07
> +#define JPEG_TO_BT601                  0x08
> +#define JPEG_TO_BT709                  0x09
> +#define BT601_TO_JPEG                  0xA
> +#define BT709_TO_JPEG                  0xB
> +#define BT709_TO_BT601                 0xC
> +#define BT601_TO_BT709                 0xD
> +#define JPEG_TO_CERGB                  0x14
> +#define FULL709_TO_CERGB               0x15
> +#define BT601_TO_CERGB                 0x16
> +#define BT709_TO_CERGB                 0x17
> +#define RGB_TO_CERGB                   0x1C
> +#define MATRIX_BIT                     BIT(8)
> +#define EXT_MATRIX_EN                  BIT(12)
>  #endif /* __MTK_DPI_REGS_H */
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.c
> index b4b682bc19913..e8bd6fd4a63d8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -351,6 +351,11 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_=
COMP_TYPE_MAX] =3D {
>         [MTK_DISP_WDMA] =3D "wdma",
>         [MTK_DPI] =3D "dpi",
>         [MTK_DSI] =3D "dsi",
> +       [MTK_DP_INTF] =3D "dp-intf",
> +       [MTK_DISP_PWM] =3D "pwm",
> +       [MTK_DISP_MUTEX] =3D "mutex",
> +       [MTK_DISP_OD] =3D "od",
> +       [MTK_DISP_BLS] =3D "bls",

Remove modification which is not related to dpintf.


>  };
>
>  struct mtk_ddp_comp_match {
> @@ -369,6 +374,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matche=
s[DDP_COMPONENT_ID_MAX] =3D {
>         [DDP_COMPONENT_DITHER]          =3D { MTK_DISP_DITHER,    0, &ddp=
_dither },
>         [DDP_COMPONENT_DPI0]            =3D { MTK_DPI,            0, &ddp=
_dpi },
>         [DDP_COMPONENT_DPI1]            =3D { MTK_DPI,            1, &ddp=
_dpi },
> +       [DDP_COMPONENT_DP_INTF0]        =3D { MTK_DP_INTF,        0, &ddp=
_dpi },
> +       [DDP_COMPONENT_DP_INTF1]        =3D { MTK_DP_INTF,        1, &ddp=
_dpi },
>         [DDP_COMPONENT_DSI0]            =3D { MTK_DSI,            0, &ddp=
_dsi },
>         [DDP_COMPONENT_DSI1]            =3D { MTK_DSI,            1, &ddp=
_dsi },
>         [DDP_COMPONENT_DSI2]            =3D { MTK_DSI,            2, &ddp=
_dsi },
> @@ -513,6 +520,7 @@ int mtk_ddp_comp_init(struct device_node *node, struc=
t mtk_ddp_comp *comp,
>             type =3D=3D MTK_DISP_PWM ||
>             type =3D=3D MTK_DISP_RDMA ||
>             type =3D=3D MTK_DPI ||
> +           type =3D=3D MTK_DP_INTF ||
>             type =3D=3D MTK_DSI)
>                 return 0;
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/dr=
m/mediatek/mtk_drm_ddp_comp.h
> index 4c6a986623051..deda70df1d6d9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -34,6 +34,7 @@ enum mtk_ddp_comp_type {
>         MTK_DISP_UFOE,
>         MTK_DISP_WDMA,
>         MTK_DPI,
> +       MTK_DP_INTF,
>         MTK_DSI,
>         MTK_DDP_COMP_TYPE_MAX,
>  };
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 56ff8c57ef8fd..e00ab6410db74 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -511,6 +511,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[=
] =3D {
>           .data =3D (void *)MTK_DPI },
>         { .compatible =3D "mediatek,mt8183-dpi",
>           .data =3D (void *)MTK_DPI },
> +       { .compatible =3D "mediatek,mt8195-dpintf",
> +         .data =3D (void *)MTK_DP_INTF },
>         { .compatible =3D "mediatek,mt2701-dsi",
>           .data =3D (void *)MTK_DSI },
>         { .compatible =3D "mediatek,mt8173-dsi",
> @@ -611,7 +613,8 @@ static int mtk_drm_probe(struct platform_device *pdev=
)
>                     comp_type =3D=3D MTK_DISP_OVL_2L ||
>                     comp_type =3D=3D MTK_DISP_RDMA ||
>                     comp_type =3D=3D MTK_DPI ||
> -                   comp_type =3D=3D MTK_DSI) {
> +                   comp_type =3D=3D MTK_DPI ||
> +                   comp_type =3D=3D MTK_DP_INTF) {
>                         dev_info(dev, "Adding component match for %pOF\n"=
,
>                                  node);
>                         drm_of_component_match_add(dev, &match, compare_o=
f,
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/m=
ediatek/mtk-mmsys.h
> index 4bba275e235ac..56ed2fa5f59e8 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -19,6 +19,8 @@ enum mtk_ddp_comp_id {
>         DDP_COMPONENT_DITHER,
>         DDP_COMPONENT_DPI0,
>         DDP_COMPONENT_DPI1,
> +       DDP_COMPONENT_DP_INTF0,
> +       DDP_COMPONENT_DP_INTF1,
>         DDP_COMPONENT_DSI0,
>         DDP_COMPONENT_DSI1,
>         DDP_COMPONENT_DSI2,
> --
> 2.34.1
>
