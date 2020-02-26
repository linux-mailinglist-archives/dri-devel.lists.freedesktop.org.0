Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B572C170A65
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 22:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5190C6E127;
	Wed, 26 Feb 2020 21:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 281F56E127
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 21:25:35 +0000 (UTC)
Received: from earth.universe (unknown [185.62.205.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B788C24653;
 Wed, 26 Feb 2020 21:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582752334;
 bh=BHlZW2LaeYN+uQPeYvwWRpZv7BtIX13qfY0vxuos7WE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dTtxJraoDswDSDhwLCo4VpZOI07ajEHcVqTgDCB6PKFjox8gPgah6JWenL1E09r9A
 PSeQY3JeB3INo7pUgOEMwXXhl6c7SvWHV72GenuTRhtdl7AAKKmVxvXv1Q67ivjGh8
 KqE3geevEDcdgm66/ekpnMBk/awhhOI2gq+hCSzs=
Received: by earth.universe (Postfix, from userid 1000)
 id 348423C0C83; Wed, 26 Feb 2020 22:25:32 +0100 (CET)
Date: Wed, 26 Feb 2020 22:25:32 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv2 05/56] drm/omap: dsi: use MIPI_DSI_FMT_* instead of
 OMAP_DSS_DSI_FMT_*
Message-ID: <20200226212532.yf7io4wn5q5fvdol@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-6-sebastian.reichel@collabora.com>
 <20200225135823.GD4764@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <20200225135823.GD4764@pendragon.ideasonboard.com>
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
Cc: kernel@collabora.com, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Merlijn Wajer <merlijn@wizzup.org>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1924603756=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1924603756==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d4dks7wygupy7ymw"
Content-Disposition: inline


--d4dks7wygupy7ymw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 25, 2020 at 03:58:23PM +0200, Laurent Pinchart wrote:
> Hi Sebastian,
>=20
> Thank you for the patch.
>=20
> On Tue, Feb 25, 2020 at 12:20:35AM +0100, Sebastian Reichel wrote:
> > This replaces OMAP specific enum for pixel format with
> > common implementation.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   |  2 +-
> >  drivers/gpu/drm/omapdrm/dss/dsi.c             | 49 +++++++------------
> >  drivers/gpu/drm/omapdrm/dss/omapdss.h         | 10 +---
> >  3 files changed, 20 insertions(+), 41 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/=
gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > index e7fe5d702337..e6ebfc35243e 100644
> > --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> > @@ -595,7 +595,7 @@ static int dsicm_power_on(struct panel_drv_data *dd=
ata)
> >  	int r;
> >  	struct omap_dss_dsi_config dsi_config =3D {
> >  		.mode =3D OMAP_DSS_DSI_CMD_MODE,
> > -		.pixel_format =3D OMAP_DSS_DSI_FMT_RGB888,
> > +		.pixel_format =3D MIPI_DSI_FMT_RGB888,
> >  		.vm =3D &ddata->vm,
> >  		.hs_clk_min =3D 150000000,
> >  		.hs_clk_max =3D 300000000,
> > diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdr=
m/dss/dsi.c
> > index 8c39823a8295..bb2548d091ef 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > @@ -34,6 +34,7 @@
> >  #include <linux/sys_soc.h>
> > =20
> >  #include <video/mipi_display.h>
> > +#include <drm/drm_mipi_dsi.h>
>=20
> Maybe sort those two headers alphabetically ?

Ack.

>=20
> > =20
> >  #include "omapdss.h"
> >  #include "dss.h"
> > @@ -410,7 +411,7 @@ struct dsi_data {
> > =20
> >  	struct dss_lcd_mgr_config mgr_config;
> >  	struct videomode vm;
> > -	enum omap_dss_dsi_pixel_format pix_fmt;
> > +	enum mipi_dsi_pixel_format pix_fmt;
> >  	enum omap_dss_dsi_mode mode;
> >  	struct omap_dss_dsi_videomode_timings vm_timings;
> > =20
> > @@ -514,22 +515,6 @@ static inline bool wait_for_bit_change(struct dsi_=
data *dsi,
> >  	return false;
> >  }
> > =20
> > -static u8 dsi_get_pixel_size(enum omap_dss_dsi_pixel_format fmt)
> > -{
> > -	switch (fmt) {
> > -	case OMAP_DSS_DSI_FMT_RGB888:
> > -	case OMAP_DSS_DSI_FMT_RGB666:
> > -		return 24;
> > -	case OMAP_DSS_DSI_FMT_RGB666_PACKED:
> > -		return 18;
> > -	case OMAP_DSS_DSI_FMT_RGB565:
> > -		return 16;
> > -	default:
> > -		BUG();
>=20
> Removing a BUG() is really nice :-) I suppose this never happened, or we
> would have heard of it. Still, is there a top-level location where we
> could validate the format (assuming it is still used at the end of this
> series) ? mipi_dsi_pixel_format_to_bpp() returns -EINVAL if the format
> is invalid, and we don't check for that through the code . It doesn't
> have to be handled in this patch, it can be done later in the series as
> you keep reworking the code.

The pixel format is a constant from the panel driver (first change
in this patch). In the encoder stage it originates from dsi_set_config(),
later from omap_dsi_host_attach(). I will add a check there.

> > -		return 0;
> > -	}
> > -}
> > -
> >  #ifdef DSI_PERF_MEASURE
> >  static void dsi_perf_mark_setup(struct dsi_data *dsi)
> >  {
> > @@ -3239,7 +3224,7 @@ static void dsi_config_vp_num_line_buffers(struct=
 dsi_data *dsi)
> >  	int num_line_buffers;
> > =20
> >  	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE) {
> > -		int bpp =3D dsi_get_pixel_size(dsi->pix_fmt);
> > +		int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
> >  		const struct videomode *vm =3D &dsi->vm;
> >  		/*
> >  		 * Don't use line buffers if width is greater than the video
> > @@ -3370,7 +3355,7 @@ static void dsi_config_cmd_mode_interleaving(stru=
ct dsi_data *dsi)
> >  	int tclk_trail, ths_exit, exiths_clk;
> >  	bool ddr_alwon;
> >  	const struct videomode *vm =3D &dsi->vm;
> > -	int bpp =3D dsi_get_pixel_size(dsi->pix_fmt);
> > +	int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
> >  	int ndl =3D dsi->num_lanes_used - 1;
> >  	int dsi_fclk_hsdiv =3D dsi->user_dsi_cinfo.mX[HSDIV_DSI] + 1;
> >  	int hsa_interleave_hs =3D 0, hsa_interleave_lp =3D 0;
> > @@ -3498,7 +3483,7 @@ static int dsi_proto_config(struct dsi_data *dsi)
> >  	dsi_set_lp_rx_timeout(dsi, 0x1fff, true, true);
> >  	dsi_set_hs_tx_timeout(dsi, 0x1fff, true, true);
> > =20
> > -	switch (dsi_get_pixel_size(dsi->pix_fmt)) {
> > +	switch (mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt)) {
> >  	case 16:
> >  		buswidth =3D 0;
> >  		break;
> > @@ -3619,7 +3604,7 @@ static void dsi_proto_timings(struct dsi_data *ds=
i)
> >  		int window_sync =3D dsi->vm_timings.window_sync;
> >  		bool hsync_end;
> >  		const struct videomode *vm =3D &dsi->vm;
> > -		int bpp =3D dsi_get_pixel_size(dsi->pix_fmt);
> > +		int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
> >  		int tl, t_he, width_bytes;
> > =20
> >  		hsync_end =3D dsi->vm_timings.trans_mode =3D=3D OMAP_DSS_DSI_PULSE_M=
ODE;
> > @@ -3726,7 +3711,7 @@ static int dsi_configure_pins(struct omap_dss_dev=
ice *dssdev,
> >  static int dsi_enable_video_output(struct omap_dss_device *dssdev, int=
 channel)
> >  {
> >  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> > -	int bpp =3D dsi_get_pixel_size(dsi->pix_fmt);
> > +	int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
> >  	u8 data_type;
> >  	u16 word_count;
> >  	int r;
> > @@ -3737,16 +3722,16 @@ static int dsi_enable_video_output(struct omap_=
dss_device *dssdev, int channel)
> > =20
> >  	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE) {
> >  		switch (dsi->pix_fmt) {
> > -		case OMAP_DSS_DSI_FMT_RGB888:
> > +		case MIPI_DSI_FMT_RGB888:
> >  			data_type =3D MIPI_DSI_PACKED_PIXEL_STREAM_24;
> >  			break;
> > -		case OMAP_DSS_DSI_FMT_RGB666:
> > +		case MIPI_DSI_FMT_RGB666:
> >  			data_type =3D MIPI_DSI_PIXEL_STREAM_3BYTE_18;
> >  			break;
> > -		case OMAP_DSS_DSI_FMT_RGB666_PACKED:
> > +		case MIPI_DSI_FMT_RGB666_PACKED:
> >  			data_type =3D MIPI_DSI_PACKED_PIXEL_STREAM_18;
> >  			break;
> > -		case OMAP_DSS_DSI_FMT_RGB565:
> > +		case MIPI_DSI_FMT_RGB565:
> >  			data_type =3D MIPI_DSI_PACKED_PIXEL_STREAM_16;
> >  			break;
> >  		default:
> > @@ -3824,7 +3809,7 @@ static void dsi_update_screen_dispc(struct dsi_da=
ta *dsi)
> > =20
> >  	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_VP);
> > =20
> > -	bytespp	=3D dsi_get_pixel_size(dsi->pix_fmt) / 8;
> > +	bytespp	=3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
> >  	bytespl =3D w * bytespp;
> >  	bytespf =3D bytespl * h;
> > =20
> > @@ -3954,7 +3939,7 @@ static int dsi_update(struct omap_dss_device *dss=
dev, int channel,
> > =20
> >  #ifdef DSI_PERF_MEASURE
> >  	dsi->update_bytes =3D dw * dh *
> > -		dsi_get_pixel_size(dsi->pix_fmt) / 8;
> > +		mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
> >  #endif
> >  	dsi_update_screen_dispc(dsi);
> > =20
> > @@ -4015,7 +4000,7 @@ static int dsi_display_init_dispc(struct dsi_data=
 *dsi)
> > =20
> >  	dsi->mgr_config.io_pad_mode =3D DSS_IO_PAD_MODE_BYPASS;
> >  	dsi->mgr_config.video_port_width =3D
> > -			dsi_get_pixel_size(dsi->pix_fmt);
> > +			mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
> >  	dsi->mgr_config.lcden_sig_polarity =3D 0;
> > =20
> >  	dss_mgr_set_lcd_config(&dsi->output, &dsi->mgr_config);
> > @@ -4353,7 +4338,7 @@ static bool dsi_cm_calc(struct dsi_data *dsi,
> >  	unsigned long pck, txbyteclk;
> > =20
> >  	clkin =3D clk_get_rate(dsi->pll.clkin);
> > -	bitspp =3D dsi_get_pixel_size(cfg->pixel_format);
> > +	bitspp =3D mipi_dsi_pixel_format_to_bpp(cfg->pixel_format);
> >  	ndl =3D dsi->num_lanes_used - 1;
> > =20
> >  	/*
> > @@ -4386,7 +4371,7 @@ static bool dsi_vm_calc_blanking(struct dsi_clk_c=
alc_ctx *ctx)
> >  {
> >  	struct dsi_data *dsi =3D ctx->dsi;
> >  	const struct omap_dss_dsi_config *cfg =3D ctx->config;
> > -	int bitspp =3D dsi_get_pixel_size(cfg->pixel_format);
> > +	int bitspp =3D mipi_dsi_pixel_format_to_bpp(cfg->pixel_format);
> >  	int ndl =3D dsi->num_lanes_used - 1;
> >  	unsigned long hsclk =3D ctx->dsi_cinfo.clkdco / 4;
> >  	unsigned long byteclk =3D hsclk / 4;
> > @@ -4653,7 +4638,7 @@ static bool dsi_vm_calc(struct dsi_data *dsi,
> >  	unsigned long pll_min;
> >  	unsigned long pll_max;
> >  	int ndl =3D dsi->num_lanes_used - 1;
> > -	int bitspp =3D dsi_get_pixel_size(cfg->pixel_format);
> > +	int bitspp =3D mipi_dsi_pixel_format_to_bpp(cfg->pixel_format);
> >  	unsigned long byteclk_min;
> > =20
> >  	clkin =3D clk_get_rate(dsi->pll.clkin);
> > diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/om=
apdrm/dss/omapdss.h
> > index b0424daaceed..53fea1cbbc2d 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
> > +++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/platform_data/omapdss.h>
> >  #include <uapi/drm/drm_mode.h>
>=20
> While at it, I would replace this with
>=20
> #include <drm/drm_mode.h>
>=20
> , add a blank line here, and keep the drm headers sorted alphabetically.

Ack

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks.

> >  #include <drm/drm_crtc.h>
> > +#include <drm/drm_mipi_dsi.h>
> > =20
> >  #define DISPC_IRQ_FRAMEDONE		(1 << 0)
> >  #define DISPC_IRQ_VSYNC			(1 << 1)
> > @@ -116,13 +117,6 @@ enum omap_dss_venc_type {
> >  	OMAP_DSS_VENC_TYPE_SVIDEO,
> >  };
> > =20
> > -enum omap_dss_dsi_pixel_format {
> > -	OMAP_DSS_DSI_FMT_RGB888,
> > -	OMAP_DSS_DSI_FMT_RGB666,
> > -	OMAP_DSS_DSI_FMT_RGB666_PACKED,
> > -	OMAP_DSS_DSI_FMT_RGB565,
> > -};
> > -
> >  enum omap_dss_dsi_mode {
> >  	OMAP_DSS_DSI_CMD_MODE =3D 0,
> >  	OMAP_DSS_DSI_VIDEO_MODE,
> > @@ -210,7 +204,7 @@ struct omap_dss_dsi_videomode_timings {
> > =20
> >  struct omap_dss_dsi_config {
> >  	enum omap_dss_dsi_mode mode;
> > -	enum omap_dss_dsi_pixel_format pixel_format;
> > +	enum mipi_dsi_pixel_format pixel_format;
> >  	const struct videomode *vm;
> > =20
> >  	unsigned long hs_clk_min, hs_clk_max;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--d4dks7wygupy7ymw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5W4kkACgkQ2O7X88g7
+pr1Cg//eHOK8nY+W0UzAk6o8i//SSOLj1QHGCb1QDwStohdukBC4UmFeTd3gOS2
JCtdbR3bVVlvJB56cMpXJNmCVBcwXryZmJzWGvfIGCKu2QoaSGclyZg4koX/vw3k
k4cVwjvG2xeTyZMYz2fvcWZHoCBdBQpdHtn9woCuGiCO1Xw0WnPMOOF3x33KFVuJ
Yj6DBXSYOwqJXBkYdaUsBXnkIh2u0myEyI4mx84xB3beNLaJatJwS4QaUKsWUb5A
gyW8pQqvcL/41kD/oE20ZmWcgDJK8I32Gy0/bSKXd1nUEcapu0eqgkEvx5dsanRk
KkJIiUU7qK57+itj2bM/o+hgduO+SFB/ui8SjslEYhdwPW8f0QZITv//foX/zUVF
Y4nNKU9DzMXmhTcGVuwSP7+zSB9aTpWXrMRKDz7jdIJoeLDxuw2iYwp+ld+wsB8O
q/StgluLaCprhqAzdWC4eOTX80nd69xnDIIQHI83Fe/yXYNnSyhZDiSQTgBykssH
8+8XXcOoJi4nMLL/efHnFbIbZ4iRdXUonIeTcPDL5yEhm0WHetcOBdrj4Vabjrdo
lcom7oVc0nvV2fMTtPyoAWqQPMoILVGEwJyG2o0zTgfA7K2rATQut5QutXmuuxAm
3c3TTpUEbkq3cFg9iqkk67Bf0Qbtf2v8uYd/y7E6HCTofGO9RAI=
=IYHq
-----END PGP SIGNATURE-----

--d4dks7wygupy7ymw--

--===============1924603756==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1924603756==--
