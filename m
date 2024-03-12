Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E618787960C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 15:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8F7112E50;
	Tue, 12 Mar 2024 14:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="iW2NIMW5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE353112E50;
 Tue, 12 Mar 2024 14:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aTN3+6tI0P36YuQw1m41QrzrNjQyR4whYl6ctM+BlQI=; b=iW2NIMW5eVjhTwmnv8y2OYvQMJ
 pj0UfKwl4zNNbVAOn6lriSnv6L5VUVnJzquXwuVvyHKkZ6c7iKakfQuGInd4pGGpd9vS/M7YFRJtS
 3IPZLge94jPw5GrGW94EvyjVzYo7u3Dw8JhYT6cYxpB8RiJ6AHwde3Hk0FXKqJlMsHM816VrNPFw7
 ajBBA7h0QTQxMpRBLHkdVjuG51UKVwhQgXZuWoDagxQvieZio/gtsuX9kCpYldbpyrzs6WaZKYmdy
 38kZDifW7QdLGllAypyAgSZ7YhdoR6IZTUra7Gis2BiabaEoTgvBQvs+Th+rQVKtBSXJenTUxkNy9
 wF1dnz+w==;
Received: from [194.136.85.206] (port=55942 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rk34y-0005vN-1S;
 Tue, 12 Mar 2024 16:26:08 +0200
Date: Tue, 12 Mar 2024 16:26:00 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: "Garg, Nemesa" <nemesa.garg@intel.com>
Cc: Simon Ser <contact@emersion.fr>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "G M, Adarsh" <adarsh.g.m@intel.com>
Subject: Re: [RFC 0/5]  Introduce drm sharpening property
Message-ID: <20240312162600.7358e146@eldfell>
In-Reply-To: <IA1PR11MB6467C642ABBD54BD82DF46B9E32B2@IA1PR11MB6467.namprd11.prod.outlook.com>
References: <20240214112457.3734871-1-nemesa.garg@intel.com>
 <8Ma-GlU3bFAuSPpFhGbYYuXQ8OeeDjMK9WiWO6KP-4pPO41fLnLrgABkRfhjHY6XlIh5u67vcEbD8ejDq7-zo5BXf-too0Pt7oTDhWCOPlU=@emersion.fr>
 <IA1PR11MB6467A91412978DE0FFCAB50FE34C2@IA1PR11MB6467.namprd11.prod.outlook.com>
 <20240216103620.33deabb1@eldfell>
 <IA1PR11MB6467F801FFB564769E357EA9E3232@IA1PR11MB6467.namprd11.prod.outlook.com>
 <uL84QKNtst1cp9uG3HqNAqEpJS2pT07qxwufONZx8Zq3t665BwY15fHRm3cZxMtiecQlPlNTs9srrmlIzRKmRYItWUv6cQbDEkms8eUT84Y=@emersion.fr>
 <IA1PR11MB6467C642ABBD54BD82DF46B9E32B2@IA1PR11MB6467.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e0PcxZ.bQOVy4=4jLebtNyB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/e0PcxZ.bQOVy4=4jLebtNyB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Mar 2024 08:30:34 +0000
"Garg, Nemesa" <nemesa.garg@intel.com> wrote:

> This  KMS property is not implementing any formula

Sure it is. Maybe Intel just does not want to tell what the algorithm
is, or maybe it's even patented.

> and the values
> that are being used are based on empirical analysis and certain
> experiments done on the hardware. These values are fixed and is not
> expected to change and this can change from vendor to vendor. The
> client can choose any sharpness value on the scale and on the basis
> of it the sharpness will be set. The sharpness effect can be changed
> from content to content and from display to display so user needs to
> adjust the optimum intensity value so as to get good experience on
> the screen.
>=20

IOW, it's an opaque box operation, and there is no way to reproduce its
results without the specific Intel hardware. Definitely no way to
reproduce its results in free open source software alone.

Such opaque box operations can only occur after KMS blending, at the
CRTC or later stage. They cannot appear before blending, not in the new
KMS color pipeline design at least. The reason is that the modern way
to use KMS planes is opportunistic composition off-loading.
Opportunistic means that userspace decides from time to time whether it
composes the final picture using KMS or some other rendering method
(usually GPU and shaders). Since userspace will arbitrarily switch
between KMS and render composition, both must result in the exact same
image, or end users will observe unwanted flicker.

Such opaque box operations are fine after blending, because there they
can be configured once and remain on forever. No switching, no flicker.

Where does "sharpeness" operation occur in the Intel color processing
chain? Is it before or after blending?

What kind of transfer characteristics does it expect from the image,
and can those be realized with KMS CRTC properties if KMS is configured
such that the blending happens using some other characteristics (e.g.
blending in optical space)?

What about SDR vs. HDR imagery?


Thanks,
pq

> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of =
Simon
> > Ser
> > Sent: Monday, March 4, 2024 7:46 PM
> > To: Garg, Nemesa <nemesa.garg@intel.com>
> > Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>; intel-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; G M, Adarsh
> > <adarsh.g.m@intel.com>
> > Subject: RE: [RFC 0/5] Introduce drm sharpening property
> >=20
> > On Monday, March 4th, 2024 at 15:04, Garg, Nemesa <nemesa.garg@intel.co=
m>
> > wrote:
> >  =20
> > > This is generic as sharpness effect is applied post blending.
> > > Depending on the color gamut, pixel format and other inputs the image
> > > gets blended and once we get blended output it can be sharpened based
> > > on strength value provided by the user. =20
> >=20
> > It would really help if you could provide the exact mathematical formul=
a applied
> > by this KMS property. =20


--Sig_/e0PcxZ.bQOVy4=4jLebtNyB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXwZfgACgkQI1/ltBGq
qqd+YRAAk4wIJUzCiETKUbrBuh1M1K7+H+H1RQPmv9a6ExdzpydvCE8oh3tT75VU
RI3uQwWaSHdwlqIfdXNctJ2YzanzV84YYBWzove9PDZwEcVNZe/WQHDNQTWkpN/N
n/dprXwUPn+uMTv1sys94qIvSRGKscopoc1hNSmKTHHz6zA9t8iPT90bZyoWMIm8
c87DIAk+TJ1jjgas5oe4UW+zhLaLHmhKzgswi0YB3zUY5FU25wYCGEDyzJkL3W4g
xP7zu70nfLDFORWCDp7q2QZH/qm4EnqY9hKK4I8beN+FDwYGGafCLIoswzPoLWZB
MEkbR7NhHXxcDODLurnr+tsQ62iaMy2Hl/IBhkSWAwSQzhpqfTPcL5urC2447Xgo
lPqRE8c5CFTrqPh8vCetP4v4VyBzRqRjc6VEPRbES29gGjXjfqscqtwE+LINZoq1
r2jjG2FPPeFnhQmiYWMn1IZC+4x7yEJNGbVuR3eTSdx71LRmYSdhDaXDvTTTUwJk
fCGUTHgX0KBQdzXsruAFLvRci9nslG24X+nN/7XJbCIYBQNSPxSE/3D+qsU17Eyv
BY+MnVvtCEQlRmFsvwf0jRtmtLWjE9dBPYzO5uyy3LJFPSnZF/gF4lAp1pc2KX7p
UqZ3pCWz+mayHOAV3X799F5hTjoiC6/m6JyStO4rO8EXrKHGO8M=
=oqsm
-----END PGP SIGNATURE-----

--Sig_/e0PcxZ.bQOVy4=4jLebtNyB--
