Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE29A74836
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A6C6E681;
	Thu, 25 Jul 2019 07:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB3E6E5F0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 16:40:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 09C9B284CF8
Date: Wed, 24 Jul 2019 09:40:04 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/panfrost: Export all GPU feature registers
Message-ID: <20190724164004.GA8255@kevin>
References: <20190724105626.53552-1-steven.price@arm.com>
 <CAL_JsqLkxKe=feVQDb3VXqOnA7fvDBEKWgLf2suOHhNLnR704Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLkxKe=feVQDb3VXqOnA7fvDBEKWgLf2suOHhNLnR704Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: multipart/mixed; boundary="===============1017850759=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1017850759==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This is definitely helpful!

My one concern is, supposing userspace really does need all of this
information, is it wasteful to have to do 30+ ioctls just to get this?
kbase had a single ioctl to grab all of the properties, whether
userspace wanted them or not. I'm not sure if that's better -- the two
approaches are rather polar opposites.

Granted this would be on driver init so not a critical path.

On Wed, Jul 24, 2019 at 10:27:03AM -0600, Rob Herring wrote:
> Adding Alyssa's Collabora email.
>=20
> On Wed, Jul 24, 2019 at 4:56 AM Steven Price <steven.price@arm.com> wrote:
> >
> > Midgard/Bifrost GPUs have a bunch of feature registers providing details
> > of what the hardware supports. Panfrost already reads these, this patch
> > exports them all to user space so that the jobs created by the user spa=
ce
> > driver can be tuned for the particular hardware implementation.
> >
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
> >  drivers/gpu/drm/panfrost/panfrost_drv.c    | 38 +++++++++++++++++++--
> >  drivers/gpu/drm/panfrost/panfrost_gpu.c    |  2 ++
> >  include/uapi/drm/panfrost_drm.h            | 39 ++++++++++++++++++++++
> >  4 files changed, 77 insertions(+), 3 deletions(-)
>=20
> LGTM. I'll give it a bit more time to see if there are any comments
> before I apply it.
>=20
> Rob

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl04id4ACgkQ/v5QWgr1
WA0lzRAAi1aJutAUzh1Pr9kmsSkjB1v5aMpdDQPOT7W/hfgODztRyqINqZNWuItB
Mmt45PyXLcFV+S+ZT7rzYtwRlm9HOL+N5iXakC8UgfqlF3lCYmosrAJHNjb3Czmk
aJ0WAyXZOHpmDQI6p0ATa5H8sNJGy31UbtHVYfT7WO55XW2VH/F+f9nIoOJMA/SF
L3ktWjzTg7PNBqSIPde/2xy2czZTXHyMwQV4aP8U7U/V0OViYxhXyO6Nyuy9XBsW
OpO1Q6Ka+DO6o/rEAwWREFOfI/NI4ISeyJhW60gBT2uq6oaLh3ohseET4oM0/EkM
BI4QcwuB1cwjfUFK7uuCdFR8KNhKRdJeE9iuw6+spU8/BUmBwsJtd6y+k2QVTfOq
oiD8ebpNoFXdLncQcVYRz85q2idD0BvhNLoslFPRs/pX/kYPax6uppmXRZ98XOEt
wN0Fg29ph8TmDS+fsyljPUd12pgEtb4EDMouJAwROGqSNqw7IjISYHaGH3oojGSt
K5+Zx8halrk78aYFh9Wv+0REtrK2bzxPv4vd4pEMnS3oHtc37qNei5WXeL1wvjMa
/L/cFSAw2cl3NN8Ex2+CKFstI1I702BOQMI0yoGCgbnFTjiWC5QpO1O4VZuFBhJg
1I6nA8xn4bOUxcrCYKiMmhylTL9BasZ9RDFQKk2ggWvayAR3/l4=
=+QFJ
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--

--===============1017850759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1017850759==--
