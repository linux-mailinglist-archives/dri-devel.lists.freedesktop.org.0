Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6AD4C460C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 14:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C10F10E4F6;
	Fri, 25 Feb 2022 13:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2FEE10E510
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 13:23:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F9A45C0208;
 Fri, 25 Feb 2022 08:23:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 25 Feb 2022 08:23:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=jPf3kk8AeGh5y2CXV8/KX/do1tYOdgIIQXlD/X
 m7+PM=; b=TtYGPuesXWuYqh1Mhv9ZtQELNNvIBD/hl5zibh/D+iWXax2mjA7cr9
 JrdSkhXYEPDdhDIDdfCp+an9ydf9Tdk+h7x9NHHJ0Lxh9BfKlYkyaTVy8PvTpntx
 wae0SlOFN/hGSKrAKUr3yisjANOjoy6dTlzEr7CKLR/hS49y/w6+LanAZxX0uyDy
 KygugXE0vcKcUyapvtTVNEtfv5R/8VxC1gORsq6+0V9RN7VwlFdx/tuGizP37dOX
 kr96Y2WWPBNtPLtOlp/3l4AtZ8Vgjf3netxX1aeeahKo7o6FSYG8hAbFATrVk3nr
 A04P1FwtzUNMMNWwLurULWKPWgO5ZIXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jPf3kk8AeGh5y2CXV
 8/KX/do1tYOdgIIQXlD/Xm7+PM=; b=bcZSx4K71XrD3A3r5zaLf5iba6xP4Myu7
 i9ZhjkziBtQIImW0rpJuSmQUb2GgmPhSZz7haxOunMINWbBnsgYjL2g8EBzX6x1g
 ShY36FtdcxZOw1kFjYp5cCGk/w3roc9DVSvEPOrWi72uWoWQOKZ/8VYjIx3bOSEi
 t7BvDES4caGmtADAiUiMzqInY17FVZ9wTM9N8lt4QzGxJfYrbDu3vhNcYofw3bse
 nmZoYxGhefQ/NrFjx/1X97EJoHyXl8FJfvZpU/axe7oiFTvMuE9YSg5ZLkjjbnZa
 2wtKUcKgbnAfApUtDrnMSdTygzjY/kLWbBfcrusRiczXbwV1Clnlg==
X-ME-Sender: <xms:NdgYYscjvvPv__k5uyMc_qiAbBm7aZzS47uEHJLx-2RCBJm0iZrpyw>
 <xme:NdgYYuMhhHEG6DXLfuZGOlo3iDA6FT-jFRFwiDifuKesNHEse2xcrWsMHo741gpUF
 PqFBzdE3u1lIAQ42Ag>
X-ME-Received: <xmr:NdgYYti3WBq6uRAGFNnTqTOOVzfyo9mJmNKWpw2XKhQSfP3KGRwWv0UA8M7_rDH7FFHakxCLUnNIdhiK-F_XZCcIp3X2C8UjI_J3iRI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NdgYYh_D9fy73RkU9QLO6smo5S2S5fuzZ0MHy_XtW-h7xfRpQUpPsQ>
 <xmx:NdgYYouyyYB8vtdW7N1ckwIDPpTfidEoG0jWgv7hL9g4UGkvhxfV3Q>
 <xmx:NdgYYoGDVK-g5Ns3-LD95-QM519E3u3k1ZkMb1745iqeErGnbkvdmw>
 <xmx:NdgYYmBGhefdpXUqy1kpIzbjD6O2zTjumG8ls_HAPNdWgfAh2klzbg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 08:23:00 -0500 (EST)
Date: Fri, 25 Feb 2022 14:22:58 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Latypov <dlatypov@google.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
Message-ID: <20220225132258.55yh537iknxh72vw@houat>
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rvi5pp6zy3kjveon"
Content-Disposition: inline
In-Reply-To: <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, Mike Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rvi5pp6zy3kjveon
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, Feb 23, 2022 at 02:50:59PM -0800, Daniel Latypov wrote:
> On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Let's test various parts of the rate-related clock API with the kunit
> > testing framework.
> >
> > Cc: kunit-dev@googlegroups.com
> > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Tested-by: Daniel Latypov <dlatypov@google.com>
>=20
> Looks good to me on the KUnit side.
> Two small nits below.
>=20
> FYI, I computed the incremental coverage for this series, i.e.:
> 1) applied the full series
> 2) computed the absolute coverage
>=20
> $  ./tools/testing/kunit/kunit.py run  --kunitconfig=3Ddrivers/clk
> --make_options=3DCC=3D/usr/bin/gcc-6 --kconfig_add=3DCONFIG_DEBUG_KERNEL=
=3Dy
> --kconfig_add=3DCONFIG_DEBUG_INFO=3Dy --kconfig_add=3DCONFIG_GCOV=3Dy

I built a docker container based on ubuntu 18.04 to have gcc6 and
python3.7, but this doesn't seem to be working, I'm not entirely sure why:

[13:11:22] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=3Dum olddefconfig CC=3D/usr/bin/gcc-6 O=3D.kunit
ERROR:root:Not all Kconfig options selected in kunitconfig were in the gene=
rated .config.
This is probably due to unsatisfied dependencies.
Missing: CONFIG_DEBUG_INFO=3Dy, CONFIG_GCOV=3Dy
Note: many Kconfig options aren't available on UML. You can try running on =
a different architecture with something like "--arch=3Dx86_64".

Thanks,
Maxime

--rvi5pp6zy3kjveon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhjYMgAKCRDj7w1vZxhR
xf6MAPsFqiXvsUyPQGtDx+aYs1YeGisJp8+oTXUM7dl2q5TCyQEAycW64trbxucC
wOsKU/TERF7tV1raKjk4kxNKZEE/igI=
=qJcm
-----END PGP SIGNATURE-----

--rvi5pp6zy3kjveon--
