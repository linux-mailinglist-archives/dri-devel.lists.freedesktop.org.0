Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259A74BA559
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 17:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFC010EE90;
	Thu, 17 Feb 2022 16:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910CC10EE90
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 16:05:32 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BD6412B001F2;
 Thu, 17 Feb 2022 11:05:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 17 Feb 2022 11:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=LNbJx5g1GUl3EV8fGjTeNjXpUeKCrPEkj0ygG0
 XMK5s=; b=Ow0yuZYOKMjbuO9+hXPhDJOXuudE61NuE5rgIEk4sRrORA8nbekCun
 YATDu38GYg6q0hiNxJKeD8FUe26O2OyLWzhZM8lsSGw5T0lPlUN4IiGGsl3dMVxM
 tGj1KAVyUGPYVlt7R2/VivUsblmDEWai4Wc75DyyJKK5nfr3Tn6q6txiclOTVY8K
 0WsdbWV5m+w7M4Vh2UoG0/ID9xD2nkdMC/zSqNxiTn4YlTwSgu1Z7KdR4HOOrebL
 zx3/w/H8KofCZHHRDtnJ+pzar/LhakbE+VUGOOV4qxtcfEe6vToRlAr3f6cjrqZ9
 spK/40YEbese2B77wobuIq+myKt+amtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=LNbJx5g1GUl3EV8fG
 jTeNjXpUeKCrPEkj0ygG0XMK5s=; b=kGYDd3dOEFec7+r6NyW9colhvAyKxtfCo
 t2uvZSKiEeQ6rKutNMEv4XU0RZmKlxcR+KX5zGkmfCdhtmTaXrHbmj0eoZ5LYPIN
 mAjRLK1Zp1Vz0MxGAB9/DfkSNX9iK+BwXyWtx0o6ckBxvcuJ6pM0ZdMDa2FOkwbU
 jif8z4MQxP5F2D6YF9r8ge8/FtZ/+nA20/uLUZL2shIz3vKZZUMAAXDa9UThbobi
 ZaovtgffyTzDEY+rLHnY7MTdSPFhIpGwvEnpv6zBS0gD4XKFwWxtHuTUgTlHqbRB
 MBsfkDQArfHHNFgRXEuKt3H9myj7C2bXcTm/ZaM1KD4rKGmYahXtg==
X-ME-Sender: <xms:O3IOYi-rdpaMIXhTYKokPn7ZH4AMm9-x-aHH_Fq6EYAFf2xUvd5idA>
 <xme:O3IOYis5nYegBW5rAiN86TVxY2j88GWwYUAolNRnsvUbpYP4n8xz6EbP_ZUNWJ2Ge
 KR1BjtmSL8hx9F4vHw>
X-ME-Received: <xmr:O3IOYoBRUvQuFu-f2iKhobWdgp_bIBZm3ntbwwB9D-qd8Kr3_9DI5-Z806QgAu8_oUFkuimDBkGkS4a_XSTMKgUG6nwcylSdRrXzXGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeekgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PHIOYqcfKWN-m215s0nXOjsqB588HNrPb47Ay8mvE28czfsV27fleA>
 <xmx:PHIOYnNIKmcDDRPF_CscWkAxEe2eiKJScPKcLtrAPiATNXt2hUCz0Q>
 <xmx:PHIOYknHAu8cS__DgUvuas8zDPDj6_3t0wHTdobs7SNHdgreq5UrTA>
 <xmx:RnIOYrmeD00dXG24R0bga3Yb6UarcZ_-uj1iFiZRNlXP2o06dA2pa5rIeAs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Feb 2022 11:05:14 -0500 (EST)
Date: Thu, 17 Feb 2022 17:05:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 0/2] DSI host and peripheral initialisation ordering
Message-ID: <20220217160512.rp62ci7k5lbbotxb@houat>
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vxve6u4vn2evhpyo"
Content-Disposition: inline
In-Reply-To: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, andrzej.hajda@gmail.com,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <robert.foss@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vxve6u4vn2evhpyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, Feb 16, 2022 at 04:59:42PM +0000, Dave Stevenson wrote:
> Hi All
>=20
> Hopefully I've cc'ed all those that have bashed this problem around previ=
ously,
> or are otherwise linked to DRM bridges.
>=20
> There have been numerous discussions around how DSI support is currently =
broken
> as it doesn't support initialising the PHY to LP-11 and potentially the c=
lock
> lane to HS prior to configuring the DSI peripheral. There is no op where =
the
> interface is initialised but HS video isn't also being sent.
> Currently you have:
> - peripheral pre_enable (host not initialised yet)
> - host pre_enable
> - encoder enable
> - host enable
> - peripheral enable (video already running)
>=20
> vc4 and exynos currently implement the DSI host as an encoder, and split =
the
> bridge_chain. This fails if you want to switch to being a bridge and/or u=
se
> atomic calls as the state of all the elements split off are not added by
> drm_atomic_add_encoder_bridges.
>=20
> dw-mipi-dsi[1] and now msm[2] use the mode_set hook to initialise the PHY=
, so
> the bridge/panel pre_enable can send commands. In their post_disable they=
 then
> call the downstream bridge/panel post_disable op manually so that shutdown
> commands can be sent before shutting down the PHY. Nothing handles that f=
act,
> so the framework then continues down the bridge chain and calls the post_=
disable
> again, so we get unbalanced panel prepare/unprepare calls being reported =
[3].
>=20
> There have been patches[4] proposing reversing the entire direction of
> pre_enable and post_disable, but that risks driving voltage into devices =
that
> have yet to be powered up.
> There have been discussions about adding either a pre_pre_enable, or addi=
ng a
> DSI host_op to initialise the host[5]. Both require significant reworking=
 to all
> existing drivers in moving initialisation phases.
> We have patches that look like they may well be addressing race condition=
s in
> starting up a DSI peripheral[6].
>=20
> This patch takes a hybrid of the two: an optional reversing of the order =
for
> specific links within the bridge chain within pre_enable and post_disable=
 done
> within the drm_bridge framework.
> I'm more than happy to move where the flag exists in structures (currentl=
y as
> DRM_BRIDGE_OP_UPSTREAM_FIRST in drm_bridge_ops, but it isn't an op), but =
does
> this solve the problem posed? If not, then can you describe the actual sc=
enario
> it doesn't cover?
> A DSI peripheral can set the flag to get the DSI host initialised first, =
and
> therefore it has a stable LP-11 state before pre_enable. Likewise the per=
ipheral
> can still send shutdown commands prior to the DSI host being shut down in
> post_disable. It also handles the case where there are multiple devices i=
n the
> chain that all want their upstream bridge enabled first, so should there =
be a
> DSI mux between host and peripheral, then it can still get the host to the
> correct state.
>=20
> An example tree is at [7] which is drm-misc-next with these patches and t=
hen a
> conversion of vc4_dsi to use the atomic bridge functions (will be upstrea=
med
> once we're over this hurdle). It is working happily with the Toshiba TC35=
8762 on
> a Raspberry Pi 7" panel.
> The same approach but on our vendor 5.15 tree[8] has also been tested
> successfully on a TI SN65DSI83 and LVDS panel.
>=20
> Whilst here, I've also documented the expected behaviour of DSI hosts and
> peripherals to aid those who come along after.

I'd still like the review of someone with a bit more knowledge in the
bridge framework, but it is

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime

--vxve6u4vn2evhpyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYg5yOAAKCRDj7w1vZxhR
xSD0AQCEmLf56isFKffNGZsw3E9brRE8gga/atHnT9MObcknNgD/Y4GcJM4q3ctt
/Gsa7qcg6Fn9QyW7W3a5OQPs1kIeeAY=
=Tssg
-----END PGP SIGNATURE-----

--vxve6u4vn2evhpyo--
