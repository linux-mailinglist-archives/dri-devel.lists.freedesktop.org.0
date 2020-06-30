Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43B210487
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05196E7D0;
	Wed,  1 Jul 2020 07:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515989AF3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 08:25:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 388487F8;
 Tue, 30 Jun 2020 04:25:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 Jun 2020 04:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=93ebSxQIAB/Yiarpi/LzBGI2pSh
 Q5+igEhkB54WEe2Y=; b=RHXDNlGxBiCN7WinLLOITPAGiYCEC7sPvozNg2qk6Kb
 cn4sI3fi8iW0lGm7+CsJpdPmapvVg6Ou3isGHm8TUKDUvUEzNh07aNwrwwms//tH
 C1ZDLDiF4D/dBV0KdHKEmsVjMneBJKIyOcJHE6WcYxQIQ05NL4B+5trQc0/t68Ij
 xU0PWT3DLFIS4qSfNQP/DVJsL2X6NsFmQhFvJWy2PjtjY/u+F5X675s4mb24ccg6
 K/Hg8UPTY852CPTI42lQQwoIMUeEH3gYFqDoSYMxpnWPJZ0ab/jJ3LiWvJk+hjga
 hgD+jHl0ImgTa3++YirIUfzXk48nsMFCZMddIwekAow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=93ebSx
 QIAB/Yiarpi/LzBGI2pShQ5+igEhkB54WEe2Y=; b=b93xSicYm6jBlBjh11pQFc
 78n70DYAnbmlq5gzMb9PkgdwV3GFWfVqDAVamPJ3hf3S93j+pyNFyQX7mV4TL8QV
 sVa1B8fbgOhsNCHkgdPxxLLjvr9iqf8d09EM94vkihOLz9WNlCwLwL+OJm8VmDV5
 RsVmz00JT9UkCBy0kYcHy6CqcJlcdbGEwSK4mBMnEspALYteaHFYp1nX/nvNJqIG
 5piWHAHfJCgY5urodX8ed/dH73rEb8OoeXjlsyvPE3xS5/QM24bCAoqi5rA+dMcx
 IPNr+1jOF55QBpxPejKPnfzTGxGyFgNSwTGwluv2RAPoC7cSjQ+RbVpm5s35wAqA
 ==
X-ME-Sender: <xms:5_b6XhHKJC3UURcgsjBg0-BRYPu31fpufRcoHy7bfE9Ye2JlzGdurg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddtuddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5_b6XmVr15MFYmdKfXV-1IqkzFEvw3gqWddtWAA47cylKytidAgflg>
 <xmx:5_b6XjLQsQuJMjgtmQyonfQPBVO_-YEkGe-yitKL_FEKu6grqQZJuA>
 <xmx:5_b6XnH9vUorFD1-xLVix1Oq3EnCfWqdJ_O7bkbv2s-IOPamH_sHCQ>
 <xmx:5_b6XpLVDFuKHGBktPEtDqQe7CuGQpxVNqg9n71Irq3FL1vrL7bCJw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F065A328005D;
 Tue, 30 Jun 2020 04:25:10 -0400 (EDT)
Date: Tue, 30 Jun 2020 10:25:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 0/9] drm/vc4: Turn the TXP into a CRTC
Message-ID: <20200630082509.puuzneiipalvrxup@gilmour.lan>
References: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0803792628=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0803792628==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xsn4uor3uoermk3h"
Content-Disposition: inline


--xsn4uor3uoermk3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Thu, Jun 11, 2020 at 03:36:45PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> This is another part of the rpi4 HDMI series that got promoted to a
> series of its own to try to reduce the main one.
>=20
> This rework is needed since the bcm2711 used in the rpi4 has a more
> complex routing in the HVS that doesn't allow to use a fairly simple
> mapping like what was used before.
>=20
> Since that mapping affects both the pixelvalves and the TXP, turning the
> TXP into a CRTC just like pixelvalves are allows to deal with the
> mapping in the CRTC states, which turns out to be pretty convenient.
>=20
> Let me know what you think,
> Maxime
>=20
> Changes from v3:
>   - Stripped the patches out of the main HDMI series
>   - Change the bind order of the HVS to avoid a compatible check
>   - Added Eric's tags
>   - Rebased on top of drm-misc-next
>=20
> Maxime Ripard (9):
>   drm/vc4: Reorder the bind order of the devices
>   drm/vc4: crtc: Move HVS setup code to the HVS driver

Could you review those two patches? You haven't reviewed them yet and
it's holding back the rest of the patches.

Thanks!
Maxime

--xsn4uor3uoermk3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXvr25QAKCRDj7w1vZxhR
xWK5AQCC0PlbGFc9DmYVyYPdIVGgYaoiye5z/1pskPGlmr17hAD/eo+lPyeCVSpt
JcdTD981ITVOaQo2zJGTk7dg7fo7Cgk=
=zGmp
-----END PGP SIGNATURE-----

--xsn4uor3uoermk3h--

--===============0803792628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0803792628==--
