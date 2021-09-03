Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC14000C6
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 15:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353D36E89A;
	Fri,  3 Sep 2021 13:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7086E89A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 13:52:06 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso3839748wms.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 06:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EnQFsjLHfRSbkFFrk/jmLUJeQadp1wRiJmOtkE4t/kk=;
 b=jkJAo5lQn9a4GNUXMSWIELWuxBU/ABG/ha385tNsuDrOarAJTeFYheIY0edwCb8ssK
 mf9bgqVdEfeNG4PlPKuM5FgeiUTtNhKfyWd/Zj7hQP/Vh9sW27zOphWWnWJ1FoilyByW
 8yTnxqYTF2bBDCuW3NQ3W99uBvCHfd7gchnLzeUAtKvN44YPPUt9rZGZwTjv+382Wl2K
 U93ldIidrn3NSnag5e4u0J5sA+q8/ukx9QZE5pTxFcSgEkWLhUwCacsJHbt1utB9r/HS
 oYWkkKcEyzuwFDxWbv1IdqGQ0ga2VbQgL/jOZ1dntkcfi1zNH8s6fhnWDYWz45HJ5Tb+
 38ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EnQFsjLHfRSbkFFrk/jmLUJeQadp1wRiJmOtkE4t/kk=;
 b=P2O+wnNj7w9yuO4FTmnQGvagk2Ql8N5W4UHMzKHguig1Jf0Tlv5MOqvPbHyIu4t2Z+
 JOh3npWV+yAUy4V1nvxQitSBsOAJCQLJWPu/ILhKID/dYtbKzVvtncknFwD9VwjfT/OP
 JMjnFe1/6uWl/7lWLgZcnhPJ92Nx2Nu6ISP2jiduMjbUG3dl0kX4dT+gkh+u0x91nKRV
 CCSJEJw3W1weyh2AWdIauLCQbsWR8yzLIPeSpFBo/AjemK6h2oQclZ0MP0zHk0Es/q8T
 9luQWWoxJGmtW8QfvrTrF+bJIn/xVy8b8OwpFWbvV9F/Ecn5bM/GiW026dYwPzR9R25z
 xiGA==
X-Gm-Message-State: AOAM530nGx616EPm60sR3YOr7eVIAqwwbtZthQ5ttAfJgprJc+WpmpQ/
 Me7CkWH/jbBlZqk0lWSnyd0=
X-Google-Smtp-Source: ABdhPJxhGux8I7mdFQiNJlgsW+oeFVK4fltNYu6AqoWwxxRLz/5LzJTgeng5pVpgiLZ0p/KuDWA0+A==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr512255wmh.114.1630677124641; 
 Fri, 03 Sep 2021 06:52:04 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id r129sm4219932wmr.7.2021.09.03.06.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:52:03 -0700 (PDT)
Date: Fri, 3 Sep 2021 15:52:02 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sven Peter <sven@svenpeter.dev>, Dmitry Osipenko <digetx@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory
 region specifier
Message-ID: <YTIogpQDJjqJUTkG@orome.fritz.box>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-2-thierry.reding@gmail.com>
 <20210520220306.GA1976116@robh.at.kernel.org>
 <YLEgXyLBF8PEFNw2@orome.fritz.box>
 <YL+gHN4YZ4vt1vPk@orome.fritz.box>
 <YN4F/nH/9tDuWDnQ@orome.fritz.box>
 <7995b0ed-a277-ced1-b3d0-e0e7e02817a6@gmail.com>
 <YS+Ke4Ip0InHSnHR@orome.fritz.box>
 <CAL_Jsq+TQeb56UbrO1xKFSb1yo0d8U29DPynw3_jQ6gH6Peatw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9tMQdE4aESM5mGnn"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+TQeb56UbrO1xKFSb1yo0d8U29DPynw3_jQ6gH6Peatw@mail.gmail.com>
User-Agent: Mutt/2.1.2 (9a92dba0) (2021-08-24)
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


--9tMQdE4aESM5mGnn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 03, 2021 at 08:20:55AM -0500, Rob Herring wrote:
> On Wed, Sep 1, 2021 at 9:13 AM Thierry Reding <thierry.reding@gmail.com> =
wrote:
> >
> > On Fri, Jul 02, 2021 at 05:16:25PM +0300, Dmitry Osipenko wrote:
> > > 01.07.2021 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > > On Tue, Jun 08, 2021 at 06:51:40PM +0200, Thierry Reding wrote:
> > > >> On Fri, May 28, 2021 at 06:54:55PM +0200, Thierry Reding wrote:
> > > >>> On Thu, May 20, 2021 at 05:03:06PM -0500, Rob Herring wrote:
> > > >>>> On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Reding wrote:
> > > >>>>> From: Thierry Reding <treding@nvidia.com>
> > > >>>>>
> > > >>>>> Reserved memory region phandle references can be accompanied by=
 a
> > > >>>>> specifier that provides additional information about how that s=
pecific
> > > >>>>> reference should be treated.
> > > >>>>>
> > > >>>>> One use-case is to mark a memory region as needing an identity =
mapping
> > > >>>>> in the system's IOMMU for the device that references the region=
=2E This is
> > > >>>>> needed for example when the bootloader has set up hardware (suc=
h as a
> > > >>>>> display controller) to actively access a memory region (e.g. a =
boot
> > > >>>>> splash screen framebuffer) during boot. The operating system ca=
n use the
> > > >>>>> identity mapping flag from the specifier to make sure an IOMMU =
identity
> > > >>>>> mapping is set up for the framebuffer before IOMMU translations=
 are
> > > >>>>> enabled for the display controller.
> > > >>>>>
> > > >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > >>>>> ---
> > > >>>>>  .../reserved-memory/reserved-memory.txt       | 21 +++++++++++=
++++++++
> > > >>>>>  include/dt-bindings/reserved-memory.h         |  8 +++++++
> > > >>>>>  2 files changed, 29 insertions(+)
> > > >>>>>  create mode 100644 include/dt-bindings/reserved-memory.h
> > > >>>>
> > > >>>> Sorry for being slow on this. I have 2 concerns.
> > > >>>>
> > > >>>> First, this creates an ABI issue. A DT with cells in 'memory-reg=
ion'
> > > >>>> will not be understood by an existing OS. I'm less concerned abo=
ut this
> > > >>>> if we address that with a stable fix. (Though I'm pretty sure we=
've
> > > >>>> naively added #?-cells in the past ignoring this issue.)
> > > >>>
> > > >>> A while ago I had proposed adding memory-region*s* as an alternat=
ive
> > > >>> name for memory-region to make the naming more consistent with ot=
her
> > > >>> types of properties (think clocks, resets, gpios, ...). If we add=
ed
> > > >>> that, we could easily differentiate between the "legacy" cases wh=
ere
> > > >>> no #memory-region-cells was allowed and the new cases where it wa=
s.
> > > >>>
> > > >>>> Second, it could be the bootloader setting up the reserved regio=
n. If a
> > > >>>> node already has 'memory-region', then adding more regions is mo=
re
> > > >>>> complicated compared to adding new properties. And defining what=
 each
> > > >>>> memory-region entry is or how many in schemas is impossible.
> > > >>>
> > > >>> It's true that updating the property gets a bit complicated, but =
it's
> > > >>> not exactly rocket science. We really just need to splice the arr=
ay. I
> > > >>> have a working implemention for this in U-Boot.
> > > >>>
> > > >>> For what it's worth, we could run into the same issue with any new
> > > >>> property that we add. Even if we renamed this to iommu-memory-reg=
ion,
> > > >>> it's still possible that a bootloader may have to update this pro=
perty
> > > >>> if it already exists (it could be hard-coded in DT, or it could h=
ave
> > > >>> been added by some earlier bootloader or firmware).
> > > >>>
> > > >>>> Both could be addressed with a new property. Perhaps something l=
ike
> > > >>>> 'iommu-memory-region =3D <&phandle>;'. I think the 'iommu' prefi=
x is
> > > >>>> appropriate given this is entirely because of the IOMMU being in=
 the
> > > >>>> mix. I might feel differently if we had other uses for cells, bu=
t I
> > > >>>> don't really see it in this case.
> > > >>>
> > > >>> I'm afraid that down the road we'll end up with other cases and t=
hen we
> > > >>> might proliferate a number of *-memory-region properties with var=
ying
> > > >>> prefixes.
> > > >>>
> > > >>> I am aware of one other case where we might need something like t=
his: on
> > > >>> some Tegra SoCs we have audio processors that will access memory =
buffers
> > > >>> using a DMA engine. These processors are booted from early firmwa=
re
> > > >>> using firmware from system memory. In order to avoid trashing the
> > > >>> firmware, we need to reserve memory. We can do this using reserved
> > > >>> memory nodes. However, the audio DMA engine also uses the SMMU, s=
o we
> > > >>> need to make sure that the firmware memory is marked as reserved =
within
> > > >>> the SMMU. This is similar to the identity mapping case, but not e=
xactly
> > > >>> the same. Instead of creating a 1:1 mapping, we just want that IO=
VA
> > > >>> region to be reserved (i.e. IOMMU_RESV_RESERVED instead of
> > > >>> IOMMU_RESV_DIRECT{,_RELAXABLE}).
> > > >>>
> > > >>> That would also fall into the IOMMU domain, but we can't reuse the
> > > >>> iommu-memory-region property for that because then we don't have =
enough
> > > >>> information to decide which type of reservation we need.
> > > >>>
> > > >>> We could obviously make iommu-memory-region take a specifier, but=
 we
> > > >>> could just as well use memory-regions in that case since we have
> > > >>> something more generic anyway.
> > > >>>
> > > >>> With the #memory-region-cells proposal, we can easily extend the =
cell in
> > > >>> the specifier with an additional MEMORY_REGION_IOMMU_RESERVE flag=
 to
> > > >>> take that other use case into account. If we than also change to =
the new
> > > >>> memory-regions property name, we avoid the ABI issue (and we gain=
 a bit
> > > >>> of consistency while at it).
> > > >>
> > > >> Ping? Rob, do you want me to add this second use-case to the patch
> > > >> series to make it more obvious that this isn't just a one-off thin=
g? Or
> > > >> how do we proceed?
> > > >
> > > > Rob, given that additional use-case, do you want me to run with this
> > > > proposal and send out an updated series?
> > >
> > >
> > > What about variant with a "descriptor" properties that will describe
> > > each region:
> > >
> > > fb_desc: display-framebuffer-memory-descriptor {
> > >       needs-identity-mapping;
> > > }
> > >
> > > display@52400000 {
> > >       memory-region =3D <&fb ...>;
> > >       memory-region-descriptor =3D <&fb_desc ...>;
> > > };
> > >
> > > It could be a more flexible/extendible variant.
> >
> > This problem recently came up on #dri-devel again. Adding Alyssa and
> > Sven who are facing a similar challenge on their work on Apple M1 (if I
> > understood correctly). Also adding dri-devel for visibility since this
> > is a very common problem for display in particular.
> >
> > On M1 the situation is slightly more complicated: the firmware will
> > allocate a couple of buffers (including the framebuffer) in high memory
> > (> 4 GiB) and use the IOMMU to map that into an IOVA region below 4 GiB
> > so that the display hardware can access it. This makes it impossible to
> > bypass the IOMMU like we do on other chips (in particular to work around
> > the fault-by-default policy of the ARM SMMU driver). It also means that
> > in addition to the simple reserved regions I mentioned we need for audio
> > use-cases and identity mapping use-cases we need for display on Tegra,
> > we now also need to be able to convey physical to IOVA mappings.
> >
> > Fitting the latter into the original proposal sounds difficult. A quick
> > fix would've been to generate a mapping table in memory and pass that to
> > the kernel using a reserved-memory node (similar to what's done for
> > example on Tegra for the EMC frequency table on Tegra210) and mark it as
> > such using a special flag. But that then involves two layers of parsing,
> > which seems a bit suboptimal. Another way to shoehorn that into the
> > original proposal would've been to add flags for physical and virtual
> > address regions and use pairs to pass them using special flags. Again,
> > this is a bit wonky because it needs these to be carefully parsed and
> > matched up.
> >
> > Another downside is that we now have a situation where some of these
> > regions are no longer "reserved-memory regions" in the traditional
> > sense. This would require an additional flag in the reserved-memory
> > region nodes to prevent the IOVA regions from being reserved. By the
> > way, this is something that would also be needed for the audio use-case
> > I mentioned before, because the physical memory at that address can
> > still be used by an operating system.
> >
> > A more general solution would be to draw a bit from Dmitry's proposal
> > and introduce a new top-level "iov-reserved-memory" node. This could be
> > modelled on the existing reserved-memory node, except that the physical
> > memory pages for regions represented by child nodes would not be marked
> > as reserved. Only the IOVA range described by the region would be
> > reserved subsequently by the IOMMU framework and/or IOMMU driver.
> >
> > The simplest case where we just want to reserve some IOVA region could
> > then be done like this:
> >
> >         iov-reserved-memory {
> >                 /*
> >                  * Probably safest to default to <2>, <2> here given
> >                  * that most IOMMUs support either > 32 bits of IAS
> >                  * or OAS.
> >                  */
> >                 #address-cells =3D <2>;
> >                 #size-cells =3D <2>;
> >
> >                 firmware: firmware@80000000 {
> >                         reg =3D <0 0x80000000 0 0x01000000>;
> >                 };
> >         };
> >
> >         audio@30000000 {
> >                 ...
> >                 iov-memory-regions =3D <&firmware>;
> >                 ...
> >         };
> >
> > Mappings could be represented by an IOV reserved region taking a
> > reference to the reserved-region that they map:
> >
> >         reserved-memory {
> >                 #address-cells =3D <2>;
> >                 #size-cells =3D <2>;
> >
> >                 /* 16 MiB of framebuffer at top-of-memory */
> >                 framebuffer: framebuffer@1,ff000000 {
> >                         reg =3D <0x1 0xff000000 0 0x01000000>;
> >                         no-map;
> >                 };
> >         };
> >
> >         iov-reserved-memory {
> >                 /* IOMMU supports only 32-bit output address space */
> >                 #address-cells =3D <1>;
> >                 #size-cells =3D <1>;
> >
> >                 /* 16 MiB of framebuffer mapped to top of IOVA */
> >                 fb: fb@ff000000 {
> >                         reg =3D <0 0xff000000 0 0x01000000>;
> >                         memory-region =3D <&framebuffer>;
> >                 };
> >         };
> >
> >         display@40000000 {
> >                 ...
> >                 /* optional? */
> >                 memory-region =3D <&framebuffer>;
> >                 iov-memory-regions =3D <&fb>;
> >                 ...
> >         };
> >
> > It's interesting how identity mapped regions now become a trivial
> > special case of mappings. All that is needed is to make the reg property
> > of the IOV reserved region correspond to the reg property of the normal
> > reserved region. Alternatively, as a small optimization for lazy people
> > like me, we could just allow these cases to omit the reg property and
> > instead inherit it from the referenced reserved region.
> >
> > As the second example shows it might be convenient if memory-region
> > could be derived from iov-memory-regions. This could be useful for cases
> > where the driver wants to do something with the physical pages of the
> > reserved region (such as mapping them and copying out the framebuffer
> > data to another buffer so that the reserved memory can be recycled). If
> > we have the IOV reserved region, we could provide an API to extract the
> > physical reserved region (if it exists). That way we could avoid
> > referencing it twice in DT. Then again, there's something elegant about
> > the explicit second reference to. It indicates the intent that we may
> > want to use the region for something other than just the IOV mapping.
> >
> > Anyway, this has been long enough. Let me know what you think. Alyssa,
> > Sven, it'd be interesting to hear if you think this could work as a
> > solution to the problem on M1.
> >
> > Rob, I think you might like this alternative because it basically gets
> > rid of all the points in the original proposal that you were concerned
> > about. Let me know what you think.
>=20
> Couldn't we keep this all in /reserved-memory? Just add an iova
> version of reg. Perhaps abuse 'assigned-address' for this purpose. The
> issue I see would be handling reserved iova areas without a physical
> area. That can be handled with just a iova and no reg. We already have
> a no reg case.

I had thought about that initially. One thing I'm worried about is that
every child node in /reserved-memory will effectively cause the memory
that it described to be reserved. But we don't want that for regions
that are "virtual only" (i.e. IOMMU reservations).

Obviously we can fix that in Linux, but what about other operating
systems? Currently "reg" is a required property for statically allocated
regions (which all of these would be). Do you have an idea of how widely
that's used? What about other OSes, or bootloaders, what if they
encounter these nodes that don't have a "reg" property?

If you don't see any concerns with that, I think we could make it work.
I don't have any strong opinions about the naming for the IOVA regions.
With a tiny stretch of the imagination, "assigned-addresses" even makes
sense in this context.

Thierry

--9tMQdE4aESM5mGnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEyKH8ACgkQ3SOs138+
s6FqTBAAlKhmCG618Z1w4bfeFMC3a9Wyv09PXC/Tgl2xY+tEX4I1xKp8y5qzo7Ub
4AJDq9kDMt5uFBbUhOUA2W+eRVgKdfVRHkw2eBhO2+bvLv2dhNefJOT93usqTc4a
7FforsOLyXWWOvwD8garSjdEOU3np/2v4m4fH/htkLu7N5fkxqsUGfYIUW0rSzCN
6mchtWbK2LoCOr2p3SS2L2YK7QuG/vrzEhfrdwrdyIFhFLPhEmGTw6Ci2m2sRrA6
YHhy2EC7mC3ld1BvX+2wsA1GrGt+3NCslN6VYZO9II8dw30gPPs1zULBn2I9Nmcw
PY9RmKj4vs3wcqp5uVK5IrVlyVNXySlDV/D+QbbRz3g4mJN4spvgBonel74dY5Nb
+1NuRIIEvLZsrmDPVXoQ5SQ4w0M8+n6nWpLhAUz+di6zeOXtn26hf014tdyUVdH0
LaCuug2xAPZquskpRroCrNQ3TDAWio9EvsQiq2V4H+PAeKZjTR/UR0yioiMX5WjG
h4xmPO9ktMWPTCv8Y7+q21xuPiCWW40S4sSrgjVsR+V4A+4puApQpNeGZjpM/poP
0SKqhXhvVh8zW+drydM0Cldw1ggehTeEqcqhFkQcjrhTDz16WaMmvnJTQujvdLbr
nAGKeU9Z2K1CexpBddTEsv9E0q7MCzWcPmcv3SFkrbkpJGyEVPA=
=NFNS
-----END PGP SIGNATURE-----

--9tMQdE4aESM5mGnn--
