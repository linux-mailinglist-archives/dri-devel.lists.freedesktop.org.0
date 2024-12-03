Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6DB9E1487
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 08:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF9B10E92C;
	Tue,  3 Dec 2024 07:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MWVl9Ho7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A160E10E92C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 07:44:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 382CDA407D9;
 Tue,  3 Dec 2024 07:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3B8C4CED8;
 Tue,  3 Dec 2024 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733211868;
 bh=vJV8EubPHG28ef5nB+3TzK3ggyQUNZdfL4E5irdCToI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MWVl9Ho7r3LQFzJmXrpsKndKja0tnTBu/YHgdY0LdNNVtumwGPDcyd6WWHToHKSbZ
 z8pv5XfemwKPEGuG3wSO2oqVDMDP7iF0//8hAlKrNrraEM3lIXamfvSPxTDESvqf5H
 ohThDStqmbSO4tkPfbbr9Y7DqRx8q/UumTTNDHNrzpY9YlYtI704sV/lUwoC7ykUAc
 GR6O/hR5Tpne4I+0tmdkvdrAmt5CgPjkHLlZUxPKle7OSGnMKgcjvaa58pIIavOV9Y
 pTIorKCGu357eSybAv1qMQvwGCrTt83+YJCLh7W0vG+WboEKdTo8mtwDoKMFaUQ78M
 see6v/g2nndqA==
Date: Tue, 3 Dec 2024 08:44:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name
 definitions
Message-ID: <20241203-cerulean-ringtail-of-speed-920c5f@houat>
References: <20241202115827.50388-1-mripard@kernel.org>
 <CANDhNCpTnc6=YkjQgQngRCw1_xLWgOFrcjTxrrGX+bRhvGb5DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oyxae4th32hiwzgr"
Content-Disposition: inline
In-Reply-To: <CANDhNCpTnc6=YkjQgQngRCw1_xLWgOFrcjTxrrGX+bRhvGb5DQ@mail.gmail.com>
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


--oyxae4th32hiwzgr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name
 definitions
MIME-Version: 1.0

Hi John,

On Mon, Dec 02, 2024 at 11:12:23AM -0800, John Stultz wrote:
> On Mon, Dec 2, 2024 at 3:58=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> >
> > Following a recent discussion at last Plumbers, John Stultz, Sumit
> > Sewal, TJ Mercier and I came to an agreement that we should document
> > what the dma-buf heaps names are expected to be, and what the buffers
> > attributes you'll get should be documented.
> >
> > Let's create that doc to make sure those attributes and names are
> > guaranteed going forward.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >
> > ---
> > Changes from v1:
> >   - Add the mention that the cma / reserved heap is optional.
> >
> > To: Jonathan Corbet <corbet@lwn.net>
> > To: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: John Stultz <jstultz@google.com>
> > Cc: "T.J. Mercier" <tjmercier@google.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-doc@vger.kernel.org
> > ---
> >  Documentation/userspace-api/dma-buf-heaps.rst | 76 +++++++++++++++++++
> >  Documentation/userspace-api/index.rst         |  1 +
> >  2 files changed, 77 insertions(+)
> >  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
> >
> > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentat=
ion/userspace-api/dma-buf-heaps.rst
> > new file mode 100644
> > index 000000000000..68be7ddea150
> > --- /dev/null
> > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > @@ -0,0 +1,76 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > +Allocating dma-buf using heaps
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Dma-buf Heaps are a way for userspace to allocate dma-buf objects. The=
y are
> > +typically used to allocate buffers from a specific allocation pool, or=
 to share
> > +buffers across frameworks.
> > +
> > +Heaps
> > +=3D=3D=3D=3D=3D
> > +
> > +A heap represent a specific allocator. The Linux kernel currently supp=
orts the
> > +following heaps:
> > +
> > + - The ``system`` heap allocates virtually contiguous, cacheable, buff=
ers
> > +
> > + - The ``reserved`` heap allocates physically contiguous, cacheable,
>=20
> So, I think calling the heap name the "cma" heap might be clearer here?
> On some platforms the chardev is "reserved" because the default cma
> region is setup via dma_contiguous_reserve_area() (which calls it
> "reserved"), but the dma heap is exporting cma.

Ok, I'll change it

> Additionally, on some downstream devices there can be multiple purpose
> separated CMA heaps. This hasn't made it upstream over objections to
> how downstream devices were enumerating the separate cma regions in
> their devicetrees. It was proposed to export all cma regions as
> separate cma heaps, but there was reasonable concern over kernel
> drivers not expecting userland to be able to allocate from special
> reservations, so that seemed like a bad idea.
>=20
> Ideally upstream drivers would want to explicitly export their special
> CMA region themselves and we would export something like
> add_cma_heap() to do so.
>=20
> All to say: this document really only covers the naming of the
> "default" CMA region that is exported via the cma heap.  Eventually
> there may be other CMA heaps as well upstream.

Sure. My point was to follow-up on the discussion we had at Plumbers
that concluded by something along the lines of: heap names provide the
semantics and guarantee over how buffers are allocated, and thus we need
to document what each name is providing.

If we were to add new ones, we would obviously extend that list to
accomodate those changes.

> > +   buffers. Only present if a CMA region is present. Such a region is
> > +   usually created either through the kernel commandline through the
> > +   `cma` parameter, a memory region Device-Tree node with the
> > +   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` =
or
> > +   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
> > +   might be called differently:
> > +
> > +    - Acer Iconia Tab A500: ``linux,cma``
> > +    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> > +    - Amlogic A1: ``linux,cma``
> > +    - Amlogic G12A/G12B/SM1: ``linux,cma``
> > +    - Amlogic GXBB/GXL: ``linux,cma``
> > +    - ASUS EeePad Transformer TF101: ``linux,cma``
> > +    - ASUS Google Nexus 7 (Project Bach / ME370TG) E1565: ``linux,cma``
> > +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) E1565: ``linux,cma=
``
> > +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) PM269: ``linux,cma=
``
> > +    - Asus Transformer Infinity TF700T: ``linux,cma``
> > +    - Asus Transformer Pad 3G TF300TG: ``linux,cma``
> > +    - Asus Transformer Pad TF300T: ``linux,cma``
> > +    - Asus Transformer Pad TF701T: ``linux,cma``
> > +    - Asus Transformer Prime TF201: ``linux,cma``
> > +    - ASUS Vivobook S 15: ``linux,cma``
> > +    - Cadence KC705: ``linux,cma``
> > +    - Digi International ConnectCore 6UL: ``linux,cma``
> > +    - Freescale i.MX8DXL EVK: ``linux,cma``
> > +    - Freescale TQMa8Xx: ``linux,cma``
> > +    - Hisilicon Hikey: ``linux,cma``
> > +    - Lenovo ThinkPad T14s Gen 6: ``linux,cma``
> > +    - Lenovo ThinkPad X13s: ``linux,cma``
> > +    - Lenovo Yoga Slim 7x: ``linux,cma``
> > +    - LG Optimus 4X HD P880: ``linux,cma``
> > +    - LG Optimus Vu P895: ``linux,cma``
> > +    - Loongson 2k0500, 2k1000 and 2k2000: ``linux,cma``
> > +    - Microsoft Romulus: ``linux,cma``
> > +    - NXP i.MX8ULP EVK: ``linux,cma``
> > +    - NXP i.MX93 9x9 QSB: ``linux,cma``
> > +    - NXP i.MX93 11X11 EVK: ``linux,cma``
> > +    - NXP i.MX93 14X14 EVK: ``linux,cma``
> > +    - NXP i.MX95 19X19 EVK: ``linux,cma``
> > +    - Ouya Game Console: ``linux,cma``
> > +    - Pegatron Chagall: ``linux,cma``
> > +    - PHYTEC phyCORE-AM62A SOM: ``linux,cma``
> > +    - PHYTEC phyCORE-i.MX93 SOM: ``linux,cma``
> > +    - Qualcomm SC8280XP CRD: ``linux,cma``
> > +    - Qualcomm X1E80100 CRD: ``linux,cma``
> > +    - Qualcomm X1E80100 QCP: ``linux,cma``
> > +    - RaspberryPi: ``linux,cma``
> > +    - Texas Instruments AM62x SK board family: ``linux,cma``
> > +    - Texas Instruments AM62A7 SK: ``linux,cma``
> > +    - Toradex Apalis iMX8: ``linux,cma``
> > +    - TQ-Systems i.MX8MM TQMa8MxML: ``linux,cma``
> > +    - TQ-Systems i.MX8MN TQMa8MxNL: ``linux,cma``
> > +    - TQ-Systems i.MX8MPlus TQMa8MPxL: ``linux,cma``
> > +    - TQ-Systems i.MX8MQ TQMa8MQ: ``linux,cma``
> > +    - TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM: ``linux,cma``
> > +    - TQ-Systems MBA6ULx Baseboard: ``linux,cma``
> >
>=20
> Hrm. I'm not sure I see the value in enumerating things in this way,
> it seems like it will be a nuisance to keep current?  Maybe something
> like:
>=20
> On most systems the default cma region is named "linux, cma" or
> "reserved", with a few exceptions:
>     - Allwinner sun4i, sun5i and sun7i families: ``default-pool``

I'm a bit worried about doing so. What if, on a "linux,cma" system, we
have another "reserved" heap created with different semantics?

Maxime

--oyxae4th32hiwzgr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0621AAKCRAnX84Zoj2+
dpBuAYC2s1RGUSIkQw4f8pFxFPQyYLk/lXZ9JMjt98iHjpsFoEFlDdnT7fqXsaod
YBXdbZQBgM7v2uOQbGVmHqDVJgb6bvXYCmnTNhJN/4OjTyohktFnefHRvCO3AeIC
/JhYeUMpBA==
=tIKi
-----END PGP SIGNATURE-----

--oyxae4th32hiwzgr--
