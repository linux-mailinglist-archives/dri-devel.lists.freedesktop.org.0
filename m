Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E48B296A45
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 09:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5627C6E4C4;
	Fri, 23 Oct 2020 07:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350746E05F;
 Thu, 22 Oct 2020 13:19:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F19F5C0117;
 Thu, 22 Oct 2020 09:19:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 22 Oct 2020 09:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=cv1B/67i/GOrOrnasqIYfQsY5PV
 8nHIfVWsxXBPA1cc=; b=AALFhiSpbsks4kB6dtl951TwihN8hHul0i+yqUw/Zqk
 d34Of5b76UN5WP5NtrPPxGZOYh8Q3DBPrxN/GU8owPzKrKc1HkX/knFTeXkK+WD7
 MgNGXKu18jGZNrxpEqQf48ExXi4RFV74DLlF3hGVEiMGFpgUUWEFdEtME+gsKAzU
 c9i/bEjupp0arBH30/5P1WGeRs6IjgnXCEbQAD0kEtvTbPv11PlwVt3VG5ZxWGGs
 h7WuvC+ZlyWiqGQfefNgQSZMHkCc9t9aGjx/QpCS/BtD3ddNme4uXoHFWxwM7shc
 yitsyKZjo5nWuF+s/T7Hkw2p4Hy1vcujJPs1WpVpphQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cv1B/6
 7i/GOrOrnasqIYfQsY5PV8nHIfVWsxXBPA1cc=; b=SKYT7qMQKBnmZ97KkCbXkr
 xO7QthxfYzbXDtlmY6p26QfGOHAXAngLFmHmp7zZJnbJ79Dylh9mbSoPILXhVNPf
 yZkttvy6AiLDw+dz51aXcuyyZlXoCRnKJofw8izBf5o25zDRWKsMa/PEcVAYSET6
 7QJk1pIPuyBk9XyBk7uNeG5gd1s8ATBnvltWdEcud/xkbSGoTNqBij+k8wvz0EnW
 DOV6pkZbkJX4qP9/dTCQMkqF/E6U6u1g1gT7eZnx/3uIIy7Sab+nfdT0qto42pK1
 eolm8IYcHJ7LTaQtIfPyxQgOcnqmNx/cCvExXyaiOGGncIpMSmMian9QlumzwMYQ
 ==
X-ME-Sender: <xms:4IaRX_KJjJtDKPnV7bnh_xOSigK2DDCAXKHQcKUY-cDTr203Zw0guQ>
 <xme:4IaRXzJE1M0ov8nGsm6xEnxOQmoqClQuSRlXttyuFg5z7TLyXS4O9a4yuDR3QLZQm
 f9CeNPu6A6qNnjOLcU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeejgdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4IaRX3tNHor0H92jKsOEOI2vr6Mw1gO2-FO6LbF1e3DFr3MWwxVkcw>
 <xmx:4IaRX4brymTnt82E5gpMVZl2ImhEx26-ks2tGCK3ez9uB_k8jzff-g>
 <xmx:4IaRX2ZwzMlZuPSCj7fI_eJxlbvuA80w_l5N2kIGEdJkR8WIdpUoMw>
 <xmx:4YaRX1nkslJt8X7oNU98UBCHjjTNjAIShQrRiupuuuAzOWYP0jBIzw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 814B03064680;
 Thu, 22 Oct 2020 09:19:28 -0400 (EDT)
Date: Thu, 22 Oct 2020 15:19:27 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/3] drm/vc4: Drop legacy_cursor_update override
Message-ID: <20201022131927.s3y7wnbotnsfg2bl@gilmour.lan>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201021163242.1458885-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20201021163242.1458885-2-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Fri, 23 Oct 2020 07:22:29 +0000
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1057448854=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1057448854==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wxhd4ycsli45a32b"
Content-Disposition: inline


--wxhd4ycsli45a32b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 06:32:41PM +0200, Daniel Vetter wrote:
> With the removal of helper support it doesn't do anything anymore.
> Also, we already have async plane update code in vc4.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--wxhd4ycsli45a32b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5GG3wAKCRDj7w1vZxhR
xV0vAQCvZA1DtQR/UOx0FruplW6xd4kSurdKHIHwnsfx9n/JLQEAnO3skhUYKK7i
DxML5F8B/9JyEFdaG6P15dpb/Rtn7wg=
=u33B
-----END PGP SIGNATURE-----

--wxhd4ycsli45a32b--

--===============1057448854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1057448854==--
