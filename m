Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C319223594
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A946E1E8;
	Fri, 17 Jul 2020 07:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD516E1B2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 08:32:49 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D40CB5C0118;
 Thu, 16 Jul 2020 04:32:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 16 Jul 2020 04:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=TFtT7aTdKZgtESQriZDeuCMIw0H
 duMNzVJoVvybcYqM=; b=ALJ5msOWK/FlPRhE3CPDKFNXRF4K1nUYgzMPbNvj5ga
 Tg6fiTqzMAOX3T/am1SZwbkX2zofHGABlMI0a4zNGnZ/Hv/f7h5+8BUyYyQEyUcA
 2z0f9o/waejVjIR5mh6sC6qCsVdxf3Fd8NsBVGAXB2Bp4+cZ/I6Z/fmD9WghKOGA
 8moPorUsMI6LhqZsy4Lw/RRIpRUMdfrUtXz6+9eju4xEeGkKEHZBUCSJ1w1TY9GG
 TqkqjmFVwUypLpCeWez5UHkPCSzeEgGDWoM3DLm3fb2QndN0rvDjtlxf1zCpH3Sm
 eIaZaUij/fFfFlmA1iqCC7lYSlMzeObqZMWAI11CvVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TFtT7a
 TdKZgtESQriZDeuCMIw0HduMNzVJoVvybcYqM=; b=YzIouSFvMTeDRpFb9kzuEd
 qFDs+8POp2upcjDSBaScLwc27kgel3HBupj/Jgh4DzwvGz+Qt5cPqvZmOZIiSlhn
 YJkOEDzou6/fjDrJmLnUQvNleZRjVTLWlQcYEVR1no3R+ftNWL0smPDmX9Br5pCM
 WY0pDpapdv49IKKaoyVGFva/zG3Au981q0lWCf60RnvKwCREK/rldVgK6I6VHKmm
 r+ChxOzYYgiZ6JUpMgWD8EQDX3kKMIcOYMvN3L2ZBWtHzLjDUZKu4U+lEsxoz4Q0
 oW85AJwKP0+m+fm5aRSkbG3AMD0l5W1feMkOqIRhOgzeSgpCVOoikFK6uIR7k3Xg
 ==
X-ME-Sender: <xms:rxAQXxU6c5qq5X__rN07_VtN-Idm2dp-JQxsa_sCW68QBYRiDdW5kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfeeggddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rxAQXxm1kFLZmgKIgJXzWChmUnFzCWHWckYEtO5KGnQhbx33MQGaTA>
 <xmx:rxAQX9bpvcKJwqiDGrWRrut1WSvlCKeUHjiGgrjBjMGtG7_MxATTcw>
 <xmx:rxAQX0VAHvVjbAfNDW9fXdieg1HmWYGKgPrzeOnfu1G9_SOm7dlCuw>
 <xmx:sBAQX6sr8uzapKswt0Cmu5R77fr69-N2fyuUk0D_3Hxwee0eNbzImw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7890B3280059;
 Thu, 16 Jul 2020 04:32:47 -0400 (EDT)
Date: Thu, 16 Jul 2020 10:32:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: sun8i-mixer: Remove duplicated
 'iommus'
Message-ID: <20200716083245.5qlzwo6j5male6bt@gilmour.lan>
References: <20200710203124.20044-1-festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200710203124.20044-1-festevam@gmail.com>
X-Mailman-Approved-At: Fri, 17 Jul 2020 07:22:00 +0000
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1182986585=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1182986585==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wec3tpfrd2m3ywlj"
Content-Disposition: inline


--wec3tpfrd2m3ywlj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 10, 2020 at 05:31:24PM -0300, Fabio Estevam wrote:
> Commit 13871279ff5c ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> introduced a double instance of 'iommus' causing the following build
> error with 'make dt_binding_check':
>=20
> found duplicate key "iommus" with value "{}" (original value: "{}")
>   in "<unicode string>", line 45, column 3
>=20
> Remove the double occurrence to fix this problem.
>=20
> Fixes: 13871279ff5c ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sorry for that, I've amended the original commit to move it into the
proper binding.

Thanks for reporting

Maxime

--wec3tpfrd2m3ywlj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXxAQrQAKCRDj7w1vZxhR
xR0fAP9rxkCt7Err/GH+ciK0u0klTcNueGukHR/VHtbZldqLjwEAz/BB114cE9aa
d5T3/rIl6WZtmD4NH4Gnx/9b67n7Bwc=
=qx7t
-----END PGP SIGNATURE-----

--wec3tpfrd2m3ywlj--

--===============1182986585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1182986585==--
