Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE2E4CA1AB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEA310F33D;
	Wed,  2 Mar 2022 10:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C697B10F33D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:03:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 281855C0400;
 Wed,  2 Mar 2022 05:03:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 02 Mar 2022 05:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=pVulkV/Oqq1PP/FHdGdDl/UEAHszoco4gyMzlN
 kE4rU=; b=mAZX2G0ItbBFftNBTi3U+GtcL3OGEhX5W6EIDr2yIwsJx0gdD61ccp
 IfBOC31k+mgKU8D8V8mAU57Zq2H1snFpXoVXPUhBEKS6FaInNxeGRX/A7mTL1Nxn
 XoQAskJFzoM0CsC3/+06/aHCXFEZqYh2V32dwCLQSV++XaMf4V5iu0eWQeQzRLF5
 lmdWeNaNvuaOz7qcN9W72tMx4e0TjMIWBr3IvqK2osacE/1Lo5/sbiCH2k8olqpW
 oUKDur/drS+CaAwS5nZalb4mGEtekfWnGxfItcTJ2ULRjk3QVXP2vC/+/uH2OMe3
 I52OOGdM6HVJbDZh4eFU5dQ8g8HMZb+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pVulkV/Oqq1PP/FHd
 GdDl/UEAHszoco4gyMzlNkE4rU=; b=AicfwBFhRYWYvT2oJPwUgTaE6Iei8NgMC
 s3gSZZZ6S9iGWlQ4NAakQzMvMTNvNfPLI125TawOCvtj4mF+p5qoWloS3pDcKgvI
 h3oUIm5q+9GO5ykkx67VmathY6Y5JGZ0/eq0naQLoVtWwrc9DPUsH+xQS3bJ6NaK
 vs2uDajz1l2d467KOf/fPTqLq/vjjdsD7x0JvSY7SXoWye/+oqBckwCAzpUvjcoq
 OU+4CSVyaplIdJfsGx7+82pKcbvy5uVPNEOeZbx+gWFymY3rl08+sgjA0ZaiT/S2
 g9UzC9MIfxTLjC6AeMdV+2rX5WeuEaUmLVgDJuXhFBsTiXHNR0Fkg==
X-ME-Sender: <xms:DUEfYoLxxO3EelCxMvMHRzNKQBeURIJflPkFt4Bh7EhTgevBBbUQsQ>
 <xme:DUEfYoK8o9WjKEpNcbyehj3i1XuWzvSS-egTG8meAn0nBtmDKyOnGIQx5y_cUh6sz
 aE5ehgqouUCvO2lkIQ>
X-ME-Received: <xmr:DUEfYotnTI2Smpd5tXxWGd0nFYwPnbC1l4oi8vQq_CO78nhUo_NLw-bXvRFYw32aVeLkHujD8YBG6OE5898qYqcul_3R-k2ec7VXPhE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DkEfYlZklhHVMroB4hCKJSSVMfhKnw6q_I0tE1YG4BEMEFZPa4OOWg>
 <xmx:DkEfYvbAuepjrvtBpmz_E2XrlAjytFYLouGFmp9H9p3JY037smACjA>
 <xmx:DkEfYhDJIoxHJePet0stMp_vQ6e1XldOVUrlxKTqW_xaQZRUwg1yUg>
 <xmx:DkEfYuUwKwZczwvc445LT9nvKUIGGHeu08fqvDNHeNQZLjVuzOAtjA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 05:03:57 -0500 (EST)
Date: Wed, 2 Mar 2022 11:03:56 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 06/12] drm: bridge: icn6211: Use DSI burst mode
 without EoT and with LP command mode
Message-ID: <20220302100356.ghssk3wfbvts7mxp@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-7-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vmaepo7cjgm4axox"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-7-marex@denx.de>
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


--vmaepo7cjgm4axox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:24AM +0100, Marek Vasut wrote:
> The DSI burst mode is more energy efficient than the DSI sync pulse mode,
> make use of the burst mode since the chip supports it as well. Disable the
> generation of EoT packet, the chip ignores it, so no point in emitting it.
> Enable transmission of data in LP mode, otherwise register read via DSI
> does not work with this chip.
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

--vmaepo7cjgm4axox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh9BDAAKCRDj7w1vZxhR
xae3APiJMRd33uhzDJ8hEv0brb55SaIRhE8P4Ku93zXOQdVrAQC+wJjcyUvNR6Sa
TjUFV1dTBM/G2GMQxvgHy/9b3a5xDw==
=vEyy
-----END PGP SIGNATURE-----

--vmaepo7cjgm4axox--
