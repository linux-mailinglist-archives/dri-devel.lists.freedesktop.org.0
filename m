Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E64C4A2D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 17:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CC510E3A8;
	Fri, 25 Feb 2022 16:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97A710E3A8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 16:11:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C5F9C5C00B1;
 Fri, 25 Feb 2022 11:11:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 11:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=0PmyrfGkA8aPADVu/QZsGBb1cYhltTzjdBFg0O
 0bSMQ=; b=No5hkw1p3fsRS3najbiBNgtRtb2pza8oxH8uzgfuZZs8anghwrObrq
 gLZt89TsHpu3HyCT3y7OCMS9+ldCk+zBIUz44d974XLy4LKsOfv17enmdyXsG0o7
 v0VyIHDntvFxAn1EYjClw9I2B5CIFNuRBVbjAZkdVc8rob2YuUBce7Zeay0yj7ql
 K9iUEOlRlaUITY8wYnB2YjqxAUWcjNpFBhO3z0ZUfrPyQCz/PGiC+pMbmSfo2e0d
 +gbP5oSu8FhPD1EUdPzEHQLAXCovTwEIZBDHYkNf3RWrTdpSRT3RogO6uwQm4SZA
 SWRS80EKPSyS7Xxie7TVDOMfWPnpmgGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0PmyrfGkA8aPADVu/
 QZsGBb1cYhltTzjdBFg0O0bSMQ=; b=Eq0G+l6rHKQzRwrtvpNPp6VrDyrDUIloq
 e2tatrQMfUPQRgsjIC1DmYqpMluXdseJfULm1RdpJEAJkfdooYVzDXieIIZ3opJC
 N2D03L/BB+56uKdC/yZme6INmulecsyzxAN6anf2VdNoQwIx0NPrRdImHx5aF+n2
 IMNfsK+Kx86kgPkw7Gr3uuym0kSY/l/wwSoySdcGcK/wyd1h9DXmvdXnPPHtnqfl
 35GtPw1Byivp3q2k1Uywd3ZQJQIHYb184NjqNxJGcZe49Rxz8iWnM6EffKk0gtWK
 iU6YW4kETfrxjGcD/3KLX85Uw5shCP3ygsvY+uV9CO+1/hU4wKZPw==
X-ME-Sender: <xms:sP8YYtSKJdWavXpgLgop-19qdSq_9S0vGHEdMBBwdcGeAZOlqSCHnQ>
 <xme:sP8YYmywHJc_giWvoyPlVq25n03F9udKsEEU7Mmz0NhctcZWmu7FFmYlxvxyhS74e
 k_4sOnKMeQiRdZVBJg>
X-ME-Received: <xmr:sP8YYi1-qGAwhdNJFy8qAxWoQgtrhyOEvn7h8ivfslu7PCjNtNugbhQy9TXeJnTvfTsbNxdrTwMOdfNTGW8FoL9mUvE57NVMO7wW3D4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sP8YYlCTeSVBgzn9vcUiDLB1u4FGQuu4_IAn8YDu1oDhzERfjiEcPw>
 <xmx:sP8YYmhdIZm7ZVxViIT184vORIY3X8t2SB4q9HzvBmCIPMA1Hidi0Q>
 <xmx:sP8YYprR5vmA-QSrHakYU_DuKsQYsInf3sIeCf92tvo2sKFTPVCtZQ>
 <xmx:sf8YYnsQ2mnnGP8svdIa2ByxfQE-8FJRHfUM-AmhZsmcowWDFAGdog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 11:11:28 -0500 (EST)
Date: Fri, 25 Feb 2022 17:11:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH] drm/vc4: add tracepoints for CL submissions
Message-ID: <20220225161126.6n7puj5p7saf57u4@houat>
References: <20220201212651.zhltjmaokisffq3x@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xdxwurmw72eps23l"
Content-Disposition: inline
In-Reply-To: <20220201212651.zhltjmaokisffq3x@mail.igalia.com>
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
Cc: David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xdxwurmw72eps23l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Melissa,

On Tue, Feb 01, 2022 at 08:26:51PM -0100, Melissa Wen wrote:
> Trace submit_cl_ioctl and related IRQs for CL submission and bin/render
> jobs execution. It might be helpful to get a rendering timeline and
> track job throttling.
>=20
> Signed-off-by: Melissa Wen <mwen@igalia.com>

I'm not really sure what to do about this patch to be honest.

My understanding is that tracepoints are considered as userspace ABI,
but I can't really judge whether your traces are good enough or if it's
something that will bit us some time down the road.

Emma, Daniel, David, any insight?

Thanks,
Maxime

--xdxwurmw72eps23l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhj/rQAKCRDj7w1vZxhR
xa2NAP9SfQYF36TkGmHSwaCHoTDhEfh+KCgZ6hgjiWnSRE0n5AEAsN6dY+zvc17q
X985Kjai6MyuKnu08X1fd/9Q1f+q7gA=
=wWEK
-----END PGP SIGNATURE-----

--xdxwurmw72eps23l--
