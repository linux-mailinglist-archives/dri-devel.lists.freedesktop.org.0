Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8F54784C9
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 07:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DDC10E30F;
	Fri, 17 Dec 2021 06:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0234C10E30F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 06:04:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1110161F9A;
 Fri, 17 Dec 2021 06:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 861F2C36AE1;
 Fri, 17 Dec 2021 06:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639721054;
 bh=kwoVfr91sfDbXUKT7OKdnlYuZVy9njagc98xzPanrDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YTqFvg/hfF0lUestaWcAB80XJkTL/iy6IDSt7jP6+ESZr8GI22Qxo/LvXAVjMA9wq
 aUGU8kGBf/IzSMOTdwqvmn7Zv5xXM35fcywMFOxtbDPDLcLJjuV5k5+1cF9OLZ4XyU
 Fw5WunmhHxTS9QOwc415W6U1sieJ6CgG4x8bFG/EjBo2FJSvAyUEdSYNcpB3rmPfzE
 24OvE8RF7pDyG0MXG2IDRoWLBYB1QNxwL+Z+R5rYRs4cV62FVd82Bcu6879lwHrzn/
 Tln06klRkA2ylotphb2f4yW7FkDjX1poS4ObMcnA5TXaqXqIhXWWedor/7V3CH6geF
 edUqAttGhYDnw==
Date: Fri, 17 Dec 2021 11:34:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
Message-ID: <YbwoWhg6h8ChE5Xs@matsya>
References: <20211204143725.31646-1-digetx@gmail.com>
 <Ybo6tsnQM6OacoZs@sirena.org.uk>
 <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
 <7179a409-d838-0e9e-4600-785e69c3e3a6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H5lYUFRYsnZI2oAy"
Content-Disposition: inline
In-Reply-To: <7179a409-d838-0e9e-4600-785e69c3e3a6@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--H5lYUFRYsnZI2oAy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16-12-21, 17:29, Dmitry Osipenko wrote:
> 15.12.2021 22:19, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 15.12.2021 21:57, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> On Sat, Dec 04, 2021 at 05:37:03PM +0300, Dmitry Osipenko wrote:
> >>
> >>> I based S/PDIF patches on Arnd's Bergmann patch from a separate serie=
s [1]
> >>> that removes obsolete slave_id. This eases merging of the patches by
> >>> removing the merge conflict. This is a note for Mark Brown.
> >> That's not in my tree so I'll need either a pull request with the seri=
es
> >> or a resend after the merge window.
> > This patch is included as a part of this series, please see the patch #=
6.
> >=20
> > I saw that Vinod Koul already merged it into his DMA tree [1] a day ago,
> > but there is no stable branch there.
> >=20
> > [1]
> > https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log=
/?h=3Dnext
> >=20
>=20
> Vinod, will you be a able to create immutable branch for us with the
> "dmaengine: kill off dma_slave_config->slave_id" patches [1]?
>=20
> [1] https://lore.kernel.org/all/20211122222203.4103644-1-arnd@kernel.org/

Here you go:

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git tags/dm=
aengine_topic_slave_id_removal_5.17

for you to fetch changes up to 3c219644075795a99271d345efdfa8b256e55161:

  dmaengine: remove slave_id config field (2021-12-17 11:23:56 +0530)

----------------------------------------------------------------
dmaengine_topic_slave_id_removal_5.17

Tag for dmaengine slave_id removal topic branch which should be merged
into v5.17

----------------------------------------------------------------
Arnd Bergmann (11):
      ASoC: tegra20-spdif: stop setting slave_id
      dmaengine: tegra20-apb: stop checking config->slave_id
      ASoC: dai_dma: remove slave_id field
      spi: pic32: stop setting dma_config->slave_id
      mmc: bcm2835: stop setting chan_config->slave_id
      dmaengine: shdma: remove legacy slave_id parsing
      dmaengine: pxa/mmp: stop referencing config->slave_id
      dmaengine: sprd: stop referencing config->slave_id
      dmaengine: qcom-adm: stop abusing slave_id config
      dmaengine: xilinx_dpdma: stop using slave_id field
      dmaengine: remove slave_id config field

 drivers/dma/mmp_pdma.c             |  6 ------
 drivers/dma/pxa_dma.c              |  7 -------
 drivers/dma/qcom/qcom_adm.c        | 56 ++++++++++++++++++++++++++++++++++=
+++++++++++++++-------
 drivers/dma/sh/shdma-base.c        |  8 --------
 drivers/dma/sprd-dma.c             |  3 ---
 drivers/dma/tegra20-apb-dma.c      |  6 ------
 drivers/dma/xilinx/xilinx_dpdma.c  | 17 +++++++++++------
 drivers/gpu/drm/xlnx/zynqmp_disp.c |  9 +++++++--
 drivers/mmc/host/bcm2835.c         |  2 --
 drivers/mtd/nand/raw/qcom_nandc.c  | 14 ++++++++++++--
 drivers/spi/spi-pic32.c            |  2 --
 drivers/tty/serial/msm_serial.c    | 15 +++++++++++++--
 include/linux/dma/qcom_adm.h       | 12 ++++++++++++
 include/linux/dma/xilinx_dpdma.h   | 11 +++++++++++
 include/linux/dmaengine.h          |  4 ----
 include/sound/dmaengine_pcm.h      |  2 --
 sound/core/pcm_dmaengine.c         |  5 ++---
 sound/soc/tegra/tegra20_spdif.c    |  1 -
 18 files changed, 117 insertions(+), 63 deletions(-)
 create mode 100644 include/linux/dma/qcom_adm.h
 create mode 100644 include/linux/dma/xilinx_dpdma.h

Thanks
--=20
~Vinod

--H5lYUFRYsnZI2oAy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+vs47OPLdNbVcHzyfBQHDyUjg0cFAmG8KFoACgkQfBQHDyUj
g0cMEA/+LySLtN5xrYUyWQlJYPXEglgbzTuSsOz/GvVvGIvw2UqVR4njIWmVypWh
aE7r7IgA4bM3ApFbwXEfNgeXmjRKuBiL7YyxaZ6JxLPyG9kis+yl7j3pwTMkLEW7
W2vcO0jH+QSP2K/nPyQRdyCBfdP0ECtBefVwcpdpDcN7vPhcVKLHADJ9cN4cBTmW
XRji1kutNFxbWPbL068ZBU2t9hl3WVVg3jqVUrEMOeo4RZUyFQDBB7mH4tE+Gj4u
eJUh5ZA0Sn2+DiESYzHdpMvdciS6L2Fe7ujbZFyMQBwA52MtR50pyNlHFxrL7z/C
BHdjuGKWBTP3Jah9AXEQcMpRKZ67NdbNYE4DXwyOscWFkv79Tc3vC7XxHiT4Jztc
2IPIO+vJLORfAxEupml/ARZYwr+pNdA41v4c5aOp+3ZADRN2TLnZfIVkRdx6Zs6F
t9Q2B7xKXIHuS5sLEArpGyHNroJ1f0sF7b4OL/vbKCd6fO/XZvumXpQNHj4N91ET
LjtBtnfLeMRdAei1aqaQzAkLPigBa1E3cYjvdN4uyWDiU7c5NJ91i9U2jE8sR/Oj
2oVUsPTHHQMOQcmoei16ajYF7UFClyGxV/w71L06uCEnFXqRF+Jvd0l2MAxgOMVP
AIB/FPoyX4VkOMZNCbN+iRZ+VUwAaqz11fbGv+O1fbV6j397pvw=
=EFS8
-----END PGP SIGNATURE-----

--H5lYUFRYsnZI2oAy--
