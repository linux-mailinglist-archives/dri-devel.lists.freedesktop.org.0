Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E2B14D81
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 14:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B935B10E16F;
	Tue, 29 Jul 2025 12:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JY+yc2pX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C3610E16F
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 12:14:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6124F43270;
 Tue, 29 Jul 2025 12:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FBFC4CEEF;
 Tue, 29 Jul 2025 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753791268;
 bh=BgaFoqVRetlFIdGlmgFlyEwE1NoxMQBs2gwHf2XrQ0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JY+yc2pXP08LnmnnmxYC52FWExBeXVu/8wtbgxuDB6CrXCYIuNmxhupesBh0I4XyL
 OEAIOPjNXPxXfTYi9EkDJsjwFJW68YVydXOplSn2ytp0SUiRDdB9Gqi7jXqF5RTuKx
 mTI6MUy0PcMkAFXAejs57hb+sUJdyjdAnKkbJ5FDjUseoSsOYpMnaT52fzaa8N5OxX
 fNjiSUS7/8oiPLXaecVGexMjcs1qKDC+Mu5fg6ClailYNd8jaHnCkoriG9jDzLwgTU
 KjH+6YpzqNSzySdSGDzlXuDXHVytmzcj5sD1IrTEOO657SIywrtqoDWbksxd/73uFI
 dbqDZbnNxQkHw==
Date: Tue, 29 Jul 2025 14:14:25 +0200
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 kernel-dev@igalia.com
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
Message-ID: <20250729-whispering-accelerated-raptor-134e8a@houat>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
 <20250729-tall-fluffy-grouse-f5deec@houat>
 <1bc23ad0-7273-4ddf-a0ef-4a80186f2581@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lreg5x3nkzb4mttn"
Content-Disposition: inline
In-Reply-To: <1bc23ad0-7273-4ddf-a0ef-4a80186f2581@igalia.com>
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


--lreg5x3nkzb4mttn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
MIME-Version: 1.0

On Tue, Jul 29, 2025 at 08:53:51AM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 29/07/25 04:27, Maxime Ripard wrote:
> > Hi Ma=EDra,
> >=20
> > On Mon, Jul 28, 2025 at 09:35:38AM -0300, Ma=EDra Canal wrote:
> > > Currently, when we prepare or unprepare RPi's clocks, we don't actual=
ly
> > > enable/disable the firmware clock. This means that
> > > `clk_disable_unprepare()` doesn't actually change the clock state at
> > > all, nor does it lowers the clock rate.
> > >=20
> > >  From the Mailbox Property Interface documentation [1], we can see th=
at
> > > we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> > > off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> > > prepare and an unprepare hook for RPi's firmware clock.
> > >=20
> > > As now the clocks are actually turned off, some of them are now marked
> > > with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
> > > early boot or are required during reboot.
> >=20
> > What difference is there between the CLK_IGNORE_UNUSED and
> > CLK_IS_CRITICAL clocks?
>=20
> From my understanding, CLK_IGNORE_UNUSED will prevent the clock to be
> gated during boot (on "clk: Disabling unused clocks"), but after it, the
> clock can be gated.
>=20
> With CLK_IS_CRITICAL, the clock will never be disabled.

Yeah, that's correct.

> For example, RPI_FIRMWARE_M2MC_CLK_ID is used by vc4. It needs to be
> enabled at boot (I tested; if not enabled, it won't boot). However,
> after vc4 is probed, we would like vc4 to have control of it and be able
> to unprepare it in `vc4_hdmi_runtime_suspend()`. If I set it as
> CLK_IS_CRITICAL, vc4 won't be able to unprepare it.

If the clock can be disabled by Linux, but it breaks some drivers if
it's not enabled during their probe, something is fishy somewhere, and
it's likely it would be just as broken if you compiled the driver as a
module.

Even then, some of the other clocks should probably never be disabled,
like the CPU clock.

> I only set RPI_FIRMWARE_PIXEL_BVB_CLK_ID as critical, as, otherwise, the
> RPi won't reboot.

Why?

Maxime

--lreg5x3nkzb4mttn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIi7HAAKCRAnX84Zoj2+
ds9aAYDbl6MronUKcv7fcDowoI1cKqjICPvChFLlj4l/6+TNRODFMDYikX0DAv9f
vPf8uZEBf0TfcPnG8iD/d1L+SRJdNwbm5wVBFkOhdNF09qs/KrmVOBpAighNYiFB
XpfasiJfkg==
=+OS0
-----END PGP SIGNATURE-----

--lreg5x3nkzb4mttn--
