Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5713136AD29
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 09:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A158D6E17B;
	Mon, 26 Apr 2021 07:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE856E0FC;
 Mon, 26 Apr 2021 07:35:23 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 775665C00D0;
 Mon, 26 Apr 2021 03:35:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 26 Apr 2021 03:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=OdI3mT4nMejbMpZ4hAkqACsHiXa
 PqAYoek1WZFxJpho=; b=upKlhD9xTVYZyn59mfOOwqgtyHCwNWDGbbenXdxek5O
 cpRBNhL40ZWF0uUYclZkJBIvGji4DtO3E3elvk+f0ehESYwe9nbo+CZNpTzgLap8
 NZ/IJYpGgsaMdx+s8IpZM4I3mxs7z60Rtwaa3AVFSdPeuMLaD/BRj1aN9UJl4fkP
 jMf2xgKGjf0tmmtRAzbqPSVH1Zn+uU4dyZyHH0zO4L1OemdxyhWAxcMx6tMjmP1m
 bCnkE6g1JDLnBft0tLo26NztKXaLyd3Dj44YR2ES1DCzw2rGb/AstSDSuP8IaZOh
 EpzI6NcXNO3EQkukY27qe+Oa9x9qbyKZrn7Zf526wHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OdI3mT
 4nMejbMpZ4hAkqACsHiXaPqAYoek1WZFxJpho=; b=iqWwaHAlgLB7xEiK3dvDEt
 JFg9n3eHG55FOQ/GcnXBVeBQh87z34IZc4JYe7y9IlnPj9jgXi1Q8rzSa8Qx162z
 LYi15XHr+a69ARRqJHZSg13SIe1qkFKgInrnKN2R3aBASCkqMX49GdQuL3MAtsRY
 DtunjgioMlRrtU4u213JDZkCnbVggEO9Ze740JQIalA6Z9iK65ns6UMKJy+YiRPa
 afuhL+/KF1YK8d9ouwjPfysCTw/5d9UWVCRZU19/sAg7HzUqRkWJauIgXPmp8SjC
 6b7jybGBKZLLjfJ3Rm5Bia5f5N05cMl//4ZXycKYasN4eNzaAuxlZSkb7ofYDl1Q
 ==
X-ME-Sender: <xms:NW2GYLtu85wtpsF8KF7jZmlp4jTzdlTw_pSauQztMGDS_l00LdAmbA>
 <xme:NW2GYMdDfA9RF2UZz88ePNDuBGdNoXaODlHrB9P2SXE0InfXr-mi9COi0BhM1xJOH
 YBbH_dVz6fLL07sprI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddujedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuddvhfekkefhtdegiefhledutdevtdfhkedtleefjefgleduhfetudev
 jeehhfenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NW2GYOz9oUGvY4RVlLOc3zW2z_6JX9Ax-Nuw3zQvD_Ta5UTSCJ4BQw>
 <xmx:NW2GYKORjn70z-ucxeZvY7M3CDODFFzlKLNGl3Lziz8wZKnaiq4trg>
 <xmx:NW2GYL84FNKCAb5jEWC62UuqWb6QprPIhSoF87yqZ6GQVDzeeIsYEg>
 <xmx:Nm2GYGnB3YxH1GMqrNK7i-HMHslbA2Mb53IimoBZw_o_eJ2U1S1WYg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 385001080066;
 Mon, 26 Apr 2021 03:35:17 -0400 (EDT)
Date: Mon, 26 Apr 2021 09:35:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PULL] drm-misc-next-fixes
Message-ID: <20210426073515.5lxw64eota7usaq4@gilmour>
References: <20210422163329.dvbuwre3akwdmzjt@gilmour>
 <CADnq5_O39XAV+EF=CeKGK3UEG6E_6Gt_goW6u1+5siC5ROtz4Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnq5_O39XAV+EF=CeKGK3UEG6E_6Gt_goW6u1+5siC5ROtz4Q@mail.gmail.com>
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1478916835=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1478916835==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r5fddzlgqdb46266"
Content-Disposition: inline


--r5fddzlgqdb46266
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Thu, Apr 22, 2021 at 12:40:10PM -0400, Alex Deucher wrote:
> On Thu, Apr 22, 2021 at 12:33 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Dave, Daniel,
> >
> > Here's this week drm-misc-next-fixes PR, for the next merge window
> >
>=20
> Can we also cherry-pick this patch:
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dd510c88cfbb294d2b1=
e2d0b71576e9b79d0e2e83
> It should have really gone into drm-misc-next-fixes rather than
> drm-misc-next, but I misjudged the timing.

Yeah, just cherry-pick it, I'll keep sending PR during the merge window :)

Maxime

--r5fddzlgqdb46266
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYIZtMgAKCRDj7w1vZxhR
xbUiAQDhhuAKN0P7lzbziyqYqMmqiG2uyNI4NWL2l794nzy3AAD+MrvGQSDY861W
574SZxHUwFTaz5EiyAs5icoYz4G3hgY=
=rEV2
-----END PGP SIGNATURE-----

--r5fddzlgqdb46266--

--===============1478916835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1478916835==--
