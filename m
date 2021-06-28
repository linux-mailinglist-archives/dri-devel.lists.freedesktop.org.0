Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 530223B5E36
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 14:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7006E44A;
	Mon, 28 Jun 2021 12:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA866E44A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 12:43:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 022F35804FF;
 Mon, 28 Jun 2021 08:43:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 28 Jun 2021 08:43:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=qYJzqGRayG5fc3vFetGGsRUNaW
 hIjr1nAhdURETU8yc=; b=wAOfsvSckW7NsJzlY9nNYgyVGnniicmu9frDDYpGvz
 hbL0fyHdL2qYOnRhbUzwp4DN0yyZ1wrVgguSB4JSQmoOys6uK1HtAncYAaDxzAl7
 rct/QIKksR7nhQn0x9G6SA63kel2zDKnt2lrLOYYAIEezNIGo9+ksL174+jhNDmO
 +KaFuI2qg863Zhakxk3jPTfMfeKyo88LDxZdbosYvOGN69RR1c0b0olNeCUcMKs+
 yIaEUr1uSRNlabRKg7cor3r3mWfdCEnfitK9WzadtnktcWv9B3AQw/QdPOaZ3H4C
 fh2vW7INiFIYc6mm885ZKSkZ13P7hfKhEdi8T0RXA+Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qYJzqG
 RayG5fc3vFetGGsRUNaWhIjr1nAhdURETU8yc=; b=jFyGSndriDlLAugQ1ieOgH
 /Il2VMGSwK28xrn4lpmsqOjKsPk/hxNsuvgISrAtj/BEyMrI+CfGqdUl6JOfd5Kf
 FMfmb1dAI5v40tr4RUdNeIVrjBmQMLaXxwvNvGoFUccHb9YrV/qb82CqWj/MHIDK
 10myC7PTz4Cekb+cKsMpkj/MFkMocEDLA6duU7LoJLwt0pSzNVOZXNNwkJyCJJCX
 9MwtCM3iWh7YMy8Q68JywDzuCJf3OkPi+LrpW0zgAmFxJYDEmIc9ih0TkMSATNpD
 0DCdleEMx2BxilTf/vs/ZXZAnojUtTYsqe73maJg5uILO/HF5rX0G96m7+PTjNgQ
 ==
X-ME-Sender: <xms:08PZYLn36zdXWlJUOUls6YlL9ixZSeQuEgTDFN79oomx51Jk2yOuUw>
 <xme:08PZYO3LiuQ4s_-UzPCs6sTtuAvKg1M2pEd7lb_yKcNBib7vXHrukzexvimgrrtmj
 A3s-kNUn_15-R_Gcpg>
X-ME-Received: <xmr:08PZYBoaLH6gXsS0_iw-H4oREKqW7xm1Ljx1vHBpnpKYkRlNcukvPAJbL4M-X2tRk8LfLwgzq6Cj-pax24vG-kRtaZAxq03oPCDF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:08PZYDnlFTkhRQtu8U1d348Vs4n5p9__ylOsI1cxwW-4jkWYm7LiLg>
 <xmx:08PZYJ2TE_VDWJUOg58tTo4U2dTxNG_mHcuquuEM_dGw0gBZpkmEXQ>
 <xmx:08PZYCuEl6vqvU3OfnhW20wim_4WRRdMbtgf0D2ou5MToi2vbDMZOA>
 <xmx:1MPZYI3bCQhq5yePbenF3QpPTxvy722DQpECBdJNG-RNem-jXerLMw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:42:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 00/10] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date: Mon, 28 Jun 2021 14:42:47 +0200
Message-Id: <20210628124257.140453-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
Here is a series that enables the higher resolutions on the HDMI0 Controlle=
r=0D
found in the BCM2711 (RPi4).=0D
=0D
In order to work it needs a few adjustments to config.txt, most notably to=
=0D
enable the enable_hdmi_4kp60 option.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
---=0D
=0D
Changes from v4:=0D
  - Removed the patches already applied=0D
  - Added various fixes for the issues that have been discovered on the=0D
    downstream tree=0D
=0D
Changes from v3:=0D
  - Rework the encoder retrieval code that was broken on the RPi3 and older=
=0D
  - Fix a scrambling enabling issue on some display=0D
=0D
Changes from v2:=0D
  - Gathered the various tags=0D
  - Added Cc stable when relevant=0D
  - Split out the check to test whether the scrambler is required into=0D
    an helper=0D
  - Fixed a bug where the scrambler state wouldn't be tracked properly=0D
    if it was enabled at boot=0D
=0D
Changes from v1:=0D
  - Dropped the range accessors=0D
  - Drop the mention of force_turbo=0D
  - Reordered the SCRAMBLER_CTL register to match the offset=0D
  - Removed duplicate HDMI_14_MAX_TMDS_CLK define=0D
  - Warn about enable_hdmi_4kp60 only if there's some modes that can't be r=
eached=0D
  - Rework the BVB clock computation=0D
=0D
Maxime Ripard (10):=0D
  drm/vc4: hdmi: Remove the DDC probing for status detection=0D
  drm/vc4: hdmi: Fix HPD GPIO detection=0D
  drm/vc4: Make vc4_crtc_get_encoder public=0D
  drm/vc4: crtc: Add encoder to vc4_crtc_config_pv prototype=0D
  drm/vc4: crtc: Rework the encoder retrieval code (again)=0D
  drm/vc4: crtc: Add some logging=0D
  drm/vc4: Leverage the load tracker on the BCM2711=0D
  drm/vc4: hdmi: Raise the maximum clock rate=0D
  drm/vc4: hdmi: Enable the scrambler on reconnection=0D
  drm/vc4: Increase the core clock based on HVS load=0D
=0D
 drivers/gpu/drm/vc4/vc4_crtc.c    |  60 ++++++++------=0D
 drivers/gpu/drm/vc4/vc4_debugfs.c |   7 +-=0D
 drivers/gpu/drm/vc4/vc4_drv.h     |   9 ++-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  20 +++--=0D
 drivers/gpu/drm/vc4/vc4_kms.c     | 126 +++++++++++++++++++++++++-----=0D
 drivers/gpu/drm/vc4/vc4_plane.c   |   3 -=0D
 6 files changed, 164 insertions(+), 61 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
