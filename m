Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D204534A9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 15:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4226EC4D;
	Tue, 16 Nov 2021 14:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934EC6EC4D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 14:51:17 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id DD2782B012AA;
 Tue, 16 Nov 2021 09:51:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 16 Nov 2021 09:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xlM4aUb8aXQAEaS22cWM6SjRrFN
 IW5n87NF/bxmg2Zs=; b=HHy5Zd6cgcalnSOpMreJcdk6p2gElrzpJT121+IBts/
 5b5L8yH0Msf+D+O5sui9IPNJwjTimZC8lmDLpiHX47COD8kJiiN/vJnA7uZ9ZwIB
 vOatcdI5z/EMqWGJteHoXghCNYGX1JGTFUx2cTwp6B/jx5QGipNDowb52w+c7tyl
 LbCCRfqIoyyGS+u4vOQL6toaopyDP3B1dHAhJrWeekPFhFdLUromzi7uloaKxPa8
 ahqYfa5Xo0z58y2bsfHPU/kad3WxgvlQwjmffqTluSGoBKdZ0WkToPCvEq8qZOfS
 q/1/BJlKeqCrm2qJw81GWxI2CyVXmDhXBlYEFW9g/mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xlM4aU
 b8aXQAEaS22cWM6SjRrFNIW5n87NF/bxmg2Zs=; b=a5iexjRSZi7qze3uE/u/xM
 RQPQaRYE7XqH9mAVVTXuWc+IeWt3/SLa+yeae66DcOdhhqC2NqoDPjJZ3CQfRomv
 Vz+m7ouCIN/sD2qH2pNmXAT+k3VW/0KCD/Wh5lvTIsDoVmFZvsS+GlrOmGm/8jS6
 H7QZ5J8iGPWvhZ6lwcLcKEoJ/F6ktV9UAcaOot0xkzVEgIayMAWfyHWa9WQ4FcE9
 K8ckLGE10ux81oMk9qbTCkd35ifMfXQJkw+lz9a2Atf5pqm5XSztEt7Q6ZxQ1skM
 wbrS6T6tT2vzE2njnwpov2efOAx0kea1XuyA4lzLX3Cgjxlc8DJZ/d7HXiFrQYrw
 ==
X-ME-Sender: <xms:YsWTYV5pSFI8S7D_dyleMv5jwrHR2I6Z_yjk3jRLiatKNPVEDdOKtQ>
 <xme:YsWTYS5tHQbXhAHVjIDmn0zho3VyioTOSb3_cUyobppjX6SMM0vImXdkD8NwWLZFz
 se8i9dWIr04rZZ9fwI>
X-ME-Received: <xmr:YsWTYccoZ4zrxfFNiOicZ4B32Kw5ooBwbARLkHQsDnksV87kboIuU5-nbEjtfpq1Yc-3BsOWFh4hMar4BmiPaqBRnP-yCKJ8OAqdFwB7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedvgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Y8WTYeKS5uRYaR2udX765qKRFwNnqM0zHWT_ATzWNsiNzkszSLwh_g>
 <xmx:Y8WTYZJavz5CXHkeFqtEGa1_Gx26YtHpwokpWWmbwyHy4pk3pWQN9w>
 <xmx:Y8WTYXxYVz4bv_Ylq_RmLgcHxX-LWHSs5UUE2zxxg6n52E-BRfBkhw>
 <xmx:Y8WTYTDfJ_iRlbIysZUm5R8dnvaCyvqYCvGJlF3s_zm98Z1YGXCqIaxsPXI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Nov 2021 09:51:14 -0500 (EST)
Date: Tue, 16 Nov 2021 15:51:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20211116145112.xyoxzfll6exysnvt@gilmour>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
 <20211115101129.lyxxmb6i7paaonwi@gilmour>
 <CABnWg9tNPGZSi1RLqF5+Qs1GHtynyVoOzAyw+i9mPRYEoByk8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fimmsncviu5g7jc6"
Content-Disposition: inline
In-Reply-To: <CABnWg9tNPGZSi1RLqF5+Qs1GHtynyVoOzAyw+i9mPRYEoByk8g@mail.gmail.com>
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


--fimmsncviu5g7jc6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 15, 2021 at 09:33:52AM -0500, Guillaume Ranquet wrote:
> Quoting Maxime Ripard (2021-11-15 11:11:29)
> > > The driver creates a child device for the phy. The child device will
> > > never exist without the parent being active. As they are sharing a
> > > register range, the parent passes a regmap pointer to the child so th=
at
> > > both can work with the same register range. The phy driver sets device
> > > data that is read by the parent to get the phy device that can be used
> > > to control the phy properties.
> >
> > If the PHY is in the same register space than the DP controller, why do
> > you need a separate PHY driver in the first place?
>
> This has been asked by Chun-Kuang Hu in a previous revision of the series:
>=20
> https://lore.kernel.org/linux-mediatek/CAAOTY_-+T-wRCH2yw2XSm=3DZbaBbqBQ4=
EqpU2P0TF90gAWQeRsg@mail.gmail.com/

It's a bit of a circular argument though :)

It's a separate phy driver because it needs to go through another
maintainer's tree, but it needs to go through another maintainer's tree
because it's a separate phy driver.

It doesn't explain why it needs to be a separate phy driver? Why can't
the phy setup be done directly in the DP driver, if it's essentially a
single device?

That being said, usually what those kind of questions mean is that
you're missing a comment or something in the commit log to provide that
context in the first place, so it would be great to add that context
here.

And it will avoid the situation we're now in where multiple reviewers
ask the same questions over and over again :)

> > > +static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +                                     struct drm_bridge_state *old_st=
ate)
> > > +{
> > > +     struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> > > +     struct drm_connector *conn;
> > > +     struct drm_connector_state *conn_state;
> > > +     struct drm_crtc *crtc;
> > > +     struct drm_crtc_state *crtc_state;
> > > +     int ret =3D 0;
> > > +     int i;
> > > +
> > > +     conn =3D drm_atomic_get_new_connector_for_encoder(old_state->ba=
se.state,
> > > +                                                     bridge->encoder=
);
> > > +     if (!conn) {
> > > +             drm_err(mtk_dp->drm_dev,
> > > +                     "Can't enable bridge as connector is missing\n"=
);
> > > +             return;
> > > +     }
> > > +
> > > +     memcpy(mtk_dp->connector_eld, conn->eld, MAX_ELD_BYTES);
> >
> > This should be protected by a mutex (just like any resource shared
> > between KMS and ALSA)
>
> Ok.

I forgot to ask (even though checkpatch does mention it iirc), but since
you have multiple mutex it would be nice to have a comment for each
mutex stating exactly what it protects, and against what.

It's hard otherwise to remember or figure out what the locks are here
for.

> > > +     ret =3D mtk_dp_dt_parse_pdata(mtk_dp, pdev);
> > > +     if (ret)
> > > +             return ret;
> >
> > pdata?
> >
> can you elaborate?

Sorry, yeah, pdata is usually the abbreviation used in linux for the
platform_data mechanism, but you're using the DT to retrieve your
resources (and platform_data usually don't involve any parsing), so the
name is odd.

> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/med=
iatek/mtk_dpi.c
> > > index 384074f69111b..e6e88e3cd811d 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
> > >       MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> > >  };
> > >
> > > +enum TVDPLL_CLK {
> > > +     TVDPLL_PLL =3D 0,
> > > +     TVDPLL_D2 =3D 2,
> > > +     TVDPLL_D4 =3D 4,
> > > +     TVDPLL_D8 =3D 8,
> > > +     TVDPLL_D16 =3D 16,
> > > +};
> > > +
> > >  struct mtk_dpi {
> > >       struct drm_encoder encoder;
> > >       struct drm_bridge bridge;
> > > @@ -71,8 +79,10 @@ struct mtk_dpi {
> > >       void __iomem *regs;
> > >       struct device *dev;
> > >       struct clk *engine_clk;
> > > +     struct clk *dpi_ck_cg;
> > >       struct clk *pixel_clk;
> > >       struct clk *tvd_clk;
> > > +     struct clk *pclk_src[5];
> > >       int irq;
> > >       struct drm_display_mode mode;
> > >       const struct mtk_dpi_conf *conf;
> > > @@ -135,6 +145,7 @@ struct mtk_dpi_conf {
> > >       u32 hvsize_mask;
> > >       u32 channel_swap_shift;
> > >       u32 yuv422_en_bit;
> > > +     u32 csc_enable_bit;
> > >       const struct mtk_dpi_yc_limit *limit;
> > >  };
> > >
> > > @@ -365,7 +376,7 @@ static void mtk_dpi_config_yuv422_enable(struct m=
tk_dpi *dpi, bool enable)
> > >
> > >  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enab=
le)
> > >  {
> > > -     mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0, CSC_ENABLE);
> > > +     mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit :=
 0, dpi->conf->csc_enable_bit);
> > >  }
> > >
> > >  static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enab=
le)
> > > @@ -384,22 +395,45 @@ static void mtk_dpi_config_disable_edge(struct =
mtk_dpi *dpi)
> > >               mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL=
_EN);
> > >  }
> > >
> > > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi_out=
_color_format format)
> > > +{
> > > +     u32 matrix_sel =3D 0;
> > > +
> > > +     switch (format) {
> > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > > +     case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > > +             if (dpi->mode.hdisplay <=3D 720)
> > > +                     matrix_sel =3D 0x2;
> > > +             break;
> > > +     default:
> > > +             break;
> > > +     }
> > > +     mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MA=
SK);
> > > +}
> > > +
> > >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> > >                                       enum mtk_dpi_out_color_format f=
ormat)
> > >  {
> > >       if ((format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_444) ||
> > >           (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> > >               mtk_dpi_config_yuv422_enable(dpi, false);
> > > -             if (dpi->conf->csc_support)
> > > +             if (dpi->conf->csc_support) {
> > >                       mtk_dpi_config_csc_enable(dpi, true);
> > > +                     mtk_dpi_matrix_sel(dpi, format);
> > > +             }
> > >               if (dpi->conf->swap_input_support)
> > >                       mtk_dpi_config_swap_input(dpi, false);
> > >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SW=
AP_BGR);
> > >       } else if ((format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> > >                  (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL))=
 {
> > >               mtk_dpi_config_yuv422_enable(dpi, true);
> > > -             if (dpi->conf->csc_support)
> > > +             if (dpi->conf->csc_support) {
> > >                       mtk_dpi_config_csc_enable(dpi, true);
> > > +                     mtk_dpi_matrix_sel(dpi, format);
> > > +             }
> > >               if (dpi->conf->swap_input_support)
> > >                       mtk_dpi_config_swap_input(dpi, true);
> > >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SW=
AP_RGB);
> > > @@ -441,6 +475,8 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
> > >       mtk_dpi_disable(dpi);
> > >       clk_disable_unprepare(dpi->pixel_clk);
> > >       clk_disable_unprepare(dpi->engine_clk);
> > > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > > +     clk_disable_unprepare(dpi->tvd_clk);
> > >  }
> > >
> > >  static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > > @@ -450,12 +486,24 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > >       if (++dpi->refcount !=3D 1)
> > >               return 0;
> > >
> > > +     ret =3D clk_prepare_enable(dpi->tvd_clk);
> > > +     if (ret) {
> > > +             dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret=
);
> > > +             goto err_pixel;
> > > +     }
> > > +
> > >       ret =3D clk_prepare_enable(dpi->engine_clk);
> > >       if (ret) {
> > >               dev_err(dpi->dev, "Failed to enable engine clock: %d\n"=
, ret);
> > >               goto err_refcount;
> > >       }
> > >
> > > +     ret =3D clk_prepare_enable(dpi->dpi_ck_cg);
> > > +     if (ret) {
> > > +             dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock: %d=
\n", ret);
> > > +             goto err_ck_cg;
> > > +     }
> > > +
> > >       ret =3D clk_prepare_enable(dpi->pixel_clk);
> > >       if (ret) {
> > >               dev_err(dpi->dev, "Failed to enable pixel clock: %d\n",=
 ret);
> > > @@ -465,10 +513,11 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > >       if (dpi->pinctrl && dpi->pins_dpi)
> > >               pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> > >
> > > -     mtk_dpi_enable(dpi);
> > >       return 0;
> > >
> > >  err_pixel:
> > > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > > +err_ck_cg:
> > >       clk_disable_unprepare(dpi->engine_clk);
> > >  err_refcount:
> > >       dpi->refcount--;
> > > @@ -500,9 +549,16 @@ static int mtk_dpi_set_display_mode(struct mtk_d=
pi *dpi,
> > >       pll_rate =3D clk_get_rate(dpi->tvd_clk);
> > >
> > >       vm.pixelclock =3D pll_rate / factor;
> > > -     if (dpi->conf->is_dpintf)
> > > -             clk_set_rate(dpi->pixel_clk, vm.pixelclock / 4);
> > > -     else if ((dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_LE) =
||
> > > +     if (dpi->conf->is_dpintf) {
> > > +             if (factor =3D=3D 1)
> > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]=
);
> > > +             else if (factor =3D=3D 2)
> > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[3]=
);
> > > +             else if (factor =3D=3D 4)
> > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[4]=
);
> > > +             else
> > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]=
);
> > > +     } else if ((dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_LE=
) ||
> > >                (dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_BE))
> > >               clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> > >       else
> > > @@ -581,6 +637,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dp=
i *dpi,
> > >       }
> > >       mtk_dpi_sw_reset(dpi, false);
> > >
> > > +     mtk_dpi_enable(dpi);
> > > +
> > >       return 0;
> > >  }
> > >
> > > @@ -623,7 +681,6 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_f=
mts(struct drm_bridge *bridge,
> > >       u32 *input_fmts;
> > >
> > >       *num_input_fmts =3D 0;
> > > -
> > >       input_fmts =3D kcalloc(1, sizeof(*input_fmts),
> > >                            GFP_KERNEL);
> > >       if (!input_fmts)
> > > @@ -649,7 +706,7 @@ static int mtk_dpi_bridge_atomic_check(struct drm=
_bridge *bridge,
> > >               if (dpi->conf->num_output_fmts)
> > >                       out_bus_format =3D dpi->conf->output_fmts[0];
> > >
> > > -     dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> > > +     dev_info(dpi->dev, "input format 0x%04x, output format 0x%04x\n=
",
> > >               bridge_state->input_bus_cfg.format,
> > >               bridge_state->output_bus_cfg.format);
> > >
> > > @@ -657,7 +714,10 @@ static int mtk_dpi_bridge_atomic_check(struct dr=
m_bridge *bridge,
> > >       dpi->bit_num =3D MTK_DPI_OUT_BIT_NUM_8BITS;
> > >       dpi->channel_swap =3D MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > >       dpi->yc_map =3D MTK_DPI_OUT_YC_MAP_RGB;
> > > -     dpi->color_format =3D MTK_DPI_COLOR_FORMAT_RGB;
> > > +     if (out_bus_format =3D=3D MEDIA_BUS_FMT_YUYV8_1X16)
> > > +             dpi->color_format =3D MTK_DPI_COLOR_FORMAT_YCBCR_422_FU=
LL;
> > > +     else
> > > +             dpi->color_format =3D MTK_DPI_COLOR_FORMAT_RGB;
> > >
> > >       return 0;
> > >  }
> > > @@ -835,6 +895,12 @@ static const u32 mt8183_output_fmts[] =3D {
> > >       MEDIA_BUS_FMT_RGB888_2X12_BE,
> > >  };
> > >
> > > +static const u32 mt8195_output_fmts[] =3D {
> > > +     MEDIA_BUS_FMT_RGB888_1X24,
> > > +     MEDIA_BUS_FMT_YUV8_1X24,
> > > +     MEDIA_BUS_FMT_YUYV8_1X16,
> > > +};
> > > +
> > >  static const struct mtk_dpi_yc_limit mtk_dpi_limit =3D {
> > >       .c_bottom =3D 0x0010,
> > >       .c_top =3D 0x0FE0,
> > > @@ -862,6 +928,7 @@ static const struct mtk_dpi_conf mt8173_conf =3D {
> > >       .hvsize_mask =3D HSIZE_MASK,
> > >       .channel_swap_shift =3D CH_SWAP,
> > >       .yuv422_en_bit =3D YUV422_EN,
> > > +     .csc_enable_bit =3D CSC_ENABLE,
> > >       .limit =3D &mtk_dpi_limit,
> > >  };
> > >
> > > @@ -879,6 +946,7 @@ static const struct mtk_dpi_conf mt2701_conf =3D {
> > >       .hvsize_mask =3D HSIZE_MASK,
> > >       .channel_swap_shift =3D CH_SWAP,
> > >       .yuv422_en_bit =3D YUV422_EN,
> > > +     .csc_enable_bit =3D CSC_ENABLE,
> > >       .limit =3D &mtk_dpi_limit,
> > >  };
> > >
> > > @@ -895,6 +963,7 @@ static const struct mtk_dpi_conf mt8183_conf =3D {
> > >       .hvsize_mask =3D HSIZE_MASK,
> > >       .channel_swap_shift =3D CH_SWAP,
> > >       .yuv422_en_bit =3D YUV422_EN,
> > > +     .csc_enable_bit =3D CSC_ENABLE,
> > >       .limit =3D &mtk_dpi_limit,
> > >  };
> > >
> > > @@ -911,18 +980,21 @@ static const struct mtk_dpi_conf mt8192_conf =
=3D {
> > >       .hvsize_mask =3D HSIZE_MASK,
> > >       .channel_swap_shift =3D CH_SWAP,
> > >       .yuv422_en_bit =3D YUV422_EN,
> > > +     .csc_enable_bit =3D CSC_ENABLE,
> > >       .limit =3D &mtk_dpi_limit,
> > >  };
> > >
> > >  static const struct mtk_dpi_conf mt8195_dpintf_conf =3D {
> > >       .cal_factor =3D mt8195_dpintf_calculate_factor,
> > > -     .output_fmts =3D mt8173_output_fmts,
> > > -     .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> > > +     .output_fmts =3D mt8195_output_fmts,
> > > +     .num_output_fmts =3D ARRAY_SIZE(mt8195_output_fmts),
> > >       .is_dpintf =3D true,
> > > +     .csc_support =3D true,
> > >       .dimension_mask =3D DPINTF_HPW_MASK,
> > >       .hvsize_mask =3D DPINTF_HSIZE_MASK,
> > >       .channel_swap_shift =3D DPINTF_CH_SWAP,
> > >       .yuv422_en_bit =3D DPINTF_YUV422_EN,
> > > +     .csc_enable_bit =3D DPINTF_CSC_ENABLE,
> > >       .limit =3D &mtk_dpintf_limit,
> > >  };
> > >
> > > @@ -979,6 +1051,16 @@ static int mtk_dpi_probe(struct platform_device=
 *pdev)
> > >               return ret;
> > >       }
> > >
> > > +     dpi->dpi_ck_cg =3D devm_clk_get(dev, "ck_cg");
> > > +     if (IS_ERR(dpi->dpi_ck_cg)) {
> > > +             ret =3D PTR_ERR(dpi->dpi_ck_cg);
> > > +             if (ret !=3D -EPROBE_DEFER)
> > > +                     dev_err(dev, "Failed to get dpi ck cg clock: %d=
\n",
> > > +                             ret);
> > > +
> > > +             return ret;
> > > +     }
> > > +
> > >       dpi->pixel_clk =3D devm_clk_get(dev, "pixel");
> > >       if (IS_ERR(dpi->pixel_clk)) {
> > >               ret =3D PTR_ERR(dpi->pixel_clk);
> > > @@ -997,6 +1079,11 @@ static int mtk_dpi_probe(struct platform_device=
 *pdev)
> > >               return ret;
> > >       }
> > >
> > > +     dpi->pclk_src[1] =3D devm_clk_get(dev, "TVDPLL_D2");
> > > +     dpi->pclk_src[2] =3D devm_clk_get(dev, "TVDPLL_D4");
> > > +     dpi->pclk_src[3] =3D devm_clk_get(dev, "TVDPLL_D8");
> > > +     dpi->pclk_src[4] =3D devm_clk_get(dev, "TVDPLL_D16");
> > > +
> > >       dpi->irq =3D platform_get_irq(pdev, 0);
> > >       if (dpi->irq <=3D 0)
> > >               return -EINVAL;
> >
> > All those changes look unrelated as well?
> >
> Do you mean all the changes in mtk_dpi.c ? They are in support of
> enabling the mt8195 dpintf driver... so, not sure they are unlreated?

I don't know that driver at all, so it's probably related if you say so
:)

The DPI interface seems to be a panel interface, so it's a bit weird to
me why you would need to change things in the panel interface while
claiming to support a DP output.

Especially since it looks like you have some support for CSC, and
support for additional output formats?

I guess the DPI interface feeds the DP that essentially acts as a RGB ->
DP bridge?

If so, then the part adding support for CSC and additional formats
should be split into a separate patch, and it should be mentioned in the
commit log

Maxime

--fimmsncviu5g7jc6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZPFYAAKCRDj7w1vZxhR
xQB/AQDQgt2u/gVokcRuKXLnZS17DZ6sp9lxqkEJFK3W/bAyIgEA//F9yqq1221L
hDH1maOxJFd0HEujgUoWmRtGNXCAkQk=
=RqTl
-----END PGP SIGNATURE-----

--fimmsncviu5g7jc6--
