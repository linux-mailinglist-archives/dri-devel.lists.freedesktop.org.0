Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5C2F749F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04021899DE;
	Fri, 15 Jan 2021 08:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92656E24D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 11:43:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C157C161B;
 Thu, 14 Jan 2021 06:43:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 14 Jan 2021 06:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=EvFydPWoZX2zJB+JxKrRLFkgpd3
 O1rW/NFs1l1sd2cs=; b=OiOxYp83/QrQjvUfdjCt2sagWyjggCRPQu2SlGSEnSm
 GR19pVs8Xt/Tv/i04sV3kuFfnG7G5RwCt6Cb4+QdcfNO9h/CeAbGbnyl5IXlRrTj
 INlQm7BcpnO3vzcZe9UY+AZTqOwMFJtffW3TF6FFZgL6iGf2jtgnXBbDEI5rYjG0
 nZI6jUv6IUfEKGDX37P4JqNpNWGNmPUd4l55pT/rygB+CDS/fgt2AsMUl82t5qYz
 XGlaMgHfh4SoZAIcNB2QH4lcinXuvt63Tr+byiu8N2UOhi39h+PUdE4hLl0RXxLa
 eNfMYzlCfywvUvwYTIRo4pZv/ZM8jtUcCRNtwXoG6Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EvFydP
 WoZX2zJB+JxKrRLFkgpd3O1rW/NFs1l1sd2cs=; b=UqRSKcqeTiD4nLs/Hsbe+I
 v+7b+neNj7F7xfGRDuxDTO+wDBl5wQj2OGM3nCqV37s6tp9XqcFWyC7M2rNJ01X4
 GYbThoAZ7LKaDKjb0mOeF3NCHLUKGAzf0/AqZbLUBsCdqMDfO21VElNOpF/IFafS
 07e++/99SeqsSoJHDiSM5mexVg4nuEQdeFWRfXbAPodWKLa9nceEBa/o+Bq+mHKt
 dLHYR2Wi1VK7nZwcZc7SvOjRdqeimagX/jJZPtscoC3f72DPr7FJrSlxcMX4p9CM
 loe5JGQomBUWR9WJUP7TN3WtS6CPVhkGAZZE9DuYudKO8AgQx18BFlv7cI1S0KZg
 ==
X-ME-Sender: <xms:by4AYAc6tu4Tw80LWJZRX8Q0AOtAiwCslXdFC8dvILjpaaBkBc-ACQ>
 <xme:by4AYCMbIzTCIssegVSoydjWcnnVtf_kxoN22wUtEkJW7sp1fFK-HBbgIW83KixNf
 cGrv369WgSwuZrZZiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:by4AYBhY-BLkHz5FByiYSH8Pd33RBaTzgPt5UabXhMhkrskEVgP0CQ>
 <xmx:by4AYF9-5n2uEVIx7lA_2S9rx8NcHbCkvsg1YZUaT-VDlKj9gkzRGg>
 <xmx:by4AYMvshM7LCgLglRtm4gqyoc9mS3-Eh_vBOxb6UJhsdi0b_LCyfw>
 <xmx:cC4AYAgvUp_me-i8kibqp-eqf1fdOgECaB44lcprMP6nXQSLhiabyw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6271D240057;
 Thu, 14 Jan 2021 06:43:43 -0500 (EST)
Date: Thu, 14 Jan 2021 12:43:42 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V4] dt-bindings: gpu: Convert v3d to json-schema
Message-ID: <20210114114342.yxognfrkrazl2f3z@gilmour>
References: <1610564917-11559-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
In-Reply-To: <1610564917-11559-1-git-send-email-stefan.wahren@i2se.com>
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0699153774=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0699153774==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wj7rox6m6of62to2"
Content-Disposition: inline


--wj7rox6m6of62to2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 08:08:37PM +0100, Stefan Wahren wrote:
> This converts the v3d bindings to yaml format.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Acked-by: Maxime Ripard <mripard@kernel.org>
Thanks!
Maxime

--wj7rox6m6of62to2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAAubgAKCRDj7w1vZxhR
xYJqAQDm7tNI0F7G/PAfwRuT/510RnEOCxhcgFm0xoP4tAIufAD/Uyi2I4E89126
UAWuxLzMdVn1C2IzV4PyDCGOf4AEtA8=
=yT6Z
-----END PGP SIGNATURE-----

--wj7rox6m6of62to2--

--===============0699153774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0699153774==--
