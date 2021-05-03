Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A837127C
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 10:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AACE6E886;
	Mon,  3 May 2021 08:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F1A6E886
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 08:32:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CCB7E580B19;
 Mon,  3 May 2021 04:32:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 03 May 2021 04:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=J6nQ0/KfuR+05YIPzSL8wfLQo2Q
 of4u03261kWGVE+g=; b=kClSMLa5mcDshITiOjB2rxcqeMGTFa5by0oppWXQlz4
 vS8Bj7jKdxV+CP6iR+nvNh5Fab+DFHTJgBZxcq1Ta8g1nVgdRblFsHloyA21nkwX
 +1u06G7CJOVI0IfY7cmlZ4xYSdRn74j+D9dxKYMZW7sqQ+0z8gDHIiSvqgMNrWIx
 uxVSXmKmyHeJN0CYEXQRmUsLtb+ThsMqjvkeRJo6kVeAyqXN0ePSvwLX1Z+QAwLe
 lzABQtw3knzhzD3VYPQ6wnU4eBIsHndtYlzXgnOr7unV3LB4PzfvWH2MtuYESk9+
 G+QNoz2YOx8yqVTaQbp4vOLQzTuM1GUx+GItnG/kgGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=J6nQ0/
 KfuR+05YIPzSL8wfLQo2Qof4u03261kWGVE+g=; b=JsnGR/sSFj0eVVrpr/pGFq
 KX90ABdFWvenrIUsi7fxr/Hj+GRf4o8oRwGH1uhfIzQM+sdrNZ0FZekhB3OSddCY
 6COh+a9fwX7JR/ElWdVSO9mjvvhQF/t5b4qHehenVizxXniaU4BZzWpAbgiGuDao
 HgowfPShNjKyTuwAlv32cvElFbHn6mBzcNxcHmiVvFZX4/8OFXLIIQLf92sw8AzV
 LaI0CG1wYNuQpvJTDVewkCbxmOSaMO3dszxlPIx8Y+hwj5YsZlq6uFQKy+Y473v9
 YnqIYal0vZZ1MH3aIDle5Shomnsp3SqdGb8lTfmP69lzzvicFGX6u4dlowTXk58Q
 ==
X-ME-Sender: <xms:F7WPYD7iri4vLANzRxeF5W2FB7GkVagnPPvTN-Z6EavRAkmR9mITVA>
 <xme:F7WPYI4k2Jzudz3tDq2s0M9LiZ-dWuiWRz9awgjCdjd1hjfi865e63Gx_EbwN5Or3
 Cmwyhpa6OxLe6EHEUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:F7WPYKd8J8eQLyF6iI4Mf2SPPIDv1lNCwary5ppNbv4YvM5EljQ1Yw>
 <xmx:F7WPYEKJpUYybaaQsIf9DxUu1WV7xzCPwxcYDM-QPlyL34GmevKJZw>
 <xmx:F7WPYHKB6M4eZwZ3Hu_OOvViQ7qUmBzyPiGAuzzHRNzvC_B_wvH8pQ>
 <xmx:GLWPYGZ3NBRKwPqZDtsJOKCoJ3DAyeWaj4SuO5wsWFy3y_xaDZIFlw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon,  3 May 2021 04:32:22 -0400 (EDT)
Date: Mon, 3 May 2021 10:32:21 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/2] clk: Implement a clock request API
Message-ID: <20210503083221.qsdurp2f3bkwfa6d@gilmour>
References: <20210413101320.321584-1-maxime@cerno.tech>
 <161981637939.1363782.4943687720432536625@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
In-Reply-To: <161981637939.1363782.4943687720432536625@swboyd.mtv.corp.google.com>
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
Cc: linux-clk@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0108293453=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0108293453==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ojju5rho7xzck4mj"
Content-Disposition: inline


--ojju5rho7xzck4mj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, Apr 30, 2021 at 01:59:39PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2021-04-13 03:13:18)
> > Hi,
> >=20
> > This is a follow-up of the discussion here:
> > https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmo=
ur/
> >=20
> > This implements a mechanism to raise and lower clock rates based on con=
sumer
> > workloads, with an example of such an implementation for the RaspberryP=
i4 HDMI
> > controller.
> >=20
> > There's a couple of things worth discussing:
> >=20
> >   - The name is in conflict with clk_request_rate, and even though it f=
eels
> >     like the right name to me, we should probably avoid any confusion
> >=20
> >   - The code so far implements a policy of always going for the lowest =
rate
> >     possible. While we don't have an use-case for something else, this =
should
> >     maybe be made more flexible?
>=20
> I'm definitely confused how it is different from the
> clk_set_rate_exclusive() API and associated
> clk_rate_exclusive_get()/clk_rate_exclusive_put(). Can you explain
> further the differences in the cover letter here?

The exclusive API is meant to prevent the clock rate from changing,
allowing a single user to make sure that no other user will be able to
change it.

What we want here is instead to allow multiple users to be able to
express a set of minimum rates and then let the CCF figure out a rate
for that clock that matches those constraints (so basically what
clk_set_min_rate does), but then does allow for the clock to go back to
its initial rate once that constraint is not needed anymore.

So I guess it's more akin to clk_set_min_rate with rollback than the
exclusive API?

Maxime

--ojju5rho7xzck4mj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYI+1FQAKCRDj7w1vZxhR
xTMQAP0elV2uSlbu/N/umOikVWwqHSR4+Zjv9XZ1+PjRVm0tYwEAtNHYYQWnyauP
n0zWwwpA17OqaRECQDk7YDIPgiLPYg4=
=IIJ9
-----END PGP SIGNATURE-----

--ojju5rho7xzck4mj--

--===============0108293453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0108293453==--
