Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265333419A5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 11:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CC576E9DF;
	Fri, 19 Mar 2021 10:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D116E9CC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 10:13:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A7ED2580987;
 Fri, 19 Mar 2021 06:13:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 19 Mar 2021 06:13:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=HglB5UH3B0OAE7O13cdbTL4IU7f
 4hkPDeGRcwCtZZgk=; b=eQpQc237+OQXGXL4tVU/8QrcNmgi8JGPSixrr4fToov
 MWagydn0hE875bjTPUFTAhr5P9ZlzGq64yTlcHssQp7F7+Cm4v7YZ/SuxJuNxOmw
 49Lu9BtDtQRdZPwgLTH0OiKBWWiJHVr/Ru28ued8flE+mYMlx6JkY8A+VieZ2bMC
 ev/emNeLepkTUomKfIrQza7Pox/eE7jY70Xij04IRzbIhKqwBggRVnE1S4UFqS5g
 rFQP/0nI0hHvO3WeJWtSuUbg03QIV8qvxgcBjtc4Qjh8T46Iq728dWDHcWOu70qH
 aAVGv0WhQc8EfW/M/qJE/owgeHkhfWBcss2MGJzyMDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HglB5U
 H3B0OAE7O13cdbTL4IU7f4hkPDeGRcwCtZZgk=; b=kHAO7Q5bxuMRclQCcXvWnR
 1/bhi3NIhSubcpMchfexS1COaxK38G6d/URSjHXcFJFC/AjAc5icPJsBtVBGgQud
 8aSZySufWePVFSHRo3YXIYkfxTwc08n8lj1WgNnce1P6AZc5nq9yYVMMmWW+Sys8
 nLHTuJJ1SlNfUO3J7XO+bZ+AJVkhLCDKWfU4nn8SXwqjalgtnWppSXLyDGw6VoIb
 dkr9rYUENxDUZX+n0SuLY6jw5qwGQEfeWBFlgTl3Ne8gIH7+q8GR/lciVsx3f2d6
 KQlbSPeoHHrE0gqn5Pxsyg/GFoznI4dT7qyntgWziSmtSGnhII+rfRSz7ysKlKgA
 ==
X-ME-Sender: <xms:NXlUYFcshNQtOn1AlJXdZk5Eq2arFLn397WLxmYnMofg6jtY-UnEjA>
 <xme:NXlUYDMnR9aCjBQnI1fNwSeglaSSiymDHNiPf3XEOefrdrKVpF4rngrmZ1Xp4ip-e
 g0VnD6nYqZkcg_yxcM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefkedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NXlUYOja533pFqgwWeTXQ37roEJ7kSfClg9DvC2VIqnbPQMfmbxGDA>
 <xmx:NXlUYO8QKC2s5at00_37Lhb2VzelSIQTLliOnaC38AdQHB82kk3xOQ>
 <xmx:NXlUYBu03VMsZFZRStB45-DP2k-kd-b0CfrPvDJikSwi9rRXLWWB_Q>
 <xmx:N3lUYKEgWYMQcUZNmS3Robe1j4XzMSzjKR_x8IzN_6Ru5ijcomojUg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3E64E240068;
 Fri, 19 Mar 2021 06:13:09 -0400 (EDT)
Date: Fri, 19 Mar 2021 11:13:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 00/18] drm/vc4: hdmi: Add Support for the YUV output
Message-ID: <20210319101307.lznvguod2zvpxqp4@gilmour>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <4209616.oJxVDHRhuA@kista>
MIME-Version: 1.0
In-Reply-To: <4209616.oJxVDHRhuA@kista>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0934091401=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0934091401==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ao5xhbjudcipmpt2"
Content-Disposition: inline


--ao5xhbjudcipmpt2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Thu, Mar 18, 2021 at 07:16:33PM +0100, Jernej =C5=A0krabec wrote:
> Dne sreda, 17. marec 2021 ob 16:43:34 CET je Maxime Ripard napisal(a):
> > Hi,
> >=20
> > Here's an attempt at support the HDMI YUV output on the BCM2711 SoC fou=
nd on
> > the RaspberryPi4.
> >=20
> > I took the same approach than what dw-hdmi did already, turning a bunch=
 of
> > functions found in that driver into helpers since they were fairly gene=
ric.
> >=20
> > However, it feels a bit clunky overall and there's a few rough edges th=
at
> > should be addressed in a generic manner:
> >=20
> >   - while the format negociation makes sense for a bridge, it feels a b=
it
> >     over-engineered for a simple encoder where that setting could be a=
=20
> simple
> >     switch (and possibly a property?)
>=20
> Property could work, but possible values should be then limited to cross=
=20
> section of HW and connected display capabilities.

That's a good point. I'm not sure if the userspace should expect the
list of values of an enum to change under its feet

> > - more importantly, whether we're choosing an YUV output or not is
> >   completely hidden away from the userspace even though it might
> >   have some effect on > the visual quality output (thinking about
> >   YUV420 and YUV422 here mostly).
>=20
> IMO driver should select highest achievable quality. So in case of
> YUV420 and YUV422, later should be selected. This should be the case
> even if the property is implemented.

Well, it depends on the hardware capability. On RPi4 in some situations
(high bpc count), we can't output anything else than YUV422. I'd expect
to have some way for the userspace to know at least. And then, for
subsampling formats it's fairly easy to tell which is the highest
achievable quality, but it would be pretty hard for YUV444 vs RGB?

Maxime

--ao5xhbjudcipmpt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFR5MwAKCRDj7w1vZxhR
xcMNAQCry5Q3KdEz/DDFtEpwSGKaSFJGfcmbbivR9csW/2+HWQD+L+muppVW5HVy
qOq9oel4AllWDHlt3Xx4n/AKi7bj2QM=
=m3Sx
-----END PGP SIGNATURE-----

--ao5xhbjudcipmpt2--

--===============0934091401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0934091401==--
