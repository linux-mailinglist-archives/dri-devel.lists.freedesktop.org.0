Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5454AF664
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41FA10E22E;
	Wed,  9 Feb 2022 16:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB9610E22E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:19:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8395F580206;
 Wed,  9 Feb 2022 11:19:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 09 Feb 2022 11:19:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=55OcdTedgkHCnbbZ2TtGyVZyNIMSUAAyr5X9c0
 GKBAo=; b=v4uF0DiPVnte+ne88sk9qzpOAVX01TfYo6w65K0GaERxBknbIBSpOj
 xvkQ4x4ZF7Ib5pRqxvDw8S6edUrRP9YEXydxX8H1KPGe2KRTsVGyJiwR6g53YOFs
 14ZZgZChtil8NH3pBopcVOS2rS1Oo6+UXNG1aCfxdVraU1uK86weFB7MjrQQOgWm
 zy9vI3MJ7dIP4LGHgNadh5bzArL7G1tVj5tOiDyyshfPvmHsYC/HV4FTbnTQslDP
 N/SuEdE0b3JsgtfLUEOQeTZTIOyZNLZvaS/44VtfE7gn8j2V2BP9GqLpm3oZuI7D
 vv3XUiY2KwMfPdBHzocgIC+lvn1Cz7pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=55OcdTedgkHCnbbZ2
 TtGyVZyNIMSUAAyr5X9c0GKBAo=; b=QKx7tcdhSvKwrYqcqgNqoDzaNSr7aatII
 r/AZAo45FibgSdw54iu7sHS8XbJzcAe/cElcNy95RG9Fd2DgL/exIF+Qp1gSpNzb
 yLlaRnmaEHQp6969YQgV90nR48DPBBNJJHq1lhmO/ezw3ry8GBJ4Jf1Enm+bwIKS
 zRTDF/hWS4OoQfO5twepq9lI8Qri+NPoBhyfxALjvYGvTN4snJJFi6lThDUdaFH4
 BJ3oE5Y7QEjWsbdq+itBmJqNbNCmPIMEzYyZ3H2qKyRGkQ2CL3IEmrcFJJe+PEBg
 UlZXxa+C209sMipZKe9BAPYDqcWUhvxkKFZmNVCL2MZCDzV04Hwtg==
X-ME-Sender: <xms:gekDYkeuA58gXxQ0wyORseyxSG8qm4NKR8QqXs4RBCSCbzzc7qgB6w>
 <xme:gekDYmMaj4bt8CYNBC3mmXNYRFB5dtqucfqSg-pYKguhQo1C612oTiSIGST9aR8mD
 Dcc_-ulJBRs4CU5mLU>
X-ME-Received: <xmr:gekDYliGRwG8Kx3PxCpDc2PpXi3ba9mMWYnhR4NLJ-bRWw-hx-prNSaDfmMmTm_1f6pgtH0hOv3EbGPRveIuPjZqLYM1W95fLlLdFVM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:gekDYp-vKjx7qfo0DnVHWJw3zjqPaQ-nwNJ3_72oh8v28CWeA_DbXw>
 <xmx:gekDYgtlzfycRTJFU0cyWdcdAXshxgYOoR9kAB-oRuneEAFSjhUHYg>
 <xmx:gekDYgGERl31H7ez-Xu_vcirfybh7cv_tPpHqYjGU77bKVycMX6d9A>
 <xmx:gukDYgQ0EWj40OfKWnf76vkG2LbPdongTb72ops65mEaW_tMIhd5Fw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 11:19:13 -0500 (EST)
Date: Wed, 9 Feb 2022 17:19:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220209161911.eififnhc2csg4y46@houat>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <f5381561-25da-61e3-5025-fa6dd61dd730@189.cn>
 <20220209084331.fpq5ng3yuqxmby4q@houat>
 <def50622-fe08-01f7-83bd-e6e0bc39fe1b@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ss2ssq6u6ix5jfma"
Content-Disposition: inline
In-Reply-To: <def50622-fe08-01f7-83bd-e6e0bc39fe1b@189.cn>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ss2ssq6u6ix5jfma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 11:41:06PM +0800, Sui Jingfeng wrote:
> > Then, you have "modeset", and I'm not sure why it's supposed to be
> > there, at all. This is a modesetting driver, why would I want to disable
> > modesetting entirely?
>=20
> Something you want fbdev driver, for example simple-framebuffer driver wh=
ich
> using the firmware passed fb (screeninfo).
>=20
> besides, text mode support.

Then you want to use the generic nomodeset argument.

Maxime

--ss2ssq6u6ix5jfma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgPpfwAKCRDj7w1vZxhR
xRuMAP9hV9LEuGnyc5HgLOl062hnV9Xm6caWfQUzcStzgYP4/QD+OgIBr59jS/HJ
IZmuqee4UGRHzgaXB+crDV4SBZIVFQA=
=hzlD
-----END PGP SIGNATURE-----

--ss2ssq6u6ix5jfma--
