Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76AA6A41AE
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 13:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F6A10E3F3;
	Mon, 27 Feb 2023 12:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1778C10E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 12:27:51 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 718BE5C0103;
 Mon, 27 Feb 2023 07:27:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 27 Feb 2023 07:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1677500870; x=1677587270; bh=houYKcEj3g
 TxACYECO79HDxxmT8hrFkpXjgbBtH4mBA=; b=n2DN4NAk9uIKoDPdDh8N3C3rVP
 T04AQDhCPYWS3jVkkk/ZYFe0gbwHeCURAyCfFKohqnEJl24VsheSmd73pNaBxA78
 YupSmlj27lBw0Cv/daIxECC0iBnVBe8BBWZf/JJlKaB00xtCZpNYlOhsIJ2VwoM9
 CKLqGZlLDBoIkks43pQmeXtx4rb+Ib6LAYfp1WhPzP2lSmyQaHR5UaD1aHouJeEe
 mG3wiOGm7t/KvSgUUrO/4fqQKK8eGzFHFMG+rHblhsvMXgEwjN9vtZY1Ty0PuZMx
 1Y9zjymeRljHicDLWhnF3TDOvAD88EmJ5yRVijhGW9bR7m7T9GCWoP/Kwqaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677500870; x=1677587270; bh=houYKcEj3gTxACYECO79HDxxmT8h
 rFkpXjgbBtH4mBA=; b=f4QWwDLI9d1swJEmfNULfRpV721nv4P5MfdkM1mEw4+N
 YeO230s6FJwf1+u/jyIFghh6wehhXbrzgHrSi2UFJhT+qUe8ruP1rDimo/ZlfHU3
 eL18Tzp2BHLOxNf67i4jhqus/iA9GP9nyj+qP/O58XJdZUt29uVWq/kpm9HaTren
 ZBdNjfAlUV5Tn48pYTcFket8s5rIa1lE9eEcbpYmHVO3QGF1zHi4VZsOrCPv0M+9
 9UcxSJAh170N2luu6ZXF2kYV29rzv5YGXFsmTx4vQFDZ/LqRhXalfJoP/nl4CVp7
 81FYlxay49ekmKCG0z5JGSevkovCFrdpC8Js7INyqw==
X-ME-Sender: <xms:xqH8Y086TKqMLhUl5R78xuRlXCsZ2-MddIRF0rN1vEavEjhqCb7hWA>
 <xme:xqH8Y8vpoYm8D29nI-Ul2Yj_4clFSmC_uSyVNLk7a3br-640Rj5Ssi-DxPRqSIzA3
 1rwJSzpq1OLCKtUkwg>
X-ME-Received: <xmr:xqH8Y6BFgZoyJk8HGfQogiq-y_UM4meQQOVkCKikgSoitnrqPk0ymj-U3uVitO5-m2a3JGl3wQKrWKTjfTW065WNbQqpE6M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xqH8Y0fR-yGv9qmCojuyeaPqKAeeNSV9QcFkG_Hw2pTzrI9lJQB4Qw>
 <xmx:xqH8Y5Op9XGagsvitxhKRkPHAjaWYxjhNA55AIUIZLKoBdm_ZlYJfA>
 <xmx:xqH8Y-nhXYpmDUi5K45SZ1eXw3pTTMK9guV9UtribOtyXlTIi3zvpg>
 <xmx:xqH8Y6HGtWFrSOivicSI3y-7l_JKzSRjzA91XA4s9rcd82zbrA--ZQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 07:27:49 -0500 (EST)
Date: Mon, 27 Feb 2023 13:27:48 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: remove outdated doc TODO for subconnector property
Message-ID: <20230227122748.6exqwe3eiyd7vkdw@houat>
References: <20230227122522.117580-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lyuy5gebpsita5xn"
Content-Disposition: inline
In-Reply-To: <20230227122522.117580-1-contact@emersion.fr>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lyuy5gebpsita5xn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 12:25:26PM +0000, Simon Ser wrote:
> This is already documented under "standard connector properties".
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--lyuy5gebpsita5xn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/yhxAAKCRDj7w1vZxhR
xXErAP40j9I/76v+YJIhAkbLd4lB//OaqMkyfLHfmB/AoZk3KwD/Z+MENiUkllkp
MSS0jvO9BeZC5HABWt8okJRP3zqfJg8=
=q5pL
-----END PGP SIGNATURE-----

--lyuy5gebpsita5xn--
