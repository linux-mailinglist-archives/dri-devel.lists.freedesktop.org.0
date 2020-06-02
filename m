Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E24F31ECA2A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3517D6E4F1;
	Wed,  3 Jun 2020 07:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BF96E3E5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 14:12:34 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DF8795C00B9;
 Tue,  2 Jun 2020 10:12:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 02 Jun 2020 10:12:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6nfNzIAdvv+2u2nlDiEbeWjNRvu
 HHWtTui6XJIgYRnc=; b=jAUnEuWco8XlUL2BK4xM3qarlYtcrL+3VZ0Ym1RM8WD
 5b5AAbDS7DVtJLbQknXzWWrhrpvUmpN+U91zfJ/soaK39ndvePIEKUYrmuaYORGT
 4x4KrUOhaCRClx3KNGcWEfuICJLq4t/tib5EP7eCG2goCt9YRerKedfW13jepPtt
 gQfFqQdfKJECr7Ryku8u4/aj91qVPIWaanSp5Lf6hJ9DyGbX3AlSGd6xbVjW8cKl
 1YYlss8WlFoEHFBdGOQIyJU95rSRjeLHy9WnuIQ0/RukKbrtbo/BcUFoTVAo47LU
 RCDQDZR3nu5zpnpUyMOWUI2krXgijryDKSx0XSSXa+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6nfNzI
 Advv+2u2nlDiEbeWjNRvuHHWtTui6XJIgYRnc=; b=Hu4oqsVsaTtiSj5i7jvC4r
 NsH/ZN/D2lCDRDqGz7TrWtTeQC8EuTYqs8G+Ezfb2mLymz9Xa/BzSxNEG9ZJ/gkl
 aM4h2IdDYABb7EuvQadKyThkjSB7SWHRbP7hEXazK9mRUBdqlSu9S/LCB9qu/1uE
 cc7vfIdIqQ9TBsQB47COChmIFjY4vopQ9L7wsIbPBJyzNRq84CIRqr0yf4Z2SekP
 KnWNl28M5SNbFUF8ctmDHpeEgz8cJIN06TajSckWZuIWNk+TkiOD49pxb2TyMkQz
 z2IAUcviiPttjrseNGyOyJGVGz00DUZASBdrdOIzjfR1tBqNBwXhPMzrz2dCQdpw
 ==
X-ME-Sender: <xms:TV7WXo9CO17tSpLgPFR7ZfnEb5jzmTgd-KulMWm5-4SGMKqS_moV-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefjedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:TV7WXgvt0QITr9I9KP7DC0J-r-wx8Bobhwlhcl2qoc1fCp_MLUuhNw>
 <xmx:TV7WXuAn3tU1N1MDvgwI8oOe8_do1iKiV-M_RsYxFV3cGLgaFV615w>
 <xmx:TV7WXoemze4jGbSqKicPDyTImtFDo5iRHqfM-rDJbUfwYHOtOgIAiA>
 <xmx:T17WXpBpyteFSyJTeWMejXCyGZvzmoEFEMDuFNQBphC0Xg8f1UGoZQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 725C43280066;
 Tue,  2 Jun 2020 10:12:29 -0400 (EDT)
Date: Tue, 2 Jun 2020 16:12:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 032/105] drm/vc4: crtc: Enable and disable the PV in
 atomic_enable / disable
Message-ID: <20200602141228.7zbkob7bw3owajsq@gilmour>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <d2c1850e38e14f3def4c0307240e6826e296c14b.1590594512.git-series.maxime@cerno.tech>
 <CADaigPU7c=1u47R9GzvGCH_Z2fywY1foGYEy=KbBikjUQpwUFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADaigPU7c=1u47R9GzvGCH_Z2fywY1foGYEy=KbBikjUQpwUFg@mail.gmail.com>
X-Mailman-Approved-At: Wed, 03 Jun 2020 07:04:29 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0281621603=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0281621603==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6jdhhfajj55wnhto"
Content-Disposition: inline


--6jdhhfajj55wnhto
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric

On Wed, May 27, 2020 at 09:54:44AM -0700, Eric Anholt wrote:
> On Wed, May 27, 2020 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The VIDEN bit in the pixelvalve currently being used to enable or disab=
le
> > the pixelvalve seems to not be enough in some situations, which whill e=
nd
> > up with the pixelvalve stalling.
> >
> > In such a case, even re-enabling VIDEN doesn't bring it back and we nee=
d to
> > clear the FIFO. This can only be done if the pixelvalve is disabled tho=
ugh.
> >
> > In order to overcome this, we can configure the pixelvalve during
> > mode_set_no_fb, but only enable it in atomic_enable and flush the FIFO
> > there, and in atomic_disable disable the pixelvalve again.
>=20
> What displays has this been tested with?  Getting this sequencing
> right is so painful, and things like DSI are tricky to get to light
> up.

That FIFO is between the HVS and the HDMI PVs, so this was obviously
tested against that. Dave also tested the DSI output IIRC, so we should
be covered here.

Maxime

--6jdhhfajj55wnhto
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXtZeTAAKCRDj7w1vZxhR
xVJqAQCUmpR8JL8pnnKjcPFlmgxyfzwLZXpVwBbL1P2+kZmIMAEAtrzlIP25oS5g
9aixg7Ifrmc88nWmBcIbxDH1tuDcFAs=
=Ak49
-----END PGP SIGNATURE-----

--6jdhhfajj55wnhto--

--===============0281621603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0281621603==--
