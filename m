Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245F7A53D9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 22:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9149110E302;
	Mon, 18 Sep 2023 20:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06BB10E302
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 20:21:15 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1d676732587so1883471fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 13:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068475; x=1695673275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RGQraY7zQHFmt60LcSsuv7lTX4r8xUrNdEp1P6pHzIQ=;
 b=Oidgh3mk94+9NFgUBTAgYOyrGZh/Lvm0ATQaHoHrXVRLndITsQwDnviEG20xykkJrT
 MoN2ti90NGngofFZu+zUsPYJCsgbVGFZ1R6p+rcFVcw6d+A2BSmQpWhHcjcEmS0Bl3on
 b5PQ3ymnZXa8v6tv+oLtWzyHLLdQwtScLuwna6Y/TgZSWP26jdhOxqsO72yiUf+JUkmK
 byk0NcJjv/KsAKhdYkwEQi7qZ9P5qPWX3+8FLKtSYrt92PaZ1nqX7tk4oibskmkDWpNZ
 YcJnoo7U2Eh8O5Atj6bYMRT2OZZBM/1VKfsIF9A1Y3+Khh8aKA1/GQ8lrc3l5/0c0nQE
 g13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068475; x=1695673275;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RGQraY7zQHFmt60LcSsuv7lTX4r8xUrNdEp1P6pHzIQ=;
 b=cXQGSZpufEADFG+MVkYCdr1s0dXED6dvr/xY4RH3MRNi5R9lk5hftiGuCOXq4uNOul
 etZmBeGNIdOx3KDFVIG52iyd5Ho7nF07H4Am5mXqGs1cYpJw8jv5B0q4qr3jUBBWhhDB
 rG3A4OZ+dH+La1tAe/rc5dGJGSVSQ01uJJKxTVF0e+Bj6zW+GIhnaXGlSVtxGNWHVrBr
 pEcbUS+ixDXlRC6AKwm36YJB/0rARHjWbwTMR9PNm77vq1YsxViUrckN5HoPR5MhX37Y
 4n7jtU1bsrpMj8mTMf2/4eKb/AMT5AhiPkAFRhZQNG/NioyYP2RD1qi3kFbfuDhssLZr
 kJ5A==
X-Gm-Message-State: AOJu0YwUuXqw/HzIi/9w/I+BkR3Z3p+/rcGfehaJZDusZa/A4yebKNLm
 JBzkGAYCSxYKxjzqSdDVPFXB6Q0B4I7flbUmV3w=
X-Google-Smtp-Source: AGHT+IEYM7pGfUGuzqSwEu8wDrh38MF0lPn1BkHzTgT8gHtaB9nDx123Fb7uiBqGhm9O7SjT2BC/KvE5mW5Hvegix38=
X-Received: by 2002:a05:6870:e256:b0:1d5:c134:cecb with SMTP id
 d22-20020a056870e25600b001d5c134cecbmr11301583oac.1.1695068474833; Mon, 18
 Sep 2023 13:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <15c9beb5f8dcb091b00c35d6206b84aa100d729e.camel@vmware.com>
 <60f15275-ebfd-2fd6-64c4-c8907520e5dd@amd.com>
 <3fa9b4d0-e12a-59b6-14c5-68f7406df129@linux.intel.com>
 <fc935b9f-9b25-bcab-717c-0c31373fcfee@linux.intel.com>
 <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
 <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
In-Reply-To: <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Sep 2023 16:21:03 -0400
Message-ID: <CADnq5_PPAZqusAoMTrG3OE3seZTQZbj1HC1u-4d5hcCQHsPD0g@mail.gmail.com>
Subject: Re: Decrypting tt maps in ttm
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 18, 2023 at 3:06=E2=80=AFPM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
>
> On 9/18/23 17:52, Zack Rusin wrote:
> > On Mon, 2023-09-18 at 17:13 +0200, Thomas Hellstr=C3=B6m wrote:
> >> Hi,
> >>
> >> On 9/18/23 16:56, Thomas Hellstr=C3=B6m wrote:
> >>> Hi Zack, Christian
> >>>
> >>> On 9/18/23 13:36, Christian K=C3=B6nig wrote:
> >>>> Hi Zack,
> >>>>
> >>>> adding Thomas and Daniel.
> >>>>
> >>>> I briefly remember that I talked with Thomas and some other people
> >>>> about that quite a while ago as well, but I don't fully remember the
> >>>> outcome.
> >>> Found one old thread, but didn't read it:
> >>>
> >>> https://lists.freedesktop.org/archives/dri-devel/2019-September/23410=
0.html
> >>>
> >>>
> >>> /Thomas
> >>>
> >>>
> >> Ugh. Now starting to read that thread I have a vague recollection it a=
ll
> >> ended with not supporting mapping any device pages whatsoever when SEV
> >> was enabled, but rather resorting to llvmpipe and VM-local bos.
> > Hi, Thomas.
> >
> > Thanks for finding this! I'd (of course) like to solve it properly and =
get vmwgfx
> > running with 3d support with SEV-ES active instead of essentially disab=
ling the
> > driver when SEV-ES is active.
> >
> > I think there are two separate discussions there, the non-controversial=
 one and the
> > controversial one:
> > 1) The non-controversial: is there a case where drivers would want encr=
ypted memory
> > for TT pages but not for io mem mappings? Because if not then as Christ=
ian pointed
> > out we could just add pgprot_decrypted to ttm_io_prot and be essentiall=
y done. The
> > current method of decrypting io mem but leaving sys mem mappings encryp=
ted is a bit
> > weird anyway.
> >
> > If the answer to that question is "yes, some driver does want the TT ma=
ppings to be
> > encrypted" then your "[PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly sup=
port support
> > AMD memory encryption" solves that. I think getting one of those two in=
 makes sense
> > regardless of everything else, agreed?
>
> Well, there is more to it I think.
>
> IIRC, the AMD SME encryption mode has a way for a device to have the
> memory controller (?) encrypt / decrypt device traffic by using an
> address range alias, so in theory it supports encrypted TT pages, and
> the dma-layer may indeed hand encrypted DMA pages to TTM on such systems
> depending on the device's DMA mask. That's why I think that
> force_dma_unencrypted() export was needed, and If the amdgpu driver
> accesses TT memory in SME mode *without* pgprot_decrypted() and it still
> works, then I think that mode is actually used. How could it otherwise wo=
rk?

For SME, as long as the encrypted bit is set in the physical address
used for DMA, the memory controller will handle the encrypt/decrypt
for the device.  For devices with a limited dma mask, you need to use
the IOMMU so that the encrypted bit is retained when the address hits
the memory controller.

Alex

>
> But anyway, I agree SEV-ES mode would *always* want pgprot_decrypted for
> dma allocated memory, whether it's in PL_SYSTEM or in PL_TT, but I guess
> the above SME case need to be sorted out first.
>
> >
> > 2) The controversial part of your series seems to be exporting of
> > force_dma_unencrypted and its usage within ttm. Personally I'm perfectl=
y ok with
> > ignoring that for now. Getting #1 in is still a million times (rounded =
up to the
> > nearest million) faster than just using llvmpipe in the guest. And gett=
ing #1 also
> > fixes modern presentation on vmwgfx.
>
>
> >
> > So #1 is "make the driver work", while #2 is an optimisation - I think =
we should
> > treat them as separate things/series. Does that make sense?
>
> I guess that depends on the tradeoff between security and speed for
> people running SEV-enabled VMs. But giving them a choice is probably not
> a bad idea.
>
> /Thomas
>
>
> >
> > z
> >
> > P.S. I forgot to cc dri-devel on the initial email, that wasn't by desi=
gn. Sorry.
> > I'm ok with moving the discussion to dri-devel.
