Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKhnJKBEqWlV3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:53:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 026E820DCA3
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4C510EBAA;
	Thu,  5 Mar 2026 08:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Haft0vZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2260210EBAC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:53:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C061440A63;
 Thu,  5 Mar 2026 08:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A67DC116C6;
 Thu,  5 Mar 2026 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772700828;
 bh=g72iVl9U5HM9n+fiEwdIJh7nyYcCS/n2Mf5HPw+45ck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Haft0vZlu5WKCYI8SG96a55+tzNaVOQgUPwajW9y9Xxd9bD/uc5Y7QwIrABkY8vJ+
 WKbmVrjQJ0Hlf/TQd04hYghNTawePDk+RJ61+GsMeJBtN9Wlt3KzKfK4NhguZc3o9+
 CPhG6EatlfrSTlJdRarp2cfrok8Mo334XQhQBgyhLfdW2VFYiE4x5BgKJqDJHV9DF1
 8Cr9Ys/l3+tay19A54Dmd9U+83x7f/Ln8Grqtt3QQRLd2HhdgOouC490XFEZpJ5dvS
 1vFJULwUsZI9Od9Rj+6iS1Nih8MTyz6AaR3aI57vfzeYiEm62Q2iHn2eZIUQgrneOm
 oqTxnYunR8x7A==
Date: Thu, 5 Mar 2026 09:53:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 kernel-dev@igalia.com
Subject: Re: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
Message-ID: <20260305-unyielding-sponge-of-efficiency-07218c@houat>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
 <20260224-curvy-shiny-dodo-e50cef@houat>
 <481489f1-850f-44ae-8586-b69c1d2faf8e@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rsl6glzzmmnhyjuq"
Content-Disposition: inline
In-Reply-To: <481489f1-850f-44ae-8586-b69c1d2faf8e@igalia.com>
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
X-Rspamd-Queue-Id: 026E820DCA3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:wahrenst@gmx.net,m:mwen@igalia.com,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,broadcom.com,gmx.net,igalia.com,raspberrypi.com,pengutronix.de,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


--rsl6glzzmmnhyjuq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
MIME-Version: 1.0

On Wed, Feb 25, 2026 at 10:57:11AM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 24/02/26 11:11, Maxime Ripard wrote:
> > Hi Maira,
> >=20
>=20
> [...]
>=20
> > > @@ -289,16 +290,22 @@ static int raspberrypi_fw_dumb_determine_rate(s=
truct clk_hw *hw,
> > >   static int raspberrypi_fw_prepare(struct clk_hw *hw)
> > >   {
> > >   	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> > > +	struct raspberrypi_clk_variant *variant =3D data->variant;
> > >   	struct raspberrypi_clk *rpi =3D data->rpi;
> > >   	u32 state =3D RPI_FIRMWARE_STATE_ENABLE_BIT;
> > >   	int ret;
> > >   	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> > >   					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> > > -	if (ret)
> > > +	if (ret) {
> > >   		dev_err_ratelimited(rpi->dev,
> > >   				    "Failed to set clock %s state to on: %d\n",
> > >   				    clk_hw_get_name(hw), ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (variant->maximize)
> > > +		ret =3D raspberrypi_fw_set_rate(hw, variant->max_rate, 0);
> >=20
> >=20
> > It's not clear to me why you would want to force it to the max there,
> > and especially the max of the clock. It would make more sense to me to
> > set it to whatever maximum rate clk_hw_get_rate_range would return
> > (which should be the minimum of variant->max_rate + all clk->max_rate),
> > but even then it would erase every call to clk_set_rate before calling
> > clk_prepare().
> >=20
> > I'd understand lowering the clock rate in unprepare to avoid wasting too
> > much power, but why do we need to raise it here?
>=20
> This only applies to clocks with variant->maximize =3D=3D true, which is
> exclusively the V3D clock. The V3D driver doesn't do fine-grained rate
> control, it always wants maximum performance. In the case of V3D, there
> are no intermediate clk_set_rate() calls to preserve.
>=20
> >=20
> > >   	return ret;
> > >   }
> > > @@ -306,10 +313,19 @@ static int raspberrypi_fw_prepare(struct clk_hw=
 *hw)
> > >   static void raspberrypi_fw_unprepare(struct clk_hw *hw)
> > >   {
> > >   	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> > > +	struct raspberrypi_clk_variant *variant =3D data->variant;
> > >   	struct raspberrypi_clk *rpi =3D data->rpi;
> > >   	u32 state =3D 0;
> > >   	int ret;
> > > +	/*
> > > +	 * On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn=
't
> > > +	 * actually power off the clock. To achieve meaningful power consum=
ption
> > > +	 * reduction, the driver needs to set the clock rate to minimum bef=
ore
> > > +	 * disabling it.
> > > +	 */
> > > +	raspberrypi_fw_set_rate(hw, variant->min_rate, 0);
> >=20
> > I'm not sure setting it to variant->min_rate would work directly either,
> > since it would break consumers expectations. Also, can we guard it with
>=20
> The clock is being unprepared, which means that any consumer that wants
> to use it again must call clk_prepare() first, at which point the rate
> gets restored (for maximize clocks) or re-established by the consumer
> via clk_set_rate(). Considering that no consumer should be relying on
> the rate of an unprepared clock, I understand that there are no
> expectations to break here.

For both of those, I still feel like it's a pretty strong deviation from
the general expected behaviour of the CCF API. From what you're saying,
we shouldn't notice it too much, but at the very least we should
document it explicitly, both what the deviation is, and why we think
it's ok.

> > a version check if we know that there's some good and bad firmwares?
>=20
> So far, all firmware versions have this issue. For future firmware
> releases, it might change, but so far, all firmware versions have this
> issue.

ack :)

> >=20
> > >   	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> > >   					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> > >   	if (ret)
> > > @@ -334,7 +350,7 @@ static struct clk_hw *raspberrypi_clk_register(st=
ruct raspberrypi_clk *rpi,
> > >   {
> > >   	struct raspberrypi_clk_data *data;
> > >   	struct clk_init_data init =3D {};
> > > -	u32 min_rate, max_rate;
> > > +	unsigned long rate;
> > >   	int ret;
> > >   	data =3D devm_kzalloc(rpi->dev, sizeof(*data), GFP_KERNEL);
> > > @@ -354,18 +370,20 @@ static struct clk_hw *raspberrypi_clk_register(=
struct raspberrypi_clk *rpi,
> > >   	data->hw.init =3D &init;
> > > -	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> > > -					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
> > > -					 &min_rate);
> > > -	if (ret) {
> > > -		dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
> > > -			id, ret);
> > > -		return ERR_PTR(ret);
> > > +	if (!variant->min_rate) {
> > > +		ret =3D raspberrypi_clock_property(rpi->firmware, data,
> > > +						 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
> > > +						 &variant->min_rate);
> > > +		if (ret) {
> > > +			dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
> > > +				id, ret);
> > > +			return ERR_PTR(ret);
> > > +		}
> > >   	}
> >=20
> > It feels to me like it would need to be a separate patch. Why do you
> > need to override the minimum clock rate reported by the firmware?
>=20
> This change is needed because the prepare/unprepare callbacks need
> access to the min/max rates. In the current code, these are local
> variables in raspberrypi_clk_register(). Storing them in the variant
> struct makes them available to the callbacks. The `if (!variant-
> >min_rate)` guard only preserves the existing behavior for clocks like
> M2MC that have a hard-coded minimum rate.

min_rate itself is indeed available only in raspberrypi_clk_register(),
but its main use is to call clk_hw_set_rate_range to use it as the
minimum clock rate.

In prepare/unprepare, you should be able to use clk_hw_get_rate_range()
to retrieve it, or am I missing something?

Maxime

--rsl6glzzmmnhyjuq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaalElQAKCRAnX84Zoj2+
dq4PAYCPY9g7d5egQ6wghudGoDzx9SHRivvClwKyoKk1AodMMK9NTvkbz1M0ygp3
KeJQSpEBf39z7CUZJB1YDJbR1YN0OePlyJploZSkmc72zTPwl2RyrpMor29K1LfH
eOPgy8oVMw==
=GW7L
-----END PGP SIGNATURE-----

--rsl6glzzmmnhyjuq--
