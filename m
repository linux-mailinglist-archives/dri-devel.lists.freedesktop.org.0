Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1C921048C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836AB6E7D9;
	Wed,  1 Jul 2020 07:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C2689CDE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 07:42:22 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DD2D55C0198;
 Tue, 30 Jun 2020 03:42:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 30 Jun 2020 03:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0DHtvsCozqCfxy01LPpZvG1dO/6
 94+9yCwsCQkhOfkY=; b=ktlQX4EjBgi2ZOdexM/H5Caj3uHNI2aLjQ6glde/T+Y
 tRdvAm6ti2PpFXt9rDQsFUUKzw1ufSrO2vma8AZ8TPBzPG7nQbdjof3BSfDUX/U8
 oRF6foMciZzxghB2Zvdm2Yo1ezaXODRcDZHh9A5/esqfYYwoabW80czBF07qs3Ao
 d70cPtl8sQTmg6e/lcVams3yganEcqInNsuJWc3rOCQPVt7n/PzEXxiNzvFklhP2
 SZWgP81gSwDx1dITPTLzkvFnJV3ad04jp/YuRalTpmB1OQ5n26gh3ug75sB78nqj
 VmSf3SXUzdRZq6kMNrnhdPVFj9xWvvl6qi2oFi/WuLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0DHtvs
 CozqCfxy01LPpZvG1dO/694+9yCwsCQkhOfkY=; b=UFCfoBIMxSIeRuv+u3PB4T
 PqsZ5Y5IJet0Tt4TxML12g1Hs+kY3mrwgLC6dffUTpUfS9QvCSrGRkUH/iSpEWhv
 3T9GOySVyVxHgbxdCuOZ22QsgiwFjzGkYHRLK+mDrZr+pquprSI5CA5Y/veaonXn
 1PiTpUujDgGyaYqE8FKTfP5MHWMmOiN9u3IsgqkPVzc46Thk3XSYRiCeWQC2n2jA
 uF6tZR94mfCXgcoGNoaQpPlDq8kD2DGapNVWzroBWY2ylE5PcgK5CSjFMvmIbVCE
 parojsS9S41JD/FDN4SsZf/ZHGF8tP+TIzw+EePgDso7qA9byehnOy/vqRtxnK+A
 ==
X-ME-Sender: <xms:2-z6XjTpHg4zP0mmeUfu1uMKKOde-g7o0kFVC-qoQtp-BeWukjHI8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddttddguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2-z6XkwflCSS2X7GYqwm33s9vuwNwTmN658UL-csWgNvRUO3kizv_g>
 <xmx:2-z6Xo3zn2BzaktfBtkcLd7zo4YTIXQH90WgSJkJB0waY4uTGcGI4Q>
 <xmx:2-z6XjDNyulNgYmbDiWln8spuei8OoGdse5mCewxmo2Grkx72JEnmg>
 <xmx:2-z6Xma3n-I_EM8d9w5hPFJ9OAZAX7RqKw-dftklAhgLJvHL1OTIVA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C74E83280060;
 Tue, 30 Jun 2020 03:42:18 -0400 (EDT)
Date: Tue, 30 Jun 2020 09:42:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] dt-bindings: display: vc4: dpi: Fix panel warning
Message-ID: <20200630074217.ft6wdubalslkcb2u@gilmour.lan>
References: <20200626121131.127192-1-maxime@cerno.tech>
 <20200627105010.GA1960474@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200627105010.GA1960474@ravnborg.org>
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1125531219=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1125531219==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="isrfr6evkzeuxcdt"
Content-Disposition: inline


--isrfr6evkzeuxcdt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2020 at 12:50:10PM +0200, Sam Ravnborg wrote:
> On Fri, Jun 26, 2020 at 02:11:31PM +0200, Maxime Ripard wrote:
> > The example used in the DPI binding before the conversion to YAML had a
> > simple-panel example that got carried over to the YAML binding.
> >=20
> > However, that example doesn't match the simple-panel binding and result=
s in
> > validation errors. Since it's only marginally helpful, let's remove that
> > part of the example entirely.
> >=20
> > Fixes: 094536003e06 ("dt-bindings: display: Convert VC4 bindings to sch=
emas")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks for the review, I just applied it's
Maxime

--isrfr6evkzeuxcdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXvrs2QAKCRDj7w1vZxhR
xdbjAQDScWS6DXdJ2ySfh5ZkVw552IEDn8unq71dXGMtZRoI+QD+Or7PoRaTb6N4
0SQcon3IPJLVplZQk8ny4YDPW/wz4Ag=
=ECI3
-----END PGP SIGNATURE-----

--isrfr6evkzeuxcdt--

--===============1125531219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1125531219==--
