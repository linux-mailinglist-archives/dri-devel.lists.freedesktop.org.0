Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C156D4AF6B8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97ABD10E374;
	Wed,  9 Feb 2022 16:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3F810E374
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:31:22 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u6so5287729lfc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 08:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=foufppXnpwJbUnc6fLTkzsPuvoTGcXVPdptrrze6E3U=;
 b=pUjInnwfd3xyYMfGGeieypp2kGKRuoSq6vVhsRFeIAXVE+p/Iw+9IOPGMTcR6xehql
 MpDl5YxVw3YvQTGvhF8QzXFloSH+7iedd0PT22vYlETeZ+DwuJTviWTvV0JudHrhOwlD
 jMRJS/FEAqmmNqmvoO9oxTx9oJzgZOSwBtUbpXGJwWCkfTLy0ksb0Zd6r0pPa8azZhx0
 xiA+Dw0uk73dsRLsQ2o7AoITGyKgFwa8Y02kYg7v9ICh7pU7u/YgqhNSqv+7kW1v4Ji1
 3lEiCUNqXsCgf1zuEEfm5i65lTzfIdCsMJ+u1ods7dD20OJh9w2RR3GsCyOlEflJBUdG
 46LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=foufppXnpwJbUnc6fLTkzsPuvoTGcXVPdptrrze6E3U=;
 b=GjAXX+S3R1eZwDHNC2pANJAiOVDokHRxpxcKsSUefot0nAvGJ6OnF6q9hL30uODtLC
 SrjUSG+VK66u68Ll6kTGo/GtdZGC4faaojA+1Ot8y8DaOPxXCyjIX4cff3OKIjy6HxwI
 bce0Vkvu1CAf73AjxPPf8o0kMzqTIl/ULJjuLDFvvLEDHgBTsGaIbyuUfqFamnuziZmE
 vdhbzP899mANjEOAPWGumbEbU1fqNy5YvS8vgoatKAFbjR4gdr8dMGLbpqxlhipfzstf
 ConbSI1UxnQP/fxuBdds7eHnJtEv/1BR+GSiq4Dx5pc3E5GEkVuK5rZK86xMJX9sPxuL
 4mvQ==
X-Gm-Message-State: AOAM5328RDq5WWjaF29TPF8YkguDRibSlV7Wjm3BcgpMYuKLTnRsvEIF
 xPGaGTYRy1yf2K7v4hdWhkQ=
X-Google-Smtp-Source: ABdhPJzgznRJ7rvHrp5MGwZVsWvYEriBXM2AyLb51vc4z5Vf4YXIYcC6/bH4jxgWIbdkBwB1eip9rg==
X-Received: by 2002:a05:6512:2214:: with SMTP id
 h20mr2163470lfu.285.1644424280074; 
 Wed, 09 Feb 2022 08:31:20 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id g34sm2433425lfv.82.2022.02.09.08.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 08:31:18 -0800 (PST)
Date: Wed, 9 Feb 2022 17:31:16 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory
 region specifier
Message-ID: <YgPsVAsEcUYKHNIj@orome>
References: <7995b0ed-a277-ced1-b3d0-e0e7e02817a6@gmail.com>
 <YS+Ke4Ip0InHSnHR@orome.fritz.box>
 <CAL_Jsq+TQeb56UbrO1xKFSb1yo0d8U29DPynw3_jQ6gH6Peatw@mail.gmail.com>
 <YTIogpQDJjqJUTkG@orome.fritz.box>
 <CAL_JsqKG4+n_eNj+at3m7WuAbeJ1Kyi0mYD=8-MaVjfhzdPwkA@mail.gmail.com>
 <YTJA2xARFuNUMgMc@orome.fritz.box>
 <CAL_JsqJWt6ZELEpMi+tS6S6S4MYyMHysAC2ce_CfDQFqjfgnGQ@mail.gmail.com>
 <YTelDHx2REIIvV/N@orome.fritz.box>
 <YUIPCxnyRutMS47/@orome.fritz.box>
 <20220206222700.GA1848@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="naLU3O6S1T/jZHNB"
Content-Disposition: inline
In-Reply-To: <20220206222700.GA1848@jannau.net>
User-Agent: Mutt/2.1.5 (31b18ae9) (2021-12-30)
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
Cc: Sven Peter <sven@svenpeter.dev>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--naLU3O6S1T/jZHNB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 06, 2022 at 11:27:00PM +0100, Janne Grunau wrote:
> On 2021-09-15 17:19:39 +0200, Thierry Reding wrote:
> > On Tue, Sep 07, 2021 at 07:44:44PM +0200, Thierry Reding wrote:
> > > On Tue, Sep 07, 2021 at 10:33:24AM -0500, Rob Herring wrote:
> > > > On Fri, Sep 3, 2021 at 10:36 AM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
> > > > >
> > > > > On Fri, Sep 03, 2021 at 09:36:33AM -0500, Rob Herring wrote:
> > > > > > On Fri, Sep 3, 2021 at 8:52 AM Thierry Reding <thierry.reding@g=
mail.com> wrote:
> > > > > > >
> > > > > > > On Fri, Sep 03, 2021 at 08:20:55AM -0500, Rob Herring wrote:
> > > > > > > >
> > > > > > > > Couldn't we keep this all in /reserved-memory? Just add an =
iova
> > > > > > > > version of reg. Perhaps abuse 'assigned-address' for this p=
urpose. The
> > > > > > > > issue I see would be handling reserved iova areas without a=
 physical
> > > > > > > > area. That can be handled with just a iova and no reg. We a=
lready have
> > > > > > > > a no reg case.
> > > > > > >
> > > > > > > I had thought about that initially. One thing I'm worried abo=
ut is that
> > > > > > > every child node in /reserved-memory will effectively cause t=
he memory
> > > > > > > that it described to be reserved. But we don't want that for =
regions
> > > > > > > that are "virtual only" (i.e. IOMMU reservations).
> > > > > >
> > > > > > By virtual only, you mean no physical mapping, just a region of
> > > > > > virtual space, right? For that we'd have no 'reg' and therefore=
 no
> > > > > > (physical) reservation by the OS. It's similar to non-static re=
gions.
> > > > > > You need a specific handler for them. We'd probably want a comp=
atible
> > > > > > as well for these virtual reservations.
> > > > >
> > > > > Yeah, these would be purely used for reserving regions in the IOV=
A so
> > > > > that they won't be used by the IOVA allocator. Typically these wo=
uld be
> > > > > used for cases where those addresses have some special meaning.
> > > > >
> > > > > Do we want something like:
> > > > >
> > > > >         compatible =3D "iommu-reserved";
> > > > >
> > > > > for these? Or would that need to be:
> > > > >
> > > > >         compatible =3D "linux,iommu-reserved";
> > > > >
> > > > > ? There seems to be a mix of vendor-prefix vs. non-vendor-prefix
> > > > > compatible strings in the reserved-memory DT bindings directory.
> > > >=20
> > > > I would not use 'linux,' here.
> > > >=20
> > > > >
> > > > > On the other hand, do we actually need the compatible string? Bec=
ause we
> > > > > don't really want to associate much extra information with this l=
ike we
> > > > > do for example with "shared-dma-pool". The logic to handle this w=
ould
> > > > > all be within the IOMMU framework. All we really need is for the
> > > > > standard reservation code to skip nodes that don't have a reg pro=
perty
> > > > > so we don't reserve memory for "virtual-only" allocations.
> > > >=20
> > > > It doesn't hurt to have one and I can imagine we might want to iter=
ate
> > > > over all the nodes. It's slightly easier and more common to iterate
> > > > over compatible nodes rather than nodes with some property.
> > > >=20
> > > > > > Are these being global in DT going to be a problem? Presumably =
we have
> > > > > > a virtual space per IOMMU. We'd know which IOMMU based on a dev=
ice's
> > > > > > 'iommus' and 'memory-region' properties, but within /reserved-m=
emory
> > > > > > we wouldn't be able to distinguish overlapping addresses from s=
eparate
> > > > > > address spaces. Or we could have 2 different IOVAs for 1 physic=
al
> > > > > > space. That could be solved with something like this:
> > > > > >
> > > > > > iommu-addresses =3D <&iommu1 <address cells> <size cells>>;
> > > > >
> > > > > The only case that would be problematic would be if we have overl=
apping
> > > > > physical regions, because that will probably trip up the standard=
 code.
> > > > >
> > > > > But this could also be worked around by looking at iommu-addresse=
s. For
> > > > > example, if we had something like this:
> > > > >
> > > > >         reserved-memory {
> > > > >                 fb_dc0: fb@80000000 {
> > > > >                         reg =3D <0x80000000 0x01000000>;
> > > > >                         iommu-addresses =3D <0xa0000000 0x0100000=
0>;
> > > > >                 };
> > > > >
> > > > >                 fb_dc1: fb@80000000 {
> > > >=20
> > > > You can't have 2 nodes with the same name (actually, you can, they
> > > > just get merged together). Different names with the same unit-addre=
ss
> > > > is a dtc warning. I'd really like to make that a full blown
> > > > overlapping region check.
> > >=20
> > > Right... so this would be a lot easier to deal with using that earlier
> > > proposal where the IOMMU regions were a separate thing and referencing
> > > the reserved-memory nodes. In those cases we could just have the
> > > physical reservation for the framebuffer once (so we don't get any
> > > duplicates or overlaps) and then have each IOVA reservation reference
> > > that to create the mapping.
> > >=20
> > > >=20
> > > > >                         reg =3D <0x80000000 0x01000000>;
> > > > >                         iommu-addresses =3D <0xb0000000 0x0100000=
0>;
> > > > >                 };
> > > > >         };
> > > > >
> > > > > We could make the code identify that this is for the same physical
> > > > > reservation (maybe make it so that reg needs to match exactly for=
 this
> > > > > to be recognized) but with different virtual allocations.
> > > > >
> > > > > On a side-note: do we really need to repeat the size? I'd think i=
f we
> > > > > want mappings then we'd likely want them for the whole reservatio=
n.
> > > >=20
> > > > Humm, I suppose not, but dropping it paints us into a corner if we
> > > > come up with wanting a different size later. You could have a carve=
out
> > > > for double/triple buffering your framebuffer, but the bootloader
> > > > framebuffer is only single buffered. So would you want actual size?
> > >=20
> > > Perhaps this needs to be a bit more verbose then. If we want the abil=
ity
> > > to create a mapping for only a partial reservation, I could imagine we
> > > may as well want one that doesn't start at the beginning. So perhaps =
an
> > > ever better solution would be to have a complete mapping, something t=
hat
> > > works similar to "ranges" perhaps, like so:
> > >=20
> > > 	fb@80000000 {
> > > 		reg =3D <0x80000000 0x01000000>;
> > > 		iommu-ranges =3D <0x80000000 0x01000000 0x80000000>;
> > > 	};
> > >=20
> > > That would be for a full identity mapping, but we could also have
> > > something along the lines of this:
> > >=20
> > > 	fb@80000000 {
> > > 		reg =3D <0x80000000 0x01000000>;
> > > 		iommu-ranges =3D <0x80100000 0x00100000 0xa0000000>;
> > > 	};
> > >=20
> > > So that would only map a 1 MiB chunk at offset 1 MiB (of the physical
> > > reservation) to I/O virtual address 0xa0000000.
> > >=20
> > > > > I'd like to keep references to IOMMUs out of this because they wo=
uld be
> > > > > duplicated. We will only use these nodes if they are referenced b=
y a
> > > > > device node that also has an iommus property. Also, the IOMMU ref=
erence
> > > > > itself isn't enough. We'd also need to support the complete speci=
fier
> > > > > because you can have things like SIDs in there to specify the exa=
ct
> > > > > address space that a device uses.
> > > > >
> > > > > Also, for some of these they may be reused independently of the I=
OMMU
> > > > > address space. For example the Tegra framebuffer identity mapping=
 can
> > > > > be used by either of the 2-4 display controllers, each with (at l=
east
> > > > > potentially) their own address space. But we don't want to have to
> > > > > describe the identity mapping separately for each display control=
ler.
> > > >=20
> > > > Okay, but I'd rather have to duplicate things in your case than not=
 be
> > > > able to express some other case.
> > >=20
> > > The earlier "separate iov-reserved-memory" proposal would be a good
> > > compromise here. It'd allow us to duplicate only the necessary bits
> > > (i.e. the IOVA mappings) but keep the common bits simple. And even
> > > the IOVA mappings could be shared for cases like identity mappings.
> > > See below for more on that.
> > >=20
> > > > > Another thing to consider is that these nodes will often be added=
 by
> > > > > firmware (e.g. firmware will allocate the framebuffer and set up =
the
> > > > > corresponding reserved memory region in DT). Wiring up references=
 like
> > > > > this would get very complicated very quickly.
> > > >=20
> > > > Yes.
> > > >=20
> > > > The using 'iommus' property option below can be optional and doesn't
> > > > have to be defined/supported now. Just trying to think ahead and not
> > > > be stuck with something that can't be extended.
> > >=20
> > > One other benefit of the separate iov-reserved-memory node would be t=
hat
> > > the iommus property could be simplified. If we have a physical
> > > reservation that needs to be accessed by multiple different display
> > > controllers, we'd end up with something fairly complex, such as this:
> > >=20
> > > 	fb: fb@80000000 {
> > > 		reg =3D <0x80000000 0x01000000>;
> > > 		iommus =3D <&dc0_iommu 0xa0000000 0x01000000>,
> > > 			 <&dc1_iommu 0xb0000000 0x01000000>,
> > > 			 <&dc2_iommu 0xc0000000 0x01000000>;
> > > 	};
> > >=20
> > > This would get even worse if we want to support partial mappings. Als=
o,
> > > it'd become quite complicated to correlate this with the memory-region
> > > references:
> > >=20
> > > 	dc0: dc@40000000 {
> > > 		...
> > > 		memory-region =3D <&fb>;
> > > 		iommus =3D <&dc0_iommu>;
> > > 		...
> > > 	};
> > >=20
> > > So now you have to go match up the phandle (and potentially specifier)
> > > in the iommus property of the disp0 node with an entry in the fb node=
's
> > > iommus property. That's all fairly complicated stuff.
> > >=20
> > > With separate iov-reserved-memory, this would be a bit more verbose, =
but
> > > each individual node would be simpler:
> > >=20
> > > 	reserved-memory {
> > > 		fb: fb@80000000 {
> > > 			reg =3D <0x80000000 0x01000000>;
> > > 		};
> > > 	};
> > >=20
> > > 	iov-reserved-memory {
> > > 		fb0: fb@80000000 {
> > > 			/* identity mapping, "reg" optional? */
> > > 			reg =3D <0x80000000 0x01000000>;
> > > 			memory-region =3D <&fb>;
> > > 		};
> > >=20
> > > 		fb1: fb@90000000 {
> > > 			/* but doesn't have to be */
> > > 			reg =3D <0x90000000 0x01000000>;
> > > 			memory-region =3D <&fb>;
> > > 		};
> > >=20
> > > 		fb2: fb@a0000000 {
> > > 			/* can be partial, too */
> > > 			ranges =3D <0x80000000 0x00800000 0xa0000000>;
> > > 			memory-region =3D <&fb>;
> > > 		};
> > > 	}
> > >=20
> > > 	dc0: dc@40000000 {
> > > 		iov-memory-regions =3D <&fb0>;
> > > 		/* optional? */
> > > 		memory-region =3D <&fb>;
> > > 		iommus =3D <&dc0_iommu>;
> > > 	};
> > >=20
> > > Alternatively, if we want to support partial mappings, we could repla=
ce
> > > those reg properties by ranges properties that I showed earlier. We m=
ay
> > > even want to support both. Use "reg" for virtual-only reservations and
> > > identity mappings, or "simple partial mappings" (that map a sub-region
> > > starting from the beginning). Identity mappings could still be
> > > simplified by just omitting the "reg" property. For more complicated
> > > mappings, such as the ones on M1, the "ranges" property could be used.
> > >=20
> > > Note how this looks a bit boilerplate-y, but it's actually really qui=
te
> > > simple to understand, even for humans, I think.
> > >=20
> > > Also, the phandles in this are comparatively easy to wire up because
> > > they can all be generated in a hierarchical way: generate physical
> > > reservation and store phandle, then generate I/O virtual reservation
> > > to reference that phandle and store the new phandle as well. Finally,
> > > wire this up to the display controller (using either the IOV phandle =
or
> > > both).
> > >=20
> > > Granted, this requires the addition of a new top-level node, but given
> > > how expressive this becomes, I think it might be worth a second
> > > consideration.
> >=20
> > I guess as a middle-ground between your suggestion and mine, we could
> > also move the IOV nodes back into reserved-memory. If we make sure the
> > names (together with unit-addresses) are unique, to support cases where
> > we want to identity map, or have multiple mappings at the same address.
> > So it'd look something like this:
> >=20
> > 	reserved-memory {
> > 		fb: fb@80000000 {
> > 			reg =3D <0x80000000 0x01000000>;
> > 		};
> >=20
> > 		audio-firmware@ff000000 {
> > 			/* perhaps add "iommu-reserved" for this case */
> > 			compatible =3D "iommu-mapping";
> > 			/*
> > 			 * no memory-region referencing a physical
> > 			 * reservation, indicates that this is an
> > 			 * IOMMU reservation, rather than a mapping
> > 			 /
> > 			reg =3D <0xff000000 0x01000000>;
> > 		};
> >=20
> > 		fb0: fb-mapping@80000000 {
> > 			compatible =3D "iommu-mapping";
> > 			/* identity mapping, "reg" optional? */
> > 			reg =3D <0x80000000 0x01000000>;
> > 			memory-region =3D <&fb>;
> > 		};
> >=20
> > 		fb1: fb-mapping@90000000 {
> > 			compatible =3D "iommu-mapping";
> > 			/* but doesn't have to be */
> > 			reg =3D <0x90000000 0x01000000>;
> > 			memory-region =3D <&fb>;
> > 		};
> >=20
> > 		fb2: fb-mapping@a0000000 {
> > 			compatible =3D "iommu-mapping";
> > 			/* can be partial, too */
> > 			ranges =3D <0xa0000000 0x00800000 0x80000000>;
> > 			memory-region =3D <&fb>;
> > 		};
> > 	}
> >=20
> > 	dc0: dc@40000000 {
> > 		memory-region =3D <&fb0>;
> > 		iommus =3D <&dc0_iommu>;
> > 	};
> >=20
> > What do you think?
>=20
> I converted the Apple M1 display controller driver to using reserved=20
> regions using these bindings. It is sufficient for the needs of the M1=20
> display controller which is so far the only device requiring this.

Thanks for trying this out. I've been meaning to resume this discussion
to finally get closure because we really want to enable this for various
Tegra SoCs.

> I encountered two problems with this bindings proposal:
>=20
> 1) It is impossible to express which iommu needs to be used if a device=
=20
> has multiple "iommus" specified. This is on the M1 only a theoretical=20
> problem as the display co-processor devices use a single iommu.

=46rom what I recall this is something that we don't fully support either
way. If you've got a struct device and you want to allocate DMA'able
memory, you can only pass that struct device to the DMA API upon
allocation but you have no way of specifying separate instances
depending on use-case.

> 2) The reserved regions can not easily looked up at iommu probe time. =20
> The Apple M1 iommu driver resets the iommu at probe. This breaks the=20
> framebuffer. The display controller appears to crash then an active=20
> scan-out framebuffer is unmapped. Resetting the iommu looks like a=20
> sensible approach though.
>=20
> To work around this I added custom property to the affected iommu node=20
> to avoid the reset. This doesn't feel correct since the reason to avoid=
=20
> the reset is that we have to maintain the reserved regions mapping until=
=20
> the display controller driver takes over.
> As far as I can see the only method to retrieve devices with reserved=20
> memory from the iommu is to iterate over all devices. This looks=20
> impractical. The M1 has over 20 distinct iommus.

Do I understand correctly that on the M1, the firmware sets up a mapping
in the IOMMU already and then you want to recreate that mapping after
the IOMMU driver has reset the IOMMU?

In that case, how do you make sure that you atomically transition from
the firmware mapping to the kernel mapping? As soon as you reset the
IOMMU, the display controller will cause IOMMU faults because its now
scanning out from an unmapped buffer, right?

So that approach of avoiding the reset doesn't seem wrong to me.
Obviously that's not altogether trivial to do either. Typically the
IOMMU mappings would be contained in system memory, so you'd have to
reserve those via reserved-memory nodes as well, etc.

> One way to avoid both problems would be to move the mappings to the=20
> iommu node as sub nodes. The device would then reference those.  This=20
> way the mapping is readily available at iommu probe time and adding=20
> iommu type specific parameters to map the region correctly is possible.
>=20
> The sample above would transfor to:
>=20
> 	reserved-memory {
> 		fb: fb@80000000 {
> 			reg =3D <0x80000000 0x01000000>;
> 		};
> 	};
>=20
> 	dc0_iommu: iommu@20000000 {
> 		#iommu-cells =3D <1>;
>=20
> 		fb0: fb-mapping@80000000 {
> 			compatible =3D "iommu-mapping";
> 			/* identity mapping, "reg" optional? */
> 			reg =3D <0x80000000 0x01000000>;
> 			memory-region =3D <&fb>;
> 			device-id =3D <0>; /* for #iommu-cells*/
> 		};
>=20
> 		fb1: fb-mapping@90000000 {
> 			compatible =3D "iommu-mapping";
> 			/* but doesn't have to be */
> 			reg =3D <0x90000000 0x01000000>;
> 			memory-region =3D <&fb>;
> 			device-id =3D <1>; /* for #iommu-cells*/
> 		};
> 	};
>=20
> 	dc0: dc@40000000 {
> 		iommu-region =3D <&fb0>;
> 		iommus =3D <&dc0_iommu 0>;
> 	};
>=20
> Does anyone see problems with this approach or can think of something=20
> better?

The device tree description of this looks a bit weird because it
sprinkles things all around. For instance now we've got the "stream ID"
(i.e. what you seem to be referring to as "device-id") in two places,
once in the iommus property of the DC node and once in the mapping.

Would it work if you added back-references to the devices that are
active on boot to the IOMMU node? Something along these lines:

	reserved-memory {
		fb: fb@80000000 {
			reg =3D <0x80000000 0x01000000>;
		};
	};

	dc0_iommu: iommu@20000000 {
		#iommu-cells =3D <1>;

		mapped-devices =3D <&dc0>;
	};

	dc0: dc@40000000 {
		memory-region =3D <&fb0>;
		iommus =3D <&dc0_iommu 0>;
	};

Depending on how you look at it that's a circular dependency, but it
won't be in practice. It makes things a bit more compact and puts the
data where it belongs.

Thierry

--naLU3O6S1T/jZHNB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmID7FAACgkQ3SOs138+
s6FlvQ//cCUsUD1nun7V91Xir/YSS19Ifv6V8Gade6564D6R5uuyazCR9QgQFzVs
1D5OiJ8CTpfNUv8W4tIipJzhL9n2ap10mp77fHPvGmU8L1gaAGhCcNeCugbjRQmd
GdBa/SLa8NgTKPUo8dOFpw2E8ULzXhzSehHvCYNfEQrAPv+SC52fJHLAtdEMNbsL
N2akxsJGZhMepKkBnawaNqWzo2VvsG/tfTaB0dUJ5d/FitMVRJMFOzggMAWcRMuy
Zi1FGH2xxTB2stqCXePsyKikuVzVv5N0DnJRJZLS3zp+79EGknIr8AcCTvj8B+QC
Bg46soRMWxFDV1ny//cKhJjbtGK8tvrA/3QEhH1aZ5X4BZCBjgt5CkgC9j+cy+b3
j10FmmzIqRZBlW+4lOa2rjE+IfXmxxnf7GTwFOj0L9apbHK5gRBz7+m5wgpH6914
bsT89r3jMYXagul8Y1YfLVMUrzIwhnOLZ7Jcb2xJK+bx/QYhnwOmSdudJBGNPR6S
CQC8bInIRvC3DGgn4mDpA9fLpldRBAoMSvZdjPnjrI7J4W1doAyb2OlPep39k4vo
6R2iyLMg707baiFd1AUXdLRg3ZAerPo+C0WA9zpS+wGyYiNzOEOCDCskVMj7IVZw
ni6tHjVSOE/Qx6c18a6xS/Pbhslrk2j1oA4WqNMe2hRC2VQyssk=
=CSp7
-----END PGP SIGNATURE-----

--naLU3O6S1T/jZHNB--
