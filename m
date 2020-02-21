Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D97D71683B8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 17:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0DE6F4CD;
	Fri, 21 Feb 2020 16:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1C86E2BE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:26:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6128821D25;
 Fri, 21 Feb 2020 08:26:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 21 Feb 2020 08:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=gVU2eTz5BGWktfD3OmcPbB4Fnbr
 h4G05fM39zqichlk=; b=kXmy1NEkzkfppwmu4OEbS5Zr9wgfLIfcY7QwojdFs+J
 nUnEORzVLWPbfRV7dxPhOPWDe1q+MFh3MNnE7iqMYIM0z0fXQLbIy6cwN7HOGH8n
 nBJ22EEvqhyLtNNxhVWBHzeLjMJ/4rO8d4MDkNtwR4EBEc2yEg/QegGQJfwyzwXN
 OAHfuFwF1xeusbaILP0ZJGyjGARXIBTevYfoCq3UgwpF3CXOHWv7UG69GG0YF4oy
 ALo/zPP4PbLEQeZ7OjElRVXUC88VVE/1++EPWYrNXuQ/q7s+xa1v2stq6uxMe+n+
 HpvV2UC7toVCyXWBwwzCaPu4KqlM4Y6+eeOAhFK4c6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gVU2eT
 z5BGWktfD3OmcPbB4Fnbrh4G05fM39zqichlk=; b=IshiBhERftd1y2cVr7BD0C
 8tp917z+XmZiifYyjZolgTJX7A/1lAGwdY/68YhGggyOEnLfZJal8QfantlJS5WR
 iLPOtjDZBjrvYQBvTyQ4SX0EbYJX9VHUhExmSv1KqorVwc/3sll2qdmHoZLlhrbn
 JFL6szNG+qWeL6Dmi9wALnFJ6OmznpBd3YRPbkRbfqg1guVuh0EJsfpoOX406Qsf
 Bu0Ajg/ChqPq7F8BJPeWq3M7s1HQgD1xnxGozBc6UsxfntIHUz1lg89PoYGwtF7J
 ZYVY1j3sFP1hDyatvQ0T9KtKnVnmVXsPF9A9gkM/Aeo5LNxghd1GIFJ6LfinLB9w
 ==
X-ME-Sender: <xms:fNpPXjzstiSr5Wo4m0u-LknVmeTTlBavU1W-JSfL5zGOvnkyTuapRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeeggdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
 dttddvnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghr
 nhhordhtvggthheqnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:fNpPXpPFqR_T5YaW0DVyaTMigHzQPk-ekrEx0OSfQsquJZhEskprqQ>
 <xmx:fNpPXvpywJfKZ8Ya56ya0Ivst16xu3umgYKeK4PYmyp63flYdIQHgQ>
 <xmx:fNpPXiHreJeNZ6H1IHDvVAwOcRc5voIV6izaldULNH8ajBgKlkXDCQ>
 <xmx:fdpPXsTdkNJG1MdqsGv9l7q3uQVCO_LvWz56KXpryXc9YXHtWYsZpg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9F0F63280064;
 Fri, 21 Feb 2020 08:26:20 -0500 (EST)
Date: Fri, 21 Feb 2020 14:26:18 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] drm/sun4i: tcon: Support LVDS on the A33
Message-ID: <20200221132618.lonh563jzmzbyfmd@gilmour.lan>
References: <20200214120934.107924-1-maxime@cerno.tech>
 <CAGb2v67L9uMQJfx7BBgGUSq7D=LEE1w89s-kYQX+u3iPtrJX_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v67L9uMQJfx7BBgGUSq7D=LEE1w89s-kYQX+u3iPtrJX_A@mail.gmail.com>
X-Mailman-Approved-At: Fri, 21 Feb 2020 16:38:28 +0000
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1641611890=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1641611890==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iggi2um5qsfmp5qg"
Content-Disposition: inline


--iggi2um5qsfmp5qg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

On Fri, Feb 21, 2020 at 11:10:47AM +0800, Chen-Yu Tsai wrote:
> On Fri, Feb 14, 2020 at 8:09 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The A33 TCON supports LVDS, so we can toggle the support switch.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
>
> The user manual doesn't list the bits for LVDS signal polarity though.
> I assume this was verified with the BSP or actual testing? (or rather,
> will be in the LVDS signal polarity patches.)

The polarity stuff is a separate series :)

But yeah, both were tested on hardware.

I've applied it, thanks!
Maxime

--iggi2um5qsfmp5qg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk/aegAKCRDj7w1vZxhR
xe1WAQDRAxv0CunuTF31mcwpiIU+JC7FQfX0s4f8uDnNOsDMeAD/ZTPT+nfs0zkL
fOUlgcv9iMCTEFVI5O4e9K1rt352aQs=
=Py7j
-----END PGP SIGNATURE-----

--iggi2um5qsfmp5qg--

--===============1641611890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1641611890==--
