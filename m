Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6770730B85
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 01:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC4110E0CD;
	Wed, 14 Jun 2023 23:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919E410E0CD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 23:27:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4A3160B73;
 Wed, 14 Jun 2023 23:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF22C433C8;
 Wed, 14 Jun 2023 23:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686785247;
 bh=AnIjgimwx2S1m0gzqmHATBFa/i6g3s8a4ydJ5r3x/Rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RRus5YFDCL9SBthaNPHPSJyQs1Frer+fvQ3o1R3eoz/7oAIuUi+3Vdgp/tiygFdXa
 bcpQW2ikqU6UZ5kLELUdUUayjm18KOFuIEQrcepca2H8AgcQx0irECzR9E8Gp9T7M/
 Pn+SNEG5AqdLiftHxqJLJp641dI2BZRefy0yVuVcB9O3IbaC2KYgrPTsFJnpx+KWJt
 5XFaEv8p+7e1DRUJ7VhN9L/e1uBxTplOQNt4w27tatzoGIFgFjIhEkO4Q1KCzlW5Sm
 d0LfkCvWDerWS8ktrAPLFfcWA+i5VfmPMzOmX2PY3L086hU9+wScUfkip7UlKw82F2
 JbZj08ELHrF8g==
Received: by mercury (Postfix, from userid 1000)
 id 57EE41060A05; Thu, 15 Jun 2023 01:27:24 +0200 (CEST)
Date: Thu, 15 Jun 2023 01:27:24 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 7/7] drm/panel: sitronix-st7789v: Check display ID
Message-ID: <20230614232724.yer2ikvfzmaiejrd@mercury.elektranox.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-8-miquel.raynal@bootlin.com>
 <20230610204525.GA1042549@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wqcgzxp4uzinylbl"
Content-Disposition: inline
In-Reply-To: <20230610204525.GA1042549@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wqcgzxp4uzinylbl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jun 10, 2023 at 10:45:25PM +0200, Sam Ravnborg wrote:
> Hi Miquel,
>=20
> On Fri, Jun 09, 2023 at 04:59:51PM +0200, Miquel Raynal wrote:
> > A very basic debugging rule when a device is connected for the first
> > time is to access a read-only register which contains known data in
> > order to ensure the communication protocol is properly working. This
> > driver lacked any read helper which is often a critical peace for
> > fastening bring-ups.
> >=20
> > Add a read helper and use it to verify the communication with the panel
> > is working as soon as possible in order to fail early if this is not the
> > case.
>=20
> The read helper seems like a log of general boiler plate code.
> I briefly looked into the use of regmap for the spi communication,
> but it did not look like it supported the bit9 stuff.
>=20
> I did not stare enough to add a reviewd by, but the approach is fine
> and it is good to detech issues early.

The st7789v datasheet describes a setup where SPI is connected
unidirectional (i.e. without MISO). In that case the ID check
will fail.

-- Sebastian

>=20
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 78 +++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/g=
pu/drm/panel/panel-sitronix-st7789v.c
> > index 7de192a3a8aa..fb21d52a7a63 100644
> > --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> > @@ -113,6 +113,9 @@
> >  			return val;		\
> >  	} while (0)
> > =20
> > +#define ST7789V_IDS { 0x85, 0x85, 0x52 }
> > +#define ST7789V_IDS_SIZE 3
> > +
> >  struct st7789v_panel_info {
> >  	const struct drm_display_mode *display_mode;
> >  	u16 width_mm;
> > @@ -165,6 +168,77 @@ static int st7789v_write_data(struct st7789v *ctx,=
 u8 cmd)
> >  	return st7789v_spi_write(ctx, ST7789V_DATA, cmd);
> >  }
> > =20
> > +static int st7789v_read_data(struct st7789v *ctx, u8 cmd, u8 *buf,
> > +			     unsigned int len)
> > +{
> > +	struct spi_transfer xfer[2] =3D { };
> > +	struct spi_message msg;
> > +	u16 txbuf =3D ((ST7789V_COMMAND & 1) << 8) | cmd;
> > +	u16 rxbuf[4] =3D {};
> > +	u8 bit9 =3D 0;
> > +	int ret, i;
> > +
> > +	switch (len) {
> > +	case 1:
> > +	case 3:
> > +	case 4:
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	spi_message_init(&msg);
> > +
> > +	xfer[0].tx_buf =3D &txbuf;
> > +	xfer[0].len =3D sizeof(txbuf);
> > +	spi_message_add_tail(&xfer[0], &msg);
> > +
> > +	xfer[1].rx_buf =3D rxbuf;
> > +	xfer[1].len =3D len * 2;
> > +	spi_message_add_tail(&xfer[1], &msg);
> > +
> > +	ret =3D spi_sync(ctx->spi, &msg);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i =3D 0; i < len; i++) {
> > +		buf[i] =3D rxbuf[i] >> i | (bit9 << (9 - i));
> > +		if (i)
> > +			bit9 =3D rxbuf[i] & GENMASK(i - 1, 0);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int st7789v_check_id(struct drm_panel *panel)
> > +{
> > +	const u8 st7789v_ids[ST7789V_IDS_SIZE] =3D ST7789V_IDS;
> > +	struct st7789v *ctx =3D panel_to_st7789v(panel);
> > +	bool invalid_ids =3D false;
> > +	int ret, i;
> > +	u8 ids[3];
> > +
> > +	ret =3D st7789v_read_data(ctx, MIPI_DCS_GET_DISPLAY_ID, ids, ST7789V_=
IDS_SIZE);
> > +	if (ret) {
> > +		dev_err(panel->dev, "Failed to read IDs\n");
> > +		return ret;
> > +	}
> > +
> > +	for (i =3D 0; i < ST7789V_IDS_SIZE; i++) {
> > +		if (ids[i] !=3D st7789v_ids[i]) {
> > +			invalid_ids =3D true;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (invalid_ids) {
> > +		dev_err(panel->dev, "Unrecognized panel IDs");
> > +		return -EIO;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct drm_display_mode default_mode =3D {
> >  	.clock =3D 7000,
> >  	.hdisplay =3D 240,
> > @@ -237,6 +311,10 @@ static int st7789v_prepare(struct drm_panel *panel)
> >  	gpiod_set_value(ctx->reset, 0);
> >  	msleep(120);
> > =20
> > +	ret =3D st7789v_check_id(panel);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_EXIT_SLEEP_MODE=
));
> > =20
> >  	/* We need to wait 120ms after a sleep out command */
> > --=20
> > 2.34.1

--wqcgzxp4uzinylbl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmSKTNsACgkQ2O7X88g7
+povkxAAjqfzwQSIeCS1XA4AzXKg72Xqtfg/G7cSamo0UHX0oeHKWe0CChKUgbgO
o9dvRoTRTCon5U8sKNIoqOeLtI4dkaTl3fdzirPpLaNggN8gZJ9KAhABboENZCDA
ACAqE18Vfe0YmAAVBiFUXvN03eWpMIr4yacafEDlUV6Emh6qwPzjh8huTym9RjQy
AFLoI+Or6efi7MoDW6DSOiDcuImUgqxLVwHGN1lexgkrFhxMfzEsdYkYTUUFyIe4
tVibibTm0gTi6o5Cy9+VD1mHgb2XEINRa2Ra3o6vK1HbdGhJ6MWgEGOSRbKNTTdl
8ScBiGwWC4y33hlb1ageAyJUdvkDFrZILlhjk0c+jdtGDzvlqIIAAjKNCuAZI9l+
oQ4NmN2slv78OetIgk5SADLY4P3z2vuZmdoKC778rNVDXxuPX3quOkHycN6akQzE
gV/tL5W6Mdfo4gbeHG0A4LuJtcSjV3+ETAYE3BRm9ULg0EK2o/U1a2YedN/4WWG0
xj769g1DJ7x6PRCPjHp0Pk2bFqwpwuoCwAFiBQYANnvTJbf68ToiF6SebHRkJvYm
oVsqZsGPVl7SQAIe/ldMwwI3O0PznIPTJxi34nTFZPEY/k+GJ+eZE59gooHrS+wg
jRN5/57OFpKpIFvmdurhHZSe9D7T8mCUzI9xEzYultADUc02fpo=
=hNAn
-----END PGP SIGNATURE-----

--wqcgzxp4uzinylbl--
