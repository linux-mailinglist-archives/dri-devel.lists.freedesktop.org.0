Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D662933CF35
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 09:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94F36E220;
	Tue, 16 Mar 2021 08:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601416E220
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 08:03:20 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 58CB828D1;
 Tue, 16 Mar 2021 04:03:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 16 Mar 2021 04:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=b5xTk5No1/KY+oOL0uX/HiV5Rl4B9s1QjlTTvpLcaMI=; b=DaiUTa24
 hbOJgpXKB7g30q8QCIn0ueCPcsU/ZTvhdJHMdIPA3KKeeQymyvHD74ZMXAspggDs
 4SAn0RApbAxHTzVPPkua75E3vCxizlq/Z8gPWEpVY2cZxRqjtoNzTYQeZ8+6G4ll
 QZn15XhrOlI/hUNJjS1OSU32SLDnLptYE3wDatxdEtrKHq+fA/eyeGWXXG9wRs/Z
 SPocQt8MhWB2SkhZauSZp74BHkWgGpAKiJ2W5EAItZTicpPnZw6nCDIVb/lJnu4L
 8pytnIDUyMBJw6HaXNvQ796+IY6YYR7V7BeUnrVOHrrNeEUly7wq9pS3n+q5qNZC
 mi3FACjj9kunrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=b5xTk5No1/KY+oOL0uX/HiV5Rl4B9
 s1QjlTTvpLcaMI=; b=cM8C1Jk9Ku2p0eBGwqjEc6xbqYR+tarnLg2zUSbdy+q1R
 YCDORno9XxqxYcft+GRleVjVJ5LGuijP1OnXMT4D5oGVr0SZ0s31svGcNi5YgLF3
 ztsbtMFZBztMTFgokTVcUjf8tgXGL+jNIbcahqaBk6MqGAY/mEr5w+y830bxadeO
 P9OrUr3TRJUNIbxQF5+KLwjnfXzEZGripkjCAcITVn0yegHdlfWkqMBp9skaflbU
 Wj3s+/2tGY3HaaqWLVrlvwq4zavb9EG/IQl1+0MDJVeb1OGsqkds2aL5YDXktWjh
 bQvNNygws4YUKQ8T7p+nwwLv6Gykn/KTNwicUmeIA==
X-ME-Sender: <xms:QGZQYPVL_gLmT8KvDECT4I-tnEj5-8IPNwhUHE4nECz6DwiIfa78Qw>
 <xme:QGZQYHmRVoIqMcFrB2LW_XJCYtm-75HWcpwnWIpLIKOnC4xc3iIaPD9OQ45kuC1ed
 ytNqvHBQd1O-KqFqRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkgggtugesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefhheetgfegkeetffeuieelkeefgeetteffgffgkeelheekffevvdegtdeitedv
 udenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepledtrdekle
 drieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QGZQYLb-ekazvxp2i9-gKW02l9cp-DDNf6Ru5dFXVQH7eB-FL0jdDg>
 <xmx:QGZQYKVj4WviVcawXSZKcnTUNA0O_hyYhw2FyqjiCCaGDGsEC--BoQ>
 <xmx:QGZQYJlv3Zwy7ZdIh0BednSrO_KTMCbtG6WObBfb4se887ZiLU_wtA>
 <xmx:QmZQYL4AX70oB1KE_H84R3MP_zczwmRH7-NMBoRGTh47SJB3uaLJ73EFk38>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A562A24005D;
 Tue, 16 Mar 2021 04:03:12 -0400 (EDT)
Date: Tue, 16 Mar 2021 09:03:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20210316080309.r7ngjobpd7ppp36p@gilmour>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1421910537=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1421910537==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hxvbkc2lonjwybzr"
Content-Disposition: inline


--hxvbkc2lonjwybzr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

It's been a fairly quiet week, but here are the changes for drm-misc-next

Thanks!
Maxime

drm-misc-next-2021-03-16:
drm-misc-next for 5.13:

UAPI Changes:
  - Documentation for the DRM_CAP_* defines

Cross-subsystem Changes:

Core Changes:
  - dma-fence: More documentation for the recoverable page faults
  - fb_defio: Remove custom address_space operations

Driver Changes:
  - panel: Support for the Innolux N116BCA-EA1
  - stm: Use simple encoder for lcdc
  - virtio: Fix potential virtio_gpu_object_array leak
The following changes since commit 762949bb1da78941b25e63f7e952af037eee15a9:

  drm: fix drm_mode_create_blob comment (2021-03-02 20:43:34 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-03-16

for you to fetch changes up to ccf953d8f3d68e85e577e843fdcde8872b0a9769:

  fb_defio: Remove custom address_space_operations (2021-03-12 15:10:03 +01=
00)

----------------------------------------------------------------
drm-misc-next for 5.13:

UAPI Changes:
  - Documentation for the DRM_CAP_* defines

Cross-subsystem Changes:

Core Changes:
  - dma-fence: More documentation for the recoverable page faults
  - fb_defio: Remove custom address_space operations

Driver Changes:
  - panel: Support for the Innolux N116BCA-EA1
  - stm: Use simple encoder for lcdc
  - virtio: Fix potential virtio_gpu_object_array leak

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/sched: select new rq even if there is only one v3

Daniel Vetter (1):
      dma-fence: Document recoverable page fault implications

Douglas Anderson (6):
      drm/panel-simple: Undo enable if HPD never asserts
      drm/panel-simple: Don't wait longer for HPD than hpd_absent_delay
      drm/panel-simple: Retry if we timeout waiting for HPD
      dt-bindings: dt-bindings: display: simple: Add N116BCA-EA1
      drm/panel-simple: Add N116BCA-EA1
      drm: panel: simple: Set enable delay for BOE NV110WTM-N61

Jagan Teki (1):
      drm/stm: ltdc: Use simple encoder

Jianhui Zhao (1):
      docs: gpu: fix typo

Linus Walleij (1):
      drm/mcde/panel: Inverse misunderstood flag

Matthew Wilcox (Oracle) (1):
      fb_defio: Remove custom address_space_operations

Paul Cercueil (1):
      drm/ingenic: Fix non-OSD mode

Simon Ser (1):
      drm/uapi: document kernel capabilities

Tian Tao (1):
      drm/vboxvideo: Use managed VRAM-helper initialization

Yannick Fertre (1):
      drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER

xndcn (1):
      drm/virtio: fix possible leak/unlock virtio_gpu_object_array

 .../bindings/display/panel/panel-simple.yaml       |   2 +
 Documentation/driver-api/dma-buf.rst               |  76 +++++++++++++
 Documentation/gpu/todo.rst                         |   2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  11 +-
 drivers/gpu/drm/mcde/mcde_dsi.c                    |   2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      |   3 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      |   4 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c  |   1 -
 drivers/gpu/drm/panel/panel-simple.c               |  85 +++++++++++++-
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       |   3 +-
 drivers/gpu/drm/scheduler/sched_entity.c           |   6 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              |   9 +-
 drivers/gpu/drm/stm/ltdc.c                         |  12 +-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c               |   7 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c             |   2 +-
 drivers/gpu/drm/virtio/virtgpu_object.c            |   1 +
 drivers/video/fbdev/core/fb_defio.c                |  35 ------
 drivers/video/fbdev/core/fbmem.c                   |   4 -
 include/linux/fb.h                                 |   3 -
 include/uapi/drm/drm.h                             | 125 +++++++++++++++++=
+++-
 20 files changed, 303 insertions(+), 90 deletions(-)

--hxvbkc2lonjwybzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFBmPQAKCRDj7w1vZxhR
xfnDAP98tZRBK9wU6cYAVvCIy2lzC+XQ+gnr9RpvXt2ZF/R+pgD+LTFN0M0e8iw9
1tGBvnc0SawV+AIouGcK13Tgj04cfwI=
=czAO
-----END PGP SIGNATURE-----

--hxvbkc2lonjwybzr--

--===============1421910537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1421910537==--
