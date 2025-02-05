Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A66A29884
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 19:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAA2110E1C9;
	Wed,  5 Feb 2025 18:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="jnoyis3j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC03A10E1C9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 18:14:16 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7be6fdeee35so656785a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 10:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738779256; x=1739384056;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ewgPkFmEX3mInvEnIhY/6iT5VC+yD3hq+wlM8kNCGHw=;
 b=jnoyis3j6KJhkOCpbex7U3u/41rVsUlXN9iJSnmUYjjtEiiYx3MkEFBoWLw0zX20Q5
 JyZ5TWD4obp1NEGjYvZ/vwDWbo548Mm8I8z4WSqVu8Gks5UE0aKuhel4BUqIWy1H0s9s
 YartguRE+hhoJT9gKtzzBy2shZzWl3k+EZtkmclxrQNBhkwYKlJZfKtC6KXL96E2t7YS
 FH6b+DIn6AOisi9FW/bA3OqP1jVfC/jYH2ZZWzBY0KTnwX1bYZgqKCApzGK+EhCegaPn
 uFLV1zyEeRxJ14Kg4J12X1bqPkR8Z2fqB6c0e/4SVIxTHj7Tp0i022pWJfOshgBH7+ua
 6gDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738779256; x=1739384056;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ewgPkFmEX3mInvEnIhY/6iT5VC+yD3hq+wlM8kNCGHw=;
 b=O3xXH7YBKLWsc+GYV5LvHH/JdMznlZuzDZRKsHqfyz7XwGSYB2JwMMiK5q5JkE7c9h
 xVJtT4TLn9Jr4DWBe5nRuWyrDbbaNOxSxpbTqnMjdRMzyMI0rrX6M5lvbuyAXpr+utGw
 NYxAKFCTVJbyD4SZPm8wmf7AW2vqP14mQKwNGao9WhMi9h7NdCMXCQv1ubaTdTmmt9KX
 WhBoRdMYICfnRrYns28ZRdDKq3QSkpjHSJ5sqIue50008+5FmGV9EssnTp4np7vF/4D4
 WnB4kmIO9Nim9AlB5kkJrtMwTfaFiVh4jWH08zXkim/SAFUgRIO1uKAYCAWDk9LJf9k0
 hB1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ0G0I8+TvbsAqKnxNnGwunBiRFoVLwfTw9VWrbi/AQic2GwVEigOBuX5X/fVafSU+YDDfSMXrdqc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykMwnnVDS2hriiyG7I8NqjI37KQB2U4Cjoq6zdjs1HQZVEWVOB
 B/+3M0fDvUWK5BQz2EDmcWz6uzz5OpkKBm13kE3jTOkzqNVni2s4djA4d34f0nM=
X-Gm-Gg: ASbGncs3ZHyL9mqMCgZtvRw1iU5aomNNThny9iN0ncEgTf8znyeFtZIywcg1S0SdQsh
 mzUIP2TzEPH2JJ9hMAIAAbv/RxESpgYXF4sr7U1yhAJDDNvXRs2+nTLo5Wr4SFrkVw+gFfmI8Al
 0IyFBaeD4Ra9/oLgSvuK6VD8a2LOgBFAe7LehRCGWhfA9CYTvhAMH4ndxfILDvgRnSoqzJVeFAO
 UgbsDiw+knrBLWwjYwHmaFrCsc9W3/qPhA7ifh7EptPCOKx5FYkey/7gTWIZADmK8zMNdv0EG8N
 QhJ33UbPjYxJz3xE
X-Google-Smtp-Source: AGHT+IFnnl9J6glnO7ave49R6IT/Ma233dmOTJ29e9pjZONK8+NxUm972OtvZRgYYQ8KwgzNcY3a5Q==
X-Received: by 2002:a05:620a:d8c:b0:7be:3d2f:16fc with SMTP id
 af79cd13be357-7c03a029359mr549685385a.51.1738779255841; 
 Wed, 05 Feb 2025 10:14:15 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c00a9047eesm781781685a.72.2025.02.05.10.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 10:14:15 -0800 (PST)
Message-ID: <2085fb785095dc5abdac2352adfb3e1e1c8ae549.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 0/5] drm/panthor: Protected mode support for Mali
 CSF GPUs
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Maxime Ripard <mripard@kernel.org>, Florent Tomasin
 <florent.tomasin@arm.com>
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
Date: Wed, 05 Feb 2025 13:14:14 -0500
In-Reply-To: <20250205-amorphous-nano-agouti-b5baba@houat>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <3ykaewmjjwkp3y2f3gf5jvqketicd4p2xqyajqtfnsxci36qlm@twidtyj2kgbw>
 <1a73c3acee34a86010ecd25d76958bca4f16d164.camel@ndufresne.ca>
 <ppznh3xnfuqrozhrc7juyi3enxc4v3meu4wadkwwzecj7oxex7@moln2fiibbxo>
 <9d0e381758c0e83882b57102fb09c5d3a36fbf57.camel@ndufresne.ca>
 <1f436caa-1c27-4bbd-9b43-a94dad0d89d0@arm.com>
 <20250205-amorphous-nano-agouti-b5baba@houat>
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

Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 15:52 +0100, Maxime Ripard a =C3=A9=
crit=C2=A0:
> On Mon, Feb 03, 2025 at 04:43:23PM +0000, Florent Tomasin wrote:
> > Hi Maxime, Nicolas
> >=20
> > On 30/01/2025 17:47, Nicolas Dufresne wrote:
> > > Le jeudi 30 janvier 2025 =C3=A0 17:38 +0100, Maxime Ripard a =C3=A9cr=
it=C2=A0:
> > > > Hi Nicolas,
> > > >=20
> > > > On Thu, Jan 30, 2025 at 10:59:56AM -0500, Nicolas Dufresne wrote:
> > > > > Le jeudi 30 janvier 2025 =C3=A0 14:46 +0100, Maxime Ripard a =C3=
=A9crit=C2=A0:
> > > > > > Hi,
> > > > > >=20
> > > > > > I started to review it, but it's probably best to discuss it he=
re.
> > > > > >=20
> > > > > > On Thu, Jan 30, 2025 at 01:08:56PM +0000, Florent Tomasin wrote=
:
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
> > > > > > >    heap from which the driver can allocate a protected buffer=
.
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
> > and could be based on TEE or a carved-out memory with restricted access=
,
> > or else. This heap driver would be responsible of implementing the
> > logic to: allocate, free, refcount, etc.
> >=20
> > The heap would be retrieved by the Panthor kernel driver in order to
> > allocate protected memory to load the FW and allow the GPU to enter/exi=
t
> > protected mode. This memory would not belong to a user space process.
> > The driver allocates it at the time of loading the FW and initializatio=
n
> > of the GPU HW. This is a device globally owned protected memory.
>=20
> The thing is, it's really not clear why you absolutely need to have the
> Panthor driver involved there. It won't be transparent to userspace,
> since you'd need an extra flag at allocation time, and the buffers
> behave differently. If userspace has to be aware of it, what's the
> advantage to your approach compared to just exposing a heap for those
> secure buffers, and letting userspace allocate its buffers from there?

Unless I'm mistaken, the Panthor driver loads its own firmware. Since loadi=
ng
the firmware requires placing the data in a protected memory region, and th=
at
this aspect has no exposure to userspace, how can Panthor not be implicated=
 ?

>=20
> > When I came across this patch series:
> > -
> > https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.co=
m/#t
> > I found it could help abstract the interface between the secure heap an=
d
> > the integration of protected memory in Panthor.
> >=20
> > A kernel driver would have to find the heap: `dma_heap_find()`, then
> > request allocation of a DMA buffer from it. The heap driver would deal
> > with the specifities of the protected memory on the system.
>=20
> Sure, but we still have to address *why* it would be a good idea for the
> driver to do it in the first place. The mediatek series had the same
> feedback.

Which got pretty clear replies iirc. The drivers needs scratch buffers and
secondary buffers to be protected, and these are not visible to userspace. =
No
one have made a proper counter argument yet. In MTK, the remote-proc driver=
 for
the SCP (a multi-purpose multimedia co-processor) will also need to place t=
he
firmware data into a protected buffer (with the help of the tee to copy the=
 data
into it of course).

Nicolas

>=20
> Maxime

