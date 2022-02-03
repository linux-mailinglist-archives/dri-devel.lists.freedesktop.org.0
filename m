Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE74A8747
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:09:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C3E10E549;
	Thu,  3 Feb 2022 15:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BE510E549
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:08:59 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E0B585C019A;
 Thu,  3 Feb 2022 10:08:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 03 Feb 2022 10:08:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=mDnQ/PY0o2JU+m4YSV8vnSuIKv0TD3zMJ07m+H
 b+PmM=; b=qjdxE9FpF2rMnoBxm78yf7II2AA4QdGfMKXAubP/7mifn8pj98U6dW
 o9ABH4SR5imE9f/RliYXF5tk9nbVilucy91nkV9ElA8F3MfpCRWYDTmtunZYPp3m
 +6sowk0P+RxlhXhrs05ksL79MNelxX41jNLQtdDpcoMsDAumFrFNPF31lmhEAFb+
 NMYDVCaej4sRfEcw4LGFRXJ9ZdKlYGZLtWiukmxI4rK/fbA4RDMdpbHXut+BUeFf
 2pI8kGP1Iwjxbrv19FqLFrB+CZCrgGjFhYIimpeupYJ4nrKpjxZE07M7I6hTjst1
 pCmqyBzasAq49mJdT9s6dPkIo42c6utw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mDnQ/PY0o2JU+m4YS
 V8vnSuIKv0TD3zMJ07m+Hb+PmM=; b=YKjQgs23+c0TOj9GK9FBi5wC1FXuShAB0
 Mok/vX1lZUrAdXKqRNwwkMbKC4S2ALIBemGSS24l2OtddzTNGOiaiAEbJczI+NXW
 qqDouVDboNlpR1a0DmKR55hdvwyZbOONuLlf8zx77qtz83lDcOrlJJmbdrFr9qL8
 GRLoXZ/aTp1YeOcWysVryBL/2G/s6szk3AXg3jmJw2ulkwBYaK8mXpRyRFbJdDcj
 9tpdk2Vinal4dRgroxlBwgh/gfFZNVkdlTCei7vwZ92e6KBplouiuGHTH6b+H3+z
 aMgE15WVlYaIymn0m0i6Rgzu/CmGqu9NkYrBLvgu/3CnQtUUuUfog==
X-ME-Sender: <xms:CvD7YbNwaR7I9vjWfvR4TRfDmQaXmeXK1p8yJCfwdiTffcAyD67xYQ>
 <xme:CvD7YV_qHxU_fjMVC-uNjzM0FRwH_9ymsUHBMejypuj9eEHJzi92zSv_IpXXizFex
 YhOkm2o5yBRZ1Y8oOo>
X-ME-Received: <xmr:CvD7YaR8HBTudS1ZYGsMUv0edG-GeRsVipImUmAQJR2WplohFkQaOWVyPdCo9r69SKgMGOH6Pf-J3E564XGPWbzlFxJBuPcROTR24uE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CvD7YfvVL4x9mbkEE5oMl5sP7t6iSPO3GkjOY4VhNGySAsunhjtrWw>
 <xmx:CvD7YTdiRdREh4CWlAXAcPvLDXU1OdVHawODNFEth7aq_tU4Va5B1A>
 <xmx:CvD7Yb3XYnXFEz7heAsa_1bs-5wbe96DakyAAPHJ8zwc3nInoV0lLQ>
 <xmx:CvD7YVvKZGLvcl5vStsTB_jatqfZbPUl8V-d_N0kpKBk5dvaQ7nJvw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 10:08:58 -0500 (EST)
Date: Thu, 3 Feb 2022 16:08:56 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: Unregister codec device on unbind
Message-ID: <20220203150856.e6msilvncdfn6uy3@houat>
References: <20220127111452.222002-1-maxime@cerno.tech>
 <164390079045.1265461.8351141389178744305.b4-ty@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lwmcuc2d2jl37jxp"
Content-Disposition: inline
In-Reply-To: <164390079045.1265461.8351141389178744305.b4-ty@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lwmcuc2d2jl37jxp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 03, 2022 at 04:06:37PM +0100, Maxime Ripard wrote:
> On Thu, 27 Jan 2022 12:14:52 +0100, Maxime Ripard wrote:
> > On bind we will register the HDMI codec device but we don't unregister
> > it on unbind, leading to a device leakage. Unregister our device at
> > unbind.
> >=20
> >=20
>=20
> Applied to drm/drm-misc (drm-misc-fixes).

This one hasn't been reviewed yet, so I dropped it for now

Maxime

--lwmcuc2d2jl37jxp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfvwCAAKCRDj7w1vZxhR
xTHXAQCT2jxbhgX4rxe8WosS9uKlgh/rOz1h2BsZMjL872C2xAD6AuA3sKfMELls
LT9vfRGjdnfQwr87xPepPVVZEKlQpgc=
=JyjW
-----END PGP SIGNATURE-----

--lwmcuc2d2jl37jxp--
