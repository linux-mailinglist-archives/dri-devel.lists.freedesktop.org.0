Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DCC19BC7A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DE96E9EB;
	Thu,  2 Apr 2020 07:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5FB6E92A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 12:14:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A16716B7;
 Wed,  1 Apr 2020 08:14:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 01 Apr 2020 08:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=riGmB2diO+qhO4m3ef50ZIgs9zg
 sZUj/MkF7JyIQwJI=; b=oyGr9tAximrzsF7O0+NzcvTkxWcOu82jh30GU02HAxV
 BgTEVeLBTUDvHDh7ITnIJyNlUt00vhabS8R0WITPRe2IpeO1S1rtb7aEmW0YZqqI
 JEX5QTivfKgwQTc+FDuRiF69oRTTluCLmbS3QS+6iT6yiPBvnw5I4YANjrelYJQd
 sPJTFKlJdh1Z41hPTMS4n2LaK2tYZtoOXWP7sRA7Nx5dPjsIiFlGJW3w3ZFQaHXG
 5XD0QAdZpZ/lEbD07a6eM2UgCpe9nU13BhSmFeAdlELA6btZovMpR9MJFgt+RA0K
 yazrZiWlCbBJR1djx8+f0vL317MBN0PwZi7Y29rSbzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=riGmB2
 diO+qhO4m3ef50ZIgs9zgsZUj/MkF7JyIQwJI=; b=lMnCqBKyKZuaWaiUIcHsJF
 zQjfxXc2s10I3qFb7O/EBhgSmp70u9lWMrdOq4MvliWiag6ynPWeFbtXmOTZ/AGt
 8U22yjKFIcZ+l/sT4hzjcCq70vBo/04xUEHYog865lQltLnZ78LqEPJYWZH7I1rM
 rco6uLw7ywHp6T32IfDoFN2tkbG4YLYfigm1KM6JIl9xQ+PyQ30DPPOAjMGismHX
 eRKBtnOc6CwlOYA+59F0etlzgI8utmnlnBxFppekrmO3KG83kH2b2lx9PgIQ6H5R
 NC6u4pPkSe85PYHHW/yUYQvoYJ+dqqXmR1ITpNc6n+kFiaxmC7t1h4lvZC1kgYyw
 ==
X-ME-Sender: <xms:soWEXg3RSaHT0QnHe8K7B-YKWUwa4oSvE-68KVwZJW7yxt2PhhtBpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtddvgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucffohhmrghinh
 epkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnh
 hordhtvggthh
X-ME-Proxy: <xmx:soWEXovmjV_lepey-Hk9z-G609gxrC39fnoWQlr4ulRUzoJDCczXAg>
 <xmx:soWEXjjB9i-vcMsuOCzUZ-xp8lYxTEjTc2-egSPpBmNMBduCdJK6pw>
 <xmx:soWEXjyQqm9lJqFo_-NO6Q4Utr8G3YOhjh5X-s9ptvfPDc-kMS--GQ>
 <xmx:tIWEXiaFArDSF4BzmWCAud29O9nzIE_QM4Var0sTibOeTakTOPQweQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 462C6328006A;
 Wed,  1 Apr 2020 08:14:42 -0400 (EDT)
Date: Wed, 1 Apr 2020 14:14:40 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Andrey Lebedev <andrey@lebedev.lt>
Subject: Re: [PATCH 5/5] drm/sun4i: tcon: Support LVDS output on Allwinner A20
Message-ID: <20200401121440.z4hj3g5nnrpehhy6@gilmour.lan>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
 <20200219180858.4806-6-andrey.lebedev@gmail.com>
 <20200220172512.dmjtqgyay73x3ubx@gilmour.lan>
 <fa780b70-f1cc-ee4c-e779-089c7e9159ab@lebedev.lt>
MIME-Version: 1.0
In-Reply-To: <fa780b70-f1cc-ee4c-e779-089c7e9159ab@lebedev.lt>
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org,
 Andrey Lebedev <andrey.lebedev@gmail.com>
Content-Type: multipart/mixed; boundary="===============1200006996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1200006996==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4urpxa7m4yqglfam"
Content-Disposition: inline


--4urpxa7m4yqglfam
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

On Wed, Apr 01, 2020 at 01:59:27PM +0300, Andrey Lebedev wrote:
> Hello Maxime,
>
> Since Linus' merge window is now open, do I have to do anything to get this
> merged into the mainline kernel?

You don't have to do anything, it's already on its way to Linus:
https://lore.kernel.org/lkml/CAPM=9twza_DeycOEhT+u6Erh0yFTAUe447J6bxWCLq5+QW8ZaA@mail.gmail.com/

Maxime

--4urpxa7m4yqglfam
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXoSFsAAKCRDj7w1vZxhR
xTv4AQD3RW3fxzBC0un1iccyOIDGwU4RRbxjDXtwj9WeWzIBdQD9E2WACdnxoyZs
vikDyWZGzFHhl6C5fZJdL4IWWCh9Pgs=
=ndqj
-----END PGP SIGNATURE-----

--4urpxa7m4yqglfam--

--===============1200006996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1200006996==--
