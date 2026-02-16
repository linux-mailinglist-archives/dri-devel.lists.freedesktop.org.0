Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAnHGwj1kmko0gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:44:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C177614272E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 11:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8781410E224;
	Mon, 16 Feb 2026 10:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OmBwJPlV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFC110E202
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 10:44:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C30E6011F;
 Mon, 16 Feb 2026 10:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381F9C116C6;
 Mon, 16 Feb 2026 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771238657;
 bh=PVqVaBr/n+vwwiVRZTvOnHrcTVldkSg7n8bljp1tGzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OmBwJPlVNExeRF54zvsjriY5JlorTcvzKff5l9TBCiGJeN5TtxLsvVzNEpxJtLzS3
 jJkx2NBYEUYEQMpagAVbB7iT2d1gV/4HnKU0LCBBu87yA0163B3k9R9lSjrvBXeAu9
 S8BXhkbcQuJXeBERpqFgLSCeGXVSArZY3wO+6c3NvLyJFmMrZ5LTdapPGjowOns/br
 /9OjdVF+NW7pwbKvlZSPHRfeJFNm4YooDvmf6MVsH1biZKzm3Uh193l7KYi6GTbUqa
 ux+LpFR7/ApWvdPLe2qxIxPyM+tIDQp8tvsJgcMPWioZOrUhxde1TX7puX9hlGD7rs
 1tPLgguHKnBCQ==
Date: Mon, 16 Feb 2026 11:44:14 +0100
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
Subject: Re: [PATCH v5 2/7] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
Message-ID: <20260216-vigilant-resourceful-coati-32baed@houat>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
 <20260213-v3d-power-management-v5-2-7a8b381eb379@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xzldcocj7z527ets"
Content-Disposition: inline
In-Reply-To: <20260213-v3d-power-management-v5-2-7a8b381eb379@igalia.com>
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:wahrenst@gmx.net,m:mwen@igalia.com,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,broadcom.com,gmx.net,igalia.com,raspberrypi.com,pengutronix.de,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email]
X-Rspamd-Queue-Id: C177614272E
X-Rspamd-Action: no action


--xzldcocj7z527ets
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/7] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
MIME-Version: 1.0

Hi,

On Fri, Feb 13, 2026 at 03:52:55PM -0300, Ma=EDra Canal wrote:
> On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. Document this behavior so that clock
> consumers understand they may need to set the rate to minimum before
> disabling for meaningful power savings.
>=20
> Suggested-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index 9783385d5859836898683209e320fcc928dfdc71..2e63121af0900ac9b4874b666=
cf6d02baa8be11c 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -308,6 +308,12 @@ static void raspberrypi_fw_unprepare(struct clk_hw *=
hw)
>  	u32 state =3D 0;
>  	int ret;
> =20
> +	/*
> +	 * On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> +	 * actually power off the clock. To achieve meaningful power consumption
> +	 * reduction, consumers need to set the clock rate to minimum before
> +	 * disabling it.
> +	 */
>  	ret =3D raspberrypi_clock_property(rpi->firmware, data,
>  					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>  	if (ret)

This creates a pretty weird hole in the abstraction layer and clock API.
Like, if you set the minimum rate, unprepare the clock, and then put the
clock handle, the minimum is not there anymore and you don't have that
guarantee anymore.

I don't think we ever nailed the semantics of what happens to the clock
range once the clock is disabled. And if we do, it's not because a clock
consumer disables and clock that it's actually disabled.

Couldn't we turn it backward and always set the ideal minimum firmware
rate before disabling the clock (possibly by checking the firmware
version first) ?

Maxime

--xzldcocj7z527ets
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZL09QAKCRAnX84Zoj2+
djAVAX9Q18LM3+xl6lnztiRizzCV0M1hYddMtP85RAk7fw/L5yDk+YQhTBRCMnwk
ZknIze0Bf2qnOyS9bBuPn/Kb6JyP4n0xHs0o7sS9KDjZ1ZKMguDNgmRaXmc/AHXs
oaQUSyfJ2g==
=kbtw
-----END PGP SIGNATURE-----

--xzldcocj7z527ets--
