Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F18475B50
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 16:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F65C10E490;
	Wed, 15 Dec 2021 15:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A15910E490
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 15:04:02 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F05D8320187F;
 Wed, 15 Dec 2021 10:03:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 15 Dec 2021 10:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=qLmu3JlCRe82pQVUbNMc/6ElfgX
 50ChCgLgeqW6Gq8E=; b=eQv0Xxjs0hJwwm1g+TphbhNUut/8OLsr9pAiJeqxNs/
 4ZDqVHp9ruvldgLx1mRjXspfVkF1ju57WNsUVvDFUe9CY2hZ/jEMInZK5MVDzlKa
 2yNzNl74MFKjlVmTEs9LfsqN9pDVeHFIHuuC916lZv957meckFP9bTIWd/rYxi9d
 XKC12j83PPyOGfLB6zTNHfFlwNQF3akYqvOMlTKWSAypAre/AwRyoHAg33wJr/dV
 6kbYqwOObm+TAEATRFApt78QZmpOXQbaCQPnP41t+srjh7syI5ZpUos8BpwIhUn/
 4YGs5WqbxuU2BJ9gujIEH7vNaqdsajrvVHJ7FV2QTNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qLmu3J
 lCRe82pQVUbNMc/6ElfgX50ChCgLgeqW6Gq8E=; b=YXS0V7zP9xlmjGnTILvraj
 gcW7OF4JpZTGk6p2+wKVksiTp/pxd9TMXbiDdj7/YnRjpnTFgdmF2BHMN6wvmoJY
 Ma0hPlBuAnARP3R1mNpsJUU9o88fMupHctk2d5M8uwvXHF3yyYM9QOOh6I4Wu0QM
 bWHlbo8uORLvUlES06i6nLaoR+xtMpEMENCLHncQYuHun3d1UDU+xzvVmjV5B49d
 QMfmYS/Cqz+Qu7+GDwmKPLxGiqFAWow/Nmhtusfpou/DJ4EjNPK+YPVY5Yu2ed2Y
 J9mD+Z0CFley6mW0vfC+xydXe70blafFQq0ECdRHUsckuAXgPs9LR7tzX3ACPc3Q
 ==
X-ME-Sender: <xms:3QO6Yc48zooVoVXzmM9LD_LCBJXgCz_xMm307xi5WHmqFMGEc4TUSg>
 <xme:3QO6Yd4TT14kD1qmNX_EgO5DDLkCNcrP-isn1SYiaaM9mG88GpgTVn84BEl1IP8hQ
 bginKVz9S6sqeeC6Ac>
X-ME-Received: <xmr:3QO6YbdBjf8LyEAcYfoDHsZlf8dNAWFDHQ8f8qY2L_DBIOlt50EHA1qYDmKfcucCbNWSykvDA2H7jcBCbx7gU24QMd1DoW1-eecInOk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:3QO6YRLRxkPd0ZjrrzuN5jGj72wpf3hG8jNdDemNeRmrydULIZdZJg>
 <xmx:3QO6YQL1WBBUbBAHXV898E-ejA3eTmJck3FAf0PN1IxYRgAn5tnmsg>
 <xmx:3QO6YSy6vvxDcNA4V5tTn7te-GcYwsOCaNJF7HHI9vO4SL0E4qjyDw>
 <xmx:3gO6YU25Oyxmq0Ikp_WhGq2d8eWom_J7IZcpUtMOPyVQNgBhlWm0bA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 10:03:57 -0500 (EST)
Date: Wed, 15 Dec 2021 16:03:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] drm/ast: Handle failed I2C initialization gracefully
Message-ID: <20211215150354.viruwqf7rmbwsw43@houat>
References: <20211201153100.403-1-tzimmermann@suse.de>
 <20211201153100.403-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fkbblmn4iwoiccrb"
Content-Disposition: inline
In-Reply-To: <20211201153100.403-2-tzimmermann@suse.de>
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
Cc: airlied@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fkbblmn4iwoiccrb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 01, 2021 at 04:30:58PM +0100, Thomas Zimmermann wrote:
> I2C initialization is allowed to fail. In this case, create a connector
> without DDC adapter. The current code would dereference a NULL pointer.
>=20
> Reading the modes from the connector is supposed to work without I2C
> adapter. Add the respective test.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--fkbblmn4iwoiccrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYboD2gAKCRDj7w1vZxhR
xV1wAP4ha6XKoPzCJcRkYt5M3AkWa9mCCFZeeNP4roFlMirM3AD/fgPgaLkYmuLx
oRAi8M0gjkL3m9jzupToeLMWH79Evww=
=Cw/T
-----END PGP SIGNATURE-----

--fkbblmn4iwoiccrb--
