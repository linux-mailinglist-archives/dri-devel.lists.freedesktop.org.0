Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E3F6A41AC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 13:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C13A10E3F2;
	Mon, 27 Feb 2023 12:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E93E10E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 12:27:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 96EFD5C0061;
 Mon, 27 Feb 2023 07:27:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 27 Feb 2023 07:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1677500858; x=1677587258; bh=CNrUax/iDM
 rVPYgbtB+NNfgCr0pm1yYKnJS/TJ7H0XE=; b=L2GzCtwFhYExfdwZ32LayBYhwP
 T17f/H49zHZO5vUZY+MwvifkGoLAjbTCDZeKt8JW5G0bDU9XMsgrNkvgHPtAIu8K
 0N3VDKoRFly++Cmbv7gP489mGY1rqZQXW34EJCxddGvTB97X1wee6SlyGFqa6XM6
 3IfZKgSWp6O02yDsSaE5VSfhcVFzj5Yf3Np2NZzmvWcEoT/+e3WE0D1iz8sLBuuk
 +fIZSPll2muzZZw3DzR2EEfuv3XMCtq4+eVwGTdcdVIqSFzDQIiWIe1Wl4OkD+ra
 qxFRBpjZw9Ityugp/scprkj1Of3GH1IiTxAwY4Mdc41v+YaSbXCJqru22WnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677500858; x=1677587258; bh=CNrUax/iDMrVPYgbtB+NNfgCr0pm
 1yYKnJS/TJ7H0XE=; b=ehM2kr9GscRFE0IRHmHWD0t+OmqoFDndSmgXK+zM/S3W
 nd4i79CNVhHE3FfSCHtys5a641kbDQ+laWFFmaSq9yFMESSyNV/r9hjZ05fJ8EhU
 6lkUHsY6pv9/TULdOHly38aL2TwPvas0JttUjaz50Ukxs0dK6AtwD1Hwm6m/3a8v
 ysgAE8nLW6LYW5fqwlyMZVFkQnjZMUhh4r+PBGpR6sPMoCX99Od9qaSzQsw9X20H
 c/b/wA8PY2RSZ6b8AbjnAr2wIPf+Pq9GsCLu4Sg7yTc9pTvGe4TV4rePujof7HtT
 ImCV+u6Lswrf8W73lTw/WcjylbHaWY5LnVDHGyMKFA==
X-ME-Sender: <xms:uqH8Y-qjKooUh5nkfqsF-1eSFPI8JuCDILHzidAX1ekEdvnxUqNz_Q>
 <xme:uqH8Y8oiGnMdvXjQ3LaPeBCynkiTUH1NllEgi_LDSiPjlh2AM16MoLskD_0avswq1
 nHHMKADM9aV9H8tuOc>
X-ME-Received: <xmr:uqH8YzOk-rLa5V_Y-pC7Kyh7UQjefrCARqknWxdtBrRzzRhxYqwuYxHEeHJ4apQ_rXmwvGe_btPUg_UCF0BVXgHRwVq_uQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uqH8Y94nJUJCyxAtZiSl1oZFT1LtwaiBGLcsbK8TkIS5DApHH7WDBQ>
 <xmx:uqH8Y94xjwwkU7WenwteTxYtO7aStcVL6J9Icofth_jgIFCudlrF7Q>
 <xmx:uqH8Y9hLVP0h82vMQ4F3tKiaeedNtDX4Pk--DGLkvt3qORfVEF0ztQ>
 <xmx:uqH8Y6z3vbeno8itV261ePPMk0J9DmUvTs1kwj8gsQvxxiEdyoVwSg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 07:27:37 -0500 (EST)
Date: Mon, 27 Feb 2023 13:27:36 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document TV margin properties
Message-ID: <20230227122736.6vrxowix36ovscsn@houat>
References: <20230227122108.117279-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6orpipcfk5ael52r"
Content-Disposition: inline
In-Reply-To: <20230227122108.117279-1-contact@emersion.fr>
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


--6orpipcfk5ael52r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 12:21:16PM +0000, Simon Ser wrote:
> Add docs for "{left,right,top,bottom} margin" properties.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--6orpipcfk5ael52r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/yhuAAKCRDj7w1vZxhR
xYYJAPwK/KA0A1BfVrbsz2wUwHKYi65Ic0QhUPF5v+tGHcekdgEAhqUEt7/suOzM
617vEAp1zKeOcRwD8VWrXDW9yqWnIAA=
=z22x
-----END PGP SIGNATURE-----

--6orpipcfk5ael52r--
