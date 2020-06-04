Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83371EF1E7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840CA6E865;
	Fri,  5 Jun 2020 07:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41E76E506
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 16:52:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 579C1AF9F;
 Thu,  4 Jun 2020 16:52:44 +0000 (UTC)
Message-ID: <b6784faab54711eae215cfaf7433485f58d1d3f1.camel@suse.de>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 04 Jun 2020 18:52:34 +0200
In-Reply-To: <CA+-6iNz1-1wOurKoOJzhbVL0_YP7dbmp0wy1GWkLW_61yhRXyA@mail.gmail.com>
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
 <09c451e24f62e226e1ceaa0fe5d0a81109cace74.camel@suse.de>
 <CA+-6iNz1-1wOurKoOJzhbVL0_YP7dbmp0wy1GWkLW_61yhRXyA@mail.gmail.com>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR
 \(REMOTEPROC\) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Wolfram Sang <wsa@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 David Kershner <david.kershner@unisys.com>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "open list:USB
 SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0872238632=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0872238632==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+/XSTm0WPPCVRS3Gv3bc"


--=-+/XSTm0WPPCVRS3Gv3bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On Thu, 2020-06-04 at 10:35 -0400, Jim Quinlan wrote:

[...]

> > > --- a/arch/sh/kernel/dma-coherent.c
> > > +++ b/arch/sh/kernel/dma-coherent.c
> > > @@ -14,6 +14,8 @@ void *arch_dma_alloc(struct device *dev, size_t siz=
e,
> > > dma_addr_t *dma_handle,
> > >  {
> > >       void *ret, *ret_nocache;
> > >       int order =3D get_order(size);
> > > +     unsigned long pfn;
> > > +     phys_addr_t phys;
> > >=20
> > >       gfp |=3D __GFP_ZERO;
> > >=20
> > > @@ -34,11 +36,14 @@ void *arch_dma_alloc(struct device *dev, size_t s=
ize,
> > > dma_addr_t *dma_handle,
> > >               return NULL;
> > >       }
> > >=20
> > > -     split_page(pfn_to_page(virt_to_phys(ret) >> PAGE_SHIFT), order)=
;
> > > +     phys =3D virt_to_phys(ret);
> > > +     pfn =3D  phys >> PAGE_SHIFT;
> >=20
> > nit: not sure it really pays off to have a pfn variable here.
> Did it for readability; the compiler's optimization should take care
> of any extra variables.  But I can switch if you insist.

No need.

[...]

> > > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > index 055eb0b8e396..2d66d415b6c3 100644
> > > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > > @@ -898,7 +898,10 @@ static int sun6i_csi_probe(struct platform_devic=
e
> > > *pdev)
> > >=20
> > >       sdev->dev =3D &pdev->dev;
> > >       /* The DMA bus has the memory mapped at 0 */
> > > -     sdev->dev->dma_pfn_offset =3D PHYS_OFFSET >> PAGE_SHIFT;
> > > +     ret =3D attach_uniform_dma_pfn_offset(sdev->dev,
> > > +                                         PHYS_OFFSET >> PAGE_SHIFT);
> > > +     if (ret)
> > > +             return ret;
> > >=20
> > >       ret =3D sun6i_csi_resource_request(sdev, pdev);
> > >       if (ret)
> > > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > > index 96d8cfb14a60..c89333b0a5fb 100644
> > > --- a/drivers/of/address.c
> > > +++ b/drivers/of/address.c
> > > @@ -918,6 +918,70 @@ void __iomem *of_io_request_and_map(struct
> > > device_node
> > > *np, int index,
> > >  }
> > >  EXPORT_SYMBOL(of_io_request_and_map);
> > >=20
> > > +static int attach_dma_pfn_offset_map(struct device *dev,
> > > +                                  struct device_node *node, int
> > > num_ranges)
> >=20
> > As with the previous review, please take this comment with a grain of s=
alt.
> >=20
> > I think there should be a clear split between what belongs to OF and wh=
at
> > belongs to the core device infrastructure.
> >=20
> > OF's job should be to parse DT and provide a list/array of ranges, wher=
eas
> > the
> > core device infrastructure should provide an API to assign a list of
> > ranges/offset to a device.
> >=20
> > As a concrete example, you're forcing devices like the sta2x11 to build=
 with
> > OF
> > support, which, being an Intel device, it's pretty odd. But I'm also
> > thinking
> > of how will all this fit once an ACPI device wants to use it.
> To fix this I only have to move attach_uniform_dma_pfn_offset() from
> of/address.c to say include/linux/dma-mapping.h.  It has no
> dependencies on OF.  Do you agree?

Yes that seems nicer. In case you didn't had it in mind already, I'd change=
 the
function name to match the naming scheme they use there.

On the other hand, I'd also move the non OF parts of the non unifom dma_off=
set
version of the function there.

> > Expanding on this idea, once you have a split between the OF's and devi=
ce
> > core
> > roles, it transpires that of_dma_get_range()'s job should only be to pr=
ovide
> > the ranges in a device understandable structure and of_dma_configre()'s=
 to
> > actually assign the device's parameters. This would obsolete patch #7.
>=20
> I think you mean patch #8.

Yes, my bad.

> I agree with you.  The reason I needed a "struct device *"  in the call i=
s
> because I wanted to make sure the memory that is alloc'd belongs to the
> device that needs it.  If I do a regular kzalloc(), this memory  will bec=
ome
> a leak once someone starts unbinding/binding their device.  Also, in  all
> uses of of_dma_rtange() -- there is only one --  a dev is required as one
> can't attach an offset map to NULL.
>=20
> I do see that there are a number of functions in drivers/of/*.c that
> take 'struct device *dev' as an argument so there is precedent for
> something like this.  Regardless, I need an owner to the memory I
> alloc().

I understand the need for dev to be around, devm_*() is key. But also it's
important to keep the functions on purpose. And if of_dma_get_range() start=
s
setting ranges it calls, for the very least, for a function rename. Althoug=
h
I'd rather split the parsing and setting of ranges as mentioned earlier. Th=
at
said, I get that's a more drastic move.

Talking about drastic moves. How about getting rid of the concept of
dma_pfn_offset for drivers altogether. Let them provide dma_pfn_offset_regi=
ons
(even when there is only one). I feel it's conceptually nicer, as you'd be
dealing only in one currency, so to speak, and you'd centralize the bus DMA
ranges setter function which is always easier to maintain.

I'd go as far as not creating a special case for uniform offsets. Let just =
set
cpu_end and dma_end to -1 so we always get a match. It's slightly more comp=
ute
heavy, but I don't think it's worth the optimization.

Just my two cents :)

> > > +{
> > > +     struct of_range_parser parser;
> > > +     struct of_range range;
> > > +     struct dma_pfn_offset_region *r;
> > > +
> > > +     r =3D devm_kcalloc(dev, num_ranges + 1,
> > > +                      sizeof(struct dma_pfn_offset_region), GFP_KERN=
EL);
> > > +     if (!r)
> > > +             return -ENOMEM;
> > > +     dev->dma_pfn_offset_map =3D r;
> > > +     of_dma_range_parser_init(&parser, node);
> > > +
> > > +     /*
> > > +      * Record all info for DMA ranges array.  We could
> > > +      * just use the of_range struct, but if we did that it
> > > +      * would require more calculations for phys_to_dma and
> > > +      * dma_to_phys conversions.
> > > +      */
> > > +     for_each_of_range(&parser, &range) {
> > > +             r->cpu_start =3D range.cpu_addr;
> > > +             r->cpu_end =3D r->cpu_start + range.size - 1;
> > > +             r->dma_start =3D range.bus_addr;
> > > +             r->dma_end =3D r->dma_start + range.size - 1;
> > > +             r->pfn_offset =3D PFN_DOWN(range.cpu_addr)
> > > +                     - PFN_DOWN(range.bus_addr);
> > > +             r++;
> > > +     }
> > > +     return 0;
> > > +}
> > > +
> > > +
> > > +
> > > +/**
> > > + * attach_dma_pfn_offset - Assign scalar offset for all addresses.
> > > + * @dev:     device pointer; only needed for a corner case.
> >=20
> > That's a huge corner :P
> Good point; I'm not really sure what percent of Linux configurations
> require a dma_pfn_offset.  I'll drop the "corner".
>=20
> > > + * @dma_pfn_offset:  offset to apply when converting from phys addr
> > > + *                   to dma addr and vice versa.
> > > + *
> > > + * It returns -ENOMEM if out of memory, otherwise 0.
> > > + */
> > > +int attach_uniform_dma_pfn_offset(struct device *dev, unsigned long
> > > pfn_offset)
> >=20
> > As I say above, does this really belong to of/address.c?
> No it does not.  Will fix.
>=20
> > > +{
> > > +     struct dma_pfn_offset_region *r;
> > > +
> > > +     if (!dev)
> > > +             return -ENODEV;
> > > +
> > > +     if (!pfn_offset)
> > > +             return 0;
> > > +
> > > +     r =3D devm_kcalloc(dev, 1, sizeof(struct dma_pfn_offset_region)=
,
> > > +                      GFP_KERNEL);
> > > +     if (!r)
> > > +             return -ENOMEM;
> >=20
> > I think you're missing this:
> >=20
> >         dev->dma_pfn_offset_map =3D r;
> >=20
> That's a showstopper!  DanC also pointed it out but I still didn't see
> it.  Thanks!
>=20
> > > +
> > > +     r->uniform_offset =3D true;
> > > +     r->pfn_offset =3D pfn_offset;
> > > +
> > > +     return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(attach_uniform_dma_pfn_offset);
> > > +
> > >  /**
> > >   * of_dma_get_range - Get DMA range info
> > >   * @dev:     device pointer; only needed for a corner case.
> > > @@ -933,7 +997,7 @@ EXPORT_SYMBOL(of_io_request_and_map);
> > >   *   CPU addr (phys_addr_t)  : pna cells
> > >   *   size                    : nsize cells
> > >   *
> > > - * It returns -ENODEV if "dma-ranges" property was not found
> > > + * It returns -ENODEV if !dev or "dma-ranges" property was not found
> > >   * for this device in DT.
> > >   */
> > >  int of_dma_get_range(struct device *dev, struct device_node *np, u64
> > > *dma_addr,
> > > @@ -946,7 +1010,13 @@ int of_dma_get_range(struct device *dev, struct
> > > device_node *np, u64 *dma_addr,
> > >       bool found_dma_ranges =3D false;
> > >       struct of_range_parser parser;
> > >       struct of_range range;
> > > +     phys_addr_t cpu_start =3D ~(phys_addr_t)0;
> > >       u64 dma_start =3D U64_MAX, dma_end =3D 0, dma_offset =3D 0;
> > > +     bool dma_multi_pfn_offset =3D false;
> > > +     int num_ranges =3D 0;
> > > +
> > > +     if (!dev)
> > > +             return -ENODEV;
> >=20
> > Shouldn't this be part of patch #7?
> Do you mean #8?  Do you mean the test for !dev?   It is not required
> for #8 so I thought I'd keep these two changes separate.  I could
> squash them.

#8, of course.

It's more of a subjective matter, but to me it fits better #8's description=
 and
keeps this one more focused. That said, it's just a comment, do as you plea=
se.

Regads,
Nicolas


--=-+/XSTm0WPPCVRS3Gv3bc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl7ZJtIACgkQlfZmHno8
x/5zGgf/a7soc9YvHEvmdT8pJRLOYDsm9dam8rBwD0eb/wfbb7jjB8Er4hS+WJHU
XToJ2dmTL/Bv8tkGQKi09SzSGszxdp0HE5mxeGuyuNObVW0jvTSSX9PjLI0f94nS
ITW0vyQKPaxt/ELdNmorYy6g5PwaVy6ejXO5S92KS1128G5OZh6LGA9ZXCfotk4H
yG2HHc/78FiER5QWlBXwkj3B/Cv7mvhKCFBaK4STX1ejmFia6XrcrwCwhLLYsNjC
ZLPctChWS3tsa48YEULB7g+2OqfszIHPuBO3qEmn4r0yT1iEwGvNJt3NaY3Y9Rmp
lkwg+uvixGTQHCKHefGFx39FgIEcyA==
=nIwP
-----END PGP SIGNATURE-----

--=-+/XSTm0WPPCVRS3Gv3bc--


--===============0872238632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0872238632==--

