Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC31402BDB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C94E89BF8;
	Tue,  7 Sep 2021 15:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52CA89BF8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:33:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7432E6108D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 15:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631028819;
 bh=3Yea4Fr5Ie1toQUOmtVyym4O0BP/K2DsqPqAKPtX2uU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X/95N0Xyk4A1gqz4COgG1SLU8Dh9u8q+EIJbFBjWYGEKRiY2VtodQfNzJptu9aRdZ
 DgrTj0b/7uOeVunKIsoV4baMwxgKFzo+os1nImbadj0N8c+mdxfZDbNUfzU4+NS287
 3DEbz2WzypPu0kXC/0sLG8NRCH5yb8AW3wUfhqbw6glfdzqrIQb151bFFX7DNN7PBZ
 FfHAVWGbd82aUAWDzfTWl406sc+QFDCYkbu8l32Vy9y2+02UVSynjW3e5kIZb/i3Pe
 p1Bbo/DhTH2GC3kAcvLCrSMgpc4nwKrk9T+aJZ1kVW8RElqFjns8g0aaxbzjHbkRHA
 2lrENgC+RRYog==
Received: by mail-ed1-f50.google.com with SMTP id s25so14565913edw.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 08:33:39 -0700 (PDT)
X-Gm-Message-State: AOAM533nmGB8Z4EFLXgfhfEpVHu+BDnmWbiKpBbZYzG57m6NdZFnPUhH
 P5gzOR6EfKValiWuW6BB/OPlfrE99hYA5PVwIg==
X-Google-Smtp-Source: ABdhPJyNnVMwWe1w7fHUzZYDF0H9Cf/1MvTGVSkKcOPxOQNj1Ah381CVuzMBB2RBkTKbbgZk42Z40AjczLRFC4tlCWQ=
X-Received: by 2002:aa7:de09:: with SMTP id h9mr2254edv.271.1631028817727;
 Tue, 07 Sep 2021 08:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210423163234.3651547-2-thierry.reding@gmail.com>
 <20210520220306.GA1976116@robh.at.kernel.org>
 <YLEgXyLBF8PEFNw2@orome.fritz.box>
 <YL+gHN4YZ4vt1vPk@orome.fritz.box> <YN4F/nH/9tDuWDnQ@orome.fritz.box>
 <7995b0ed-a277-ced1-b3d0-e0e7e02817a6@gmail.com>
 <YS+Ke4Ip0InHSnHR@orome.fritz.box>
 <CAL_Jsq+TQeb56UbrO1xKFSb1yo0d8U29DPynw3_jQ6gH6Peatw@mail.gmail.com>
 <YTIogpQDJjqJUTkG@orome.fritz.box>
 <CAL_JsqKG4+n_eNj+at3m7WuAbeJ1Kyi0mYD=8-MaVjfhzdPwkA@mail.gmail.com>
 <YTJA2xARFuNUMgMc@orome.fritz.box>
In-Reply-To: <YTJA2xARFuNUMgMc@orome.fritz.box>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Sep 2021 10:33:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJWt6ZELEpMi+tS6S6S4MYyMHysAC2ce_CfDQFqjfgnGQ@mail.gmail.com>
Message-ID: <CAL_JsqJWt6ZELEpMi+tS6S6S4MYyMHysAC2ce_CfDQFqjfgnGQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory
 region specifier
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sven Peter <sven@svenpeter.dev>, 
 Dmitry Osipenko <digetx@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, 
 Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org, 
 Linux IOMMU <iommu@lists.linux-foundation.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Fri, Sep 3, 2021 at 10:36 AM Thierry Reding <thierry.reding@gmail.com> w=
rote:
>
> On Fri, Sep 03, 2021 at 09:36:33AM -0500, Rob Herring wrote:
> > On Fri, Sep 3, 2021 at 8:52 AM Thierry Reding <thierry.reding@gmail.com=
> wrote:
> > >
> > > On Fri, Sep 03, 2021 at 08:20:55AM -0500, Rob Herring wrote:
> > > > On Wed, Sep 1, 2021 at 9:13 AM Thierry Reding <thierry.reding@gmail=
.com> wrote:
> > > > >
> > > > > On Fri, Jul 02, 2021 at 05:16:25PM +0300, Dmitry Osipenko wrote:
> > > > > > 01.07.2021 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
> > > > > > > On Tue, Jun 08, 2021 at 06:51:40PM +0200, Thierry Reding wrot=
e:
> > > > > > >> On Fri, May 28, 2021 at 06:54:55PM +0200, Thierry Reding wro=
te:
> > > > > > >>> On Thu, May 20, 2021 at 05:03:06PM -0500, Rob Herring wrote=
:
> > > > > > >>>> On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Reding w=
rote:
> > > > > > >>>>> From: Thierry Reding <treding@nvidia.com>
> > > > > > >>>>>
> > > > > > >>>>> Reserved memory region phandle references can be accompan=
ied by a
> > > > > > >>>>> specifier that provides additional information about how =
that specific
> > > > > > >>>>> reference should be treated.
> > > > > > >>>>>
> > > > > > >>>>> One use-case is to mark a memory region as needing an ide=
ntity mapping
> > > > > > >>>>> in the system's IOMMU for the device that references the =
region. This is
> > > > > > >>>>> needed for example when the bootloader has set up hardwar=
e (such as a
> > > > > > >>>>> display controller) to actively access a memory region (e=
.g. a boot
> > > > > > >>>>> splash screen framebuffer) during boot. The operating sys=
tem can use the
> > > > > > >>>>> identity mapping flag from the specifier to make sure an =
IOMMU identity
> > > > > > >>>>> mapping is set up for the framebuffer before IOMMU transl=
ations are
> > > > > > >>>>> enabled for the display controller.
> > > > > > >>>>>
> > > > > > >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > > > >>>>> ---
> > > > > > >>>>>  .../reserved-memory/reserved-memory.txt       | 21 +++++=
++++++++++++++
> > > > > > >>>>>  include/dt-bindings/reserved-memory.h         |  8 +++++=
++
> > > > > > >>>>>  2 files changed, 29 insertions(+)
> > > > > > >>>>>  create mode 100644 include/dt-bindings/reserved-memory.h
> > > > > > >>>>
> > > > > > >>>> Sorry for being slow on this. I have 2 concerns.
> > > > > > >>>>
> > > > > > >>>> First, this creates an ABI issue. A DT with cells in 'memo=
ry-region'
> > > > > > >>>> will not be understood by an existing OS. I'm less concern=
ed about this
> > > > > > >>>> if we address that with a stable fix. (Though I'm pretty s=
ure we've
> > > > > > >>>> naively added #?-cells in the past ignoring this issue.)
> > > > > > >>>
> > > > > > >>> A while ago I had proposed adding memory-region*s* as an al=
ternative
> > > > > > >>> name for memory-region to make the naming more consistent w=
ith other
> > > > > > >>> types of properties (think clocks, resets, gpios, ...). If =
we added
> > > > > > >>> that, we could easily differentiate between the "legacy" ca=
ses where
> > > > > > >>> no #memory-region-cells was allowed and the new cases where=
 it was.
> > > > > > >>>
> > > > > > >>>> Second, it could be the bootloader setting up the reserved=
 region. If a
> > > > > > >>>> node already has 'memory-region', then adding more regions=
 is more
> > > > > > >>>> complicated compared to adding new properties. And definin=
g what each
> > > > > > >>>> memory-region entry is or how many in schemas is impossibl=
e.
> > > > > > >>>
> > > > > > >>> It's true that updating the property gets a bit complicated=
, but it's
> > > > > > >>> not exactly rocket science. We really just need to splice t=
he array. I
> > > > > > >>> have a working implemention for this in U-Boot.
> > > > > > >>>
> > > > > > >>> For what it's worth, we could run into the same issue with =
any new
> > > > > > >>> property that we add. Even if we renamed this to iommu-memo=
ry-region,
> > > > > > >>> it's still possible that a bootloader may have to update th=
is property
> > > > > > >>> if it already exists (it could be hard-coded in DT, or it c=
ould have
> > > > > > >>> been added by some earlier bootloader or firmware).
> > > > > > >>>
> > > > > > >>>> Both could be addressed with a new property. Perhaps somet=
hing like
> > > > > > >>>> 'iommu-memory-region =3D <&phandle>;'. I think the 'iommu'=
 prefix is
> > > > > > >>>> appropriate given this is entirely because of the IOMMU be=
ing in the
> > > > > > >>>> mix. I might feel differently if we had other uses for cel=
ls, but I
> > > > > > >>>> don't really see it in this case.
> > > > > > >>>
> > > > > > >>> I'm afraid that down the road we'll end up with other cases=
 and then we
> > > > > > >>> might proliferate a number of *-memory-region properties wi=
th varying
> > > > > > >>> prefixes.
> > > > > > >>>
> > > > > > >>> I am aware of one other case where we might need something =
like this: on
> > > > > > >>> some Tegra SoCs we have audio processors that will access m=
emory buffers
> > > > > > >>> using a DMA engine. These processors are booted from early =
firmware
> > > > > > >>> using firmware from system memory. In order to avoid trashi=
ng the
> > > > > > >>> firmware, we need to reserve memory. We can do this using r=
eserved
> > > > > > >>> memory nodes. However, the audio DMA engine also uses the S=
MMU, so we
> > > > > > >>> need to make sure that the firmware memory is marked as res=
erved within
> > > > > > >>> the SMMU. This is similar to the identity mapping case, but=
 not exactly
> > > > > > >>> the same. Instead of creating a 1:1 mapping, we just want t=
hat IOVA
> > > > > > >>> region to be reserved (i.e. IOMMU_RESV_RESERVED instead of
> > > > > > >>> IOMMU_RESV_DIRECT{,_RELAXABLE}).
> > > > > > >>>
> > > > > > >>> That would also fall into the IOMMU domain, but we can't re=
use the
> > > > > > >>> iommu-memory-region property for that because then we don't=
 have enough
> > > > > > >>> information to decide which type of reservation we need.
> > > > > > >>>
> > > > > > >>> We could obviously make iommu-memory-region take a specifie=
r, but we
> > > > > > >>> could just as well use memory-regions in that case since we=
 have
> > > > > > >>> something more generic anyway.
> > > > > > >>>
> > > > > > >>> With the #memory-region-cells proposal, we can easily exten=
d the cell in
> > > > > > >>> the specifier with an additional MEMORY_REGION_IOMMU_RESERV=
E flag to
> > > > > > >>> take that other use case into account. If we than also chan=
ge to the new
> > > > > > >>> memory-regions property name, we avoid the ABI issue (and w=
e gain a bit
> > > > > > >>> of consistency while at it).
> > > > > > >>
> > > > > > >> Ping? Rob, do you want me to add this second use-case to the=
 patch
> > > > > > >> series to make it more obvious that this isn't just a one-of=
f thing? Or
> > > > > > >> how do we proceed?
> > > > > > >
> > > > > > > Rob, given that additional use-case, do you want me to run wi=
th this
> > > > > > > proposal and send out an updated series?
> > > > > >
> > > > > >
> > > > > > What about variant with a "descriptor" properties that will des=
cribe
> > > > > > each region:
> > > > > >
> > > > > > fb_desc: display-framebuffer-memory-descriptor {
> > > > > >       needs-identity-mapping;
> > > > > > }
> > > > > >
> > > > > > display@52400000 {
> > > > > >       memory-region =3D <&fb ...>;
> > > > > >       memory-region-descriptor =3D <&fb_desc ...>;
> > > > > > };
> > > > > >
> > > > > > It could be a more flexible/extendible variant.
> > > > >
> > > > > This problem recently came up on #dri-devel again. Adding Alyssa =
and
> > > > > Sven who are facing a similar challenge on their work on Apple M1=
 (if I
> > > > > understood correctly). Also adding dri-devel for visibility since=
 this
> > > > > is a very common problem for display in particular.
> > > > >
> > > > > On M1 the situation is slightly more complicated: the firmware wi=
ll
> > > > > allocate a couple of buffers (including the framebuffer) in high =
memory
> > > > > (> 4 GiB) and use the IOMMU to map that into an IOVA region below=
 4 GiB
> > > > > so that the display hardware can access it. This makes it impossi=
ble to
> > > > > bypass the IOMMU like we do on other chips (in particular to work=
 around
> > > > > the fault-by-default policy of the ARM SMMU driver). It also mean=
s that
> > > > > in addition to the simple reserved regions I mentioned we need fo=
r audio
> > > > > use-cases and identity mapping use-cases we need for display on T=
egra,
> > > > > we now also need to be able to convey physical to IOVA mappings.
> > > > >
> > > > > Fitting the latter into the original proposal sounds difficult. A=
 quick
> > > > > fix would've been to generate a mapping table in memory and pass =
that to
> > > > > the kernel using a reserved-memory node (similar to what's done f=
or
> > > > > example on Tegra for the EMC frequency table on Tegra210) and mar=
k it as
> > > > > such using a special flag. But that then involves two layers of p=
arsing,
> > > > > which seems a bit suboptimal. Another way to shoehorn that into t=
he
> > > > > original proposal would've been to add flags for physical and vir=
tual
> > > > > address regions and use pairs to pass them using special flags. A=
gain,
> > > > > this is a bit wonky because it needs these to be carefully parsed=
 and
> > > > > matched up.
> > > > >
> > > > > Another downside is that we now have a situation where some of th=
ese
> > > > > regions are no longer "reserved-memory regions" in the traditiona=
l
> > > > > sense. This would require an additional flag in the reserved-memo=
ry
> > > > > region nodes to prevent the IOVA regions from being reserved. By =
the
> > > > > way, this is something that would also be needed for the audio us=
e-case
> > > > > I mentioned before, because the physical memory at that address c=
an
> > > > > still be used by an operating system.
> > > > >
> > > > > A more general solution would be to draw a bit from Dmitry's prop=
osal
> > > > > and introduce a new top-level "iov-reserved-memory" node. This co=
uld be
> > > > > modelled on the existing reserved-memory node, except that the ph=
ysical
> > > > > memory pages for regions represented by child nodes would not be =
marked
> > > > > as reserved. Only the IOVA range described by the region would be
> > > > > reserved subsequently by the IOMMU framework and/or IOMMU driver.
> > > > >
> > > > > The simplest case where we just want to reserve some IOVA region =
could
> > > > > then be done like this:
> > > > >
> > > > >         iov-reserved-memory {
> > > > >                 /*
> > > > >                  * Probably safest to default to <2>, <2> here gi=
ven
> > > > >                  * that most IOMMUs support either > 32 bits of I=
AS
> > > > >                  * or OAS.
> > > > >                  */
> > > > >                 #address-cells =3D <2>;
> > > > >                 #size-cells =3D <2>;
> > > > >
> > > > >                 firmware: firmware@80000000 {
> > > > >                         reg =3D <0 0x80000000 0 0x01000000>;
> > > > >                 };
> > > > >         };
> > > > >
> > > > >         audio@30000000 {
> > > > >                 ...
> > > > >                 iov-memory-regions =3D <&firmware>;
> > > > >                 ...
> > > > >         };
> > > > >
> > > > > Mappings could be represented by an IOV reserved region taking a
> > > > > reference to the reserved-region that they map:
> > > > >
> > > > >         reserved-memory {
> > > > >                 #address-cells =3D <2>;
> > > > >                 #size-cells =3D <2>;
> > > > >
> > > > >                 /* 16 MiB of framebuffer at top-of-memory */
> > > > >                 framebuffer: framebuffer@1,ff000000 {
> > > > >                         reg =3D <0x1 0xff000000 0 0x01000000>;
> > > > >                         no-map;
> > > > >                 };
> > > > >         };
> > > > >
> > > > >         iov-reserved-memory {
> > > > >                 /* IOMMU supports only 32-bit output address spac=
e */
> > > > >                 #address-cells =3D <1>;
> > > > >                 #size-cells =3D <1>;
> > > > >
> > > > >                 /* 16 MiB of framebuffer mapped to top of IOVA */
> > > > >                 fb: fb@ff000000 {
> > > > >                         reg =3D <0 0xff000000 0 0x01000000>;
> > > > >                         memory-region =3D <&framebuffer>;
> > > > >                 };
> > > > >         };
> > > > >
> > > > >         display@40000000 {
> > > > >                 ...
> > > > >                 /* optional? */
> > > > >                 memory-region =3D <&framebuffer>;
> > > > >                 iov-memory-regions =3D <&fb>;
> > > > >                 ...
> > > > >         };
> > > > >
> > > > > It's interesting how identity mapped regions now become a trivial
> > > > > special case of mappings. All that is needed is to make the reg p=
roperty
> > > > > of the IOV reserved region correspond to the reg property of the =
normal
> > > > > reserved region. Alternatively, as a small optimization for lazy =
people
> > > > > like me, we could just allow these cases to omit the reg property=
 and
> > > > > instead inherit it from the referenced reserved region.
> > > > >
> > > > > As the second example shows it might be convenient if memory-regi=
on
> > > > > could be derived from iov-memory-regions. This could be useful fo=
r cases
> > > > > where the driver wants to do something with the physical pages of=
 the
> > > > > reserved region (such as mapping them and copying out the framebu=
ffer
> > > > > data to another buffer so that the reserved memory can be recycle=
d). If
> > > > > we have the IOV reserved region, we could provide an API to extra=
ct the
> > > > > physical reserved region (if it exists). That way we could avoid
> > > > > referencing it twice in DT. Then again, there's something elegant=
 about
> > > > > the explicit second reference to. It indicates the intent that we=
 may
> > > > > want to use the region for something other than just the IOV mapp=
ing.
> > > > >
> > > > > Anyway, this has been long enough. Let me know what you think. Al=
yssa,
> > > > > Sven, it'd be interesting to hear if you think this could work as=
 a
> > > > > solution to the problem on M1.
> > > > >
> > > > > Rob, I think you might like this alternative because it basically=
 gets
> > > > > rid of all the points in the original proposal that you were conc=
erned
> > > > > about. Let me know what you think.
> > > >
> > > > Couldn't we keep this all in /reserved-memory? Just add an iova
> > > > version of reg. Perhaps abuse 'assigned-address' for this purpose. =
The
> > > > issue I see would be handling reserved iova areas without a physica=
l
> > > > area. That can be handled with just a iova and no reg. We already h=
ave
> > > > a no reg case.
> > >
> > > I had thought about that initially. One thing I'm worried about is th=
at
> > > every child node in /reserved-memory will effectively cause the memor=
y
> > > that it described to be reserved. But we don't want that for regions
> > > that are "virtual only" (i.e. IOMMU reservations).
> >
> > By virtual only, you mean no physical mapping, just a region of
> > virtual space, right? For that we'd have no 'reg' and therefore no
> > (physical) reservation by the OS. It's similar to non-static regions.
> > You need a specific handler for them. We'd probably want a compatible
> > as well for these virtual reservations.
>
> Yeah, these would be purely used for reserving regions in the IOVA so
> that they won't be used by the IOVA allocator. Typically these would be
> used for cases where those addresses have some special meaning.
>
> Do we want something like:
>
>         compatible =3D "iommu-reserved";
>
> for these? Or would that need to be:
>
>         compatible =3D "linux,iommu-reserved";
>
> ? There seems to be a mix of vendor-prefix vs. non-vendor-prefix
> compatible strings in the reserved-memory DT bindings directory.

I would not use 'linux,' here.

>
> On the other hand, do we actually need the compatible string? Because we
> don't really want to associate much extra information with this like we
> do for example with "shared-dma-pool". The logic to handle this would
> all be within the IOMMU framework. All we really need is for the
> standard reservation code to skip nodes that don't have a reg property
> so we don't reserve memory for "virtual-only" allocations.

It doesn't hurt to have one and I can imagine we might want to iterate
over all the nodes. It's slightly easier and more common to iterate
over compatible nodes rather than nodes with some property.

> > Are these being global in DT going to be a problem? Presumably we have
> > a virtual space per IOMMU. We'd know which IOMMU based on a device's
> > 'iommus' and 'memory-region' properties, but within /reserved-memory
> > we wouldn't be able to distinguish overlapping addresses from separate
> > address spaces. Or we could have 2 different IOVAs for 1 physical
> > space. That could be solved with something like this:
> >
> > iommu-addresses =3D <&iommu1 <address cells> <size cells>>;
>
> The only case that would be problematic would be if we have overlapping
> physical regions, because that will probably trip up the standard code.
>
> But this could also be worked around by looking at iommu-addresses. For
> example, if we had something like this:
>
>         reserved-memory {
>                 fb_dc0: fb@80000000 {
>                         reg =3D <0x80000000 0x01000000>;
>                         iommu-addresses =3D <0xa0000000 0x01000000>;
>                 };
>
>                 fb_dc1: fb@80000000 {

You can't have 2 nodes with the same name (actually, you can, they
just get merged together). Different names with the same unit-address
is a dtc warning. I'd really like to make that a full blown
overlapping region check.

>                         reg =3D <0x80000000 0x01000000>;
>                         iommu-addresses =3D <0xb0000000 0x01000000>;
>                 };
>         };
>
> We could make the code identify that this is for the same physical
> reservation (maybe make it so that reg needs to match exactly for this
> to be recognized) but with different virtual allocations.
>
> On a side-note: do we really need to repeat the size? I'd think if we
> want mappings then we'd likely want them for the whole reservation.

Humm, I suppose not, but dropping it paints us into a corner if we
come up with wanting a different size later. You could have a carveout
for double/triple buffering your framebuffer, but the bootloader
framebuffer is only single buffered. So would you want actual size?

> I'd like to keep references to IOMMUs out of this because they would be
> duplicated. We will only use these nodes if they are referenced by a
> device node that also has an iommus property. Also, the IOMMU reference
> itself isn't enough. We'd also need to support the complete specifier
> because you can have things like SIDs in there to specify the exact
> address space that a device uses.
>
> Also, for some of these they may be reused independently of the IOMMU
> address space. For example the Tegra framebuffer identity mapping can
> be used by either of the 2-4 display controllers, each with (at least
> potentially) their own address space. But we don't want to have to
> describe the identity mapping separately for each display controller.

Okay, but I'd rather have to duplicate things in your case than not be
able to express some other case.

> Another thing to consider is that these nodes will often be added by
> firmware (e.g. firmware will allocate the framebuffer and set up the
> corresponding reserved memory region in DT). Wiring up references like
> this would get very complicated very quickly.

Yes.

The using 'iommus' property option below can be optional and doesn't
have to be defined/supported now. Just trying to think ahead and not
be stuck with something that can't be extended.

> > Or the other way to do this is reuse 'iommus' property to define the
> > mapping of each address entry to iommu.
> >
> > > Obviously we can fix that in Linux, but what about other operating
> > > systems? Currently "reg" is a required property for statically alloca=
ted
> > > regions (which all of these would be). Do you have an idea of how wid=
ely
> > > that's used? What about other OSes, or bootloaders, what if they
> > > encounter these nodes that don't have a "reg" property?
> >
> > Without 'reg', there must be a compatible that the client understands
> > or the node should be ignored.
> >
> > My suspicion is that /reserved-memory is abused for all sorts of
> > things downstream, but that's not really relevant here.
>
> Yeah, my only concern was that we might break users of this that are not
> sophisticated enough to handle the nuances that we'd introduce here. If
> we can assume that nodes without a reg property will be ignored, then I
> think that's good enough.

I'm pretty sure we should be okay, but check the code.

Rob
