Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6954AF398
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7AA10E542;
	Wed,  9 Feb 2022 14:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEC810E542
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 14:04:40 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0A9AD5801A9;
 Wed,  9 Feb 2022 09:04:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 09 Feb 2022 09:04:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=6C3Zbv7qcftcJPNdinXDELfCRJAPbtGEO9aofq
 ELC1c=; b=RbTJLLPSHVAvRbZaSx+PE/OOh6dwrdKo5fF8ddis1mPVVlOd+rbbOw
 WNgNng9NOAg2tC7ME61PAATrqcEL2Iq1EhU+dNttV2/alXDEY+TRmrxgSI4qQ6Q2
 gxdOFwVQgGTzVPWATM+X56Yfwqf/G/QqaTq5zIVe0XGUQaXIhYmh9RhVa+4gR9wR
 cJMYUz0oxESU6HCz0r3DP7Q0h01iiI2FqG9xPc+CPwpN54Wajx7WXuQWFGAjozhZ
 ItVHbeQ1H7j61Ph7OLb8cTuWMxdQDOyKAwRTHLNd+4MA7xfpA0zEl6cibfdfo2o1
 g8FvQ8oaj8urf9tG307CeqSKVDoQsFng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6C3Zbv7qcftcJPNdi
 nXDELfCRJAPbtGEO9aofqELC1c=; b=juG876JtEkhqls5pvMUbR4O2Cp+hpvAIr
 qOrSZGofNApNDWdrr5kYUh/qFGSkFKWu6BCPnJ+gVk77IRw1hdFYl7WiNrIRZJja
 cSrh7/Mj5EKxnb77Sg3nTOLeuRnztE4B6US5twBLQ4NvBrUC9ciMgBpfDc80XBLJ
 pfBBmerR8Snh3eJVYst3S6GwUXxipNILBDktURLw1C7bCnA8G5tO2rVlzcLdCTSH
 WncaYfPCHddxoQVG+01hWghQ0shscaRIQQDPM6DtlBE2APyBAvD4kh1BjdzxIGWs
 YHK1yCF4HL9s5oqB/z4j0IMPlxxoCOWs2RmxX4DxkYpXwTf5gpFUg==
X-ME-Sender: <xms:88kDYrTKYO8ov1PvHt0MleH7wilA9FoIlPoq0BwliyH0lvGYQfp5TQ>
 <xme:88kDYswiOiC-Yrv9inepzR2830IQlOtLTUmaH6ucbennMlyTrvNKW12fzrD83st18
 XBRqEd0MLehA_tmjuc>
X-ME-Received: <xmr:88kDYg1xdOfDPeeTE6ibwkWTym6h9cuWHGrN7zmIWWx1C5xofp0BpVAO355Xa54_ex7L6-6JEK7AwpdiyR_vGdKhrHG9xzJ_yPRn5ZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueevieeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:88kDYrA8Be05SyEG96uriDnvHQlCLxPXh5nTzO1T5HVsiQcoK83WMQ>
 <xmx:88kDYki7RG4p27sdKSq9Gp2JD2Fj5MNRd26p_slr_pJFoFA3GAkoFg>
 <xmx:88kDYvoJzUrLElH-l28YJDxD3tBKV1W_8MeALkc5wNUvd3dN9f3Evg>
 <xmx:9MkDYta9hxxFCyROgf7oo6Q76Xof1_w0KIUC1bSOzptwSnCvgJVVvg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 09:04:34 -0500 (EST)
Date: Wed, 9 Feb 2022 15:04:32 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220209140432.ekqszxbtitmacpk5@houat>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <57805e19-285a-76d3-16e3-09a3eb7a9540@189.cn>
 <20220209085215.65qbdsgwtnvujdng@houat>
 <8e7f7946-b9e5-7c4d-f5c9-e091bf5f814b@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vl5too7ki5enoddb"
Content-Disposition: inline
In-Reply-To: <8e7f7946-b9e5-7c4d-f5c9-e091bf5f814b@flygoat.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>, Sui Jingfeng <15330273260@189.cn>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vl5too7ki5enoddb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 11:56:48AM +0000, Jiaxun Yang wrote:
>=20
>=20
> =E5=9C=A8 2022/2/9 8:52, Maxime Ripard =E5=86=99=E9=81=93:
> > On Thu, Feb 03, 2022 at 11:47:16PM +0800, Sui Jingfeng wrote:
> [...]
> > DT isn't really a solution either. Let's take the distribution
> > perspective there. Suppose you're a Fedora or Debian developer, and want
> > to make a single kernel image, and ship a DT to the user for their board
> > without any modification. How is either the Kconfig solution or DT flags
> > solution any good there? It doesn't help them at all.
>
> We are working in another way. As we can tell model of the board by strin=
gs
> passed from the firmware, we just built-in all poosible DTs into the kern=
el
> and then tell which DT to load at boot time. So we can ensure users has
> smmoth experience.

It's not really for you to say though. Once your driver is in a release,
distros are going to use it. That's the whole point of you asking us to
merge it.

Maxime

--vl5too7ki5enoddb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgPJ8AAKCRDj7w1vZxhR
xQ7jAP9etfpiFR/7BaYwCwRPhBjfmYKdaCacf+X7uAN8xqcKDwD9FtD6v8xZ4gAL
l00pbTcOa2efVrqJ8frFZMlTOvz47QI=
=gzq+
-----END PGP SIGNATURE-----

--vl5too7ki5enoddb--
