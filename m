Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4AB2994C2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 19:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92E46EA59;
	Mon, 26 Oct 2020 18:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CB86E9FC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:22:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A736877E;
 Mon, 26 Oct 2020 06:22:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 26 Oct 2020 06:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ut2sdepL6yw92AQidtoDuLgidNS
 b+oeZ6y4ZTu894T8=; b=RNIYRpkubJ8ZCGrl7o20RCNm7kDwLvVC+B5iEc9WPXR
 BpUfgkT2KYSaVfvTNm9FTiQOLk7yAE6+zlrU6if0qru7Zu/VMTOZ0V7PwxweNsXv
 JSmufxq5tByVwVC9/zCEJ1lWiWdm4QP2PIbPERltjN3NUNABrVuKM8XfxjnAHfC6
 FSVrHMmTGx5idcJZp/Ioe91YjXgMt1EaPNQiFBEHPh9NaLwxff23tvuJgiFXjg/3
 I7dERMG/vGXyWiwpCWn+/Hr1s7JmysRjOGOocoLNlYCxI4CO4GFlZKWO7qXo3crm
 SmI26syXF5xZeevYkb1V3Nl/+mpovT2V0pWsErp6FZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ut2sde
 pL6yw92AQidtoDuLgidNSb+oeZ6y4ZTu894T8=; b=MCPTKKYXO1oSzvO5R75kcv
 AuYPcetwHj3Pu+hiaZdFnCns57Ar3pRVGvBLdmMI+OJ/qX2TimGflFA3dDcJEWaG
 oh5IIkR7zRay/cVgkiQEuvXtbJL5EkBAgwWtvh33T5mq+laB+65KYvbFdWy3peeo
 RctVIRikWge4x/yVtcJXA+ISm8ous5juqsom9NYnhTHCjrecqihUdR9WFIL4Clzr
 iECNU0lViGvM/IC+fBB5ILA8m1J5efBrOhLTAHqNDejT36Pxy29Q+2j16qKLRTPP
 D6x0nP8LeAI9prITLxKGlE4DsJKbQUzq7F2pYxq+EmNC3zx+SPTWZ2blIrjp+VeQ
 ==
X-ME-Sender: <xms:UqOWX_YBwNDm9QBBltiYAaN9Nx3w4VMpiI01hl3HITMRDwcv2evCYQ>
 <xme:UqOWX-b1Qc7LmVQ-K8B6t-cPlUijYHdEkfLd5-AIk2QIy-VWrpoxcPruW_dFkHioC
 xoIu0jrHX7ZFNVaSok>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeeigdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueevieeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UqOWXx-vajD4LY8Evm0pIfTBJ3S7adSuWE2W5HDT-gdff-Ro0x56mw>
 <xmx:UqOWX1rWOQ4XWf0utKasrLk3GdggbOM0C-a7VVdmky19Xpt35TYkgg>
 <xmx:UqOWX6rkcOjuT2CB4Xm1POsDdec1Z_brS995ka89Gn19_I_K6Go1rg>
 <xmx:VaOWX3CYgkQiEzpwszNtheKUMQoVGmXXwwF4OqX9f8a0hJmA8A2Wvg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 236A7328005E;
 Mon, 26 Oct 2020 06:22:10 -0400 (EDT)
Date: Mon, 26 Oct 2020 11:22:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 3/3] drm/sun4i: frontend: Fix the scaler phase on A33
Message-ID: <20201026102207.fgpzz4gffzl5vvgi@gilmour.lan>
References: <20201015093642.261440-1-maxime@cerno.tech>
 <20201015093642.261440-3-maxime@cerno.tech>
 <5606996.mc5IMTkvpr@kista>
MIME-Version: 1.0
In-Reply-To: <5606996.mc5IMTkvpr@kista>
X-Mailman-Approved-At: Mon, 26 Oct 2020 18:01:45 +0000
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
Cc: Taras Galchenko <tpgalchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0321879868=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0321879868==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5fscyzlzvuddiuta"
Content-Disposition: inline


--5fscyzlzvuddiuta
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 07:16:52PM +0200, Jernej =C5=A0krabec wrote:
> Hi!
>=20
> Dne =C4=8Detrtek, 15. oktober 2020 ob 11:36:42 CEST je Maxime Ripard napi=
sal(a):
> > The A33 has a different phase parameter in the Allwinner BSP on the
> > channel1 than the one currently applied. Fix this.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>

Thanks for reviewing those patches, I've merged them

Maxime

--5fscyzlzvuddiuta
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5ajTwAKCRDj7w1vZxhR
xYfCAPwLf7s++FWhEnckRztmWT6oMgbTrdiHToH0Kyxnec8uvgD+KaXdO6BFsxI4
Vr7l18eTI8ACMHMXt+7goL07sXc6CAI=
=gTeq
-----END PGP SIGNATURE-----

--5fscyzlzvuddiuta--

--===============0321879868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0321879868==--
