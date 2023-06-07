Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24E725EC5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 14:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E100910E4E0;
	Wed,  7 Jun 2023 12:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A67810E4E0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 12:19:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1A4263E6C;
 Wed,  7 Jun 2023 12:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD412C433D2;
 Wed,  7 Jun 2023 12:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686140372;
 bh=sVlBMXZgb2WeMO8wyewjKVLUTq3MSJdNX3OB4y/Ih0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=syPHLxNbaTloM+A4Y+SyVpODXo9hKoYl8uIYzugXbU1evZIQwJSUqGOUXJIAudKOv
 BxET4O/2JAWaTLx67Hc7fHT31a7Y/R2C/cfLQe5IPSVSWO2U7RLArg+nIu82pF4D0f
 bQt7AgAJckwuYC/VxhduACtREzcSPAf+OaWwd2b98JXVn5O1J4/yeszzZeUy3XQ5Mt
 CUcJs8WOYh4GSRx2KAAd+9rm8NR5/QXLkVk4NJBgEDaRDu0ugFQFnJQ3Jg0Kpg7NFQ
 F1XNEUlGiXK+H4kRvYqf0oezsxt+Q0RmOIUXpW8etepWYW7V5pHqflo7h1yp93nbm5
 jBbDys4w0BVfg==
Date: Wed, 7 Jun 2023 14:19:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] drm: gem: add an option for supporting the dma-coherent
 hardware.
Message-ID: <l343rk4s6mrppjl3vxxvnwc52wlovg6bojduiy3qf5zup5ifzx@7qu7jilrsgn5>
References: <20230607053053.345101-1-suijingfeng@loongson.cn>
 <d4378aad1cf179d308068ef6072c5c7ff2bf2502.camel@crapouillou.net>
 <6db23d14-652e-4b13-24cb-bfb92fa3faed@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rvdpeqztss6vkzn5"
Content-Disposition: inline
In-Reply-To: <6db23d14-652e-4b13-24cb-bfb92fa3faed@loongson.cn>
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
Cc: linux-renesas-soc@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rvdpeqztss6vkzn5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2023 at 06:30:01PM +0800, Sui Jingfeng wrote:
> On 2023/6/7 17:36, Paul Cercueil wrote:
> > Hi Sui,
> >=20
> > Le mercredi 07 juin 2023 =E0 13:30 +0800, Sui Jingfeng a =E9crit=A0:
> > > The single map_noncoherent member of struct drm_gem_dma_object may
> > > not
> > > sufficient for describing the backing memory of the GEM buffer
> > > object.
> > >=20
> > > Especially on dma-coherent systems, the backing memory is both cached
> > > coherent for multi-core CPUs and dma-coherent for peripheral device.
> > > Say architectures like X86-64, LoongArch64, Loongson Mips64, etc.
> > >=20
> > > Whether a peripheral device is dma-coherent or not can be
> > > implementation-dependent. The single map_noncoherent option is not
> > > enough
> > > to reflect real hardware anymore. For example, the Loongson LS3A4000
> > > CPU
> > > and LS2K2000/LS2K1000 SoC, peripheral device of such hardware
> > > platform
> > > allways snoop CPU's cache. Doing the allocation with
> > > dma_alloc_coherent
> > > function is preferred. The return buffer is cached, it should not
> > > using
> > > the default write-combine mapping. While with the current implement,
> > > there
> > > no way to tell the drm core to reflect this.
> > >=20
> > > This patch adds cached and coherent members to struct
> > > drm_gem_dma_object.
> > > which allow driver implements to inform the core. Introducing new
> > > mappings
> > > while keeping the original default behavior unchanged.
> > Did you try to simply set the "dma-coherent" property to the device's
> > node?
>=20
> But this approach can only be applied for the device driver with DT suppo=
rt.
>
> X86-64, Loongson ls3a4000 mips64, Loongson ls3a5000 CPU typically do not
> have DT support.
>=20
> They using ACPI to pass parameter from the firmware to Linux kernel.
>=20
> You approach will lost the effectiveness on such a case.

Not really, no. All DT support is doing is setting some generic device
parameter based on that property, but the infrastructure is very much
generic and can be used on systems without a DT.

> >  From what I understand if you add that property then Linux will use DMA
> > coherent memory even though you use dma_alloc_noncoherent() and the
> > sync_single_for_cpu() / sync_single_for_device() are then NOPs.
 >
> Please do not mitigate the problems with confusing method.

It's not a confusing method, it's one of the two main API to deal with
DMA buffers. And you might disagree with Paul but there's no need to be
rude about it.

> This approach not only tend to generate confusion but also
> implement-dependent and arch-dependent. It's definitely problematic.
>=20
>=20
> How does the dma_alloc_coherent/dma_alloc_noncoherent is a ARCH specific
> thing.
>=20
> Dependent on how does the arch_dma_ops is implemented.
>=20
>=20
> The definition of the coherent on different ARCH has different meanings.
>=20
> The definition of the wirte-combine on different ARCH has different
> meanings.
>=20
>=20
> The wirte-combine(uncache acceleration) on mips is non dma-coherent.

Then MIPS breaks the DMA allocation semantics. A buffer allocated with
dma_alloc_wc is supposed to be coherent.

> But on arm, It seem that wirte-combine is coherent. (guaranteed by arch
> implement).
>=20
>=20
> I also heard using dma_alloc_coherent=A0 to allocation the buffer for the
> non-coherent doesn't hurt, but the reverse is not true.
>=20
>=20
> But please do not create confusion.
>=20
> software composite is faster because better cacheusing rate and
>=20
> cache is faster to read.
>=20
> It is faster because it is cached, not because it is non-coherent.
>=20
> non-coherent is arch thing and/or driver-side thing,
>=20
> it is a side effect of=A0 using the cached mapping.

Honestly, it's not clear to me what your point or issue is.

Going back to the description in your commit log, you mention that you
want to support multiple hardware that might or might not be DMA
coherent, and thus you want to allocate a buffer with different
attributes depending on that?

Like, you say that the LS3A4000 has a coherency unit and thus doing the
allocation with dma_alloc_coherent is preferred. Preferred to what? A WC
buffer? Why?

A WC buffer is a coherent buffer that is allowed to cache writes.

It doesn't have to, and worst case scenario you're inexactly the same
case than a dma_alloc_coherent buffer.

> It should left to driver to handle such a side effect. The device
> driver know their device, so its the device driver's responsibility to
> maintain the coherency.

Not really, no. Some driver are used across multiple SoCs and multiple
arch. It doesn't make any sense to encode this in the driver... which is
why it's in the DT in the first place, and abstracted away by the DMA
API. Like, do you really expect the amdgpu driver to know the DMA
attributes it needs to allocate a buffer from when running from a
RaspberryPi?

> On loongson platform, we don't need to call
> drm_fb_dma_sync_non_coherent() function, Its already guaranteed by
> hardware.

And mostly guaranteed by dma_alloc_coherent. And if you wanted to call
it anyway, it would be a nop if the device is declared as coherent
already.

I think you're thinking about this backward. A buffer has mapping
attributes, and a device has hardware properties.

The driver (ie, software) will allocate a buffer with some mapping
attributes, and will assume that they are met in the rest of its code.
How they are met is an implementation detail of the hardware, and for
all the driver cares, it doesn't have to match.

You can allocate a WC buffer to use on a non-coherent device and that's
fine. You can allocate a non-coherent buffer on a coherent device and
that's fine too. The DMA API will make everything work when it needs to,
and if the hardware already provides stronger guarantees, then it will
just skip whatever is redundant.

So you need to write your driver using buffer is the most convenient for
you, and it's really all that matters at the driver level. But for that
to work, you need to flag the coherence-ness of your devices properly,
like Paul suggested.

Maxime

--rvdpeqztss6vkzn5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIB10QAKCRDj7w1vZxhR
xRD3AP4+CuKSClOhR6Tk+iHUSE+0W1zUPXL6Vw6z9e2OOEHMwQD/Y0tjh52EyZ91
R/egrhpeLpiA8WFUrMSUE2jKmKrJjgI=
=XMoq
-----END PGP SIGNATURE-----

--rvdpeqztss6vkzn5--
