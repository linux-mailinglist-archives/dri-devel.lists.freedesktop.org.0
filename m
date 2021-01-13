Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3742F5D52
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:28:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7405D6E10D;
	Thu, 14 Jan 2021 09:28:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED8A6E3D8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 09:34:35 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 45AF85C030C;
 Wed, 13 Jan 2021 04:34:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 13 Jan 2021 04:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JrwMSxIZ4fmzOXSSXAHv5VM6EiE
 fmZGeZPaeJtwvY88=; b=dhr690iVBh1l3irTWsRus1PGyehY0xS89e7omAlRNNa
 aOJdXaLHsa2XFx+t8CAf/g54pAryg5J0KcMHxIfGFU04B/qHqrLfJFu0gcgzl6y3
 mBmWwQUvqcRstMJLt33qbnOJ7Ep75VTo51H3gkNs7co+m+9n63C+HpnkBfYR5n+V
 trxtrbl8itIgEHFSz9q3SA2gfUf8KEHGp+OLOUXJLFMAdtSXTcqiPHlB0nFLc1vB
 5VPQeDD/0IANncfeLeoGpkW+DkQsqUm2qgRvtaen+2CF6MJsNF8VHAfZE6U8OdGs
 BJDWZmipYvQQVOKxLmenvntd7UAze+5lWQjHVZzC1Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JrwMSx
 IZ4fmzOXSSXAHv5VM6EiEfmZGeZPaeJtwvY88=; b=HRPwBFp8xpvt/V4FqI2ahP
 LTyh/84OPZiogivfnZOO1rzHc1AJWDs2YcZlEo2hxaOAJde1YLwLRfXuaPoevnM7
 U5HI+vEg1Qe9Ymkn/xQYCMFEmvgU1IzjVY2EEScWPP3p1OjB1J0DLKF705xnTHoM
 hHQKap2A07B43/IrMtF0CQzTsuIT7uSxFfpIl5BVQhFNLnmoVs3uu7xEEbXqx2kN
 16JE+XKZedqHK8lo/a85KsmuXp4+pIxcGQ9flSnxuym3RHG/k1ecx1eENoUp4T1/
 pDHAdvbPzufwqtZKvZAgnysyIbbtHSgvyFx+DZXig17llQ3i+6GY6/XgcreVdEiw
 ==
X-ME-Sender: <xms:qb7-X0AbTRzOCLNEANk1LqHfkIFyfML9LkkxoEO7XYuMHf_MGX6cdw>
 <xme:qb7-X_9PkZ-5vFIDM32X65xnDzrz6VLdahY7b_hkx1k2vNE-7OI2iMmmR-v4_XbsD
 ewoUEaYJsvk5s4tnL0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qb7-X3J3aK4a5NWJAAvVLrmLFBkk72l3dbsKR4-bIVxakU2eEf8now>
 <xmx:qb7-Xwhbzp45_G8HNRf1U-uxApYxttLNzDIy2Oal11nqP74BZZRhiA>
 <xmx:qb7-X_7YMvrjZ5SO8I0EJyv29_Poy_2mMpjisV-1fSCnw7yZE6zf7g>
 <xmx:q77-X2a1JRp_qj5UvdpCcWcXlFHv73TmGpOs0SJblFnNTX6fACEy7w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 678EE24005E;
 Wed, 13 Jan 2021 04:34:33 -0500 (EST)
Date: Wed, 13 Jan 2021 10:34:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH 0/3] drm/sun4i: de2/de3: CSC improvements
Message-ID: <20210113093419.jwlz336f5jl6dlbp@gilmour>
References: <20210110201947.3611649-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20210110201947.3611649-1-jernej.skrabec@siol.net>
X-Mailman-Approved-At: Thu, 14 Jan 2021 09:28:31 +0000
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
Cc: irlied@linux.ie, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1948722594=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1948722594==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qgjxzrlk4sgmyzfn"
Content-Disposition: inline


--qgjxzrlk4sgmyzfn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 10, 2021 at 09:19:44PM +0100, Jernej Skrabec wrote:
> This short series reworks CSC handling to remove duplicated constants
> (patch 1 and 2) and adds BT2020 encoding to DE3 (patch 3).
>=20
> Please take a look.

Applied, thanks
Maxime

--qgjxzrlk4sgmyzfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX/6+mwAKCRDj7w1vZxhR
xUc7APoC0Q4MKG4EokWBqJ5XpZ4/Jg3DVn1OLVBeohNP0dujnAEAl6bhdfhR20Cs
e6IlFjAMEx1/STdLorUJMWcqhVq3fgA=
=cseC
-----END PGP SIGNATURE-----

--qgjxzrlk4sgmyzfn--

--===============1948722594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1948722594==--
