Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C43D3D02AC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 22:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B996E509;
	Tue, 20 Jul 2021 20:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28366E509
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 20:33:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA00A60FF2;
 Tue, 20 Jul 2021 20:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626813196;
 bh=eAL8QwelZEjqkrY6xpSxtA3PODMbnmYsssC4KoVZiOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JJpAfKhnABUmpxOg9U/fYhIdK676lUC7zxdZO4Ov+XkzsTN1uNQpBFvYrirDfIakZ
 byh9JWGpUaePwdP9P8a5i5BEvhoOUPFLDQF/TDfF6Dt16A3BeRLHI/9/G2uzjph8jw
 MevIZGtIuySKTu1ntOZrkKNQFaWrdWeYOaJyeJpxUnq3KG8ahCOJyb+BlK+zntCxgx
 Ed4I0eXobO8J3Ubp6zPV5nmDpkVivVrUweH+mzg1CoHXf/MLoxDBrQyTc2c5HwIyLh
 QY1nFaI0Gwrfw7HTmsQ+TalbuwunzUd9K0sOoGUuoML7Km3jvcukKSLHc3yF+IDiUt
 vtHRTxUbK9qGQ==
Date: Tue, 20 Jul 2021 21:33:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Remove "status" from schema examples
Message-ID: <20210720203312.GG5042@sirena.org.uk>
References: <20210720172025.363238-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kadn00tgSopKmJ1H"
Content-Disposition: inline
In-Reply-To: <20210720172025.363238-1-robh@kernel.org>
X-Cookie: Revenge is a meal best served cold.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Mateusz Holenko <mholenko@antmicro.com>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 ChiYuan Huang <cy_huang@richtek.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-rtc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Wei Xu <xuwei5@hisilicon.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kadn00tgSopKmJ1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2021 at 11:20:25AM -0600, Rob Herring wrote:
> There's no reason to have "status" properties in examples. "okay" is the
> default, and "disabled" turns off some schema checks ('required'
> specifically).

Acked-by: Mark Brown <broonie@kernel.org>

--kadn00tgSopKmJ1H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD3MwcACgkQJNaLcl1U
h9Bjsgf8DIiqqQ26ZTa4jvNqa3wI4t/EHPC0PLaGmxZWA2e7eTEGVrmipVIkUz2m
dX2Rrsl6xOoU39mzMuCNQwVu9iqiJUoxt6xQsFG13raVCQhBTxxgkkVV2qU6BWh0
TEuDrDM4Uh5EIU/PxpwbywfyPELaMCBkFvkd9D8O/0ek7OPcVuw5Au7es/ZG+NS/
nQBA4oFRFdrIVSQmZ+Tn3/VjiivJhZ4H8MZ3oSKcFrMpQjG6ppG31dZGHpKtJNwE
bUqasYXWrqKz1seky+xKbpbMnSjok627Byj0cGtNir3l8MpB2bV+Ae2OE/tc3nyZ
aRZ/bNwgS/oYZ+vrKSOeJcgAasfyYw==
=3Ukn
-----END PGP SIGNATURE-----

--kadn00tgSopKmJ1H--
