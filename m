Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B68F57C9AC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 13:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B3E1129B9;
	Thu, 21 Jul 2022 11:20:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320F21129B9;
 Thu, 21 Jul 2022 11:20:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EC749B823C7;
 Thu, 21 Jul 2022 11:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE060C3411E;
 Thu, 21 Jul 2022 11:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658402431;
 bh=F94TfIE1knNCQ1PbA4Yel8RssqfFFH/6UvosT8/A/6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RN09Akc6l/4soLrnBxeLUOsLAGNZwZ5BRP6FiEh667Hp0V+9e+lwgO3lBSfBiBMnL
 aXJWKmfn4bajVh7eZtRno6RTPoKf5giMyjgDGBlMRq4+UyJAakD1LCXY1HhBE9Z0gi
 2UK1osBvwlJ9n2KsHnfGFIwLcRhd7DnzH3RkHlSHds1DGAVKJ9NtoYQpoPKM3Kmgia
 GgaeyMe0OSrqJbdwyJdLq4ZX1m1UntSC8dBMCxPBFc4ZHDcS2RtzWzO8o+98FCDN+X
 iP60VGBDtG3ulVNJbdJD3YaYVs+aIca57i1suuQg9QO18Iofq2QE5t0iZ8AUiQjNLS
 29GR5GdbXwf7g==
Date: Thu, 21 Jul 2022 12:20:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <Ytk2dxEC2n/ffNpD@sirena.org.uk>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1DJx7/60zQ9pOY6w"
Content-Disposition: inline
In-Reply-To: <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
X-Cookie: Exercise caution in your daily affairs.
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
Cc: quic_sbillaka@quicinc.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 quic_aravindh@quicinc.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, sean@poorly.run,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--1DJx7/60zQ9pOY6w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 12:31:41PM +0200, Johan Hovold wrote:

If you're copying someone into a thread that's not obviously relevant
for them it's good practice to put a note about it at the top of the
mail to reduce the chances that it just gets deleted unread - people get
copies of all sorts of random stuff for not great reasons (like getting
pulled in by checkpatch due to once having done a cleanup) and are often
quicky to delete things.

> This series breaks USB and PCIe for some SC8280XP and SA540P machines
> where the DP PHY regulators are shared with other PHYs whose drivers do
> not request a load.

> Specifically, the hard-coded vdda-phy load of 21.8 mA added by this
> series, causes several RPMh regulators to now be put in low-power mode.

> I found Doug's suggestion to handle situations like this in regulator
> core:
>=20
> 	https://lore.kernel.org/all/20180814170617.100087-1-dianders@chromium.or=
g/

> but since that was rejected, how do we deal with this generally?

> In the above thread Doug mentioned adding support for load requests to
> further drivers and Bjorn mentioned working around it by adding
> regulator-system-load properties to DT.

> It seems quite likely that changes like this one affects other systems
> too, and the effects may be hard to debug. So a more general solution
> than playing whack-a-mole using DT would be good to have.

You could add a way to specify constant base loads in DT on either a per
regulator or per consumer basis.

--1DJx7/60zQ9pOY6w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZNnYACgkQJNaLcl1U
h9C5rgf+MVZe9YmzqkRT4LQel+SV9Vlj1VQpA/dU9mHnpj8r4rEbG0pOqIYr4o6R
cpJPULleczotUgkT2/yF9qKYsAo51HFenpTc3/AAkYqAueTjgHOsZo2RyPs2adr4
DRthG2aRurta36wS8dtMtJqCUNOCOjwSCFJYklfpimdxz/7rMeR3U0z3FKHEcKAR
9EC0r+4Os8oAt4uh/+/fSpZJ3xiPh1J9t9dv8KEop9+ZEbUEz1rAYsZzWLZQi8b1
Sr737G8A0w+5xNdU/Ao00SsEeYU3u+is1wBQmcZGFVt+nvlf0bBYcsMv5pnUHJQ+
RSty8G6tyVlasuFBEcnGC3CnQZ1hjQ==
=jWVX
-----END PGP SIGNATURE-----

--1DJx7/60zQ9pOY6w--
