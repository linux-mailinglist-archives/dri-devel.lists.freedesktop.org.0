Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20376637303
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 08:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6F610E69A;
	Thu, 24 Nov 2022 07:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA1910E6A2;
 Thu, 24 Nov 2022 07:46:18 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 902AD580301;
 Thu, 24 Nov 2022 02:46:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 24 Nov 2022 02:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1669275977; x=1669283177; bh=KisEiFDMMhs9iBXJNi8EggNl/VY/12faNug
 7qu1eLHk=; b=ICdTw3ExO3MIWfIea3P1BFcLBu7U7nxhInDGo9JL2R/fZKSCNlg
 9jMALSpd7TCJj049Uq1iBYZhskvi0X5FAyF7LzKEy3ip+cVKj0rqIE1a5bHsvoae
 DSKA4+zROfsJCey/qnUt2QXzcTDCruRkUiOD1Qocimh1RPhQmsgpHar/06JAORhc
 HHyHhOwpGIwKC17pitWDpxbTB0ClHBZg+WgDspKf/QdL9kR3BAB/oqfa5i+Xglzt
 tJjt9zIqRGUHvK7ebJFHmxH+YAG7CbL5Q5E5aqCmuBsYgInsb2zLKPTTT+DgR/YD
 BInCP/QUVrp0Rdcwg14+MjDxZrabsQFfZTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669275977; x=
 1669283177; bh=KisEiFDMMhs9iBXJNi8EggNl/VY/12faNug7qu1eLHk=; b=e
 yRG6kJF6jmAvOKC7PmNWlUZ6Ga5g421xy4EGMaC4rNsn6HVgs2detjIvHK4NxvV9
 SKOlb6xUKfQmn+1McojJ843mUl5DnULAvlpuZSSjSkKYGFYOwflY9OS1XKa9A08Y
 0KEt2IVAvMJfk5j2g3uzBpO8TolvtLkVYvAEGupTnFiSCrWZidpYEYgPn/l3RQYc
 ig3DlDEOWi7cXzG1Za46UZ4OCNiwEl9ahdj+wqNpwmZhh4UszWSaJdNIpJekPmWQ
 PdWKRdTklhhFAToeTECdtEGfNN/qG5hewKj+iLGOnAWBA69f/wM/raUxcmYbw2K3
 A1vZUm1zCzbY44WRiOteg==
X-ME-Sender: <xms:SSF_Y3XO24cE_Mp2WhkK21mx0EuRaf782rGSwTuV5VYvBh24wNNjXA>
 <xme:SSF_Y_kh5mX-C8OFw2PhhF7gbaFU-vdwjgYMwrhokcg0roEIDJrSN_GKoChLoyqiA
 PQdP_VgfrOol0myicY>
X-ME-Received: <xmr:SSF_YzaFblyG65o9zu6E7--Rzxat0entnZYYwilYbO_ZaI3Qxhz7FA1rPrpHs7K6bljdLJeJ4x84OYpVPyXKsrce4yLVWMnSe_4G5mIad_ccFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedriedvgddutdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeuieehjefhieevtdehudfftdetgfdtuedvvdeugeetgfevgeevudegffduveej
 ieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:SSF_YyWoaI0qxjtu3dnqP0_3l3XYhRJzh3BtAv5KplXvjkNtS9xk3w>
 <xmx:SSF_YxmaAJHRW-7fEp0myC2PsCcXQdROUX8krOdFUIb0Li6ZHTrfqw>
 <xmx:SSF_Y_eupoX3BeKP2EA6tn2LE4ELpS3SYn7qN_-82WJhyWqAb8fHBw>
 <xmx:SSF_YzVHKqIGBnzp4Yr7aX58W_Ef7g1CqV6FbY_LmIDIxdMLaLn5Tg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Nov 2022 02:46:16 -0500 (EST)
Date: Thu, 24 Nov 2022 08:46:15 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <20221124074615.ahflw5q5ktfdsr7k@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h4obmk5bs2yftcsp"
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


--h4obmk5bs2yftcsp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

We might be fairly late for a drm-misc-next PR by now, but I chose to
send it anyway because we might have an -rc8, and this is almost
exclusively fixes that should go in anyway. This will be the last
drm-misc-next PR for this cycle

Maxime

drm-misc-next-2022-11-24:
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:
- fbdev: Make fb_modesetting_disabled() static
- udmabuf: Add vmap and vunmap methods to udmabuf_ops

Core Changes:
- doc: make drm-uapi igt-tests more readable
- fb-helper: Revert of the damage worker removal
- fourcc: Add missing big-endian XRGB1555 and RGB565 formats
- gem-shmem: Fix for resource leakage in __drm_gem_shmem_create()
- scheduler: Fix lockup in drm_sched_entity_kill()

Driver Changes:
The following changes since commit 35c3a2d02f0dc153a5f2f304ba33e1436b6a8d8f:

  drm/tests: helpers: Add SPDX header (2022-11-17 09:25:38 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2022-11-24

for you to fetch changes up to 6fb6c979ca628583d4d0c59a0f8ff977e581ecc0:

  drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats (2022-11-23 20:34:46 +0100)

----------------------------------------------------------------
drm-misc-next for 6.2:

UAPI Changes:

Cross-subsystem Changes:
- fbdev: Make fb_modesetting_disabled() static
- udmabuf: Add vmap and vunmap methods to udmabuf_ops

Core Changes:
- doc: make drm-uapi igt-tests more readable
- fb-helper: Revert of the damage worker removal
- fourcc: Add missing big-endian XRGB1555 and RGB565 formats
- gem-shmem: Fix for resource leakage in __drm_gem_shmem_create()
- scheduler: Fix lockup in drm_sched_entity_kill()

Driver Changes:

----------------------------------------------------------------
ChunyouTang (1):
      drm/gem-shmem: When drm_gem_object_init failed, should release object

Dmitry Osipenko (1):
      drm/scheduler: Fix lockup in drm_sched_entity_kill()

Geert Uytterhoeven (1):
      drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats

Lukasz Wiecaszek (1):
      udmabuf: add vmap and vunmap methods to udmabuf_ops

Randy Dunlap (1):
      drm/doc: make drm-uapi igt-tests more readable

Shang XiaoJing (1):
      drm: Fix potential null-ptr-deref due to drmm_mode_config_init()

Thomas Zimmermann (4):
      fbdev: Make fb_modesetting_disabled() static inline
      Revert "drm/fb-helper: Remove damage worker"
      Revert "drm/fb-helper: Schedule deferred-I/O worker after writing to framebuffer"
      Revert "drm/fb-helper: Perform damage handling in deferred-I/O helper"

 Documentation/gpu/drm-uapi.rst           | 12 ++++++------
 drivers/dma-buf/udmabuf.c                | 28 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_fb_helper.c          | 30 +++++++++++++-----------------
 drivers/gpu/drm/drm_fourcc.c             |  4 ++++
 drivers/gpu/drm/drm_gem.c                | 19 ++++++++++++++++---
 drivers/gpu/drm/drm_gem_shmem_helper.c   |  4 +++-
 drivers/gpu/drm/drm_mode_config.c        |  8 +++++++-
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   |  4 ++--
 drivers/video/fbdev/core/fb_defio.c      | 16 ----------------
 include/drm/drm_fb_helper.h              |  2 ++
 include/drm/drm_gem.h                    |  1 +
 include/linux/fb.h                       |  3 +--
 13 files changed, 84 insertions(+), 49 deletions(-)

--h4obmk5bs2yftcsp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY38hRwAKCRDj7w1vZxhR
xYMUAQCQ2utE5S+FiuNVJNirReX6RDfFoxmWTKHQEFGtgFSIHgD/Xnq0u+o2Jg5r
omFcmiGn1l5uDeFxzWB/Nb7FXCfC0gg=
=OZUH
-----END PGP SIGNATURE-----

--h4obmk5bs2yftcsp--
