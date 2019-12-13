Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E17C11F211
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1286E353;
	Sat, 14 Dec 2019 14:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AF76E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:57:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BB69E224DF;
 Fri, 13 Dec 2019 04:56:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 13 Dec 2019 04:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=umkO+eAc4bKb9tauwv3ECYVp4fi
 buA8RSbxNbuvD9G8=; b=P47du5O8ZH6hGUvAXJGOR/P/edxiIYKnu96v1Ahgaje
 YRL3eR4sCxn/fc5fiBwAyRNW0fbGhLezynOg5zRGUDtfi8ulgUX0e/Nim/scxMa3
 lofHKlY3WkhKaEuRTQGv++HUf0+m4vpLrKEwgQH1sVfP+ngCpKeWziid72VgvK/Z
 znKOlCXKaPI0UwsAf5Dg98YmmdAYR5RJzNz2hCTJ0lRVtY6OedE1n/Wuvm9//I7z
 iBgda54q+8EH6JCIWKMkTKl/kwCHNJzOOP8/w+vfdBdWD5t8s77Svne2Xa0Vtbkq
 H4E+60+i25W2jgvey5AIB3XIT+dgcz7ddAqHUtnB3xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=umkO+e
 Ac4bKb9tauwv3ECYVp4fibuA8RSbxNbuvD9G8=; b=ciWjNsF/JOEkxh5VwOJ/1P
 wBKqquUPopCfli5haRMEt/a4ImH6qhMvvIzqCBrML7TZqOhUg3rvHpxj4z29lQam
 M51EHQyHQ6Av09AUEVumscKOWAm5FlfA6dRj9/9MtB08O9x17R32otYa8/vgA4ID
 2/JU4Qsx1ZySbtLA8BhrKEC5ZyDOH5kX4+IlCOenSGfHXXy/dyEz8GnrxcIaviml
 S2wgijkHGw/mmYVJ3m5i2QZRU+S4P5OJdHEcIdHJUa84qKUbHu9Lc4eT4atqQdbQ
 tsIctohxghxBUPGAbprO6rnz+YXHD6OYNy/NyWhML3e5jQyHWRwvaD5f9yKd2bSg
 ==
X-ME-Sender: <xms:amDzXVnSohlFzoYKRFOKwyAEWm48NaCrfwMGDZTvZnfGtrWqnpC_Kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelledgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:amDzXWYfGqvxF11aSvX9rQjajMWHd3krV-CmgehhdtJBj3zMhO9a3A>
 <xmx:amDzXfj-_R89sT0H5onMzbD4qTVuB_GZINmhZPjdjW6TkhO2TWHsaA>
 <xmx:amDzXdkzQOf3OsZ3oroFvQjkrz7z-IwydUU1ZvIccPRrfwPEvZ0Lyg>
 <xmx:amDzXWGvwzgdvZLyW_CTgxsGHqG-jIJh3qi6GanovTsre1bCSiprbg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5857B3060158;
 Fri, 13 Dec 2019 04:56:58 -0500 (EST)
Date: Fri, 13 Dec 2019 10:56:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Yuti Amonkar <yamonkar@cadence.com>
Subject: Re: [PATCH v1 03/15] phy: cadence-dp: Rename to phy-cadence-torrent
Message-ID: <20191213095657.cia5cmcjopcxjyqo@gilmour.lan>
References: <1575368005-29797-1-git-send-email-yamonkar@cadence.com>
 <1575368005-29797-4-git-send-email-yamonkar@cadence.com>
MIME-Version: 1.0
In-Reply-To: <1575368005-29797-4-git-send-email-yamonkar@cadence.com>
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: mparab@cadence.com, praneeth@ti.com, dkangude@cadence.com, jsarha@ti.com,
 kishon@ti.com, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org,
 sjakhade@cadence.com
Content-Type: multipart/mixed; boundary="===============2069132708=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2069132708==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nvznlj5qufmlcv3d"
Content-Disposition: inline


--nvznlj5qufmlcv3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Dec 03, 2019 at 11:13:13AM +0100, Yuti Amonkar wrote:
> Rename Cadence DP PHY driver from phy-cadence-dp to phy-cadence-torrent
> to make it more generic for future use. Modifiy Makefile and Kconfig
> accordingly. Also, change driver compatible from "cdns,dp-phy" to
> "cdns,torrent-phy".

You can't really do that though, this breaks any DT using the old
compatible.

Maxime

--nvznlj5qufmlcv3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfNgaQAKCRDj7w1vZxhR
xXdZAPwNHiaKq0dC8Fbd2lQ9G6M8QO6VcOT0T8694H18E2o+aAD/VyD1/LGHY7sk
VHYnWIGw1XJF6hD/yp+NBsFzrOCVOA4=
=MFbi
-----END PGP SIGNATURE-----

--nvznlj5qufmlcv3d--

--===============2069132708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2069132708==--
