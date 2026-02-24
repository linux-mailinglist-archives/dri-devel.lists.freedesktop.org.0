Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACxhO4uxnWm5RAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:11:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F018835E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBB310E584;
	Tue, 24 Feb 2026 14:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S04o0Hfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC5510E584
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 14:11:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8DDA442C5;
 Tue, 24 Feb 2026 14:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71646C116D0;
 Tue, 24 Feb 2026 14:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771942279;
 bh=/2JKDLuQmJT/18kwnROeCtwnFb0uQ79jz4jv7dCbOiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S04o0HfkyaGX3s7YD+vFy+QibtQstZMFCM7CKDKDXro6kJ9oY3qWp3X6ZhrB9+uX9
 E5yQdlQA5Ww3Uri5AKXyg6f/ZDnt8/WdrBEJ4BMsSf6RtMMqHlVv0r8UWRCSbqi4Z6
 Htl6SeH2WevZlXGo66vsdLXm2o9VDFWXFkf8gYY9l1RdgcislLTQrGybhxCCXAjBAf
 gF/IYdCImbCX/TkII4LGh2g5f+kUM3Q5k2j0ZCvxP2/N7G/3/d7fly46xLS7TuK2CV
 370SvjP4WRQvSGHT3HxiESKzZEStcZppsUmqjuL7BK5Bx25WMWdjMg5pWg37fioJ8f
 TRqG8GgfTOUeg==
Date: Tue, 24 Feb 2026 15:11:16 +0100
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
Message-ID: <20260224-curvy-shiny-dodo-e50cef@houat>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
 <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ocscotebgpj7h4ea"
Content-Disposition: inline
In-Reply-To: <20260218-v3d-power-management-v6-1-40683fd39865@igalia.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 648F018835E
X-Rspamd-Action: no action


--ocscotebgpj7h4ea
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 1/6] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
MIME-Version: 1.0

Hi Maira,

On Wed, Feb 18, 2026 at 05:44:59PM -0300, Ma=EDra Canal wrote:
> On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. To achieve meaningful power savings, the
> clock rate must be set to the minimum before disabling. This might be
> fixed in future firmware releases.
>=20
> Rather than pushing rate management to clock consumers, handle it
> directly in the clock framework's prepare/unprepare callbacks. In
> unprepare, set the rate to the firmware-reported minimum before
> disabling the clock. In prepare, for clocks marked with `maximize`
> (currently v3d), restore the rate to the maximum after enabling.
>=20
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 61 ++++++++++++++++++++++-----------=
------
>  1 file changed, 35 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index 1a9162f0ae31e330c46f6eafdd00350599b0eede..0d6e4f43c3bac0e7b38934c5c=
6e4db51211233de 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -66,7 +66,8 @@ const struct raspberrypi_clk_data *clk_hw_to_data(const=
 struct clk_hw *hw)
>  struct raspberrypi_clk_variant {
>  	bool		export;
>  	char		*clkdev;
> -	unsigned long	min_rate;
> +	u32		min_rate;
> +	u32		max_rate;
>  	bool		minimize;
>  	bool		maximize;
>  	u32		flags;
> @@ -289,16 +290,22 @@ static int raspberrypi_fw_dumb_determine_rate(struc=
t clk_hw *hw,
>  static int raspberrypi_fw_prepare(struct clk_hw *hw)
>  {
>  	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> +	struct raspberrypi_clk_variant *variant =3D data->variant;
>  	struct raspberrypi_clk *rpi =3D data->rpi;
>  	u32 state =3D RPI_FIRMWARE_STATE_ENABLE_BIT;
>  	int ret;
> =20
>  	ret =3D raspberrypi_clock_property(rpi->firmware, data,
>  					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
> -	if (ret)
> +	if (ret) {
>  		dev_err_ratelimited(rpi->dev,
>  				    "Failed to set clock %s state to on: %d\n",
>  				    clk_hw_get_name(hw), ret);
> +		return ret;
> +	}
> +
> +	if (variant->maximize)
> +		ret =3D raspberrypi_fw_set_rate(hw, variant->max_rate, 0);


It's not clear to me why you would want to force it to the max there,
and especially the max of the clock. It would make more sense to me to
set it to whatever maximum rate clk_hw_get_rate_range would return
(which should be the minimum of variant->max_rate + all clk->max_rate),
but even then it would erase every call to clk_set_rate before calling
clk_prepare().

I'd understand lowering the clock rate in unprepare to avoid wasting too
much power, but why do we need to raise it here?

>  	return ret;
>  }
> @@ -306,10 +313,19 @@ static int raspberrypi_fw_prepare(struct clk_hw *hw)
>  static void raspberrypi_fw_unprepare(struct clk_hw *hw)
>  {
>  	const struct raspberrypi_clk_data *data =3D clk_hw_to_data(hw);
> +	struct raspberrypi_clk_variant *variant =3D data->variant;
>  	struct raspberrypi_clk *rpi =3D data->rpi;
>  	u32 state =3D 0;
>  	int ret;
> =20
> +	/*
> +	 * On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> +	 * actually power off the clock. To achieve meaningful power consumption
> +	 * reduction, the driver needs to set the clock rate to minimum before
> +	 * disabling it.
> +	 */
> +	raspberrypi_fw_set_rate(hw, variant->min_rate, 0);

I'm not sure setting it to variant->min_rate would work directly either,
since it would break consumers expectations. Also, can we guard it with
a version check if we know that there's some good and bad firmwares?

>  	ret =3D raspberrypi_clock_property(rpi->firmware, data,
>  					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>  	if (ret)
> @@ -334,7 +350,7 @@ static struct clk_hw *raspberrypi_clk_register(struct=
 raspberrypi_clk *rpi,
>  {
>  	struct raspberrypi_clk_data *data;
>  	struct clk_init_data init =3D {};
> -	u32 min_rate, max_rate;
> +	unsigned long rate;
>  	int ret;
> =20
>  	data =3D devm_kzalloc(rpi->dev, sizeof(*data), GFP_KERNEL);
> @@ -354,18 +370,20 @@ static struct clk_hw *raspberrypi_clk_register(stru=
ct raspberrypi_clk *rpi,
> =20
>  	data->hw.init =3D &init;
> =20
> -	ret =3D raspberrypi_clock_property(rpi->firmware, data,
> -					 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
> -					 &min_rate);
> -	if (ret) {
> -		dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
> -			id, ret);
> -		return ERR_PTR(ret);
> +	if (!variant->min_rate) {
> +		ret =3D raspberrypi_clock_property(rpi->firmware, data,
> +						 RPI_FIRMWARE_GET_MIN_CLOCK_RATE,
> +						 &variant->min_rate);
> +		if (ret) {
> +			dev_err(rpi->dev, "Failed to get clock %d min freq: %d\n",
> +				id, ret);
> +			return ERR_PTR(ret);
> +		}
>  	}

It feels to me like it would need to be a separate patch. Why do you
need to override the minimum clock rate reported by the firmware?

Maxime

--ocscotebgpj7h4ea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZ2xhAAKCRAnX84Zoj2+
dj0uAYDYA2mhl71c/wqrDKPAvTLlIAXMJIOSicez1ItK96GamLM8F93PvhqraCfK
fFASXvQBfjYI2nDCisxBUCZeDRhehkuv1iDeaTi0B5qRtiIAcpHPx1JdqS+f2W0b
aFXRe67jFQ==
=xbDx
-----END PGP SIGNATURE-----

--ocscotebgpj7h4ea--
