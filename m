Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEB660FB02
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 16:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D776D10E66A;
	Thu, 27 Oct 2022 14:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7741410E66A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 14:59:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 6B3722B06707;
 Thu, 27 Oct 2022 10:59:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 27 Oct 2022 10:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666882757; x=1666889957; bh=RBYg14WquA
 PHO/Rvaf3mTJVgsKomhCcikCm0o/kyeuc=; b=DbGdbbEesCm6HcSxGbiUGf4LrZ
 JFOTDM9ZZfs8ntNhmmL2vI2nupEeFoCVR1BNRYOzvGfl3BZOAjfHLOeUEJqOXW6R
 OyftBrAf0Sjq/1noT9ruXh59zwouLIOwxyW9ouybD/4Nb9L1kuFFb8z6hfVZcMOW
 wA7WZSKGiYYkdyPs2odTjKn6SjtjKMlz+Fntk/zSIlk4/kcYb3QH8zuAzlf2leCS
 avPYOlgrgCN/7FFAUrYpwBCv5rYWe2Ow4k83VgWQ+1KgUpgz5ahkyVBsPhtApb/y
 1kIN6MeXQfN5cTlq4e2F6xQiOy8bE8E0dvwmtiWAigcFwaKK6vEUapXeWvRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666882757; x=1666889957; bh=RBYg14WquAPHO/Rvaf3mTJVgsKom
 hCcikCm0o/kyeuc=; b=BGhZy5mKL4NscqkA2CWhJUrbfW+7npBleCTrrcdxztrg
 P6zjj7o5wmlumnjdv5ieEgYoAUkKirlS8m93J3egAhxOoJvNFzRFQ/41STgIxyg7
 Y8mNDMdHcaKXP6mVw3zFhYOWlphEbrxg6BiSeHY3aGOApBn5mSg3+PA6bRWxNItU
 ijLzwm9lQ9JUStc53/yig5XvLnIf/46ufasGD7hAjlrtpoHRV6+SS17fG0IkqCm2
 jwsBshPzeJWImaqLNIv/ksfzHomiNB9ebR9u/hA8sOtQAaYP9l8pnSeSPk9wAOck
 fupy8ANDeBtO/hqwrvCUC7sr+Qe/ex5RZV0K5O879A==
X-ME-Sender: <xms:xJxaY4vs5M-2rzbsRzUANgEZO9Wwl6iOOcAscoaVYyT6pCrWoPvozQ>
 <xme:xJxaY1e1FxMzRR9nlodW01PophtLdnOFmLoEPf6njzjWLdkurDbj9bRxkSLl8EMBG
 dVq2ATu0KLjGtPk8rU>
X-ME-Received: <xmr:xJxaYzy4mAOCrZI4WL2ORVZRuz2bqDrW-2gsg-2mhhOT5I6cpUsI9_2Cs9IaYvlpGt1tKERSDSH1MgZhUTQVkcMQpowljNdvuovndqbvLVia7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptdelkeejiedufedvhfeiffetlefhiedvleeigfeiuefghfdvleeiffejieeg
 teejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xJxaY7PFv-GaMML4cVmBwXq8ns331c7_nRwKvYxD_vG0pcIf9NwMaQ>
 <xmx:xJxaY4_DjSE-1IdS3065TNQlEpoBrNT7mJ1D-MXBn-Nti7RfDEuyBg>
 <xmx:xJxaYzVayXG1srQ_vDIMoGt-fMiqaXlHiFu-W7gFUSB0KzOUibHpgQ>
 <xmx:xZxaYx3DcVB2OJ9_cDFXUfU9sWnvA0xfG_-2pnvvTZEzhyCOilOvKNhIzxQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 10:59:16 -0400 (EDT)
Date: Thu, 27 Oct 2022 16:59:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v5 0/7] drm/vc4: Fix the core clock behaviour
Message-ID: <20221027145914.jv7krzw6fomffyai@houat>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bcitvyeml2o7kure"
Content-Disposition: inline
In-Reply-To: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Emma Anholt <emma@anholt.net>,
 Scott Branden <sbranden@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bcitvyeml2o7kure
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Florian,

On Thu, Oct 27, 2022 at 02:52:40PM +0200, Maxime Ripard wrote:
> Hi,
>=20
> Those patches used to be part of a larger clock fixes series:
> https://lore.kernel.org/linux-clk/20220715160014.2623107-1-maxime@cerno.t=
ech/
>=20
> However, that series doesn't seem to be getting anywhere, so I've split o=
ut
> these patches that fix a regression that has been there since 5.18 and th=
at
> prevents the 4k output from working on the RaspberryPi4.
>=20
> Hopefully, we will be able to merge those patches through the DRM tree to=
 avoid
> any further disruption.

I intend to get this through drm-misc, but you just gave your
Reviewed-by on all the firmware patches but the first. Are you ok with
this? If so, can I add your Acked-by?

Thanks!
Maxime

--bcitvyeml2o7kure
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1qcwgAKCRDj7w1vZxhR
xRnpAP4mYypO0n/mu6W8PKbkeWkZB8q+mWTx9P/jV3NQOgm4cwD6Aue1CHu2k5RF
QW/IToLJvz8grwPBhwxapcwmbghVKAk=
=/kXP
-----END PGP SIGNATURE-----

--bcitvyeml2o7kure--
