Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E943A291B1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 15:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEA610E7D6;
	Wed,  5 Feb 2025 14:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bnE4QYFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C0710E1E4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 14:53:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A53E7A436D4;
 Wed,  5 Feb 2025 14:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF1FC4CED1;
 Wed,  5 Feb 2025 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738767211;
 bh=ly4tyRLO/ehfMN/FLCIRG16hKWOkEGsQKwgjdbw72Qs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bnE4QYFLfLaYNfccMdfqWT+RYN9yf+Gjxza7rzCut/1l9oMaUuiijDdd/DhaRbESZ
 XgFg6X3q4ifc0Xq8xBrBd3RLOXS/4Y33jlkUTNozgo2VcesBo2wJwSkQaRsQqJZa0a
 T67JDf8W1XRZNMD5C9zAXRKf4SEEAxGwkW8xeIPTCdscEvhIh30okn0Sv7Z9Jvpu3E
 PHUledK8RTCFdrv8PmcgPFa163+tjJbY8mwv5asDoBKS5o2hovBwjFoJP+EmXlJDXt
 0al3PgvxiEK16LH5cWdsPOTO8FTFJ0qmea/GqbeiLRwUna6jGtHUrHA0uLaWFwRXQg
 MrFxL1PvPIaEA==
Date: Wed, 5 Feb 2025 15:53:29 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Florent Tomasin <florent.tomasin@arm.com>, 
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 nd@arm.com, Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali CSF
 GPUs
Message-ID: <20250205-robust-tall-parrot-69baf7@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
 <c856a7059171bcc6afd6d829c6c025882855778b.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="edrbb66pldmq62jz"
Content-Disposition: inline
In-Reply-To: <c856a7059171bcc6afd6d829c6c025882855778b.camel@ndufresne.ca>
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


--edrbb66pldmq62jz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali CSF
 GPUs
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 01:22:58PM -0500, Nicolas Dufresne wrote:
> Le lundi 03 f=E9vrier 2025 =E0 16:43 +0000, Florent Tomasin a =E9crit=A0:
> > Hi Maxime, Nicolas
> >=20
> > On 30/01/2025 17:47, Nicolas Dufresne wrote:
> > > Le jeudi 30 janvier 2025 =E0 17:38 +0100, Maxime Ripard a =E9crit=A0:
> > > > Hi Nicolas,
> > > >=20
> > > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > > > > Le jeudi 30 janvier 2025 =E0 14:46 +0100, Maxime Ripard a =E9crit=
=A0:
> > > > > > Hi,
> > > > > >=20
> > > > > > I started to review it, but it's probably best to discuss it he=
re.
> > > > > >=20
> > > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > This is a patch series covering the support for protected mod=
e execution in
> > > > > > > Mali Panthor CSF kernel driver.
> > > > > > >=20
> > > > > > > The Mali CSF GPUs come with the support for protected mode ex=
ecution at the
> > > > > > > HW level. This feature requires two main changes in the kerne=
l driver:
> > > > > > >=20
> > > > > > > 1) Configure the GPU with a protected buffer. The system must=
 provide a DMA
> > > > > > >    heap from which the driver can allocate a protected buffer.
> > > > > > >    It can be a carved-out memory or dynamically allocated pro=
tected memory region.
> > > > > > >    Some system includes a trusted FW which is in charge of th=
e protected memory.
> > > > > > >    Since this problem is integration specific, the Mali Panth=
or CSF kernel
> > > > > > >    driver must import the protected memory from a device spec=
ific exporter.
> > > > > >=20
> > > > > > Why do you need a heap for it in the first place? My understand=
ing of
> > > > > > your series is that you have a carved out memory region somewhe=
re, and
> > > > > > you want to allocate from that carved out memory region your bu=
ffers.
> > > > > >=20
> > > > > > How is that any different from using a reserved-memory region, =
adding
> > > > > > the reserved-memory property to the GPU device and doing all yo=
ur
> > > > > > allocation through the usual dma_alloc_* API?
> > > > >=20
> > > > > How do you then multiplex this region so it can be shared between
> > > > > GPU/Camera/Display/Codec drivers and also userspace ?
> > > >=20
> > > > You could point all the devices to the same reserved memory region,=
 and
> > > > they would all allocate from there, including for their userspace-f=
acing
> > > > allocations.
> > >=20
> > > I get that using memory region is somewhat more of an HW description,=
 and
> > > aligned with what a DT is supposed to describe. One of the challenge =
is that
> > > Mediatek heap proposal endup calling into their TEE, meaning knowing =
the region
> > > is not that useful. You actually need the TEE APP guid and its IPC pr=
otocol. If
> > > we can dell drivers to use a head instead, we can abstract that SoC s=
pecific
> > > complexity. I believe each allocated addressed has to be mapped to a =
zone, and
> > > that can only be done in the secure application. I can imagine simila=
r needs
> > > when the protection is done using some sort of a VM / hypervisor.
> > >=20
> > > Nicolas
> > >=20
> >=20
> > The idea in this design is to abstract the heap management from the
> > Panthor kernel driver (which consumes a DMA buffer from it).
> >=20
> > In a system, an integrator would have implemented a secure heap driver,
> > and could be based on TEE or a carved-out memory with restricted access,
> > or else. This heap driver would be responsible of implementing the
> > logic to: allocate, free, refcount, etc.
> >=20
> > The heap would be retrieved by the Panthor kernel driver in order to
> > allocate protected memory to load the FW and allow the GPU to enter/exit
> > protected mode. This memory would not belong to a user space process.
> > The driver allocates it at the time of loading the FW and initialization
> > of the GPU HW. This is a device globally owned protected memory.
>=20
> This use case also applies well for codec. The Mediatek SCP firmware need=
s to be
> loaded with a restricted memory too, its a very similar scenario, plus Me=
diatek
> chips often include a Mali. On top of that, V4L2 codecs (in general) do n=
eed to
> allocate internal scratch buffer for the IP to write to for things like m=
otion
> vectors, reconstruction frames, entropy statistics, etc. The IP will only=
 be
> able to write if the memory is restricted.

BTW, in such a case, do the scratch buffers need to be
protected/secure/whatever too, or would codecs be able to use any buffer
as a scratch buffer?

Maxime

--edrbb66pldmq62jz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6N7aAAKCRAnX84Zoj2+
doTZAYC3KraTKaHat9Tiq3AbNilzp/uyB6OJohhC6KgS8ip7Em2xWpjYSTaqcm0i
XDstePQBf2GNysp5QIxHwmbP32dTXWpJP67ChoVOCgGc+5xAqzvPeAGxw97hlfZf
HYSF4lENtQ==
=HDp7
-----END PGP SIGNATURE-----

--edrbb66pldmq62jz--
