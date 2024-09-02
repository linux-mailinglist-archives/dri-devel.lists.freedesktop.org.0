Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1239680C0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282FD10E224;
	Mon,  2 Sep 2024 07:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ms99ThQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448DA10E227
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 07:36:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 19263A417AA;
 Mon,  2 Sep 2024 07:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B646C4CEC2;
 Mon,  2 Sep 2024 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725262612;
 bh=THObozqjtraO221EbGm1VZ5bqgAUOHDBtFWxw964ETo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ms99ThQwnMZoRjOgfAnyWEE52KNTc1+M+c76I0B1LSKuZ2Bc0SFidbfQ62CWjSVDa
 kr74Hmgs6y/Nmr3IjQAEBHXIM2marZv51TpvILNCTOh83efOlZKtr/v0GP/uC5OQe3
 HtYCbEFCb2lO4L3lx+iRdnp4XHf08fAl+tT4rMQHE0G5zR/yseSbUlvTlcQYu8k5/e
 zmk1aOOenjiGeSBPLn5K/riC7naV4nOF/tzXzbo2WPcs3TTO1zqW6AWYU1GzZwPYjE
 acUM3+4hbm/W1lvXur9m68O7n2NLIrdoXW7bV/sLdjbPq2NYtIloEq1OSopc0TQ4UT
 8rMQD0ddYX2jg==
Date: Mon, 2 Sep 2024 09:36:50 +0200
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
Message-ID: <20240902-turtle-of-major-glory-efb4e8@houat>
References: <20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com>
 <20240819-b4-rk3588-bridge-upstream-v4-2-6417c72a2749@collabora.com>
 <20240827-armored-magnificent-badger-ffb025@houat>
 <34422b7a-ce70-445d-a574-60ac36322119@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wrzxqzphrlcany36"
Content-Disposition: inline
In-Reply-To: <34422b7a-ce70-445d-a574-60ac36322119@collabora.com>
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


--wrzxqzphrlcany36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 31, 2024 at 01:21:48AM GMT, Cristian Ciocaltea wrote:
> On 8/27/24 11:58 AM, Maxime Ripard wrote:
> > On Mon, Aug 19, 2024 at 01:29:29AM GMT, Cristian Ciocaltea wrote:
> >> +static irqreturn_t dw_hdmi_qp_main_hardirq(int irq, void *dev_id)
> >> +{
> >> +	struct dw_hdmi_qp *hdmi =3D dev_id;
> >> +	struct dw_hdmi_qp_i2c *i2c =3D hdmi->i2c;
> >> +	u32 stat;
> >> +
> >> +	stat =3D dw_hdmi_qp_read(hdmi, MAINUNIT_1_INT_STATUS);
> >> +
> >> +	i2c->stat =3D stat & (I2CM_OP_DONE_IRQ | I2CM_READ_REQUEST_IRQ |
> >> +			    I2CM_NACK_RCVD_IRQ);
> >> +
> >> +	if (i2c->stat) {
> >> +		dw_hdmi_qp_write(hdmi, i2c->stat, MAINUNIT_1_INT_CLEAR);
> >> +		complete(&i2c->cmp);
> >> +	}
> >> +
> >> +	if (stat)
> >> +		return IRQ_HANDLED;
> >> +
> >> +	return IRQ_NONE;
> >> +}
> >=20
> > If the scrambler is enabled, you need to deal with hotplug. On hotplug,
> > the monitor will drop its TMDS ratio and scrambling status, but the
> > driver will keep assuming it's been programmed.
> >=20
> > If you don't have a way to deal with hotplug yet, then I'd suggest to
> > just drop the scrambler setup for now.
>=20
> Thanks for the heads up!
>=20
> HPD is partially handled by the RK platform driver, which makes use of
> drm_helper_hpd_irq_event(). Since the bridge sets DRM_BRIDGE_OP_DETECT
> flag, the dw_hdmi_qp_bridge_detect() callback gets executed, which in turn
> verifies the PHY status via ->read_hpd() implemented as
> dw_hdmi_qp_rk3588_read_hpd() in the platform driver.

It's not only about hotplug detection, it's also about what happens
after you've detected a disconnection / reconnection.

The framework expects to keep the current mode as is, despite the
monitor not being setup to use the scrambler anymore, and the display
remains black.

> During my testing so far it worked reliably when switching displays with
> different capabilities.  I don't have a 4K@60Hz display at the moment, but
> used the HDMI RX port on the Rock 5B board in a loopback connection to
> verify this mode, which triggered the high TMDS clock ratio and scrambling
> setup as well.

How did you test exactly?

Maxime

--wrzxqzphrlcany36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZtVrDQAKCRAnX84Zoj2+
diimAYCLSBf4aL43PYdfrLmm+dcjJ3Ntv61sabKRj+I99ElR2CzjU5X15XDJRhy4
7DlHP7QBgJDvJLEChcXiPKKmoMdbojebpow32S+1IQz8IIJ1A/mVwiVMhhX/9dGS
l6pDQRfQtw==
=s4gD
-----END PGP SIGNATURE-----

--wrzxqzphrlcany36--
