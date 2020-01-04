Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8907E130219
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045A56E443;
	Sat,  4 Jan 2020 11:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F7E6892CF
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 09:51:44 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 36B1421F30;
 Sat,  4 Jan 2020 04:51:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 04 Jan 2020 04:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=xC5Tz6kxh/HPATOcuMFe1CFgfrY
 z3FGFb6WfQx7tpiU=; b=QYPwpIXkFKiryPz0uVyL+qBqyJul4eapdXgrSk1C6LY
 pnjz+aagVn42z6xnw376R05QYmKSx/kXR8KDsGqeOKYlaqKSYZBUBo7Aj4bL7jEM
 D03FkNM2vAUW3X8VOqXYfAPq2uRBfnK3WfW88grvgZ5gPmGd+by366Ns4Sr/NZuE
 CTe1Mnz2/8UtFXpFDWrjA8L/WkxZATnCJ5ab4BG92PglfEnjOGtZYigQJgBcxN+5
 vqnMB8fqkn7vjiD4JBPmX/39bnAoItN2vtKILN3X05jv6zIZcl2kRJtYLX7LwYLI
 Tn8xT0HIr5QkBBzRhcx/oKTbGryp8PX4vXyZPVEyjyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xC5Tz6
 kxh/HPATOcuMFe1CFgfrYz3FGFb6WfQx7tpiU=; b=eP2LDquLIsBoBCjVO/uzUG
 qB+cEQvJEXOS6H6AfVwoMpvfkhOfdD+kDl7wXiPGTRQAVsgorS0gT0Z6AAKqNGxB
 3pH98Il6vfN9yrXq5jEmNsEvZMd6j4saaChs5NBh/z0nQxrDJ+6dUV4w9q8/gG62
 CwJWGepPSGgMlocidhlQKnvVsrEBj9BwNlzKdV+TJ2khBM57DUq+6A2qYSN5A1z8
 rCXVt4km7J78YGRJ9ahAkwzMbHZ+grIpHIsnhF1HST2Ot1wczFnXwQ+1fvBRKtgO
 0s7fdnh2iFmT4ppoMLkBU6t4f/mLQ75cJlH5RbBzBNSbpqvUSnxJ8Lib6z7+1E5Q
 ==
X-ME-Sender: <xms:KmAQXkW_muQUBoXd7LPAjZkZSJyy3g4PY-TO4jmHXFEKJ3QFh1JKkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeghedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:KmAQXs1jfChJntnx27I2W6Ago0un6WRF_3uWsfPC78tw3OKmdnFu_w>
 <xmx:KmAQXjaZR4ecL-EuVGQliH8pxzHDtGMKqDHylqjdl0bfAbYMhiYvFg>
 <xmx:KmAQXnrJ6Q23KCU5v-MlYCqW-yvVCmn5rvpDInUZbs24iK9TVgyz-w>
 <xmx:LGAQXnvfA7utU7AZ3Ea8lQQRUb3zu3UBGCjtlsQlHXB508k5Wc_RQQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A0D08005B;
 Sat,  4 Jan 2020 04:51:38 -0500 (EST)
Date: Sat, 4 Jan 2020 10:51:36 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 4/4] ARM: dts: sunxi: Add missing LVDS resets and clocks
Message-ID: <20200104095136.qaoai7lrmvp6komm@gilmour.lan>
References: <20200103152801.47254-1-maxime@cerno.tech>
 <20200103152801.47254-4-maxime@cerno.tech>
 <CAGb2v65S32hbbKHRu1W+p7eP3-_uC1qKKGSP+ftkzxEO1egnjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v65S32hbbKHRu1W+p7eP3-_uC1qKKGSP+ftkzxEO1egnjA@mail.gmail.com>
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0902130372=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0902130372==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vfkmj2tp2msjoyp"
Content-Disposition: inline


--5vfkmj2tp2msjoyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 03, 2020 at 11:31:05PM +0800, Chen-Yu Tsai wrote:
> On Fri, Jan 3, 2020 at 11:28 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Some old SoCs, while supporting LVDS, don't list the LVDS clocks and reset
> > lines. Let's add them when relevant.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--5vfkmj2tp2msjoyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXhBgKAAKCRDj7w1vZxhR
xSWTAP9aLj6GqedfeHASxNxXQ3luUUvfRIbz5JznIwm133TvOwEA8qXDQvjtDMqX
rNEnwGr9Z5n8Qf9/snsuaWPlrXFNSAY=
=7GLd
-----END PGP SIGNATURE-----

--5vfkmj2tp2msjoyp--

--===============0902130372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0902130372==--
