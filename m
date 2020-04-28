Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037071BD4DE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 08:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC7A6EC9F;
	Wed, 29 Apr 2020 06:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BDD6E822
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 15:57:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 59D541C2;
 Tue, 28 Apr 2020 11:57:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Apr 2020 11:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UeapUTooUsi8NUN5twL9bPAz6Yg
 /DJgy7xJgqDr5Y6c=; b=RLk9EM1C9TJEvZCAU5DJZ0cCSNanK5z1+QD4E7Ut9d4
 +iLj2VcNxVMWt0IJGCua/Ffy2XMG65Cr0smcaCNQ6MfefND1JC0eaQv3v6t+ene8
 vIbhO6SStety36zyW+DYBAOxRJk3ZNdbNDjUh2TVPJbvjSNnsy9x0e0xu1c2M8wf
 jc173DzSwV6rhtL7J6GPBJWzAYYYmxaq+88t2FREtl6AsvVKpYLpeb8N8g5ZpOoB
 iMh+V5KaT9jpgHvadzvQUNW494RbSEbKw9iWkBglIbr+KvkYquNwqq6F3Plrq3wJ
 Ks0h3MR/LSe0I+LjgNooNj8NJ/LvKOxkPJ1GFb+8mTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UeapUT
 ooUsi8NUN5twL9bPAz6Yg/DJgy7xJgqDr5Y6c=; b=hgDtuLchjXMz1TEkEUCBHw
 bUfyNf/9vo+YS+uAIhVpeb8q7R3LMXDl/lb40k0Yt35l9djrIarWIMJXKgBcn/qf
 67PtECtSJghbPBtG/65qpIsI9X0MMxzmVRqiXYulD3S9L4yq9qeZ280l5EbUpnjD
 Y1ouItmn4dfEKTg3de42m3Ovn7cu1dN7C6Vv3Mc7vcmI/zjP7kxiLTlAwqCW2/c8
 o6wX7AjobJ5utOh6qX4GU94rb6jyg1tbHjjI7USQF8COu5oNZ9sMumCVrrV+4zZF
 SbWZ91JdnCT7dKWMkFvd/Y04TiIBeuXSDtbI/cQAYEzaXjPjej4ziGKLpI4KW8Zg
 ==
X-ME-Sender: <xms:XlKoXlpiljCRuyEbI1P70oZLf3sZF27Th0b5wKxhdtwWIzMKTKT1lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedriedugdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XlKoXvITVDvxYw84oLi5IlO3HLnZEoiWzIY9G9SS3fmcuVrK0M6bbQ>
 <xmx:XlKoXoQAdJX7pouiH8Y4iaruQDf4vGU9llAm7J0U8G1xj9sxbGty0Q>
 <xmx:XlKoXu_ZOxxw57ufXt3rtmZHB_MTP2GeFsXio4LbpWm4q2IasfX4Xw>
 <xmx:YVKoXoxrLRzekRuL-T3mPvgCesyROqCeLee8hFDJ57WjMcKqHEWEGOqitAg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 124523280068;
 Tue, 28 Apr 2020 11:57:17 -0400 (EDT)
Date: Tue, 28 Apr 2020 17:57:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH v2 79/91] drm/vc4: hdmi: Deal with multiple debugfs files
Message-ID: <20200428155711.efpq6vbqcq52gjk5@gilmour.lan>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <4cd617827cc28875ef36f3632122a83cff2ea4a7.1587742492.git-series.maxime@cerno.tech>
 <63f9e71a-1beb-7a67-ea48-dbc579fa3161@i2se.com>
MIME-Version: 1.0
In-Reply-To: <63f9e71a-1beb-7a67-ea48-dbc579fa3161@i2se.com>
X-Mailman-Approved-At: Wed, 29 Apr 2020 06:45:00 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0971393589=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0971393589==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6nlx63qexjyyiyf5"
Content-Disposition: inline


--6nlx63qexjyyiyf5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Sat, Apr 25, 2020 at 11:26:31PM +0200, Stefan Wahren wrote:
> Am 24.04.20 um 17:35 schrieb Maxime Ripard:
> > The HDMI driver was registering a single debugfs file so far with the n=
ame
> > hdmi_regs.
> >
> > Obviously, this is not going to work anymore when will have multiple HD=
MI
> > controllers since we will end up trying to register two files with the =
same
> > name.
> >
> > Let's use the ID to avoid that name conflict.
>=20
> even with this patch there is a name conflict in debugfs using Linux
> 5.7-rc1. Dave Stevenson addressed this by using different card names
> [1]. Since this patch won't apply anymore here is my suggestion:
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 29287ab..7209397 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1181,9 +1181,14 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi
> *vc4_hdmi)
> =A0
> =A0=A0=A0=A0 card->dai_link =3D dai_link;
> =A0=A0=A0=A0 card->num_links =3D 1;
> -=A0=A0=A0 card->name =3D "vc4-hdmi";
> =A0=A0=A0=A0 card->dev =3D dev;
> =A0
> +=A0=A0=A0 if (vc4_hdmi->variant->encoder_type =3D=3D VC4_ENCODER_TYPE_HD=
MI1) {
> +=A0=A0=A0 =A0=A0=A0 card->name =3D "vc4-hdmi1";
> +=A0=A0=A0 } else {
> +=A0=A0=A0 =A0=A0=A0 card->name =3D "vc4-hdmi";
> +=A0=A0=A0 }
> +

Thinking about this some more, we don't really need VC4_ENCODER_TYPE_HDMI0 =
and
HDMI1, and it can all work with the same encoder type for both, so I'll drop
them.

To address this issue though, we can add a card name string to the variant,=
 like
I did for debugfs. Is that alright for you?

Maxime

--6nlx63qexjyyiyf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqhSVwAKCRDj7w1vZxhR
xXjUAP4soMkyOTFFSXXn/qMZXtJpGyIJR6qHlIruzu9KCXFNogEAqHA7EpmVcFbT
+9FFfp7tSgB32/xDKpblWqG4wa8yaAY=
=nBTY
-----END PGP SIGNATURE-----

--6nlx63qexjyyiyf5--

--===============0971393589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0971393589==--
