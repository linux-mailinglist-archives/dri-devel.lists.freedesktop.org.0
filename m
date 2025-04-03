Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77065A79C85
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 09:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E4310E0D4;
	Thu,  3 Apr 2025 07:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DULEKQOb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86D610E0D4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 07:04:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0063CA44271;
 Thu,  3 Apr 2025 06:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B13C4CEE3;
 Thu,  3 Apr 2025 07:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743663871;
 bh=axQRKKtAZkQVbK9Zn3xtCbGhWKRBGumuitQB4lzISSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DULEKQObjDOFleA0YwEKsQL8DNbEOgLvR49c2+gBEbLdWdpMCC1f9Dox3JsG2cD4+
 CV3eOs9orM6i4QNYHz12Zecw3Z9+h4Dgzm80uRCIBMcWoIHOlRE+VzwRqIuXI0rm+c
 VCi8vphgVRQzfnRBN3j390MUQJaMVBuKRUZjhXQgoyi9KBeGz3t5ovMFMm4SOty2Ic
 3j9rE379MF+9Asvbzy/W/w/7ubfZeTleHOGhUzHqVWdguzHRwCdRGfab9unGqXDH9P
 p06I3hpccJ1Qn1ACFCrYaLOU1N5guo6q8NKKDB+qdkH+gmFgtdPhQgsvrhKsSPpST1
 h4Ly07jbRBj4g==
Date: Thu, 3 Apr 2025 09:04:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/2] dma-buf: heaps: system: Remove global variable
Message-ID: <20250403-elated-cinnamon-tortoise-7b6cb8@houat>
References: <20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org>
 <20250401-dma-buf-ecc-heap-v2-1-043fd006a1af@kernel.org>
 <e268d75d-c75a-499e-872d-09f91defed6b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gld5fz6ykqjpt6sc"
Content-Disposition: inline
In-Reply-To: <e268d75d-c75a-499e-872d-09f91defed6b@amd.com>
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


--gld5fz6ykqjpt6sc
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] dma-buf: heaps: system: Remove global variable
MIME-Version: 1.0

On Tue, Apr 01, 2025 at 05:28:43PM +0200, Christian K=F6nig wrote:
>=20
>=20
> Am 01.04.25 um 17:12 schrieb Maxime Ripard:
> > The system heap has been using its struct dma_heap pointer but wasn't
> > using it anywhere.
> >
> > Since we'll need additional parameters to attach to that heap type,
> > let's create a private structure and set it as the dma_heap drvdata,
> > removing the global variable in the process.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heap=
s/system_heap.c
> > index 26d5dc89ea1663a0d078e3a5723ca3d8d12b935f..adf422eaa33a52794f952d9=
d4260b8743d37f421 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -19,11 +19,13 @@
> >  #include <linux/module.h>
> >  #include <linux/scatterlist.h>
> >  #include <linux/slab.h>
> >  #include <linux/vmalloc.h>
> > =20
> > -static struct dma_heap *sys_heap;
> > +struct system_heap {
> > +	struct dma_heap *heap;
> > +};
> > =20
> >  struct system_heap_buffer {
> >  	struct dma_heap *heap;
> >  	struct list_head attachments;
> >  	struct mutex lock;
> > @@ -422,17 +424,22 @@ static const struct dma_heap_ops system_heap_ops =
=3D {
> >  };
> > =20
> >  static int __init system_heap_create(void)
> >  {
> >  	struct dma_heap_export_info exp_info;
> > +	struct system_heap *sys_heap;
> > +
> > +	sys_heap =3D kzalloc(sizeof(*sys_heap), GFP_KERNEL);
> > +	if (!sys_heap)
> > +		return -ENOMEM;
> > =20
> >  	exp_info.name =3D "system";
> >  	exp_info.ops =3D &system_heap_ops;
> > -	exp_info.priv =3D NULL;
> > +	exp_info.priv =3D sys_heap;
>=20
> Why do you even need this?

Urgh, sorry. I'm not even sure how I ended up with that patch, but
you're correct. I'll send a much simpler version.

Maxime

--gld5fz6ykqjpt6sc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ+4y+wAKCRDj7w1vZxhR
xYtuAP9h8qpbfSL8QdI6gkSoBqCm6iJd/D34aA/O+lgHIZmeZAEA8kN4XsbG3As+
6Hk8D0ZvINLOC3KUYPipNQqNfDSiewQ=
=QlbU
-----END PGP SIGNATURE-----

--gld5fz6ykqjpt6sc--
