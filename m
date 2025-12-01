Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3920C98472
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:36:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394CB10E41F;
	Mon,  1 Dec 2025 16:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HqOwMPGe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5302B10E2BC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 16:36:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C57856014A;
 Mon,  1 Dec 2025 16:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA66C4CEF1;
 Mon,  1 Dec 2025 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764606976;
 bh=7Ela2txueqxoBkmbj3YnC/bBlyZlK3c3rgtnk2god44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HqOwMPGeuNF5bpSwRNPmPeNDsKC0uPmbW/Kkaip0N/npqK+9wTujKDilxEyVYVsoa
 COkT7aCqeHyKyvf7J88Hb/RofgqlOA21OUsdE4v/ROhuXYFYfUIuJo+Y8brgF6P0vD
 eYy7fxWnvLyFZ4UKqxqVmFiJuNApPYRI0DZ7UU2I8VHHtqKjeEoSe5/ZMVqxMFfRnd
 4aqpxTXu15N34UcnYc5ODe3gd/Qfi5YrPy7GeRDSnw65rvJShkPNALr6aFkSzYBZCx
 D0VJVX70aYziyooSpHOkgF0AheL10892RPz7A02h8/i1dFRf43ybpDi4uqYT1z2ZGJ
 rkn9c/j+v2Xkg==
Date: Mon, 1 Dec 2025 17:36:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>,
 stable@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: Re: [PATCH v1] Revert "drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism"
Message-ID: <20251201-uptight-limpet-of-chivalry-404dff@houat>
References: <20251125103900.31750-1-francesco@dolcini.it>
 <DEJCGODDOTXT.QT2J4E31GUVW@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mteft2wa35d6pfvp"
Content-Disposition: inline
In-Reply-To: <DEJCGODDOTXT.QT2J4E31GUVW@bootlin.com>
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


--mteft2wa35d6pfvp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] Revert "drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism"
MIME-Version: 1.0

Hi,

On Thu, Nov 27, 2025 at 09:46:07AM +0100, Luca Ceresoli wrote:
> Hello Francesco, all,
>=20
> On Tue Nov 25, 2025 at 11:38 AM CET, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > This reverts commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
> > recovery mechanism").
> >
> > The reverted commit introduces a regression on Verdin AM62, and
> > potentially on more devices, not being able to generate a clock
> > that the TI SN65DSI83 PLL can lock to, with the display periodically
> > blinking.
> >
> > Verdin AM62 SoM has a Toshiba TC358778 DPI to DSI bridge, that can be
> > connected to an LVDS display over a TI SN65DSI83 bridge. Before this
> > change despite the TI SN65DSI83 reporting with a debug print a PLL
> > locking error the display was working fine with no visible glitches.
> >
> > The reasons for this issue was investigated without getting to a final
> > conclusion:
> >
> >  - the DPI clock was measure and it is stable/accurate
> >  - the DSI clock was not possible to measure, but this setup is used
> >    with other display/bridges with no known issues
> >  - the DSI clock is configured in continuous mode
> >  - the actual DSI clock generated from the TC358778 is generate with a
> >    PLL from a 25MHz reference clock
> >  - it's not clear why some frequencies are working and some are not, for
> >    example 50000000, 68750000, 72750000, 75000000 frequencies are fine,
> >    while 69750000, 71100000, 72500000 are not
> >
> > Given that the safest approach is to just revert the commit, till a
> > proper solution for error recovery that is not introducing regression
> > is figured out.
> >
> > Reported-by: Jo=E3o Paulo Gon=E7alves <jpaulo.silvagoncalves@gmail.com>
> > Closes: https://lore.kernel.org/all/bhkn6hley4xrol5o3ytn343h4unkwsr26p6=
s6ltcwexnrsjsdx@mgkdf6ztow42/
> > Fixes: ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery mec=
hanism")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> Thanks for having sent this revert patch.
>=20
> However after evaluating the overall situation I decided to send a
> different patch to address this issue in the short term. The idea is to
> just ignore the PLL_UNLOCK error, keeping the existing
> structure. Rationale:
>=20
>  * this sloves the issue for Toradex, based on Jo=E3o's initial report
>  * there is no evidence of any bugs in the recovery mechanism, it's
>    just exposing a pre-existing problem that was only producing a
>    non-fatal dev_err() before
>  * a full revert would remove error checking for all errors, including
>    those not creating any issue, thus removing a useful feature
>  * a full revert would require rewriting patches such as [0] (not a big
>    deal per se, but see next bullet)
>  * after patches such as [0] are applied, re-adding the error recovery
>    mechanism would require another rework, so more work for authors,
>    reviewers, testers and maintainers

Were are we on this? Both patches work for me, but we need to take a decisi=
on.

Maxime

--mteft2wa35d6pfvp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaS3D/AAKCRAnX84Zoj2+
dt1tAX4mjSsulIvmX9jR8B1feC0pANIxfizynEARF5Kf5Bouz8pMV2jfNf498hLx
4N8wsu0BfjEEHTrAshXgxoeRQ2TFTwnMl3XyveCGJCPUn9MtBxjlNdhmtAUQ7587
iY4cpgCo8w==
=UEl2
-----END PGP SIGNATURE-----

--mteft2wa35d6pfvp--
