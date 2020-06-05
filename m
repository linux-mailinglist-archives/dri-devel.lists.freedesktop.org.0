Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F291F0EF5
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAA26E3C4;
	Sun,  7 Jun 2020 19:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36526E956
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 17:27:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ACC14AFA8;
 Fri,  5 Jun 2020 17:27:25 +0000 (UTC)
Message-ID: <f7278849ee08211a6446d7a5a8ffc163751b34bc.camel@suse.de>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jim Quinlan <james.quinlan@broadcom.com>, Christoph Hellwig <hch@lst.de>
Date: Fri, 05 Jun 2020 19:27:16 +0200
In-Reply-To: <CA+-6iNzutM0jfyHTOVZMn8_-MqHwJMAyoQTGMbU3vPnJKd8USA@mail.gmail.com>
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
 <09c451e24f62e226e1ceaa0fe5d0a81109cace74.camel@suse.de>
 <CA+-6iNz1-1wOurKoOJzhbVL0_YP7dbmp0wy1GWkLW_61yhRXyA@mail.gmail.com>
 <b6784faab54711eae215cfaf7433485f58d1d3f1.camel@suse.de>
 <CA+-6iNzutM0jfyHTOVZMn8_-MqHwJMAyoQTGMbU3vPnJKd8USA@mail.gmail.com>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Content-Type: multipart/mixed; boundary="===============1452273182=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1452273182==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YwX3NY+MokiYMCDlDcff"


--=-YwX3NY+MokiYMCDlDcff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christoph,
a question arouse, is there a real value to dealing with PFNs (as opposed t=
o
real addresses) in the core DMA code/structures? I see that in some cases i=
t
eases interacting with mm, but the overwhelming usage of say,
dev->dma_pfn_offset, involves shifting it.

Hi Jim,
On Thu, 2020-06-04 at 14:01 -0400, Jim Quinlan wrote:
> Hi Nicolas,

[...]

> > I understand the need for dev to be around, devm_*() is key. But also i=
t's
> > important to keep the functions on purpose. And if of_dma_get_range() s=
tarts
> > setting ranges it calls, for the very least, for a function rename. Alt=
hough
> > I'd rather split the parsing and setting of ranges as mentioned earlier=
.
> > That
> > said, I get that's a more drastic move.
>=20
> I agree with you.  I could do this from device.c:
>=20
>         of_dma_get_num_ranges(..., &num_ranges); /* new function */
>         r =3D devm_kcalloc(dev, num_ranges + 1, sizeof(*r), GFP_KERNEL);
>         of_dma_get_range(np, &dma_addr, &paddr, &size, r, num_ranges);
>=20
> The problem here is that there could be four ranges, all with
> offset=3D0.  My current code would optimize this case out but the above
> would have us holding useless memory and looping through the four
> ranges on every dma <=3D> phys conversion only to add 0.

Point taken. Ultimately it's setting the device's dma ranges in
of_dma_get_range() that was really bothering me, so if we have to pass the
device pointer for allocations, be it.

> > Talking about drastic moves. How about getting rid of the concept of
> > dma_pfn_offset for drivers altogether. Let them provide
> > dma_pfn_offset_regions
> > (even when there is only one). I feel it's conceptually nicer, as you'd=
 be
> > dealing only in one currency, so to speak, and you'd centralize the bus=
 DMA
> > ranges setter function which is always easier to maintain.
> Do you agree that we have to somehow hang this info on the struct
> device structure?  Because in the dma2phys() and phys2dma() all you
> have is the dev parameter.  I don't see how this  can be done w/o
> involving dev.

Sorry I didn't make myself clear here. What bothers me is having two functi=
ons
setting the same device parameter trough different means, I'd be happy to g=
et
rid of attach_uniform_dma_pfn_offset(), and always use the same function to=
 set
a device's bus dma regions. Something the likes of this comes to mind:

dma_attach_pfn_offset_region(struct device *dev, struct dma_pfn_offset_regi=
ons *r)

We could maybe use some helper macros for the linear case. But that's the g=
ist
of it.

Also, it goes hand in hand with the comment below. Why having a special cas=
e
for non sparse DMA offsets in struct dma_pfn_offset_regions? The way I see =
it,
in this case, code simplicity is more interesting than a small optimization=
.

> > I'd go as far as not creating a special case for uniform offsets. Let j=
ust
> > set
> > cpu_end and dma_end to -1 so we always get a match. It's slightly more
> > compute
> > heavy, but I don't think it's worth the optimization.
> Well, there are two subcases here.  One where we do know the bounds
> and one where we do not.  I suppose for the latter I could have the
> drivers calling it with begin=3D0 and end=3D~(dma_addr_t)0.  Let me give
> this some thought...
>=20
> > Just my two cents :)
>=20
> Worth much more than $0.02 IMO :-)

BTW, would you consider renaming the DMA offset struct to something simpler
like, struct bus_dma_region? It complements 'dev->bus_dma_limit' better IMO=
.

> BTW, I tried putting the "if (dev->dma_pfn_offset_map)" clause inside
> the inline functions but the problem is that it slows the fastpath;
> consider the following code from dma-direct.h
>=20
>         if (dev->dma_pfn_offset_map) {
>                 unsigned long dma_pfn_offset =3D
dma_pfn_offset_from_phys_addr(dev, paddr);
>=20
>                 dev_addr -=3D ((dma_addr_t)dma_pfn_offset << PAGE_SHIFT);
>         }
>         return dev_addr;
>=20
> becomes
>=20
>         unsigned long dma_pfn_offset =3D dma_pfn_offset_from_phys_addr(de=
v,
paddr);
>=20
>         dev_addr -=3D ((dma_addr_t)dma_pfn_offset << PAGE_SHIFT);
>         return dev_addr;
>=20
> So those configurations that  have no dma_pfn_offsets are doing an
> unnecessary shift and add.

Fair enough. Still not a huge difference, but I see the value being the mos=
t
common case.

Regards,
Nicolas


--=-YwX3NY+MokiYMCDlDcff
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl7agHQACgkQlfZmHno8
x/6D4wf8C6l0E7AUohntNHuqqtMhRrh3fE2ar9v2l+Hpq582gasP/VKacDmmQlhJ
ux+9ZkUFYf9RO/CmM11DNpjVWI1skp2OuI4lSLaC7zneYFOwwqPEcgV0KvcfVFim
su5CyLgwdHInfwIHrAsM09BZkFDKxtsBCvALQEX203VZB8HEC7XsZS3++KWL9bgy
gbrqF4hs49vdcjVBbkL+wPY7rVZ6Xt8JJfNVx/VJQQtEyjz6Y2tpvRT8KBlZHJKZ
+k9kV1dG9+UZ1Tw6kOvVrdKdjLODEu+ehKdSwuyyTNQFy6+nVcJoAKuWbPou69//
CZzrN3RMBphApZhnJwGDXfe99/i3GQ==
=HHS8
-----END PGP SIGNATURE-----

--=-YwX3NY+MokiYMCDlDcff--


--===============1452273182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1452273182==--

