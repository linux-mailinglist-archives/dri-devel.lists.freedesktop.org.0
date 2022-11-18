Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5662F101
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 10:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F4D10E204;
	Fri, 18 Nov 2022 09:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6737010E204
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:21:37 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B52645C0126;
 Fri, 18 Nov 2022 04:21:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 18 Nov 2022 04:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668763296; x=1668849696; bh=e1bmKSL0a2
 chnLF6Av9eaK4PnbBY6Rstx9vF4wBor3w=; b=ax/AJy/KGNPkqY3SovQ49gnLBe
 9Jfjpew08NceTcula/wphXSir6fu5EqXUmOGNn75rkbBBMJ4ffxRMr5ckqHTaqhF
 z8LmswCpJ69iHOpoe0SO4O7QCokk2/X7VWItoZgrxgkg/MibH7qKMnlPgg6eWy/K
 pK26PpM/CtDO7J5IBG2BMKLnR2akCe5eIijfzbjrWfXZEhd6bGkVNfL+a+wlI9Xs
 wV7DeY39LsOsEgtVhKtUKrMboTd9iNMU2tywFxNBUXrY2AYnBOexN+dBMY7h6NrK
 NcpBR4DiJsnpas2noPHdVv7sk4Bbn4knq9mjwlTvFB28vzZUkYsdmQYCi0Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668763296; x=1668849696; bh=e1bmKSL0a2chnLF6Av9eaK4PnbBY
 6Rstx9vF4wBor3w=; b=QyMUy/Fkyh51ZloeA7KquIak9lsOhpKtoR+FH94AJc3G
 rk6qEEVeRpKo+iFwiDO10cFGZGSxHuczkz0nCMbrQrFVldl8vGpLl6FDk2cv/GpS
 enYwYkWRPFiTo2nikRiItHRhKQtpQgPn1zUHBthvXTj43TtWyy26wxmW/2Ac4AJ/
 LuvRocyA6HEnqQVSshCPacVwNOHmli5i5MV2f2SABop5h9+SFS9XYfZcUIhHwVkC
 65s04OFpLltFl+AGHPK3e8rs3dBz/sS4BBZNsLdUPkC5Sizno9EkSQQG86enMqrZ
 pnLtAPgJtDN52eRc/Xm7KSEWDHSk5kIz2Z+GE+oQYQ==
X-ME-Sender: <xms:oE53Yz1ipxfstQo02sOVJpFmbgC297uM-FFfl4qTeVedpcKmmpbObA>
 <xme:oE53YyG-uTLKIW9sqVTgnuErr3g4-FAqInXA5cLyeOdegBmKIAY5adVWmGZDfFckv
 354RaAPjHPsa_R8PFs>
X-ME-Received: <xmr:oE53Yz7ys1W1Cfua4DlPl2_VPAuO-1NmxZtH2Vm-PiDuXlef5ijf7f8BmygII2R2TMGDDLWvRT9lnPKJ9E2BcvUM1bZRmQegZnGdaXJ9P9Apaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrhedtgddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeevfeehfeekieffgeevleevtefgffefkedtfeeuhfettdegjeehgfegudff
 ffdunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oE53Y41ETYNuECRhxLcWFscqvFSRer2d6CXwWnkclLNmqIY9tLhDvw>
 <xmx:oE53Y2GivAeQDBhgpBx9xJP1lC8r8oDRs41nL8LyaIobTyipTESWKg>
 <xmx:oE53Y5_lhhU5nAQ6ZAc4LWY-wwNIu3ZrN1K4EKJNumbqDEL5-l9Ksw>
 <xmx:oE53Y--OhPTg81PNgqIsaWBUtuineE8SUavIT9QP9xCu9ROR1UhEFw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Nov 2022 04:21:35 -0500 (EST)
Date: Fri, 18 Nov 2022 10:21:33 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH 2/2] drm/tests: helpers: Add SPDX header
Message-ID: <20221118092133.ip52btf5j22rbcu5@houat>
References: <20221116151833.1679379-1-maxime@cerno.tech>
 <20221116151833.1679379-2-maxime@cerno.tech>
 <60f8860b-8a95-9c91-fcea-1b98b1b6c941@riseup.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g4krc4kzu2rkjksa"
Content-Disposition: inline
In-Reply-To: <60f8860b-8a95-9c91-fcea-1b98b1b6c941@riseup.net>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--g4krc4kzu2rkjksa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maira,

On Wed, Nov 16, 2022 at 01:48:13PM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 11/16/22 12:18, Maxime Ripard wrote:
> > The SPDX header is missing, let's add it and fix the corresponding
> > checkpatch warning.
> >=20
> > Suggested-by: Ma=EDra Canal <mairacanal@riseup.net>
> > Fixes: 44a3928324e9 ("drm/tests: Add Kunit Helpers")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Could you add the SPDX-License-Identifier tag on the header file as
> well? With the SPDX header on both files, this is:
>=20
> Reviewed-by: Ma=EDra Canal <mairacanal@riseup.net>

I applied those patches yesterday, with the fix you suggested

Thanks!
Maxime

--g4krc4kzu2rkjksa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY3dOnQAKCRDj7w1vZxhR
xXFnAQCDGyKuHOZWhGX+AyGCRBMInjv+8Kn3Q7jGnFf9rDtNEQEA2Ivgdb2UDnxu
flfVn4RcqxILk/ZgCmLfM1PQH8HLigw=
=Aekk
-----END PGP SIGNATURE-----

--g4krc4kzu2rkjksa--
