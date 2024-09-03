Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6196968B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09DB10E439;
	Tue,  3 Sep 2024 08:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nELPphkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC6510E439
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:09:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B5B5D5C5776;
 Tue,  3 Sep 2024 08:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C52C4CEC5;
 Tue,  3 Sep 2024 08:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725350948;
 bh=TbqJLpMF0XWfw9iBgitkWAPhHwKfcmKdJuvN+p4cqg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nELPphkKRLsS5HSNEQ5yWbd92Ozfba9oki8Y9Vry2iUrRdtIUXpiHE7lT6Nb4WQY0
 Galwr+I/rUVcJKYVgUM4/hjz7GkauaAHPodvUTFZQzglnIk3ykzZ7zQCQstK7C1Y6x
 rTIHZFODSgVUM+LolPAoWcAjpVgq3X7cksMRyx3xcvMWdwCKftcv9Ew3My4r0LbkyS
 fBHozh+TGAjCQKDu4/L1XcgRkTfub/BRj8buGxB/jHx9u5OQdNXw7ueQY54Aj/8Ni0
 HlGGgrZitu0YKXsHkb3SXwWhuW/NJ/V0CuZfrXz7oCrmhnZRl0DPdpJxcoMhFRXTU5
 kH60m5Fu0EUsQ==
Date: Tue, 3 Sep 2024 10:09:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v4 2/4] drm/bridge: synopsys: Add DW HDMI QP TX
 Controller support library
Message-ID: <20240903-archetypal-soft-wildebeest-b5ea68@houat>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <20240819-b4-rk3588-bridge-upstream-v4-2-6417c72a2749@collabora.com>
 <20240827-armored-magnificent-badger-ffb025@houat>
 <34422b7a-ce70-445d-a574-60ac36322119@collabora.com>
 <20240902-turtle-of-major-glory-efb4e8@houat>
 <6e20410a-a24d-4454-8577-2cff65319a2a@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="u6nfncdlj65oeoqx"
Content-Disposition: inline
In-Reply-To: <6e20410a-a24d-4454-8577-2cff65319a2a@collabora.com>
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


--u6nfncdlj65oeoqx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2024 at 12:12:02AM GMT, Cristian Ciocaltea wrote:
> On 9/2/24 10:36 AM, Maxime Ripard wrote:
> > On Sat, Aug 31, 2024 at 01:21:48AM GMT, Cristian Ciocaltea wrote:
> >> On 8/27/24 11:58 AM, Maxime Ripard wrote:
> >>> On Mon, Aug 19, 2024 at 01:29:29AM GMT, Cristian Ciocaltea wrote:
> >>>> +static irqreturn_t dw_hdmi_qp_main_hardirq(int irq, void *dev_id)
> >>>> +{
> >>>> +	struct dw_hdmi_qp *hdmi =3D dev_id;
> >>>> +	struct dw_hdmi_qp_i2c *i2c =3D hdmi->i2c;
> >>>> +	u32 stat;
> >>>> +
> >>>> +	stat =3D dw_hdmi_qp_read(hdmi, MAINUNIT_1_INT_STATUS);
> >>>> +
> >>>> +	i2c->stat =3D stat & (I2CM_OP_DONE_IRQ | I2CM_READ_REQUEST_IRQ |
> >>>> +			    I2CM_NACK_RCVD_IRQ);
> >>>> +
> >>>> +	if (i2c->stat) {
> >>>> +		dw_hdmi_qp_write(hdmi, i2c->stat, MAINUNIT_1_INT_CLEAR);
> >>>> +		complete(&i2c->cmp);
> >>>> +	}
> >>>> +
> >>>> +	if (stat)
> >>>> +		return IRQ_HANDLED;
> >>>> +
> >>>> +	return IRQ_NONE;
> >>>> +}
> >>>
> >>> If the scrambler is enabled, you need to deal with hotplug. On hotplu=
g,
> >>> the monitor will drop its TMDS ratio and scrambling status, but the
> >>> driver will keep assuming it's been programmed.
> >>>
> >>> If you don't have a way to deal with hotplug yet, then I'd suggest to
> >>> just drop the scrambler setup for now.
> >>
> >> Thanks for the heads up!
> >>
> >> HPD is partially handled by the RK platform driver, which makes use of
> >> drm_helper_hpd_irq_event(). Since the bridge sets DRM_BRIDGE_OP_DETECT
> >> flag, the dw_hdmi_qp_bridge_detect() callback gets executed, which in =
turn
> >> verifies the PHY status via ->read_hpd() implemented as
> >> dw_hdmi_qp_rk3588_read_hpd() in the platform driver.
> >=20
> > It's not only about hotplug detection, it's also about what happens
> > after you've detected a disconnection / reconnection.
> >=20
> > The framework expects to keep the current mode as is, despite the
> > monitor not being setup to use the scrambler anymore, and the display
> > remains black.
>=20
> AFAICS, the ->atomic_enable() callback is always invoked upon
> reconnection, hence the scrambler gets properly (re)enabled via
> dw_hdmi_qp_setup().

No, it's not.

> >> During my testing so far it worked reliably when switching displays wi=
th
> >> different capabilities.  I don't have a 4K@60Hz display at the moment,=
 but
> >> used the HDMI RX port on the Rock 5B board in a loopback connection to
> >> verify this mode, which triggered the high TMDS clock ratio and scramb=
ling
> >> setup as well.
> >=20
> > How did you test exactly?
>=20
> I initially tested with Sway/wlroots having an app running
> (eglgears_wayland) while unplugging/replugging the HDMI connectors in
> every possible sequence I could think of (e.g. several times per
> display, switching to a different one, repeating, switching again, etc).
>=20
> I've just retested the whole stuff with Weston and confirm it works as
> expected, i.e. no black screen (or bad capture stream for the 4K@60Hz
> case) after any of the reconnections.

Then I guess both sway and weston handle uevent and will change the
connector mode on reconnection.

It's not mandatory, and others will just not bother and still expect the
output to work.

I guess the easier you can test this with is modetest.

Maxime

--u6nfncdlj65oeoqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZtbEHAAKCRAnX84Zoj2+
dub0AYD0Bik1Z1shXpdUCtIQQK7qy/5wlAsZL3p3sO9HNoDd5B/N9090NF138Duw
JWODhtABgJVad/VI2n0akz4qsN+7f3oCFehQNCxGLwAVW4o6i+6mdm0zoZl5IBuz
Wwu/9lx0cw==
=RMT3
-----END PGP SIGNATURE-----

--u6nfncdlj65oeoqx--
