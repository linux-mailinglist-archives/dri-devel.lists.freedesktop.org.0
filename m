Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D232EADC6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 16:00:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2E689F4F;
	Tue,  5 Jan 2021 15:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B9D89F4F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 15:00:21 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
 (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id DDD2B6000A;
 Tue,  5 Jan 2021 15:00:17 +0000 (UTC)
Date: Tue, 5 Jan 2021 16:00:17 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH v8 4/4] NOTFORMERGE: drm/logicvc: Add plane colorkey
 support
Message-ID: <X/R/AY7YXBEyWNG1@aptenodytes>
References: <20201223212947.160565-1-paul.kocialkowski@bootlin.com>
 <20201223212947.160565-5-paul.kocialkowski@bootlin.com>
 <oDsOkjfTYKa11LxfNy4LBLqutkVidfFn8--tjQPZj4w9gzCYNTOFglHqxXohsrYqTJ4uDv2xgJNKXPHzgAsACGnCkbKQis95SScGucOb1PI=@emersion.fr>
 <CAKb7UvhgHPkG5Sn-HLdpsFw0R=kATJKUmjSwPSuwviDCk0RGyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKb7UvhgHPkG5Sn-HLdpsFw0R=kATJKUmjSwPSuwviDCk0RGyw@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============0383769545=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0383769545==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OSDOGVu8nZtJl5tY"
Content-Disposition: inline


--OSDOGVu8nZtJl5tY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 23 Dec 20, 18:31, Ilia Mirkin wrote:
> FWIW this is something I added, hoping it was going to get used at
> some point, but I never followed up with support in xf86-video-nouveau
> for Xv. At this point, I'm not sure I ever will. I encoded the
> "enabled" part into the value with a high bit (1<<24) -- not sure that
> was such a great idea. All NVIDIA hardware supports colorkey (and not
> actual alpha, until the very latest GPUs - Volta/Turing families),
> although my implementation only covers the pre-G80 series (i.e. DX9
> and earlier GPUs - pre-2008). Should a determination of usefulness be
> reached, it would be easy to implement on the remainder though.

Interesting to know!

Regarding a generic colorkey property, there was a discussion under thread:
drm: Add generic colorkey properties for display planes

and the latest proposal (RFC v4) can be found here:
https://patchwork.ozlabs.org/project/linux-tegra/patch/20180807172202.1961-=
2-digetx@gmail.com/

It looks like this was much more complex than anticipated and the series
was more or less abandonned. I didn't feel like picking it up in my logicvc
series so I kept the colorkey patch as not for merge.

If someone's up for picking the proposal and continuing the discussion,
I could provide insight on how it would fit with logicvc though!

Cheers,

Paul

> On Wed, Dec 23, 2020 at 5:20 PM Simon Ser <contact@emersion.fr> wrote:
> >
> > nouveau already has something for colorkey:
> > https://drmdb.emersion.fr/properties/4008636142/colorkey
> >
> > I know this is marked "not for merge", but it would be nice to discuss
> > with them and come up with a standardized property.

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--OSDOGVu8nZtJl5tY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl/0fwEACgkQ3cLmz3+f
v9HOhgf8DU4twNl4hL4kO9201ULcHXezYqI7Ep2Kv9H4WmGOQHCYsz0Orr6KL8x7
xWdRsnet9x2vfN4UZRBRmSiXv2SA8nQL2TZHWH/VKyrwxmOD4Btt9C+qs0YWhfii
XfvU0IGYI8Y10uA03JTB44BfiXn409OR7otd1abp9/cO0GAf3zspshGdVuWST4wh
SgglQZvdpYQljgQJjIcmGJvwJ9hQ1Eyk1+XnBLFLBvZrsrrVgqboKRDSrJ28i+p2
fJIf2TSAzIdLnJbNBx77dRDiHTuHQlsdpOYomZyeeBPqcYvwiHBhJgE87JO27w03
OlOzyMecE1vud4/LLA7ySAHGczWt6Q==
=Ahth
-----END PGP SIGNATURE-----

--OSDOGVu8nZtJl5tY--

--===============0383769545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0383769545==--
