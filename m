Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 122AB29CE9E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96516E491;
	Wed, 28 Oct 2020 08:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04586EB86
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 14:54:39 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5E702580391;
 Tue, 27 Oct 2020 10:54:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 27 Oct 2020 10:54:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=UW+E2zW4VZ3UJMxESpcdsxmlJiw
 oieqYRzoHTXgnbW0=; b=XgvLsbAxk4Z7pmp8Nxz1jtzRQm//UA5mEDYBA8X/FbL
 KKjsM2NIkNWCQIywwzKkqDBLL4uMAIoWk1pKM9y17X6JiSRqtJsfSitEj/HV9Quf
 MAe+CDcMepUznuryAtfiWzi0fDkGJ1XTnp8xM15qydp3FELZFf79voTpYHx3jGKa
 3hJGEX4sx7cy1XPczlJe8QJXMpHymfrnzlr362tubaoxFkaQFLz+wzRHtr9D6py5
 oTjfT4dmTI5lJE1zkIMHix5UGm5Lrg9taEa9Hs8n7xAEAIE3nt9sBJJpy19JN/hp
 YxZOHvO3Td5NHJEXsSBfgdZrtZHgKOT12pmmtSu+crg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UW+E2z
 W4VZ3UJMxESpcdsxmlJiwoieqYRzoHTXgnbW0=; b=P2CJnQ8uuy9FH7czKoH61q
 LLSW5lizedJjUKo0MQj3NUG4aRK7G2jyg4qkhYzYWMVKjQGiGs1BJRr0BHt3Ek8I
 1tFPS/+I/aEcoR6bvuHm3vA3bCjnS64Wo8nWokF6zPMkUWAX/LCMxuBu/LaLxdzN
 RVNvp+FcXx18qYf+/M+nWlBNxL47z30KvBnc6E3dzECo5zBLo8frjm+dpQZNTQCb
 xdiytaAPPBDkR7D3AopbdxRZrgQn8iCExVgz43QZ0mkshLy06ffmmfpVvyVoA9Xt
 nJ7/xaRvvOGNUZuKlpmo5kBoT2rXcA1W6KRhfMtVcbvT/gSeEyXDnydyPj7xGn8g
 ==
X-ME-Sender: <xms:qjSYX8pFfMlV8R1cAmDDHtINi4OWwiVTBfOYDEtjx3-KSD7Gzdz1mQ>
 <xme:qjSYXypPyzowgHmZi0IIJaIMaICyrNw8B5gyuH3RhCUBohvmQ1btXCyzYAQNbKx_M
 2032qMHIKcEWGq-7UM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:qjSYXxPJyA-scb1IKYFP_IJ58uvSuC6cHLlrC6yj6vtrgaA3_2KQlA>
 <xmx:qjSYXz4bjDnp-ZxtumAIPjnsYuO_dzJ3KzO9rQDBmxXp-uYPtj6tLA>
 <xmx:qjSYX74RjX5yu3Xb5jgR6iO3skzUOYFx78Ic5vqBDOXDZmu4xCmuKA>
 <xmx:rTSYX4yPcxa1l_Dz1l_yRAm44oatfrLZ8YmYXWV_rk9iPjpKXLOeCw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 13C12328005D;
 Tue, 27 Oct 2020 10:54:33 -0400 (EDT)
Date: Tue, 27 Oct 2020 15:54:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH 1/1] drm/vc4: drv: Add error handding for bind
Message-ID: <20201027145431.zasv2oiydglz3n63@gilmour.lan>
References: <20201027041442.30352-1-hoegeun.kwon@samsung.com>
 <CGME20201027041535epcas1p489bbfe80b461f1e5c5deca1a571f1f35@epcas1p4.samsung.com>
 <20201027041442.30352-2-hoegeun.kwon@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20201027041442.30352-2-hoegeun.kwon@samsung.com>
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:30 +0000
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
Cc: devicetree@vger.kernel.org, sungguk.na@samsung.com,
 dave.stevenson@raspberrypi.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1957688912=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1957688912==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wxa2nq6hnmca3hde"
Content-Disposition: inline


--wxa2nq6hnmca3hde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 27, 2020 at 01:14:42PM +0900, Hoegeun Kwon wrote:
> There is a problem that if vc4_drm bind fails, a memory leak occurs on
> the drm_property_create side. Add error handding for drm_mode_config.
>=20
> Signed-off-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>

Applied, thanks!
Maxime

--wxa2nq6hnmca3hde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5g0pwAKCRDj7w1vZxhR
xVOGAP97fk3mnbTRj0i/hLPPsFBfQ4SlfOkkqL3lZO6PXlFQdQEA+sZ/6u7b+J7p
esNNHHdopvh+MLAwJW47eC/lLIZScAQ=
=oZCt
-----END PGP SIGNATURE-----

--wxa2nq6hnmca3hde--

--===============1957688912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1957688912==--
