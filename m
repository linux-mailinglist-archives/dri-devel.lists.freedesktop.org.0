Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DA81E5998
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9046E480;
	Thu, 28 May 2020 07:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DC38995F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 09:13:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 458BF580184;
 Wed, 27 May 2020 05:13:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 05:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=V5epjiDGiclpAXJJpB3JE24jmk6
 thqQZcHWLQmvyuUI=; b=afFk/O5M5iUdGGh/mcZZQSmWP9l8zSgz9lNVaE199Em
 nbgE6W8CSw0zFL9SnUP7uXSR7qT1XxQX8tDdeDIuY63lN0z5jgxQp4K5Lzt2PKyf
 tHXjyQicYV5VWtE3SKycCHL1AQqxyyxm30+2DEW9afNDHrvV5Vd9FwJXmT1omEjC
 YZV4G+4eDO7d/2maCVg0uHcPCT7HbYcuC35DsDs3+0/WTRsb0gq23xUK8F2IlYX2
 RjXIdbJykAIb8SUnCbhyKd2QczXXB1GyyYlOAryCe7ZNnjGl4O8Awk148iQP3fV/
 0s0yWscW+JB8U/aPOF0BQrBhdHzJgelUb3Ju7GZz0Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=V5epji
 DGiclpAXJJpB3JE24jmk6thqQZcHWLQmvyuUI=; b=NfATUaw901WlNTfX1Pg5wf
 VzyV0ZCjREZzEubzT29J2zNQtbxmxgarGmO8OTcLnJFZDbjLIXpU3YkLFpApRf43
 d65r9jucWdefHFKo0BDbhE7aiqT7SY1cq1i6OnXfumEe+D/Tof39+ge+z5byB15/
 ow68Z6xgT68Q0RX2pF3Si0qRS9tOce+bAZdreEyzfvLOFc3JTg9wayySAW93iUgz
 NtanODdCevcGOpqwweMlK8Gr2cUnF6hj+YrjQXuEkwsfWySc6dNXD5gmkrYuqboi
 Tq5bKPkejPCobXrRhfgT0iKOemYDwJWFeUdfk72nOQz13dPB0YYxNb0M0zZ5/diw
 ==
X-ME-Sender: <xms:QS_OXsbh5mG9N37eoM9wr1nZmwvzQsVZK5HS5wtVD4XrBkrpuZoLTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:QS_OXnYhpDwxYPnG140lqFLRlDN_P27ktwVqvxghdhSeN_ZdlZWniA>
 <xmx:QS_OXm-bGmz1PUWtUlPhyx3yvXa3lF9sSUY1SINUu-poX_q3iI8POQ>
 <xmx:QS_OXmpUMcCGukOP73oVLStJAyFaG9_8rlFR6rCrTeTgHqNJxkMotw>
 <xmx:RC_OXq1jTEytyhpvWEScpxh_pvTdwfI8yH08SfBPb187Z1Mw3FSxjg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E95C43280063;
 Wed, 27 May 2020 05:13:36 -0400 (EDT)
Date: Wed, 27 May 2020 11:13:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH v2 00/91] drm/vc4: Support BCM2711 Display Pipelin
Message-ID: <20200527091335.7wc3uy67lbz7j4di@gilmour.lan>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
 <20200427072342.5499-1-jian-hong@endlessm.com>
 <20200428162152.ztsqp7nxqbwqrm6r@gilmour.lan>
 <CAPpJ_efvtVzb_hvoVOeaePh7UdE13wOiiGaDBH38cToB-yhkUg@mail.gmail.com>
 <20200507172158.cybtakpo6cxv6wcs@gilmour.lan>
 <CAPpJ_efxenmSXt2OXkhkQ1jDJ59tyWBDUvmpyOB-bfPMDENQZg@mail.gmail.com>
 <CAPpJ_ed9TMJjN8xS1_3saf5obQhULJSLNgQSAFxgiWM2QX9A7Q@mail.gmail.com>
 <20200526102018.kznh6aglpkqlp6en@gilmour.lan>
 <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD8Lp467DiYWLwH6T1Jeq-uyN4VEuef-gGWw0_bBTtmSPr00Ag@mail.gmail.com>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: linux-arm-kernel@lists.infradead.org,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 Linux Upstreaming Team <linux@endlessm.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-i2c@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1946572167=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1946572167==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kokco5kof5hl45yv"
Content-Disposition: inline


--kokco5kof5hl45yv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, May 27, 2020 at 11:49:36AM +0800, Daniel Drake wrote:
> Hi Maxime,
>=20
> On Tue, May 26, 2020 at 6:20 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > I gave it a try with U-Boot with my latest work and couldn't reproduce =
it, so it
> > seems that I fixed it along the way
>=20
> Is your latest work available in a git branch anywhere that we could
> test directly?

I'm about to send a v3 today or tomorrow, I can Cc you (and Jian-Hong) if y=
ou
want.

Maxime

--kokco5kof5hl45yv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXs4vPwAKCRDj7w1vZxhR
xaGaAQCg3gZaUrnvSNp3BzxW8iTAVt5FCWnVgDC2YFeAH5wRnAD/RUVn5pMYOZX3
CW4nLRVoZ8NFLwZqHrhV/v6g5LHIhgQ=
=WuzX
-----END PGP SIGNATURE-----

--kokco5kof5hl45yv--

--===============1946572167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1946572167==--
