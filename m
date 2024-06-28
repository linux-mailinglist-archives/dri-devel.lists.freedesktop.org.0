Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 162CA91BFC0
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 15:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA34310E5E8;
	Fri, 28 Jun 2024 13:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qaAwq6zc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EAC10EC4E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:40:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D365F60C3D;
 Fri, 28 Jun 2024 13:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C32C116B1;
 Fri, 28 Jun 2024 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719582025;
 bh=UWPWV5xOWPvWRohvXp3jsd5OyLdElhEyWkgsMgthC0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qaAwq6zcOXnpgYUwN0NVIO0yqpZ0Zb5n2YZUgJX5BmAQYP2Cluav1xiJq0hZ1F060
 swoFvPvWsQ7X032KHtT6ExmTb2egebRNSVrf4Be3qEMXEjjOWdH0RacwDbG/wbJ/IL
 Lr5X0sHIKotDF4a8APUYV/YhbMEi97yJeuTM4Ndsjf4JMs3/HwJanR6v9/QibvkRsl
 44QEsuf0ytcePzl2v7ab0R9CGcp6eTRGf74VnAJH2ag50Yux/d5x/xrGpW/74HHWh3
 x7UXvQscwRb5ZzQo/H0341550qV2Cd13sb0hgnEiICw+icYbkcsRrPH5hsfSsGqiQB
 YLRRLIPVBVGow==
Date: Fri, 28 Jun 2024 15:40:22 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, 
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>, 
 Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>, 
 Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>,
 "contact@emersion.fr" <contact@emersion.fr>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>, 
 "pavel@ucw.cz" <pavel@ucw.cz>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "tjmercier@google.com" <tjmercier@google.com>,
 "jstultz@google.com" <jstultz@google.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, 
 Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Message-ID: <20240628-cuddly-brave-squid-e1cb22@houat>
References: <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
 <304c9faa-5a9c-4520-a3d8-0818f76dd7c9@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wmmpztlpkqqsn5hy"
Content-Disposition: inline
In-Reply-To: <304c9faa-5a9c-4520-a3d8-0818f76dd7c9@amd.com>
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


--wmmpztlpkqqsn5hy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 01:42:27PM GMT, Christian K=F6nig wrote:
> Am 27.06.24 um 16:40 schrieb mripard@kernel.org:
> > [SNIP]
> > > > > > > > Why can't you get this information from userspace?
> > > > > > Same reason amd and i915/xe also pass this around internally in=
 the
> > > > > kernel, it's just that for those gpus the render and kms node are=
 the
> > > > > same
> > > > > driver so this is easy.
> > > > >=20
> > > The reason I ask is that encryption here looks just like another para=
meter
> > > for the buffer, e.g. like format, stride, tilling etc..
> > >=20
> > > So instead of this during buffer import:
> > >=20
> > > mtk_gem->secure =3D (!strncmp(attach->dmabuf->exp_name, "restricted",=
 10));
> > > mtk_gem->dma_addr =3D sg_dma_address(sg->sgl);
> > > mtk_gem->size =3D attach->dmabuf->size;
> > > mtk_gem->sg =3D sg;
> > >=20
> > > You can trivially say during use hey this buffer is encrypted.
> > >=20
> > > At least that's my 10 mile high view, maybe I'm missing some extensiv=
e key
> > > exchange or something like that.
> > That doesn't work in all cases, unfortunately.
> >=20
> > If you're doing secure video playback, the firmware is typically in
> > charge of the frame decryption/decoding, and you'd get dma-buf back that
> > aren't accessible by the CPU (or at least, not at the execution level
> > Linux runs with).
>=20
> Yeah, that's perfectly fine. At least the AMD encryption solution
> works exactly like that as well.

> > So nobody can map that buffer, and the firmware driver is the one who
> > knows that this buffer cannot be accessed by anyone.
>=20
> On most hw I know you can actually map that buffer, it's just that the
> CPU sees only garbage in it because you don't have the necessary
> decryption keys around.

So you can always map and access the buffer, but only if you're in the
right "context" the content would be correct?

I think that part is pretty different than what ARM SoCs are doing,
where they would typically prevent any CPU access and fault on access.

> > Putting this on the userspace to know would be pretty weird, and
> > wouldn't solve the case where the kernel would try to map it.
>=20
> But that's exactly how all other implementations work as far as I know. I
> mean what do you do if the kernel maps the encrypted buffer?
>=20
> On AMD we also block userspace and kernel CPU accesses, but that is only
> done to make it easier to find bugs not for correctness.
>=20
> And userspace absolutely needs to be aware that a buffer is encrypted, ca=
use
> otherwise it could potentially try to access it with the CPU.

I absolutely agree. I guess our discussion is whether it's something
that should be implicit and understood by applications, or if it should
be explicit and discoverable.

Maxime

--wmmpztlpkqqsn5hy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZn69RgAKCRDj7w1vZxhR
xW5vAQD0vblFH/q1MbM1OY/GsWrJEN+h1Zy8F/ROqZxXJoSP4wEA7MhRTaakqRAd
6+tOX4+3tzAEZ0WOa+EHzLr+lzLYvQ0=
=ivoa
-----END PGP SIGNATURE-----

--wmmpztlpkqqsn5hy--
