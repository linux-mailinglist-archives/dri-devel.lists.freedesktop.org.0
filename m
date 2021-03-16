Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEAD33D04F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 10:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58296E23D;
	Tue, 16 Mar 2021 09:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100F36E25B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 09:08:09 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D60F62684;
 Tue, 16 Mar 2021 05:08:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 16 Mar 2021 05:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=JsVQe9WB6Hp8PDG0JGKhU5WqmQv
 tUOYZLBjHUadxh/k=; b=wHi0z07XF2u8g7lT7V90yUaTY8rHWwLxo3Dk7EZE0Lz
 Gzw8lRSIqopTP6hUYgV1M+ozHXprc2skg1olyb/aXLd52E3ORABNsZI2WF2Se1KW
 +Djfbgkfbcwbn8j9wMAVDAILDI6+BqbvJ8vpN6zoUoQopie0HfytvgGd72pw2bVK
 QcifoSjvEEcvhC1knoOIYqtsK4DWzBMRJAZENDoB9SMK7gw4eJ7DgBdZpvFiI4iI
 b/PFGy/PZrAa+7bG82Emhq68P+w7sFyYP1RRkBnVH99cIv2OYY3Ehui1k6Eshr+D
 wW1BY8zHk9x85XAu9PbvLNk0acCUZY1vMKbq7/VhSFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JsVQe9
 WB6Hp8PDG0JGKhU5WqmQvtUOYZLBjHUadxh/k=; b=PqtuXXOSvtQYgTo6qJlfam
 b157lYh0ooXzMImyz8U5EYgmVgjSPUO2CNnQHJ2HrEy3Z2Ak4mhkP4FWGabA2FHV
 RKbMHJAQbEYhLCfyw7QMpD+c7YoxulT7W4lXvCBziBV6wNXWpzwP9qsQ7QP47Kpj
 OrPdIlWRYKbZuQXJDulhFXxrHv9O2Tt09Zh8nPV34bupxNKELtW/XtDccOHhUrgw
 L1CJhtWr577hC5It9QM3clBD2Do/jD2UYIeOC6ibQ4SM2iycfI+OjCr+VUCwm7hZ
 xzMXWUG2BIC5/yPRTwZMY2Td3DX+d5GWfWuwCwLQ1Jz8SqvN896Ior0ELFG03dyQ
 ==
X-ME-Sender: <xms:c3VQYK6s0bHVwFwyO2GfH-usVNlZJkBzPbvEYH-0O-3lSUXWPDJ8EQ>
 <xme:c3VQYD72yHMqpzJXKO42w8r03ZT7XDJ_NoiEHALhXgrTqF9gvzTbHkAQ2SCQr46q_
 KZq6FxNIHRrn-2M4HU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhkeeiffdvkeetfefghfehffelhfekhfejtefhteekleejgeeijeeihfej
 vdetffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:c3VQYJfkVJaIb2xbrh28za9nWZvmmD6343rQHHZcaevPjNUyrrkRpw>
 <xmx:c3VQYHJqnDn199JM04dsVFG2pIBsmisYvqqC-A6v7DQtZ_CLN7CT0g>
 <xmx:c3VQYOKCl0hSAxj8hvP5pCiMd3nV-awwj5Lk9uKIg9f3rHq931V6bA>
 <xmx:dXVQYAiSF9_PilGGyurLhizDxtOczAtq5j4kLRbvEuxd_I26gtgk4A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 57F811080064;
 Tue, 16 Mar 2021 05:08:03 -0400 (EDT)
Date: Tue, 16 Mar 2021 10:08:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: Need -fixes commit in drm-misc-next
Message-ID: <20210316090800.2ljdaroekpn3m2x5@gilmour>
References: <bc4381ab-d9c5-b425-90c5-e01d87dcb576@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <bc4381ab-d9c5-b425-90c5-e01d87dcb576@tronnes.org>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============0916286764=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0916286764==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ezw5ag5debxn5tb"
Content-Disposition: inline


--6ezw5ag5debxn5tb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Mar 09, 2021 at 06:08:49PM +0100, Noralf Tr=F8nnes wrote:
> Hi drm-misc maintainers,
>=20
> I have this series:
>=20
> GUD USB Display driver
> https://patchwork.freedesktop.org/series/87044/#rev3
>=20
> That depends on this drm-misc-fixes commit:
>=20
> 3a3fe21242a3 ("drm: Use USB controller's DMA mask when importing dmabufs")
>=20
> I would would be nice if it would show up in drm-misc-next soon.

I pushed it earlier today

Maxime

--6ezw5ag5debxn5tb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFB1cAAKCRDj7w1vZxhR
xbbyAQCieEyuELNfIPczVH5FBlHxwGfMkD9sc7LsoZmA63z+rQD7B+KZSTLmTR+1
19mN8NYCcJ+fbguHDdpMOGI90hKA6w0=
=qVdM
-----END PGP SIGNATURE-----

--6ezw5ag5debxn5tb--

--===============0916286764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0916286764==--
