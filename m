Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668C0232C68
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E74E6E878;
	Thu, 30 Jul 2020 07:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0BD6E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:42:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A25A5C010E;
 Wed, 29 Jul 2020 10:42:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 29 Jul 2020 10:42:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=GzwVm6BSp1ZpDRDfO3rdNYnD6Uv
 13RpFnX4V+Vax2sQ=; b=EYN7iWWEksJ77iqIIeKYYbvHG81CngqUXgg3mE536K2
 VPPUvgFbqWXWi5CP9T75H7YVimk9w7RoHk1QYI3y6JPMbhpYU8q/oJXXkObPPRfS
 50LRisXUN9kDWPi/+D5mxray0jCmRozF+b16goF9hdqjryt9mM/wC7a7LYAK/aNU
 PKw1c7Rw8Aiv9pVx6Ul2Ctp+HAyrJBEAGWTWmkNnULLLYRqQAvszYw9k309Jkqhi
 /sOHd16SCbLQ7YrRqnDyV4dE+SNsBmMCJrmRBtkeZTeNVpd0l9YtOZEBaZMoafEA
 OroAZyKsV6XMSefybgRfQwKmlE6ey+e8udp9ZIQtVuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GzwVm6
 BSp1ZpDRDfO3rdNYnD6Uv13RpFnX4V+Vax2sQ=; b=LyKuQZ/7iYq0YDjnQKy+36
 8fN88UQprKwp1IxLhrluFXHy4bfISn8IIGFIb0DKmchN2aGHbZvRW2nfdHhqShCG
 11oXYUxq7WCc1On1RKhYHrYnIwW4LSyE6lYWGuSz4oUvFhri9Etie2DdxhvG4Vnh
 FB1jJJ68Bxb44YLsZOYfJKPr0UpRXXVs4U0kYG159RLjOmi+N/bgf924ppRoMYod
 n1DyHxvOWHBceItDnMypktJhGKlLdoH02qArYKJY/kSSFEMH70XRGUECZfS4NR9J
 LaR8hn8UjmI55kMzLaHnUY6olaO1alM5vS1g+82D9+Y98tZ7Tf3gl/p1vaRAneKw
 ==
X-ME-Sender: <xms:7YohX4ewiCVAOFMx0l3ZS65cHcBZGaUAvRRYw_1V1qquBtlrJfLJig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieeggdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7YohX6OPNuAsPXjyPdjNMDGyDSR8oaiRw1kORJ9pvx4RyrjOoCTn0Q>
 <xmx:7YohX5jy6zc7bhZ9wnBcE3fW7kAqJ2jl83RrJJyTDLy7t8DN3DkGzw>
 <xmx:7YohX99GboQKJT7nVsiJsvfMK7O8xdCWFFXx6gihboxqYaY4y4BN8Q>
 <xmx:74ohX4hFr-Ez06vsH64PR9G77XZlo7yKidvmk6pDZ4esocs2x0BBKQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E63C30600B9;
 Wed, 29 Jul 2020 10:42:53 -0400 (EDT)
Date: Wed, 29 Jul 2020 16:42:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 29/78] drm/vc4: crtc: Add a delay after disabling the
 PixelValve output
Message-ID: <20200729144251.us6a2pgkjjmm53ov@gilmour.lan>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <a1f22aadc60a2f32022831a6348c8bbd6e1954c3.1594230107.git-series.maxime@cerno.tech>
 <CAPY8ntBLWrfagZ5-kQz+5Mkw4_KaaTP63_L3D4owJAfA5kFpzw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBLWrfagZ5-kQz+5Mkw4_KaaTP63_L3D4owJAfA5kFpzw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1247617650=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1247617650==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7egmvjdmvf73mwty"
Content-Disposition: inline


--7egmvjdmvf73mwty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 29, 2020 at 03:09:21PM +0100, Dave Stevenson wrote:
> On Wed, 8 Jul 2020 at 18:43, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > In order to avoid pixels getting stuck in the (unflushable) FIFO between
> > the HVS and the PV, we need to add some delay after disabling the PV ou=
tput
> > and before disabling the HDMI controller. 20ms seems to be good enough =
so
> > let's use that.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_crtc.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_c=
rtc.c
> > index d0b326e1df0a..7b178d67187f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> > +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> > @@ -403,6 +403,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc=
 *crtc,
> >         ret =3D wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN)=
, 1);
> >         WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
> >
> > +       mdelay(20);
>=20
> mdelay for 20ms seems a touch unfriendly as it's a busy wait. Can we
> not msleep instead?

Since the timing was fairly critical, sleeping didn't seem like a good
solution since there's definitely some chance you overshoot and end up
with a higher time than the one you targeted.

Maxime

--7egmvjdmvf73mwty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXyGK6wAKCRDj7w1vZxhR
xW7BAQDwt5j9Pshu1GKCULxSDv9PS+5o32//+Xr9V03eudzzWgD/ez5A4HPtG6s1
iaSko1HSa8F3EhSBN2c4qShUyYpkhAI=
=fvZ0
-----END PGP SIGNATURE-----

--7egmvjdmvf73mwty--

--===============1247617650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1247617650==--
