Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0A6AB9A1A
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 12:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDC510EA34;
	Fri, 16 May 2025 10:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="JB1cbKT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1734B10EA34
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 10:25:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747391146; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bemhvM9pwc8lCTJ7XG1tyEEogtDBUUEZ41R2u5OYVFdWR9MOMZskgudhQ3OsgdJO9qjTiLycp/YDRQ8yMEzBwBAwIhN66m/UvH3eoL6WsNwtaduS5/XHC/BWuGmjdXY9vtyRIvW41BGUyo13vMCmBOD/rFbR6pyOkdqIOjZ0FEA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747391146;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7ufq7J+dS4vCBPvGzC6/ZAkxwKyIeNhF3xU0c1WaRyU=; 
 b=bUS/5eaIuaigVKEH3qqBDvXf5I2A9R4xE8DqK+/1KGO6mC4zhLQLWCc+mDKecABgyufYYTFnZMHmWG1rf1ncsVdFk1s3JPPySHXSInhxKmIzXpf3h+DM2AGOLKRIukfrVZ+Zt/IWFxAq8fA+w725ywuw8g54OfCoLoNgMbH4FpI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747391146; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=7ufq7J+dS4vCBPvGzC6/ZAkxwKyIeNhF3xU0c1WaRyU=;
 b=JB1cbKT7TU5UV3Ld8nZuGxkJHP3cleYuTIvTef8FpJFjK8fYRWPCM+r/1kBImbrj
 HVMBehTCRnncUQKVNuhcnj/F05QRYNtjQjeEH8tjJ9wuaSxKQNNuwcb+G2R4iP0yRmM
 ACYHzsfKj0H8AQMBslE47Ai8jzFBAm6A1nehUxAk=
Received: by mx.zohomail.com with SMTPS id 1747391144724792.7392507526358;
 Fri, 16 May 2025 03:25:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 1/7] dt-bindings: npu: rockchip,rknn: Add bindings
Date: Fri, 16 May 2025 12:25:37 +0200
Message-ID: <6549034.lOV4Wx5bFT@workhorse>
In-Reply-To: <CAAObsKDYpDt15NePk7DZbfwXnn5uaJxCu-pwZd-+PDEi56C73A@mail.gmail.com>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <3628015.iIbC2pHGDl@workhorse>
 <CAAObsKDYpDt15NePk7DZbfwXnn5uaJxCu-pwZd-+PDEi56C73A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

On Thursday, 15 May 2025 10:30:14 Central European Summer Time Tomeu Vizoso=
 wrote:
> On Wed, May 14, 2025 at 7:50=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > On Wednesday, 14 May 2025 17:18:22 Central European Summer Time Tomeu V=
izoso wrote:
> > > Hi Nicolas,
> > >
> > > Thanks for looking at this. Some thoughts below:
> > >
> > > On Fri, Apr 25, 2025 at 8:50=E2=80=AFPM Nicolas Frattaroli
> > > <nicolas.frattaroli@collabora.com> wrote:
> > > >
> > > > On Tuesday, 25 February 2025 08:55:47 Central European Summer Time =
Tomeu Vizoso wrote:
> > > > > Add the bindings for the Neural Processing Unit IP from Rockchip.
> > > > >
> > > > > v2:
> > > > > - Adapt to new node structure (one node per core, each with its o=
wn
> > > > >   IOMMU)
> > > > > - Several misc. fixes from Sebastian Reichel
> > > > >
> > > > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > > > ---
> > > > >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++=
++++++++++++++
> > > > >  1 file changed, 152 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-=
core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > > > > new file mode 100644
> > > > > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f16=
6cf13a9f4aa7c1901362a3f
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.ya=
ml
> > > > > @@ -0,0 +1,152 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Neural Processing Unit IP from Rockchip
> > > > > +
> > > > > +maintainers:
> > > > > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > > > +
> > > > > +description:
> > > > > +  Rockchip IP for accelerating inference of neural networks, bas=
ed on NVIDIA's
> > > > > +  open source NVDLA IP.
> > > > > +
> > > > > +properties:
> > > > > +  $nodename:
> > > > > +    pattern: '^npu-core@[a-f0-9]+$'
> > > > > +
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - items:
> > > > > +          - enum:
> > > > > +              - rockchip,rk3588-rknn-core-top
> > > > > +          - const: rockchip,rknn-core-top
> > > > > +      - items:
> > > > > +          - enum:
> > > > > +              - rockchip,rk3588-rknn-core
> > > > > +          - const: rockchip,rknn-core
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > >
> > > > Hi Tomeu,
> > > >
> > > > as you probably know, RK3576 has quite a similar NPU. This is why I=
'm currently
> > > > poking at this patch series. One of the differences I ran into was =
that the
> > > > IOMMU of each NPU core now sits within the reg address space range =
of the core
> > > > as described by the single reg item binding and assumed by the driv=
er.
> > >
> > > But this is not a difference, right?
> >
> > It is. E.g. on RK3588, you use reg =3D <0x0 0xfdab0000 0x0 0x9000>; for
> > rknn_core_top, and rknn_mmu_top then sits at 0xfdab9000, which is just
> > outside the reg range of the rknn_core_top node. That means acquiring t=
he
> > iomem as a resource succeeds for you, whereas for me it fails.
>=20
> Ah, got it now, thanks.
>=20
> > >
> > > > This seemed weird to me at first, since I would've guessed the core=
s would be
> > > > exactly the same, but I noticed that they kind of still are; the RK=
3588's NPU
> > > > also has a "hole" between 0x2000 and 0x2fff on each core, which is =
where RK3576
> > > > put its IOMMU.
> > >
> > > So this is the same in both RK3576 and RK3588, right?
> >
> > Yes, both RK3576 and RK3588 have a hole in the same area. RK3562 also h=
as
> > the same hole. RK3568 doesn't have the offsets for the individual parts=
 of
> > the NPU in the TRM, making all the relative register offsets the TRM th=
en
> > goes on to document completely pointless as it omits what those offsets
> > are based on, so we don't know if it has a hole there. I vaguely recall
> > that it has the IOMMU either before or past the global range (not sure =
if
> > I wrote these findings down anywhere?), so if it has a hole at 0x2000
> > then it's unused like on the RK3588. I don't have access to the RV1106
> > Part 2 TRM where the NPU is described, so I don't know whether that has=
 a
> > hole there unless we dig into the downstream code.
> >
> > >
> > > > This is some information I gleaned from the RK3588 TRM, specificall=
y section
> > > > 36.4.1 "Internal Address Mapping", which shows where each "part" of=
 the NPU core
> > > > has its address space.
> > > >
> > > > Right now we just represent this as a single reg item per core. I'v=
e played
> > > > with the idea of splitting this up into the distinct ranges the TRM=
 lists and
> > > > giving each a reg-names entry, but this would require a major rewor=
k of the
> > > > driver from what I can tell, including to the auto-generated regist=
er header.
> > > >
> > > > For now, my hack on RK3576 is to just ioremap the range defined by =
resource
> > > > start to resource end inside rocket manually if I get -EBUSY trying=
 to ioremap
> > > > the resource proper. This is quite an ugly hack though, it means th=
e IOMMU node
> > > > still has its address overlapping with another node in the DT, and =
it also means
> > > > we have an unavoidable error message printed into the kernel log. T=
his is also
> > > > what the vendor driver seems to do.
> > > >
> > > > What do you reckon is a reg setup in the binding that is both reaso=
nable to
> > > > implement in the driver while accurately describing the hardware?
> > >
> > > Guess we could go with some smaller granularity and have 3 register
> > > areas per core, instead of 10:
> > >
> > > - CORE: PC+CNA (0x0000 ~ 0x1fff)
> > > - AUX: CORE+DPU+PPU+DDMA+SDMA (0x3000 ~ 0x9fff)
> > > - GLOBAL (0xf000 ~ 0xf004)
> > >
> > > So the IOMMU on all the known SoCs can have its own regmap. I have
> > > chosen to call the first one CORE because these are the components
> > > that are absolutely needed in any NPU that is oriented towards
> > > convolutional networks (convolutions, basically). I have named the
> > > second AUX because it contains hardware units that are optional and
> > > are used to implement operations that may be common but that aren't as
> > > computational expensive as convolutions and thus might be skipped in
> > > lower-end versions of the IP.
> > >
> > > What do you think?
> >
> > I'm personally fine with this approach. I've floated a two-area approach
> > to Sebastian Reichel before who, as far as I can recall, expressed his
> > distaste for  it as it seemed like an arbitrary division. I do concur in
> > that, it seems very arbitrary, so it's hard to say whether the bindings
> > maintainers would let us get away with it if they get wind of it.
> > Unfortunately they are Cc'd on this E-Mail, so the cat is out of the bag
> > in this regard.
>=20
> Actually, after thinking a bit more about it I'm leaning towards only
> having the PC, CNA and CORE areas in the DT, as those are the only
> ones that should be accessible from the CPU.

That does make sense to me. I've just checked the RK3576 specific reg
fiddling code I hacked in and it doesn't appear to be writing to any
other areas either.

>=20
> The registers for the other units should be set by the PC, as it reads
> the command stream.
>=20
> So three register areas that can be set to wherever Rockchip has
> placed them, and we just ignore the others in the kernel, as we don't
> have any business messing with them ourselves.
>=20
> What do you think?

This seems like a good solution. Any further reg ranges that are used in
other variants (e.g. RK3562/RK3576 and maybe RV1106) introduce something
called "CBUF" and I'm not yet sure if that'll need any writes to its regs
from the driver, but if it does then it's easy to add another range for it
in the binding for just those compatibles.

>=20
> Thanks,
>=20
> Tomeu

Kind regards,
Nicolas Frattaroli

>=20
> > What speaks for the 3 register area split is that anything that brings
> > more holes and doubly mapped things into the AUX area is probably going
> > to be so radically different it'll ideally have its own binding anyway,
> > or needs more than just a compatible added to the binding.
> >
> > I think as far as arbitrary splits goes, the one you propose is probably
> > the one most closely aligned with reality. Certain register areas do
> > seem like something they'd never move away from its corresponding
> > companion, whereas adding parts to the AUX area or removing from it is
> > probably going to be quite common. So it can essentially be treated as
> > the area where optional things will most likely land as you pointed out,
> > which then don't need more bindings fiddling to add those optional thin=
gs
> > as explicitly named areas in the bindings as long as we treat it as just
> > one opaque area s far as the binding is concerned.
> >
> > Also, unless there's some virtual combined sparse iomem API in the kern=
el
> > that I'm not aware of, that's probably the easiest path forward for the
> > driver as well.
> >
> > >
> > > Regards,
> > >
> > > Tomeu
> >
> > Kind regards,
> > Nicolas Frattaroli
> >
> > >
> > > > The RK3568, which uses a similar NPU design has the IOMMU at an off=
set of 0xb000
> > > > from the core's start of PC, so probably after any core specifics b=
ut before the
> > > > global registers if I hazard a guess.
> > > >
> > > > For those without access to the TRM: splitting this up into multipl=
e reg items
> > > > per core precisely the way the TRM does it would result in no less =
than 10 reg
> > > > items on RK3588, if I count correctly.
> > > >
> > > > Kind regards,
> > > > Nicolas Frattaroli
> > > >
> > > >
> > >
> >
> >
> >
> >
>=20




