Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940E22E03
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3688925B;
	Mon, 20 May 2019 08:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808648925B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:10:01 +0000 (UTC)
Received: from localhost (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5533010000C;
 Mon, 20 May 2019 08:09:42 +0000 (UTC)
Date: Mon, 20 May 2019 10:09:42 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 3/4] arm64: DTS: allwinner: a64: Enable audio on Teres-I
Message-ID: <20190520080942.s27zv6yfv2zo5tc3@flea>
References: <20190516154943.239E668B05@newverein.lst.de>
 <20190516155139.E6EE568C65@newverein.lst.de>
 <CAGb2v64xKk1r1iqSVm5pVvHVkyQ175MUFB7JPUkvQX9ecOZDDQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v64xKk1r1iqSVm5pVvHVkyQ175MUFB7JPUkvQX9ecOZDDQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 devicetree <devicetree@vger.kernel.org>,
 Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============1458908539=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1458908539==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4whjn4knj7qddsth"
Content-Disposition: inline


--4whjn4knj7qddsth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 20, 2019 at 03:56:13PM +0800, Chen-Yu Tsai wrote:
> On Thu, May 16, 2019 at 11:52 PM Torsten Duwe <duwe@lst.de> wrote:
> >
> > From: Harald Geyer <harald@ccbib.org>
> >
> > The TERES-I has internal speakers (left, right), internal microphone
> > and a headset combo jack (headphones + mic), "CTIA" (android) pinout.
> >
> > The headphone and mic detect lines of the A64 are connected properly,
> > but AFAIK currently unsupported by the driver.
> >
> > Signed-off-by: Harald Geyer <harald@ccbib.org>
> > Signed-off-by: Torsten Duwe <duwe@suse.de>
>
> Looks good to me.
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--4whjn4knj7qddsth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOJgxgAKCRDj7w1vZxhR
xbSXAP926FlqO6XCiMyZJenTVBmpT/A0W2UCps/VqpRJuj0aagD/exOJs05ag5un
BMT9ii0aqMgO8x6CqBc2f5EQ6uIRagg=
=Md6e
-----END PGP SIGNATURE-----

--4whjn4knj7qddsth--

--===============1458908539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1458908539==--
