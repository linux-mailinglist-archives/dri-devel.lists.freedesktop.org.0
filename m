Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 384DB402DE9
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F3F6E037;
	Tue,  7 Sep 2021 17:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391996E037
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 17:44:48 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id u16so15682138wrn.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Sep 2021 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PWz5iV9J8ekiMgXy8COKh8YUs4nrb0erxh7DL6TrJ+k=;
 b=XGFU9tfq+WYxza+j3iWOQlQk2xGtCJB7u3b1+kIlrnaT6t13ur8nmXkGr3iq3hPQWR
 8cOeTUx5Mox1BcGMmJSE5223+s2G+GYW2EYA2ZDiQ8zadqaNIzOH901NJRGb8FSnOPTB
 3eK2Y6FtoQs6sQndYBOzmaofGT0j/cp+kpng8chomZCOuWn0r3+XKZ2nEBdJB9axrxaY
 lePtjCL+0wr+f7/az4bxTol57yo7SW9v0pWGwD3EA5UcqbeJufmKf38MrQXW9/vSi+Xe
 qHD41iHomfkA8F8PqOGvzbNzBtlRrw92+TSDogUdFN2UkalDcA7vKNb8OVJdfimuZSfV
 CUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PWz5iV9J8ekiMgXy8COKh8YUs4nrb0erxh7DL6TrJ+k=;
 b=VlrNeZSnkT/gD568fM1rhJ3/4V+c+sAAtoZgDH11DjdTMAPp4W1Cr1DtvQTsDPNuLf
 pUH2BlRc8icx3UPepqiQCbR6aE9/1Sbo6VTO2k8JFQksOPoTeToKZ5CvW/uyOQBvQ6Is
 +QkJxOGVtnh7Nnw2oE4hAFuf4mgg1UnLXMSvX3gKzNiKv+akz3zdp93qr2GaVniEthoF
 22z5MMxtISpUgy6edLUnFwRRD4PscQ2plk/lw+ll5yEij+M8T3V2xCPwWQ6mKiWLqOij
 wXX7Vx77En5nHF6C/XoH2A8e6D1OF6e6eTJK6rQ1JTlmMrKds45fX+M4I9oik1XoGaxE
 pi7Q==
X-Gm-Message-State: AOAM5325SYQAstIu757vITQImtB0bfJbxUQGcms9qKF/4lrIVjy5ObYP
 8aUUNdfL1UdoO/UIOQV+r+g=
X-Google-Smtp-Source: ABdhPJxFY0n7BdwNMR7ySU1MPtjYVMGKh/6VEgxWjtasNfkUtlwCQJVaJyVdScA51ryqkgzH2quCQw==
X-Received: by 2002:a05:6000:18c2:: with SMTP id
 w2mr19911738wrq.282.1631036686234; 
 Tue, 07 Sep 2021 10:44:46 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id d7sm11519275wrs.39.2021.09.07.10.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 10:44:45 -0700 (PDT)
Date: Tue, 7 Sep 2021 19:44:44 +0200
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
Message-ID: <YTelDHx2REIIvV/N@orome.fritz.box>
References: <YLEgXyLBF8PEFNw2@orome.fritz.box>
 <YL+gHN4YZ4vt1vPk@orome.fritz.box>
 <YN4F/nH/9tDuWDnQ@orome.fritz.box>
 <7995b0ed-a277-ced1-b3d0-e0e7e02817a6@gmail.com>
 <YS+Ke4Ip0InHSnHR@orome.fritz.box>
 <CAL_Jsq+TQeb56UbrO1xKFSb1yo0d8U29DPynw3_jQ6gH6Peatw@mail.gmail.com>
 <YTIogpQDJjqJUTkG@orome.fritz.box>
 <CAL_JsqKG4+n_eNj+at3m7WuAbeJ1Kyi0mYD=8-MaVjfhzdPwkA@mail.gmail.com>
 <YTJA2xARFuNUMgMc@orome.fritz.box>
 <CAL_JsqJWt6ZELEpMi+tS6S6S4MYyMHysAC2ce_CfDQFqjfgnGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VTgdWOWRVdWRg0/y"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJWt6ZELEpMi+tS6S6S4MYyMHysAC2ce_CfDQFqjfgnGQ@mail.gmail.com>
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


--VTgdWOWRVdWRg0/y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 10:33:24AM -0500, Rob Herring wrote:
> On Fri, Sep 3, 2021 at 10:36 AM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Fri, Sep 03, 2021 at 09:36:33AM -0500, Rob Herring wrote:
> > > On Fri, Sep 3, 2021 at 8:52 AM Thierry Reding <thierry.reding@gmail.c=
om> wrote:
> > > >
> > > > On Fri, Sep 03, 2021 at 08:20:55AM -0500, Rob Herring wrote:
> > > > > On Wed, Sep 1, 2021 at 9:13 AM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> > > > > >
> > > > > > On Fri, Jul 02, 2021 at 05:16:25PM +0300, Dmitry Osipenko wrote:
> > > > > > > 01.07.2021 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
> > > > > > > > On Tue, Jun 08, 2021 at 06:51:40PM +0200, Thierry Reding wr=
ote:
> > > > > > > >> On Fri, May 28, 2021 at 06:54:55PM +0200, Thierry Reding w=
rote:
> > > > > > > >>> On Thu, May 20, 2021 at 05:03:06PM -0500, Rob Herring wro=
te:
> > > > > > > >>>> On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Reding=
 wrote:
> > > > > > > >>>>> From: Thierry Reding <treding@nvidia.com>
> > > > > > > >>>>>
> > > > > > > >>>>> Reserved memory region phandle references can be accomp=
anied by a
> > > > > > > >>>>> specifier that provides additional information about ho=
w that specific
> > > > > > > >>>>> reference should be treated.
> > > > > > > >>>>>
> > > > > > > >>>>> One use-case is to mark a memory region as needing an i=
dentity mapping
> > > > > > > >>>>> in the system's IOMMU for the device that references th=
e region. This is
> > > > > > > >>>>> needed for example when the bootloader has set up hardw=
are (such as a
> > > > > > > >>>>> display controller) to actively access a memory region =
(e.g. a boot
> > > > > > > >>>>> splash screen framebuffer) during boot. The operating s=
ystem can use the
> > > > > > > >>>>> identity mapping flag from the specifier to make sure a=
n IOMMU identity
> > > > > > > >>>>> mapping is set up for the framebuffer before IOMMU tran=
slations are
> > > > > > > >>>>> enabled for the display controller.
> > > > > > > >>>>>
> > > > > > > >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > > > > >>>>> ---
> > > > > > > >>>>>  .../reserved-memory/reserved-memory.txt       | 21 +++=
++++++++++++++++
> > > > > > > >>>>>  include/dt-bindings/reserved-memory.h         |  8 +++=
++++
> > > > > > > >>>>>  2 files changed, 29 insertions(+)
> > > > > > > >>>>>  create mode 100644 include/dt-bindings/reserved-memory=
=2Eh
> > > > > > > >>>>
> > > > > > > >>>> Sorry for being slow on this. I have 2 concerns.
> > > > > > > >>>>
> > > > > > > >>>> First, this creates an ABI issue. A DT with cells in 'me=
mory-region'
> > > > > > > >>>> will not be understood by an existing OS. I'm less conce=
rned about this
> > > > > > > >>>> if we address that with a stable fix. (Though I'm pretty=
 sure we've
> > > > > > > >>>> naively added #?-cells in the past ignoring this issue.)
> > > > > > > >>>
> > > > > > > >>> A while ago I had proposed adding memory-region*s* as an =
alternative
> > > > > > > >>> name for memory-region to make the naming more consistent=
 with other
> > > > > > > >>> types of properties (think clocks, resets, gpios, ...). I=
f we added
> > > > > > > >>> that, we could easily differentiate between the "legacy" =
cases where
> > > > > > > >>> no #memory-region-cells was allowed and the new cases whe=
re it was.
> > > > > > > >>>
> > > > > > > >>>> Second, it could be the bootloader setting up the reserv=
ed region. If a
> > > > > > > >>>> node already has 'memory-region', then adding more regio=
ns is more
> > > > > > > >>>> complicated compared to adding new properties. And defin=
ing what each
> > > > > > > >>>> memory-region entry is or how many in schemas is impossi=
ble.
> > > > > > > >>>
> > > > > > > >>> It's true that updating the property gets a bit complicat=
ed, but it's
> > > > > > > >>> not exactly rocket science. We really just need to splice=
 the array. I
> > > > > > > >>> have a working implemention for this in U-Boot.
> > > > > > > >>>
> > > > > > > >>> For what it's worth, we could run into the same issue wit=
h any new
> > > > > > > >>> property that we add. Even if we renamed this to iommu-me=
mory-region,
> > > > > > > >>> it's still possible that a bootloader may have to update =
this property
> > > > > > > >>> if it already exists (it could be hard-coded in DT, or it=
 could have
> > > > > > > >>> been added by some earlier bootloader or firmware).
> > > > > > > >>>
> > > > > > > >>>> Both could be addressed with a new property. Perhaps som=
ething like
> > > > > > > >>>> 'iommu-memory-region =3D <&phandle>;'. I think the 'iomm=
u' prefix is
> > > > > > > >>>> appropriate given this is entirely because of the IOMMU =
being in the
> > > > > > > >>>> mix. I might feel differently if we had other uses for c=
ells, but I
> > > > > > > >>>> don't really see it in this case.
> > > > > > > >>>
> > > > > > > >>> I'm afraid that down the road we'll end up with other cas=
es and then we
> > > > > > > >>> might proliferate a number of *-memory-region properties =
with varying
> > > > > > > >>> prefixes.
> > > > > > > >>>
> > > > > > > >>> I am aware of one other case where we might need somethin=
g like this: on
> > > > > > > >>> some Tegra SoCs we have audio processors that will access=
 memory buffers
> > > > > > > >>> using a DMA engine. These processors are booted from earl=
y firmware
> > > > > > > >>> using firmware from system memory. In order to avoid tras=
hing the
> > > > > > > >>> firmware, we need to reserve memory. We can do this using=
 reserved
> > > > > > > >>> memory nodes. However, the audio DMA engine also uses the=
 SMMU, so we
> > > > > > > >>> need to make sure that the firmware memory is marked as r=
eserved within
> > > > > > > >>> the SMMU. This is similar to the identity mapping case, b=
ut not exactly
> > > > > > > >>> the same. Instead of creating a 1:1 mapping, we just want=
 that IOVA
> > > > > > > >>> region to be reserved (i.e. IOMMU_RESV_RESERVED instead of
> > > > > > > >>> IOMMU_RESV_DIRECT{,_RELAXABLE}).
> > > > > > > >>>
> > > > > > > >>> That would also fall into the IOMMU domain, but we can't =
reuse the
> > > > > > > >>> iommu-memory-region property for that because then we don=
't have enough
> > > > > > > >>> information to decide which type of reservation we need.
> > > > > > > >>>
> > > > > > > >>> We could obviously make iommu-memory-region take a specif=
ier, but we
> > > > > > > >>> could just as well use memory-regions in that case since =
we have
> > > > > > > >>> something more generic anyway.
> > > > > > > >>>
> > > > > > > >>> With the #memory-region-cells proposal, we can easily ext=
end the cell in
> > > > > > > >>> the specifier with an additional MEMORY_REGION_IOMMU_RESE=
RVE flag to
> > > > > > > >>> take that other use case into account. If we than also ch=
ange to the new
> > > > > > > >>> memory-regions property name, we avoid the ABI issue (and=
 we gain a bit
> > > > > > > >>> of consistency while at it).
> > > > > > > >>
> > > > > > > >> Ping? Rob, do you want me to add this second use-case to t=
he patch
> > > > > > > >> series to make it more obvious that this isn't just a one-=
off thing? Or
> > > > > > > >> how do we proceed?
> > > > > > > >
> > > > > > > > Rob, given that additional use-case, do you want me to run =
with this
> > > > > > > > proposal and send out an updated series?
> > > > > > >
> > > > > > >
> > > > > > > What about variant with a "descriptor" properties that will d=
escribe
> > > > > > > each region:
> > > > > > >
> > > > > > > fb_desc: display-framebuffer-memory-descriptor {
> > > > > > >       needs-identity-mapping;
> > > > > > > }
> > > > > > >
> > > > > > > display@52400000 {
> > > > > > >       memory-region =3D <&fb ...>;
> > > > > > >       memory-region-descriptor =3D <&fb_desc ...>;
> > > > > > > };
> > > > > > >
> > > > > > > It could be a more flexible/extendible variant.
> > > > > >
> > > > > > This problem recently came up on #dri-devel again. Adding Alyss=
a and
> > > > > > Sven who are facing a similar challenge on their work on Apple =
M1 (if I
> > > > > > understood correctly). Also adding dri-devel for visibility sin=
ce this
> > > > > > is a very common problem for display in particular.
> > > > > >
> > > > > > On M1 the situation is slightly more complicated: the firmware =
will
> > > > > > allocate a couple of buffers (including the framebuffer) in hig=
h memory
> > > > > > (> 4 GiB) and use the IOMMU to map that into an IOVA region bel=
ow 4 GiB
> > > > > > so that the display hardware can access it. This makes it impos=
sible to
> > > > > > bypass the IOMMU like we do on other chips (in particular to wo=
rk around
> > > > > > the fault-by-default policy of the ARM SMMU driver). It also me=
ans that
> > > > > > in addition to the simple reserved regions I mentioned we need =
for audio
> > > > > > use-cases and identity mapping use-cases we need for display on=
 Tegra,
> > > > > > we now also need to be able to convey physical to IOVA mappings.
> > > > > >
> > > > > > Fitting the latter into the original proposal sounds difficult.=
 A quick
> > > > > > fix would've been to generate a mapping table in memory and pas=
s that to
> > > > > > the kernel using a reserved-memory node (similar to what's done=
 for
> > > > > > example on Tegra for the EMC frequency table on Tegra210) and m=
ark it as
> > > > > > such using a special flag. But that then involves two layers of=
 parsing,
> > > > > > which seems a bit suboptimal. Another way to shoehorn that into=
 the
> > > > > > original proposal would've been to add flags for physical and v=
irtual
> > > > > > address regions and use pairs to pass them using special flags.=
 Again,
> > > > > > this is a bit wonky because it needs these to be carefully pars=
ed and
> > > > > > matched up.
> > > > > >
> > > > > > Another downside is that we now have a situation where some of =
these
> > > > > > regions are no longer "reserved-memory regions" in the traditio=
nal
> > > > > > sense. This would require an additional flag in the reserved-me=
mory
> > > > > > region nodes to prevent the IOVA regions from being reserved. B=
y the
> > > > > > way, this is something that would also be needed for the audio =
use-case
> > > > > > I mentioned before, because the physical memory at that address=
 can
> > > > > > still be used by an operating system.
> > > > > >
> > > > > > A more general solution would be to draw a bit from Dmitry's pr=
oposal
> > > > > > and introduce a new top-level "iov-reserved-memory" node. This =
could be
> > > > > > modelled on the existing reserved-memory node, except that the =
physical
> > > > > > memory pages for regions represented by child nodes would not b=
e marked
> > > > > > as reserved. Only the IOVA range described by the region would =
be
> > > > > > reserved subsequently by the IOMMU framework and/or IOMMU drive=
r.
> > > > > >
> > > > > > The simplest case where we just want to reserve some IOVA regio=
n could
> > > > > > then be done like this:
> > > > > >
> > > > > >         iov-reserved-memory {
> > > > > >                 /*
> > > > > >                  * Probably safest to default to <2>, <2> here =
given
> > > > > >                  * that most IOMMUs support either > 32 bits of=
 IAS
> > > > > >                  * or OAS.
> > > > > >                  */
> > > > > >                 #address-cells =3D <2>;
> > > > > >                 #size-cells =3D <2>;
> > > > > >
> > > > > >                 firmware: firmware@80000000 {
> > > > > >                         reg =3D <0 0x80000000 0 0x01000000>;
> > > > > >                 };
> > > > > >         };
> > > > > >
> > > > > >         audio@30000000 {
> > > > > >                 ...
> > > > > >                 iov-memory-regions =3D <&firmware>;
> > > > > >                 ...
> > > > > >         };
> > > > > >
> > > > > > Mappings could be represented by an IOV reserved region taking a
> > > > > > reference to the reserved-region that they map:
> > > > > >
> > > > > >         reserved-memory {
> > > > > >                 #address-cells =3D <2>;
> > > > > >                 #size-cells =3D <2>;
> > > > > >
> > > > > >                 /* 16 MiB of framebuffer at top-of-memory */
> > > > > >                 framebuffer: framebuffer@1,ff000000 {
> > > > > >                         reg =3D <0x1 0xff000000 0 0x01000000>;
> > > > > >                         no-map;
> > > > > >                 };
> > > > > >         };
> > > > > >
> > > > > >         iov-reserved-memory {
> > > > > >                 /* IOMMU supports only 32-bit output address sp=
ace */
> > > > > >                 #address-cells =3D <1>;
> > > > > >                 #size-cells =3D <1>;
> > > > > >
> > > > > >                 /* 16 MiB of framebuffer mapped to top of IOVA =
*/
> > > > > >                 fb: fb@ff000000 {
> > > > > >                         reg =3D <0 0xff000000 0 0x01000000>;
> > > > > >                         memory-region =3D <&framebuffer>;
> > > > > >                 };
> > > > > >         };
> > > > > >
> > > > > >         display@40000000 {
> > > > > >                 ...
> > > > > >                 /* optional? */
> > > > > >                 memory-region =3D <&framebuffer>;
> > > > > >                 iov-memory-regions =3D <&fb>;
> > > > > >                 ...
> > > > > >         };
> > > > > >
> > > > > > It's interesting how identity mapped regions now become a trivi=
al
> > > > > > special case of mappings. All that is needed is to make the reg=
 property
> > > > > > of the IOV reserved region correspond to the reg property of th=
e normal
> > > > > > reserved region. Alternatively, as a small optimization for laz=
y people
> > > > > > like me, we could just allow these cases to omit the reg proper=
ty and
> > > > > > instead inherit it from the referenced reserved region.
> > > > > >
> > > > > > As the second example shows it might be convenient if memory-re=
gion
> > > > > > could be derived from iov-memory-regions. This could be useful =
for cases
> > > > > > where the driver wants to do something with the physical pages =
of the
> > > > > > reserved region (such as mapping them and copying out the frame=
buffer
> > > > > > data to another buffer so that the reserved memory can be recyc=
led). If
> > > > > > we have the IOV reserved region, we could provide an API to ext=
ract the
> > > > > > physical reserved region (if it exists). That way we could avoid
> > > > > > referencing it twice in DT. Then again, there's something elega=
nt about
> > > > > > the explicit second reference to. It indicates the intent that =
we may
> > > > > > want to use the region for something other than just the IOV ma=
pping.
> > > > > >
> > > > > > Anyway, this has been long enough. Let me know what you think. =
Alyssa,
> > > > > > Sven, it'd be interesting to hear if you think this could work =
as a
> > > > > > solution to the problem on M1.
> > > > > >
> > > > > > Rob, I think you might like this alternative because it basical=
ly gets
> > > > > > rid of all the points in the original proposal that you were co=
ncerned
> > > > > > about. Let me know what you think.
> > > > >
> > > > > Couldn't we keep this all in /reserved-memory? Just add an iova
> > > > > version of reg. Perhaps abuse 'assigned-address' for this purpose=
=2E The
> > > > > issue I see would be handling reserved iova areas without a physi=
cal
> > > > > area. That can be handled with just a iova and no reg. We already=
 have
> > > > > a no reg case.
> > > >
> > > > I had thought about that initially. One thing I'm worried about is =
that
> > > > every child node in /reserved-memory will effectively cause the mem=
ory
> > > > that it described to be reserved. But we don't want that for regions
> > > > that are "virtual only" (i.e. IOMMU reservations).
> > >
> > > By virtual only, you mean no physical mapping, just a region of
> > > virtual space, right? For that we'd have no 'reg' and therefore no
> > > (physical) reservation by the OS. It's similar to non-static regions.
> > > You need a specific handler for them. We'd probably want a compatible
> > > as well for these virtual reservations.
> >
> > Yeah, these would be purely used for reserving regions in the IOVA so
> > that they won't be used by the IOVA allocator. Typically these would be
> > used for cases where those addresses have some special meaning.
> >
> > Do we want something like:
> >
> >         compatible =3D "iommu-reserved";
> >
> > for these? Or would that need to be:
> >
> >         compatible =3D "linux,iommu-reserved";
> >
> > ? There seems to be a mix of vendor-prefix vs. non-vendor-prefix
> > compatible strings in the reserved-memory DT bindings directory.
>=20
> I would not use 'linux,' here.
>=20
> >
> > On the other hand, do we actually need the compatible string? Because we
> > don't really want to associate much extra information with this like we
> > do for example with "shared-dma-pool". The logic to handle this would
> > all be within the IOMMU framework. All we really need is for the
> > standard reservation code to skip nodes that don't have a reg property
> > so we don't reserve memory for "virtual-only" allocations.
>=20
> It doesn't hurt to have one and I can imagine we might want to iterate
> over all the nodes. It's slightly easier and more common to iterate
> over compatible nodes rather than nodes with some property.
>=20
> > > Are these being global in DT going to be a problem? Presumably we have
> > > a virtual space per IOMMU. We'd know which IOMMU based on a device's
> > > 'iommus' and 'memory-region' properties, but within /reserved-memory
> > > we wouldn't be able to distinguish overlapping addresses from separate
> > > address spaces. Or we could have 2 different IOVAs for 1 physical
> > > space. That could be solved with something like this:
> > >
> > > iommu-addresses =3D <&iommu1 <address cells> <size cells>>;
> >
> > The only case that would be problematic would be if we have overlapping
> > physical regions, because that will probably trip up the standard code.
> >
> > But this could also be worked around by looking at iommu-addresses. For
> > example, if we had something like this:
> >
> >         reserved-memory {
> >                 fb_dc0: fb@80000000 {
> >                         reg =3D <0x80000000 0x01000000>;
> >                         iommu-addresses =3D <0xa0000000 0x01000000>;
> >                 };
> >
> >                 fb_dc1: fb@80000000 {
>=20
> You can't have 2 nodes with the same name (actually, you can, they
> just get merged together). Different names with the same unit-address
> is a dtc warning. I'd really like to make that a full blown
> overlapping region check.

Right... so this would be a lot easier to deal with using that earlier
proposal where the IOMMU regions were a separate thing and referencing
the reserved-memory nodes. In those cases we could just have the
physical reservation for the framebuffer once (so we don't get any
duplicates or overlaps) and then have each IOVA reservation reference
that to create the mapping.

>=20
> >                         reg =3D <0x80000000 0x01000000>;
> >                         iommu-addresses =3D <0xb0000000 0x01000000>;
> >                 };
> >         };
> >
> > We could make the code identify that this is for the same physical
> > reservation (maybe make it so that reg needs to match exactly for this
> > to be recognized) but with different virtual allocations.
> >
> > On a side-note: do we really need to repeat the size? I'd think if we
> > want mappings then we'd likely want them for the whole reservation.
>=20
> Humm, I suppose not, but dropping it paints us into a corner if we
> come up with wanting a different size later. You could have a carveout
> for double/triple buffering your framebuffer, but the bootloader
> framebuffer is only single buffered. So would you want actual size?

Perhaps this needs to be a bit more verbose then. If we want the ability
to create a mapping for only a partial reservation, I could imagine we
may as well want one that doesn't start at the beginning. So perhaps an
ever better solution would be to have a complete mapping, something that
works similar to "ranges" perhaps, like so:

	fb@80000000 {
		reg =3D <0x80000000 0x01000000>;
		iommu-ranges =3D <0x80000000 0x01000000 0x80000000>;
	};

That would be for a full identity mapping, but we could also have
something along the lines of this:

	fb@80000000 {
		reg =3D <0x80000000 0x01000000>;
		iommu-ranges =3D <0x80100000 0x00100000 0xa0000000>;
	};

So that would only map a 1 MiB chunk at offset 1 MiB (of the physical
reservation) to I/O virtual address 0xa0000000.

> > I'd like to keep references to IOMMUs out of this because they would be
> > duplicated. We will only use these nodes if they are referenced by a
> > device node that also has an iommus property. Also, the IOMMU reference
> > itself isn't enough. We'd also need to support the complete specifier
> > because you can have things like SIDs in there to specify the exact
> > address space that a device uses.
> >
> > Also, for some of these they may be reused independently of the IOMMU
> > address space. For example the Tegra framebuffer identity mapping can
> > be used by either of the 2-4 display controllers, each with (at least
> > potentially) their own address space. But we don't want to have to
> > describe the identity mapping separately for each display controller.
>=20
> Okay, but I'd rather have to duplicate things in your case than not be
> able to express some other case.

The earlier "separate iov-reserved-memory" proposal would be a good
compromise here. It'd allow us to duplicate only the necessary bits
(i.e. the IOVA mappings) but keep the common bits simple. And even
the IOVA mappings could be shared for cases like identity mappings.
See below for more on that.

> > Another thing to consider is that these nodes will often be added by
> > firmware (e.g. firmware will allocate the framebuffer and set up the
> > corresponding reserved memory region in DT). Wiring up references like
> > this would get very complicated very quickly.
>=20
> Yes.
>=20
> The using 'iommus' property option below can be optional and doesn't
> have to be defined/supported now. Just trying to think ahead and not
> be stuck with something that can't be extended.

One other benefit of the separate iov-reserved-memory node would be that
the iommus property could be simplified. If we have a physical
reservation that needs to be accessed by multiple different display
controllers, we'd end up with something fairly complex, such as this:

	fb: fb@80000000 {
		reg =3D <0x80000000 0x01000000>;
		iommus =3D <&dc0_iommu 0xa0000000 0x01000000>,
			 <&dc1_iommu 0xb0000000 0x01000000>,
			 <&dc2_iommu 0xc0000000 0x01000000>;
	};

This would get even worse if we want to support partial mappings. Also,
it'd become quite complicated to correlate this with the memory-region
references:

	dc0: dc@40000000 {
		...
		memory-region =3D <&fb>;
		iommus =3D <&dc0_iommu>;
		...
	};

So now you have to go match up the phandle (and potentially specifier)
in the iommus property of the disp0 node with an entry in the fb node's
iommus property. That's all fairly complicated stuff.

With separate iov-reserved-memory, this would be a bit more verbose, but
each individual node would be simpler:

	reserved-memory {
		fb: fb@80000000 {
			reg =3D <0x80000000 0x01000000>;
		};
	};

	iov-reserved-memory {
		fb0: fb@80000000 {
			/* identity mapping, "reg" optional? */
			reg =3D <0x80000000 0x01000000>;
			memory-region =3D <&fb>;
		};

		fb1: fb@90000000 {
			/* but doesn't have to be */
			reg =3D <0x90000000 0x01000000>;
			memory-region =3D <&fb>;
		};

		fb2: fb@a0000000 {
			/* can be partial, too */
			ranges =3D <0x80000000 0x00800000 0xa0000000>;
			memory-region =3D <&fb>;
		};
	}

	dc0: dc@40000000 {
		iov-memory-regions =3D <&fb0>;
		/* optional? */
		memory-region =3D <&fb>;
		iommus =3D <&dc0_iommu>;
	};

Alternatively, if we want to support partial mappings, we could replace
those reg properties by ranges properties that I showed earlier. We may
even want to support both. Use "reg" for virtual-only reservations and
identity mappings, or "simple partial mappings" (that map a sub-region
starting from the beginning). Identity mappings could still be
simplified by just omitting the "reg" property. For more complicated
mappings, such as the ones on M1, the "ranges" property could be used.

Note how this looks a bit boilerplate-y, but it's actually really quite
simple to understand, even for humans, I think.

Also, the phandles in this are comparatively easy to wire up because
they can all be generated in a hierarchical way: generate physical
reservation and store phandle, then generate I/O virtual reservation
to reference that phandle and store the new phandle as well. Finally,
wire this up to the display controller (using either the IOV phandle or
both).

Granted, this requires the addition of a new top-level node, but given
how expressive this becomes, I think it might be worth a second
consideration.

Thierry

--VTgdWOWRVdWRg0/y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmE3pQkACgkQ3SOs138+
s6G4oRAAvKnM70kYdCZdv39v89xoh8qeVmyQ1gNPDFl5TEdrR+2+kqJYW9XaGIQd
59P+ZCArRgfmwU1zKVEA9UVdV/uYW/ImZtwzARUgGsFIBbFIxgUZQpwY3dsqnA32
IZP6IfhhS0enEEGNpHBcVda2/ZvM24q1t89sxKujTy0Zhtm/kBLf8D1x5UDJVHYn
9wBDq3cvoI8k2xJJHdKlbHdNXdARD+o7SwcxoQqg9X/tAoOjzLzeBqaOyRhzoZU7
hT+/b1SPGwtS7k7UZlqKUyze77AQ3sTmLnnbsaxSsaAPRFdtEhqtzSjWlZ1CUKJc
tG/RnvYlkWeBmvWmYPiCOWegPv0ffILo1jSPhXwXwrF0lVGfn4qJUcOj4KF0U99q
P+Rv34BQMGiTK3MJDKusPNZ8a4Ic9lKZqYN6HbklVGMZTpuQZ6WRzY1a7hbzKBhD
tFsCqGl5hpkIIU9HGIs1tTkDNMrGFsMqh4IfWhouTeBJJGozBRJfOcH15DqY0YGt
Yg1IgHU8y3JOMwdC03yWYNy1Ti1+xahGzJpk7s1UzeMp8Zdr/0NMBR1BI/z0Kj9N
FvkXdUoq9zu8nHYG1O0Vj9XBZYsScgux/Uz7VmDetT6RTDhxj6ktB5T3i/nNA9K2
kc2Q/9BQhPeaxIob7H4gqOxlHOnsfTfIy4hdbIRzAXGKNePvuuA=
=/Ar6
-----END PGP SIGNATURE-----

--VTgdWOWRVdWRg0/y--
