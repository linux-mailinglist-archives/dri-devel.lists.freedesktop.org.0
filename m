Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18476542922
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E4710EF5C;
	Wed,  8 Jun 2022 08:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32B510EF5C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 08:17:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2E79D5C00F1;
 Wed,  8 Jun 2022 04:17:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 08 Jun 2022 04:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654676266; x=1654762666; bh=GtRc427glM
 /xP+8OThEKlx0/YlIMe1xhil9qzlof6uo=; b=gDaY8oQp8EdDym0ZVsDATk6Rru
 yTw1tuwn0z7s2Y1u8pfcW4qj4Gqe8Z2lLTELYhpctsXlWLs+HhVN8ahqiMqzLu6N
 wNDK/u2YkQIeUxIMWqTAhjQ8X7UOHAve3sdj9hDw5bylw48yPaU0J+SYfx1D7FGc
 tc4yzXSGZ7Z7HcQlqXGn/62M3GruEBCzN53yckhs7RwX23Xy8GAq41bB5L7Rof/4
 WpKgsIm/dpO7ToSzhBoyCKGrqLiRK+AOknSq4U2yc9SG4CLhLBrAa/69C6gMm0PZ
 OBNhngHOHhjMJXbDDRHkva09OCa38wXJsgExHDTK1x5ZTDYgs6Zeee5ZKRkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654676266; x=1654762666; bh=GtRc427glM/xP+8OThEKlx0/YlIM
 e1xhil9qzlof6uo=; b=AGyygz+lHO9sUkNOUZjTrm4CSBm9UVQl//Q0srCGn9Mu
 Sv0mdlM14QricV3ulFFdJpf76XRQA2MEG6YZIBU/GncfTdjy+xLooVcgkoVr4ZWA
 VP1jgoFQDxJDReQzZ+mMR/MrhAq9DTBM0264jC50eNSKXuVaEH2MywG9tDE2JloD
 LKLoE/x+pG/dCDtA2gupx/KqDiAqBAkECPbjfuxI/y0TJ7QS7nutrdQHqy9/XKlq
 A64Dnk2pRwk3YoDJJc5gjXy3A3pR51zAQXBfQHmxSbiyfB4/oEj3DxpNLUYH+FY1
 +zzB2ZPWE1BpmIfzW1R+jV58qcfQcrV5imMZKqD3NQ==
X-ME-Sender: <xms:KVugYrBhtEsvjQ83PwCyZVhuizaVwRfC-BE6EQryKNGRUe_azzySuA>
 <xme:KVugYhjUx0Gbn--fnuVgPRw3Z9Qm6WCZfxys0b49R8tzTqvipupqMkUhluMzzaney
 FQ24e9HQxvIGNs7XMY>
X-ME-Received: <xmr:KVugYmk2I9jH152C7XSWkyFIoIBSVSU6okFRZkrFmuVz4kMGRpR48li79JEGwK0B4bIkp1VCi3qj74jnAoKiBSriQxLMJL-3LA8orpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjecutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepleejuefggeevteelveekteffgeduveeiteeiueegueegiedvtdejjedvfeeftefg
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KlugYtzsjyWFZHtwq4nBoQKmUIChQzp9CzSRZzBlcJOU8xMhNfb2iw>
 <xmx:KlugYgRGKaxcSCIXdsjbS_Uzl5LfB68sWZVppBz-fsoZ97_StW4XRA>
 <xmx:KlugYgYEEefynSBSM6oufriJY4EaHhAkV02T0oxROWYSmhXtabHj_w>
 <xmx:KlugYp_8KZoGXj8SNLcjz_H5RuNbATJ_JlSw3bC8DNsZgKwV7ziOvw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 04:17:45 -0400 (EDT)
Date: Wed, 8 Jun 2022 10:17:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH] drm/doc: Add KUnit documentation
Message-ID: <20220608081744.fchecz4epcjwz6iw@houat>
References: <20220606180940.43371-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5vpnlnj62jed3kce"
Content-Disposition: inline
In-Reply-To: <20220606180940.43371-1-jose.exposito89@gmail.com>
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
Cc: davidgow@google.com, airlied@linux.ie, dlatypov@google.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5vpnlnj62jed3kce
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 08:09:40PM +0200, Jos=E9 Exp=F3sito wrote:
> Explain how to run the KUnit tests present in the DRM subsystem and
> clarify why the UML-only options were not added to the configuration
> file present in drivers/gpu/drm/.kunitconfig [1] [2].
>=20
> [1] https://lore.kernel.org/dri-devel/CABVgOSn8i=3DLO5p7830h2XU1Jgg0KrN0q=
TnxkOMhf1oTgxjaKKw@mail.gmail.com/
> [2] https://lore.kernel.org/dri-devel/CAGS_qxqpiCim_sy1LDK7PLwVgWf-LKW+uN=
FTGM=3DT7ydk-dYcEw@mail.gmail.com/
>=20
> Signed-off-by: Jos=E9 Exp=F3sito <jose.exposito89@gmail.com>

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime

--5vpnlnj62jed3kce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqBbKAAKCRDj7w1vZxhR
xZ70APwPJij4R6yEOlpggjHukEShwxdvrYDRgpKiNl7JodU3EwEAjjDHB0auYWvF
S1fDhBvGr9bIkgvbs3aUY4i4PSWnxQs=
=zzPn
-----END PGP SIGNATURE-----

--5vpnlnj62jed3kce--
