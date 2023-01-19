Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA85A674F2A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 09:09:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DFE10EA89;
	Fri, 20 Jan 2023 08:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29B610E095;
 Thu, 19 Jan 2023 16:56:39 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id g13so4126417lfv.7;
 Thu, 19 Jan 2023 08:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=eGN/Adab5kq/QtnZf6tnjyAFjYD6K8M5TfRoVYaie6Y=;
 b=QkvzwyHysUh8l1L66G6OCOM/PEA+1XwvmirICnPuHVEgZfU3dp99Jxj+qmLFvuMSvW
 4AGa5QDnSHo9Uhq/isrjUylK1atfW4ucW5CEU7IhZSTNQkVn291/3MouavNfOABxRxrY
 bpnTh7ZIdrVwQkmQF24SSU8SxGZhI5SZ9bKvg0nmhdOAPWRPbH22mPozwU8wjifcgQoy
 G1fTSQryG6rNB3WHhiS8pSurP5SUR6Ud6jJUBJSBF9OPiGs7pZzl4H2ULFHQLW8PzVuG
 uuutMVvGvUwQg1mS1gG2gx4+Kp0hZytUKgK5z2xTs3rJlz2iV9dc+O815cUdiJWjDTZw
 XS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eGN/Adab5kq/QtnZf6tnjyAFjYD6K8M5TfRoVYaie6Y=;
 b=IOU+MFElFf5X26ghGm4IO5mlfg5+Q81LqmvtBgb1CKNMxV6sxFTkbaQHukuwc5++TI
 Dp7as794YVMEGptiagC8cNHX2fqZqSRyAv4ZtxNS0ZRm19MaNQXr2DG/dHHLUv9z2Vwa
 3Qoeo0IVFIBvqbiuVPEUirWgAqtLg4Ma27Fsvh6357vRUbiUWr/PrlzAs8l+USYT/16c
 8k9wyXAyPUK1nPCr9aOd2VJBaLmz0MXYwdrE3qOCkLdV5Mgm0lQgwlB1qHN5KJV3r5QI
 9gsfAekBhIuQVuok7YYMATEWIYK6EI75St4V4xe8jGUEYScGH42+CcwByTslDgai7A8s
 4CZA==
X-Gm-Message-State: AFqh2kryVkhPA4B6wOHNpE5o9lwSpw2bFyO5h+2+x934NHzTd7JaEGmq
 gioXwOLF0eMY2GrCGU++Fw==
X-Google-Smtp-Source: AMrXdXv6zpemtGe/tOk7ZvdijKUrpNd4pRW8BH2NnK3/XyO76X9rxueIqxfAzYayRBOBLdZvLed4cw==
X-Received: by 2002:a05:6512:34c8:b0:4b5:6649:eb6c with SMTP id
 w8-20020a05651234c800b004b56649eb6cmr2619534lfr.25.1674147397957; 
 Thu, 19 Jan 2023 08:56:37 -0800 (PST)
Received: from laptop.sqrt.uni.cx (0854358661.static.corbina.ru. [95.31.0.167])
 by smtp.gmail.com with ESMTPSA id
 q30-20020ac25a1e000000b004d4d7fb0e07sm1876155lfn.216.2023.01.19.08.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 08:56:37 -0800 (PST)
Date: Thu, 19 Jan 2023 19:56:38 +0300
From: Krylov Michael <sqarert@gmail.com>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/radeon: Fix screen corruption (v2)
Message-ID: <20230119195638.021757e5@laptop.sqrt.uni.cx>
In-Reply-To: <658a9226-98df-fd09-957b-14fa7fbb9f87@amd.com>
References: <20221211114226.57398-1-luben.tuikov@amd.com>
 <20221212020821.8248-1-luben.tuikov@amd.com>
 <a02c2cc9-f265-16ff-da44-9e44381c486c@arm.com>
 <CADnq5_MoD7oEXGivWPqO0m3XpqqAhg2k=X+zXcNPePYGpq0keQ@mail.gmail.com>
 <5b5a731b-0208-58a9-cb6f-2614efadbab2@arm.com>
 <9f18f970-98c5-649a-5f2c-dc4bc26db1e7@gmail.com>
 <466c4ce0-9a13-7d99-768e-43f7027f4933@amd.com>
 <02c45581-f988-2c10-17c8-dca6836acb00@gmail.com>
 <de9bf189-c204-f499-f027-1320e2faaa20@amd.com>
 <20f15c8d-fbe5-8dca-39dc-dc67fff2eca9@gmail.com>
 <80e10a8d-275f-8e3c-8b91-f5f6d6729dee@amd.com>
 <e15133af-d3d9-de47-b01a-bca9053b0d8f@arm.com>
 <658a9226-98df-fd09-957b-14fa7fbb9f87@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jsShm1YIr9vGZ08t0bp4QBU";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Mailman-Approved-At: Fri, 20 Jan 2023 08:07:34 +0000
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
Cc: Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/jsShm1YIr9vGZ08t0bp4QBU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Dec 2022 07:07:33 -0500
Luben Tuikov <luben.tuikov@amd.com> wrote:

> On 2022-12-15 06:53, Robin Murphy wrote:
> > On 2022-12-15 11:40, Luben Tuikov wrote:
> >> On 2022-12-15 06:27, Christian K=C3=B6nig wrote:
> >>> Am 15.12.22 um 11:19 schrieb Luben Tuikov:
> >>>> On 2022-12-15 04:46, Christian K=C3=B6nig wrote:
> >>>>> Am 15.12.22 um 10:08 schrieb Luben Tuikov:
> >>>>>> On 2022-12-15 03:07, Christian K=C3=B6nig wrote:
> >>>>>>> Am 15.12.22 um 00:08 schrieb Robin Murphy:
> >>>>>>>> On 2022-12-14 22:02, Alex Deucher wrote:
> >>>>>>>>> On Wed, Dec 14, 2022 at 4:54 PM Robin Murphy
> >>>>>>>>> <robin.murphy@arm.com> wrote:
> >>>>>>>>>> On 2022-12-12 02:08, Luben Tuikov wrote:
> >>>>>>>>>>> Fix screen corruption on older 32-bit systems using AGP
> >>>>>>>>>>> chips.
> >>>>>>>>>>>
> >>>>>>>>>>> On older systems with little memory, for instance 1.5
> >>>>>>>>>>> GiB, using an AGP chip,
> >>>>>>>>>>> the device's DMA mask is 0xFFFFFFFF, but the memory mask
> >>>>>>>>>>> is 0x7FFFFFF, and
> >>>>>>>>>>> subsequently dma_addressing_limited() returns 0xFFFFFFFF
> >>>>>>>>>>> < 0x7FFFFFFF, false. As such the result of this static
> >>>>>>>>>>> inline isn't suitable for the last
> >>>>>>>>>>> argument to ttm_device_init()--it simply needs to now
> >>>>>>>>>>> whether to use GFP_DMA32
> >>>>>>>>>>> when allocating DMA buffers.
> >>>>>>>>>> This sounds wrong to me. If the issues happen on systems
> >>>>>>>>>> without PAE it clearly can't have anything to with the
> >>>>>>>>>> actual DMA address size. Not to mention that AFAICS 32-bit
> >>>>>>>>>> x86 doesn't even have ZONE_DMA32, so GFP_DMA32 would be
> >>>>>>>>>> functionally meaningless anyway. Although the reported
> >>>>>>>>>> symptoms initially sounded like they could be caused by
> >>>>>>>>>> DMA going to the wrong place, that is also equally
> >>>>>>>>>> consistent with a loss of cache coherency.
> >>>>>>>>>>
> >>>>>>>>>> My (limited) understanding of AGP is that the GART can
> >>>>>>>>>> effectively alias
> >>>>>>>>>> memory to a second physical address, so I could well
> >>>>>>>>>> believe that something somewhere in the driver stack needs
> >>>>>>>>>> to perform some cache maintenance to avoid coherency
> >>>>>>>>>> issues, and that in these particular setups whatever that
> >>>>>>>>>> is might be assuming the memory is direct-mapped and thus
> >>>>>>>>>> going wrong for highmem pages.
> >>>>>>>>>>
> >>>>>>>>>> So as I said before, I really think this is not about using
> >>>>>>>>>> GFP_DMA32 at
> >>>>>>>>>> all, but about *not* using GFP_HIGHUSER.
> >>>>>>>>> One of the wonderful features of AGP is that it has to be
> >>>>>>>>> used with uncached memory.=C2=A0 The aperture basically just
> >>>>>>>>> provides a remapping of physical pages into a linear
> >>>>>>>>> aperture that you point the GPU at.=C2=A0 TTM has to jump
> >>>>>>>>> through quite a few hoops to get uncached memory in the
> >>>>>>>>> first place, so it's likely that that somehow isn't
> >>>>>>>>> compatible with HIGHMEM.=C2=A0 Can you get uncached HIGHMEM?
> >>>>>>>> I guess in principle yes, if you're careful not to use
> >>>>>>>> regular kmap()/kmap_atomic(), and always use
> >>>>>>>> pgprot_noncached() for userspace/vmalloc mappings, but
> >>>>>>>> clearly that leaves lots of scope for slipping up.
> >>>>>>> I theory we should do exactly that in TTM, but we have very
> >>>>>>> few users who actually still exercise that functionality.
> >>>>>>>
> >>>>>>>> Working backwards from primitives like set_memory_uc(), I
> >>>>>>>> see various paths in TTM where manipulating the caching
> >>>>>>>> state is skipped for highmem pages, but I wouldn't even know
> >>>>>>>> where to start looking for whether the right state is
> >>>>>>>> propagated to all the places where they might eventually be
> >>>>>>>> mapped somewhere.
> >>>>>>> The tt object has the caching state for the pages and
> >>>>>>> ttm_prot_from_caching() then uses pgprot_noncached() and co
> >>>>>>> for the userspace/vmalloc mappings.
> >>>>>>>
> >>>>>> The point of this patch is that dma_addressing_limited() is
> >>>>>> unsuitable as the last parameter to ttm_pool_init(), since if
> >>>>>> it is "false"--as it is in this particular case--then TTM ends
> >>>>>> up using HIGHUSER, and we get the screen corruption.
> >>>>>> (gfp_flags |=3D GFP_HIGHUSER in in ttm_pool_alloc())
> >>>>> Well I would rather say that dma_addressing_limited() works,
> >>>>> but the default value from dma_get_required_mask() is broken.
> >>>>>
> >>>> dma_get_required_mask() for his setup of 1.5 GiB of memory
> >>>> returns 0x7FFFFFF.
> >>>
> >>> This 0x7FFFFFF mask looks fishy to me. That would only be 128MiB
> >>> addressable memory (27 bits set)? Or is there another F missing?
> >>
> >> Yeah, I'm missing an F--it is correctly described at the top of
> >> the thread above, i.e. in the commit of v2 patch.
> >>
> >> 0x7FFF_FFFF, which seems correct, no?
> >>
> >>>> While the dma mask is 0xFFFFFFFF, as set in radeon_device.c in
> >>>> radeon_device_init().
> >>>>
> >>>>> 32 bits only work with bounce buffers and we can't use those on
> >>>>> graphics hardware.
> >>>>>
> >>>>>> Is there an objection to this patch, if it fixes the screen
> >>>>>> corruption?
> >>>>> Not from my side, but fixing the underlying issues would be
> >>>>> better I think.
> >>>>>
> >>>> Have they been identified?
> >>>
> >>> I'm not 100% sure. I think by using GFP_DMA32 we just work around
> >>> the issue somehow.
> >>
> >> Right. Using GFP_DMA32, we don't touch high-mem. I was looking at
> >> the DRM code trying to understand what we do when GFP_DMA32 is not
> >> set, and the immediate thing I see is that we set GFP_HIGHUSER
> >> when use_dma32 is unset in the device struct. (Then I got down to
> >> the caching attributes...)
> >>
> >> It's be nice if we can find the actual issue--what else would it
> >> show us that needs fixing...?
> >>
> >> So what do we do with this patch?
> >>
> >> Shouldn't leave it in a limbo--some OSes ship their kernel
> >> with 33b3ad3788ab ("drm/radeon: handle PCIe root ports with
> >> addressing limitations") wholly reverted.
> >=20
> > Removing dma_addressing_limited() is still wrong, for the reasons
> > given in that commit. What we need is an *additional* condition
> > that encapsulates "also pass use_dma32 for AGP devices because it
> > avoids some weird coherency issue with 32-bit highmem that isn't
> > worth trying to debug further".
>=20
> Yes, you had a patch earlier which did exactly that--why not push
> that patch?
>=20
> Q: If host memory is 1.5 GiB, i.e. mask of 0x7FFF_FFFF, but the
> device's mask is 0xFFFF_FFFF, shouldn't we use GFP_DMA32, instead of
> GFP_HIGHUSER?
>=20
> Regards,
> Luben
>=20

Sorry for being pushy, but given that we are so close to the finish, is
there any chance that one of the variants will be merged to the kernel
sources any time soon and if so, can I help with testing? I would really
benefit from this patch making it into Debian 12.

--Sig_/jsShm1YIr9vGZ08t0bp4QBU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEq9zNqT9shXHTn/gRzNfc0dbmrQAFAmPJdkYACgkQzNfc0dbm
rQCPGwf+KcAv7NBWx1xOGnjx0jgmhrYFIMnw5litPy7XtzfmYupt/aurIzqPl34m
wSD39ZZe8I5lNTS9mxwfc8EAp9CsXZyABV0BOdz/MDGRFZn2awOSIScokPHLOWWj
cfdPKSjLmGXrBs9av1Nbb6KTvr9j8NPmJcqz8XW5Ma+zs6DgKdgzPQzRH7SxDcZS
mXJcJJdadRc3swXI3xbCWysH1/fnVYL2V8aJ2KTMc+lWSxKpei822a2wHhOhDGfO
kNcbEo7kQvg34XzttjFeRLWELFDkHO1yTihO/TN7YuJshtZP31C7N8x/w3FjH5Ou
3jOSEFmXe6njCMOYGcz3QB87WMERlw==
=iT8l
-----END PGP SIGNATURE-----

--Sig_/jsShm1YIr9vGZ08t0bp4QBU--
