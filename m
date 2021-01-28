Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C4307EE2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65CD6EA1B;
	Thu, 28 Jan 2021 19:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87766E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 14:51:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58DF8ACB7;
 Thu, 28 Jan 2021 14:51:30 +0000 (UTC)
Message-ID: <63771d7b6314edd5ec63dd9bcbb4bffbd636f5e4.camel@suse.de>
Subject: Re: [PATCH v2 15/15] ARM: dts: bcm2711: Add the CEC interrupt
 controller
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@intel.com>, David
 Airlie <airlied@linux.ie>
Date: Thu, 28 Jan 2021 15:51:28 +0100
In-Reply-To: <20210111142309.193441-16-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
 <20210111142309.193441-16-maxime@cerno.tech>
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1344115435=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1344115435==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-G98LYzdq4xlu25yKmJ5B"


--=-G98LYzdq4xlu25yKmJ5B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2021-01-11 at 15:23 +0100, Maxime Ripard wrote:
> The CEC and hotplug interrupts go through an interrupt controller shared
> between the two HDMI controllers.
>=20
> Let's add that interrupt controller and the interrupts for both HDMI
> controllers
>=20
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied for-next.

Thanks,
Nicolas


--=-G98LYzdq4xlu25yKmJ5B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmASz3AACgkQlfZmHno8
x/4zPgf+LH8d5vNoAGIA/QDXj6Xd0q5Lh2HkeO6f9be0ReNe4B0G79xK+cXUuoaw
2gvlfh+36EcnbnU0gv4VrJia4UAXkpBR06MtJx+PWWza0Zp/iWjYYV0sTJuVF1kA
Rdv1Tdg4FfAbse4ZgL9sGHnC+RmN4lW6Uo0NHmdh7j6KpYaswewF29dgYQxErYRT
kNalJIrfYnCiNT4N+g+xi132l8aNg8Tzv2/I36DD8XrRx1EVBYgQeMyZxWLRTwPi
/R9sivRXtY9nFUUs25rwtiYugy2rkQyxyWzjpxM7Rc29eOstJdmsvyuFR6CbhECo
k8v1+FktMfpxYqW3XO9QCTeGsYel7A==
=TxMI
-----END PGP SIGNATURE-----

--=-G98LYzdq4xlu25yKmJ5B--


--===============1344115435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1344115435==--

