Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F8A279AB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897B110E6DE;
	Tue,  4 Feb 2025 18:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="YNYIWZ/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637E310E6E8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 18:23:01 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6d89a727a19so709136d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 10:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738693380; x=1739298180;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Tac0SuyxfkJEVndSE8YT8kHaqPS7Ds82fJ/2JoeM9mo=;
 b=YNYIWZ/sOq5o9/rNGOvRCO01TqciW24BaL2mEVRwqOzQLzJq68+57S58GYg1gxx7FA
 r9jFnPDSCIdfDak3RCLYkUOiAMZOl6Ujfw4V6sRva57uR9IN5IHJAdq9+EH5dNDRijjw
 JEJYL94MEJj3vc1w/IWuh1ZMOAwreOD+7T0//ZyejwH+SYDvETSOUIeoVvmlNEN80z17
 b1DVadXoeG3/BcyyIORh5PmTDRAj4rcceElJZKjQW5Thieq+8YTLOAstPCywtnTet22g
 WATOBfbQzbIjAT/PghLkusuG/6k8hqF15QrZde2e6XhdwyhGaO1bSyijI9m8OCrSsy72
 t7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693380; x=1739298180;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tac0SuyxfkJEVndSE8YT8kHaqPS7Ds82fJ/2JoeM9mo=;
 b=bNsehBlXOCBwht031JRqLykuI3lfbHz0saI1ousdC8/n86efEfOygsR0wF3S0as6Lg
 bstpxiDqPF72/J00NIcKRrlSfBz1TyVgTH+Plbi97jduFhBhv2vLDjYti6hiAS1zVW6a
 Q+TsJ7dGf7S9CJYScifxBV8OcHfkLztCE8i8o8TcrTwzOikCjr7XM6yVrX2PTAYyrQMq
 3UG6wZY36YwNVXCbDyXVo+WZhbUxdhfI1eUcALhbUje0Rm9ZknVMfHO7sTVh/QO5efTb
 6f6435Yw7QHUWm++rUsZ1ddACvpFi0lvdmutbl5es3wQGsmTx0u03oBFicNw5X0m5pD6
 XAbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR69p9OzB77DS6KB2uYA8v63S6+mapP9zFe13AuWMeEz/32T1QYgtdyxj/U15ew2wiSRdD1tCxMEQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrsQ5B4dMYqzgWRZpx/+ibblMkb8G+F4Kmsyh6DAOt1Pi8EDxx
 BSpDenbdx+wpvHrBlk0YkHNlYD0R0Pw+lh09l/7f15zZ5+fqIq2gZ7h9ENQmldc=
X-Gm-Gg: ASbGncsodu4w83iVY+YJ+Bch5unu4u8bCxJSjtpYdm55+zzy+NgDm4tRbE+RYXJFH2F
 sFArb33CBpJxFp/X4hFA22WuemLAj6eJG74a6CGgkIeDJ4L82ZxV6Yf2BE0h336coILcFEOLi2x
 mU+PCcSJ2uvW5jpIbo2vEf1/DWATW5tOBmG+opYUcbuEa7YkKQdwtAnasssMnlYtD4vswCr7NSX
 8RBRsKiswlIMKjwbdQWBgmRZiDROqnkJcOVCYPw/BJVh2JOqoRqe74DabQFGsvTwqTWW715JKFM
 cgPCRF0pW4DTpg/k
X-Google-Smtp-Source: AGHT+IE/f1kxzWTc19HByUy9ODx9TdMIUe4LBdJWBN0eGiPy3I/9968X4R31P6i56Rq3iDSVWjRNWA==
X-Received: by 2002:ad4:5ecb:0:b0:6e2:3761:71b0 with SMTP id
 6a1803df08f44-6e420f3b728mr78300806d6.5.1738693380393; 
 Tue, 04 Feb 2025 10:23:00 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e423ca0476sm9418096d6.124.2025.02.04.10.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 10:23:00 -0800 (PST)
Message-ID: <c856a7059171bcc6afd6d829c6c025882855778b.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Florent Tomasin <florent.tomasin@arm.com>, Maxime Ripard
 <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Boris
 Brezillon	 <boris.brezillon@collabora.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,  Sumit Semwal <sumit.semwal@linaro.org>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey	
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier"	 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, nd@arm.com, Akash Goel
 <akash.goel@arm.com>
Date: Tue, 04 Feb 2025 13:22:58 -0500
In-Reply-To: <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

Le lundi 03 f=C3=A9vrier 2025 =C3=A0 16:43 +0000, Florent Tomasin a =C3=A9c=
rit=C2=A0:
> Hi Maxime, Nicolas
>=20
> On 30/01/2025 17:47, Nicolas Dufresne wrote:
> > Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9crit=
=C2=A0:
> > > Hi Nicolas,
> > >=20
> > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > > > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0:
> > > > > Hi,
> > > > >=20
> > > > > I started to review it, but it's probably best to discuss it here=
.
> > > > >=20
> > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > This is a patch series covering the support for protected mode =
execution in
> > > > > > Mali Panthor CSF kernel driver.
> > > > > >=20
> > > > > > The Mali CSF GPUs come with the support for protected mode exec=
ution at the
> > > > > > HW level. This feature requires two main changes in the kernel =
driver:
> > > > > >=20
> > > > > > 1) Configure the GPU with a protected buffer. The system must p=
rovide a DMA
> > > > > >    heap from which the driver can allocate a protected buffer.
> > > > > >    It can be a carved-out memory or dynamically allocated prote=
cted memory region.
> > > > > >    Some system includes a trusted FW which is in charge of the =
protected memory.
> > > > > >    Since this problem is integration specific, the Mali Panthor=
 CSF kernel
> > > > > >    driver must import the protected memory from a device specif=
ic exporter.
> > > > >=20
> > > > > Why do you need a heap for it in the first place? My understandin=
g of
> > > > > your series is that you have a carved out memory region somewhere=
, and
> > > > > you want to allocate from that carved out memory region your buff=
ers.
> > > > >=20
> > > > > How is that any different from using a reserved-memory region, ad=
ding
> > > > > the reserved-memory property to the GPU device and doing all your
> > > > > allocation through the usual dma_alloc_* API?
> > > >=20
> > > > How do you then multiplex this region so it can be shared between
> > > > GPU/Camera/Display/Codec drivers and also userspace ?
> > >=20
> > > You could point all the devices to the same reserved memory region, a=
nd
> > > they would all allocate from there, including for their userspace-fac=
ing
> > > allocations.
> >=20
> > I get that using memory region is somewhat more of an HW description, a=
nd
> > aligned with what a DT is supposed to describe. One of the challenge is=
 that
> > Mediatek heap proposal endup calling into their TEE, meaning knowing th=
e region
> > is not that useful. You actually need the TEE APP guid and its IPC prot=
ocol. If
> > we can dell drivers to use a head instead, we can abstract that SoC spe=
cific
> > complexity. I believe each allocated addressed has to be mapped to a zo=
ne, and
> > that can only be done in the secure application. I can imagine similar =
needs
> > when the protection is done using some sort of a VM / hypervisor.
> >=20
> > Nicolas
> >=20
>=20
> The idea in this design is to abstract the heap management from the
> Panthor kernel driver (which consumes a DMA buffer from it).
>=20
> In a system, an integrator would have implemented a secure heap driver,
> and could be based on TEE or a carved-out memory with restricted access,
> or else. This heap driver would be responsible of implementing the
> logic to: allocate, free, refcount, etc.
>=20
> The heap would be retrieved by the Panthor kernel driver in order to
> allocate protected memory to load the FW and allow the GPU to enter/exit
> protected mode. This memory would not belong to a user space process.
> The driver allocates it at the time of loading the FW and initialization
> of the GPU HW. This is a device globally owned protected memory.

This use case also applies well for codec. The Mediatek SCP firmware needs =
to be
loaded with a restricted memory too, its a very similar scenario, plus Medi=
atek
chips often include a Mali. On top of that, V4L2 codecs (in general) do nee=
d to
allocate internal scratch buffer for the IP to write to for things like mot=
ion
vectors, reconstruction frames, entropy statistics, etc. The IP will only b=
e
able to write if the memory is restricted.

Nicolas

>=20
> When I came across this patch series:
> -
> https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/=
#t
> I found it could help abstract the interface between the secure heap and
> the integration of protected memory in Panthor.
>=20
> A kernel driver would have to find the heap: `dma_heap_find()`, then
> request allocation of a DMA buffer from it. The heap driver would deal
> with the specifities of the protected memory on the system.
>=20
> > >=20
> > > > Also, how the secure memory is allocted / obtained is a process tha=
t
> > > > can vary a lot between SoC, so implementation details assumption
> > > > should not be coded in the driver.
> > >=20
> > > But yeah, we agree there, it's also the point I was trying to make :)
> > >=20
> > > Maxime
> >=20
>=20
> Agree with your point, the Panthor kernel driver may not be aware of the
> heap management logic. As an alternative to the DMA heap API used here,
> I also tried to expose the heap by passing the phandle of a "heap"
> device to Panthor. The reference to the DMA heap was stored as a private
> data of the heap device as a new type: `struct dma_heap_import_info`,
> similar to the existing type: `struct dma_heap_export_info`.
> This made me think it could be problematic, as the private data type
> would have to be cast before accessing it from the importer driver. I
> worried about a mis-use of the types with this approach.
>=20
> Regards,
> Florent

