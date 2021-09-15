Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B14F40C81F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 17:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A7A6E95B;
	Wed, 15 Sep 2021 15:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0DC6E95B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 15:19:44 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id y132so2494797wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 08:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8yTaR2n53yjC9TgHeWMOfMHmYa4Nj7ujRcHol/3lA3g=;
 b=esDrQOb2nkUOerh/8AlvkeH0CfWvwlPAONRc5mncEq4+A98lL26BfAIUEf2lanng0O
 iaTaHWXElk6ev7xL/L8zvo5SbOMziSvw7OitfS8SSo750QWG2JaIW4DqbcYPZ1TMLe+i
 sQvb0q62RnwZuocSdQoqyqFf+UDoot2u9z8bHRqCi58R6hxSFw5vs//dk9RMhksFzycM
 RHOiunEfp8uBkOmQYlJ53QU4G1IGeZnBbEJq6tCtdevLf3gtHlunqF05GxmcG5dxmWzc
 QWJxCCVCc1a9Sn0V0r6s6GOgLvd9y1PU5nj74AYBCodzmU46cQ8tccXFzApsjYmgOXMn
 oilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8yTaR2n53yjC9TgHeWMOfMHmYa4Nj7ujRcHol/3lA3g=;
 b=7XCTJ3hWU+tt0hVPPWQ5T6FQ6AS2oSNvX8zZSvkx2gOLYPGWZfWug99GxkxCWMMNsq
 6ysHVmyv3lvPT5rnHfxXdoir3UdVSFrivEkK6X1ZRnnYaFTOB3lKNoUrfoiNEnwxmPkP
 jUDkKCmVMU2SyZH5hD4OJFuLUPGLghdMm8pD96zYJtaYlUSqWTNyLfPrdmUjiRlWfwJD
 2WUdNeGtZZiFKdub2ouSgBfbQHO6F59Ip1tiNv8eipVD4iOHq6t3VP1kC3XWOpsQ0j6X
 /v2ZBrJsI2U/WBzZsyWxeytukz7iqDRVEjmQPJu3D7vJKi3sigKdm7zha51A0j3CVQIt
 3b0g==
X-Gm-Message-State: AOAM532IYneu5QBhq78v4RzyLWrvOM78Sp9s/4U92uGxSv++302bhZS9
 BTydtmYXZaKgUJ+FvnW9yMo=
X-Google-Smtp-Source: ABdhPJw34M6l8vg7wWw3qZZBSZ1okUQb3ZcCD9zCJ7ouAT5YP017ixM4qWWex0F9OrNKSOPY1EIjkg==
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr261757wmj.144.1631719182623;
 Wed, 15 Sep 2021 08:19:42 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id h7sm286771wrq.30.2021.09.15.08.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 08:19:41 -0700 (PDT)
Date: Wed, 15 Sep 2021 17:19:39 +0200
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
Message-ID: <YUIPCxnyRutMS47/@orome.fritz.box>
References: <YL+gHN4YZ4vt1vPk@orome.fritz.box>
 <YN4F/nH/9tDuWDnQ@orome.fritz.box>
 <7995b0ed-a277-ced1-b3d0-e0e7e02817a6@gmail.com>
 <YS+Ke4Ip0InHSnHR@orome.fritz.box>
 <CAL_Jsq+TQeb56UbrO1xKFSb1yo0d8U29DPynw3_jQ6gH6Peatw@mail.gmail.com>
 <YTIogpQDJjqJUTkG@orome.fritz.box>
 <CAL_JsqKG4+n_eNj+at3m7WuAbeJ1Kyi0mYD=8-MaVjfhzdPwkA@mail.gmail.com>
 <YTJA2xARFuNUMgMc@orome.fritz.box>
 <CAL_JsqJWt6ZELEpMi+tS6S6S4MYyMHysAC2ce_CfDQFqjfgnGQ@mail.gmail.com>
 <YTelDHx2REIIvV/N@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KAG0CrOnFABPRTZ0"
Content-Disposition: inline
In-Reply-To: <YTelDHx2REIIvV/N@orome.fritz.box>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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


--KAG0CrOnFABPRTZ0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 07:44:44PM +0200, Thierry Reding wrote:
> On Tue, Sep 07, 2021 at 10:33:24AM -0500, Rob Herring wrote:
> > On Fri, Sep 3, 2021 at 10:36 AM Thierry Reding <thierry.reding@gmail.co=
m> wrote:
> > >
> > > On Fri, Sep 03, 2021 at 09:36:33AM -0500, Rob Herring wrote:
> > > > On Fri, Sep 3, 2021 at 8:52 AM Thierry Reding <thierry.reding@gmail=
=2Ecom> wrote:
> > > > >
> > > > > On Fri, Sep 03, 2021 at 08:20:55AM -0500, Rob Herring wrote:
> > > > > > On Wed, Sep 1, 2021 at 9:13 AM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > > > > > >
> > > > > > > On Fri, Jul 02, 2021 at 05:16:25PM +0300, Dmitry Osipenko wro=
te:
> > > > > > > > 01.07.2021 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
> > > > > > > > > On Tue, Jun 08, 2021 at 06:51:40PM +0200, Thierry Reding =
wrote:
> > > > > > > > >> On Fri, May 28, 2021 at 06:54:55PM +0200, Thierry Reding=
 wrote:
> > > > > > > > >>> On Thu, May 20, 2021 at 05:03:06PM -0500, Rob Herring w=
rote:
> > > > > > > > >>>> On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Redi=
ng wrote:
> > > > > > > > >>>>> From: Thierry Reding <treding@nvidia.com>
> > > > > > > > >>>>>
> > > > > > > > >>>>> Reserved memory region phandle references can be acco=
mpanied by a
> > > > > > > > >>>>> specifier that provides additional information about =
how that specific
> > > > > > > > >>>>> reference should be treated.
> > > > > > > > >>>>>
> > > > > > > > >>>>> One use-case is to mark a memory region as needing an=
 identity mapping
> > > > > > > > >>>>> in the system's IOMMU for the device that references =
the region. This is
> > > > > > > > >>>>> needed for example when the bootloader has set up har=
dware (such as a
> > > > > > > > >>>>> display controller) to actively access a memory regio=
n (e.g. a boot
> > > > > > > > >>>>> splash screen framebuffer) during boot. The operating=
 system can use the
> > > > > > > > >>>>> identity mapping flag from the specifier to make sure=
 an IOMMU identity
> > > > > > > > >>>>> mapping is set up for the framebuffer before IOMMU tr=
anslations are
> > > > > > > > >>>>> enabled for the display controller.
> > > > > > > > >>>>>
> > > > > > > > >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > > > > > >>>>> ---
> > > > > > > > >>>>>  .../reserved-memory/reserved-memory.txt       | 21 +=
++++++++++++++++++
> > > > > > > > >>>>>  include/dt-bindings/reserved-memory.h         |  8 +=
++++++
> > > > > > > > >>>>>  2 files changed, 29 insertions(+)
> > > > > > > > >>>>>  create mode 100644 include/dt-bindings/reserved-memo=
ry.h
> > > > > > > > >>>>
> > > > > > > > >>>> Sorry for being slow on this. I have 2 concerns.
> > > > > > > > >>>>
> > > > > > > > >>>> First, this creates an ABI issue. A DT with cells in '=
memory-region'
> > > > > > > > >>>> will not be understood by an existing OS. I'm less con=
cerned about this
> > > > > > > > >>>> if we address that with a stable fix. (Though I'm pret=
ty sure we've
> > > > > > > > >>>> naively added #?-cells in the past ignoring this issue=
=2E)
> > > > > > > > >>>
> > > > > > > > >>> A while ago I had proposed adding memory-region*s* as a=
n alternative
> > > > > > > > >>> name for memory-region to make the naming more consiste=
nt with other
> > > > > > > > >>> types of properties (think clocks, resets, gpios, ...).=
 If we added
> > > > > > > > >>> that, we could easily differentiate between the "legacy=
" cases where
> > > > > > > > >>> no #memory-region-cells was allowed and the new cases w=
here it was.
> > > > > > > > >>>
> > > > > > > > >>>> Second, it could be the bootloader setting up the rese=
rved region. If a
> > > > > > > > >>>> node already has 'memory-region', then adding more reg=
ions is more
> > > > > > > > >>>> complicated compared to adding new properties. And def=
ining what each
> > > > > > > > >>>> memory-region entry is or how many in schemas is impos=
sible.
> > > > > > > > >>>
> > > > > > > > >>> It's true that updating the property gets a bit complic=
ated, but it's
> > > > > > > > >>> not exactly rocket science. We really just need to spli=
ce the array. I
> > > > > > > > >>> have a working implemention for this in U-Boot.
> > > > > > > > >>>
> > > > > > > > >>> For what it's worth, we could run into the same issue w=
ith any new
> > > > > > > > >>> property that we add. Even if we renamed this to iommu-=
memory-region,
> > > > > > > > >>> it's still possible that a bootloader may have to updat=
e this property
> > > > > > > > >>> if it already exists (it could be hard-coded in DT, or =
it could have
> > > > > > > > >>> been added by some earlier bootloader or firmware).
> > > > > > > > >>>
> > > > > > > > >>>> Both could be addressed with a new property. Perhaps s=
omething like
> > > > > > > > >>>> 'iommu-memory-region =3D <&phandle>;'. I think the 'io=
mmu' prefix is
> > > > > > > > >>>> appropriate given this is entirely because of the IOMM=
U being in the
> > > > > > > > >>>> mix. I might feel differently if we had other uses for=
 cells, but I
> > > > > > > > >>>> don't really see it in this case.
> > > > > > > > >>>
> > > > > > > > >>> I'm afraid that down the road we'll end up with other c=
ases and then we
> > > > > > > > >>> might proliferate a number of *-memory-region propertie=
s with varying
> > > > > > > > >>> prefixes.
> > > > > > > > >>>
> > > > > > > > >>> I am aware of one other case where we might need someth=
ing like this: on
> > > > > > > > >>> some Tegra SoCs we have audio processors that will acce=
ss memory buffers
> > > > > > > > >>> using a DMA engine. These processors are booted from ea=
rly firmware
> > > > > > > > >>> using firmware from system memory. In order to avoid tr=
ashing the
> > > > > > > > >>> firmware, we need to reserve memory. We can do this usi=
ng reserved
> > > > > > > > >>> memory nodes. However, the audio DMA engine also uses t=
he SMMU, so we
> > > > > > > > >>> need to make sure that the firmware memory is marked as=
 reserved within
> > > > > > > > >>> the SMMU. This is similar to the identity mapping case,=
 but not exactly
> > > > > > > > >>> the same. Instead of creating a 1:1 mapping, we just wa=
nt that IOVA
> > > > > > > > >>> region to be reserved (i.e. IOMMU_RESV_RESERVED instead=
 of
> > > > > > > > >>> IOMMU_RESV_DIRECT{,_RELAXABLE}).
> > > > > > > > >>>
> > > > > > > > >>> That would also fall into the IOMMU domain, but we can'=
t reuse the
> > > > > > > > >>> iommu-memory-region property for that because then we d=
on't have enough
> > > > > > > > >>> information to decide which type of reservation we need.
> > > > > > > > >>>
> > > > > > > > >>> We could obviously make iommu-memory-region take a spec=
ifier, but we
> > > > > > > > >>> could just as well use memory-regions in that case sinc=
e we have
> > > > > > > > >>> something more generic anyway.
> > > > > > > > >>>
> > > > > > > > >>> With the #memory-region-cells proposal, we can easily e=
xtend the cell in
> > > > > > > > >>> the specifier with an additional MEMORY_REGION_IOMMU_RE=
SERVE flag to
> > > > > > > > >>> take that other use case into account. If we than also =
change to the new
> > > > > > > > >>> memory-regions property name, we avoid the ABI issue (a=
nd we gain a bit
> > > > > > > > >>> of consistency while at it).
> > > > > > > > >>
> > > > > > > > >> Ping? Rob, do you want me to add this second use-case to=
 the patch
> > > > > > > > >> series to make it more obvious that this isn't just a on=
e-off thing? Or
> > > > > > > > >> how do we proceed?
> > > > > > > > >
> > > > > > > > > Rob, given that additional use-case, do you want me to ru=
n with this
> > > > > > > > > proposal and send out an updated series?
> > > > > > > >
> > > > > > > >
> > > > > > > > What about variant with a "descriptor" properties that will=
 describe
> > > > > > > > each region:
> > > > > > > >
> > > > > > > > fb_desc: display-framebuffer-memory-descriptor {
> > > > > > > >       needs-identity-mapping;
> > > > > > > > }
> > > > > > > >
> > > > > > > > display@52400000 {
> > > > > > > >       memory-region =3D <&fb ...>;
> > > > > > > >       memory-region-descriptor =3D <&fb_desc ...>;
> > > > > > > > };
> > > > > > > >
> > > > > > > > It could be a more flexible/extendible variant.
> > > > > > >
> > > > > > > This problem recently came up on #dri-devel again. Adding Aly=
ssa and
> > > > > > > Sven who are facing a similar challenge on their work on Appl=
e M1 (if I
> > > > > > > understood correctly). Also adding dri-devel for visibility s=
ince this
> > > > > > > is a very common problem for display in particular.
> > > > > > >
> > > > > > > On M1 the situation is slightly more complicated: the firmwar=
e will
> > > > > > > allocate a couple of buffers (including the framebuffer) in h=
igh memory
> > > > > > > (> 4 GiB) and use the IOMMU to map that into an IOVA region b=
elow 4 GiB
> > > > > > > so that the display hardware can access it. This makes it imp=
ossible to
> > > > > > > bypass the IOMMU like we do on other chips (in particular to =
work around
> > > > > > > the fault-by-default policy of the ARM SMMU driver). It also =
means that
> > > > > > > in addition to the simple reserved regions I mentioned we nee=
d for audio
> > > > > > > use-cases and identity mapping use-cases we need for display =
on Tegra,
> > > > > > > we now also need to be able to convey physical to IOVA mappin=
gs.
> > > > > > >
> > > > > > > Fitting the latter into the original proposal sounds difficul=
t. A quick
> > > > > > > fix would've been to generate a mapping table in memory and p=
ass that to
> > > > > > > the kernel using a reserved-memory node (similar to what's do=
ne for
> > > > > > > example on Tegra for the EMC frequency table on Tegra210) and=
 mark it as
> > > > > > > such using a special flag. But that then involves two layers =
of parsing,
> > > > > > > which seems a bit suboptimal. Another way to shoehorn that in=
to the
> > > > > > > original proposal would've been to add flags for physical and=
 virtual
> > > > > > > address regions and use pairs to pass them using special flag=
s. Again,
> > > > > > > this is a bit wonky because it needs these to be carefully pa=
rsed and
> > > > > > > matched up.
> > > > > > >
> > > > > > > Another downside is that we now have a situation where some o=
f these
> > > > > > > regions are no longer "reserved-memory regions" in the tradit=
ional
> > > > > > > sense. This would require an additional flag in the reserved-=
memory
> > > > > > > region nodes to prevent the IOVA regions from being reserved.=
 By the
> > > > > > > way, this is something that would also be needed for the audi=
o use-case
> > > > > > > I mentioned before, because the physical memory at that addre=
ss can
> > > > > > > still be used by an operating system.
> > > > > > >
> > > > > > > A more general solution would be to draw a bit from Dmitry's =
proposal
> > > > > > > and introduce a new top-level "iov-reserved-memory" node. Thi=
s could be
> > > > > > > modelled on the existing reserved-memory node, except that th=
e physical
> > > > > > > memory pages for regions represented by child nodes would not=
 be marked
> > > > > > > as reserved. Only the IOVA range described by the region woul=
d be
> > > > > > > reserved subsequently by the IOMMU framework and/or IOMMU dri=
ver.
> > > > > > >
> > > > > > > The simplest case where we just want to reserve some IOVA reg=
ion could
> > > > > > > then be done like this:
> > > > > > >
> > > > > > >         iov-reserved-memory {
> > > > > > >                 /*
> > > > > > >                  * Probably safest to default to <2>, <2> her=
e given
> > > > > > >                  * that most IOMMUs support either > 32 bits =
of IAS
> > > > > > >                  * or OAS.
> > > > > > >                  */
> > > > > > >                 #address-cells =3D <2>;
> > > > > > >                 #size-cells =3D <2>;
> > > > > > >
> > > > > > >                 firmware: firmware@80000000 {
> > > > > > >                         reg =3D <0 0x80000000 0 0x01000000>;
> > > > > > >                 };
> > > > > > >         };
> > > > > > >
> > > > > > >         audio@30000000 {
> > > > > > >                 ...
> > > > > > >                 iov-memory-regions =3D <&firmware>;
> > > > > > >                 ...
> > > > > > >         };
> > > > > > >
> > > > > > > Mappings could be represented by an IOV reserved region takin=
g a
> > > > > > > reference to the reserved-region that they map:
> > > > > > >
> > > > > > >         reserved-memory {
> > > > > > >                 #address-cells =3D <2>;
> > > > > > >                 #size-cells =3D <2>;
> > > > > > >
> > > > > > >                 /* 16 MiB of framebuffer at top-of-memory */
> > > > > > >                 framebuffer: framebuffer@1,ff000000 {
> > > > > > >                         reg =3D <0x1 0xff000000 0 0x01000000>;
> > > > > > >                         no-map;
> > > > > > >                 };
> > > > > > >         };
> > > > > > >
> > > > > > >         iov-reserved-memory {
> > > > > > >                 /* IOMMU supports only 32-bit output address =
space */
> > > > > > >                 #address-cells =3D <1>;
> > > > > > >                 #size-cells =3D <1>;
> > > > > > >
> > > > > > >                 /* 16 MiB of framebuffer mapped to top of IOV=
A */
> > > > > > >                 fb: fb@ff000000 {
> > > > > > >                         reg =3D <0 0xff000000 0 0x01000000>;
> > > > > > >                         memory-region =3D <&framebuffer>;
> > > > > > >                 };
> > > > > > >         };
> > > > > > >
> > > > > > >         display@40000000 {
> > > > > > >                 ...
> > > > > > >                 /* optional? */
> > > > > > >                 memory-region =3D <&framebuffer>;
> > > > > > >                 iov-memory-regions =3D <&fb>;
> > > > > > >                 ...
> > > > > > >         };
> > > > > > >
> > > > > > > It's interesting how identity mapped regions now become a tri=
vial
> > > > > > > special case of mappings. All that is needed is to make the r=
eg property
> > > > > > > of the IOV reserved region correspond to the reg property of =
the normal
> > > > > > > reserved region. Alternatively, as a small optimization for l=
azy people
> > > > > > > like me, we could just allow these cases to omit the reg prop=
erty and
> > > > > > > instead inherit it from the referenced reserved region.
> > > > > > >
> > > > > > > As the second example shows it might be convenient if memory-=
region
> > > > > > > could be derived from iov-memory-regions. This could be usefu=
l for cases
> > > > > > > where the driver wants to do something with the physical page=
s of the
> > > > > > > reserved region (such as mapping them and copying out the fra=
mebuffer
> > > > > > > data to another buffer so that the reserved memory can be rec=
ycled). If
> > > > > > > we have the IOV reserved region, we could provide an API to e=
xtract the
> > > > > > > physical reserved region (if it exists). That way we could av=
oid
> > > > > > > referencing it twice in DT. Then again, there's something ele=
gant about
> > > > > > > the explicit second reference to. It indicates the intent tha=
t we may
> > > > > > > want to use the region for something other than just the IOV =
mapping.
> > > > > > >
> > > > > > > Anyway, this has been long enough. Let me know what you think=
=2E Alyssa,
> > > > > > > Sven, it'd be interesting to hear if you think this could wor=
k as a
> > > > > > > solution to the problem on M1.
> > > > > > >
> > > > > > > Rob, I think you might like this alternative because it basic=
ally gets
> > > > > > > rid of all the points in the original proposal that you were =
concerned
> > > > > > > about. Let me know what you think.
> > > > > >
> > > > > > Couldn't we keep this all in /reserved-memory? Just add an iova
> > > > > > version of reg. Perhaps abuse 'assigned-address' for this purpo=
se. The
> > > > > > issue I see would be handling reserved iova areas without a phy=
sical
> > > > > > area. That can be handled with just a iova and no reg. We alrea=
dy have
> > > > > > a no reg case.
> > > > >
> > > > > I had thought about that initially. One thing I'm worried about i=
s that
> > > > > every child node in /reserved-memory will effectively cause the m=
emory
> > > > > that it described to be reserved. But we don't want that for regi=
ons
> > > > > that are "virtual only" (i.e. IOMMU reservations).
> > > >
> > > > By virtual only, you mean no physical mapping, just a region of
> > > > virtual space, right? For that we'd have no 'reg' and therefore no
> > > > (physical) reservation by the OS. It's similar to non-static region=
s.
> > > > You need a specific handler for them. We'd probably want a compatib=
le
> > > > as well for these virtual reservations.
> > >
> > > Yeah, these would be purely used for reserving regions in the IOVA so
> > > that they won't be used by the IOVA allocator. Typically these would =
be
> > > used for cases where those addresses have some special meaning.
> > >
> > > Do we want something like:
> > >
> > >         compatible =3D "iommu-reserved";
> > >
> > > for these? Or would that need to be:
> > >
> > >         compatible =3D "linux,iommu-reserved";
> > >
> > > ? There seems to be a mix of vendor-prefix vs. non-vendor-prefix
> > > compatible strings in the reserved-memory DT bindings directory.
> >=20
> > I would not use 'linux,' here.
> >=20
> > >
> > > On the other hand, do we actually need the compatible string? Because=
 we
> > > don't really want to associate much extra information with this like =
we
> > > do for example with "shared-dma-pool". The logic to handle this would
> > > all be within the IOMMU framework. All we really need is for the
> > > standard reservation code to skip nodes that don't have a reg property
> > > so we don't reserve memory for "virtual-only" allocations.
> >=20
> > It doesn't hurt to have one and I can imagine we might want to iterate
> > over all the nodes. It's slightly easier and more common to iterate
> > over compatible nodes rather than nodes with some property.
> >=20
> > > > Are these being global in DT going to be a problem? Presumably we h=
ave
> > > > a virtual space per IOMMU. We'd know which IOMMU based on a device's
> > > > 'iommus' and 'memory-region' properties, but within /reserved-memory
> > > > we wouldn't be able to distinguish overlapping addresses from separ=
ate
> > > > address spaces. Or we could have 2 different IOVAs for 1 physical
> > > > space. That could be solved with something like this:
> > > >
> > > > iommu-addresses =3D <&iommu1 <address cells> <size cells>>;
> > >
> > > The only case that would be problematic would be if we have overlappi=
ng
> > > physical regions, because that will probably trip up the standard cod=
e.
> > >
> > > But this could also be worked around by looking at iommu-addresses. F=
or
> > > example, if we had something like this:
> > >
> > >         reserved-memory {
> > >                 fb_dc0: fb@80000000 {
> > >                         reg =3D <0x80000000 0x01000000>;
> > >                         iommu-addresses =3D <0xa0000000 0x01000000>;
> > >                 };
> > >
> > >                 fb_dc1: fb@80000000 {
> >=20
> > You can't have 2 nodes with the same name (actually, you can, they
> > just get merged together). Different names with the same unit-address
> > is a dtc warning. I'd really like to make that a full blown
> > overlapping region check.
>=20
> Right... so this would be a lot easier to deal with using that earlier
> proposal where the IOMMU regions were a separate thing and referencing
> the reserved-memory nodes. In those cases we could just have the
> physical reservation for the framebuffer once (so we don't get any
> duplicates or overlaps) and then have each IOVA reservation reference
> that to create the mapping.
>=20
> >=20
> > >                         reg =3D <0x80000000 0x01000000>;
> > >                         iommu-addresses =3D <0xb0000000 0x01000000>;
> > >                 };
> > >         };
> > >
> > > We could make the code identify that this is for the same physical
> > > reservation (maybe make it so that reg needs to match exactly for this
> > > to be recognized) but with different virtual allocations.
> > >
> > > On a side-note: do we really need to repeat the size? I'd think if we
> > > want mappings then we'd likely want them for the whole reservation.
> >=20
> > Humm, I suppose not, but dropping it paints us into a corner if we
> > come up with wanting a different size later. You could have a carveout
> > for double/triple buffering your framebuffer, but the bootloader
> > framebuffer is only single buffered. So would you want actual size?
>=20
> Perhaps this needs to be a bit more verbose then. If we want the ability
> to create a mapping for only a partial reservation, I could imagine we
> may as well want one that doesn't start at the beginning. So perhaps an
> ever better solution would be to have a complete mapping, something that
> works similar to "ranges" perhaps, like so:
>=20
> 	fb@80000000 {
> 		reg =3D <0x80000000 0x01000000>;
> 		iommu-ranges =3D <0x80000000 0x01000000 0x80000000>;
> 	};
>=20
> That would be for a full identity mapping, but we could also have
> something along the lines of this:
>=20
> 	fb@80000000 {
> 		reg =3D <0x80000000 0x01000000>;
> 		iommu-ranges =3D <0x80100000 0x00100000 0xa0000000>;
> 	};
>=20
> So that would only map a 1 MiB chunk at offset 1 MiB (of the physical
> reservation) to I/O virtual address 0xa0000000.
>=20
> > > I'd like to keep references to IOMMUs out of this because they would =
be
> > > duplicated. We will only use these nodes if they are referenced by a
> > > device node that also has an iommus property. Also, the IOMMU referen=
ce
> > > itself isn't enough. We'd also need to support the complete specifier
> > > because you can have things like SIDs in there to specify the exact
> > > address space that a device uses.
> > >
> > > Also, for some of these they may be reused independently of the IOMMU
> > > address space. For example the Tegra framebuffer identity mapping can
> > > be used by either of the 2-4 display controllers, each with (at least
> > > potentially) their own address space. But we don't want to have to
> > > describe the identity mapping separately for each display controller.
> >=20
> > Okay, but I'd rather have to duplicate things in your case than not be
> > able to express some other case.
>=20
> The earlier "separate iov-reserved-memory" proposal would be a good
> compromise here. It'd allow us to duplicate only the necessary bits
> (i.e. the IOVA mappings) but keep the common bits simple. And even
> the IOVA mappings could be shared for cases like identity mappings.
> See below for more on that.
>=20
> > > Another thing to consider is that these nodes will often be added by
> > > firmware (e.g. firmware will allocate the framebuffer and set up the
> > > corresponding reserved memory region in DT). Wiring up references like
> > > this would get very complicated very quickly.
> >=20
> > Yes.
> >=20
> > The using 'iommus' property option below can be optional and doesn't
> > have to be defined/supported now. Just trying to think ahead and not
> > be stuck with something that can't be extended.
>=20
> One other benefit of the separate iov-reserved-memory node would be that
> the iommus property could be simplified. If we have a physical
> reservation that needs to be accessed by multiple different display
> controllers, we'd end up with something fairly complex, such as this:
>=20
> 	fb: fb@80000000 {
> 		reg =3D <0x80000000 0x01000000>;
> 		iommus =3D <&dc0_iommu 0xa0000000 0x01000000>,
> 			 <&dc1_iommu 0xb0000000 0x01000000>,
> 			 <&dc2_iommu 0xc0000000 0x01000000>;
> 	};
>=20
> This would get even worse if we want to support partial mappings. Also,
> it'd become quite complicated to correlate this with the memory-region
> references:
>=20
> 	dc0: dc@40000000 {
> 		...
> 		memory-region =3D <&fb>;
> 		iommus =3D <&dc0_iommu>;
> 		...
> 	};
>=20
> So now you have to go match up the phandle (and potentially specifier)
> in the iommus property of the disp0 node with an entry in the fb node's
> iommus property. That's all fairly complicated stuff.
>=20
> With separate iov-reserved-memory, this would be a bit more verbose, but
> each individual node would be simpler:
>=20
> 	reserved-memory {
> 		fb: fb@80000000 {
> 			reg =3D <0x80000000 0x01000000>;
> 		};
> 	};
>=20
> 	iov-reserved-memory {
> 		fb0: fb@80000000 {
> 			/* identity mapping, "reg" optional? */
> 			reg =3D <0x80000000 0x01000000>;
> 			memory-region =3D <&fb>;
> 		};
>=20
> 		fb1: fb@90000000 {
> 			/* but doesn't have to be */
> 			reg =3D <0x90000000 0x01000000>;
> 			memory-region =3D <&fb>;
> 		};
>=20
> 		fb2: fb@a0000000 {
> 			/* can be partial, too */
> 			ranges =3D <0x80000000 0x00800000 0xa0000000>;
> 			memory-region =3D <&fb>;
> 		};
> 	}
>=20
> 	dc0: dc@40000000 {
> 		iov-memory-regions =3D <&fb0>;
> 		/* optional? */
> 		memory-region =3D <&fb>;
> 		iommus =3D <&dc0_iommu>;
> 	};
>=20
> Alternatively, if we want to support partial mappings, we could replace
> those reg properties by ranges properties that I showed earlier. We may
> even want to support both. Use "reg" for virtual-only reservations and
> identity mappings, or "simple partial mappings" (that map a sub-region
> starting from the beginning). Identity mappings could still be
> simplified by just omitting the "reg" property. For more complicated
> mappings, such as the ones on M1, the "ranges" property could be used.
>=20
> Note how this looks a bit boilerplate-y, but it's actually really quite
> simple to understand, even for humans, I think.
>=20
> Also, the phandles in this are comparatively easy to wire up because
> they can all be generated in a hierarchical way: generate physical
> reservation and store phandle, then generate I/O virtual reservation
> to reference that phandle and store the new phandle as well. Finally,
> wire this up to the display controller (using either the IOV phandle or
> both).
>=20
> Granted, this requires the addition of a new top-level node, but given
> how expressive this becomes, I think it might be worth a second
> consideration.

I guess as a middle-ground between your suggestion and mine, we could
also move the IOV nodes back into reserved-memory. If we make sure the
names (together with unit-addresses) are unique, to support cases where
we want to identity map, or have multiple mappings at the same address.
So it'd look something like this:

	reserved-memory {
		fb: fb@80000000 {
			reg =3D <0x80000000 0x01000000>;
		};

		audio-firmware@ff000000 {
			/* perhaps add "iommu-reserved" for this case */
			compatible =3D "iommu-mapping";
			/*
			 * no memory-region referencing a physical
			 * reservation, indicates that this is an
			 * IOMMU reservation, rather than a mapping
			 /
			reg =3D <0xff000000 0x01000000>;
		};

		fb0: fb-mapping@80000000 {
			compatible =3D "iommu-mapping";
			/* identity mapping, "reg" optional? */
			reg =3D <0x80000000 0x01000000>;
			memory-region =3D <&fb>;
		};

		fb1: fb-mapping@90000000 {
			compatible =3D "iommu-mapping";
			/* but doesn't have to be */
			reg =3D <0x90000000 0x01000000>;
			memory-region =3D <&fb>;
		};

		fb2: fb-mapping@a0000000 {
			compatible =3D "iommu-mapping";
			/* can be partial, too */
			ranges =3D <0xa0000000 0x00800000 0x80000000>;
			memory-region =3D <&fb>;
		};
	}

	dc0: dc@40000000 {
		memory-region =3D <&fb0>;
		iommus =3D <&dc0_iommu>;
	};

What do you think?

Thierry

--KAG0CrOnFABPRTZ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFCDwkACgkQ3SOs138+
s6EN/A/6A8CXp7fjA63VJ0bacJvrMTelO67uZPJ1NNDYcLWwvk40jR4tgV5aizng
vu4cTQ+f1o3WjsRVk5vJPTpQnbZQnC6rhkxIXyELKsf91lwCNKgdETgQ6ql4ayur
USHrrOBoakrREKjjEVkF55b4rE8Z9Jqa2LhdsdFNBYa8X2n2hpFj9waVnZZPTbF2
OOFfxpbVf0IFdxLJPOkPjplm3OVsy6Z6TedAv09PGPLNqbgPnZBfXxoWAe7y405y
+VUr1d5IY33v2YZ3j315x3S2za3VoGfu5cFS2l61hxsWQU3ZuME34f8k1Vj0tLPH
fJGYGq05oqqhwjlgBv9VLUUviEkb5Ob9KCF1eughVPnoiOnd439eEGdQ++1ZYK0w
/TzvguV1MsQYIcB8lnAOsOJvphGlNdmozAcc4yxH56Va2UA1TZOTgEGlJR1ZLTGK
Wd/6DPKXUt0C0wXCtXteqomYs6C/O0sQbuiwzDkhlEwvPsn7KtV7FaYR6Y4G3PP+
jxU+tFoS/zXcZh4y0nfSaRrycnnDEOlEd3s4Jo07AcYxAmyDSoM9kxKt6GuwHdb5
Y6IoDgzsiS+vFBzYYJqflWIl1f97eZUnmnDoGueay8pSDqyN7uIjqczF1Vf/VitV
7OetQAmUdJPL7x55FlYEEuxsNtq6alrP3PkSRh0DBzQSWxmwMGE=
=rxOn
-----END PGP SIGNATURE-----

--KAG0CrOnFABPRTZ0--
