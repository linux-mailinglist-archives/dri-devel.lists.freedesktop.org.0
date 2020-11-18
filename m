Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16B32B8D1C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B18B6E50B;
	Thu, 19 Nov 2020 08:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1E46E027
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 09:13:08 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 55B5110EF;
 Wed, 18 Nov 2020 04:13:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 18 Nov 2020 04:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=HxCqBcf+qWY8PiWLGwUhkFtSWcBPC/bFzwgmA4UeiDs=; b=jWzpCF/5
 mdPFKFeYTaQN4WD5icVuwEsxmiLtPrE9feTPBEJciHoQv/Nf7urJVYMve+G52R7p
 SAr0p+K8vHtO1UN9KoQb9ebFya6Ap9vzTN+Lexxo45cXldosbQYvc7eb0QsGmoEF
 FtqkW5SFxLAJ21/DPMjD/biX/Nnvn+tEogH3y1j4BW4QP6vAQi/YPywSR7JG0G5B
 uBTd9xcYuUX9oHb8cae04RHMVZO7RjXthmzT5hOXT6AlrpWtpmFNFPA/v3QsEE9M
 V7gjQB+LO1GeVD0+rw2PR4l6ou3eE9xRgLIV7ntel/mW/PmEBSSvuCA6fOOdLm1y
 fanT4Bi1kwY+Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=HxCqBcf+qWY8PiWLGwUhkFtSWcBPC
 /bFzwgmA4UeiDs=; b=G3WCUePOziJ1cYEnw4kmY5LQXi0CpgZbtPbANCtuZrewK
 D7Y1foTea4DLXVvN483oJNaZ6mb01/pFQDTw8sgt2vAkhbEaVkiMTbQtxO5ybEcq
 qk6jEDv5iJO5ZvkaiAUKJr1ZMxDj2QGQqcer20ylQG3jrsztS/7jjhBWik7Fa0/v
 fVycI+rXV1HwrqUvJ8VEWYMyaLHZ1MbdCp9pi4RdrdYs/qM3jzaoiJ6KMkZ0Zg3p
 VfyeGx2KQzRcgAAWJFFzN9eklzNcMw/zH3NNsRgt5XT4YnorT/kitmm0Ww9C+Afz
 OG5f7yhtQQMHt+qGKtzQytVqKZqb/PhZt7hcfwSEQ==
X-ME-Sender: <xms:oeW0X5eaB_swPmpYdSOmdrFvoOeNkh2yhW6i_MaNzHsC3HkiK3GPPg>
 <xme:oeW0X3OYSnR99xKciBKc5JwGnfjuYGkRz7sQ5Fy0V8vsOpo3-Rznrhe4wkznUFDam
 sR-RAGrp-QMTrIpsoI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefhedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeehvddvffelveeiuefggfeiueduvdfhfeeuhffgleejleeghfdvgedtveegleek
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oeW0XyiTHsQUErWuGiIWPLYBdcmfJNd03EgbKrxnk6oUrsJRPoH1hg>
 <xmx:oeW0Xy8E_pb7vPSEcKrXlIx7DIHrYfTydvSodlIJU1fAhCHIPtc9Xw>
 <xmx:oeW0X1vGgVsoonyyOBIM8cS6KOuLnFVe51o7KtATmiZikcgEBNxHnQ>
 <xmx:ouW0X5jT_COYKzkhnVuYDpNtwnrafkpv9FVgWnviqgnhYPNMil5jgg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2699328005E;
 Wed, 18 Nov 2020 04:13:04 -0500 (EST)
Date: Wed, 18 Nov 2020 10:13:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: arm@kernel.org
Subject: [GIT PULL] Allwinner MBUS and DMA-ops rework
Message-ID: <20201118091303.wa5npxyop3cdsczb@gilmour.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2082354266=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2082354266==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lalwlgtk5ysq3sti"
Content-Disposition: inline


--lalwlgtk5ysq3sti
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd, Olof,

Here's the PR for the MBUS rework we discussed in the last couple of
weeks, for what will become 5.11.

As Arnd suggested, this is based on a PR sent to drm-misc-fixes to merge
the initial fix for a probe error in drm/sun4i due to
dma_direct_set_offset.

Thanks!
Maxime

The following changes since commit 957a1ea3599210e9996777a734ea5284eaef75c7:

  drm/sun4i: backend: Fix probe failure with multiple backends (2020-11-18 09:01:30 +0100)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git tags/sunxi-rework-mbus

for you to fetch changes up to 16fee29b07358293f135759d9fdbf1267da57ebd:

  dma-mapping: remove the dma_direct_set_offset export (2020-11-18 09:11:38 +0100)

----------------------------------------------------------------
Allwinner MBUS and DMA-ops rework

The Allwinner SoCs have a number of high-bandwidth devices connected to
a memory bus with a different RAM mapping than the CPU.

This was addressed before through drivers setting the DMA offsets
directly, and subsequently changed to calls to dma_direct_set_offset.
However that wasn't really meant to be exported to modules (and thus
drivers). The duplicated code also led to small inconsistencies across
drivers in how we dealt with DT backward compatibility.

Move all that DMA setup code into a platform bus notifier to share that
code and remove the export on dma_direct_set_offset.

----------------------------------------------------------------
Christoph Hellwig (1):
      dma-mapping: remove the dma_direct_set_offset export

Maxime Ripard (6):
      soc: sunxi: Deal with the MBUS DMA offsets in a central place
      drm/sun4i: backend: Remove the MBUS quirks
      media: sun4i: Remove the MBUS quirks
      media: sun6i: Remove the MBUS quirks
      media: cedrus: Remove the MBUS quirks
      media: sun8i-di: Remove the call to of_dma_configure

 arch/arm/mach-keystone/keystone.c                  |   2 +-
 arch/arm/mach-omap1/usb.c                          |   2 +-
 arch/sh/drivers/pci/pcie-sh7786.c                  |   2 +-
 arch/x86/pci/sta2x11-fixup.c                       |   3 +-
 drivers/gpu/drm/sun4i/sun4i_backend.c              |  19 ---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c |  27 -----
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c |  17 ---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c   |   4 -
 drivers/soc/sunxi/Kconfig                          |   8 ++
 drivers/soc/sunxi/Makefile                         |   1 +
 drivers/soc/sunxi/sunxi_mbus.c                     | 132 +++++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus.c        |   1 -
 drivers/staging/media/sunxi/cedrus/cedrus.h        |   3 -
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c     |  18 ---
 include/linux/dma-map-ops.h                        |   3 +
 include/linux/dma-mapping.h                        |   7 --
 kernel/dma/direct.c                                |   1 -
 17 files changed, 149 insertions(+), 101 deletions(-)
 create mode 100644 drivers/soc/sunxi/sunxi_mbus.c

--lalwlgtk5ysq3sti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7TlnwAKCRDj7w1vZxhR
xW/OAP9j/UIJk6SYCXq1E6W8GSYLiROWK5uW51aD4dHLLxSGowD+PHk6VOGXKaJi
U5+UUq9AZlbBURBTsPuOtei3oQI27AQ=
=SHlM
-----END PGP SIGNATURE-----

--lalwlgtk5ysq3sti--

--===============2082354266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2082354266==--
