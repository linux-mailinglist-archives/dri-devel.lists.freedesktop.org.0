Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94912AE28FB
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 14:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09AB10E286;
	Sat, 21 Jun 2025 12:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1698 seconds by postgrey-1.36 at gabe;
 Sat, 21 Jun 2025 12:36:30 UTC
Received: from maynard.decadent.org.uk (maynard.decadent.org.uk [65.21.191.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CBB10E286
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 12:36:30 +0000 (UTC)
Received: from [2a02:578:851f:1501:2e0:4cff:fe68:186] (helo=deadeye)
 by maynard with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <ben@decadent.org.uk>)
 id 1uSx0d-002Zp7-17; Sat, 21 Jun 2025 12:07:46 +0000
Received: from ben by deadeye with local (Exim 4.98.2)
 (envelope-from <ben@decadent.org.uk>) id 1uSx0b-00000002DA8-2BOP;
 Sat, 21 Jun 2025 14:07:45 +0200
Message-ID: <b73fbb3e3f03d842f36e6ba2e6a8ad0bb4b904fd.camel@decadent.org.uk>
Subject: Re: [PATCH] agp/amd64: Bind to unsupported devices only if AGP is
 present
From: Ben Hutchings <ben@decadent.org.uk>
To: Lukas Wunner <lukas@wunner.de>, David Airlie <airlied@redhat.com>, Bjorn
 Helgaas <helgaas@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Suravee Suthikulpanit	
 <suravee.suthikulpanit@amd.com>, Andi Kleen <ak@linux.intel.com>, Ahmed
 Salem	 <x0rw3ll@gmail.com>, Borislav Petkov <bp@alien8.de>, 
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
 linux-pci@vger.kernel.org
Date: Sat, 21 Jun 2025 14:07:40 +0200
In-Reply-To: <f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de>
References: <f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-IShTDvXsHnknrgU9+DAa"
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a02:578:851f:1501:2e0:4cff:fe68:186
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on maynard); SAEximRunCond expanded to false
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


--=-IShTDvXsHnknrgU9+DAa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2025-06-21 at 11:40 +0200, Lukas Wunner wrote:
> Since commit 172efbb40333 ("AGP: Try unsupported AGP chipsets on x86-64 b=
y
> default"), the AGP driver for AMD Opteron/Athlon64 CPUs attempts to bind
> to any PCI device.
>=20
> On modern CPUs exposing an AMD IOMMU, this results in a message with
> KERN_CRIT severity:
>=20
>   pci 0000:00:00.2: Resources present before probing
>=20
> The driver used to bind only to devices exposing the AGP Capability, but
> that restriction was removed by commit 6fd024893911 ("amd64-agp: Probe
> unknown AGP devices the right way").
[...]

That didn't remove any restriction as the probe function still started
by checking for an AGP capability.  The change I made was that the
driver would actually bind to devices with the AGP capability instead of
starting to use them without binding.

Ben.

--=20
Ben Hutchings
All the simple programs have been written, and all the good names taken

--=-IShTDvXsHnknrgU9+DAa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAmhWoIwACgkQ57/I7JWG
EQlQtA/+JWg9KmRhoIceKsq3MOX5PVC5l817NZi+UTsWn7CY9PLm0O3cYDOA1xpk
eNBOcGI856GwPXtS49QYSg24cri4ZmIITsQ7/MsQTcWLiKXafH5zJK8qAI41hDae
68THfQ7P3wCE7C1l2EeKpRB00WY9qdDvIM9NchQhhdwDvxSIz5CiUI7SQ0oOPfDS
rkdSYMKD3SmsdS1TmzxpvdhOinHLgQz7J1ytZyHKS3fVW0W/s3UUXaNrCBKHfpEF
DjqcGCoi4iZGzAE8GFCxQbCzHLDcOWa5KwEeOk65qwmlXMTicx6WSNAI+X/hfwoa
UwdYdq5ZyN+NmWeovD2hrB8ft2yuMi+vbtNub3a0Q2wnEHMt7J6LtTcsLkXrr7te
6ugunBIOtBXNQQgmkXqy2fIsIhmLvWW9X0PE/yTqs8FqoPvNBsWQKI6PucYklizH
ng5AKucwYbUGm59AKKzO2cAt+scr/iQnD2YPjCLqpXD5+Qgb2Z8KKQFqU4FwG85a
/iVdVb6rYISMm/yQiPXQoepyS7JmR2OOCxer7NNLil0V9NZbOZdwpu03goaoL+in
v3cG6YGJaVhRrFFJ2BMG9RIRAHsWeXdYNNCWvXO3k9dw4foeNuJrs4AT+QqFpVFb
8nHbjQAXT4i2kziPGLivlNVit3pwVwxoNd84L5C2M7h3xADwNTQ=
=2m0D
-----END PGP SIGNATURE-----

--=-IShTDvXsHnknrgU9+DAa--
