Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 588DD6CF3D4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 21:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8059510E1AB;
	Wed, 29 Mar 2023 19:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4832010EC05
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 19:58:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E1EBC3200902;
 Wed, 29 Mar 2023 15:58:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 29 Mar 2023 15:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680119884; x=1680206284; bh=2U
 pu4KS/HglgZqR5QPgAuFmmlBS7eNJtiUFPyeWRlVg=; b=ji4rtCkiOQkBU+MsPc
 TZUZ27CAkQZLcaYtr4LvaerHn0KLrfz7wsUxjDfb06+6AUEcmCai/nmbD849mds6
 pAyXoiBRd0Y0oHnAuL5j35CnwuuTf1KWDR9KtLgsiL+US8VKk8PZlC3w028BvYee
 fw/luSJ3pPsxM80NwyQPF/Y1E8aa0WGQRxS/GnoLtjWssvxZH6lV39nD9jL4H3Dc
 QhaXiSq5CwoRd5/uRjl/S/x78e/OKbLdRPcoKljYa0Yu1bBTNu3VTR6uWGO06zvq
 /CU1/fqNelBCrC0+ZysF316g3fe2RfhRb9NX0zncglvh/dree6R/86/9W12jJICU
 qAaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680119884; x=1680206284; bh=2Upu4KS/HglgZ
 qR5QPgAuFmmlBS7eNJtiUFPyeWRlVg=; b=SrDiGXfwY6CSrYJm1C4SYYpl4AR0e
 ZlN+XAsubo35P8rS2DUAkRhc8yh7hRuXYfg+x2F35AjBrhE5UJgPiiRMmeLh7rQZ
 oLryKLu+yN5kDNVLTZd0FFWjocCi88QB9HBT2GM5OSQvYbKL+j3EzIL8ndh1a9RZ
 RCTNRfczpXW8+GPLrpa/J4vWxHGUl9LmGxmG0iH2oTYj7GRdhVmDV96cA4D2xcur
 Zte73guvCKL0ieYsH1BTuKydJO35kW+X2Oe+KTW4dqTbFsKc5DNABD1+7Je7r8Xk
 QjfEi6zOXYPQgNjUOSxfvL9MbYHm066MaeaouIbPtRxqH6h6ojO4G2NaQ==
X-ME-Sender: <xms:TJgkZDyVPGfArwiyhiO_4YqU0eeRmpLEjai9C8t6o3NLBS24P4wJvw>
 <xme:TJgkZLSOJUZWrPXjNWZYbOi0uwvXn6X1mdT1nMDvlzdPaBjC5h8SaBcyCV0N9ZD0v
 vuKtSMOy0IslKDWEHE>
X-ME-Received: <xmr:TJgkZNXSgzlyzDj2S-lMse_divkUXcVSRyaHxxyRQgQJLzCCEZctCggl8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgudeghecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepgfduhedttdegudffuefgvefhveejtdevgeegteejudeuueefvdfgkedv
 uddvhfffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:TJgkZNiOy0NNiLs6jtU-UqbKfEJgy2XisDuW_MGv49iIEMGCFijEXA>
 <xmx:TJgkZFCmZfvFNwjrQbIO2ZsG7T9h4ThbAbbXR59M_iDxHF7jeR32Tw>
 <xmx:TJgkZGJMWpD0ZAktr1H51Na3VEl8mVHib3hm093mPvxZMPsfSkV1bg>
 <xmx:TJgkZJsVwqQYWDouSV7NWKgcQHah2zmnUbTLMTaI32Lv0ZwIlcl74g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 15:58:03 -0400 (EDT)
Date: Wed, 29 Mar 2023 21:58:02 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Roman Beranek <romanberanek@icloud.com>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Message-ID: <20230329195802.veybo3367zifw77n@penduick>
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev>
 <20230327202045.ceeqqwjug4ktxtsf@penduick>
 <CRHKFX934UA0.1MCKCD8SJSPIE@iMac.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jhubbfpnry7jtl6t"
Content-Disposition: inline
In-Reply-To: <CRHKFX934UA0.1MCKCD8SJSPIE@iMac.local>
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
Cc: Samuel Holland <samuel@sholland.org>, Frank Oltmanns <frank@oltmanns.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jhubbfpnry7jtl6t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 01:48:33AM +0200, Roman Beranek wrote:
> On Mon Mar 27, 2023 at 10:20 PM CEST, Maxime Ripard wrote:
> >
> > On Sat, Mar 25, 2023 at 12:40:04PM +0100, Frank Oltmanns wrote:
> > > Claiming to set the divider to a different value (bpp / lanes) than w=
hat we=E2=80=99re actually using in
> > > the end (SUN6I_DSIO_TCON_DIV) is somehow bugging me. I feel like the =
proposal that I submitted is
> > > more direct: <https://lore.kernel.org/all/20230319160704.9858-2-frank=
@oltmanns.dev/>
> >
> > Yeah, this patch looks better to me too: it's simpler, more straightfor=
ward. If Roman can confirm it
> > works with his testing, I'll be happy to merge it.
> >
>=20
> So I've just found out that my understanding of what sun4i_dotclock is
> was wrong the whole time. I treated it as a virtual clock representing
> the true CRTC pixel clock and only coincidentally also matching what
> A64 Reference Manual labels as TCON0 data clock (a coincidence to which
> DSI is an exception).
>=20
> Now that I finally see dotclock as 'what could dclk be an abbreviation
> to', I to agree that it's not only straightforward but also correct to
> keep the divider at 4 and adjust the rate as is done it the patch Frank
> submitted.
>=20
> In order to preserve semantic correctness however, I propose to preface
> the change with a patch that renames sun4i_dotclock and tcon-pixel-clock
> such that dot/pixel is replaced with d/data. What do you think?

I don't think it's exposed to the userspace in any way so it makes sense to=
 me

Maxime

--jhubbfpnry7jtl6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCSYSgAKCRDj7w1vZxhR
xQgyAP4iRhVGZNaSGJ5BGI2H6CXWA1Oi2JNtRr4PQZ4IkSWWIwD/Zqs+v+sDPinR
jz7XAk8q+wY/CSPp0d7d34Th7Zj6qgQ=
=KqnG
-----END PGP SIGNATURE-----

--jhubbfpnry7jtl6t--
