Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7131B91219D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD6B10E09B;
	Fri, 21 Jun 2024 10:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r3j9eAOR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FA010E09B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:08:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8EB42CE2367;
 Fri, 21 Jun 2024 10:08:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB6CC2BBFC;
 Fri, 21 Jun 2024 10:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718964493;
 bh=/tKcSZq4J92iEqVsCd57HoTw54GqrJjHdipBnOXO9V0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r3j9eAOR1U4ng8Az/gtegaHsbQBTD9axyq5N7NCHxZYpveQerNW8cGSfFNQGC910W
 OKZO+oDtk/hs2LySngu19uw44UhOKALlS1CknS0zHL2fzGa5JciSura2DjE55tH/h/
 KxJwYeq0u46bU8A4K14/XZZh+hkp3mYhFwzQRFeZZHHXtU5jK8p1V3pp3asN3x0MOH
 IVNpLISv4NT9S6pxOYVSDjMhfXXbtKt29lLth9iddGBHtKKhUIekoutJUM4ba/jqeU
 yz1abF2YB/jKdJ0w/Ap64T6V5ygb0/ubJYXk7sakLZZkVaj14A5xYK4Srq4UeaY3K7
 gM+D7PtBmMwHQ==
Date: Fri, 21 Jun 2024 15:38:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v12 0/7] iio: new DMABUF based API v12
Message-ID: <ZnVRCY3PGPag0fSj@matsya>
References: <20240620122726.41232-1-paul@crapouillou.net>
 <ZnRW2axOg7gtKzz0@matsya> <20240620201150.72c11599@jic23-huawei>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zv6/9gJkMVEIBNPb"
Content-Disposition: inline
In-Reply-To: <20240620201150.72c11599@jic23-huawei>
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


--zv6/9gJkMVEIBNPb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20-06-24, 20:11, Jonathan Cameron wrote:
> On Thu, 20 Jun 2024 21:50:41 +0530
> Vinod Koul <vkoul@kernel.org> wrote:
>=20
> > On 20-06-24, 14:27, Paul Cercueil wrote:
> > > Hi Jonathan, =20
> >=20
> > Hey Jonathan,
> >=20
> > Assuming we are fine with this series, how would you like to proceed.
> > Would you be fine with me picking the dmaengine bits and providing a
> > signed tag for you to pull?
> >=20
>=20
> Hi Vinod,
>=20
> Yes. That will work nicely.
> From my side it all looks good.

Great, here it is:

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git topic/d=
ma_vec_api

for you to fetch changes up to 380afccc2a55e8015adae4266e8beff96ab620be:

  Documentation: dmaengine: Document new dma_vec API (2024-06-21 15:31:57 +=
0530)

----------------------------------------------------------------
Paul Cercueil (3):
      dmaengine: Add API function dmaengine_prep_peripheral_dma_vec()
      dmaengine: dma-axi-dmac: Implement device_prep_peripheral_dma_vec
      Documentation: dmaengine: Document new dma_vec API

 Documentation/driver-api/dmaengine/client.rst   |  9 ++++++
 Documentation/driver-api/dmaengine/provider.rst | 10 +++++++
 drivers/dma/dma-axi-dmac.c                      | 40 +++++++++++++++++++++=
++++
 include/linux/dmaengine.h                       | 33 ++++++++++++++++++++
 4 files changed, 92 insertions(+)


Thanks
--=20
~Vinod

--zv6/9gJkMVEIBNPb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmZ1UQkACgkQfBQHDyUj
g0ciGg/+MWCV2eBlUaRTrgzPzuQNsDwY5YKV1fbPubp+fKrDbgEcArxVdx249s65
hNQoej706kBZkx8P1iNMY98zc8tKX4kzpA8vckc7Z42N+BlwmErpSc+p1JIOw69n
UPB1F2AwprfTmue6iBTwQP9+GeeLL7saKLjQ0HU98c0yJtXCkgO3N4E4+/wOVDjj
RlbByCBTxPpaoALCFhMjwAt5ohVML+s96s5+1sy9UAApJ5mCduGqyvQv2Ayk2m8M
EiCZY+HhKXACxFX5/mZN+zzVX2YsXtmmV3p641JzJXPr64/V2zIB2h2BL8ONSTJr
KXF8im8wrqJR5+hWvgPGN5TzZ7PLVYGtvOvO1UDCeoxNLpEAIe2GLpoMZNBQoffB
cIO/L98X/Vq3ItWX1FKxMjDJII13iVZ5JSPi/C7UmN6YUsATNGz6lIpa4WscBLR9
ImfkqWYfNvu3u0vLA+GbTHNtlJm2z4pQSCE3TiQhgZFfoRsqLQbOoB5H+w/NGuyU
ulKNf71QdArSmEh3hHulSp6AyYxSLTJHGE5XixAyz57HZVFVzeMbfs3PBkvtXPys
0mdnEhoSgMALvEC704dah/5VFNT96YNwDpdlYtRUjzoshHzOlG0HfrxwLJ7tq2XN
FePEs/LC3MmLA5p0QiUVO+0r5sXQpOophN1peScaA94FFNvteqA=
=n8YB
-----END PGP SIGNATURE-----

--zv6/9gJkMVEIBNPb--
