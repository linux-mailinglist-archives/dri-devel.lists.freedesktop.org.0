Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064BF3FDDAC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 16:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E3589F43;
	Wed,  1 Sep 2021 14:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED0689F43
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 14:13:20 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i6so4803785wrv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 07:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TwTbOhNoTxiPOCnpy5sgrS/OP524AWmM18IklLujeZo=;
 b=Ndfe0sMmHx/V/xbedoCSQsiOpE2YlvK7gBUQjZH5o3UkZQTtNWzM5qW5edDAt2Jcf8
 1kRZa+M9hgUkFmag9Smkhho+7ddb0SNR2g/GDrowLMyEA3oubkZsUL4OEVr8J3Eb+3o+
 zxAIpLgvklwP/PmgeRLpCXg5Sja9o1QzDcEFvIvHCmwbN+aoUlrSlTKlcluP0ovxKtVa
 vdppuKoaacLuNGulgE7XN3lhZ5jlt9EQ2AM5k6kOw0pYa6PuDXfR4aDISQTuJtrA8bdI
 J8ZqNtIBN0Xquf+wpE6ZTKk+3qrJAt5dRT2dXSKjK6XMsG45iiSxkIWc0K3rLE6HA3cO
 3xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TwTbOhNoTxiPOCnpy5sgrS/OP524AWmM18IklLujeZo=;
 b=c7ysezHPP+DGybPPcrXGi9TVMPOxlutuK5kxpRBO8oUIhruxNsOjrdoAQnRNsKyrsO
 GGJ3R7ZVWbx961Va8Xm6pwvy8hKmZVfExtFTfXZva55wTZyIEGkdvuE8cwUG6UKfh4X/
 dkADVP5yvqFATMUtuDOwwXkK5CHrY1lMwZPSz2Enfwqh7FqEZVE/d1jHPByUGi3XK0gQ
 AX5hwwCDhh3h+QAw5ONRF1orONnQTw9Q01wmPpF4eaYqiCT5kZO5ZFi/a8spkDgrB0f3
 44Ols1+ooLMVGQwPQbNPvdZUBZhO2Jshlf/h69muYL2w0yquuuxPcyQGvC+2fHF3M3xg
 Mn3w==
X-Gm-Message-State: AOAM530iLXQ3Tjmbr02uYhRv3gRRejXgYqmT4I94EHwgbPakCyZxq3Hs
 UMNnS0sP9bjtUfEKYtmH1MA=
X-Google-Smtp-Source: ABdhPJyhHg0ewjd0bdLWVYLGd6er5AYyIxz4OkNTAtV4eKXW0TNh5skh3O/fwNl27cHo/svOJh+jhQ==
X-Received: by 2002:adf:ab0e:: with SMTP id q14mr38412514wrc.171.1630505597536; 
 Wed, 01 Sep 2021 07:13:17 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id s7sm21609190wra.75.2021.09.01.07.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:13:16 -0700 (PDT)
Date: Wed, 1 Sep 2021 16:13:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sven Peter <sven@svenpeter.dev>
Cc: Dmitry Osipenko <digetx@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory
 region specifier
Message-ID: <YS+Ke4Ip0InHSnHR@orome.fritz.box>
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <20210423163234.3651547-2-thierry.reding@gmail.com>
 <20210520220306.GA1976116@robh.at.kernel.org>
 <YLEgXyLBF8PEFNw2@orome.fritz.box>
 <YL+gHN4YZ4vt1vPk@orome.fritz.box>
 <YN4F/nH/9tDuWDnQ@orome.fritz.box>
 <7995b0ed-a277-ced1-b3d0-e0e7e02817a6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CgZ0BN1YYgKvAepP"
Content-Disposition: inline
In-Reply-To: <7995b0ed-a277-ced1-b3d0-e0e7e02817a6@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
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


--CgZ0BN1YYgKvAepP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 02, 2021 at 05:16:25PM +0300, Dmitry Osipenko wrote:
> 01.07.2021 21:14, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jun 08, 2021 at 06:51:40PM +0200, Thierry Reding wrote:
> >> On Fri, May 28, 2021 at 06:54:55PM +0200, Thierry Reding wrote:
> >>> On Thu, May 20, 2021 at 05:03:06PM -0500, Rob Herring wrote:
> >>>> On Fri, Apr 23, 2021 at 06:32:30PM +0200, Thierry Reding wrote:
> >>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>
> >>>>> Reserved memory region phandle references can be accompanied by a
> >>>>> specifier that provides additional information about how that speci=
fic
> >>>>> reference should be treated.
> >>>>>
> >>>>> One use-case is to mark a memory region as needing an identity mapp=
ing
> >>>>> in the system's IOMMU for the device that references the region. Th=
is is
> >>>>> needed for example when the bootloader has set up hardware (such as=
 a
> >>>>> display controller) to actively access a memory region (e.g. a boot
> >>>>> splash screen framebuffer) during boot. The operating system can us=
e the
> >>>>> identity mapping flag from the specifier to make sure an IOMMU iden=
tity
> >>>>> mapping is set up for the framebuffer before IOMMU translations are
> >>>>> enabled for the display controller.
> >>>>>
> >>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >>>>> ---
> >>>>>  .../reserved-memory/reserved-memory.txt       | 21 +++++++++++++++=
++++
> >>>>>  include/dt-bindings/reserved-memory.h         |  8 +++++++
> >>>>>  2 files changed, 29 insertions(+)
> >>>>>  create mode 100644 include/dt-bindings/reserved-memory.h
> >>>>
> >>>> Sorry for being slow on this. I have 2 concerns.
> >>>>
> >>>> First, this creates an ABI issue. A DT with cells in 'memory-region'=
=20
> >>>> will not be understood by an existing OS. I'm less concerned about t=
his=20
> >>>> if we address that with a stable fix. (Though I'm pretty sure we've=
=20
> >>>> naively added #?-cells in the past ignoring this issue.)
> >>>
> >>> A while ago I had proposed adding memory-region*s* as an alternative
> >>> name for memory-region to make the naming more consistent with other
> >>> types of properties (think clocks, resets, gpios, ...). If we added
> >>> that, we could easily differentiate between the "legacy" cases where
> >>> no #memory-region-cells was allowed and the new cases where it was.
> >>>
> >>>> Second, it could be the bootloader setting up the reserved region. I=
f a=20
> >>>> node already has 'memory-region', then adding more regions is more=
=20
> >>>> complicated compared to adding new properties. And defining what eac=
h=20
> >>>> memory-region entry is or how many in schemas is impossible.
> >>>
> >>> It's true that updating the property gets a bit complicated, but it's
> >>> not exactly rocket science. We really just need to splice the array. I
> >>> have a working implemention for this in U-Boot.
> >>>
> >>> For what it's worth, we could run into the same issue with any new
> >>> property that we add. Even if we renamed this to iommu-memory-region,
> >>> it's still possible that a bootloader may have to update this property
> >>> if it already exists (it could be hard-coded in DT, or it could have
> >>> been added by some earlier bootloader or firmware).
> >>>
> >>>> Both could be addressed with a new property. Perhaps something like=
=20
> >>>> 'iommu-memory-region =3D <&phandle>;'. I think the 'iommu' prefix is=
=20
> >>>> appropriate given this is entirely because of the IOMMU being in the=
=20
> >>>> mix. I might feel differently if we had other uses for cells, but I=
=20
> >>>> don't really see it in this case.=20
> >>>
> >>> I'm afraid that down the road we'll end up with other cases and then =
we
> >>> might proliferate a number of *-memory-region properties with varying
> >>> prefixes.
> >>>
> >>> I am aware of one other case where we might need something like this:=
 on
> >>> some Tegra SoCs we have audio processors that will access memory buff=
ers
> >>> using a DMA engine. These processors are booted from early firmware
> >>> using firmware from system memory. In order to avoid trashing the
> >>> firmware, we need to reserve memory. We can do this using reserved
> >>> memory nodes. However, the audio DMA engine also uses the SMMU, so we
> >>> need to make sure that the firmware memory is marked as reserved with=
in
> >>> the SMMU. This is similar to the identity mapping case, but not exact=
ly
> >>> the same. Instead of creating a 1:1 mapping, we just want that IOVA
> >>> region to be reserved (i.e. IOMMU_RESV_RESERVED instead of
> >>> IOMMU_RESV_DIRECT{,_RELAXABLE}).
> >>>
> >>> That would also fall into the IOMMU domain, but we can't reuse the
> >>> iommu-memory-region property for that because then we don't have enou=
gh
> >>> information to decide which type of reservation we need.
> >>>
> >>> We could obviously make iommu-memory-region take a specifier, but we
> >>> could just as well use memory-regions in that case since we have
> >>> something more generic anyway.
> >>>
> >>> With the #memory-region-cells proposal, we can easily extend the cell=
 in
> >>> the specifier with an additional MEMORY_REGION_IOMMU_RESERVE flag to
> >>> take that other use case into account. If we than also change to the =
new
> >>> memory-regions property name, we avoid the ABI issue (and we gain a b=
it
> >>> of consistency while at it).
> >>
> >> Ping? Rob, do you want me to add this second use-case to the patch
> >> series to make it more obvious that this isn't just a one-off thing? Or
> >> how do we proceed?
> >=20
> > Rob, given that additional use-case, do you want me to run with this
> > proposal and send out an updated series?
>=20
>=20
> What about variant with a "descriptor" properties that will describe
> each region:
>=20
> fb_desc: display-framebuffer-memory-descriptor {
> 	needs-identity-mapping;
> }
>=20
> display@52400000 {
> 	memory-region =3D <&fb ...>;
> 	memory-region-descriptor =3D <&fb_desc ...>;
> };
>=20
> It could be a more flexible/extendible variant.

This problem recently came up on #dri-devel again. Adding Alyssa and
Sven who are facing a similar challenge on their work on Apple M1 (if I
understood correctly). Also adding dri-devel for visibility since this
is a very common problem for display in particular.

On M1 the situation is slightly more complicated: the firmware will
allocate a couple of buffers (including the framebuffer) in high memory
(> 4 GiB) and use the IOMMU to map that into an IOVA region below 4 GiB
so that the display hardware can access it. This makes it impossible to
bypass the IOMMU like we do on other chips (in particular to work around
the fault-by-default policy of the ARM SMMU driver). It also means that
in addition to the simple reserved regions I mentioned we need for audio
use-cases and identity mapping use-cases we need for display on Tegra,
we now also need to be able to convey physical to IOVA mappings.

Fitting the latter into the original proposal sounds difficult. A quick
fix would've been to generate a mapping table in memory and pass that to
the kernel using a reserved-memory node (similar to what's done for
example on Tegra for the EMC frequency table on Tegra210) and mark it as
such using a special flag. But that then involves two layers of parsing,
which seems a bit suboptimal. Another way to shoehorn that into the
original proposal would've been to add flags for physical and virtual
address regions and use pairs to pass them using special flags. Again,
this is a bit wonky because it needs these to be carefully parsed and
matched up.

Another downside is that we now have a situation where some of these
regions are no longer "reserved-memory regions" in the traditional
sense. This would require an additional flag in the reserved-memory
region nodes to prevent the IOVA regions from being reserved. By the
way, this is something that would also be needed for the audio use-case
I mentioned before, because the physical memory at that address can
still be used by an operating system.

A more general solution would be to draw a bit from Dmitry's proposal
and introduce a new top-level "iov-reserved-memory" node. This could be
modelled on the existing reserved-memory node, except that the physical
memory pages for regions represented by child nodes would not be marked
as reserved. Only the IOVA range described by the region would be
reserved subsequently by the IOMMU framework and/or IOMMU driver.

The simplest case where we just want to reserve some IOVA region could
then be done like this:

	iov-reserved-memory {
		/*
		 * Probably safest to default to <2>, <2> here given
		 * that most IOMMUs support either > 32 bits of IAS
		 * or OAS.
		 */
		#address-cells =3D <2>;
		#size-cells =3D <2>;

		firmware: firmware@80000000 {
			reg =3D <0 0x80000000 0 0x01000000>;
		};
	};

	audio@30000000 {
		...
		iov-memory-regions =3D <&firmware>;
		...
	};

Mappings could be represented by an IOV reserved region taking a
reference to the reserved-region that they map:

	reserved-memory {
		#address-cells =3D <2>;
		#size-cells =3D <2>;

		/* 16 MiB of framebuffer at top-of-memory */
		framebuffer: framebuffer@1,ff000000 {
			reg =3D <0x1 0xff000000 0 0x01000000>;
			no-map;
		};
	};

	iov-reserved-memory {
		/* IOMMU supports only 32-bit output address space */
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		/* 16 MiB of framebuffer mapped to top of IOVA */
		fb: fb@ff000000 {
			reg =3D <0 0xff000000 0 0x01000000>;
			memory-region =3D <&framebuffer>;
		};
	};

	display@40000000 {
		...
		/* optional? */
		memory-region =3D <&framebuffer>;
		iov-memory-regions =3D <&fb>;
		...
	};

It's interesting how identity mapped regions now become a trivial
special case of mappings. All that is needed is to make the reg property
of the IOV reserved region correspond to the reg property of the normal
reserved region. Alternatively, as a small optimization for lazy people
like me, we could just allow these cases to omit the reg property and
instead inherit it from the referenced reserved region.

As the second example shows it might be convenient if memory-region
could be derived from iov-memory-regions. This could be useful for cases
where the driver wants to do something with the physical pages of the
reserved region (such as mapping them and copying out the framebuffer
data to another buffer so that the reserved memory can be recycled). If
we have the IOV reserved region, we could provide an API to extract the
physical reserved region (if it exists). That way we could avoid
referencing it twice in DT. Then again, there's something elegant about
the explicit second reference to. It indicates the intent that we may
want to use the region for something other than just the IOV mapping.

Anyway, this has been long enough. Let me know what you think. Alyssa,
Sven, it'd be interesting to hear if you think this could work as a
solution to the problem on M1.

Rob, I think you might like this alternative because it basically gets
rid of all the points in the original proposal that you were concerned
about. Let me know what you think.

Thierry

--CgZ0BN1YYgKvAepP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEvingACgkQ3SOs138+
s6F+ow//YnPM+AR6VAhKrlPkPORxrm02p6WcgAmgHGivyfuXHvH5k/VrV5p+5C6D
PGSDsglkTIDfjmGpDZ/9e+Tf2kfK5bolwqX59sVLlDw2PK50i33KBl3AmSqgvhfs
dAgKN0Apovh0s6egbQqgjhBEdp+MvMJw5Sx01tdzL/FWHcyCiSeNvedydE3fVDRq
24J0uVcgCUCD5BXaMhdFLKtauI5VJqNygJ6uSg/R/9gGUNzpRC3tSUBIY/gxbNZy
xSzV5c6WKueLcq1FzN0EhH8WaS/iZtxn6gZ94mPrQHjvS5VWIin+y6+0COuLft49
K+nzrH2kbUd3FlNMNXHs4kQLs6Iuuf4itMTRuhKoQOXXYnU+6CmJXYJjQT3u2TjE
1PkTBOHXe+nY5Nl2qvNWDJaqIr36N356XRlmoUoAR5IB0aWS24say49ZWXLjjTO/
gKWqKsVLb78SWjovVO8SgUALp8l0ieJctBdY0I5Vn8O1vgJQUNl5SPZCWq/QMhHV
wcxO7z6sTJ+4e1rSrC96ugEqitJHX/E+sdAbdTiSgw2POwpa7SZSzH88iLKL5AYa
U4aw8fbUDAs+vOIgz+QI9wZD7hfCBKIxhLo/tk1aSb2bcm5k7ITNcY4QDiYsfYYO
9GfPpsfE/QmNBu7GMHRCttpsCAtUK+m42xfCt9uMVYIBPEobLII=
=cCQy
-----END PGP SIGNATURE-----

--CgZ0BN1YYgKvAepP--
