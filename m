Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A06A0FB8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 19:48:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1178310E0CD;
	Thu, 23 Feb 2023 18:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0FD10E056;
 Thu, 23 Feb 2023 18:48:51 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id AD210320097D;
 Thu, 23 Feb 2023 13:48:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 23 Feb 2023 13:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1677178127; x=1677264527; bh=BpYQ/oNHui
 kb98jCNEtNQWYMqBRN0mOzyY1zSw9A/3g=; b=Xggmm49AJArmMI0ra/GpcMzSH3
 hQforTjfLUMLyHlMzOgjLZzo9wheMboqfZ+RWTWr/NfIuZWeiBuGoSLiAhE9ht72
 li3a9FTp0xe4Q3lEfpeCx6rY4jziUm/MkR6ijB1UbRyzGhtcoRacfIrgIwSlO7nf
 mwPambK7Roup87CmnyT244u4p7qgq/ujE8I83jUqhIlfM29DawnhTH6zm2LaxjrE
 raZyVVIy+r8jN6RokvzA+XKeLd9ErX2PsXz0Pr0Flpl3BNpRgZU08A84nAoFXY+w
 CM6vvUrF838IHMCwx5z/n1fLMY0n31soKJtWjV0qu+4ug750sLXZpTkkxtjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677178127; x=1677264527; bh=BpYQ/oNHuikb98jCNEtNQWYMqBRN
 0mOzyY1zSw9A/3g=; b=X19F0GdBfNG6n7LDLHicN3trSdDueA8btQNYLMoENFMe
 wBihD3iKnJyHEiGztB+RCSddMoln3V1a9yshi5GyyRalVthqune9l17nIMGaQH/d
 Z4Xgwfz6ZKey8YP65CXET8Lgn2ZP5ywudE8UspWbmkWVBhKlQaFLwQhIWOZqPMcJ
 9qrRf7Y9BbK6fm+KJ0nU4fjQqyZI3vRSR56BtF/XN/oFHZxC1H2IelhId5a1sCgS
 7ZYruGghfsC8ktrXRxpBQErP7ig7CgSR3BwOu19wFqAoYYVH7qJ4lFCmcNRAKhZw
 Ofxq/pfCNG3N91fQI2TDox3rkuFyX1vmQxfcxQmVxg==
X-ME-Sender: <xms:DrX3Y68NPUvQ47SGHfhfgBUK6i9fZ74UxBrtYKdIyByJI2x72yZiRA>
 <xme:DrX3Y6splIoX8iPU5mTwCceIr95iDq-W3TBVKawN4LoA6Eq4ux4lcCsue7NZ1iSNA
 ONTS1YJqCIOVtyu54g>
X-ME-Received: <xmr:DrX3YwC4iclzqnkZauHgH7aoHeuUQuGOtLwlnPfm1hDWLS4VjQ212tnzyL2QBKHcRYLsQ6VZ3UzJizWstQ-Mzz30gIbR9CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DrX3YyfE1m9IWLFNB4697OzZ-PmsOLPp_M-yfjxBnpI3qSHCKJabFg>
 <xmx:DrX3Y_NS5HQ-RJSYpU8FNtWkE5pOwrsOGLPXKxYeaUaUbLH0Qy_kvQ>
 <xmx:DrX3Y8k_qJqoGunNE47kqDi5lZjsPXG15vbMb1sRYnK8u_2vOfpqJA>
 <xmx:D7X3Y6EYtdwaYHCZJap2ACzaCm0vmWFeOXh0ibG1aMT1hOU_V9XBRQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 13:48:45 -0500 (EST)
Date: Thu, 23 Feb 2023 19:48:43 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PULL] drm-misc-next-fixes
Message-ID: <20230223184843.7lkgilnk7kguax2e@houat>
References: <407a36f9-9f12-127e-a0e7-a17a1e8f3e79@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r5bqapkm7bp63h5r"
Content-Disposition: inline
In-Reply-To: <407a36f9-9f12-127e-a0e7-a17a1e8f3e79@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r5bqapkm7bp63h5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maarten,

On Thu, Feb 23, 2023 at 07:25:23PM +0100, Maarten Lankhorst wrote:
> Hi Dave and Daniel,
>=20
> Here's the first pull request for v6.4-rc1.
>=20
> Enjoy!
>=20
> ~Maarten
>=20
> drm-misc-next-2023-02-23:
> drm-misc-next for v6.4-rc1:
>=20
> First pull request to keep the delta from growing too big.

This isn't drm-misc-next-fixes but drm-misc-next?

Maxime

--r5bqapkm7bp63h5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/e1CwAKCRDj7w1vZxhR
xUulAQDwAk9ysrfLm2K7GPy12JpYE+ms8CwW9nj1Mn8VDteClgEAxBJ/zGWttWSQ
emUnzLHswjeDqnIDHYbjjeVG6rAIBA4=
=y729
-----END PGP SIGNATURE-----

--r5bqapkm7bp63h5r--
