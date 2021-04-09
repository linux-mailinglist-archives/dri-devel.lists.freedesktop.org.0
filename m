Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7951B359872
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 11:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E209A6EBA1;
	Fri,  9 Apr 2021 09:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB7A6EB9C;
 Fri,  9 Apr 2021 09:00:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A43BB5803D8;
 Fri,  9 Apr 2021 05:00:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 09 Apr 2021 05:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=9wZdiVyfNCa7zlMMlbyQAtx8i2y5jWFjax15mPXOD+w=; b=RvLvZ164
 GayszLvHVOAFHYXPp4ZIqPkyzNIRL0DM50Dz4W6L2htRUqqgS07PlKVoceJmrRS7
 WBJlFquUkV/iDXC22i7DTJUp3LadFphXmd2ah2BCerjojCqnSQbqoByKf3dEyoCj
 OIt2eD7GmOKbDxOUMIfjWjuAvk6qVNkbGGLWiJ4Lj0Mg+r8CHcJR+4hov6L1q675
 g6/o/KtFryW6+cHAOGyqQBeAyLT+SSA1zLtkeJYNcU4DkLbnkAddh5jwskpfefBF
 4qfPZ12hTPv0yXjQ4nT3M3FMaO9uiVkJE2UYtTPGDS26rMMwjaMYG/KTFq5ym3z3
 qflqZ/aJsJXPCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=9wZdiVyfNCa7zlMMlbyQAtx8i2y5j
 WFjax15mPXOD+w=; b=qi64YZowj0CZi78EjlyBNPwHkiKytnOqT2367jM3HYyYv
 uwOWHOE6AEEPZU2p8n6b0sjSz9x/pkF5Dy916BsxFlKavbCBvcHfEgTH9IrZRmHX
 gWENdqwY1B9I0NV5M+akvSuISmg3yH/JpJfrZ51cCtJpeAciiasRDISIAxyyc4+N
 OuC4Kq99YRmxcDNSp3/gfs+uaCaPMI4z0srB4sB8aN3qIMps3bXPLMoEMw87Q7uv
 0KkYj2Sbgl4na17idTOZ9g0GZ4jUM9wIl3WL96c5D58mdUGIzbPv6a5DFrSLWU7j
 SteMkQDK/cuyl1TxCI4GI5/8jmTN/5hv3olfdP6yg==
X-ME-Sender: <xms:phdwYNJLWndbC7A-pSWx8HBH3ZGKJvLuPPgGWfYi0JQ2YBsNav5z0Q>
 <xme:phdwYJF1nltsx39dJKupRSclHiTVZH6sPkhJWEiCtai-JYadtedofyMIOjgFoUz5X
 bxE64ztmfUKwAQ20Nc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekuddgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhephfehtefggeekteffueeileekfeegteetfffggfekleehkeffvedvgedtieetvddu
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:phdwYClK6SApB63kDQTfYQd48Rts6Jx1FfoA34yyzBKX8WPseNtuXQ>
 <xmx:phdwYGJWbEnVVl6PmCTkbOncJAxtUZRJz-0ikyVhyUzXNKUwYyxZgQ>
 <xmx:phdwYDbdE0Y9c27Sz7kOEoMiiMcPlfluKrak2oC_M-_e_OsMrNytLA>
 <xmx:qBdwYFhLj_o99puvW-WBGEKnlV6mIx1z01s0VTeniB0TW8L62u41VA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B27491080057;
 Fri,  9 Apr 2021 05:00:22 -0400 (EDT)
Date: Fri, 9 Apr 2021 11:00:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20210409090020.jroa2d4p4qansrpa@gilmour>
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
Content-Type: multipart/mixed; boundary="===============0204137512=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0204137512==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fue5kycgb63vk7px"
Content-Disposition: inline


--fue5kycgb63vk7px
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Like you asked, here's this week drm-misc-next PR

Maxime

drm-misc-next-2021-04-09:
drm-misc-next for 5.13:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - bridge: Fix Kconfig dependency
  - cmdline: Refuse zero width/height mode
  - ttm: Ignore signaled move fences, ioremap buffer according to mem
         caching settins

Driver Changes:
  - Conversions to sysfs_emit
  - tegra: Don't register DP AUX channels before connectors
  - zynqmp: Fix for an out-of-bound (but within struct padding) memset
The following changes since commit 6c744983004ebc66756e582294672f8b991288d5:

  drm/bridge: anx7625: disable regulators when power off (2021-04-01 10:38:=
02 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-04-09

for you to fetch changes up to e8b8b0df8694e39ea6bbbdb9e2fcfa78a61e2e42:

  drm/panel: Convert sysfs sprintf/snprintf family to sysfs_emit (2021-04-0=
8 20:41:38 -0400)

----------------------------------------------------------------
drm-misc-next for 5.13:

UAPI Changes:

Cross-subsystem Changes:

Core Changes:
  - bridge: Fix Kconfig dependency
  - cmdline: Refuse zero width/height mode
  - ttm: Ignore signaled move fences, ioremap buffer according to mem
         caching settins

Driver Changes:
  - Conversions to sysfs_emit
  - tegra: Don't register DP AUX channels before connectors
  - zynqmp: Fix for an out-of-bound (but within struct padding) memset

----------------------------------------------------------------
Carsten Haitzler (1):
      drm/komeda: Fix bit check to import to value of proper type

Christian K=F6nig (1):
      drm/sched: add missing member documentation

Dafna Hirschfeld (1):
      drm/bridge: fix typo in Kconfig

Dan Carpenter (1):
      drm: xlnx: zynqmp: fix a memset in zynqmp_dp_train()

David Stevens (1):
      drm/syncobj: use newly allocated stub fences

Felix Kuehling (1):
      drm/ttm: Ignore signaled move fences

Guobin Huang (1):
      gma500: Use DEFINE_SPINLOCK() for spinlock

Julian Braha (1):
      drivers: gpu: drm: bridge: fix kconfig dependency on DRM_KMS_HELPER

Lyude Paul (4):
      drm/dp: Fixup kernel docs for struct drm_dp_aux
      drm/tegra: Don't register DP AUX channels before connectors
      drm/print: Fixup DRM_DEBUG_KMS_RATELIMITED()
      drm/dp_mst: Drop DRM_ERROR() on kzalloc() fail in drm_dp_mst_handle_u=
p_req()

Oak Zeng (1):
      drm/ttm: ioremap buffer according to TTM mem caching setting

Tian Tao (2):
      drm/komeda: Convert sysfs sprintf/snprintf family to sysfs_emit
      drm/panel: Convert sysfs sprintf/snprintf family to sysfs_emit

Ville Syrj=E4l=E4 (2):
      drm: Refuse to create zero width/height cmdline modes
      drm/vblank: Do not store a new vblank timestamp in drm_vblank_restore=
()

Wan Jiabing (1):
      drm/drm_internal.h: Remove repeated struct declaration

Zhang Jianhua (1):
      drm/bridge: lt8912b: Add header file <linux/gpio/consumer.h>

 drivers/dma-buf/dma-fence.c                        | 27 ++++++++++++-
 drivers/gpu/drm/arm/display/include/malidp_utils.h |  3 --
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c    |  6 +--
 .../gpu/drm/arm/display/komeda/komeda_pipeline.c   | 16 +++++---
 .../drm/arm/display/komeda/komeda_pipeline_state.c | 19 ++++++----
 drivers/gpu/drm/bridge/Kconfig                     |  3 +-
 drivers/gpu/drm/bridge/lontium-lt8912b.c           |  1 +
 drivers/gpu/drm/drm_dp_mst_topology.c              |  5 +--
 drivers/gpu/drm/drm_internal.h                     |  1 -
 drivers/gpu/drm/drm_modes.c                        |  3 ++
 drivers/gpu/drm/drm_syncobj.c                      | 25 +++++++++---
 drivers/gpu/drm/drm_vblank.c                       |  3 +-
 drivers/gpu/drm/gma500/power.c                     |  3 +-
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c       |  4 +-
 drivers/gpu/drm/tegra/dpaux.c                      | 11 +++---
 drivers/gpu/drm/ttm/ttm_bo.c                       |  3 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c                  | 14 +++++++
 drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  2 +-
 include/drm/drm_dp_helper.h                        | 44 +++++++++++-------=
----
 include/drm/drm_print.h                            | 20 ++++++----
 include/drm/gpu_scheduler.h                        |  1 +
 include/linux/dma-fence.h                          |  1 +
 22 files changed, 142 insertions(+), 73 deletions(-)

--fue5kycgb63vk7px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHAXowAKCRDj7w1vZxhR
xZt6AQC0N10+8HJpKjHjQdRQIdtBdWe8D9yMVinbM7zGHbS6PwD+Lf5NFTUx2vIP
BGICmMLR4v0XoqErRIvNWjyzm6Sl1wk=
=aiEp
-----END PGP SIGNATURE-----

--fue5kycgb63vk7px--

--===============0204137512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0204137512==--
