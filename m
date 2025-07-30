Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C4B1636F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 17:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2D910E0E2;
	Wed, 30 Jul 2025 15:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tVDBPGBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20E310E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 15:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 96481A55415;
 Wed, 30 Jul 2025 15:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E312AC4CEE3;
 Wed, 30 Jul 2025 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753888385;
 bh=YqBW6ZCHBt4v3Y+QsUzEN/bOKa7JgRKiAz8ZlMqNhLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tVDBPGBe3uFtYEbN2yRY07XWJukABYJHao60BGXdLpMTcesP2rN+58FdjC3+TFwza
 960l9358iNOb9qwv9+kbr+Ase/bR7oBGvCFvltUiVfsi4PsdaUGgj+NyBHWTqsIg6g
 Ob/FmsHiM83t7lKc/YiHcLlYBVyyQRflHNvCJc46HeOnTJqz05oBPtEks3j2BdXdXZ
 U4cmc09QPjZPh1vN5G7sCu6qKTlFjVRoWROzFM3wJkvGUeiow1x8FdXJ2Z1t6qxipB
 Gk9KtZGgT/CrBloejH2DWrbEcJxz0WCXqcMTX74WhDyL/tqDD71byD+Lek3nus/uab
 WY1mSLZthELzw==
Date: Wed, 30 Jul 2025 17:13:02 +0200
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
Message-ID: <20250730-boisterous-rare-rattlesnake-ae3a6d@houat>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
 <20250729-tall-fluffy-grouse-f5deec@houat>
 <1bc23ad0-7273-4ddf-a0ef-4a80186f2581@igalia.com>
 <20250729-whispering-accelerated-raptor-134e8a@houat>
 <b8c0f9be-a57e-49b3-8113-cbb9307facd9@igalia.com>
 <38d12f53-8c8a-4713-b1f9-0e8ffdf71f98@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5u3z2tlprnrcmq42"
Content-Disposition: inline
In-Reply-To: <38d12f53-8c8a-4713-b1f9-0e8ffdf71f98@igalia.com>
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


--5u3z2tlprnrcmq42
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
MIME-Version: 1.0

On Tue, Jul 29, 2025 at 09:33:50PM -0300, Ma=EDra Canal wrote:
> On 29/07/25 13:19, Ma=EDra Canal wrote:
> > Hi Maxime,
> >=20
> > On 29/07/25 09:14, Maxime Ripard wrote:
> > > On Tue, Jul 29, 2025 at 08:53:51AM -0300, Ma=EDra Canal wrote:
> > > > Hi Maxime,
> > > >=20
> > > > On 29/07/25 04:27, Maxime Ripard wrote:
> > > > > Hi Ma=EDra,
> > > > >=20
> > > > > On Mon, Jul 28, 2025 at 09:35:38AM -0300, Ma=EDra Canal wrote:
> > > > > > Currently, when we prepare or unprepare RPi's clocks, we
> > > > > > don't actually
> > > > > > enable/disable the firmware clock. This means that
> > > > > > `clk_disable_unprepare()` doesn't actually change the clock sta=
te at
> > > > > > all, nor does it lowers the clock rate.
> > > > > >=20
> > > > > > =A0 From the Mailbox Property Interface documentation [1],
> > > > > > we can see that
> > > > > > we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock s=
tate
> > > > > > off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create=
 a
> > > > > > prepare and an unprepare hook for RPi's firmware clock.
> > > > > >=20
> > > > > > As now the clocks are actually turned off, some of them are now=
 marked
> > > > > > with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are require=
d since
> > > > > > early boot or are required during reboot.
> > > > >=20
> > > > > What difference is there between the CLK_IGNORE_UNUSED and
> > > > > CLK_IS_CRITICAL clocks?
> > > >=20
> > > > =A0From my understanding, CLK_IGNORE_UNUSED will prevent the clock =
to be
> > > > gated during boot (on "clk: Disabling unused clocks"), but after it=
, the
> > > > clock can be gated.
> > > >=20
> > > > With CLK_IS_CRITICAL, the clock will never be disabled.
> > >=20
> > > Yeah, that's correct.
> > >=20
> > > > For example, RPI_FIRMWARE_M2MC_CLK_ID is used by vc4. It needs to be
> > > > enabled at boot (I tested; if not enabled, it won't boot). However,
> > > > after vc4 is probed, we would like vc4 to have control of it and be=
 able
> > > > to unprepare it in `vc4_hdmi_runtime_suspend()`. If I set it as
> > > > CLK_IS_CRITICAL, vc4 won't be able to unprepare it.
> > >=20
> > > If the clock can be disabled by Linux, but it breaks some drivers if
> > > it's not enabled during their probe, something is fishy somewhere, and
> > > it's likely it would be just as broken if you compiled the driver as a
> > > module.
> > >=20
> > > Even then, some of the other clocks should probably never be disabled,
> > > like the CPU clock.
> >=20
> > I'll mark RPI_FIRMWARE_ARM_CLK_ID and RPI_FIRMWARE_CORE_CLK_ID as
> > critical. Are there any other clocks you think should never be disabled?
> >=20
> > >=20
> > > > I only set RPI_FIRMWARE_PIXEL_BVB_CLK_ID as critical, as, otherwise=
, the
> > > > RPi won't reboot.
> > >=20
> > > Why?
> >=20
> > I'll have to dig a bit into vc4 HDMI code and to investigate the reason
> > (and maybe fix the issue there).
>=20
> After some investigation, I believe that those display-related should be
> set to CLK_IGNORE_UNUSED. It's not that it breaks some drivers if not
> enabled, but it breaks hardware functionality and the device won't boot.

That's the sign of a driver accessing a register without having its
clock explicitly enabled. It's a bug in the driver.

> See, for example, clk-bcm2835 in which all PLL and PLL dividers clocks
> are marked with CLK_IGNORE_UNUSED and some with CLK_IS_CRITICAL.
>
> Maybe Dave has some input about the topic?
>=20
> So far, I'm planing to keep CLK_IGNORE_UNUSED to the display-related
> clocks and remove CLK_IS_CRITICAL from RPI_FIRMWARE_PIXEL_BVB_CLK_ID. If
> you have any objections about it, let me know.

I guess my main point was that CLK_IGNORE_UNUSED is inherently fragile
and doesn't protect from the clock being actually disabled: a driver
probing, failing and calling clk_disable on that clock would disable it
for example. Or if the last enabled sibling reparents to another parent
and thus your parent will get disabled.

The only thing it does is skipping the explicit disable round at the end
of the kernel boot. That's it.

So if you do need to keep the clock enabled, use CLK_IS_CRITICAL. If you
don't, well then that's easy :)

Maxime

--5u3z2tlprnrcmq42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIo2eQAKCRAnX84Zoj2+
dtcgAX0X3wsxlIhSt8GuDredypYxHxwtC+MgUdYZeXHTlPuR9ueUAmjehy6oSxBY
WZFV8p8BgLB5L/NKlr42GYLe7RA5Rx7TQWGj3KmSeHzjEAXGb4tXSlWDGMp8EQTv
Qyo6gR+tiQ==
=zEWw
-----END PGP SIGNATURE-----

--5u3z2tlprnrcmq42--
