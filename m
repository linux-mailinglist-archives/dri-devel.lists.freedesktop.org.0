Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD35400156
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 16:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9006E89F;
	Fri,  3 Sep 2021 14:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BF56E89F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 14:36:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23773610E6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630679808;
 bh=2B45XJbOwgTgbzqy60XQ3eiBE1S6v8PBW/gObbwsud8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NUibM1cBrIb7xdP+a9IlAobPtiDnSeLPkUNNE/lMoNDHxvqJXuhHyX0+YqqSAyqt1
 T/3SNDXBa+RLpbi5W9qRBqErcWUpZNsja3UBQRrcZL3hSRqOpJVBC9DQ50e3Lk6MXu
 QmM7H63IU+ca7ViSkifp6z4FkxGxMs3FrVMofPJtis+mvUAXr+PVmsKuW0MGk52KSg
 hzm12Sdu6fCSB1clN/hJBmStmXHHmqxQGw8urgUwoy1TRNHHdyz6pY1aFP+kGpTXft
 wz9ydocqRJdhizSw8Fg9CWdkT/rtpk4zCqXBwy9k3p+fqY094SHO5sRuOjg+ISg2T9
 6EkxA81Sb4O5w==
Received: by mail-ed1-f43.google.com with SMTP id q3so8258434edt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 07:36:48 -0700 (PDT)
X-Gm-Message-State: AOAM533JVoWU2rJbbQ0+TwUeBSToxdzinrIW7yNL3Ly6hXAH1reCvrX0
 +JfcfopNxWaG0qXMUooRhesd1ETglXI0wN87qQ==
X-Google-Smtp-Source: ABdhPJwT59/l+PqQGnGKvEzHeMnfgEAWnMmugUDNzDEHJ13EnpYQ3GZ2MWlaaOqiAHgzarYc+upjNQe9xqFSFdjQb5c=
X-Received: by 2002:a50:ed09:: with SMTP id j9mr4323997eds.164.1630679806621; 
 Fri, 03 Sep 2021 07:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-2-thierry.reding@gmail.com>
 <20210520220306.GA1976116@robh.at.kernel.org>
 <YLEgXyLBF8PEFNw2@orome.fritz.box> <YL+gHN4YZ4vt1vPk@orome.fritz.box>
 <YN4F/nH/9tDuWDnQ@orome.fritz.box>
 <7995b0ed-a277-ced1-b3d0-e0e7e02817a6@gmail.com>
 <YS+Ke4Ip0InHSnHR@orome.fritz.box>
 <CAL_Jsq+TQeb56UbrO1xKFSb1yo0d8U29DPynw3_jQ6gH6Peatw@mail.gmail.com>
 <YTIogpQDJjqJUTkG@orome.fritz.box>
In-Reply-To: <YTIogpQDJjqJUTkG@orome.fritz.box>
From: Rob Herring <robh@kernel.org>
Date: Fri, 3 Sep 2021 09:36:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKG4+n_eNj+at3m7WuAbeJ1Kyi0mYD=8-MaVjfhzdPwkA@mail.gmail.com>
Message-ID: <CAL_JsqKG4+n_eNj+at3m7WuAbeJ1Kyi0mYD=8-MaVjfhzdPwkA@mail.gmail.com>
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

On Fri, Sep 3, 2021 at 8:52 AM Thierry Reding <thierry.reding@gmail.com> wr=
ote:
>
> On Fri, Sep 03, 2021 at 08:20:55AM -0500, Rob Herring wrote:
> > On Wed, Sep 1, 2021 at 9:13 AM Thierry Reding <thierry.reding@gmail.com=
> wrote:
> > >
> > > On Fri, Jul 02, 2021 at 05:16:25PM +0300, Dmitry Osipenko wrote:
> > > > 01.07.2021 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > > On Tue, Jun 08, 2021 at 06:51:40PM +0200, Thierry Reding wrote:
> > > > >> On Fri, May 28, 2021 at 06:54:55PM +0200, Thierry Reding wrote:
> > > > >>> On Thu, May 20, 2021 at 05:03:06PM -0500, Rob Herring wrote:
> > > > >>>> On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Reding wrote=
:
> > > > >>>>> From: Thierry Reding <treding@nvidia.com>
> > > > >>>>>
> > > > >>>>> Reserved memory region phandle references can be accompanied =
by a
> > > > >>>>> specifier that provides additional information about how that=
 specific
> > > > >>>>> reference should be treated.
> > > > >>>>>
> > > > >>>>> One use-case is to mark a memory region as needing an identit=
y mapping
> > > > >>>>> in the system's IOMMU for the device that references the regi=
on. This is
> > > > >>>>> needed for example when the bootloader has set up hardware (s=
uch as a
> > > > >>>>> display controller) to actively access a memory region (e.g. =
a boot
> > > > >>>>> splash screen framebuffer) during boot. The operating system =
can use the
> > > > >>>>> identity mapping flag from the specifier to make sure an IOMM=
U identity
> > > > >>>>> mapping is set up for the framebuffer before IOMMU translatio=
ns are
> > > > >>>>> enabled for the display controller.
> > > > >>>>>
> > > > >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > >>>>> ---
> > > > >>>>>  .../reserved-memory/reserved-memory.txt       | 21 +++++++++=
++++++++++
> > > > >>>>>  include/dt-bindings/reserved-memory.h         |  8 +++++++
> > > > >>>>>  2 files changed, 29 insertions(+)
> > > > >>>>>  create mode 100644 include/dt-bindings/reserved-memory.h
> > > > >>>>
> > > > >>>> Sorry for being slow on this. I have 2 concerns.
> > > > >>>>
> > > > >>>> First, this creates an ABI issue. A DT with cells in 'memory-r=
egion'
> > > > >>>> will not be understood by an existing OS. I'm less concerned a=
bout this
> > > > >>>> if we address that with a stable fix. (Though I'm pretty sure =
we've
> > > > >>>> naively added #?-cells in the past ignoring this issue.)
> > > > >>>
> > > > >>> A while ago I had proposed adding memory-region*s* as an altern=
ative
> > > > >>> name for memory-region to make the naming more consistent with =
other
> > > > >>> types of properties (think clocks, resets, gpios, ...). If we a=
dded
> > > > >>> that, we could easily differentiate between the "legacy" cases =
where
> > > > >>> no #memory-region-cells was allowed and the new cases where it =
was.
> > > > >>>
> > > > >>>> Second, it could be the bootloader setting up the reserved reg=
ion. If a
> > > > >>>> node already has 'memory-region', then adding more regions is =
more
> > > > >>>> complicated compared to adding new properties. And defining wh=
at each
> > > > >>>> memory-region entry is or how many in schemas is impossible.
> > > > >>>
> > > > >>> It's true that updating the property gets a bit complicated, bu=
t it's
> > > > >>> not exactly rocket science. We really just need to splice the a=
rray. I
> > > > >>> have a working implemention for this in U-Boot.
> > > > >>>
> > > > >>> For what it's worth, we could run into the same issue with any =
new
> > > > >>> property that we add. Even if we renamed this to iommu-memory-r=
egion,
> > > > >>> it's still possible that a bootloader may have to update this p=
roperty
> > > > >>> if it already exists (it could be hard-coded in DT, or it could=
 have
> > > > >>> been added by some earlier bootloader or firmware).
> > > > >>>
> > > > >>>> Both could be addressed with a new property. Perhaps something=
 like
> > > > >>>> 'iommu-memory-region =3D <&phandle>;'. I think the 'iommu' pre=
fix is
> > > > >>>> appropriate given this is entirely because of the IOMMU being =
in the
> > > > >>>> mix. I might feel differently if we had other uses for cells, =
but I
> > > > >>>> don't really see it in this case.
> > > > >>>
> > > > >>> I'm afraid that down the road we'll end up with other cases and=
 then we
> > > > >>> might proliferate a number of *-memory-region properties with v=
arying
> > > > >>> prefixes.
> > > > >>>
> > > > >>> I am aware of one other case where we might need something like=
 this: on
> > > > >>> some Tegra SoCs we have audio processors that will access memor=
y buffers
> > > > >>> using a DMA engine. These processors are booted from early firm=
ware
> > > > >>> using firmware from system memory. In order to avoid trashing t=
he
> > > > >>> firmware, we need to reserve memory. We can do this using reser=
ved
> > > > >>> memory nodes. However, the audio DMA engine also uses the SMMU,=
 so we
> > > > >>> need to make sure that the firmware memory is marked as reserve=
d within
> > > > >>> the SMMU. This is similar to the identity mapping case, but not=
 exactly
> > > > >>> the same. Instead of creating a 1:1 mapping, we just want that =
IOVA
> > > > >>> region to be reserved (i.e. IOMMU_RESV_RESERVED instead of
> > > > >>> IOMMU_RESV_DIRECT{,_RELAXABLE}).
> > > > >>>
> > > > >>> That would also fall into the IOMMU domain, but we can't reuse =
the
> > > > >>> iommu-memory-region property for that because then we don't hav=
e enough
> > > > >>> information to decide which type of reservation we need.
> > > > >>>
> > > > >>> We could obviously make iommu-memory-region take a specifier, b=
ut we
> > > > >>> could just as well use memory-regions in that case since we hav=
e
> > > > >>> something more generic anyway.
> > > > >>>
> > > > >>> With the #memory-region-cells proposal, we can easily extend th=
e cell in
> > > > >>> the specifier with an additional MEMORY_REGION_IOMMU_RESERVE fl=
ag to
> > > > >>> take that other use case into account. If we than also change t=
o the new
> > > > >>> memory-regions property name, we avoid the ABI issue (and we ga=
in a bit
> > > > >>> of consistency while at it).
> > > > >>
> > > > >> Ping? Rob, do you want me to add this second use-case to the pat=
ch
> > > > >> series to make it more obvious that this isn't just a one-off th=
ing? Or
> > > > >> how do we proceed?
> > > > >
> > > > > Rob, given that additional use-case, do you want me to run with t=
his
> > > > > proposal and send out an updated series?
> > > >
> > > >
> > > > What about variant with a "descriptor" properties that will describ=
e
> > > > each region:
> > > >
> > > > fb_desc: display-framebuffer-memory-descriptor {
> > > >       needs-identity-mapping;
> > > > }
> > > >
> > > > display@52400000 {
> > > >       memory-region =3D <&fb ...>;
> > > >       memory-region-descriptor =3D <&fb_desc ...>;
> > > > };
> > > >
> > > > It could be a more flexible/extendible variant.
> > >
> > > This problem recently came up on #dri-devel again. Adding Alyssa and
> > > Sven who are facing a similar challenge on their work on Apple M1 (if=
 I
> > > understood correctly). Also adding dri-devel for visibility since thi=
s
> > > is a very common problem for display in particular.
> > >
> > > On M1 the situation is slightly more complicated: the firmware will
> > > allocate a couple of buffers (including the framebuffer) in high memo=
ry
> > > (> 4 GiB) and use the IOMMU to map that into an IOVA region below 4 G=
iB
> > > so that the display hardware can access it. This makes it impossible =
to
> > > bypass the IOMMU like we do on other chips (in particular to work aro=
und
> > > the fault-by-default policy of the ARM SMMU driver). It also means th=
at
> > > in addition to the simple reserved regions I mentioned we need for au=
dio
> > > use-cases and identity mapping use-cases we need for display on Tegra=
,
> > > we now also need to be able to convey physical to IOVA mappings.
> > >
> > > Fitting the latter into the original proposal sounds difficult. A qui=
ck
> > > fix would've been to generate a mapping table in memory and pass that=
 to
> > > the kernel using a reserved-memory node (similar to what's done for
> > > example on Tegra for the EMC frequency table on Tegra210) and mark it=
 as
> > > such using a special flag. But that then involves two layers of parsi=
ng,
> > > which seems a bit suboptimal. Another way to shoehorn that into the
> > > original proposal would've been to add flags for physical and virtual
> > > address regions and use pairs to pass them using special flags. Again=
,
> > > this is a bit wonky because it needs these to be carefully parsed and
> > > matched up.
> > >
> > > Another downside is that we now have a situation where some of these
> > > regions are no longer "reserved-memory regions" in the traditional
> > > sense. This would require an additional flag in the reserved-memory
> > > region nodes to prevent the IOVA regions from being reserved. By the
> > > way, this is something that would also be needed for the audio use-ca=
se
> > > I mentioned before, because the physical memory at that address can
> > > still be used by an operating system.
> > >
> > > A more general solution would be to draw a bit from Dmitry's proposal
> > > and introduce a new top-level "iov-reserved-memory" node. This could =
be
> > > modelled on the existing reserved-memory node, except that the physic=
al
> > > memory pages for regions represented by child nodes would not be mark=
ed
> > > as reserved. Only the IOVA range described by the region would be
> > > reserved subsequently by the IOMMU framework and/or IOMMU driver.
> > >
> > > The simplest case where we just want to reserve some IOVA region coul=
d
> > > then be done like this:
> > >
> > >         iov-reserved-memory {
> > >                 /*
> > >                  * Probably safest to default to <2>, <2> here given
> > >                  * that most IOMMUs support either > 32 bits of IAS
> > >                  * or OAS.
> > >                  */
> > >                 #address-cells =3D <2>;
> > >                 #size-cells =3D <2>;
> > >
> > >                 firmware: firmware@80000000 {
> > >                         reg =3D <0 0x80000000 0 0x01000000>;
> > >                 };
> > >         };
> > >
> > >         audio@30000000 {
> > >                 ...
> > >                 iov-memory-regions =3D <&firmware>;
> > >                 ...
> > >         };
> > >
> > > Mappings could be represented by an IOV reserved region taking a
> > > reference to the reserved-region that they map:
> > >
> > >         reserved-memory {
> > >                 #address-cells =3D <2>;
> > >                 #size-cells =3D <2>;
> > >
> > >                 /* 16 MiB of framebuffer at top-of-memory */
> > >                 framebuffer: framebuffer@1,ff000000 {
> > >                         reg =3D <0x1 0xff000000 0 0x01000000>;
> > >                         no-map;
> > >                 };
> > >         };
> > >
> > >         iov-reserved-memory {
> > >                 /* IOMMU supports only 32-bit output address space */
> > >                 #address-cells =3D <1>;
> > >                 #size-cells =3D <1>;
> > >
> > >                 /* 16 MiB of framebuffer mapped to top of IOVA */
> > >                 fb: fb@ff000000 {
> > >                         reg =3D <0 0xff000000 0 0x01000000>;
> > >                         memory-region =3D <&framebuffer>;
> > >                 };
> > >         };
> > >
> > >         display@40000000 {
> > >                 ...
> > >                 /* optional? */
> > >                 memory-region =3D <&framebuffer>;
> > >                 iov-memory-regions =3D <&fb>;
> > >                 ...
> > >         };
> > >
> > > It's interesting how identity mapped regions now become a trivial
> > > special case of mappings. All that is needed is to make the reg prope=
rty
> > > of the IOV reserved region correspond to the reg property of the norm=
al
> > > reserved region. Alternatively, as a small optimization for lazy peop=
le
> > > like me, we could just allow these cases to omit the reg property and
> > > instead inherit it from the referenced reserved region.
> > >
> > > As the second example shows it might be convenient if memory-region
> > > could be derived from iov-memory-regions. This could be useful for ca=
ses
> > > where the driver wants to do something with the physical pages of the
> > > reserved region (such as mapping them and copying out the framebuffer
> > > data to another buffer so that the reserved memory can be recycled). =
If
> > > we have the IOV reserved region, we could provide an API to extract t=
he
> > > physical reserved region (if it exists). That way we could avoid
> > > referencing it twice in DT. Then again, there's something elegant abo=
ut
> > > the explicit second reference to. It indicates the intent that we may
> > > want to use the region for something other than just the IOV mapping.
> > >
> > > Anyway, this has been long enough. Let me know what you think. Alyssa=
,
> > > Sven, it'd be interesting to hear if you think this could work as a
> > > solution to the problem on M1.
> > >
> > > Rob, I think you might like this alternative because it basically get=
s
> > > rid of all the points in the original proposal that you were concerne=
d
> > > about. Let me know what you think.
> >
> > Couldn't we keep this all in /reserved-memory? Just add an iova
> > version of reg. Perhaps abuse 'assigned-address' for this purpose. The
> > issue I see would be handling reserved iova areas without a physical
> > area. That can be handled with just a iova and no reg. We already have
> > a no reg case.
>
> I had thought about that initially. One thing I'm worried about is that
> every child node in /reserved-memory will effectively cause the memory
> that it described to be reserved. But we don't want that for regions
> that are "virtual only" (i.e. IOMMU reservations).

By virtual only, you mean no physical mapping, just a region of
virtual space, right? For that we'd have no 'reg' and therefore no
(physical) reservation by the OS. It's similar to non-static regions.
You need a specific handler for them. We'd probably want a compatible
as well for these virtual reservations.

Are these being global in DT going to be a problem? Presumably we have
a virtual space per IOMMU. We'd know which IOMMU based on a device's
'iommus' and 'memory-region' properties, but within /reserved-memory
we wouldn't be able to distinguish overlapping addresses from separate
address spaces. Or we could have 2 different IOVAs for 1 physical
space. That could be solved with something like this:

iommu-addresses =3D <&iommu1 <address cells> <size cells>>;

Or the other way to do this is reuse 'iommus' property to define the
mapping of each address entry to iommu.

> Obviously we can fix that in Linux, but what about other operating
> systems? Currently "reg" is a required property for statically allocated
> regions (which all of these would be). Do you have an idea of how widely
> that's used? What about other OSes, or bootloaders, what if they
> encounter these nodes that don't have a "reg" property?

Without 'reg', there must be a compatible that the client understands
or the node should be ignored.

My suspicion is that /reserved-memory is abused for all sorts of
things downstream, but that's not really relevant here.

Rob
