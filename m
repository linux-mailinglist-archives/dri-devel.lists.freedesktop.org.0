Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3162F8CEE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C0C6E5BD;
	Sat, 16 Jan 2021 10:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71B56E471
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 17:21:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48145B7EE;
 Fri, 15 Jan 2021 17:21:07 +0000 (UTC)
Message-ID: <6e816ca69aba54aabc99403e6fec31843ffc7836.camel@suse.de>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Avoid ASoC error messages on startup
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>
Date: Fri, 15 Jan 2021 18:21:05 +0100
In-Reply-To: <1609256210-19863-1-git-send-email-stefan.wahren@i2se.com>
References: <1609256210-19863-1-git-send-email-stefan.wahren@i2se.com>
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0620163064=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0620163064==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-DluGFmEikwov8Dk5rdWD"


--=-DluGFmEikwov8Dk5rdWD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-12-29 at 16:36 +0100, Stefan Wahren wrote:
> During startup of Raspberry Pi 4 there seems to be a race between
> VC4 probing and Pulseaudio trying to open its PCM device:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0ASoC: error at snd_soc_dai_startup on fef05700.hd=
mi: -19
>=20
> Avoid these errors by returning EPROBE_DEFER in this situation.
>=20
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Seems reasonable to me:

Tested-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas


--=-DluGFmEikwov8Dk5rdWD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmABzwIACgkQlfZmHno8
x/5GNwf8Dx7lCBUg1Iwj70tYvpoJF4vGkUeIRhu6RpEvc3hes2aSnl115NEKOGGc
OAXDbF/l8bop2Ohs25VZ509xKeOTr9lnxNo0T/8tW2ObBAyLdP+rrUk+kgVF/0hc
cbdY96hSlTo0lZq7VPmURx+Z10fAQ8urJ0ePiu6PSJLs9lGyKgcNgd9SzM8Cw9Ni
DNUBM2u9tCBjxwznJ6pshZ4umagFKjIet7ib3OltShgzOVEacNexqb4XYdwfzTWt
L70YLAvbMCL96xVZTkePjDXcfx9hksu1ORTuHmEcz5bpA0evYrXq8L6dmJTcrI6i
1f0asj9p1xk7J7hCgX5AhLtKe/lD7Q==
=jBAD
-----END PGP SIGNATURE-----

--=-DluGFmEikwov8Dk5rdWD--


--===============0620163064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0620163064==--

