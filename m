Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1EB73E06A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 15:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBED610E1F7;
	Mon, 26 Jun 2023 13:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BB910E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 13:20:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 332C560D33;
 Mon, 26 Jun 2023 13:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBA3C433C8;
 Mon, 26 Jun 2023 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687785601;
 bh=yMQFKEOUbbLx0TpxByXcJPO7nUBP5tMGqjH5D51qxFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cpDfVC37gFTH9nEZE/L7ecqhPrV/wnDnhwXZYMzgklvn885TaQZV/dv+OlrJ/sNDM
 6UhKd7rX6qcs/3Xzjpqo+l5OxAX38E5oyvceG2iwIi/NBjezR+RA2a19ex+D+vZCuz
 DiWsrQ8UrHzS5iC3MU9zY9+vhQ+KuGGMu/Q6WA7jxK5QfrG1q47AX0Rsnh0vPdYDI6
 RoRTVGPp9BQimY/UJHKT7t9M+feTA5wgO6auyY8YC6lbSCpdHGj4hbziG6kvoNjLIH
 qROKZXoU6luxOz6kVyCecwc0+Yxs5CUoccck13R7UhhDTR06peL8nshm2gwhvZGGzU
 4Hq7mfSTnSefg==
Date: Mon, 26 Jun 2023 15:19:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] drm: gem: add an option for supporting the dma-coherent
 hardware.
Message-ID: <gmxnkyjkpedrem4ltixtgxruytbwsjrk5ggdvnqeqnncckti4r@tcsaokp3u6ax>
References: <20230607053053.345101-1-suijingfeng@loongson.cn>
 <d4378aad1cf179d308068ef6072c5c7ff2bf2502.camel@crapouillou.net>
 <6db23d14-652e-4b13-24cb-bfb92fa3faed@loongson.cn>
 <e9714a0c29b1c4268081827571ad2545b0e6d5ec.camel@crapouillou.net>
 <d5494751-0af0-42f6-bcad-f75415e4a6bd@loongson.cn>
 <2dd4c870a5605a79105fb621c97a5f59a18c8c24.camel@crapouillou.net>
 <ae085320-c93c-5d96-58ef-c5ee8b58c306@loongson.cn>
 <i2odidvev3ztxit4iv4ndxcuk4opckgs5fg4jjjfrq5nike35u@mlo7hshexe2n>
 <02d6f220-b457-b980-8623-8da636cb495c@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a2btcfxmbyj4gv5j"
Content-Disposition: inline
In-Reply-To: <02d6f220-b457-b980-8623-8da636cb495c@loongson.cn>
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


--a2btcfxmbyj4gv5j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2023 at 04:38:34AM +0800, Sui Jingfeng wrote:
> On 2023/6/8 15:39, Maxime Ripard wrote:
> > On Thu, Jun 08, 2023 at 01:18:38AM +0800, Sui Jingfeng wrote:
> > > Hi,
> > >=20
> > > On 2023/6/8 00:12, Paul Cercueil wrote:
> > > > Hi Sui,
> > > >=20
> > > > Le mercredi 07 juin 2023 =E0 22:38 +0800, Sui Jingfeng a =E9crit=A0:
> > > > > Hi,=A0 welcome to discussion.
> > > > >=20
> > > > >=20
> > > > > I have limited skills in manipulating English.
> > > > >=20
> > > > > It may not express what I'm really means in the short time.
> > > > >=20
> > > > > Part of word in the sentence may not as accurate as your.
> > > > >=20
> > > > > Well, please don't misunderstand, I'm not doing the rude to you.
> > > > No problem.
> > > >=20
> > > > > I will explain it with more details.
> > > > >=20
> > > > > See below:
> > > > >=20
> > > > >=20
> > > > > On 2023/6/7 20:09, Paul Cercueil wrote:
> > > > > > Hi Sui,
> > > > > >=20
> > > > > > Le mercredi 07 juin 2023 =E0 18:30 +0800, Sui Jingfeng a =E9cri=
t=A0:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > >=20
> > > > > > > On 2023/6/7 17:36, Paul Cercueil wrote:
> > > > > > > > Hi Sui,
> > > > > > > >=20
> > > > > > > > Le mercredi 07 juin 2023 =E0 13:30 +0800, Sui Jingfeng a =
=E9crit=A0:
> > > > > > > > > The single map_noncoherent member of struct
> > > > > > > > > drm_gem_dma_object
> > > > > > > > > may
> > > > > > > > > not
> > > > > > > > > sufficient for describing the backing memory of the GEM
> > > > > > > > > buffer
> > > > > > > > > object.
> > > > > > > > >=20
> > > > > > > > > Especially on dma-coherent systems, the backing memory is
> > > > > > > > > both
> > > > > > > > > cached
> > > > > > > > > coherent for multi-core CPUs and dma-coherent for periphe=
ral
> > > > > > > > > device.
> > > > > > > > > Say architectures like X86-64, LoongArch64, Loongson Mips=
64,
> > > > > > > > > etc.
> > > > > > > > >=20
> > > > > > > > > Whether a peripheral device is dma-coherent or not can be
> > > > > > > > > implementation-dependent. The single map_noncoherent opti=
on
> > > > > > > > > is
> > > > > > > > > not
> > > > > > > > > enough
> > > > > > > > > to reflect real hardware anymore. For example, the Loongs=
on
> > > > > > > > > LS3A4000
> > > > > > > > > CPU
> > > > > > > > > and LS2K2000/LS2K1000 SoC, peripheral device of such hard=
ware
> > > > > > > > > platform
> > > > > > > > > allways snoop CPU's cache. Doing the allocation with
> > > > > > > > > dma_alloc_coherent
> > > > > > > > > function is preferred. The return buffer is cached, it sh=
ould
> > > > > > > > > not
> > > > > > > > > using
> > > > > > > > > the default write-combine mapping. While with the current
> > > > > > > > > implement,
> > > > > > > > > there
> > > > > > > > > no way to tell the drm core to reflect this.
> > > > > > > > >=20
> > > > > > > > > This patch adds cached and coherent members to struct
> > > > > > > > > drm_gem_dma_object.
> > > > > > > > > which allow driver implements to inform the core. Introdu=
cing
> > > > > > > > > new
> > > > > > > > > mappings
> > > > > > > > > while keeping the original default behavior unchanged.
> > > > > > > > Did you try to simply set the "dma-coherent" property to the
> > > > > > > > device's
> > > > > > > > node?
> > > > > > > But this approach can only be applied for the device driver w=
ith
> > > > > > > DT
> > > > > > > support.
> > > > > > >=20
> > > > > > > X86-64, Loongson ls3a4000 mips64, Loongson ls3a5000 CPU typic=
ally
> > > > > > > do
> > > > > > > not
> > > > > > > have DT support.
> > > > > > >=20
> > > > > > > They using ACPI to pass parameter from the firmware to Linux
> > > > > > > kernel.
> > > > > > >=20
> > > > > > > You approach will lost the effectiveness on such a case.
> > > > > > Well, I don't really know how ACPI handles it - but it should j=
ust
> > > > > > be a
> > > > > > matter of setting dev->dma_coherent. That's basically what the =
DT
> > > > > > code
> > > > > > does.
> > > > > >=20
> > > > > > Some MIPS boards set it in their setup code for instance.
> > > > > >=20
> > > > > This is a *strategy*, not a *mechanism*.
> > > > >=20
> > > > > In this case, DT is just used to describing the hardware.
> > > > >=20
> > > > > (It is actually a hardware feature describing language, the
> > > > > granularity
> > > > > is large)
> > > > >=20
> > > > > It does not changing the state of the hardware.
> > > > >=20
> > > > > It's your platform firmware or kernel setting up code who actuall=
y do
> > > > > such a things.
> > > > >=20
> > > > >=20
> > > > > It's just that it works on *one* platform, it does not guarantee =
it
> > > > > will
> > > > > works on others.
> > > > If you add the "dma-coherent" property in a device node in DT, you
> > > > effectively specify that the device is DMA-coherent; so you describe
> > > > the hardware, which is what DT is for, and you are not changing the
> > > > state of the hardware.
> > > >=20
> > > > Note that some MIPS platforms (arch/mips/alchemy/common/setup.c)
> > > > default to DMA-coherent mapping; I believe you could do something
> > > > similar with your Loongson LS3A4000 CPU and LS2K2000/LS2K1000 SoC.
> > > >=20
> > > The preblem is that device driver can have various demand.
> > >=20
> > > It probably want to create different kind of buffers for different th=
ing
> > > simultaneously.
> > >=20
> > > Say, one allocated with dma_alloc_coherent for command buffer or dma
> > > descriptor
> > >=20
> > > another one allocated with=A0 dma_alloc_wc for uploading shader etc.
> > >=20
> > > also has the third one allocated with dma_alloc_noncoherent() for doi=
ng some
> > > else.
> > And it will work just fine.
> >=20
> > struct device dma_coherent, or DT's dma-coherent property define that
> > the device doesn't need any kind of cache maintenance, ever. If it's
> > missing, we need to perform cache maintenance to keep coherency.
> >=20
> > dma_alloc_* functions provide guarantees to the driver. With
> > dma_alloc_wc and dma_alloc_coherent, the buffer is coherent, and thus
> > you don't need to perform cache maintenance operations by hand in the
> > driver.
> >=20
> > With dma_alloc_noncoherent, the buffer is non-coherent and the driver
> > needs to perform them when relevant.
> >=20
> > How those buffers are created is platform specific, but the guarantees
> > provided *to the driver* are always there.
> >=20
> > A buffer allocated with dma_alloc_coherent might be provided by
> > different means (at the hardware level with a coherency unit, by mapping
> > it non-cacheable), but as far as the driver is concerned it's always
> > going to be coherent.
> >=20
> > Similarly, a driver using dma_alloc_noncoherent will always require
> > cache maintenance operations to use the API properly, even if the
> > hardware provides coherency (in which case, those operations will be
> > nop).
> >=20
> > So, yeah, like I was saying in the other mail, it looks like you're
> > confusing a bunch of things. dma_alloc_* functions are about the driver
> > expectations and guarantees. DT's dma-coherent property is about how we
> > can implement them on a given platform.
> >=20
> > They don't have to match, and that's precisely how we can have drivers
> > that run on any combination of platforms: the driver only cares about
> > the buffer guarantees, the platform description takes care of how they
> > are implemented.
>=20
> You are right in overall.
>=20
> Yeah, you have better understanding than me.
>=20
>=20
> But let me give you an example which may made people confusing:
>=20
>=20
> The the drm/ingenic and drm/etnaviv (KMS-RO) as an example:
>=20
>=20
>=20
> when drm/etnaviv's etnaviv_gem_prime_import_sg_table() function get calle=
d,
>=20
> drm/etnaviv is importing buffer from drm/ingenic.
>=20
> drm/etnaviv is the importer, and drm/ingenic is the exporter.
>=20
> drm/ingenic choose non-coherent mapping by default for JZ4770(this is gc8=
00
> in it).
>=20
> It's cached, for fast CPU software rendering.
>=20
>=20
> While drm/etnaviv import the buffer, get the SG, using the WC mapping by
> default.
>=20
> Dose this cause *cache aliasing* because of different driver using differ=
ent
> cache
>=20
> mapping for the same backing memory ?

This is a slightly different problem though. The main issue here is
that there's multiple mapping with different attributes. Why is
etnaviv even mapping the KMS buffer in the first place?

I'd say it's largely a dma-buf problem if that actually happens.

> Because the imported buffer originally belong to the KMS driver side.
>=20
> For drm/ingenic(jz4770), the BO will be cached, but their hardware can't
> guarantee coherency.

You don't need to have hardware coherency to have a coherent buffer. A
buffer mapped non-cacheable is coherent.

> when etnaviv finished the rendering, they will do the resolve.
>=20
> By using the WC mapping, the GPU will write directly to the system RAM.

I'm confused. The WC mapping is for the *CPU* mapping. The GPU doesn't
use the CPU mapping.

> 1)
>=20
> If CPU flush the cache back to the system RAM(framebuffer when running
> glmark-es2-drm).
>=20
> then the image(resolved by GPU) in framebuffer will be overwrite by the
> stall data in the cache.
>=20
>=20
> 2)
>=20
> Think about occasions when we need the CPU to do the read access to the
> rendered image.
>=20
> (snap shoot, or using with X server fake EXA)
>=20
> The CPU still think the share buffer as cached, it will read from the cac=
he
> if hit.
>=20
> while GPU write to RAM directly by using WC mapping.
>=20
>=20
> Even it call dma_sync_single_for_device(), it only get SYNC-ed for the
> device.
>=20
> there is no SYNC for the CPU's cached.
>=20
> I think, In the end, it will lost of coherency.
>=20
>=20
> 3)
>=20
> If the user want to use X server graphic environment,
>=20
> then the case will be more complex for 3D acceleration support.
>=20
>=20
> Even it hacks somewhere to call the sync for CPU,
>=20
> they still may need invalid the cache frequently.
>=20
> In this case, it will not get a good performance.
>=20
>=20
> At any case,=A0 such a KMS-RO combination((cached no-coherent + WC)) will=
 be a
> misery./
> /
>=20
> While drm/ingenic could give up the hardware acceleration and the 3D
> acceleration in X environment.
>=20
> it's OK, as its for low-ended graphic application.
>=20
>=20
> But, at the other hand, it is say also why arm soc adhere to the
> write-combine.
>=20
> because they have no choice.
>=20
> While ingenic is the first exception, thanks Paul's patch which help us to
> understand a lot thing .
>=20
>=20
> 4)
>=20
> While Loongson LS2K1000 SoC is DMA-coherent,
>=20
> We are also prefer cached framebuffer for fast CPU software rendering.
>=20
> I also get the hardware accelerated 3D works successfully,
>=20
> even only for the GL client (such as glxgears and glmark2).
>=20
>=20
> Therefore, on our hardware platform.
>=20
> I force both the KMS driver and RO drivers to use cached mapping.
>=20
> with the hardware maintained cache coherence blessing us.
>=20
> It turn out that is works.
>=20
>=20
> We don't need ( and don't want ) to call the dma_sync_*() series function,
> not because we don't know it is no-op for DMA-coherent.

Then don't do that? Ingenic is the only driver that does. That means
that all the other drivers don't, so follow their lead instead of
ingenic if the trade-off doesn't work for you.

Maxime
--a2btcfxmbyj4gv5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZJmQfgAKCRDj7w1vZxhR
xUuOAQCS1dAJnoIB9DknItLXnQoXEMKUJoDkl7jaqDjVuTph3gEA+1dCTWDdz5pm
xJpehTZ4TZoElpcb9//oz8kMccVd2gw=
=3yBT
-----END PGP SIGNATURE-----

--a2btcfxmbyj4gv5j--
