Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6063B2BBEAB
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC816E99A;
	Sat, 21 Nov 2020 11:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1976E8E1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 16:45:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA707AC60;
 Fri, 20 Nov 2020 16:45:51 +0000 (UTC)
Message-ID: <a876d42fb6ed34e5302d96698011a48c3f1023d6.camel@suse.de>
Subject: Re: [PATCH v2 3/3] ARM: dts: rpi-4: disable wifi frequencies
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  Eric Anholt <eric@anholt.net>
Date: Fri, 20 Nov 2020 17:45:50 +0100
In-Reply-To: <20201029134018.1948636-3-maxime@cerno.tech>
References: <20201029134018.1948636-1-maxime@cerno.tech>
 <20201029134018.1948636-3-maxime@cerno.tech>
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1704588367=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1704588367==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MQTJUKN3mWius9SLPf0c"


--=-MQTJUKN3mWius9SLPf0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-10-29 at 14:40 +0100, Maxime Ripard wrote:
> The RPi4 WiFi chip and HDMI outputs have some frequency overlap with
> crosstalk around 2.4GHz. Let's mark it as such so we can use some evasive
> maneuvers.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> ---
>=20
> Changes from v1:
>   - Changed the property name

Applied for next. Thanks!


--=-MQTJUKN3mWius9SLPf0c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl+38r4ACgkQlfZmHno8
x/5qYwgAsvpEd/jZHZT2ntJ3u1NyaFqM5OERxSlFLCyJosOZoo0pev871v8dZy4e
RG+0sl3Mig4hP8SoHd2j5ioAzOmBgQUk4Imjm78AZQvBZlk+vsSxG2F/jk7JpIQg
EYgsYXGR2OLOgrQk1lWnCJ7M+w+SUV/YNP3DMtgdcV2TXd0S/8v6+hqJQYzx7mY7
byDJGbPSe1fzaRszTlyIf2QaJpnplQfwLMoao7P4cvdiyiyWGpeNgx1wEFSwfiB/
OvmZXP2Sjyzmi+AkUkD6+IE6JcZnQ5+vKV+yl8GBBuRrDeIEc94pK9qx6FwMLARW
gKG7hg3smCffh/dbJ83qOCUIbhzbUQ==
=Idjk
-----END PGP SIGNATURE-----

--=-MQTJUKN3mWius9SLPf0c--


--===============1704588367==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1704588367==--

