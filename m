Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C032F2969
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5EE6E06D;
	Tue, 12 Jan 2021 07:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A12B89686
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 17:12:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3FFEAB7A;
 Mon, 11 Jan 2021 17:12:12 +0000 (UTC)
Message-ID: <fa491b95942921e9cb1c0302bfe1cec8007ac8ea.camel@suse.de>
Subject: Re: [PATCH v2 01/15] ARM: bcm: Select BRCMSTB_L2_IRQ for bcm2835
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Florian Fainelli <f.fainelli@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Date: Mon, 11 Jan 2021 18:12:11 +0100
In-Reply-To: <000a8e5b-cb97-f413-6d8b-2f5a529f7137@gmail.com>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-2-maxime@cerno.tech>
 <000a8e5b-cb97-f413-6d8b-2f5a529f7137@gmail.com>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0521754712=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0521754712==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MOL1Oae2AV68diJasRLF"


--=-MOL1Oae2AV68diJasRLF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Maxime it seems you forgot to CC me on the series :)

On Mon, 2021-01-11 at 08:54 -0800, Florian Fainelli wrote:
>=20
> On 1/11/2021 6:22 AM, Maxime Ripard wrote:
> > The BCM2711 has a number of instances of interrupt controllers handled
> > by the driver behind the BRCMSTB_L2_IRQ Kconfig option (irq-brcmstb-l2)=
.
> >=20
> > Let's select that driver as part of the ARCH_BCM2835 Kconfig option.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>=20
> Nicolas, I suppose you will be taking patches 1 and 14, 15 through the
> SoC pull request, right?

Yes, that's about right. But I think it'd be nice to wait a bit to see if R=
obH
has something to say.

Regards,
Nicolas


--=-MOL1Oae2AV68diJasRLF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl/8husACgkQlfZmHno8
x/63Fgf+PYz4BSJjve1LDoGVTG9o8kenwQxr38CHB7phoah/8wamyPa5te1Uxtgg
LcG/dgt4m3xWdeDjLWOk5WWGthoSo3ePTw2CmtMzM2+Y+cRsX/OyEno7ehl2y0f1
qJRFnCQ+aUBbRymy0ic3FeprMEfHXOlZLThj663A+SYOWLOE6tbLtqiuOXrVz60D
iSTK/ziqnTEfnLq5UDm2y5r7wZKrI8U9qw+E8Nk+RP5giOzuPwv7idGMMbjohcA6
I3zpHvATwsqFE9nHxZdc8NYu6Cy6uJPxe5bNHMx7mXffkIzuTExyUrUC92mFt6DT
XrnztqS9FA6VRKX9KB4r3swL4Vgkyg==
=m1b7
-----END PGP SIGNATURE-----

--=-MOL1Oae2AV68diJasRLF--


--===============0521754712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0521754712==--

