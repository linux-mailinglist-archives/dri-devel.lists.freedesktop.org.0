Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1694CAB733D
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 19:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7C510E6C1;
	Wed, 14 May 2025 17:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="FuZ9OzJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABB910E6C1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 17:50:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747245036; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EoJNkJknMPG0fZ/9jueeo1HtbpmKfuY9zh35qY1kV/tcCw501DQLvSyGtbUBnZ5U5ykUbFdfjCZjpxxxsa0oMML6guKaZivzHk4aI4aox8vkRLOtX49OK6auGQY0ar9fg82BD6/ZXVCQlHgXwc5ksf4XZwtcLfIzhgSXtmj3HXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747245036;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=xkeTH2sdqK6DTXHn/G/yGKTKdJBZg4XNBoVkJgBY/qY=; 
 b=Qyhgt/wzZ6PDSoRoROwGVMpG2V4N6cZfLWYssRiZyeQFfOQiPxUR2SD0q3ypR3bQR5wKEMWuq4naZarWEAuhM75/cerp73J1dMjrNxDgwErH+ggTpaRjQ3Y/pAXASgU9gSfFBZ7D3kvubV8tHJE2VjQDNGdrdjAU1HFol6V7q2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747245036; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=xkeTH2sdqK6DTXHn/G/yGKTKdJBZg4XNBoVkJgBY/qY=;
 b=FuZ9OzJ5kG/yZ52tgOfva5uf7CEWwRg/yvU8x9cAOiL6JTEvujRsEcP7/VCC0zOE
 Xns63t4onYiD5SajuCrnXTQVKAbnLHh93IVKWRMElrsN4b66SkJgwfS/ULkkOTF2DzK
 +d4qIAT6n/x/v1Hn6IS8YiZv+GgPqk2mhuuWA4zI=
Received: by mx.zohomail.com with SMTPS id 1747245033926609.0078162287707;
 Wed, 14 May 2025 10:50:33 -0700 (PDT)
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
Date: Wed, 14 May 2025 19:50:27 +0200
Message-ID: <3628015.iIbC2pHGDl@workhorse>
In-Reply-To: <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <14333638.uLZWGnKmhe@workhorse>
 <CAAObsKAkMhgQsi6hLjbfS5wDaUz-hPQiZn7dVvn+6kDv0_jo9Q@mail.gmail.com>
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

On Wednesday, 14 May 2025 17:18:22 Central European Summer Time Tomeu Vizos=
o wrote:
> Hi Nicolas,
>=20
> Thanks for looking at this. Some thoughts below:
>=20
> On Fri, Apr 25, 2025 at 8:50=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > On Tuesday, 25 February 2025 08:55:47 Central European Summer Time Tome=
u Vizoso wrote:
> > > Add the bindings for the Neural Processing Unit IP from Rockchip.
> > >
> > > v2:
> > > - Adapt to new node structure (one node per core, each with its own
> > >   IOMMU)
> > > - Several misc. fixes from Sebastian Reichel
> > >
> > > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > >  .../bindings/npu/rockchip,rknn-core.yaml           | 152 +++++++++++=
++++++++++
> > >  1 file changed, 152 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/npu/rockchip,rknn-core=
=2Eyaml b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..e8d0afe4a7d1c4f166cf1=
3a9f4aa7c1901362a3f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/npu/rockchip,rknn-core.yaml
> > > @@ -0,0 +1,152 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/npu/rockchip,rknn-core.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Neural Processing Unit IP from Rockchip
> > > +
> > > +maintainers:
> > > +  - Tomeu Vizoso <tomeu@tomeuvizoso.net>
> > > +
> > > +description:
> > > +  Rockchip IP for accelerating inference of neural networks, based o=
n NVIDIA's
> > > +  open source NVDLA IP.
> > > +
> > > +properties:
> > > +  $nodename:
> > > +    pattern: '^npu-core@[a-f0-9]+$'
> > > +
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - rockchip,rk3588-rknn-core-top
> > > +          - const: rockchip,rknn-core-top
> > > +      - items:
> > > +          - enum:
> > > +              - rockchip,rk3588-rknn-core
> > > +          - const: rockchip,rknn-core
> > > +
> > > +  reg:
> > > +    maxItems: 1
> >
> > Hi Tomeu,
> >
> > as you probably know, RK3576 has quite a similar NPU. This is why I'm c=
urrently
> > poking at this patch series. One of the differences I ran into was that=
 the
> > IOMMU of each NPU core now sits within the reg address space range of t=
he core
> > as described by the single reg item binding and assumed by the driver.
>=20
> But this is not a difference, right?

It is. E.g. on RK3588, you use reg =3D <0x0 0xfdab0000 0x0 0x9000>; for
rknn_core_top, and rknn_mmu_top then sits at 0xfdab9000, which is just
outside the reg range of the rknn_core_top node. That means acquiring the
iomem as a resource succeeds for you, whereas for me it fails.

>=20
> > This seemed weird to me at first, since I would've guessed the cores wo=
uld be
> > exactly the same, but I noticed that they kind of still are; the RK3588=
's NPU
> > also has a "hole" between 0x2000 and 0x2fff on each core, which is wher=
e RK3576
> > put its IOMMU.
>=20
> So this is the same in both RK3576 and RK3588, right?

Yes, both RK3576 and RK3588 have a hole in the same area. RK3562 also has
the same hole. RK3568 doesn't have the offsets for the individual parts of
the NPU in the TRM, making all the relative register offsets the TRM then
goes on to document completely pointless as it omits what those offsets
are based on, so we don't know if it has a hole there. I vaguely recall
that it has the IOMMU either before or past the global range (not sure if
I wrote these findings down anywhere?), so if it has a hole at 0x2000
then it's unused like on the RK3588. I don't have access to the RV1106
Part 2 TRM where the NPU is described, so I don't know whether that has a
hole there unless we dig into the downstream code.

>=20
> > This is some information I gleaned from the RK3588 TRM, specifically se=
ction
> > 36.4.1 "Internal Address Mapping", which shows where each "part" of the=
 NPU core
> > has its address space.
> >
> > Right now we just represent this as a single reg item per core. I've pl=
ayed
> > with the idea of splitting this up into the distinct ranges the TRM lis=
ts and
> > giving each a reg-names entry, but this would require a major rework of=
 the
> > driver from what I can tell, including to the auto-generated register h=
eader.
> >
> > For now, my hack on RK3576 is to just ioremap the range defined by reso=
urce
> > start to resource end inside rocket manually if I get -EBUSY trying to =
ioremap
> > the resource proper. This is quite an ugly hack though, it means the IO=
MMU node
> > still has its address overlapping with another node in the DT, and it a=
lso means
> > we have an unavoidable error message printed into the kernel log. This =
is also
> > what the vendor driver seems to do.
> >
> > What do you reckon is a reg setup in the binding that is both reasonabl=
e to
> > implement in the driver while accurately describing the hardware?
>=20
> Guess we could go with some smaller granularity and have 3 register
> areas per core, instead of 10:
>=20
> - CORE: PC+CNA (0x0000 ~ 0x1fff)
> - AUX: CORE+DPU+PPU+DDMA+SDMA (0x3000 ~ 0x9fff)
> - GLOBAL (0xf000 ~ 0xf004)
>=20
> So the IOMMU on all the known SoCs can have its own regmap. I have
> chosen to call the first one CORE because these are the components
> that are absolutely needed in any NPU that is oriented towards
> convolutional networks (convolutions, basically). I have named the
> second AUX because it contains hardware units that are optional and
> are used to implement operations that may be common but that aren't as
> computational expensive as convolutions and thus might be skipped in
> lower-end versions of the IP.
>=20
> What do you think?

I'm personally fine with this approach. I've floated a two-area approach
to Sebastian Reichel before who, as far as I can recall, expressed his
distaste for  it as it seemed like an arbitrary division. I do concur in
that, it seems very arbitrary, so it's hard to say whether the bindings
maintainers would let us get away with it if they get wind of it.
Unfortunately they are Cc'd on this E-Mail, so the cat is out of the bag
in this regard.

What speaks for the 3 register area split is that anything that brings
more holes and doubly mapped things into the AUX area is probably going
to be so radically different it'll ideally have its own binding anyway,
or needs more than just a compatible added to the binding.

I think as far as arbitrary splits goes, the one you propose is probably
the one most closely aligned with reality. Certain register areas do
seem like something they'd never move away from its corresponding
companion, whereas adding parts to the AUX area or removing from it is
probably going to be quite common. So it can essentially be treated as
the area where optional things will most likely land as you pointed out,
which then don't need more bindings fiddling to add those optional things
as explicitly named areas in the bindings as long as we treat it as just
one opaque area s far as the binding is concerned.

Also, unless there's some virtual combined sparse iomem API in the kernel
that I'm not aware of, that's probably the easiest path forward for the
driver as well.

>=20
> Regards,
>=20
> Tomeu

Kind regards,
Nicolas Frattaroli

>=20
> > The RK3568, which uses a similar NPU design has the IOMMU at an offset =
of 0xb000
> > from the core's start of PC, so probably after any core specifics but b=
efore the
> > global registers if I hazard a guess.
> >
> > For those without access to the TRM: splitting this up into multiple re=
g items
> > per core precisely the way the TRM does it would result in no less than=
 10 reg
> > items on RK3588, if I count correctly.
> >
> > Kind regards,
> > Nicolas Frattaroli
> >
> >
>=20




