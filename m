Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A126808441
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:20:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658B110E840;
	Thu,  7 Dec 2023 09:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5462410E836
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:20:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4CF3A62041;
 Thu,  7 Dec 2023 09:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799F6C433C7;
 Thu,  7 Dec 2023 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701940804;
 bh=nl+7zRM+RUou0hee7Fw3E82iCj4CZDlgNOvJ1QEoImg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sv2QlZb+Ob2LJQaMP7IvnHXktcQOXq3LyiBJd+WHY3aNDCVRrPmmsXjbd4sThhsWO
 Mv2qjo9pUGyudeNAvyNSFUmY/lYDmpqW13Hc43AahvCQiQdTaCP07u/aS4zapvGQux
 +zY5i/GLh0RNXMRL5KTtWzsaxu+TjnNwM1gErk4xdSbeqvzlbBhz2X0QnyhbqHD94N
 vj+hHSQ9gpLcZegPXaMgbUywNkAgWTTYCvKRbuK4BkzOpUjke1o5/ZZh9WeiDXVMig
 E0hqdib+4jKIQ4V4GOaa5Zi52YOvhzBGyzVEULYeGXsPYGfPhJSDJcJjSMyVGXb1f0
 Zww7wMw+b4LsQ==
Date: Thu, 7 Dec 2023 10:20:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
Message-ID: <6gpehpoz54f5lxhmvirqbfwmq7dpgiroy27cljpvu66wtn7aqy@lgrh7wysyxnp>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
 <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
 <vawv2mwhonuyvgmp7uox4rfgdcjwg5fa7hmbcfgl3wiase6e4p@tyavpclppfvu>
 <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="at7ezwmqtv5cf653"
Content-Disposition: inline
In-Reply-To: <6BC60156-89E2-4734-BD00-B49A9A6C1D7A@goldelico.com>
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Donald Robson <donald.robson@imgtec.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Matt Coster <matt.coster@imgtec.com>, Rob Herring <robh+dt@kernel.org>,
 linux-omap@vger.kernel.org, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Tero Kristo <kristo@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--at7ezwmqtv5cf653
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 02:50:08PM +0100, H. Nikolaus Schaller wrote:
> Hi,
>=20
> > Am 05.12.2023 um 14:29 schrieb Maxime Ripard <mripard@kernel.org>:
> >=20
> > Hi,
> >=20
> > On Tue, Dec 05, 2023 at 09:18:58AM +0100, H. Nikolaus Schaller wrote:
> >>> Am 05.12.2023 um 07:57 schrieb Maxime Ripard <mripard@kernel.org>:
> >>>=20
> >>> On Mon, Dec 04, 2023 at 12:22:36PM -0600, Andrew Davis wrote:
> >>>> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs fr=
om
> >>>> multiple vendors. Describe how the SGX GPU is integrated in these So=
C,
> >>>> including register space and interrupts. Clocks, reset, and power do=
main
> >>>> information is SoC specific.
> >>>>=20
> >>>> Signed-off-by: Andrew Davis <afd@ti.com>
> >>>> ---
> >>>> .../devicetree/bindings/gpu/img,powervr.yaml  | 69 +++++++++++++++++=
--
> >>>> 1 file changed, 63 insertions(+), 6 deletions(-)
> >>>=20
> >>> I think it would be best to have a separate file for this, img,sgx.ya=
ml
> >>> maybe?
> >>=20
> >> Why?
> >=20
> > Because it's more convenient?
>=20
> Is it?

It's for a separate architecture, with a separate driver, maintained out
of tree by a separate community, with a separate set of requirements as
evidenced by the other thread. And that's all fine in itself, but
there's very little reason to put these two bindings in the same file.

We could also turn this around, why is it important that it's in the
same file?

> >> The whole family of IMG GPUs is PowerVR and SGX and Rogue are generati=
ons 5 and 6++:
> >>=20
> >> https://en.wikipedia.org/wiki/PowerVR
> >=20
> > That's not really relevant as far as bindings go.
>=20
> But maybe for choosing binding file names. Well they are machine readable
> but sometimes humans work with them.

Heh. It's something that can also be easily grepped, and the name is
never going to reflect all the compatibles in a binding so it's what
you'll end up doing anyway. But feel free to suggest another name to
avoid the confusion.

> > We have multiple
> > binding files for devices of the same generation, or single bindings
> > covering multiple generations.
> >=20
> > The important part is that every compatible is documented. It doesn't
> > really matter how or where.
>=20
> Yes, and that is why I would find it more convenient to have a single
> "img,powervr.yaml" for all variations unless it becomes filled with
> unrelated stuff (which isn't as far as I see).

Again, hard disagree there.

Maxime

--at7ezwmqtv5cf653
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXGOQQAKCRDj7w1vZxhR
xbE8AQCZfNo9oCxq0vvLhGlgv/lmiS2j6lzTN0TCD3qEYXuWvgEA8HDEG22nAn5t
tKqxvYUa7HNULBEgPKYPdGXjaC67bgw=
=r0f1
-----END PGP SIGNATURE-----

--at7ezwmqtv5cf653--
