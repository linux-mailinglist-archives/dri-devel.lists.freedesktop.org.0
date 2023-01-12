Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A56672F1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 14:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC2110E8EE;
	Thu, 12 Jan 2023 13:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9413A10E8E9;
 Thu, 12 Jan 2023 13:10:02 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 433D8582FF7;
 Thu, 12 Jan 2023 08:09:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 12 Jan 2023 08:09:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1673528998; x=1673536198; bh=8U9zLEHso5Vew1pgYQV+YycbfUU86chqC16
 4aPfsHhY=; b=DkPcG317dF1G9rsJEO4Gp6qf4TYImB9Ili0/J5/0Ee23L27DNTJ
 AXpQL5EFcA1pzBSQ6BQe/ml3pLhcQpS/tHjIdv9oK9B28sQH2th9b9k5JepL6Ujt
 XgLBe4FRHv8ctLwbO2vOYJeKAVSSN+lWy+YdMmlTLAjzsjdIR931uN4EiT8k/+jM
 cr307MXU2ur5O1xY01eEXFZ4/w4eBd6sMEF5wobh36vW30nVvwX+F8vXJty3aYdt
 DSj06X48yTdp60jSdwVblFvpCGK7lIHwWNps+IIZZwRU1sUFlUnYtS+yjgZbkQuj
 y7+oOsvluFKsmIi9Yw4xJC4tS4QNruvkqxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673528998; x=
 1673536198; bh=8U9zLEHso5Vew1pgYQV+YycbfUU86chqC164aPfsHhY=; b=L
 akB3Qj2imZgdYg1GF1WB0EeYa2PMdlNZvQme4QHOdmml7mrtkY8CcBq09+YRN6xE
 XCt/qemEF+ryC49+Lte0oJcWyVAg/VQHGnFI9zZqYfwywIPOhGQFxhy3yYf/mC17
 J2wRZIKMeHRqpSyelOWggawIhFp1lHN3sZwoKVL7EDyeY9bjJhHz9IaqRlgrZsJb
 HdGOTP5qfyMt2IdpUQ2MpI9VoMYjaEh1PvXmcldl1EtdF3BxIdeejMax4GUxGdaA
 ++Bqob2hESxioIiShTjALhZpaOLqRjyO1iswUevFh6ruiQ/o3wwbROfInnfubUoP
 CvweCXvN4ixFhNloOu0Vw==
X-ME-Sender: <xms:pQbAY7IteW4Q-fOPz9Kn0AktAEO25psjCittc-wjGDEWTKOysr9AFw>
 <xme:pQbAY_J8tKwJTRa_IkKwOZvpfJwTAD3OALDjDAfxYUjXotrG38mYBSnPb8Dp0jkAM
 LDwiT7nI4LEkMPyi3o>
X-ME-Received: <xmr:pQbAYzv3krPoV_IZEVJ_qM_O1zAIadgJ_GSb_bKbJKwJVuu-7v-32UYDXn5hqtzWaeNBRemQeMoLMLmkems8vLz8e-xllPTrVfa0QNPDK9kClw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrleeigdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfggtggusehgtderredttddunecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepkeehjeeguefhtefhgfehkeehudefudfhjefgheffkedufeegudfghfekfefhvedv
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:pQbAY0ay-dikNoHepRZJ1rXB2fmvVi2D4a7l7eazYJ_E2sUDYXPZKw>
 <xmx:pQbAYyaQRwF6yfuCSAoQNxUFKNPpCL4QspAcHxwjGn8xofa_e6wlwg>
 <xmx:pQbAY4Ag6S6xSDhNxL5UbxwQ3_0j-FHB7oy8l_fGPPVHRo-A4GHnTw>
 <xmx:pgbAY_IIYXCFF27PbWOxNi_b2wjKVL0jWxc_V0xexW18wzFLpvXQwA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Jan 2023 08:09:57 -0500 (EST)
Date: Thu, 12 Jan 2023 14:09:54 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230112130954.pxt77g3a7rokha42@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2ivsbvpc53bknku6"
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


--2ivsbvpc53bknku6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, Daniel,

Here's this week drm-misc-fixes PR

Maxime

drm-misc-fixes-2023-01-12:
Several fixes for amdgpu (all addressing issues with fences), yet
another orientation quirk for a Lenovo device, a use-after-free fix for
virtio, a regression fix in TTM and a performance regression in drm
buddy.
The following changes since commit 83e79ae3216c70f2b63c935a4e089d1620e8ef01:

  Merge tag 'drm-misc-fixes-2023-01-05' of git://anongit.freedesktop.org/dr=
m/drm-misc into drm-fixes (2023-01-05 09:43:37 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-01-12

for you to fetch changes up to 5640e81607152d7f2d2558227c0f6cb78b8f39cf:

  drm: Optimize drm buddy top-down allocation method (2023-01-12 13:50:28 +=
0100)

----------------------------------------------------------------
Several fixes for amdgpu (all addressing issues with fences), yet
another orientation quirk for a Lenovo device, a use-after-free fix for
virtio, a regression fix in TTM and a performance regression in drm
buddy.

----------------------------------------------------------------
Arunpravin Paneer Selvam (1):
      drm: Optimize drm buddy top-down allocation method

Christian K=F6nig (3):
      drm/amdgpu: fix another missing fence reference in the CS code
      drm/amdgpu: fix missing dma_fence_put in error path
      drm/amdgpu: fix pipeline sync v2

Patrick Thompson (1):
      drm: Add orientation quirk for Lenovo ideapad D330-10IGL

Rob Clark (1):
      drm/virtio: Fix GEM handle creation UAF

Thomas Zimmermann (1):
      drm/nouveau: Remove file nouveau_fbcon.c

Zack Rusin (2):
      drm/vmwgfx: Remove rcu locks from user resources
      drm/ttm: Fix a regression causing kernel oops'es

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c         |  51 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c       |   4 +-
 drivers/gpu/drm/drm_buddy.c                    |  81 ++--
 drivers/gpu/drm/drm_panel_orientation_quirks.c |   6 +
 drivers/gpu/drm/nouveau/nouveau_fbcon.c        | 613 ---------------------=
----
 drivers/gpu/drm/ttm/ttm_bo_util.c              |   2 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c         |  19 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c            |  41 +-
 drivers/gpu/drm/vmwgfx/ttm_object.h            |  14 -
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c             |  38 --
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h            |  18 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c        | 176 ++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c       |  33 --
 13 files changed, 202 insertions(+), 894 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/nouveau_fbcon.c

--2ivsbvpc53bknku6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY8AGogAKCRDj7w1vZxhR
xcApAQDxfvcXt7rzX+FDI8o3reFchM6SmpnFU2BmUog+Ln7PTgD/Rcetz5lnFi8m
ud5SFweGdEinBAX6u/yaUwVb00DZlgE=
=SnLH
-----END PGP SIGNATURE-----

--2ivsbvpc53bknku6--
