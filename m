Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9941F21805C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C196E877;
	Wed,  8 Jul 2020 07:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482816E107
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 07:57:43 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6CD2D8EF;
 Tue,  7 Jul 2020 03:57:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 07 Jul 2020 03:57:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=j7sSx1cBu9YuUeC7JdCp9Jeeary
 0gtIrnpNwyxVy2dU=; b=Jj0Ne0KoCPd6PlV/IjzQ/IURNgTcep3j/Z5F5hXbDKB
 4qcOQCX7Q6I6OyQfSOIYLEcpcJU5K5ew9S7WteiQ0ca+QH/tAO9tyQiQhoGsdxC5
 +n7gHCO4fXitxBZlRUWlkGv30E6yfnOa+w9mZo5nc5RNmMpT3Y54bo0fbMF2HHm0
 rLxmCzaRwOuvacIsjzIVt62CCxE6pgivOS0pYEopoxbucj6x5RtVr5ATLhcorRI0
 pYaZd5AV02AN9+S2b5d+rvD/O2G+4HLAOZsqURUT1mhtaO0BwyLozwZQN6Nbd6jL
 Ow4Mqc3IDdoGUPcyc5+BsntbPXgqwF8z9Az16VUxAUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=j7sSx1
 cBu9YuUeC7JdCp9Jeeary0gtIrnpNwyxVy2dU=; b=rHs+EZH5RhddgHc6AvXcum
 Js2lpq707FZv2zxjPpJuLBFz1s7HGVK1DegE9NEspA0NqhstYweujnBInmFgA/gn
 XB0QeI8dUTnZBLeEzlpsFJqm6rm75HqN3KQ8jsVIBaFxjgAtBY+XeNIkEsu81W+o
 PVPCGS+aFtOi80bSJxetA0mDpRtvWeYAK9I61a873nJ88E52dC//O3rvg3rxryr5
 NILE5LYAI7EiM/kDPCsMkV9U3Tuyzuvi9CBLQHtwGZXhxRoPafv3fXoit/Nb4fVM
 V/PaR1xOOqS60NhV6YGbBYZHiw6gApSIpzzJD/VwkA4QTzCXUWoj3PCMKjKoztxA
 ==
X-ME-Sender: <xms:8SoEX0743jfyTevsS0YhsVIzGM-z_-6lpD0d5l-M34e-nQ4wf_J9ug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeggdduvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8SoEX17p4_DCQK8BHJVraIIaclOLu_lkxfwFu2pzy1-z9enHVvaGag>
 <xmx:8SoEXzcpvfJ96ZKxtiOVKJSvndxnJpjeJV3ecm8yG9pzDJP797qW0Q>
 <xmx:8SoEX5JiKUPIeAxdsEN3xM0Q2FO0xHSalQMComyxrJD70PRxSfWi-A>
 <xmx:8ioEXyhu_2S5l-yYihPxHDrizYolqzmmWHCxl_yaaR6yScUEV6St_w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D337328005A;
 Tue,  7 Jul 2020 03:57:37 -0400 (EDT)
Date: Tue, 7 Jul 2020 09:57:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] drm/vc4: Convert register accessors to FIELD_*
Message-ID: <20200707075735.dzegt7d3d52rhmyv@gilmour.lan>
References: <20200703135713.985810-1-maxime@cerno.tech>
 <CADaigPUo=Y6Z6N3jMF9r+xgxQ2Ec_dYUp3vchXyfVqnApMtJkQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADaigPUo=Y6Z6N3jMF9r+xgxQ2Ec_dYUp3vchXyfVqnApMtJkQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1706213128=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1706213128==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="323s6f5udl3nvubx"
Content-Disposition: inline


--323s6f5udl3nvubx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2020 at 09:57:04AM -0700, Eric Anholt wrote:
> On Fri, Jul 3, 2020 at 6:57 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The VC4_SET_FIELD and VC4_GET_FIELD are reimplementing most of the logic
> > already defined in FIELD_SET and FIELD_GET. Let's convert the vc4 macro=
s to
> > use the FIELD_* macros.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
>=20
> Reviewed-by: Eric Anholt <eric@anholt.net>

Applied, thanks!
Maxime

--323s6f5udl3nvubx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXwQq7wAKCRDj7w1vZxhR
xSr7AQDTeTQQEb/LZeEesElW10abLqxa6jCFEAnXr939qJiYDQEA2fPJ03gh4yHj
BxB0ARShVO9hlxBL4dotZ36x4Z93TwE=
=n7JR
-----END PGP SIGNATURE-----

--323s6f5udl3nvubx--

--===============1706213128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1706213128==--
