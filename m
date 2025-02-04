Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3267A27975
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 19:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207C810E6D8;
	Tue,  4 Feb 2025 18:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="YXy/HSnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5EC10E37B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 18:12:47 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6dcdf23b4edso50779866d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 10:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738692767; x=1739297567;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7FLDKP+B1KLmToqN0+wbXjgRxetp1/agS67Xma08wWo=;
 b=YXy/HSnhufHCHxCpIXLGIinpeozZSycZB9c6WuGQu82d5zN3YrVFDZfZ4/jzpcklVf
 55xtPv/BCYGel1BPa8+S2/J6zHMBuAjds+AYfjn06tE12BQ7EJ+rzMAtfFf6m3TdNmPw
 a9rkkzrOIFRQhaNO7I4C3Sn4QzmG0gWytlyIbrfkTfhgVn7kbSLij+9ZfOqxVWr+PIiV
 QDsA/IG6yOM0XDHe4IwN41vR6FK9xNJ3RJ9W0Xn0qNXKChaDDaGIAp1wqKo1haICPZFd
 pmT0T4gEsMvCwY80LubMuPG3bu3BShXisb5pNc+k2uGOLWnGAqiUb4nW882VxaHfZfzx
 AW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692767; x=1739297567;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7FLDKP+B1KLmToqN0+wbXjgRxetp1/agS67Xma08wWo=;
 b=JDRk7xqu9iLgc4ziztx9IE6GQallHImjYacLNR/l4XJSSuKW3zG9TqKQ+Xsrt16Cs/
 nMVAM+gAIbWZj2CygH0UYGPBc7GbIbY7p5giCdpt5Sb7ebP73PmziFaxo2oALy1wjGk4
 OIbkG7BEuhvPYGuPuAWZf62UQ3QH5ykqS+MUizM5mKocNVGWm6usHFS9b3JEGih1/kmL
 A8OneQbDwjFCg+vZw4KTq7s3XDEpuCyMi0uUeYvhFNCBILsLOBDoTnxj7eO9KaHzdmWw
 0wwITtGQyPVFOqNizOVqMTecKJS5vH8D3VGgzRoPqUpPyhF9LhjM0yaEkmzUIlkd/5hT
 7vCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbSF+BuLA31lXDF9EBRXmq6Cd9lT2YNzz/w+Hk1YdNHTDPyRwDjmGuSNWm1rn+Kj8C7KhJ1R3yKcI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy60bxVNt12dNmyfkxDQfD+09AwPCw3RDB5S9yadHmXiNJUhhP7
 r08TyE9qOiC81Grs9nEBhoxsw8fGdIcRZpsp/JGba2hb5mLWeU/4DQnDSOygWVc=
X-Gm-Gg: ASbGncuKqRh5ScGDAGqaaljBoDGO1rrUSqX0Z6xqqI93RfVDe3r86jxB8RI52bnb1dt
 mPrWiw8AzBbMiU8o5/UIn8qZMk3sDWGdpJJJjL6+ZbecP3W7p0boEspXk52bSvBL2wDOnt+AomH
 cc8ouliJ5JLu1eCIZ7q0C0xvtayc1x467qF7gkhrtSaGkKlq3PC7n8oeeKux3G/I9LA6re6SGUE
 4RJo3cEnDbqlqiHCosghtjx5H4pCDUn4tQc1lOk/iqRbOiybGHcO2y+60x81l4cmXQX9OBnauPM
 7B/f58SAgngKCMJ8
X-Google-Smtp-Source: AGHT+IEUFtl7TqQiYVbLC5fRURyW+Ho5rjSwqMbAkbu0qwIuaYAMXRJbz+FDijkjOelVbHDYm/RAhg==
X-Received: by 2002:a05:6214:3291:b0:6e1:a4d6:185f with SMTP id
 6a1803df08f44-6e243c9b8c2mr427636956d6.34.1738692766625; 
 Tue, 04 Feb 2025 10:12:46 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e2548143c4sm64370106d6.35.2025.02.04.10.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 10:12:46 -0800 (PST)
Message-ID: <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
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
Date: Tue, 04 Feb 2025 13:12:44 -0500
In-Reply-To: <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
 <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
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

Hi Florent,

Le lundi 03 f=C3=A9vrier 2025 =C3=A0 13:36 +0000, Florent Tomasin a =C3=A9c=
rit=C2=A0:
>=20
> On 30/01/2025 13:28, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Jan 30, 2025 at 01:08:57PM +0000, Florent Tomasin wrote:
> > > Introduce a CMA Heap dt-binding allowing custom
> > > CMA heap registrations.
> > >=20
> > > * Note to the reviewers:
> > > The patch was used for the development of the protected mode

Just to avoid divergence in nomenclature, and because this is not a new sub=
ject,
perhaps you should also adhere to the name "restricted". Both Linaro and
Mediatek have moved from "secure" to that name in their proposal. As you ar=
e the
third proposing this (at least for the proposal that are CCed on linux-medi=
a), I
would have expected in your cover letter a summary of how the other require=
ment
have been blended in your proposal.

regards,
Nicolas

> > > feature in Panthor CSF kernel driver and is not initially thought
> > > to land in the Linux kernel. It is mostly relevant if someone
> > > wants to reproduce the environment of testing. Please, raise
> > > interest if you think the patch has value in the Linux kernel.
> > >=20
> > > Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> > > ---
> > >  .../devicetree/bindings/dma/linux,cma.yml     | 43 +++++++++++++++++=
++
> > >  1 file changed, 43 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/dma/linux,cma.y=
ml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/dma/linux,cma.yml b/Do=
cumentation/devicetree/bindings/dma/linux,cma.yml
> > > new file mode 100644
> > > index 000000000000..c532e016bbe5
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/dma/linux,cma.yml
> > > @@ -0,0 +1,43 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/dma/linux-cma.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Custom Linux CMA heap
> > > +
> > > +description:
> > > +  The custom Linux CMA heap device tree node allows registering
> > > +  of multiple CMA heaps.
> > > +
> > > +  The CMA heap name will match the node name of the "memory-region".
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - linux,cma
> > > +
> > > +  memory-region:
> > > +    maxItems: 1
> > > +    description: |
> > > +      Phandle to the reserved memory node associated with the CMA He=
ap.
> > > +      The reserved memory node must follow this binding convention:
> > > +       - Documentation/devicetree/bindings/reserved-memory/reserved-=
memory.txt
> > > +
> > > +examples:
> > > +  - |
> > > +    reserved-memory {
> > > +      #address-cells =3D <2>;
> > > +      #size-cells =3D <2>;
> > > +
> > > +      custom_cma_heap: custom-cma-heap {
> > > +        compatible =3D "shared-dma-pool";
> > > +        reg =3D <0x0 0x90600000 0x0 0x1000000>;
> > > +        reusable;
> > > +      };
> > > +    };
> > > +
> > > +    device_cma_heap: device-cma-heap {
> > > +      compatible =3D "linux,cma";
> > > +      memory-region =3D <&custom_cma_heap>;
> > > +    };
> >=20
> > Isn't it redundant with the linux,cma-default shared-dma-pool property
> > already?
> >=20
> > Maxime
>=20
> Hi Maxime,
>=20
> Please correct me if my understanding is wrong,
>=20
> The existing properties: linux,cma-default and shared-dma-pool, do not
> allow the creations of multiple standalone CMA heaps, those will create
> a single CMA heap: `dma_contiguous_default_area`? Other CMA heaps will
> be bound to a driver.
>=20
> I introduced the "linux,cma" to allow creating multiple standalone CMA
> heaps, with the intention of validating the protected mode support on
> Mali CSG GPUs. It was included in the RFC in there are interests in
> this approach.
>=20
> Since the Panthor CSF kernel driver does not own or manage a heap,
> I needed a way to create a standalone heap. The idea here is for the
> kernel driver to be an importer. I relied on a patch series to retrieve
> the heap and allocate a DMA buffer from it:
> - dma_heap_find()
> - dma_heap_buffer_alloc()
> - dma_heap_put()
>=20
> Ref:
> https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.com/=
#t
>=20
>=20
> Since the protected/secure memory management is integration specific,
> I needed a generic way for Panthor to allocate from such heap.
>=20
> In some scenarios it might be a carved-out memory, in others a FW will
> reside in the system (TEE) and require a secure heap driver to allocate
> memory (e.g: a similar approach is followd by MTK). Such driver would
> implement the allocation and free logic.
>=20
> Florent
>=20
>=20
>=20

