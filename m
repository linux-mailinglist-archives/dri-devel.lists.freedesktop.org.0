Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E0E7278F0
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F6510E130;
	Thu,  8 Jun 2023 07:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4C010E130
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:39:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBFE66488D;
 Thu,  8 Jun 2023 07:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C22C4339C;
 Thu,  8 Jun 2023 07:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686209988;
 bh=O2zRNJboOAI8ttGwRfd31tcEHKSaTFhxlXzLeOe0bqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WyDqi9j0LFNEwkAoxQylRIfX5yPo3hUZIXFLvqqtYrU+YwcdxbZxh2I12BnOmnawB
 3z7wx1sGRyMfHctGi0TQNXrCswPwQd8KnU+NPC54qjNRbugZhVtRUEbY32D5bID4tB
 oPSeqGQRXyvYaZ+WOIzoEpcYinp4HJsCP9AWkcEllbBRwXiiRPNZB2bY+1boPeSqlR
 jPybaSSH6V1cmNrSE1uqaU/uFblGh6+1iF9J8TtGFyYnURfd8CiAaVMqqb/nK3vuiV
 qhwr6F6jCHVmOpmD4srYR7RuTNGl/Bqtaht2NRfHbJCqP3gJU+Jh0EuyYm6kPWipO8
 fSv+mjxAroPSA==
Date: Thu, 8 Jun 2023 09:39:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] drm: gem: add an option for supporting the dma-coherent
 hardware.
Message-ID: <i2odidvev3ztxit4iv4ndxcuk4opckgs5fg4jjjfrq5nike35u@mlo7hshexe2n>
References: <20230607053053.345101-1-suijingfeng@loongson.cn>
 <d4378aad1cf179d308068ef6072c5c7ff2bf2502.camel@crapouillou.net>
 <6db23d14-652e-4b13-24cb-bfb92fa3faed@loongson.cn>
 <e9714a0c29b1c4268081827571ad2545b0e6d5ec.camel@crapouillou.net>
 <d5494751-0af0-42f6-bcad-f75415e4a6bd@loongson.cn>
 <2dd4c870a5605a79105fb621c97a5f59a18c8c24.camel@crapouillou.net>
 <ae085320-c93c-5d96-58ef-c5ee8b58c306@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f7tu4zegif6z2mfi"
Content-Disposition: inline
In-Reply-To: <ae085320-c93c-5d96-58ef-c5ee8b58c306@loongson.cn>
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


--f7tu4zegif6z2mfi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 01:18:38AM +0800, Sui Jingfeng wrote:
> Hi,
>=20
> On 2023/6/8 00:12, Paul Cercueil wrote:
> > Hi Sui,
> >=20
> > Le mercredi 07 juin 2023 =E0 22:38 +0800, Sui Jingfeng a =E9crit=A0:
> > > Hi,=A0 welcome to discussion.
> > >=20
> > >=20
> > > I have limited skills in manipulating English.
> > >=20
> > > It may not express what I'm really means in the short time.
> > >=20
> > > Part of word in the sentence may not as accurate as your.
> > >=20
> > > Well, please don't misunderstand, I'm not doing the rude to you.
> > No problem.
> >=20
> > > I will explain it with more details.
> > >=20
> > > See below:
> > >=20
> > >=20
> > > On 2023/6/7 20:09, Paul Cercueil wrote:
> > > > Hi Sui,
> > > >=20
> > > > Le mercredi 07 juin 2023 =E0 18:30 +0800, Sui Jingfeng a =E9crit=A0:
> > > > > Hi,
> > > > >=20
> > > > >=20
> > > > > On 2023/6/7 17:36, Paul Cercueil wrote:
> > > > > > Hi Sui,
> > > > > >=20
> > > > > > Le mercredi 07 juin 2023 =E0 13:30 +0800, Sui Jingfeng a =E9cri=
t=A0:
> > > > > > > The single map_noncoherent member of struct
> > > > > > > drm_gem_dma_object
> > > > > > > may
> > > > > > > not
> > > > > > > sufficient for describing the backing memory of the GEM
> > > > > > > buffer
> > > > > > > object.
> > > > > > >=20
> > > > > > > Especially on dma-coherent systems, the backing memory is
> > > > > > > both
> > > > > > > cached
> > > > > > > coherent for multi-core CPUs and dma-coherent for peripheral
> > > > > > > device.
> > > > > > > Say architectures like X86-64, LoongArch64, Loongson Mips64,
> > > > > > > etc.
> > > > > > >=20
> > > > > > > Whether a peripheral device is dma-coherent or not can be
> > > > > > > implementation-dependent. The single map_noncoherent option
> > > > > > > is
> > > > > > > not
> > > > > > > enough
> > > > > > > to reflect real hardware anymore. For example, the Loongson
> > > > > > > LS3A4000
> > > > > > > CPU
> > > > > > > and LS2K2000/LS2K1000 SoC, peripheral device of such hardware
> > > > > > > platform
> > > > > > > allways snoop CPU's cache. Doing the allocation with
> > > > > > > dma_alloc_coherent
> > > > > > > function is preferred. The return buffer is cached, it should
> > > > > > > not
> > > > > > > using
> > > > > > > the default write-combine mapping. While with the current
> > > > > > > implement,
> > > > > > > there
> > > > > > > no way to tell the drm core to reflect this.
> > > > > > >=20
> > > > > > > This patch adds cached and coherent members to struct
> > > > > > > drm_gem_dma_object.
> > > > > > > which allow driver implements to inform the core. Introducing
> > > > > > > new
> > > > > > > mappings
> > > > > > > while keeping the original default behavior unchanged.
> > > > > > Did you try to simply set the "dma-coherent" property to the
> > > > > > device's
> > > > > > node?
> > > > > But this approach can only be applied for the device driver with
> > > > > DT
> > > > > support.
> > > > >=20
> > > > > X86-64, Loongson ls3a4000 mips64, Loongson ls3a5000 CPU typically
> > > > > do
> > > > > not
> > > > > have DT support.
> > > > >=20
> > > > > They using ACPI to pass parameter from the firmware to Linux
> > > > > kernel.
> > > > >=20
> > > > > You approach will lost the effectiveness on such a case.
> > > > Well, I don't really know how ACPI handles it - but it should just
> > > > be a
> > > > matter of setting dev->dma_coherent. That's basically what the DT
> > > > code
> > > > does.
> > > >=20
> > > > Some MIPS boards set it in their setup code for instance.
> > > >=20
> > > This is a *strategy*, not a *mechanism*.
> > >=20
> > > In this case, DT is just used to describing the hardware.
> > >=20
> > > (It is actually a hardware feature describing language, the
> > > granularity
> > > is large)
> > >=20
> > > It does not changing the state of the hardware.
> > >=20
> > > It's your platform firmware or kernel setting up code who actually do
> > > such a things.
> > >=20
> > >=20
> > > It's just that it works on *one* platform, it does not guarantee it
> > > will
> > > works on others.
> > If you add the "dma-coherent" property in a device node in DT, you
> > effectively specify that the device is DMA-coherent; so you describe
> > the hardware, which is what DT is for, and you are not changing the
> > state of the hardware.
> >=20
> > Note that some MIPS platforms (arch/mips/alchemy/common/setup.c)
> > default to DMA-coherent mapping; I believe you could do something
> > similar with your Loongson LS3A4000 CPU and LS2K2000/LS2K1000 SoC.
> >=20
> The preblem is that device driver can have various demand.
>=20
> It probably want to create different kind of buffers for different thing
> simultaneously.
>=20
> Say, one allocated with dma_alloc_coherent for command buffer or dma
> descriptor
>=20
> another one allocated with=A0 dma_alloc_wc for uploading shader etc.
>=20
> also has the third one allocated with dma_alloc_noncoherent() for doing s=
ome
> else.

And it will work just fine.

struct device dma_coherent, or DT's dma-coherent property define that
the device doesn't need any kind of cache maintenance, ever. If it's
missing, we need to perform cache maintenance to keep coherency.

dma_alloc_* functions provide guarantees to the driver. With
dma_alloc_wc and dma_alloc_coherent, the buffer is coherent, and thus
you don't need to perform cache maintenance operations by hand in the
driver.

With dma_alloc_noncoherent, the buffer is non-coherent and the driver
needs to perform them when relevant.

How those buffers are created is platform specific, but the guarantees
provided *to the driver* are always there.

A buffer allocated with dma_alloc_coherent might be provided by
different means (at the hardware level with a coherency unit, by mapping
it non-cacheable), but as far as the driver is concerned it's always
going to be coherent.

Similarly, a driver using dma_alloc_noncoherent will always require
cache maintenance operations to use the API properly, even if the
hardware provides coherency (in which case, those operations will be
nop).

So, yeah, like I was saying in the other mail, it looks like you're
confusing a bunch of things. dma_alloc_* functions are about the driver
expectations and guarantees. DT's dma-coherent property is about how we
can implement them on a given platform.

They don't have to match, and that's precisely how we can have drivers
that run on any combination of platforms: the driver only cares about
the buffer guarantees, the platform description takes care of how they
are implemented.

Maxime

--f7tu4zegif6z2mfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIGFwQAKCRDj7w1vZxhR
xbgrAQCpsWm57jC3gv6nOZ5GiUM5lc6RD0TOTYgWVOKNXbCLIAEAposvihAlLBno
R1vpxmdOLDjCU1bukTl6kAY4wW+MbQQ=
=PhYC
-----END PGP SIGNATURE-----

--f7tu4zegif6z2mfi--
