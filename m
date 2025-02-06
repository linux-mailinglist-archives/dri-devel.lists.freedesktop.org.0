Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACCA2B417
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 22:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD8E10E963;
	Thu,  6 Feb 2025 21:21:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="qstvYdCC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E8B10E963
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 21:21:15 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-467918c35easo23791881cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 13:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1738876874; x=1739481674;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6DxvZdZPg1+c/4MiY+1eFG+nW41sRJmolNY7AFhKpW0=;
 b=qstvYdCCrXcwHQrWQ0DeH8HHb1PXwIk1EmBpD0jkS+7PNmAcQTnGiVFE/+e+yvLelk
 eYtLrk84GbXany5vSNg0Vsjar+pGKA35mE4GtvD23crP/lilszH87ObC/23vfl6lB+P5
 j/3TTqSNpi+p44TUvFU0S2c5X78sOxE+WYpwlHMVwJAZOZ3YewddFS4BY7Z5iAHVjPPK
 c+gcnLXZ8wx6gAI661ypJ7Fg/Nh71yZCAZXJ7es8bqZ/j3KR0OPrsdVQsahnJL0lgsXv
 odh77ogzRiWXHvcz46xOnNCHVI0KV/tJFDAhaQTrr8BhMEaGr+gYRgD25fs5Mg38UEdh
 erxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738876874; x=1739481674;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6DxvZdZPg1+c/4MiY+1eFG+nW41sRJmolNY7AFhKpW0=;
 b=Os3imvuwuIKs8v5N2HeFlZYShbh71UhE+Tbq5L96hx0aIATfjiPh9ncbObdEq2nYbm
 z8a4EBxOl1an+RIX5sVf4VeNmXuJ3CGUNttDFKY7WEO6hkjHG2tqakoHeGxG3Bai4YvU
 +bHU7livGnsR9qpHz88We3j99XoyQjJ6nWYicp40KXDCdEyYejUyYER6l2qlEAWilmyl
 +MKgcyP0DOsuLk0Xv6KUK6x+8kTtQI/JYyRLDETiVJyZDal0zwPhtJuPw1dHeF9AAuFt
 b1dSw823/ZOc1YdU7BVPAaJ3X43RPSfkTQ4IYujxODUlSYnz78KCsh5ON13+/dNInDSA
 UO3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwwvp7M7CvhjtZrKeMAkiNBfec3r5WD8kudkv7kGGt1v3A684Gf34ZZZTWnnJ7J5yA2Gq52IINf2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB55H224wMhUmglnVfRci3ScRAYb7BRcGmQHbz2PJrZC76JsII
 5zHEUvw7NdIN2ahbLU6BPfFS/XPGBk4jDzryZvwvzF65aDp/avXKdQcg26DUK5M=
X-Gm-Gg: ASbGncuPtuRirsgKTl/WzWxssrvuRSExij2gzrMwrLm50Hf5Xr4ci6/b1vAbOPrITHD
 ebk/+fUsj8hI0AUMXG7Y/yo51TubIUMiiDWutqOHhTW7N6H/SWDIeF7o+E8AIGyryf2TI+58/eN
 2VETDh2Qq7UnH7CR4cXxlrlD098gh1gFCoT3/5JrUnoHRrVa/NJrVhc2N4MUMVqaQH08LykrIH+
 JLM4PpPcagr+u4VE1atrbubi+QVS2oMxTSLnBOgIoC+tvxcWjcXWY0X020DoOXweOm5L2l8A9kE
 84IRCdKu23QyoQ/M
X-Google-Smtp-Source: AGHT+IHI8yMd/5aYfmfZcfbDFH3h4Fy2Z99LYvivEu182Bj0ddc/CD4GBHcML5OVdc/uP/LZDxsEvA==
X-Received: by 2002:a05:622a:5a95:b0:466:a06f:ae0a with SMTP id
 d75a77b69052e-47167ae29c0mr13578771cf.32.1738876873855; 
 Thu, 06 Feb 2025 13:21:13 -0800 (PST)
Received: from nicolas-tpx395.localdomain ([2606:6d00:11:e976::7a9])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47153bc741asm9168671cf.62.2025.02.06.13.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 13:21:12 -0800 (PST)
Message-ID: <5e0e2fbb22c2ffb0c5281727cd95d70f5f5ba696.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 3/5] dt-bindings: gpu: Add protected heap name to
 Mali Valhall CSF binding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Krzysztof Kozlowski <krzk@kernel.org>, Florent Tomasin	
 <florent.tomasin@arm.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T . J . Mercier"	
 <tjmercier@google.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yong
 Wu <yong.wu@mediatek.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 nd@arm.com, Akash Goel <akash.goel@arm.com>
Date: Thu, 06 Feb 2025 16:21:10 -0500
In-Reply-To: <c0aad911-ecc4-4b04-a453-6da226f76ed2@kernel.org>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <36b57dcf20860398ba83985e1c5b6f6958d08ba7.1738228114.git.florent.tomasin@arm.com>
 <7234f25c-a2aa-4834-931b-aeeb7a49dfa7@kernel.org>
 <4b9deab1-e330-4c93-8260-75276c2bc9ff@arm.com>
 <c0aad911-ecc4-4b04-a453-6da226f76ed2@kernel.org>
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

Le mercredi 05 f=C3=A9vrier 2025 =C3=A0 10:13 +0100, Krzysztof Kozlowski a =
=C3=A9crit=C2=A0:
> On 03/02/2025 16:31, Florent Tomasin wrote:
> > Hi Krzysztof
> >=20
> > On 30/01/2025 13:25, Krzysztof Kozlowski wrote:
> > > On 30/01/2025 14:08, Florent Tomasin wrote:
> > > > Allow mali-valhall-csf driver to retrieve a protected
> > > > heap at probe time by passing the name of the heap
> > > > as attribute to the device tree GPU node.
> > >=20
> > > Please wrap commit message according to Linux coding style / submissi=
on
> > > process (neither too early nor over the limit):
> > > https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/proces=
s/submitting-patches.rst#L597
> > Apologies, I think I made quite few other mistakes in the style of the
> > patches I sent. I will work on improving this aspect, appreciated
> >=20
> > > Why this cannot be passed by phandle, just like all reserved regions?
> > >=20
> > > From where do you take these protected heaps? Firmware? This would
> > > explain why no relation is here (no probe ordering, no device links,
> > > nothing connecting separate devices).
> >=20
> > The protected heap is generaly obtained from a firmware (TEE) and could
> > sometimes be a carved-out memory with restricted access.
>=20
> Which is a reserved memory, isn't it?
>=20
> >=20
> > The Panthor CSF kernel driver does not own or manage the protected heap
> > and is instead a consumer of it (assuming the heap is made available by
> > the system integrator).
> >=20
> > I initially used a phandle, but then I realised it would introduce a ne=
w
> > API to share the heap across kernel driver. In addition I found this
> > patch series:
> > -
> > https://lore.kernel.org/lkml/20230911023038.30649-1-yong.wu@mediatek.co=
m/#t
> >=20
> > which introduces a DMA Heap API to the rest of the kernel to find a
> > heap by name:
> > - dma_heap_find()
> >=20
> > I then decided to follow that approach to help isolate the heap
> > management from the GPU driver code. In the Panthor driver, if the
> > heap is not found at probe time, the driver will defer the probe until
> > the exporter made it available.
>=20
>=20
> I don't talk here really about the driver but even above mediatek
> patchset uses reserved memory bindings.
>=20
> You explained some things about driver yet you did not answer the
> question. This looks like reserved memory. If it does not, bring
> arguments why this binding cannot be a reserved memory, why hardware is
> not a carve out memory.

I think the point is that from the Mali GPU view, the memory does not need =
to be
within the range the Linux Kernel actually see, even though current integra=
tion
have that. From Mali GPU driver stand point (or codec drivers and what's no=
t),
the memory range is not useful to allocate protected/restricted memory. On =
top
of which, its not reserved specifically for the Mali GPU.

What's your practical suggestion here ? Introduce dma_heap_find_by_region()=
 ?

Nicolas

>=20
> Best regards,
> Krzysztof
>=20

