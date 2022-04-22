Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE9E50B325
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05FC910E3F7;
	Fri, 22 Apr 2022 08:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C959610E3F7;
 Fri, 22 Apr 2022 08:44:10 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B6C35C0212;
 Fri, 22 Apr 2022 04:44:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 22 Apr 2022 04:44:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1650617047; x=1650703447; bh=d+/lNnUQtWysf+WjLm8XY0mPLaMx1FTIczV
 n/S9alAc=; b=Ve3JyXJWNuwRLdsWVWXTT6p6luDTIpqpxW+tCbjjgA4BUJ+yHNA
 wJfN7c5PekX8bQNQF7qlX+9N7AamHC+81T+FNPoNH3Xhbh5l3hGEfdry+LHzul8B
 qkQe+8q8bMLT7nsM6phFfmUTV7de1eZAr8v7+CMdxj+aekW9tuRYbr4c38eprloC
 YnUwNo69MTYLji+FAbPuEwgeqUq7+vjGhljM+ck6z3gFJk5oydES52NVEU/khgA3
 6M5NmsCvQZf+TLmUSY/HQbXbTxRKlJ81DSEgDCWEOTiTfhh5rKWuZJ6lz/oUz4bY
 6OhEnuEXn8NHDwy5QeVp/T+TWgUojwmXYyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650617047; x=1650703447; bh=d+/lNnUQtWysf
 +WjLm8XY0mPLaMx1FTIczVn/S9alAc=; b=RlWXmOQr4jsI7/ocTaH70JArqxsL2
 of7Oj9ufMqXFpYWjQ+JKRpOD4GRTlq9xbVzK+kJdai01H8fgwnGbfu/YhfFZMP3B
 MwIGn6dHIEZlpMdIWuno/H0M/MZZIiCOIkyMWBmeXsKbQp2Tvmx54a/GETT4xWs2
 y6UtDoWMN4MRql29icumzRnjMHRQAIR/jjjvRB1YpCtiVNc/A9I4RqDcywTrcFlk
 nqsc4xU9PRmC31MajCFtkhy+wWyjvc+p0AdAbyKvoyyI9pD10DS/o1Z0atp8+q64
 HcW5O5vcHG4nTpseXV0g1pBDNv+sT2Xf0lqxx/NPuAVqCJjvMYNwnthrQ==
X-ME-Sender: <xms:1mpiYplUS1Md9jJrbHuXTTMFkSaC2Z2xQoa8_IMKqeTjq4BIL4wx6A>
 <xme:1mpiYk2XFhhnw_qmFc4rr_4gKZLCwdJGG7-cZWRNVv9kRFWBX50etGIMpWxZt2Xof
 Bcvwa6lb6vpMqreWFs>
X-ME-Received: <xmr:1mpiYvrx6cVTzSJeSadUoH1y3Ab-by8WApwh5VS6kICJPHyMyZdz620cA5NYqMPamcsAuEZIMSJSCWxZDBIMZGbiKEooeO0vmQd8AKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdeggddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepkeehjeeguefhtefhgfehkeehudefudfhjefgheffkedufeegudfghfekfefhvedv
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:1mpiYpkPXpeNqUrNPswGqaIR8jhZ6oDuPeWG5gOV3gWfVcw2MOFVVQ>
 <xmx:1mpiYn3eX0CdBxUyjN6qdTGx0JUajaSfPmQ2a7wBXGTKFAyDcERtQw>
 <xmx:1mpiYoul2IzQeo2JFruFN-it9MSyKyhhAL7u71SsX-Yn7Am4lXFhug>
 <xmx:12piYgsKH1mSkLT6wy5ZWeLkOa6mYhdHC6k3gGOhEvAeKQSM6L8mVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Apr 2022 04:44:05 -0400 (EDT)
Date: Fri, 22 Apr 2022 10:44:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220422084403.2xrhf3jusdej5yo4@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v3com74cqrjvwtmg"
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--v3com74cqrjvwtmg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Dave,

Here's this week drm-misc-fixes PR.

The two reverts for devm_drm_of_get_bridge are likely to bring more
reverts in the future.

Indeed, it introduced some code to fetch the panel automatically on
device tree child nodes as well, but that broke any driver with a child
node that wasn't a panel.

The reversion seems to be the best course of action right now, but it
was later pointed out that a number of drivers had been converted to
rely on the new behaviour, so those are likely to be broken now.

I'm not sure if it would be acceptable to merge them at this point, or
delay the merge drm-misc-fixes until those drivers are fixed?

Maxime

drm-misc-fixes-2022-04-22:
Two fixes for the raspberrypi panel initialisation, one fix for a logic
inversion in radeon, a build and pm refcounting fix for vc4, two reverts
for drm_of_get_bridge that caused a number of regression and a locking
regression for amdgpu.
The following changes since commit 1ecc0c09f19f8e10a2c52676f8ca47c28c9f73c7:

  dt-bindings: display: panel: mipi-dbi-spi: Make width-mm/height-mm mandat=
ory (2022-04-07 03:28:10 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-04-22

for you to fetch changes up to 94f4c4965e5513ba624488f4b601d6b385635aec:

  drm/amdgpu: partial revert "remove ctx->lock" v2 (2022-04-21 11:26:20 +02=
00)

----------------------------------------------------------------
Two fixes for the raspberrypi panel initialisation, one fix for a logic
inversion in radeon, a build and pm refcounting fix for vc4, two reverts
for drm_of_get_bridge that caused a number of regression and a locking
regression for amdgpu.

----------------------------------------------------------------
Bjorn Andersson (2):
      Revert "drm: of: Properly try all possible cases for bridge/panel det=
ection"
      Revert "drm: of: Lookup if child node has panel or bridge"

Christian K=F6nig (2):
      drm/radeon: fix logic inversion in radeon_sync_resv
      drm/amdgpu: partial revert "remove ctx->lock" v2

Dave Stevenson (2):
      drm/panel/raspberrypi-touchscreen: Avoid NULL deref if not initialised
      drm/panel/raspberrypi-touchscreen: Initialise the bridge in prepare

Karol Herbst (1):
      dma-buf-map: remove renamed header file

Miaoqian Lin (1):
      drm/vc4: Use pm_runtime_resume_and_get to fix pm_runtime_get_sync() u=
sage

Zack Rusin (1):
      drm/vmwgfx: Fix gem refcounting and memory evictions

Zheng Bin (1):
      drm/vc4: Fix build error when CONFIG_DRM_VC4=3Dy && CONFIG_RASPBERRYP=
I_FIRMWARE=3Dm

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  21 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h            |   1 +
 drivers/gpu/drm/drm_of.c                           |  86 +++----
 .../gpu/drm/panel/panel-raspberrypi-touchscreen.c  |  13 +-
 drivers/gpu/drm/radeon/radeon_sync.c               |   2 +-
 drivers/gpu/drm/vc4/Kconfig                        |   3 +
 drivers/gpu/drm/vc4/vc4_dsi.c                      |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                 |  43 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c            |   7 +-
 include/linux/dma-buf-map.h                        | 266 -----------------=
----
 12 files changed, 95 insertions(+), 359 deletions(-)
 delete mode 100644 include/linux/dma-buf-map.h

--v3com74cqrjvwtmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmJq0wAKCRDj7w1vZxhR
xSZWAQDXTlsC/kHvkvegm/3AyO9esqBUEsFeBpF9AUGNeg+SSwD/cZAx0AkzONzZ
TRVV14DmHavP8k52UYwpP4uQ/e+/5Qg=
=1tKk
-----END PGP SIGNATURE-----

--v3com74cqrjvwtmg--
