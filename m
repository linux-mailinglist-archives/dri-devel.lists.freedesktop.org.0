Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F384BD860
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 09:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7468A112811;
	Mon, 21 Feb 2022 08:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F1911280E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 08:55:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 17ED258022A;
 Mon, 21 Feb 2022 03:55:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 21 Feb 2022 03:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=GMXE2sOdp9mirDDscRSA6iT0q+mcvYgiAP/MCQ
 w0gSk=; b=OyEA6VSKzAB8kbjOXZuVGfXflhCuB1nEz8NzhYpFJmpYRiIZDfrYs7
 RE4051i4UhZqQ3caHxhNnwcxHnnuNEsmH8XlHZSsZ76ca7kqv8LOqBbMMHxid0Uc
 Jxg/lM2uU/ax+ONRSYy9I04N8eJDFHp4AuAW2ciyr76Igbfonk3btAEJdfzEbChK
 3XhI2qhRbR7AlfSrSIBEH9Rl4iHAOlCgSijxf7NcgalYYOXgK4VgeUJ6Vo1LsJK9
 Xi+EP7uzW+MVZfRhxFUJGd+JdVeAK8hnND051cFPLo+jCcg3A7y5TkL/jA70CD6x
 VRViWQcEOpSt3KmTLTjgNN0YwcyNJigw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GMXE2sOdp9mirDDsc
 RSA6iT0q+mcvYgiAP/MCQw0gSk=; b=KoRxtDnWOu6I2QOzhYV04HNHVUcIksNu0
 tHHrhtdVaNCK243mA4zcryn1ws0vFm5M7EyK27U7rjX/AahX+UoBd3Xiy1IP3uX0
 iOFmXiAH0MG+YK91x+FylW6DuSjHl8wbAo+Bm1B91eR3qMjzus+0BvMwQuTgx5K0
 qchyM6Ks/zCaPd40acH8bsS4C4d3wP6fcpOYNl4jMtkURbYHzW3JozSzHo4qtCnq
 +71MotZGlGSUSK2xDcA3SJLSc/X3GmC0Ro+t3d7lq1GTqK04TkMD7eZGYzMS83QH
 POBXU61hWihZ1zlQSOaqZFMTL+pp8h/di/hKhATusF+ODjC1+/Vhw==
X-ME-Sender: <xms:cFMTYpbVznqmUzC-jtsHRrpOC-Z2ZjvVZPF8Zsx1VRgePzN3eqsq7A>
 <xme:cFMTYgbRM2BAqM22XxM9h2J8qpVkFeRfmjT6tvEuuGOiOT_llYuXC94uPjnITCX-u
 d4F9hcSVVGGW0Bao4M>
X-ME-Received: <xmr:cFMTYr-7w2DIovNNtFqlFxgmVfzDwF24sSEbfTCey-I_W8VEN9kfAC1qcbFAkgwk_Tk2Rxg6z4irXVK4-B0XNx5kd0xQhg0xjWOdJ4k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeehgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cFMTYnr2-wh0GFZI7A8qnNZAwaRYbGwkeGA2qhrwNPxUSUv52YS0RA>
 <xmx:cFMTYkpSdXNXs2ts9xUEYHIEObzSkNnBCb1q0r2XbXA2F9mW3BM6qg>
 <xmx:cFMTYtQhARpK8Yy7yQc5F0XHZ2WYjBVuWE82GeddXXyizgArjfRSSQ>
 <xmx:cVMTYr2pQ8xzASEU977j_2k-2uaOcl8oo2odB_Qq9a6ROq0Ff791rg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 03:55:11 -0500 (EST)
Date: Mon, 21 Feb 2022 09:55:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: switch to devm_drm_of_get_bridge
Message-ID: <20220221085509.fies6j3hjsiz55rz@houat>
References: <20220221072835.10032-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eczutt6qtkbsvjzt"
Content-Disposition: inline
In-Reply-To: <20220221072835.10032-1-jose.exposito89@gmail.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eczutt6qtkbsvjzt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 08:28:35AM +0100, Jos=E9 Exp=F3sito wrote:
> The function "drm_of_find_panel_or_bridge" has been deprecated in
> favor of "devm_drm_of_get_bridge".
>=20
> Switch to the new function and reduce boilerplate.
>=20
> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--eczutt6qtkbsvjzt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhNTbQAKCRDj7w1vZxhR
xWSrAQCMUGagQwycqchROA9zu7E7WHhKxOpwfyKGy48CobttowEAuAOfimTfYbXE
HWzmftcO4nNlobY2CTkFaY2vwbiLGQ0=
=7bLY
-----END PGP SIGNATURE-----

--eczutt6qtkbsvjzt--
