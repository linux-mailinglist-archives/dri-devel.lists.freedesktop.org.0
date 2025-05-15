Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EACBEAB80A2
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426BC10E7AF;
	Thu, 15 May 2025 08:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="1ql8+HKs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95A610E7AF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 08:30:28 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e7297c3ce7aso546705276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 01:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1747297827;
 x=1747902627; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wWaTnxgDJ26OAjNMq/hUinGBTzq0pRUQFrKLwWlGdH8=;
 b=1ql8+HKsUAUJT6NgtLVV3QwBbzBc9M5SHfnoyazZIm4yIitOmfURZtnBfj8ZyDEaE6
 +IuDjOoU6LJX/iHjw0f9PaYJRE5bLva27Jsdavo+cNZjkdtfeD/lpF1jgY09u7jD2Ik0
 z0GcHuH5xGct31v/oJWe/CySBHywKk3z4JemxTB2YuEBct0+ZL+H7xtA4WvdlsrGyonv
 Qr9PYOpclLFDKUllulFq4H68bVFd7TTEa8vMkPM1SsmnTj8iJOPUQ/CHVaee4vttyz1N
 1SpnUPMg/MFS6Q9iAH2KGo3usvCBbbCBnRrzKu1aN50H6nYl6608tTpxkGIkltfT7E0K
 xxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747297827; x=1747902627;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wWaTnxgDJ26OAjNMq/hUinGBTzq0pRUQFrKLwWlGdH8=;
 b=DL5bihdaw3o3yKxhJo0glD+FrD0ht1kBOOjfgg2P9lz8+PlvvbutlHOjsl6NhFrjAX
 WXYB6Xi+DORImInjPVrSjH4pB9mhtLaa04S5MldAq3n0u4CkmsDDz8fJxZDkTQFK0n7o
 3pHZRQPKqdkMbXEu0I0wuhFTGAwD19l80ZajlNX/iTPTQTdOTsxcYcVkP1yBWJzgWHz6
 hFJtpfu4w5oxOXb07my3KwijKzdiWwshns/K0D+X3GQgoQbq2jPy9a9x5acVy2Gm+boX
 QTBXfIzq0IY2qdAchAxuKPpkAQ+sYjrcHtlTrPROnBfzdrgG4lIRdhXNLWOZntwDXxVl
 7rZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC+1llgodknfrCfpJTxLqhkLNVLFl98dlDxjfyXGkLgCwxLZGjqr0OXwM3nip9kz+lh+oMkC8K2BA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy603lYHWQEDOP1rCUhMJU5xpKYsK/0E70Gqjx3qU1Df8E1Inj0
 taD3T28jSFpUoqg0WK6B1v0dmEyLWsCS85UHJZssEo822Hx4LdEun0FA+2PIXQHfbC7kIBKSol2
 kPmNBiw==
X-Gm-Gg: ASbGncuot1zxKK33RrrU/E4z/AcAYnHOBru95yTDsKbhBHxtjILtZDF3Rhe8UIDAalc
 OgvljqADyd+3U3XMdB8EZbk8D9HcMNY25eTf31inDqG9O1ESY9DPgnLbnOYwD0L/uAYtTuviCsZ
 HolGjNNkGWb939CFh+Dn6Iy/2MvN9q9hbMTKGd5zycWS7W1hauHTW7zlv3S4Roe3byHjfAyv/my
 kxZuNkllGzGaSDpZVcnc6xWsHhYEJhOrub0eIr5dAKWEF4eOzQKHI0BP1BnxHWNKN4QWISlPmpS
 DPHLaN+OEXzH2hoZXSnZhFeutCqvIWjARLncfGKQbvQYwsmiLTPfbo8ahU/qOiokI+/SooDjJqh
 39xhTlWy2rdRfIIz6xzI=
X-Google-Smtp-Source: AGHT+IFKkmtvVJhXvdUS3MlRXEPeKDw1Ps3S154+wtOINpF4ChLO8+ZFsr6Vqzau5+PJLW80CCreDA==
X-Received: by 2002:a05:6902:478f:b0:e7a:dc50:9462 with SMTP id
 3f1490d57ef6-e7b544fea72mr1699519276.48.1747297826567; 
 Thu, 15 May 2025 01:30:26 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7ab06bc57fsm2621198276.17.2025.05.15.01.30.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 01:30:25 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-e733a6ff491so637576276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 01:30:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVwF6k1L3MN22rkP43YWX4+v06sDjJbE74GhMvMmNDLuOe3tUojV3NLxyfVMw8QEQFvMPBesxDXF4I=@lists.freedesktop.org
X-Received: by 2002:a05:6902:2611:b0:e75:bf29:8b12 with SMTP id
 3f1490d57ef6-e7b543312fdmr1406612276.29.1747297825420; Thu, 15 May 2025
 01:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <14333638.uLZWGnKmhe@workhorse>
 <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
 <3628015.iIbC2pHGDl@workhorse>
In-Reply-To: <3628015.iIbC2pHGDl@workhorse>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Thu, 15 May 2025 10:30:14 +0200
X-Gmail-Original-Message-ID: <CAAObsKDYpDt15NePk7DZbfwXnn5uaJxCu-pwZd-+PDEi56C73A@mail.gmail.com>
X-Gm-Features: AX0GCFvte7AOvqPUYkPmGZ9uTpeqDK9f7fAooBtsXUmTMNrN8H6cLu-3Yl2rRvk
Message-ID: <CAAObsKDYpDt15NePk7DZbfwXnn5uaJxCu-pwZd-+PDEi56C73A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, May 14, 2025 at 7:50=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Wednesday, 14 May 2025 17:18:22 Central European Summer Time Tomeu Viz=
oso wrote:
> > Hi Nicolas,
> >
> > Thanks for looking at this. Some thoughts below:
> >
> > On Fri, Apr 25, 2025 at 8:50=E2=80=AFPM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > >
> > > On Tuesday, 25 February 2025 08:55:47 Central European Summer Time To=
meu Vizoso wrote:
> > > > Add the bindings for the Neural Processing Unit IP from Rockchip.
> > > >
> > > > v2:
> > > > - Adapt to new node structure (one node per core, each with its own
> > > >   IOMMU)
> > > > - Several misc. fixes from Sebastian Reichel
> > > >
> > > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > > ---
> > > >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++=
++++++++++++
> > > >  1 file changed, 152 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-co=
re.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166c=
f13a9f4aa7c1901362a3f
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > > > @@ -0,0 +1,152 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Neural Processing Unit IP from Rockchip
> > > > +
> > > > +maintainers:
> > > > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > +
> > > > +description:
> > > > +  Rockchip IP for accelerating inference of neural networks, based=
 on NVIDIA's
> > > > +  open source NVDLA IP.
> > > > +
> > > > +properties:
> > > > +  $nodename:
> > > > +    pattern: '^npu-core@[a-f0-9]+$'
> > > > +
> > > > +  compatible:
> > > > +    oneOf:
> > > > +      - items:
> > > > +          - enum:
> > > > +              - rockchip,rk3588-rknn-core-top
> > > > +          - const: rockchip,rknn-core-top
> > > > +      - items:
> > > > +          - enum:
> > > > +              - rockchip,rk3588-rknn-core
> > > > +          - const: rockchip,rknn-core
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > >
> > > Hi Tomeu,
> > >
> > > as you probably know, RK3576 has quite a similar NPU. This is why I'm=
 currently
> > > poking at this patch series. One of the differences I ran into was th=
at the
> > > IOMMU of each NPU core now sits within the reg address space range of=
 the core
> > > as described by the single reg item binding and assumed by the driver=
.
> >
> > But this is not a difference, right?
>
> It is. E.g. on RK3588, you use reg =3D <0x0 0xfdab0000 0x0 0x9000>; for
> rknn_core_top, and rknn_mmu_top then sits at 0xfdab9000, which is just
> outside the reg range of the rknn_core_top node. That means acquiring the
> iomem as a resource succeeds for you, whereas for me it fails.

Ah, got it now, thanks.

> >
> > > This seemed weird to me at first, since I would've guessed the cores =
would be
> > > exactly the same, but I noticed that they kind of still are; the RK35=
88's NPU
> > > also has a "hole" between 0x2000 and 0x2fff on each core, which is wh=
ere RK3576
> > > put its IOMMU.
> >
> > So this is the same in both RK3576 and RK3588, right?
>
> Yes, both RK3576 and RK3588 have a hole in the same area. RK3562 also has
> the same hole. RK3568 doesn't have the offsets for the individual parts o=
f
> the NPU in the TRM, making all the relative register offsets the TRM then
> goes on to document completely pointless as it omits what those offsets
> are based on, so we don't know if it has a hole there. I vaguely recall
> that it has the IOMMU either before or past the global range (not sure if
> I wrote these findings down anywhere?), so if it has a hole at 0x2000
> then it's unused like on the RK3588. I don't have access to the RV1106
> Part 2 TRM where the NPU is described, so I don't know whether that has a
> hole there unless we dig into the downstream code.
>
> >
> > > This is some information I gleaned from the RK3588 TRM, specifically =
section
> > > 36.4.1 "Internal Address Mapping", which shows where each "part" of t=
he NPU core
> > > has its address space.
> > >
> > > Right now we just represent this as a single reg item per core. I've =
played
> > > with the idea of splitting this up into the distinct ranges the TRM l=
ists and
> > > giving each a reg-names entry, but this would require a major rework =
of the
> > > driver from what I can tell, including to the auto-generated register=
 header.
> > >
> > > For now, my hack on RK3576 is to just ioremap the range defined by re=
source
> > > start to resource end inside rocket manually if I get -EBUSY trying t=
o ioremap
> > > the resource proper. This is quite an ugly hack though, it means the =
IOMMU node
> > > still has its address overlapping with another node in the DT, and it=
 also means
> > > we have an unavoidable error message printed into the kernel log. Thi=
s is also
> > > what the vendor driver seems to do.
> > >
> > > What do you reckon is a reg setup in the binding that is both reasona=
ble to
> > > implement in the driver while accurately describing the hardware?
> >
> > Guess we could go with some smaller granularity and have 3 register
> > areas per core, instead of 10:
> >
> > - CORE: PC+CNA (0x0000 ~ 0x1fff)
> > - AUX: CORE+DPU+PPU+DDMA+SDMA (0x3000 ~ 0x9fff)
> > - GLOBAL (0xf000 ~ 0xf004)
> >
> > So the IOMMU on all the known SoCs can have its own regmap. I have
> > chosen to call the first one CORE because these are the components
> > that are absolutely needed in any NPU that is oriented towards
> > convolutional networks (convolutions, basically). I have named the
> > second AUX because it contains hardware units that are optional and
> > are used to implement operations that may be common but that aren't as
> > computational expensive as convolutions and thus might be skipped in
> > lower-end versions of the IP.
> >
> > What do you think?
>
> I'm personally fine with this approach. I've floated a two-area approach
> to Sebastian Reichel before who, as far as I can recall, expressed his
> distaste for  it as it seemed like an arbitrary division. I do concur in
> that, it seems very arbitrary, so it's hard to say whether the bindings
> maintainers would let us get away with it if they get wind of it.
> Unfortunately they are Cc'd on this E-Mail, so the cat is out of the bag
> in this regard.

Actually, after thinking a bit more about it I'm leaning towards only
having the PC, CNA and CORE areas in the DT, as those are the only
ones that should be accessible from the CPU.

The registers for the other units should be set by the PC, as it reads
the command stream.

So three register areas that can be set to wherever Rockchip has
placed them, and we just ignore the others in the kernel, as we don't
have any business messing with them ourselves.

What do you think?

Thanks,

Tomeu

> What speaks for the 3 register area split is that anything that brings
> more holes and doubly mapped things into the AUX area is probably going
> to be so radically different it'll ideally have its own binding anyway,
> or needs more than just a compatible added to the binding.
>
> I think as far as arbitrary splits goes, the one you propose is probably
> the one most closely aligned with reality. Certain register areas do
> seem like something they'd never move away from its corresponding
> companion, whereas adding parts to the AUX area or removing from it is
> probably going to be quite common. So it can essentially be treated as
> the area where optional things will most likely land as you pointed out,
> which then don't need more bindings fiddling to add those optional things
> as explicitly named areas in the bindings as long as we treat it as just
> one opaque area s far as the binding is concerned.
>
> Also, unless there's some virtual combined sparse iomem API in the kernel
> that I'm not aware of, that's probably the easiest path forward for the
> driver as well.
>
> >
> > Regards,
> >
> > Tomeu
>
> Kind regards,
> Nicolas Frattaroli
>
> >
> > > The RK3568, which uses a similar NPU design has the IOMMU at an offse=
t of 0xb000
> > > from the core's start of PC, so probably after any core specifics but=
 before the
> > > global registers if I hazard a guess.
> > >
> > > For those without access to the TRM: splitting this up into multiple =
reg items
> > > per core precisely the way the TRM does it would result in no less th=
an 10 reg
> > > items on RK3588, if I count correctly.
> > >
> > > Kind regards,
> > > Nicolas Frattaroli
> > >
> > >
> >
>
>
>
>
