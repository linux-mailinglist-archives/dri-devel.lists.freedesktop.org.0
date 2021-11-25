Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C5B45DC56
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 15:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C14D6E50E;
	Thu, 25 Nov 2021 14:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37A66E50E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 14:30:40 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id B47012B012EB;
 Thu, 25 Nov 2021 09:30:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 25 Nov 2021 09:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xXVXkcoB1ts8UKXmaw1CVhUs1SG
 zMy+O/Ez7Cp4aFaw=; b=TNl8WflVlvoLT2z75UmIm0nyVxNzlvsBy+N7R96StRZ
 3RFhCp1H9XQKKE1YjHsZ6v2chbffZQbBKz90idnFqz6lFwnzNn8Lc5olLBbG6yp5
 aapKh5nj56Oi8B/aRnOAT3s6mJKvgqhtpXpKY3IDB2B7s4pROyVips86nqvaJD4Q
 S0m5g5KL5Amd8/A6SzUb8/Au7pHDVihw5C1Pj6x7boZDkaevuL5nwIyijijGXzeg
 7f0W7RIhnz7e/JgtijKaDlMNQ8XioQM+2Pl763/RXh3VFTikkJuADMnIy4wTaC11
 L3QGwQ5szW0u70n/T2clcnFCUXRHZOKqJeAlH7p2/Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xXVXkc
 oB1ts8UKXmaw1CVhUs1SGzMy+O/Ez7Cp4aFaw=; b=NGIraiJWNkdB4PrEiSLEep
 M//jQtDl/tkdA9Rj+0TUBb2fqZVWmn+3EYGZdZ0vxJ/bZl71nRGcwKJ9SeO2xzsX
 YYBICvu4PaRKUZCOyNp4wcJMKPLmkPx9V9T+nNTkwsoz3N3FyS0Vset+4feOngEh
 Y+XgrqMyHubo2gpgDFjreZcNTp8eyQSCjMCafRkjyB5iGVrIahm6xfYUp15oOORG
 oZqgpdt0ExUredXNNrHaRKQ7KPWM9emseA+erNRuI+LuFn4KaSQyI2Bk5eOZIKr7
 90w/xl4YmhfUlbEdnvXNQAk1imJ4CfPK8THW9uj1Y0lv3M2As6G5xBPcomi7sg0A
 ==
X-ME-Sender: <xms:DJ6fYb3BqzRXsaQrmrXSOlsKfTyqQOSdks0lSAaDdrTUxsVOojg5Dw>
 <xme:DJ6fYaFnY4WNGCG4iiPdjlKI_BhtOxzqOtrpqmNnGDo15c9F6wqQvDe4jgCm9O2V9
 tY99nTCySkWXEiWwvo>
X-ME-Received: <xmr:DJ6fYb4dOjhoUKe9FDlUdPM45WmwjwqtK7RBmjxq3sGk4jH1xR09Z3Ms4m0LEKgFsNz7LEoWAgOjpTtBMpxkfnaUsBkvfpdqciE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedtgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DJ6fYQ3Kgpu92fo-MOjtl90s6703MVxnfx5425-eKKHs8IPgEEFa9g>
 <xmx:DJ6fYeF5d36hDjEz_RNbgAfFQAI-l6o9vRYivJohvmkSbsFd5T41NQ>
 <xmx:DJ6fYR-nsSqZV86QrBqvlol3suP9PsMnHx-RR0GGOAKBFsuUbRXtbQ>
 <xmx:Dp6fYVf0h9vE9wFNk-EuPcchl_lbdPSR9stheMDZGEtv4UQNeY5_Wv8JOtE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Nov 2021 09:30:35 -0500 (EST)
Date: Thu, 25 Nov 2021 15:30:34 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Guillaume Ranquet <granquet@baylibre.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20211125143034.tzikvlxxl6fdhsif@gilmour>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
 <20211115101129.lyxxmb6i7paaonwi@gilmour>
 <CABnWg9tNPGZSi1RLqF5+Qs1GHtynyVoOzAyw+i9mPRYEoByk8g@mail.gmail.com>
 <20211116145112.xyoxzfll6exysnvt@gilmour>
 <CABnWg9uhuchdWyBeTacR6Cy0A9OHziUi051BQ5wsZVU0ajYjyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iswx3khdnm3g532f"
Content-Disposition: inline
In-Reply-To: <CABnWg9uhuchdWyBeTacR6Cy0A9OHziUi051BQ5wsZVU0ajYjyA@mail.gmail.com>
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


--iswx3khdnm3g532f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 01:45:21PM +0000, Guillaume Ranquet wrote:
> Hi,
> Thanks for all your input, really appreciated.
>=20
> Quoting Maxime Ripard (2021-11-16 15:51:12)
> > Hi,
> >
> > On Mon, Nov 15, 2021 at 09:33:52AM -0500, Guillaume Ranquet wrote:
> > > Quoting Maxime Ripard (2021-11-15 11:11:29)
> > > > > The driver creates a child device for the phy. The child device w=
ill
> > > > > never exist without the parent being active. As they are sharing a
> > > > > register range, the parent passes a regmap pointer to the child s=
o that
> > > > > both can work with the same register range. The phy driver sets d=
evice
> > > > > data that is read by the parent to get the phy device that can be=
 used
> > > > > to control the phy properties.
> > > >
> > > > If the PHY is in the same register space than the DP controller, wh=
y do
> > > > you need a separate PHY driver in the first place?
> > >
> > > This has been asked by Chun-Kuang Hu in a previous revision of the se=
ries:
> > >
> > > https://lore.kernel.org/linux-mediatek/CAAOTY_-+T-wRCH2yw2XSm=3DZbaBb=
qBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com/
> >
> > It's a bit of a circular argument though :)
> >
> > It's a separate phy driver because it needs to go through another
> > maintainer's tree, but it needs to go through another maintainer's tree
> > because it's a separate phy driver.
> >
> > It doesn't explain why it needs to be a separate phy driver? Why can't
> > the phy setup be done directly in the DP driver, if it's essentially a
> > single device?
> >
> > That being said, usually what those kind of questions mean is that
> > you're missing a comment or something in the commit log to provide that
> > context in the first place, so it would be great to add that context
> > here.
> >
> > And it will avoid the situation we're now in where multiple reviewers
> > ask the same questions over and over again :)
> >
> At first I didn't understand your reply, then I realized I gave you
> the wrong link...
> my bad! I'm struggling a bit with mail reviews, but I'll get there eventu=
ally.
>=20
> The driver and phy were a single driver until v2 of this patch series
> and the phy setup
> was done directly in the driver (single driver, single C file).
> Here's the relevant link to the discussion between Chun-Kuang and Markus
>=20
> https://lore.kernel.org/linux-mediatek/CAAOTY__cJMqcAieEraJ2sz4gi0Zs-aiNX=
z38_x7dPQea6HvYEg@mail.gmail.com/#t
>=20
> I'll try to find a way to make it clearer for v7.

OK, it makes sense then :)

There's something weird though: the devices definitely look like they're
in a separate register range, yet you mention a regmap to handle the
shared register range. That range doesn't seem described anywhere in the
device tree though? What is it for?

> > > > > +static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridg=
e,
> > > > > +                                     struct drm_bridge_state *ol=
d_state)
> > > > > +{
> > > > > +     struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
> > > > > +     struct drm_connector *conn;
> > > > > +     struct drm_connector_state *conn_state;
> > > > > +     struct drm_crtc *crtc;
> > > > > +     struct drm_crtc_state *crtc_state;
> > > > > +     int ret =3D 0;
> > > > > +     int i;
> > > > > +
> > > > > +     conn =3D drm_atomic_get_new_connector_for_encoder(old_state=
->base.state,
> > > > > +                                                     bridge->enc=
oder);
> > > > > +     if (!conn) {
> > > > > +             drm_err(mtk_dp->drm_dev,
> > > > > +                     "Can't enable bridge as connector is missin=
g\n");
> > > > > +             return;
> > > > > +     }
> > > > > +
> > > > > +     memcpy(mtk_dp->connector_eld, conn->eld, MAX_ELD_BYTES);
> > > >
> > > > This should be protected by a mutex (just like any resource shared
> > > > between KMS and ALSA)
> > >
> > > Ok.
> >
> > I forgot to ask (even though checkpatch does mention it iirc), but since
> > you have multiple mutex it would be nice to have a comment for each
> > mutex stating exactly what it protects, and against what.
> >
> > It's hard otherwise to remember or figure out what the locks are here
> > for.
> >
> > > > > +     ret =3D mtk_dp_dt_parse_pdata(mtk_dp, pdev);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > >
> > > > pdata?
> > > >
> > > can you elaborate?
> >
> > Sorry, yeah, pdata is usually the abbreviation used in linux for the
> > platform_data mechanism, but you're using the DT to retrieve your
> > resources (and platform_data usually don't involve any parsing), so the
> > name is odd.
> >
> > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm=
/mediatek/mtk_dpi.c
> > > > > index 384074f69111b..e6e88e3cd811d 100644
> > > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
> > > > >       MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> > > > >  };
> > > > >
> > > > > +enum TVDPLL_CLK {
> > > > > +     TVDPLL_PLL =3D 0,
> > > > > +     TVDPLL_D2 =3D 2,
> > > > > +     TVDPLL_D4 =3D 4,
> > > > > +     TVDPLL_D8 =3D 8,
> > > > > +     TVDPLL_D16 =3D 16,
> > > > > +};
> > > > > +
> > > > >  struct mtk_dpi {
> > > > >       struct drm_encoder encoder;
> > > > >       struct drm_bridge bridge;
> > > > > @@ -71,8 +79,10 @@ struct mtk_dpi {
> > > > >       void __iomem *regs;
> > > > >       struct device *dev;
> > > > >       struct clk *engine_clk;
> > > > > +     struct clk *dpi_ck_cg;
> > > > >       struct clk *pixel_clk;
> > > > >       struct clk *tvd_clk;
> > > > > +     struct clk *pclk_src[5];
> > > > >       int irq;
> > > > >       struct drm_display_mode mode;
> > > > >       const struct mtk_dpi_conf *conf;
> > > > > @@ -135,6 +145,7 @@ struct mtk_dpi_conf {
> > > > >       u32 hvsize_mask;
> > > > >       u32 channel_swap_shift;
> > > > >       u32 yuv422_en_bit;
> > > > > +     u32 csc_enable_bit;
> > > > >       const struct mtk_dpi_yc_limit *limit;
> > > > >  };
> > > > >
> > > > > @@ -365,7 +376,7 @@ static void mtk_dpi_config_yuv422_enable(stru=
ct mtk_dpi *dpi, bool enable)
> > > > >
> > > > >  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool =
enable)
> > > > >  {
> > > > > -     mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0, CSC_ENA=
BLE);
> > > > > +     mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_b=
it : 0, dpi->conf->csc_enable_bit);
> > > > >  }
> > > > >
> > > > >  static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool =
enable)
> > > > > @@ -384,22 +395,45 @@ static void mtk_dpi_config_disable_edge(str=
uct mtk_dpi *dpi)
> > > > >               mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE=
_SEL_EN);
> > > > >  }
> > > > >
> > > > > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi=
_out_color_format format)
> > > > > +{
> > > > > +     u32 matrix_sel =3D 0;
> > > > > +
> > > > > +     switch (format) {
> > > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > > > > +     case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > > > > +             if (dpi->mode.hdisplay <=3D 720)
> > > > > +                     matrix_sel =3D 0x2;
> > > > > +             break;
> > > > > +     default:
> > > > > +             break;
> > > > > +     }
> > > > > +     mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SE=
L_MASK);
> > > > > +}
> > > > > +
> > > > >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> > > > >                                       enum mtk_dpi_out_color_form=
at format)
> > > > >  {
> > > > >       if ((format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_444) ||
> > > > >           (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> > > > >               mtk_dpi_config_yuv422_enable(dpi, false);
> > > > > -             if (dpi->conf->csc_support)
> > > > > +             if (dpi->conf->csc_support) {
> > > > >                       mtk_dpi_config_csc_enable(dpi, true);
> > > > > +                     mtk_dpi_matrix_sel(dpi, format);
> > > > > +             }
> > > > >               if (dpi->conf->swap_input_support)
> > > > >                       mtk_dpi_config_swap_input(dpi, false);
> > > > >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNE=
L_SWAP_BGR);
> > > > >       } else if ((format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> > > > >                  (format =3D=3D MTK_DPI_COLOR_FORMAT_YCBCR_422_FU=
LL)) {
> > > > >               mtk_dpi_config_yuv422_enable(dpi, true);
> > > > > -             if (dpi->conf->csc_support)
> > > > > +             if (dpi->conf->csc_support) {
> > > > >                       mtk_dpi_config_csc_enable(dpi, true);
> > > > > +                     mtk_dpi_matrix_sel(dpi, format);
> > > > > +             }
> > > > >               if (dpi->conf->swap_input_support)
> > > > >                       mtk_dpi_config_swap_input(dpi, true);
> > > > >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNE=
L_SWAP_RGB);
> > > > > @@ -441,6 +475,8 @@ static void mtk_dpi_power_off(struct mtk_dpi =
*dpi)
> > > > >       mtk_dpi_disable(dpi);
> > > > >       clk_disable_unprepare(dpi->pixel_clk);
> > > > >       clk_disable_unprepare(dpi->engine_clk);
> > > > > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > > > > +     clk_disable_unprepare(dpi->tvd_clk);
> > > > >  }
> > > > >
> > > > >  static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > > > > @@ -450,12 +486,24 @@ static int mtk_dpi_power_on(struct mtk_dpi =
*dpi)
> > > > >       if (++dpi->refcount !=3D 1)
> > > > >               return 0;
> > > > >
> > > > > +     ret =3D clk_prepare_enable(dpi->tvd_clk);
> > > > > +     if (ret) {
> > > > > +             dev_err(dpi->dev, "Failed to enable tvd pll: %d\n",=
 ret);
> > > > > +             goto err_pixel;
> > > > > +     }
> > > > > +
> > > > >       ret =3D clk_prepare_enable(dpi->engine_clk);
> > > > >       if (ret) {
> > > > >               dev_err(dpi->dev, "Failed to enable engine clock: %=
d\n", ret);
> > > > >               goto err_refcount;
> > > > >       }
> > > > >
> > > > > +     ret =3D clk_prepare_enable(dpi->dpi_ck_cg);
> > > > > +     if (ret) {
> > > > > +             dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock=
: %d\n", ret);
> > > > > +             goto err_ck_cg;
> > > > > +     }
> > > > > +
> > > > >       ret =3D clk_prepare_enable(dpi->pixel_clk);
> > > > >       if (ret) {
> > > > >               dev_err(dpi->dev, "Failed to enable pixel clock: %d=
\n", ret);
> > > > > @@ -465,10 +513,11 @@ static int mtk_dpi_power_on(struct mtk_dpi =
*dpi)
> > > > >       if (dpi->pinctrl && dpi->pins_dpi)
> > > > >               pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> > > > >
> > > > > -     mtk_dpi_enable(dpi);
> > > > >       return 0;
> > > > >
> > > > >  err_pixel:
> > > > > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > > > > +err_ck_cg:
> > > > >       clk_disable_unprepare(dpi->engine_clk);
> > > > >  err_refcount:
> > > > >       dpi->refcount--;
> > > > > @@ -500,9 +549,16 @@ static int mtk_dpi_set_display_mode(struct m=
tk_dpi *dpi,
> > > > >       pll_rate =3D clk_get_rate(dpi->tvd_clk);
> > > > >
> > > > >       vm.pixelclock =3D pll_rate / factor;
> > > > > -     if (dpi->conf->is_dpintf)
> > > > > -             clk_set_rate(dpi->pixel_clk, vm.pixelclock / 4);
> > > > > -     else if ((dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_=
LE) ||
> > > > > +     if (dpi->conf->is_dpintf) {
> > > > > +             if (factor =3D=3D 1)
> > > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_sr=
c[2]);
> > > > > +             else if (factor =3D=3D 2)
> > > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_sr=
c[3]);
> > > > > +             else if (factor =3D=3D 4)
> > > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_sr=
c[4]);
> > > > > +             else
> > > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_sr=
c[2]);
> > > > > +     } else if ((dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X1=
2_LE) ||
> > > > >                (dpi->output_fmt =3D=3D MEDIA_BUS_FMT_RGB888_2X12_=
BE))
> > > > >               clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> > > > >       else
> > > > > @@ -581,6 +637,8 @@ static int mtk_dpi_set_display_mode(struct mt=
k_dpi *dpi,
> > > > >       }
> > > > >       mtk_dpi_sw_reset(dpi, false);
> > > > >
> > > > > +     mtk_dpi_enable(dpi);
> > > > > +
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > @@ -623,7 +681,6 @@ static u32 *mtk_dpi_bridge_atomic_get_input_b=
us_fmts(struct drm_bridge *bridge,
> > > > >       u32 *input_fmts;
> > > > >
> > > > >       *num_input_fmts =3D 0;
> > > > > -
> > > > >       input_fmts =3D kcalloc(1, sizeof(*input_fmts),
> > > > >                            GFP_KERNEL);
> > > > >       if (!input_fmts)
> > > > > @@ -649,7 +706,7 @@ static int mtk_dpi_bridge_atomic_check(struct=
 drm_bridge *bridge,
> > > > >               if (dpi->conf->num_output_fmts)
> > > > >                       out_bus_format =3D dpi->conf->output_fmts[0=
];
> > > > >
> > > > > -     dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04=
x\n",
> > > > > +     dev_info(dpi->dev, "input format 0x%04x, output format 0x%0=
4x\n",
> > > > >               bridge_state->input_bus_cfg.format,
> > > > >               bridge_state->output_bus_cfg.format);
> > > > >
> > > > > @@ -657,7 +714,10 @@ static int mtk_dpi_bridge_atomic_check(struc=
t drm_bridge *bridge,
> > > > >       dpi->bit_num =3D MTK_DPI_OUT_BIT_NUM_8BITS;
> > > > >       dpi->channel_swap =3D MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > > > >       dpi->yc_map =3D MTK_DPI_OUT_YC_MAP_RGB;
> > > > > -     dpi->color_format =3D MTK_DPI_COLOR_FORMAT_RGB;
> > > > > +     if (out_bus_format =3D=3D MEDIA_BUS_FMT_YUYV8_1X16)
> > > > > +             dpi->color_format =3D MTK_DPI_COLOR_FORMAT_YCBCR_42=
2_FULL;
> > > > > +     else
> > > > > +             dpi->color_format =3D MTK_DPI_COLOR_FORMAT_RGB;
> > > > >
> > > > >       return 0;
> > > > >  }
> > > > > @@ -835,6 +895,12 @@ static const u32 mt8183_output_fmts[] =3D {
> > > > >       MEDIA_BUS_FMT_RGB888_2X12_BE,
> > > > >  };
> > > > >
> > > > > +static const u32 mt8195_output_fmts[] =3D {
> > > > > +     MEDIA_BUS_FMT_RGB888_1X24,
> > > > > +     MEDIA_BUS_FMT_YUV8_1X24,
> > > > > +     MEDIA_BUS_FMT_YUYV8_1X16,
> > > > > +};
> > > > > +
> > > > >  static const struct mtk_dpi_yc_limit mtk_dpi_limit =3D {
> > > > >       .c_bottom =3D 0x0010,
> > > > >       .c_top =3D 0x0FE0,
> > > > > @@ -862,6 +928,7 @@ static const struct mtk_dpi_conf mt8173_conf =
=3D {
> > > > >       .hvsize_mask =3D HSIZE_MASK,
> > > > >       .channel_swap_shift =3D CH_SWAP,
> > > > >       .yuv422_en_bit =3D YUV422_EN,
> > > > > +     .csc_enable_bit =3D CSC_ENABLE,
> > > > >       .limit =3D &mtk_dpi_limit,
> > > > >  };
> > > > >
> > > > > @@ -879,6 +946,7 @@ static const struct mtk_dpi_conf mt2701_conf =
=3D {
> > > > >       .hvsize_mask =3D HSIZE_MASK,
> > > > >       .channel_swap_shift =3D CH_SWAP,
> > > > >       .yuv422_en_bit =3D YUV422_EN,
> > > > > +     .csc_enable_bit =3D CSC_ENABLE,
> > > > >       .limit =3D &mtk_dpi_limit,
> > > > >  };
> > > > >
> > > > > @@ -895,6 +963,7 @@ static const struct mtk_dpi_conf mt8183_conf =
=3D {
> > > > >       .hvsize_mask =3D HSIZE_MASK,
> > > > >       .channel_swap_shift =3D CH_SWAP,
> > > > >       .yuv422_en_bit =3D YUV422_EN,
> > > > > +     .csc_enable_bit =3D CSC_ENABLE,
> > > > >       .limit =3D &mtk_dpi_limit,
> > > > >  };
> > > > >
> > > > > @@ -911,18 +980,21 @@ static const struct mtk_dpi_conf mt8192_con=
f =3D {
> > > > >       .hvsize_mask =3D HSIZE_MASK,
> > > > >       .channel_swap_shift =3D CH_SWAP,
> > > > >       .yuv422_en_bit =3D YUV422_EN,
> > > > > +     .csc_enable_bit =3D CSC_ENABLE,
> > > > >       .limit =3D &mtk_dpi_limit,
> > > > >  };
> > > > >
> > > > >  static const struct mtk_dpi_conf mt8195_dpintf_conf =3D {
> > > > >       .cal_factor =3D mt8195_dpintf_calculate_factor,
> > > > > -     .output_fmts =3D mt8173_output_fmts,
> > > > > -     .num_output_fmts =3D ARRAY_SIZE(mt8173_output_fmts),
> > > > > +     .output_fmts =3D mt8195_output_fmts,
> > > > > +     .num_output_fmts =3D ARRAY_SIZE(mt8195_output_fmts),
> > > > >       .is_dpintf =3D true,
> > > > > +     .csc_support =3D true,
> > > > >       .dimension_mask =3D DPINTF_HPW_MASK,
> > > > >       .hvsize_mask =3D DPINTF_HSIZE_MASK,
> > > > >       .channel_swap_shift =3D DPINTF_CH_SWAP,
> > > > >       .yuv422_en_bit =3D DPINTF_YUV422_EN,
> > > > > +     .csc_enable_bit =3D DPINTF_CSC_ENABLE,
> > > > >       .limit =3D &mtk_dpintf_limit,
> > > > >  };
> > > > >
> > > > > @@ -979,6 +1051,16 @@ static int mtk_dpi_probe(struct platform_de=
vice *pdev)
> > > > >               return ret;
> > > > >       }
> > > > >
> > > > > +     dpi->dpi_ck_cg =3D devm_clk_get(dev, "ck_cg");
> > > > > +     if (IS_ERR(dpi->dpi_ck_cg)) {
> > > > > +             ret =3D PTR_ERR(dpi->dpi_ck_cg);
> > > > > +             if (ret !=3D -EPROBE_DEFER)
> > > > > +                     dev_err(dev, "Failed to get dpi ck cg clock=
: %d\n",
> > > > > +                             ret);
> > > > > +
> > > > > +             return ret;
> > > > > +     }
> > > > > +
> > > > >       dpi->pixel_clk =3D devm_clk_get(dev, "pixel");
> > > > >       if (IS_ERR(dpi->pixel_clk)) {
> > > > >               ret =3D PTR_ERR(dpi->pixel_clk);
> > > > > @@ -997,6 +1079,11 @@ static int mtk_dpi_probe(struct platform_de=
vice *pdev)
> > > > >               return ret;
> > > > >       }
> > > > >
> > > > > +     dpi->pclk_src[1] =3D devm_clk_get(dev, "TVDPLL_D2");
> > > > > +     dpi->pclk_src[2] =3D devm_clk_get(dev, "TVDPLL_D4");
> > > > > +     dpi->pclk_src[3] =3D devm_clk_get(dev, "TVDPLL_D8");
> > > > > +     dpi->pclk_src[4] =3D devm_clk_get(dev, "TVDPLL_D16");
> > > > > +
> > > > >       dpi->irq =3D platform_get_irq(pdev, 0);
> > > > >       if (dpi->irq <=3D 0)
> > > > >               return -EINVAL;
> > > >
> > > > All those changes look unrelated as well?
> > > >
> > > Do you mean all the changes in mtk_dpi.c ? They are in support of
> > > enabling the mt8195 dpintf driver... so, not sure they are unlreated?
> >
> > I don't know that driver at all, so it's probably related if you say so
> > :)
> >
> > The DPI interface seems to be a panel interface, so it's a bit weird to
> > me why you would need to change things in the panel interface while
> > claiming to support a DP output.
> >
> > Especially since it looks like you have some support for CSC, and
> > support for additional output formats?
> >
> > I guess the DPI interface feeds the DP that essentially acts as a RGB ->
> > DP bridge?
> >
> > If so, then the part adding support for CSC and additional formats
> > should be split into a separate patch, and it should be mentioned in the
> > commit log
> >
> > Maxime
>=20
> I see what you mean, I'll split the patches functionally...
> I'm discovering the gpu/drm tree, so It may take me a while to get it rig=
ht :D

It's not really yet another weird drm rule :)

Splitting your patches is valuable for a bunch of reasons that apply to
basically every tree:

  - It's easier to review (and maintainers like that). It's also easier
    to justify in a commit log, so it leads to a better history over the
    long term.

  - It's also easier to merge since you can merge smaller chunks when
    they are ready, even if the entire set is not. Smaller chunks also
    mean it's easier to apply (for the maintainer) and rebase (for you).

  - Finally, and possibly the strongest technical argument, it's much
    more helpful when you're bisecting. Taking the above patch as an
    example, let's assume you introduced a bug in some RGB panel with
    the colors being off due to the CSC changes. If you run git bisect,
    you'll end up with that big patch affecting multiple things and it
    would still be difficult to figure out what's wrong exactly. If it
    was split, you would end up only on the changeset that introduces
    the regression, which is very likely to be much easier to analyze.

Maxime

--iswx3khdnm3g532f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYZ+eCgAKCRDj7w1vZxhR
xcNEAP9XtbE7OmC06fyQkst7rnfT4CC7PQ9MuSjp7SRjXr1+2wD+PDmHgbk1Iwbr
rvI7gOCs8tjMZYus8paQF+sRLLxJgw0=
=TNmQ
-----END PGP SIGNATURE-----

--iswx3khdnm3g532f--
