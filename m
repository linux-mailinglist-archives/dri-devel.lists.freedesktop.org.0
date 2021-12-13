Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E188C47329B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 18:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F1B10E7FF;
	Mon, 13 Dec 2021 17:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CFF10E7FF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 17:00:53 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 12C525C00C9;
 Mon, 13 Dec 2021 12:00:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 12:00:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Hqdru4cyOmoMVLYmPAoIWy1c/vt
 3w16xVZi1RGqti6o=; b=bZMWgZPYa05mk4b/DHqIUaTp1B+vic9QWCYup6pr8FR
 SEUCI/tFLi9lCEU7fvbMO0axzl8FRugooh2NhCKmueppJ8lS3fXDL2hJXb16YjAQ
 iNEV0HzYvRr95bGS9gM4JnJRLGM/MEO//Hg0s/mPmOrOIkBlk2wp0S2Hu+/YtFqP
 MfyyvCGstIpqzsWogEncot6MEhQFhsXOaZRNx8kqs/VWwVzd2sj+VyodrakXjYoe
 7c66+RfOE+b73dTb6fL2BLmjYUh1XaBuRTrs8EoPPbMW47kPTwNXYMlNHBmG2kcO
 nogvzJzdROttDEstpojQsyRpcnX2xFRVIlYyxRcj2NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Hqdru4
 cyOmoMVLYmPAoIWy1c/vt3w16xVZi1RGqti6o=; b=BAPez3owD1MJoy+HHY9iM0
 BYyn/hQn/7FUalfZh1p+QCVrbGboqHexYSXoXB0IHDB4xEoliVsvPS1PyFhE/XyT
 ZfuAtYf95SlE6bDhg3/5xEwuTdjuLMO+tjaJ2FK/RxKjESUgw4elQAo6seJcoPVu
 kEi5lfOd4i3a63Ef9rxDI6tdOMddWaW0g0rCXn3dxPGnpU68qHr+4PbkW/IwKRvo
 P2aDg2yDWuKtBVTmECHBjKoPwF6AE4Eyy+fpUE7l+ift5mYXDZgU6fBepuYXVPgT
 PjreNoF5kFfsgd+07/Y+yubAq3LkNma3AKBu6uq8LWzUfn4ndGRjG1I2mzgwMoyg
 ==
X-ME-Sender: <xms:Q3y3YZiV__hQr2x9NrFme4Q9R9z3_vIdFgdVYGMyxlA9YEO_DieLbA>
 <xme:Q3y3YeBdT6WmPm5DGASzcGwPTVtouIoT3Yt4Sot5Kp46nLmUvK7KFXZeWKYORS-Bk
 Nt7TaoS-RMAfBpQEsM>
X-ME-Received: <xmr:Q3y3YZGQAnMlh7zIxXGH5imCqRy2LMjQgf50sqHLLVaVIHGcf2Qi9coGny3KIb33Yb3VRwS-9hphAo6wJe8mJgUNz6m5IT-eqcSG8VIa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q3y3YeQ_iY6LEAVFEwQnC1UZtZY8nUNPHmpMWRPSX35UhrEfLC1KpQ>
 <xmx:Q3y3YWzQStr1W6VuYW3VvIIDr6A9rwDFS7yvtmEuPjriuiomnyyAUQ>
 <xmx:Q3y3YU5iknV-5UdSoIvJ5zE9PwoitRoFpoSRO9DGP_JL6mSaoz0gUw>
 <xmx:RXy3YVm_KlJaJoVsbEXgnGtfIvtlgKA7pwn22TmnwY2lB56CQTwuoQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 12:00:51 -0500 (EST)
Date: Mon, 13 Dec 2021 18:00:49 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v6 0/6] drm: sun4i: dsi: Bridge support
Message-ID: <20211213170049.wblzxs2y2xdzsgzh@houat>
References: <20211210111711.2072660-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bpxgnanxjzyvrakv"
Content-Disposition: inline
In-Reply-To: <20211210111711.2072660-1-jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bpxgnanxjzyvrakv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Dec 10, 2021 at 04:47:05PM +0530, Jagan Teki wrote:
> This series add bridge support for Allwinner DSI controller.
>=20
> In addition to previous version, this series add bridge support
> only not doing any bridge conversion at the moment.
>=20
> Previous version changes [1].
>=20
> Patch 1: Drop the DRM bind race while attaching bridges
>=20
> Patch 2: Move component_add into sun6i_dsi_attach
>=20
> Patch 3: Add Bridge driver
>=20
> Patch 4: Add mode_set API
>=20
> Patch 5: Enable DSI Panel
>=20
> Patch 6: Enable DSI Bridge
>=20
> Patch 7: Enable DSI Bridge (I2C)

It would be worth mentioning that we can't apply this patch until the
one for drm_of_find_panel_or_bridge has landed? Otherwise, we're going
to break every user so far.

Maxime

--bpxgnanxjzyvrakv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYbd8QQAKCRDj7w1vZxhR
xdMrAQCArL9XPWczAQAGwIcdtj6eQBHPAiattDjVrtWArnSf0AEAjLh6YnnCKtsa
tuCTJFuc7+Fl2LluDWWoZRF3hXdzEwc=
=H8S3
-----END PGP SIGNATURE-----

--bpxgnanxjzyvrakv--
