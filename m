Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5D125C69
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 09:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393E16EAC3;
	Thu, 19 Dec 2019 08:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3EB6E2E6
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 17:51:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D680EAE87;
 Wed, 18 Dec 2019 17:51:29 +0000 (UTC)
Message-ID: <094cccef1119acc5cfa4a357faaa657e2763f949.camel@suse.de>
Subject: Re: [PATCH] gpu/drm/v3d: Add ARCH_BCM2835 to DRM_V3D Kconfig
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Florian Fainelli <f.fainelli@gmail.com>, Peter Robinson
 <pbrobinson@gmail.com>, Eric Anholt <eric@anholt.net>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 18 Dec 2019 18:51:28 +0100
In-Reply-To: <f127b960-e374-ce6f-403a-6f592408f9ee@gmail.com>
References: <20191218084320.312561-1-pbrobinson@gmail.com>
 <78a1badd7c08ca39e7f62c6b66addeb2bf485a1e.camel@suse.de>
 <f127b960-e374-ce6f-403a-6f592408f9ee@gmail.com>
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Dec 2019 08:11:13 +0000
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
Content-Type: multipart/mixed; boundary="===============1634329301=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1634329301==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-b3PMjBEpOW5muTZsZat3"


--=-b3PMjBEpOW5muTZsZat3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Florian,

On Wed, 2019-12-18 at 09:39 -0800, Florian Fainelli wrote:
> On 12/18/19 6:39 AM, Nicolas Saenz Julienne wrote:
> > Hi Peter,
> >=20
> > On Wed, 2019-12-18 at 08:43 +0000, Peter Robinson wrote:
> > > On arm64 the config ARCH_BCM doesn't exist so to be able to
> > > build for platforms such as the Raspberry Pi 4 we need to add
> > > ARCH_BCM2835 similar to what has been done on vc4.
> > >=20
> > > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > > ---
> >=20
> > v3d's upstream implementation doesn't support RPi4 for now. So I don't =
see
> > how
> > we could benefit from this.
>=20
> Right, but it should support the Pi3 running in 64-bit mode too, so
> maybe that would be a better justification to put in the commit message?

Correct me if I'm wrong, but this 'v3d' isn't the same as 'vc4_v3d'. From t=
he
initial commit for the driver[1] I understood this is only valid for bcm271=
1.

Regards,
Nicolas

[1] https://lore.kernel.org/lkml/20180430181058.30181-3-eric@anholt.net/


--=-b3PMjBEpOW5muTZsZat3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl36ZyAACgkQlfZmHno8
x/4xkAf/UDRGiJ30rhACo74J/69uUKU3HdQY+mt7WSak8zazigz8E7mHiE/+a058
DIQav2A1IvohO91rz7ahvKBLy99OZaVlRjMJO5O6UKVuln2RGRh8rtXIbb3TdItJ
5mfZ2SVaDbh5UJgH/mrHIa7Ps9iK3OPVvGoFqrKTVCHLlU0fuQvKorQwYpdCBrVN
Q4h44DQ3cuDK+izmb9sJEizoAzQOvX04VepqYAhvMEih0vFka4fZhLM/7I4cv6rg
4f9VwYplwa2TRm/Za47BUlkmwNIjZQGEiQ06X/1hNWs6DyUb1ibzGED26q72jKQq
farrMAw+7mJBi0YIc0qvkHVKoCuReQ==
=HFlQ
-----END PGP SIGNATURE-----

--=-b3PMjBEpOW5muTZsZat3--


--===============1634329301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1634329301==--

