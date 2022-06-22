Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2A554A1E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 14:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764E011336F;
	Wed, 22 Jun 2022 12:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF67B11336F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 12:36:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 360C732002D8;
 Wed, 22 Jun 2022 08:36:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 08:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655901415; x=1655987815; bh=/EyEhmHPvl
 fIGUHyns9Z0JfMJBToq3cW9JR1a2Pk53Q=; b=ek0y5Uxs9/UekEqbtMT3fIwfWh
 BbJsI86ouGcae6/ESRfqF32KcyafNfnmqTLdzHxKtSGAQBUeIj5pm5k35T+IzXgG
 7vt7+U06s7Jfx5z9YaLnW8i9587ymtSGnDA4Pw2IeuY+SdpdHOWNgDZWCDwNag0k
 2Cq7S/mwmHVdRw58ZBn9+oC/G49t+aVk61M+1nVZBcBlMw7TVAUPZMrgSYXxse70
 vB64bYR3vUobjMJsXWfTkwueW6znOTLRfv54fc3N6vjSg+xUeKH+jxCJ0nhMjYPG
 BccEEPICgWJ3sdnZtN4sl3Fi8eAeutOznJKsI8zI2CflK0bOwFZiwO6pvZBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655901415; x=1655987815; bh=/EyEhmHPvlfIGUHyns9Z0JfMJBTo
 q3cW9JR1a2Pk53Q=; b=Mc8BCPqBXBglKe/dwsRdQMr9ozTJ3ctp1L6xsT8qHSrs
 Y/iw/FixaIH7panshVZcQUPUMN0/j8o1Y4T57FMt9J6QCIZNBH7EacykaJZBdyjT
 oMlFgTB0BHc++CABBcJNu5NRjeYHyj21Xh5sUmd0Crl0slRl3ruBtOzDhcmt6z1k
 NYHsm6LWKFGo4gLkegqMkWT++PFx1BBWoz2PXcA0FWePDxFaS9LspWKeoh8W/JwM
 wCtW9IJHr3RSoUKAdtu9i0jrIwUqjuvFKgrAFim1Ba2HYIdRawZ95wVJcKZrjXq1
 DXDfB5SCX96C1L5iSHeD/T1xox7qLGDKtPnqWKXFQg==
X-ME-Sender: <xms:5wyzYjbmeoFup3Tx9pLKKWktASQ2Pz2qZsL7WaaCN17pKUEl4COUhw>
 <xme:5wyzYial5uE1UZo7GIEoIkmfMarOZ4xIvdC9PrfQOFejSd_2-NHyxuqTMIdLpa4Ab
 sbhQak9_5hL-rOkVuo>
X-ME-Received: <xmr:5wyzYl_N_JFfAoNVvh00Hv7KiGPdAnr4HJmCHcnl-WIUXiXRSe5Jd2hrXYbTa9duNydyBBpqK5lADrVVbpMQC4j4v1c72yoFRLbgfX8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5wyzYpo3nkO8GJB2mi629vEZA1hC5raIpC9AJkTlBDygA4A0kodDHg>
 <xmx:5wyzYurMjfq2AeERDAsCY0L3MaGPVKauRvkzXvAKOCxRb4jqHssOdg>
 <xmx:5wyzYvQXGWmM_ljsfKZqxZCb59vf516X_bvC2kvIUlGbLP49GxB9Yw>
 <xmx:5wyzYl3NKQ9M0cU_CYMHuIlS4GaXEH53qI_qD_nycOLrvKPRExWaeg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 08:36:54 -0400 (EDT)
Date: Wed, 22 Jun 2022 14:36:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
Message-ID: <20220622123652.4d6nvaj453szyd4m@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
 <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
 <20220620134823.oqjrbnlsce3erhum@houat>
 <92f5306c-3808-b140-4845-f744df4c92fc@suse.de>
 <20220620143928.zbbaltwcah3rpkqh@houat>
 <1817bb52-268d-9ed9-b7b3-4bbb291b7925@suse.de>
 <295ada80-6846-db1e-6e15-01e06ffe7d3d@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qazgxj7g6jl5klyt"
Content-Disposition: inline
In-Reply-To: <295ada80-6846-db1e-6e15-01e06ffe7d3d@suse.de>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qazgxj7g6jl5klyt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2022 at 09:04:11PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 20.06.22 um 16:45 schrieb Thomas Zimmermann:
> > Hi
> >=20
> > Am 20.06.22 um 16:39 schrieb Maxime Ripard:
> > > On Mon, Jun 20, 2022 at 04:25:38PM +0200, Thomas Zimmermann wrote:
> > > > Hi
> > > >=20
> > > > Am 20.06.22 um 15:48 schrieb Maxime Ripard:
> > > > > Hi,
> > > > >=20
> > > > > On Mon, Jun 20, 2022 at 12:44:24PM +0200, Thomas Zimmermann wrote:
> > > > > > Am 10.06.22 um 11:28 schrieb Maxime Ripard:
> > > > > > > The DRM-managed function to register an encoder is
> > > > > > > drmm_simple_encoder_alloc() and its variants, which will allo=
cate the
> > > > > > > underlying structure and initialisation the encoder.
> > > > > > >=20
> > > > > > > However, we might want to separate the structure
> > > > > > > creation and the encoder
> > > > > > > initialisation, for example if the structure is
> > > > > > > shared across multiple DRM
> > > > > > > entities, for example an encoder and a connector.
> > > > > > >=20
> > > > > > > Let's create an helper to only initialise an encoder
> > > > > > > that would be passed
> > > > > > > as an argument.
> > > > > > >=20
> > > > > >=20
> > > > > > There's nothing wrong with this patch, but I have to admit that=
 adding
> > > > > > drm_simple_encoder_init() et al was a mistake.
> > > > >=20
> > > > > Why do you think it was a mistake?
> > > >=20
> > > > The simple-encoder stuff is an interface that no one really
> > > > needs. Compared
> > > > to open-coding the function, it's barely an improvement in LOCs,
> > > > but nothing
> > > > else.
> > > >=20
> > > > Back when I added drm_simple_encoder_init(), I wanted to
> > > > simplify the many
> > > > drivers that initialized the encoder with a cleanup callback and no=
thing
> > > > else.=A0 IIRC it was an improvement back then.=A0 But now we alread=
y have a
> > > > related drmm_ helper and a drmm_alloc_ helper. If I had only
> > > > added the macro
> > > > back then, we could use the regular encoder helpers.
> > > >=20
> > > > >=20
> > > > > > It would have been better to add an initializer macro like
> > > > > >=20
> > > > > > #define DRM_STATIC_ENCODER_DEFAULT_FUNCS \
> > > > > > =A0=A0=A0 .destroy =3D drm_encoder_cleanup
> > > > > >=20
> > > > > > It's way more flexible and similarly easy to use. Anyway...
> > > > >=20
> > > > > We can still have this. It would simplify this series so I could
> > > > > definitely squeeze that patch in and add a TODO item / deprecation
> > > > > notice for simple encoders if you think it's needed
> > > >=20
> > > > Not necessary. It's not super important.
> > >=20
> > > The corollary is though :)
> > >=20
> > > If I understand you right, it means that you'd rather have a destroy
> > > callback everywhere instead of calling the _cleanup function through a
> > > drm-managed callback, and let drm_dev_unregister do its job?
> > >=20
> > > If so, it means that we shouldn't be following the drmm_.*_alloc
> > > functions and should drop all the new ones from this series.
> >=20
> > No, no. What I'm saying is that simple-encoder is a pointless mid-layer.
> > There's nothing that couldn't easily be achieved with the regular
> > encoder functions.
>=20
> I guess that if you want to change something here, you could add
> drmm_encoder_init() instead and convert vc4. That function might be more
> useful for other drivers in the long run.

I already had that patch in the series. I've dropped this one and
converted everyone to a !simple encoder.

Thanks!
maxime

--qazgxj7g6jl5klyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYrMM5AAKCRDj7w1vZxhR
xVuuAP4sSRGkjZUXl37xiYS/twZ/TuavlM/01iZq4Pd3xHjOwwD8C+fgR1k0uNWJ
LKY1p+BgNU9EAykIDpNfBBnNo310eQw=
=Ni8I
-----END PGP SIGNATURE-----

--qazgxj7g6jl5klyt--
