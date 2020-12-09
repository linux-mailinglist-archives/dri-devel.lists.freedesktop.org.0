Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003E62D5554
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 09:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63DE6EA35;
	Thu, 10 Dec 2020 08:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CD46E9EC
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:04:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FB0EACF5;
 Wed,  9 Dec 2020 11:04:22 +0000 (UTC)
Message-ID: <82da3b097ff25cf06cea9484b6f02c5e3c10793b.camel@suse.de>
Subject: Re: [PATCH 2/8] drm/vc4: dsi: Correct DSI register definition
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, Maxime Ripard
 <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  Daniel Vetter <daniel.vetter@intel.com>, David
 Airlie <airlied@linux.ie>
Date: Wed, 09 Dec 2020 12:04:21 +0100
In-Reply-To: <cfcfd349-e0fc-8bd0-4c9e-6cc33bf5f056@kontron.de>
References: <20201203132543.861591-1-maxime@cerno.tech>
 <20201203132543.861591-3-maxime@cerno.tech>
 <cfcfd349-e0fc-8bd0-4c9e-6cc33bf5f056@kontron.de>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 08:25:40 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0045807938=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0045807938==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Q2touFqrVZlJmBDMKIGm"


--=-Q2touFqrVZlJmBDMKIGm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-12-08 at 09:34 +0100, Frieder Schrempf wrote:
> Hi Maxime,
>=20
> On 03.12.20 14:25, Maxime Ripard wrote:
> > From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >=20
> > The DSI1_PHY_AFEC0_PD_DLANE1 and DSI1_PHY_AFEC0_PD_DLANE3 register
> > definitions were swapped, so trying to use more than a single data
> > lane failed as lane 1 would get powered down.
> > (In theory a 4 lane device would work as all lanes would remain
> > powered).
> >=20
> > Correct the definitions.
> >=20
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Wouldn't this deserve a "Fixes: ..." and "Cc: stable@vger.kernel.org"=20
> tag, as this bug is present in all stable releases since this driver was=
=20
> introduced? I think it would be really helpful to have it backported.

Agree, this would be nice:

Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")

With that,

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Regards,
Nicolas


--=-Q2touFqrVZlJmBDMKIGm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl/QrzUACgkQlfZmHno8
x/5OcAf/SkrJb24NMUCrxaImRXnGnoJmvMiOp7aJHrNerYSudCHupg89UEbHFDuP
rFhMX4UQkwPK04t2WK5VRHne3vO8f6LiOwyCoXaFH6/BnBHi9cJJGTDG5mpklzPG
+F6L4wAeWi2PnYDvwYSaHAz1UN6mowmkyEhD8OE/BsPkJCaZ1f1nKHjhspfi9hgB
7h5kxMYKaipX2VdkwFg2kjkX0jA0G3K9kyKmRs3F6pBabU8QY5xOmECUwwBgoqo0
V9ZJiMWpChIC0tWEiO3x/fi+G54ekzZYeQy+Umlp7+7h6XQiwLiFvnFUrUfmKm8J
1CPxw9FWWYhuOvTWBv/xZ1qWBRwGXw==
=vHye
-----END PGP SIGNATURE-----

--=-Q2touFqrVZlJmBDMKIGm--


--===============0045807938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0045807938==--

