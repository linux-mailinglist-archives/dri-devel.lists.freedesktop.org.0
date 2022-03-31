Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 849AB4EDEC0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 18:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C393B10F40A;
	Thu, 31 Mar 2022 16:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDAB10F40A
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:25:11 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id j15so390239eje.9
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 09:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cu1l/8PgdxMWyzuZznsggXHzKS6a3wbdW116MMUScCM=;
 b=M2lPiF2nuJevzAoT9OTJNxVkSi7JLdTynVTeHULvgf+vZ8oIA+w2zikb6VVMHAEUn1
 JiM76RCK0Gurg7s64egfv31fjf9XO+5oJt5Ic1ay0j7vw5MB+lC0olEz29eKeYOcSaVE
 0KXyV33BgGU4gBZpUq5VmM+LnWa3aqj8EF1j1aDTpIm5ukktWyUdlp+hYP9j55u+PkEY
 Py5Hnr9xvoDItD69znI7140RincPcCq5bpNEm2vc0FPYmAHLbXkquyRwxgQ/VKP9XI2E
 9SkbmwGJDc5JRyBMYwGeh1Te1QbFBS45diHkvqtjnzS6MP+1Su8MXwErwfWzj9wV4LOp
 WLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cu1l/8PgdxMWyzuZznsggXHzKS6a3wbdW116MMUScCM=;
 b=zewpH1oKTW2sEU9yjBRLAGThvOL5aFHq5gJTA+4DVUl9RMDS8g1oXaVHJo7aWOaEwN
 E++qCXcXWG8/Xzce+0jHcfzVr/qNjFT+Ow8tTr3nJ1gDqFWgHtCPAu+VGE6jwYynT2OK
 Ybu9eoKvfFhWWuWayMznsOBNmEk9CMxi2zOFo3a5H832qL453M3IdCbJjnuPOpMxco1W
 MUKV8S/RW/t6pqNQf9vomJgBbgz9bSZZNjrYbVeFlfGKMsyfDy5C91ry9C80OnSggM3j
 Kj9TLlS+jw65b6bGNzC/3/m+h+fQ5V1CMmzsTVy2qmml0DG89mzdcuftUEJdIWk9s3i8
 pEJA==
X-Gm-Message-State: AOAM533I0e3jlScZElwXs1rARzvdjQ1cNyMnBuReNvQmjZ9cBivhcYyI
 LmLx+V8lr80v7W7LFX0h3Xc=
X-Google-Smtp-Source: ABdhPJxmejwpcRbUX2eKd1Wr/KCtQM3cY7rv6DEY8AnfjnD8rrdVvMpG4jWNQS5CimgwFAmEw2otuQ==
X-Received: by 2002:a17:907:2ce3:b0:6df:b0ad:1f1a with SMTP id
 hz3-20020a1709072ce300b006dfb0ad1f1amr5641527ejc.392.1648743909304; 
 Thu, 31 Mar 2022 09:25:09 -0700 (PDT)
Received: from orome ([62.96.65.119]) by smtp.gmail.com with ESMTPSA id
 oz2-20020a170906cd0200b006e096dd0611sm8050818ejb.45.2022.03.31.09.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 09:25:08 -0700 (PDT)
Date: Thu, 31 Mar 2022 18:25:05 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Janne Grunau <j@jannau.net>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: reserved-memory: Document memory
 region specifier
Message-ID: <YkXV4TWetsl4Rh5A@orome>
References: <CAL_Jsq+TQeb56UbrO1xKFSb1yo0d8U29DPynw3_jQ6gH6Peatw@mail.gmail.com>
 <YTIogpQDJjqJUTkG@orome.fritz.box>
 <CAL_JsqKG4+n_eNj+at3m7WuAbeJ1Kyi0mYD=8-MaVjfhzdPwkA@mail.gmail.com>
 <YTJA2xARFuNUMgMc@orome.fritz.box>
 <CAL_JsqJWt6ZELEpMi+tS6S6S4MYyMHysAC2ce_CfDQFqjfgnGQ@mail.gmail.com>
 <YTelDHx2REIIvV/N@orome.fritz.box>
 <YUIPCxnyRutMS47/@orome.fritz.box>
 <20220206222700.GA1848@jannau.net> <YgPsVAsEcUYKHNIj@orome>
 <20220210231544.GC1848@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7Tuyp66Xcb8lGb33"
Content-Disposition: inline
In-Reply-To: <20220210231544.GC1848@jannau.net>
User-Agent: Mutt/2.2.1 (c8109e14) (2022-02-19)
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
Cc: devicetree@vger.kernel.org, Sven Peter <sven@svenpeter.dev>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Krishna Reddy <vdumpa@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7Tuyp66Xcb8lGb33
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 12:15:44AM +0100, Janne Grunau wrote:
> On 2022-02-09 17:31:16 +0100, Thierry Reding wrote:
> > On Sun, Feb 06, 2022 at 11:27:00PM +0100, Janne Grunau wrote:
> > > On 2021-09-15 17:19:39 +0200, Thierry Reding wrote:
> > > > On Tue, Sep 07, 2021 at 07:44:44PM +0200, Thierry Reding wrote:
> > > > > On Tue, Sep 07, 2021 at 10:33:24AM -0500, Rob Herring wrote:
> > > > > > On Fri, Sep 3, 2021 at 10:36 AM Thierry Reding <thierry.reding@=
gmail.com> wrote:
> > > > > > >
> > > > > > > On Fri, Sep 03, 2021 at 09:36:33AM -0500, Rob Herring wrote:
> > > > > > > > On Fri, Sep 3, 2021 at 8:52 AM Thierry Reding <thierry.redi=
ng@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, Sep 03, 2021 at 08:20:55AM -0500, Rob Herring wro=
te:
> > > > > > > > > >
> > > > > > > > > > Couldn't we keep this all in /reserved-memory? Just add=
 an iova
> > > > > > > > > > version of reg. Perhaps abuse 'assigned-address' for th=
is purpose. The
> > > > > > > > > > issue I see would be handling reserved iova areas witho=
ut a physical
> > > > > > > > > > area. That can be handled with just a iova and no reg. =
We already have
> > > > > > > > > > a no reg case.
> > > > > > > > >
> > > > > > > > > I had thought about that initially. One thing I'm worried=
 about is that
> > > > > > > > > every child node in /reserved-memory will effectively cau=
se the memory
> > > > > > > > > that it described to be reserved. But we don't want that =
for regions
> > > > > > > > > that are "virtual only" (i.e. IOMMU reservations).
> > > > > > > >
> > > > > > > > By virtual only, you mean no physical mapping, just a regio=
n of
> > > > > > > > virtual space, right? For that we'd have no 'reg' and there=
fore no
> > > > > > > > (physical) reservation by the OS. It's similar to non-stati=
c regions.
> > > > > > > > You need a specific handler for them. We'd probably want a =
compatible
> > > > > > > > as well for these virtual reservations.
> > > > > > >
> > > > > > > Yeah, these would be purely used for reserving regions in the=
 IOVA so
> > > > > > > that they won't be used by the IOVA allocator. Typically thes=
e would be
> > > > > > > used for cases where those addresses have some special meanin=
g.
> > > > > > >
> > > > > > > Do we want something like:
> > > > > > >
> > > > > > >         compatible =3D "iommu-reserved";
> > > > > > >
> > > > > > > for these? Or would that need to be:
> > > > > > >
> > > > > > >         compatible =3D "linux,iommu-reserved";
> > > > > > >
> > > > > > > ? There seems to be a mix of vendor-prefix vs. non-vendor-pre=
fix
> > > > > > > compatible strings in the reserved-memory DT bindings directo=
ry.
> > > > > >=20
> > > > > > I would not use 'linux,' here.
> > > > > >=20
> > > > > > >
> > > > > > > On the other hand, do we actually need the compatible string?=
 Because we
> > > > > > > don't really want to associate much extra information with th=
is like we
> > > > > > > do for example with "shared-dma-pool". The logic to handle th=
is would
> > > > > > > all be within the IOMMU framework. All we really need is for =
the
> > > > > > > standard reservation code to skip nodes that don't have a reg=
 property
> > > > > > > so we don't reserve memory for "virtual-only" allocations.
> > > > > >=20
> > > > > > It doesn't hurt to have one and I can imagine we might want to =
iterate
> > > > > > over all the nodes. It's slightly easier and more common to ite=
rate
> > > > > > over compatible nodes rather than nodes with some property.
> > > > > >=20
> > > > > > > > Are these being global in DT going to be a problem? Presuma=
bly we have
> > > > > > > > a virtual space per IOMMU. We'd know which IOMMU based on a=
 device's
> > > > > > > > 'iommus' and 'memory-region' properties, but within /reserv=
ed-memory
> > > > > > > > we wouldn't be able to distinguish overlapping addresses fr=
om separate
> > > > > > > > address spaces. Or we could have 2 different IOVAs for 1 ph=
ysical
> > > > > > > > space. That could be solved with something like this:
> > > > > > > >
> > > > > > > > iommu-addresses =3D <&iommu1 <address cells> <size cells>>;
> > > > > > >
> > > > > > > The only case that would be problematic would be if we have o=
verlapping
> > > > > > > physical regions, because that will probably trip up the stan=
dard code.
> > > > > > >
> > > > > > > But this could also be worked around by looking at iommu-addr=
esses. For
> > > > > > > example, if we had something like this:
> > > > > > >
> > > > > > >         reserved-memory {
> > > > > > >                 fb_dc0: fb@80000000 {
> > > > > > >                         reg =3D <0x80000000 0x01000000>;
> > > > > > >                         iommu-addresses =3D <0xa0000000 0x010=
00000>;
> > > > > > >                 };
> > > > > > >
> > > > > > >                 fb_dc1: fb@80000000 {
> > > > > >=20
> > > > > > You can't have 2 nodes with the same name (actually, you can, t=
hey
> > > > > > just get merged together). Different names with the same unit-a=
ddress
> > > > > > is a dtc warning. I'd really like to make that a full blown
> > > > > > overlapping region check.
> > > > >=20
> > > > > Right... so this would be a lot easier to deal with using that ea=
rlier
> > > > > proposal where the IOMMU regions were a separate thing and refere=
ncing
> > > > > the reserved-memory nodes. In those cases we could just have the
> > > > > physical reservation for the framebuffer once (so we don't get any
> > > > > duplicates or overlaps) and then have each IOVA reservation refer=
ence
> > > > > that to create the mapping.
> > > > >=20
> > > > > >=20
> > > > > > >                         reg =3D <0x80000000 0x01000000>;
> > > > > > >                         iommu-addresses =3D <0xb0000000 0x010=
00000>;
> > > > > > >                 };
> > > > > > >         };
> > > > > > >
> > > > > > > We could make the code identify that this is for the same phy=
sical
> > > > > > > reservation (maybe make it so that reg needs to match exactly=
 for this
> > > > > > > to be recognized) but with different virtual allocations.
> > > > > > >
> > > > > > > On a side-note: do we really need to repeat the size? I'd thi=
nk if we
> > > > > > > want mappings then we'd likely want them for the whole reserv=
ation.
> > > > > >=20
> > > > > > Humm, I suppose not, but dropping it paints us into a corner if=
 we
> > > > > > come up with wanting a different size later. You could have a c=
arveout
> > > > > > for double/triple buffering your framebuffer, but the bootloader
> > > > > > framebuffer is only single buffered. So would you want actual s=
ize?
> > > > >=20
> > > > > Perhaps this needs to be a bit more verbose then. If we want the =
ability
> > > > > to create a mapping for only a partial reservation, I could imagi=
ne we
> > > > > may as well want one that doesn't start at the beginning. So perh=
aps an
> > > > > ever better solution would be to have a complete mapping, somethi=
ng that
> > > > > works similar to "ranges" perhaps, like so:
> > > > >=20
> > > > > 	fb@80000000 {
> > > > > 		reg =3D <0x80000000 0x01000000>;
> > > > > 		iommu-ranges =3D <0x80000000 0x01000000 0x80000000>;
> > > > > 	};
> > > > >=20
> > > > > That would be for a full identity mapping, but we could also have
> > > > > something along the lines of this:
> > > > >=20
> > > > > 	fb@80000000 {
> > > > > 		reg =3D <0x80000000 0x01000000>;
> > > > > 		iommu-ranges =3D <0x80100000 0x00100000 0xa0000000>;
> > > > > 	};
> > > > >=20
> > > > > So that would only map a 1 MiB chunk at offset 1 MiB (of the phys=
ical
> > > > > reservation) to I/O virtual address 0xa0000000.
> > > > >=20
> > > > > > > I'd like to keep references to IOMMUs out of this because the=
y would be
> > > > > > > duplicated. We will only use these nodes if they are referenc=
ed by a
> > > > > > > device node that also has an iommus property. Also, the IOMMU=
 reference
> > > > > > > itself isn't enough. We'd also need to support the complete s=
pecifier
> > > > > > > because you can have things like SIDs in there to specify the=
 exact
> > > > > > > address space that a device uses.
> > > > > > >
> > > > > > > Also, for some of these they may be reused independently of t=
he IOMMU
> > > > > > > address space. For example the Tegra framebuffer identity map=
ping can
> > > > > > > be used by either of the 2-4 display controllers, each with (=
at least
> > > > > > > potentially) their own address space. But we don't want to ha=
ve to
> > > > > > > describe the identity mapping separately for each display con=
troller.
> > > > > >=20
> > > > > > Okay, but I'd rather have to duplicate things in your case than=
 not be
> > > > > > able to express some other case.
> > > > >=20
> > > > > The earlier "separate iov-reserved-memory" proposal would be a go=
od
> > > > > compromise here. It'd allow us to duplicate only the necessary bi=
ts
> > > > > (i.e. the IOVA mappings) but keep the common bits simple. And even
> > > > > the IOVA mappings could be shared for cases like identity mapping=
s.
> > > > > See below for more on that.
> > > > >=20
> > > > > > > Another thing to consider is that these nodes will often be a=
dded by
> > > > > > > firmware (e.g. firmware will allocate the framebuffer and set=
 up the
> > > > > > > corresponding reserved memory region in DT). Wiring up refere=
nces like
> > > > > > > this would get very complicated very quickly.
> > > > > >=20
> > > > > > Yes.
> > > > > >=20
> > > > > > The using 'iommus' property option below can be optional and do=
esn't
> > > > > > have to be defined/supported now. Just trying to think ahead an=
d not
> > > > > > be stuck with something that can't be extended.
> > > > >=20
> > > > > One other benefit of the separate iov-reserved-memory node would =
be that
> > > > > the iommus property could be simplified. If we have a physical
> > > > > reservation that needs to be accessed by multiple different displ=
ay
> > > > > controllers, we'd end up with something fairly complex, such as t=
his:
> > > > >=20
> > > > > 	fb: fb@80000000 {
> > > > > 		reg =3D <0x80000000 0x01000000>;
> > > > > 		iommus =3D <&dc0_iommu 0xa0000000 0x01000000>,
> > > > > 			 <&dc1_iommu 0xb0000000 0x01000000>,
> > > > > 			 <&dc2_iommu 0xc0000000 0x01000000>;
> > > > > 	};
> > > > >=20
> > > > > This would get even worse if we want to support partial mappings.=
 Also,
> > > > > it'd become quite complicated to correlate this with the memory-r=
egion
> > > > > references:
> > > > >=20
> > > > > 	dc0: dc@40000000 {
> > > > > 		...
> > > > > 		memory-region =3D <&fb>;
> > > > > 		iommus =3D <&dc0_iommu>;
> > > > > 		...
> > > > > 	};
> > > > >=20
> > > > > So now you have to go match up the phandle (and potentially speci=
fier)
> > > > > in the iommus property of the disp0 node with an entry in the fb =
node's
> > > > > iommus property. That's all fairly complicated stuff.
> > > > >=20
> > > > > With separate iov-reserved-memory, this would be a bit more verbo=
se, but
> > > > > each individual node would be simpler:
> > > > >=20
> > > > > 	reserved-memory {
> > > > > 		fb: fb@80000000 {
> > > > > 			reg =3D <0x80000000 0x01000000>;
> > > > > 		};
> > > > > 	};
> > > > >=20
> > > > > 	iov-reserved-memory {
> > > > > 		fb0: fb@80000000 {
> > > > > 			/* identity mapping, "reg" optional? */
> > > > > 			reg =3D <0x80000000 0x01000000>;
> > > > > 			memory-region =3D <&fb>;
> > > > > 		};
> > > > >=20
> > > > > 		fb1: fb@90000000 {
> > > > > 			/* but doesn't have to be */
> > > > > 			reg =3D <0x90000000 0x01000000>;
> > > > > 			memory-region =3D <&fb>;
> > > > > 		};
> > > > >=20
> > > > > 		fb2: fb@a0000000 {
> > > > > 			/* can be partial, too */
> > > > > 			ranges =3D <0x80000000 0x00800000 0xa0000000>;
> > > > > 			memory-region =3D <&fb>;
> > > > > 		};
> > > > > 	}
> > > > >=20
> > > > > 	dc0: dc@40000000 {
> > > > > 		iov-memory-regions =3D <&fb0>;
> > > > > 		/* optional? */
> > > > > 		memory-region =3D <&fb>;
> > > > > 		iommus =3D <&dc0_iommu>;
> > > > > 	};
> > > > >=20
> > > > > Alternatively, if we want to support partial mappings, we could r=
eplace
> > > > > those reg properties by ranges properties that I showed earlier. =
We may
> > > > > even want to support both. Use "reg" for virtual-only reservation=
s and
> > > > > identity mappings, or "simple partial mappings" (that map a sub-r=
egion
> > > > > starting from the beginning). Identity mappings could still be
> > > > > simplified by just omitting the "reg" property. For more complica=
ted
> > > > > mappings, such as the ones on M1, the "ranges" property could be =
used.
> > > > >=20
> > > > > Note how this looks a bit boilerplate-y, but it's actually really=
 quite
> > > > > simple to understand, even for humans, I think.
> > > > >=20
> > > > > Also, the phandles in this are comparatively easy to wire up beca=
use
> > > > > they can all be generated in a hierarchical way: generate physical
> > > > > reservation and store phandle, then generate I/O virtual reservat=
ion
> > > > > to reference that phandle and store the new phandle as well. Fina=
lly,
> > > > > wire this up to the display controller (using either the IOV phan=
dle or
> > > > > both).
> > > > >=20
> > > > > Granted, this requires the addition of a new top-level node, but =
given
> > > > > how expressive this becomes, I think it might be worth a second
> > > > > consideration.
> > > >=20
> > > > I guess as a middle-ground between your suggestion and mine, we cou=
ld
> > > > also move the IOV nodes back into reserved-memory. If we make sure =
the
> > > > names (together with unit-addresses) are unique, to support cases w=
here
> > > > we want to identity map, or have multiple mappings at the same addr=
ess.
> > > > So it'd look something like this:
> > > >=20
> > > > 	reserved-memory {
> > > > 		fb: fb@80000000 {
> > > > 			reg =3D <0x80000000 0x01000000>;
> > > > 		};
> > > >=20
> > > > 		audio-firmware@ff000000 {
> > > > 			/* perhaps add "iommu-reserved" for this case */
> > > > 			compatible =3D "iommu-mapping";
> > > > 			/*
> > > > 			 * no memory-region referencing a physical
> > > > 			 * reservation, indicates that this is an
> > > > 			 * IOMMU reservation, rather than a mapping
> > > > 			 /
> > > > 			reg =3D <0xff000000 0x01000000>;
> > > > 		};
> > > >=20
> > > > 		fb0: fb-mapping@80000000 {
> > > > 			compatible =3D "iommu-mapping";
> > > > 			/* identity mapping, "reg" optional? */
> > > > 			reg =3D <0x80000000 0x01000000>;
> > > > 			memory-region =3D <&fb>;
> > > > 		};
> > > >=20
> > > > 		fb1: fb-mapping@90000000 {
> > > > 			compatible =3D "iommu-mapping";
> > > > 			/* but doesn't have to be */
> > > > 			reg =3D <0x90000000 0x01000000>;
> > > > 			memory-region =3D <&fb>;
> > > > 		};
> > > >=20
> > > > 		fb2: fb-mapping@a0000000 {
> > > > 			compatible =3D "iommu-mapping";
> > > > 			/* can be partial, too */
> > > > 			ranges =3D <0xa0000000 0x00800000 0x80000000>;
> > > > 			memory-region =3D <&fb>;
> > > > 		};
> > > > 	}
> > > >=20
> > > > 	dc0: dc@40000000 {
> > > > 		memory-region =3D <&fb0>;
> > > > 		iommus =3D <&dc0_iommu>;
> > > > 	};
> > > >=20
> > > > What do you think?
> > >=20
> > > I converted the Apple M1 display controller driver to using reserved=
=20
> > > regions using these bindings. It is sufficient for the needs of the M=
1=20
> > > display controller which is so far the only device requiring this.
> >=20
> > Thanks for trying this out. I've been meaning to resume this discussion
> > to finally get closure because we really want to enable this for various
> > Tegra SoCs.
> >=20
> > > I encountered two problems with this bindings proposal:
> > >=20
> > > 1) It is impossible to express which iommu needs to be used if a devi=
ce=20
> > > has multiple "iommus" specified. This is on the M1 only a theoretical=
=20
> > > problem as the display co-processor devices use a single iommu.
> >=20
> > From what I recall this is something that we don't fully support either
> > way. If you've got a struct device and you want to allocate DMA'able
> > memory, you can only pass that struct device to the DMA API upon
> > allocation but you have no way of specifying separate instances
> > depending on use-case.
>=20
> Ok, let's us ignore then my complicated proposal. It is not a problem we=
=20
> need to solve for the M1.
>=20
> > > 2) The reserved regions can not easily looked up at iommu probe=20
> > > time.  The Apple M1 iommu driver resets the iommu at probe. This=20
> > > breaks the framebuffer. The display controller appears to crash then=
=20
> > > an active scan-out framebuffer is unmapped. Resetting the iommu=20
> > > looks like a sensible approach though.
> > >=20
> > > To work around this I added custom property to the affected iommu nod=
e=20
> > > to avoid the reset. This doesn't feel correct since the reason to avo=
id=20
> > > the reset is that we have to maintain the reserved regions mapping un=
til=20
> > > the display controller driver takes over.
> > > As far as I can see the only method to retrieve devices with reserved=
=20
> > > memory from the iommu is to iterate over all devices. This looks=20
> > > impractical. The M1 has over 20 distinct iommus.
> >=20
> > Do I understand correctly that on the M1, the firmware sets up a mapping
> > in the IOMMU already and then you want to recreate that mapping after
> > the IOMMU driver has reset the IOMMU?
>=20
> The mappings are already set up by firmware as it uses the frame buffer=
=20
> already itself. We need to make the kernel aware of the existing mapping=
=20
> so it can use the IOMMU. Using reserved memory regions and mappings=20
> seems to be clean way to do this. We want to reset IOMMUs without=20
> pre-existing mappings (the M1 has over 20 IOMMUs). We need a way to=20
> identify the two IOMMUs which must not be reseted at driver probe time. =
=20
> A simple property in the IOMMU node would be enough. It would duplicate=
=20
> information though since the only reason why we can't reset the IOMMU is=
=20
> the pre-existing mapping
>=20
> > In that case, how do you make sure that you atomically transition from
> > the firmware mapping to the kernel mapping? As soon as you reset the
> > IOMMU, the display controller will cause IOMMU faults because its now
> > scanning out from an unmapped buffer, right?
>=20
> We are replacing the entire firmware managed page table with a kernel=20
> managed one with a TTBR MMIO register write. The second IOMMU with=20
> pre-existing mapping has unfortunately the TTBR locked. Dealing with=20
> this is more complicated but the device using this IOMMU appears to
> sleep.
>=20
> > So that approach of avoiding the reset doesn't seem wrong to me.
> > Obviously that's not altogether trivial to do either. Typically the
> > IOMMU mappings would be contained in system memory, so you'd have to
> > reserve those via reserved-memory nodes as well, etc.
>=20
> The system memory is currently not expressed as reserved-memory but=20
> simply outside of the specified memory.
> =20
> > > One way to avoid both problems would be to move the mappings to the=
=20
> > > iommu node as sub nodes. The device would then reference those. =20
> > > This way the mapping is readily available at iommu probe time and=20
> > > adding iommu type specific parameters to map the region correctly is=
=20
> > > possible.
> > >=20
> > > The sample above would transfor to:
> > >=20
> > > 	reserved-memory {
> > > 		fb: fb@80000000 {
> > > 			reg =3D <0x80000000 0x01000000>;
> > > 		};
> > > 	};
> > >=20
> > > 	dc0_iommu: iommu@20000000 {
> > > 		#iommu-cells =3D <1>;
> > >=20
> > > 		fb0: fb-mapping@80000000 {
> > > 			compatible =3D "iommu-mapping";
> > > 			/* identity mapping, "reg" optional? */
> > > 			reg =3D <0x80000000 0x01000000>;
> > > 			memory-region =3D <&fb>;
> > > 			device-id =3D <0>; /* for #iommu-cells*/
> > > 		};
> > >=20
> > > 		fb1: fb-mapping@90000000 {
> > > 			compatible =3D "iommu-mapping";
> > > 			/* but doesn't have to be */
> > > 			reg =3D <0x90000000 0x01000000>;
> > > 			memory-region =3D <&fb>;
> > > 			device-id =3D <1>; /* for #iommu-cells*/
> > > 		};
> > > 	};
> > >=20
> > > 	dc0: dc@40000000 {
> > > 		iommu-region =3D <&fb0>;
> > > 		iommus =3D <&dc0_iommu 0>;
> > > 	};
> > >=20
> > > Does anyone see problems with this approach or can think of something=
=20
> > > better?
> >=20
> > The device tree description of this looks a bit weird because it
> > sprinkles things all around. For instance now we've got the "stream ID"
> > (i.e. what you seem to be referring to as "device-id") in two places,
> > once in the iommus property of the DC node and once in the mapping.
>=20
> Yes, stream_id would be the device-id. It is the term used in the=20
> apple-dart IOMMU driver. It is duplicated to deal with the multiple=20
> IOMMU problem. Let's ignore that and scrape my proposal.
> =20
> > Would it work if you added back-references to the devices that are
> > active on boot to the IOMMU node? Something along these lines:
> >=20
> > 	reserved-memory {
> > 		fb: fb@80000000 {
> > 			reg =3D <0x80000000 0x01000000>;
> > 		};
> > 	};
> >=20
> > 	dc0_iommu: iommu@20000000 {
> > 		#iommu-cells =3D <1>;
> >=20
> > 		mapped-devices =3D <&dc0>;
> > 	};
> >=20
> > 	dc0: dc@40000000 {
> > 		memory-region =3D <&fb0>;
> > 		iommus =3D <&dc0_iommu 0>;
> > 	};
> >=20
> > Depending on how you look at it that's a circular dependency, but it
> > won't be in practice. It makes things a bit more compact and puts the
> > data where it belongs.
>=20
> Yes, this works for the Apple M1 display co-processor. I've changed the=
=20
> dts and my apple-dart private parsing code to use "mapped-devices"=20
> back-references and it works as before. We probably need an automated=20
> check to ensure the references between device and IOMMU remains=20
> consistent.

Circling back to this... again. I've been thinking about this some more
and have come up with a mix between what Rob, Janne and I had proposed.
This is how it would look (based on Tegra210):

	reserved-memory {
		fb: framebuffer@80000000 {
			/*
			 * Physical memory region that is reserved. If
			 * this property is omitted, this region should
			 * be treated as an IOVA reservation.
			 */
			reg =3D <0x80000000 0x01000000>;

			/*
			 * Create 1:1 mapping for display controller.
			 *
			 * Note how instead of the IOMMU reference we
			 * actually pass the device reference here. This
			 * combines the "mapped-devices" property that
			 * was proposed earlier and makes it easier to
			 * find the device that needs this mapping. The
			 * IOMMU phandle and specifier can be obtained
			 * via this backlink to the consumer device.
			 *
			 * More than one entry could be specified here
			 * to allow mappings for multiple devices. This
			 * avoids the problem of having multiple nodes
			 * with the same name.
			 *
			 * Could also be "iommu-addresses" as Rob had
			 * suggested earlier, but "iommu-mapping" seems
			 * a bit more appropriate given that there's
			 * also the phandle now.
			 */
			iommu-mapping =3D <&dc 0x80000000 0x01000000>;
		};
	};

	mc: memory-controller@70019000 {
		...
		#iommu-cells =3D <1>;
		...
	};

	dc: dc@54200000 {
		...
		iommus =3D <&mc TEGRA_SWGROUP_DC>;

		/*
		 * As in earlier proposals, this could be optional if
		 * all we need is the IOMMU mapping. It can be specified
		 * if there's a need for the driver to use the physical
		 * memory region (i.e. to copy out existing framebuffer
		 * content and recycle memory).
		 */
		memory-region =3D <&fb>;
		...
	};

One last remaining question that I have for this is whether we also need
some sort of #address-cells and #size-cells for the IOMMU which we need
to determine how many cells the addresses in iommu-mapping need to have.
I suppose we could derive that from the dma-ranges property somehow,
since that defines the addressable region of the device that needs the
mapping.

Thierry

--7Tuyp66Xcb8lGb33
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmJF1d8ACgkQ3SOs138+
s6HRRQ//UQ/ew8hhoRXdaIpMyqAExm8b5afE8d6eLidN+1KlX1ygwpxjibiGW71H
ljS/iHQogujvHLC+gRSZmpqpkY1nR03RzE9+ZWEDe8mag/8TEvMXa8EtETAIKp58
+JkT1hVHe10iDEdIU2Rz9x0zcUuSppq2OWNRgxl/DEynBTP3xRmNIa8Xt6wRdNHw
mjWKQ+cl4BtoAarJw5Ao6TAtAmWVokrJrry1XAlkHU9btLR25Zx2DNijO34GNrSW
Y9RwLWkTZiC5BPeiR2IgutieENg3KW6JlLXiqVylWAqM0OCC8O2rozq2kr+m4IMD
0S2JOEy9K/WK1E/JU5vvD1NzduXYYQO/FDvY/9Stko8dZOzzpdEOIElryTTnr9k7
DUOYqRyRHn0EgYbIPrrLCv1ldBi7CDdMsK3il7rEtZvlqg5HgbL6WGfgGyTynmK0
T67gVkpYKeP83Sa08T2gjHR1ToDDQTEs7LvkCnLUQi3QZ+AINbmLhkH52OUfB+RO
85yudOK3k63dgqAjP6AaQqa+qJdqMQscSYLQoFTq9XBrLCf1e8rgVCi69qW7PeuH
D3wq4KfXwfYSWmKmK4ZxN1/fSRiuYq1L2AxMh1Wy333R8Ycv2Jp1WWnAAa+8ebVf
+U5RLfWhmOMupd+RRaIUSrlXijDL107yT4+xmdwYIdzswPhSW6M=
=TiDP
-----END PGP SIGNATURE-----

--7Tuyp66Xcb8lGb33--
