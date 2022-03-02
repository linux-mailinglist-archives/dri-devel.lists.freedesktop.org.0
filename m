Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0512D4CA1CE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FDA10F352;
	Wed,  2 Mar 2022 10:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8AC10F350
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:07:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EE6CA5C0426;
 Wed,  2 Mar 2022 05:07:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 02 Mar 2022 05:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=cXy0GhQkRXbILrGG5zp2ku77HYmSdiDu85xeXR
 g+Pd8=; b=LFAQ1M5YZMNb+AhgS70czm2ZNYEkPdNEzyXFD9+RGcSQETfJFK4NJC
 rlU0JWAyYDRMl3e+Wjijf/mSXa8XbKWTDG+2eH3nJuHK0dhFlzpBCMe4Plm8F+bK
 m97N8/S1xZBxf+DZT2vzu6y8WeLrL5h7vL0aUe5i1gmn8D459OtV64Xcm34zWw23
 MnxiC9EoG8ms4OVVCY27exCDgD4/KU162bpHw/vIDjzYeYira4TrKCb60sceNwZE
 3xkDyPk6/pLOV/5nF44w87E2C0Z9LjmDe5nWPPNNfP2DUO3wzO6XbnRHRzxU1JHk
 9hvd/a8scl/eYG5PSRRpmFBnGpRPoiSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cXy0GhQkRXbILrGG5
 zp2ku77HYmSdiDu85xeXRg+Pd8=; b=jnBT2+8Z/9UWJ58FK31jL9PgVetOhRAY3
 4biSKhKbjZPLidvQonRBcj8ewp1ct0UxoHrRVHLdJ+WvJ/WqYFiVriEJEM7ANfb4
 kAJA3RSzzNTNpuL/5dq2h3XXoVSmtXG9jK70xJg99UsN5acGZ00Vx2Y6qMnkeT3f
 lPL+aJdXZ5zp/nJ8x2DvZjFis7/N2zWyyymBJPg2NPDCis5zRGVHqRrXESaK2C4z
 jNFSRGaQVGr0ValJLCxKn9A7eXTUzlLh5RxDRa7mx5bdvxUgmpGN/qnHOyNZWqIh
 nJo4/EEXPwCPqPRk3kWlgAlelvl7Jf064qHUUYovrKZ+x4OoBq84Q==
X-ME-Sender: <xms:xkEfYvW4Hy6_-TcFQWiP7QJUjqCM39rcb5KJYwQ8n8JmYhqymtJDbQ>
 <xme:xkEfYnn6f2NUqt53MAPqvyT3RVCNnuZZa-myfzaiTHD09ifIl0fOEOTEpomJR5p4L
 G2wJtvcY5ZDkNI4LDs>
X-ME-Received: <xmr:xkEfYrazciVdacfCBjOQueTqfkLoF0Z6EQgTQkoorQVp80A1xeyQRMYuMghcEYpVFAx0wEhJLHfYAVwkIxJ503t4O-RvZQjWxEeD7gY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xkEfYqV098PfR8DmDse-aBzXAbB8Kzk73n2sRBRWpvh37hVrosBgnw>
 <xmx:xkEfYpmsiJ1iZ7V-4topN8rIpgAgCVveaznu1KFM-QIA_1IWppVGPw>
 <xmx:xkEfYnePNSq9uwt5ty7J_SuKO68Klm6tBo_K0OjzYl7hHvK5eGsRWQ>
 <xmx:xkEfYiC1ylQ4OScDP3sXX5Q06EK0cZIGVAtxZzDd48YnWYTcRRrSrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 05:07:02 -0500 (EST)
Date: Wed, 2 Mar 2022 11:07:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 10/12] drm: bridge: icn6211: Add I2C configuration
 support
Message-ID: <20220302100700.3k2ppfdowxu5unsm@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-11-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="726oj4fh5mir3izy"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-11-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--726oj4fh5mir3izy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:28AM +0100, Marek Vasut wrote:
> The ICN6211 chip starts in I2C configuration mode after cold boot.
> Implement support for configuring the chip via I2C in addition to
> the current DSI LP command mode configuration support. The later
> seems to be available only on chips which have additional MCU on
> the panel/bridge board which preconfigures the ICN6211, while the
> I2C configuration mode added by this patch does not require any
> such MCU.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--726oj4fh5mir3izy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh9BxAAKCRDj7w1vZxhR
xbf0AQDKaLqakSGSIIdOSW4QO3kMZJnf9XE3XRXoRtbHl6NyHgEAmafG4VpofkZo
/+64R+R1o2ynQTDalm1vrSXpPjZMug8=
=kLTQ
-----END PGP SIGNATURE-----

--726oj4fh5mir3izy--
