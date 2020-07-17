Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70169225882
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1624789FAD;
	Mon, 20 Jul 2020 07:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FB16EDD0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 13:40:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 46BA15C00C8;
 Fri, 17 Jul 2020 09:40:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 17 Jul 2020 09:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=9wtQGfX5A/sjIQNvHFVuON+pdxE
 vSOVnkKnj5ek512o=; b=O5WOxjjgZDmMLZ2789x6pZ7/dcQiUZUsvZvAnV8c+mc
 GprpW4fYTolz4h88yZ+9YVSUYmRu5POOLfHWv5sfq6kcvfielFINiyRtJLFaFqIk
 E/Kuhel5Y2x2yrKFVWyxjEACJtRf2YEEJQjVqlO2nI3357TTYdZBvyyyuNIa7BPt
 6xkJP4A4U92g+vYiYC7po2Q6PTzy1dmw/Mi7wF61nZDE9o0l21ZtgDfkeObwtyMN
 34GVzr+kC4jb1hpY2UO1V8kory71fzqwtM6GySM1t2u4bJXiNafN9mqlpjs3ysGV
 BovMqSN0gKg/vhtjZwqfoz3JS0FIVh2sflvaPOjd29g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9wtQGf
 X5A/sjIQNvHFVuON+pdxEvSOVnkKnj5ek512o=; b=KC/1RaWP38bzljJGlF+A3r
 JA/vxU4ghkAd5LZN95VquKMlwKNvKYci11ZtJKNN3hHIvpv4uzO5BEiqy/bVpFmu
 N84664B1ZomVrBdNa2OGK7z4o7SlIXFHWTD587UMd2KFEtn6OEFupkYaKqLSRJ/B
 aINRWap+JeeXlcziS8PDjVHLbIdzn5Z4AWWJS6XM8Uv1sNtFcYbfjZRduk9Ogq89
 CTRTTR2ObVj/gtR8DBZkVk18sgbiUFVDsKitjeXITiuwu17Nf/C8fcTfMqpYeJDc
 Iv3dr2Hbf0ey87hBj1zFMpX4/og4elDajiyJe8zgowerouZTTyobBvJ/UTdPN4UQ
 ==
X-ME-Sender: <xms:UqoRX38Pt43dhJWB_YnYYW2dJv7nrwwk_NIlp-mvK6gs9VAhl27fzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfeeigdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UqoRXzvP54E4kf_nGaQJUXN7mHiew2ECM_kuu13hPIlHSqG-Rf-xKQ>
 <xmx:UqoRX1CWpr_oFRvcx6rCyS8S31bMFG9fJAddohWUw7cbZydKyRc92w>
 <xmx:UqoRXzdMnXuR3D-Z05YFkq3TAVK_AbLOeCpx-9CS7TmTfUKL3EtB-g>
 <xmx:VqoRXxomC2n1dDXLyLpTkcc9ADj08l7bXRSoO6w55EaLYC7-c2t7dA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D90FB328005A;
 Fri, 17 Jul 2020 09:40:33 -0400 (EDT)
Date: Fri, 17 Jul 2020 15:40:31 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH] drm: sun4i: hdmi: Fix inverted HPD result
Message-ID: <20200717134031.rymy4ac6lyhme7fb@gilmour.lan>
References: <20200711011030.21997-1-wens@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200711011030.21997-1-wens@kernel.org>
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:36 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0449969599=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0449969599==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ggg674spti3sbwh2"
Content-Disposition: inline


--ggg674spti3sbwh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2020 at 09:10:30AM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> When the extra HPD polling in sun4i_hdmi was removed, the result of
> HPD was accidentally inverted.
>=20
> Fix this by inverting the check.
>=20
> Fixes: bda8eaa6dee7 ("drm: sun4i: hdmi: Remove extra HPD polling")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--ggg674spti3sbwh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXxGqTwAKCRDj7w1vZxhR
xWQfAP44Hs2MnWMhQ8CZjUv98v1ax9GAOtgzEyT6dOopNLDF0AD/cVGAXw5sOJJC
0GStzYXMOUlNMkbemLENX2yRAJcZwwY=
=JKFg
-----END PGP SIGNATURE-----

--ggg674spti3sbwh2--

--===============0449969599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0449969599==--
