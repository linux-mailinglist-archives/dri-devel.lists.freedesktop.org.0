Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2302BBEAD
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269B36E99C;
	Sat, 21 Nov 2020 11:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D447189226
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 13:34:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 50A3058034B;
 Fri, 20 Nov 2020 08:34:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 20 Nov 2020 08:34:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=chtKUnl/3u8rC0lx4l60xkomqPZ
 cjv7pF8lpjJmJf9Y=; b=vFzXxWcCQSi+O4gnXrfm8amDWJtmjT8tSNhEa/a6dN7
 ronoxoSuIM3DHKa+4htjZ9O81eWxEFEmC4x6X4//Dp3nDarMpG8dFKdNkwCI/iWM
 kTWf4p3XhYx31iLO1hMfEoUYMflhdsJ/j9aKaCk2QTjVaDb04m7eJGVbEeAqKSEU
 vEV4ZlCYRvbf0wxFWy12+/PwqP6IqaRyxM20f44fHn8CUy1Ff4RjZtUMYoMXma0e
 W1PQNchi4rD62gswfxfLBSewSrYgLxUeSsX5IerGMwZIOkK9wHJ2Z/dmjgi9a15s
 mr8DzqiDhQj3r7aW2h9BDw88HF8mvw9zYQbnhCRIuww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=chtKUn
 l/3u8rC0lx4l60xkomqPZcjv7pF8lpjJmJf9Y=; b=i+zhjnwuRvGg7Vlxrhj3LY
 o+96TmHZkDiClRW/cS3EbiwH8Zi9ZvxEBLLGUDgt2SANPv7YI1HgbZttNbJncq0y
 hlBq9UrNdQAJvXbfVjAXcNbofoShcX1CAu0TSTQ7w5fvVntKQIZqtH0H4xla3rMm
 vCdFKzzNr6Kb+w89AJcJgYlVqt1JY1St2rBedRymiBJm20c7qzciLL48a4gVQJ2o
 r4lwLjAdMSFipPgDoFJgiDlBLMsga/Qv13T1P7PCC0mnObLI9b6WV0Xh0231Kysp
 hMNGhzVYvNMO0DtSnW6QHx0y9C1YBlpEdQu0NeQDjdMTWMwRcvRXl2egQLfYlc7A
 ==
X-ME-Sender: <xms:3MW3X-JCWWeuOt54zKKwRDkymiYuLUlphAl4yGN0fsaixPgtrM6K_w>
 <xme:3MW3X2KiZh9H10B1W9wi-r3ZacldXdWyzmPvJA-KOl79vxgL2XBK9hR6erBXtcmKg
 bdNQTA0cRrhx4FXlXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3MW3X-uHTzpwQCOrKRRF-h2n4v1ITxjBEzE5XHFyKXGnw2IEPiG9NA>
 <xmx:3MW3XzZtgaOFafA0nteXh-q5dDyFBRZHfATn4mZm1rJH-JiryCxV9A>
 <xmx:3MW3X1bIRaQBb2iL6aSsWtNKXDp7cLmTMQG2t_-VcDloyJ-8-L3HIw>
 <xmx:3sW3X-JaNH14cqT7SVDWMHUrJLbucGt6CdoExyMWEujOY84gXoTxQg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E050D3064AB7;
 Fri, 20 Nov 2020 08:34:19 -0500 (EST)
Date: Fri, 20 Nov 2020 14:34:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/8] drm: Introduce an atomic_commit_setup function
Message-ID: <20201120133418.kllxy5nisjtb5jab@gilmour>
References: <20201113152956.139663-1-maxime@cerno.tech>
 <20201113152956.139663-2-maxime@cerno.tech>
 <20201113210240.GX401619@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20201113210240.GX401619@phenom.ffwll.local>
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1289256727=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1289256727==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5jn2qanica623erz"
Content-Disposition: inline


--5jn2qanica623erz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks for your review

On Fri, Nov 13, 2020 at 10:02:40PM +0100, Daniel Vetter wrote:
> > +	 * is not used by the atomic helpers.
> > +	 *
> > +	 * This function is called at the end of
> > +	 * drm_atomic_helper_setup_commit(), so once the commit has been
> > +	 * properly setup across the generic DRM object states. It allows
> > +	 * drivers to do some additional commit tracking that isn't related t=
o a
> > +	 * CRTC, plane or connector, typically a private object.
> > +	 *
> > +	 * This hook is optional.
> > +	 */
> > +	int (*atomic_commit_setup)(struct drm_atomic_state *state);
>=20
> I think the kerneldoc for drm_private_obj should also explain when it is
> necessary to use this, and when not:
>=20
> - when the private state is a tied to an existing drm object (drm_crtc,
>   drm_plane or drm_crtc) and never moves, then sufficient synchronization
>   is already guaranteed by that superior object. This could even hold
>   when the private object can be e.g. reassigned between planes, but
>   always stays on the same crtc.
>=20
> - if the private state object can be globally reassigned, then
>   drm_crtc_commit synchronization points need to be set up in
>   ->atomic_commit_setup and waited on as the first step in
>   ->atomic_commit_tail

Does the comment added on patch 2 sufficient for you, or would you
extend it / make it clearer?

Maxime

--5jn2qanica623erz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7fF2gAKCRDj7w1vZxhR
xbNEAQDxPzTvtfI2MbE18WUcbpkNsidkBA+s9DzD57vH1XKGPQD/aWPkPGS5kWeU
56kYNTw3Fyz7iUUXFHw6TzwBSTlmRQY=
=1xkB
-----END PGP SIGNATURE-----

--5jn2qanica623erz--

--===============1289256727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1289256727==--
