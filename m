Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DAE38E5CE
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 13:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9236E203;
	Mon, 24 May 2021 11:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048F86E203
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 11:48:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7984B5C00DD;
 Mon, 24 May 2021 07:48:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 24 May 2021 07:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=M4uM525A9EdEenfyxCSJtV/Cbcv
 IXk+39bR9IA9px/U=; b=iMu3Rv0rHb3pir9dfEXjv6ff2o1LbLMJjM64SZCAU8x
 5YQKepeJfH4e6PoWcGl+pozTWs+QlylG39XiORO4inBCY6Et564KBwJHTCgjtA7K
 2w0gf93w11s9HqEgcK+mhDPKYqYJMizGG+0pJFn2q7VUcdWbKL+k06vga+rRi88K
 DYuMeHuf0kyL+mu1jPemf38HYoZO2uqH+RbXUE3Z4HibFNhYyj8iUSGKMrjDrzNd
 sLx2UUrcKppEz3ntnPiysZe/7QrLHuglMZyefUAUgmoMUVhHKphdBcgJSo6QU5sR
 lM50elpIGGE3g7LlKIAARXDAbCU4gyl+rlesmazkb4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=M4uM52
 5A9EdEenfyxCSJtV/CbcvIXk+39bR9IA9px/U=; b=bswJFF6a1D0WyWPTe8CpsT
 NP/Bob8ujcHOUY5RlnKWpWqLElVFegnizJtBU+lRZxmW1w0MvQRkFc79FuoEhAvA
 C1kJwy1ic9sqPvl2t0HDhnS9wd0qlHnN3yw4q/WPkYSpfOgVfaJb8w5ytpzZexgA
 yqQIXxUoMcMw9dBQ1B9OAPZidWDKTuZiB7woaAJG8fvcwyYKJ5nHL/gxNgoOfOCO
 VpBS2gFCASvFIJELJFCjHXIqQpYgVdWfJk+cBOlqZMh15/eHMqDLC3LfIzaCSYgU
 8UanokcIVa46kbqZELbKWrPNJrbdXf8iDS76BG6ZmYwUBTqgB680Vy7+u1bnsmYQ
 ==
X-ME-Sender: <xms:npKrYCJlDHx4cjgsUHnRtbxk3cCjyFNEMCSeffxlb2akbKC9GoVo7g>
 <xme:npKrYKK3cfOr3r34JkXL_dETk1Q7kWa_bSHZh39P1hEHWiKh1QJQ_0BBCjVtLxQIt
 6Q-Ba1ph1D0XU62fxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:npKrYCsUH49U1F8x0TFg08IF39GvQvUKoLdeqTEzRHZBugKJ8df8jg>
 <xmx:npKrYHak4QJRgP6B1DG26CVYBX9GCj2agLrBig1vPZHkFuJp917dUA>
 <xmx:npKrYJbO4CBCosN0qrOnGH9UfqZK4rihhZ1pwquqim21F09g7rgyDA>
 <xmx:n5KrYIU7wE7lfz739K4RSLbdMW2XXDQ_Q3xl0FVYbV5jwf0X1Jb7AQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 07:48:46 -0400 (EDT)
Date: Mon, 24 May 2021 13:48:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dt-bindings: display: ssd1307fb: Convert to json-schema
Message-ID: <20210524114843.ihhgdhup7crskf4j@gilmour>
References: <20210518075131.1463091-1-geert@linux-m68k.org>
 <20210518143317.yy2sxxnd7yt6cyrx@gilmour>
 <CAMuHMdXKaLpLL5Q1FnjHJ5kbs=+9Mm-QHXZp1i3M4zNr7G=e_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kawgr3kfamzs2jih"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXKaLpLL5Q1FnjHJ5kbs=+9Mm-QHXZp1i3M4zNr7G=e_w@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kawgr3kfamzs2jih
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, May 18, 2021 at 04:49:45PM +0200, Geert Uytterhoeven wrote:
> On Tue, May 18, 2021 at 4:33 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Tue, May 18, 2021 at 09:51:31AM +0200, Geert Uytterhoeven wrote:
> > > Convert the Solomon SSD1307 Framebuffer Device Tree binding
> > > documentation to json-schema.
> > >
> > > Fix the spelling of the "pwms" property.
> > > Document default values.
> > > Make properties with default values not required.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > I have listed Maxime as the maintainer, as he wrote the original driv=
er
> > > and bindings.  Maxime: Please scream if this is inappropriate ;-)
> >
> > Fine by me :)
>=20
> Thanks!
>=20
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>=20
> > > +  solomon,dclk-div:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    minimum: 1
> > > +    maximum: 16
> > > +    description:
> > > +      Clock divisor. The default value is controller-dependent.
> >
> > I guess we could document the default using an if / else statement?
>=20
> While clk-div has only two different defaults, dclk-frq has different
> defaults for each of the 4 variants supported.
>=20
> Do you think it's worthwhile doing that? All upstream DTS files lack
> these properties, thus use the default values.

I'd say it's even more important if everyone relies on it :)

Maxime

--kawgr3kfamzs2jih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKuSmwAKCRDj7w1vZxhR
xQUrAQDztdpV83mKelLkQAL8eURDG6cd9gD/7Ntvbg03LHwmWQD+JLtjeb3ucmns
yhOJHM5mokmAm7CAdDYGH4BhqetBzw0=
=C6df
-----END PGP SIGNATURE-----

--kawgr3kfamzs2jih--
