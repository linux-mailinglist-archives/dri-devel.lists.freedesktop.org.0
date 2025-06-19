Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8B2AE04F2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 14:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E09C10EA0B;
	Thu, 19 Jun 2025 12:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rmf8XDWw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553C510EA0B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 12:05:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E1ADB4AB33;
 Thu, 19 Jun 2025 12:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E41C4CEEA;
 Thu, 19 Jun 2025 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750334700;
 bh=73e9iIp7RI/pkRnv30XMHzyOXufY4G6WQj1t8OYXpx4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rmf8XDWwGh9g3X3gHWFEtI6PbEgEt08MyvSvx4duHbYer8ygOkZ8z5QCrSTe+zEEv
 QtGnK0S1mfq72dEAXy4/iCMECS7s5LXdtX74MP7VR+bRxVYJYFcREMXp6Dk8yOULdp
 Pqcjixwv6qGTZwDbLtCrIoD+Yq2hdDSpZ5rFXFM2ZXIUko4KVY3A6nAl3c3d4oLvkp
 c0Fw0Xk4xkLqH6WuCTG/fzPCto5FrWf03Yf9e2kzk4jHrNrDhK53Yp1if/IZ9EyMyS
 3d2sDPFvFRh4ePjpcD9/FWwon1wQgqcQFSH2S9XU9FCWReeREjDn0tnYXmBf5v+22G
 9T3JW/KG4fhbg==
Date: Thu, 19 Jun 2025 14:04:57 +0200
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
Message-ID: <20250619-slim-bright-warthog-77f8ed@houat>
References: <20250526114353.12081-1-clamor95@gmail.com>
 <20250526114353.12081-3-clamor95@gmail.com>
 <20250619-nondescript-holistic-ostrich-6d1efc@houat>
 <CAPVz0n2rG+VJ5dwHmSxtzD5JtRy7p=g-gygKGUoSaECQCEkFfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2firevhiw5liv6bp"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2rG+VJ5dwHmSxtzD5JtRy7p=g-gygKGUoSaECQCEkFfQ@mail.gmail.com>
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


--2firevhiw5liv6bp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/2] drm: bridge: Add support for Solomon SSD2825
 RGB/DSI bridge
MIME-Version: 1.0

On Thu, Jun 19, 2025 at 01:17:12PM +0300, Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 19 =D1=87=D0=B5=D1=80=D0=B2. 2025=E2=80=AF=D1=80. =D0=BE 12=
:41 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Mon, May 26, 2025 at 02:43:53PM +0300, Svyatoslav Ryhel wrote:
> > > +static ssize_t ssd2825_dsi_host_transfer(struct mipi_dsi_host *host,
> > > +                                      const struct mipi_dsi_msg *msg)
> > > +{
> > > +     struct ssd2825_priv *priv =3D dsi_host_to_ssd2825(host);
> > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > +     u8 buf =3D *(u8 *)msg->tx_buf;
> > > +     u16 config;
> > > +     int ret;
> > > +
> > > +     if (!priv->enabled) {
> > > +             dev_err(priv->dev, "Bridge is not enabled\n");
> > > +             return -ENODEV;
> > > +     }
> >
> > Transfers can and should happen even when the bridge is disabled. The
> > hardware might not permit that, but you'll need to elaborate in the
> > comment about why.
>
> This ensures that hw was configured properly in pre_enable and since
> pre_enable is void it will not return any errors if it fails.

There's no relationship between the bridge pre_enable and enable hooks,
and the MIPI-DSI host transfer one. It's perfectly valid to call
transfer if the bridge is detached or disabled.

> > > +     if (msg->rx_len) {
> > > +             dev_warn(priv->dev, "MIPI rx is not supported\n");
> > > +             return -EOPNOTSUPP;
> > > +     }
> > > +
> > > +     guard(mutex)(&priv->mlock);
> > > +
> > > +     ret =3D ssd2825_read_reg(priv, SSD2825_CONFIGURATION_REG, &conf=
ig);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     switch (msg->type) {
> > > +     case MIPI_DSI_DCS_SHORT_WRITE:
> > > +     case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
> > > +     case MIPI_DSI_DCS_LONG_WRITE:
> > > +             config |=3D SSD2825_CONF_REG_DCS;
> > > +             break;
> > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
> > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_1_PARAM:
> > > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> > > +     case MIPI_DSI_GENERIC_LONG_WRITE:
> > > +             config &=3D ~SSD2825_CONF_REG_DCS;
> > > +             break;
> > > +     case MIPI_DSI_DCS_READ:
> > > +     case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
> > > +     case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
> > > +     case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> > > +     default:
> > > +             return 0;
> > > +     }
> > > +
> > > +     ret =3D ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, conf=
ig);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret =3D ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0x0000);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     ret =3D ssd2825_write_dsi(priv, msg->tx_buf, msg->tx_len);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     if (buf =3D=3D MIPI_DCS_SET_DISPLAY_ON) {
> > > +             /*
> > > +              * NOTE! This is here since it cannot be called in brid=
ge enable because
> > > +              * bridge pre enable and bridge enable have no gap in b=
etween.
> > > +              *
> > > +              * Existing framework bridge-panel seq is:
> > > +              *      panel_prepare > bridge_pre_enable > bridge_enab=
le > panel_enable
> > > +              *
> > > +              * Using prepare_prev_first was tested, but it switches=
 seq like this:
> > > +              *      bridge_pre_enable > panel_prepare > bridge_enab=
le > panel_enable
> > > +              *
> > > +              * This will not work since panel hw MUST be prepared b=
efore bridge is
> > > +              * configured. Correct seq should be:
> > > +              *      panel_prepare > bridge_pre_enable > panel_enabl=
e > bridge_enable
> >
> > Where is that requirement coming from?
>
> This is how my device's (LG P895) bridge-panel combo works. Panel hw
> must be enabled before bridge, then bridge hw, then panel can send
> init sequence and then bridge must complete configuration.

Do you have a documentation for that DSI device?

DSI devices typically come with requirement of the power states of the
lanes, that's what you want to discuss here. How we can model that in
software is a discussion we need to have once we've identified what the
hardware needs exactly.

> > panel prepare is documented as:
> >
> >   The .prepare() function is typically called before the display contro=
ller
> >   starts to transmit video data.
> >
> >
> > And video data transmission for bridges only happen at bridge_enable
> > time.
> >
> > So, from an API PoV, all the sequences above are correct.
>
> There is no way ATM for this bridge to complete configuration, there
> either should be a way to swap panel_enable and bridge_enable or there
> should be added an additional operation like bridge_post_enable or
> smth like that for cases like here when bridge has to complete
> configuration after panel init seq is sent.
>=20
> > > +              * Last two functions should be swapped related to exis=
ting framework.
> > > +              * I am not aware about method which allows that.
> > > +              *
> > > +              * Once there will be such method/flag, code below shou=
ld be moved into
> > > +              * bridge_enable since it is basically a bridge configu=
ration completing
> > > +              * after initial panel DSI sequence is completed.
> > > +              */
> >
> > If there's anything to fix, we should do it before introducing that
> > driver.
>
> I just want to have a bridge my device uses to be supported by
> mainline linux. I have no intention to touch any part of DRM framework
> and cause instabilities, maintainers rage and hate.

And I just want all drivers to behave consistently.

> > > +static void ssd2825_bridge_atomic_pre_enable(struct drm_bridge *brid=
ge,
> > > +                                          struct drm_atomic_state *s=
tate)
> > > +{
> > > +     struct ssd2825_priv *priv =3D bridge_to_ssd2825(bridge);
> > > +     struct mipi_dsi_device *dsi_dev =3D priv->output.dev;
> > > +     const struct drm_crtc_state *crtc_state;
> > > +     const struct drm_display_mode *mode;
> > > +     struct drm_connector *connector;
> > > +     struct drm_crtc *crtc;
> > > +     u32 input_bus_flags =3D bridge->timings->input_bus_flags;
> > > +     u16 flags =3D 0, config;
> > > +     u8 pixel_format;
> > > +     int ret;
> > > +
> > > +     if (priv->enabled)
> > > +             return;
> >
> > What is this guarding against?
>
> blocks repeating ssd2825_bridge_atomic_pre_enable calls

Which happens in which situation?

> > > +     /* Power Sequence */
> > > +     ret =3D clk_prepare_enable(priv->tx_clk);
> > > +     if (ret)
> > > +             dev_err(priv->dev, "error enabling tx_clk (%d)\n", ret);
> > > +
> > > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ssd2825_supplies), pri=
v->supplies);
> > > +     if (ret)
> > > +             dev_err(priv->dev, "error enabling regulators (%d)\n", =
ret);
> > > +
> > > +     usleep_range(1000, 2000);
> > > +
> > > +     ssd2825_hw_reset(priv);
> > > +
> > > +     /* Perform SW reset */
> > > +     ssd2825_write_reg(priv, SSD2825_OPERATION_CTRL_REG, 0x0100);
> > > +
> > > +     /* Set pixel format */
> > > +     switch (dsi_dev->format) {
> > > +     case MIPI_DSI_FMT_RGB565:
> > > +             pixel_format =3D 0x00;
> > > +             break;
> > > +     case MIPI_DSI_FMT_RGB666_PACKED:
> > > +             pixel_format =3D 0x01;
> > > +             break;
> > > +     case MIPI_DSI_FMT_RGB666:
> > > +             pixel_format =3D 0x02;
> > > +             break;
> > > +     case MIPI_DSI_FMT_RGB888:
> > > +     default:
> > > +             pixel_format =3D 0x03;
> > > +             break;
> > > +     }
> > > +
> > > +     connector =3D drm_atomic_get_new_connector_for_encoder(state, b=
ridge->encoder);
> > > +     crtc =3D drm_atomic_get_new_connector_state(state, connector)->=
crtc;
> > > +     crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > > +     mode =3D &crtc_state->adjusted_mode;
> > > +
> > > +     /* Set panel timings */
> > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_1,
> > > +                       ((mode->vtotal - mode->vsync_end) << 8) |
> > > +                       (mode->htotal - mode->hsync_end));
> > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_2,
> > > +                       ((mode->vtotal - mode->vsync_start) << 8) |
> > > +                       (mode->htotal - mode->hsync_start));
> > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_3,
> > > +                       ((mode->vsync_start - mode->vdisplay) << 8) |
> > > +                       (mode->hsync_start - mode->hdisplay));
> > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_4, mode-=
>hdisplay);
> > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_5, mode-=
>vdisplay);
> > > +
> > > +     if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> > > +             flags |=3D SSD2825_HSYNC_HIGH;
> > > +
> > > +     if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> > > +             flags |=3D SSD2825_VSYNC_HIGH;
> > > +
> > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_VIDEO)
> > > +             flags |=3D SSD2825_NON_BURST_EV;
> > > +
> > > +     if (input_bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> > > +             flags |=3D SSD2825_PCKL_HIGH;
> > > +
> > > +     ssd2825_write_reg(priv, SSD2825_RGB_INTERFACE_CTRL_REG_6, flags=
 | pixel_format);
> > > +     ssd2825_write_reg(priv, SSD2825_LANE_CONFIGURATION_REG, dsi_dev=
->lanes - 1);
> > > +     ssd2825_write_reg(priv, SSD2825_TEST_REG, 0x0004);
> > > +
> > > +     /* Call PLL configuration */
> > > +     ssd2825_setup_pll(priv, mode);
> > > +
> > > +     usleep_range(10000, 11000);
> > > +
> > > +     config =3D SSD2825_CONF_REG_HS | SSD2825_CONF_REG_CKE | SSD2825=
_CONF_REG_DCS |
> > > +              SSD2825_CONF_REG_ECD | SSD2825_CONF_REG_EOT;
> > > +
> > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_LPM)
> > > +             config &=3D ~SSD2825_CONF_REG_HS;
> > > +
> > > +     if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> > > +             config &=3D ~SSD2825_CONF_REG_EOT;
> > > +
> > > +     /* Initial DSI configuration register set */
> > > +     ssd2825_write_reg(priv, SSD2825_CONFIGURATION_REG, config);
> > > +     ssd2825_write_reg(priv, SSD2825_VC_CTRL_REG, 0);
> > > +
> > > +     priv->enabled =3D true;
> > > +}
> > > +
> > > +static void ssd2825_bridge_atomic_enable(struct drm_bridge *bridge,
> > > +                                      struct drm_atomic_state *state)
> > > +{
> > > +     /* placeholder */
> > > +}
> >
> > That doesn't work with any bridge or panel that doesn't require any DCS
> > command to power up, unfortunately.
>
> Yes that is a flaw unfortunately, if you have suggestions of fixing
> this just tell me.

Untangle pre_enable and enable from transfer, and in enable actually
enable the bridge, and it will work just fine.

Maxime

--2firevhiw5liv6bp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFP85QAKCRAnX84Zoj2+
dsAtAXsHqXBRQgNYVy24zcMCJdFi2TBVVLNZXAQtEv3roSZDMVL5JG3KTaxnPVQy
/Vhn83YBfApGQPozQQwGW/s8BJ24RIVWYKllfKkF6gXcLMr1gOV1zFHIyaFLjXoQ
WxbT1L083A==
=nxv8
-----END PGP SIGNATURE-----

--2firevhiw5liv6bp--
