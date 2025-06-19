Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 803F3AE06A1
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3DD10EA26;
	Thu, 19 Jun 2025 13:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QS7/ZF0F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEB510EA26
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 13:13:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2FC0F6115D;
 Thu, 19 Jun 2025 13:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE76C4CEEA;
 Thu, 19 Jun 2025 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750338816;
 bh=UMzhY25BszJqoveXpRkXCzB+xpQQW2Fo5hssNrjtYBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QS7/ZF0FGZ+b/BZ0wdHD3uQQHT+F90qViuAdtlUY3u+cNin+x7NvWbbkhRJRRXazD
 d2RxvjXI5XbMP0c61LaJuW/wA5TRVMX0zuPpJUfLyHxN5ORZzwH3lGCCpN+/Jlxrw5
 l8eLO2PvXbu4hCRtDsFs6j5w/iibJZPj8FymNGf7jwXOfUtnqiDjgpsBBZuc6i8oB/
 NstDhVN7WoL4n9eOOxiX2UOj+PfLCi8bRpKu0lIP+bPXo889kx8eLSHcgN2S+MlIAD
 GejAT48tX+sJN8wHnLcd25CBdrLSAlnl3AF1A0HSFH24Jy1s72de3WBBk1e20IcBH3
 yX/MzGsDOnm2Q==
Date: Thu, 19 Jun 2025 15:13:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
Message-ID: <20250619-wondrous-illegal-marten-a365a7@houat>
References: <20250526114353.12081-1-clamor95@gmail.com>
 <20250526114353.12081-3-clamor95@gmail.com>
 <20250619-nondescript-holistic-ostrich-6d1efc@houat>
 <CAPVz0n2rG+VJ5dwHmSxtzD5JtRy7p=g-gygKGUoSaECQCEkFfQ@mail.gmail.com>
 <20250619-slim-bright-warthog-77f8ed@houat>
 <CAPVz0n2eDciXnLOo_cEh8Hjy=hY1NW0DNRs8K5Y7d0Ey5JGbNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6lvcbtr46n2zuyjq"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2eDciXnLOo_cEh8Hjy=hY1NW0DNRs8K5Y7d0Ey5JGbNQ@mail.gmail.com>
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


--6lvcbtr46n2zuyjq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
MIME-Version: 1.0

On Thu, Jun 19, 2025 at 03:16:34PM +0300, Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 15=
:05 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thu, Jun 19, 2025 at 01:17:12PM +0300, Svyatoslav Ryhel wrote:
> > > =D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=
=BE 12:41 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Mon, May 26, 2025 at 02:43:53PM +0300, Svyatoslav Ryhel wrote:
> > > > > +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host *h=
ost,
> > > > > +                                      const struct mipi_dsi_msg =
*msg)
> > > > > +{
> > > > > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > > > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > > > +     u8 buf =3D *(u8 *)msg->tx_buf;
> > > > > +     u16 config;
> > > > > +     int ret;
> > > > > +
> > > > > +     if (!priv->enabled) {
> > > > > +             dev_err(priv->dev, "Bridge is not enabled\n");
> > > > > +             return -ENODEV;
> > > > > +     }
> > > >
> > > > Transfers can and should happen even when the bridge is disabled. T=
he
> > > > hardware might not permit that, but you'll need to elaborate in the
> > > > comment about why.
> > >
> > > This ensures that hw was configured properly in pre_enable and since
> > > pre_enable is void it will not return any errors if it fails.
> >
> > There's no relationship between the bridge pre_enable and enable hooks,
> > and the MIPI-DSI host transfer one. It's perfectly valid to call
> > transfer if the bridge is detached or disabled.
>
> That is twisted logic, but ok, fine, I don't care.

It's not twisted. It's perfectly valid for a panel to read its revision
at probe time, before it registers, for example.

It would happen before the panel is enabled, and before the bridge is
enabled.

> > > > > +     if (msg->rx_len) {
> > > > > +             dev_warn(priv->dev, "MIPI rx is not supported\n");
> > > > > +             return -EOPNOTSUPP;
> > > > > +     }
> > > > > +
> > > > > +     guard(mutex)(&priv->mlock);
> > > > > +
> > > > > +     ret =3D ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG, &=
config);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     switch (msg->type) {
> > > > > +     case MIPI_DSI_DCS_SHORT_WRITE:
> > > > > +     case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> > > > > +     case MIPI_DSI_DCS_LONG_WRITE:
> > > > > +             config |=3D SSD2825_CONF_REG_DCS;
> > > > > +             break;
> > > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> > > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> > > > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> > > > > +     case MIPI_DSI_GENERIC_LONG_WRITE:
> > > > > +             config &=3D ~SSD2825_CONF_REG_DCS;
> > > > > +             break;
> > > > > +     case MIPI_DSI_DCS_READ:
> > > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> > > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> > > > > +     case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> > > > > +     default:
> > > > > +             return 0;
> > > > > +     }
> > > > > +
> > > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, =
config);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     ret =3D ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000=
);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     ret =3D ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len);
> > > > > +     if (ret)
> > > > > +             return ret;
> > > > > +
> > > > > +     if (buf =3D=3D MIPI_DCS_SET_DISPLAY_ON) {
> > > > > +             /*
> > > > > +              * NOTE! This is here since it cannot be called in =
bridge enable because
> > > > > +              * bridge pre enable and bridge enable have no gap =
in between.
> > > > > +              *
> > > > > +              * Existing framework bridge-panel seq is:
> > > > > +              *      panel_prepare > bridge_pre_enable > bridge_=
enable > panel_enable
> > > > > +              *
> > > > > +              * Using prepare_prev_first was tested, but it swit=
ches seq like this:
> > > > > +              *      bridge_pre_enable > panel_prepare > bridge_=
enable > panel_enable
> > > > > +              *
> > > > > +              * This will not work since panel hw MUST be prepar=
ed before bridge is
> > > > > +              * configured. Correct seq should be:
> > > > > +              *      panel_prepare > bridge_pre_enable > panel_e=
nable > bridge_enable
> > > >
> > > > Where is that requirement coming from?
> > >
> > > This is how my device's (LG P895) bridge-panel combo works. Panel hw
> > > must be enabled before bridge, then bridge hw, then panel can send
> > > init sequence and then bridge must complete configuration.
> >
> > Do you have a documentation for that DSI device?
> >
>=20
> No
>=20
> > DSI devices typically come with requirement of the power states of the
> > lanes, that's what you want to discuss here. How we can model that in
> > software is a discussion we need to have once we've identified what the
> > hardware needs exactly.
> >
> > > > panel prepare is documented as:
> > > >
> > > >   The .prepare() function is typically called before the display co=
ntroller
> > > >   starts to transmit video data.
> > > >
> > > >
> > > > And video data transmission for bridges only happen at bridge_enable
> > > > time.
> > > >
> > > > So, from an API PoV, all the sequences above are correct.
> > >
> > > There is no way ATM for this bridge to complete configuration, there
> > > either should be a way to swap panel_enable and bridge_enable or there
> > > should be added an additional operation like bridge_post_enable or
> > > smth like that for cases like here when bridge has to complete
> > > configuration after panel init seq is sent.
> > >
> > > > > +              * Last two functions should be swapped related to =
existing framework.
> > > > > +              * I am not aware about method which allows that.
> > > > > +              *
> > > > > +              * Once there will be such method/flag, code below =
should be moved into
> > > > > +              * bridge_enable since it is basically a bridge con=
figuration completing
> > > > > +              * after initial panel DSI sequence is completed.
> > > > > +              */
> > > >
> > > > If there's anything to fix, we should do it before introducing that
> > > > driver.
> > >
> > > I just want to have a bridge my device uses to be supported by
> > > mainline linux. I have no intention to touch any part of DRM framework
> > > and cause instabilities, maintainers rage and hate.
> >
> > And I just want all drivers to behave consistently.
> >
>=20
> Ye, sure.
>=20
> > > > > +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *=
bridge,
> > > > > +                                          struct drm_atomic_stat=
e *state)
> > > > > +{
> > > > > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > > > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > > > +     const struct drm_crtc_state *crtc_state;
> > > > > +     const struct drm_display_mode *mode;
> > > > > +     struct drm_connector *connector;
> > > > > +     struct drm_crtc *crtc;
> > > > > +     u32 input_bus_flags =3D bridge->timings->input_bus_flags;
> > > > > +     u16 flags =3D 0, config;
> > > > > +     u8 pixel_format;
> > > > > +     int ret;
> > > > > +
> > > > > +     if (priv->enabled)
> > > > > +             return;
> > > >
> > > > What is this guarding against?
> > >
> > > blocks repeating ssd2825_bridge_atomic_pre_enable calls
> >
> > Which happens in which situation?
> >
> > > > > +     /* Power Sequence */
> > > > > +     ret =3D clk_prepare_enable(priv->tx_clk);
> > > > > +     if (ret)
> > > > > +             dev_err(priv->dev, "error enabling tx_clk (%d)\n", =
ret);
> > > > > +
> > > > > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies),=
 priv->supplies);
> > > > > +     if (ret)
> > > > > +             dev_err(priv->dev, "error enabling regulators (%d)\=
n", ret);
> > > > > +
> > > > > +     usleep_range(1000, 2000);
> > > > > +
> > > > > +     ssd2825_hw_reset(priv);
> > > > > +
> > > > > +     /* Perform SW reset */
> > > > > +     ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
> > > > > +
> > > > > +     /* Set pixel format */
> > > > > +     switch (dsi_dev->format) {
> > > > > +     case MIPI_DSI_FMT_RGB565:
> > > > > +             pixel_format =3D 0x00;
> > > > > +             break;
> > > > > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > > > > +             pixel_format =3D 0x01;
> > > > > +             break;
> > > > > +     case MIPI_DSI_FMT_RGB666:
> > > > > +             pixel_format =3D 0x02;
> > > > > +             break;
> > > > > +     case MIPI_DSI_FMT_RGB888:
> > > > > +     default:
> > > > > +             pixel_format =3D 0x03;
> > > > > +             break;
> > > > > +     }
> > > > > +
> > > > > +     connector =3D drm_atomic_get_new_connector_for_encoder(stat=
e, bridge->encoder);
> > > > > +     crtc =3D drm_atomic_get_new_connector_state(state, connecto=
r)->crtc;
> > > > > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > > > > +     mode =3D &crtc_state->adjusted_mode;
> > > > > +
> > > > > +     /* Set panel timings */
> > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> > > > > +                       ((mode->vtotal - mode->vsync_end) << 8) |
> > > > > +                       (mode->htotal - mode->hsync_end));
> > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> > > > > +                       ((mode->vtotal - mode->vsync_start) << 8)=
 |
> > > > > +                       (mode->htotal - mode->hsync_start));
> > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> > > > > +                       ((mode->vsync_start - mode->vdisplay) << =
8) |
> > > > > +                       (mode->hsync_start - mode->hdisplay));
> > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, m=
ode->hdisplay);
> > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, m=
ode->vdisplay);
> > > > > +
> > > > > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > > > +             flags |=3D SSD2825_HSYNC_HIGH;
> > > > > +
> > > > > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > > > +             flags |=3D SSD2825_VSYNC_HIGH;
> > > > > +
> > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > > > > +             flags |=3D SSD2825_NON_BURST_EV;
> > > > > +
> > > > > +     if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > > > > +             flags |=3D SSD2825_PCKL_HIGH;
> > > > > +
> > > > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6, f=
lags | pixel_format);
> > > > > +     ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi=
_dev->lanes - 1);
> > > > > +     ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> > > > > +
> > > > > +     /* Call PLL configuration */
> > > > > +     ssd2825_setup_pll(priv, mode);
> > > > > +
> > > > > +     usleep_range(10000, 11000);
> > > > > +
> > > > > +     config =3D SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | SSD=
2825_CONF_REG_DCS |
> > > > > +              SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> > > > > +
> > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
> > > > > +             config &=3D ~SSD2825_CONF_REG_HS;
> > > > > +
> > > > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> > > > > +             config &=3D ~SSD2825_CONF_REG_EOT;
> > > > > +
> > > > > +     /* Initial DSI configuration register set */
> > > > > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> > > > > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > > > > +
> > > > > +     priv->enabled =3D true;
> > > > > +}
> > > > > +
> > > > > +static void ssd2825_bridge_atomic_enable(struct drm_bridge *brid=
ge,
> > > > > +                                      struct drm_atomic_state *s=
tate)
> > > > > +{
> > > > > +     /* placeholder */
> > > > > +}
> > > >
> > > > That doesn't work with any bridge or panel that doesn't require any=
 DCS
> > > > command to power up, unfortunately.
> > >
> > > Yes that is a flaw unfortunately, if you have suggestions of fixing
> > > this just tell me.
> >
> > Untangle pre_enable and enable from transfer, and in enable actually
> > enable the bridge, and it will work just fine.
> >
>=20
> No it will not, I have tried and panel fails cause panel hw is init in
> pre-enable and init sequence is sent in enable, which is expected
> logic. Yet bridge cannot complete configuration because panel enable
> function is called AFTER bridge enable.

Then I guess we're at a dead-end now, aren't we?

Maxime

--6lvcbtr46n2zuyjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFQM/QAKCRAnX84Zoj2+
dmOMAYDBkQ/AU6SbVGx7j1UnMQ7uo36vlF+4cg19gHSUQBx2G2IJ45lY2jAQLzkp
OKthkYkBfA3bgAe7FiSi8R8ZJW4HJVXpU9t7Lf1ys7cSO8firSd6g35JM9JfTEBi
aH/Xm14Iyg==
=4a1r
-----END PGP SIGNATURE-----

--6lvcbtr46n2zuyjq--
