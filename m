Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB3AB14915
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538B310E5D8;
	Tue, 29 Jul 2025 07:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="goaYjTSH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5610E5D8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 07:27:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 50198A549B8;
 Tue, 29 Jul 2025 07:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D6FC4CEFA;
 Tue, 29 Jul 2025 07:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753774053;
 bh=1tfbbzkMLJ4su0Eq5fDHoD0tAesEFs6z/NL27gGK0kc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=goaYjTSHOpBLCp9UcX1vxeNDQqZ2C/hiGlkVaXLEnISbc6VN0AUnK7yjALpUczIz7
 0amNFL+Ct9MMV7dWpySjPKUW0X6zBzG39qOhYKIBO372J6tn+zwVOLFM7UcZXxOVvj
 zCsTQxBypNl+Gsv9EhFYDWsyUbCW/kmdWqCEEw2IFzNq7z7q+Jllb/LjZvQiled2n7
 4h+KTaz4A5FeKUevbvbwm1B1qQIZsWZ2xSv7ZGqL3u5BRNBQQUrRmmmYEmNfyLxddP
 heFPwTY/8B2TbxmN4ORXSUc3Edl1fj4mKfg6/zfGG/BDT9jaNnqVoKhkNiQ/JIiacT
 MsZu+vvoArSYQ==
Date: Tue, 29 Jul 2025 09:27:31 +0200
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
Message-ID: <20250729-tall-fluffy-grouse-f5deec@houat>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="n2s32cgvask3qzwk"
Content-Disposition: inline
In-Reply-To: <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
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


--n2s32cgvask3qzwk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
MIME-Version: 1.0

Hi Ma=EDra,

On Mon, Jul 28, 2025 at 09:35:38AM -0300, Ma=EDra Canal wrote:
> Currently, when we prepare or unprepare RPi's clocks, we don't actually
> enable/disable the firmware clock. This means that
> `clk_disable_unprepare()` doesn't actually change the clock state at
> all, nor does it lowers the clock rate.
>=20
> From the Mailbox Property Interface documentation [1], we can see that
> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
> prepare and an unprepare hook for RPi's firmware clock.
>=20
> As now the clocks are actually turned off, some of them are now marked
> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
> early boot or are required during reboot.

What difference is there between the CLK_IGNORE_UNUSED and
CLK_IS_CRITICAL clocks?

I'm asking, because CLK_IGNORE_UNUSED is mostly useless, and
CLK_IS_CRITICAL is probably what you're looking for for all of them.

Maxime

--n2s32cgvask3qzwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIh33gAKCRAnX84Zoj2+
dsGHAYCE7DMrIRIs46iEKrBa6NG56LrGKUNEa1Ohv9us6PuvoIDPo8i4FgZGJPWn
4k9SvhkBgPML7cwLjOb+Uo1kEcrBQjk3Y3N5YhH5HiWzdIK7xdBBA4OnKkmXKPDB
TPP038pu+Q==
=L4PT
-----END PGP SIGNATURE-----

--n2s32cgvask3qzwk--
