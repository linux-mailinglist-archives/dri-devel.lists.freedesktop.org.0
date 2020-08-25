Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3F2528E7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2D889D7D;
	Wed, 26 Aug 2020 08:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Tue, 25 Aug 2020 13:42:03 UTC
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3E16E42A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 13:42:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BDD43C41;
 Tue, 25 Aug 2020 09:35:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=VVtlW4HhdtLjXxeuomS0ncEugVO
 xoM1/RkR8Lb06Uu8=; b=RoWNw4NKNj/bo2BclZ6HWv24uk7sVQAtdsimNHyLzZe
 0yZEQQxcS18OjLkqSKhhKV1Jv78o0UHGOgDADSdlpkStNmcVqTGGxA3EqVwqa8gV
 2Hl243tGBGlZRIebV7Y5v8oITRdx/jzZqVm0hmyxzzq2RjP4GL26GODGrTpR2jmk
 whHndsPso4pNAbbPnQ+N1Aceiqmaopy5S91vqU+n/XS8oILQBCRns4KrFTz8DQOw
 5rKXGPBSdqODUaYy8fcgPMDZkcoHXgQ0+UuG3j60GykO1LdcgyFmuo/hVAqDdTwL
 IZLqx3kj2O5psWEP0je5YQ9+Xcw2vk2V8URGy1GG9lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VVtlW4
 HhdtLjXxeuomS0ncEugVOxoM1/RkR8Lb06Uu8=; b=kSElpLqyWDgFaTEm16ppG3
 p10cDp/f3+RuHxdQhL5eJwBB5DlcaqzQa0rEPhH3d8wOTvgwlH/nuXVVtpWSxCK6
 I+kPVTW2wcFx5cZSoWZgCL/FQVS+8UrabvbFL25/HxhcEuwhc+Zy0MIsx0SXo6Ip
 qvlpz0V4In0BD9qcpAksfTOQFAT4itOgk8qzDE6Tik9yBLXDBZ3/Y/mNkP+NnjIM
 pNRIp403w5B635yfl5F6GK2G9odzQQwDxP0lp92+kLbQXMTU0Wj9Wcai6kr8grBT
 LmrmE0zSxQ/RU86zSqLef+uKutezy7m0ly2xbpmtcCGXAVn8qZZaAcVrDfTaRddQ
 ==
X-ME-Sender: <xms:uxNFXwC1BbrdST-ojgpYHi7mU6j962QR4yysdYsYC0wJrGvAabRjpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepjeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:uxNFXygtAnnreRsIA2TwVkzT1GLfgqHC150PBWfF1RWfppnZqs-4Ow>
 <xmx:uxNFXzmCv8JxbUoItmpMNdcy3zU1DlPSiLDsW4u3GiUrmx5O-eZidA>
 <xmx:uxNFX2wU-blq4aLQ60tO5oCFuYlLvBtx_cDr8cCx1nu3TSZDsP6OSg>
 <xmx:vBNFX2RRcSbsIhEQkNtGzh4o-LPJ1ESPmpimLf2eWPvSdTUhL2g9afrcvMU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6F4ED30600B1;
 Tue, 25 Aug 2020 09:35:55 -0400 (EDT)
Date: Tue, 25 Aug 2020 10:39:02 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH 0/2] ARM: dts: sun8i: r40: Enable mali400 GPU
Message-ID: <20200825083902.5o54lltoglbs3cui@gilmour.lan>
References: <20200824150434.951693-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
In-Reply-To: <20200824150434.951693-1-jernej.skrabec@siol.net>
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0309673338=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0309673338==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gemdfh7kx36fvawn"
Content-Disposition: inline


--gemdfh7kx36fvawn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 05:04:32PM +0200, Jernej Skrabec wrote:
> Following two patches enable Mali400 GPU on Allwinner R40 SoC. At this
> point I didn't add table for frequency switching because it would
> require far more testing and defaults work stable and reasonably well.
>=20
> Please take a look.

Applied both, thanks

Maxime

--gemdfh7kx36fvawn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0TOJgAKCRDj7w1vZxhR
xWEGAQDMARVYvs1kmIOcDlaG6HVY60QAfYio6XLChV8tPlnk8QD+NUSD51f0RiGV
2CCxdlX746Cq5lcsYWglELWDAYtnEQ0=
=OzYK
-----END PGP SIGNATURE-----

--gemdfh7kx36fvawn--

--===============0309673338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0309673338==--
