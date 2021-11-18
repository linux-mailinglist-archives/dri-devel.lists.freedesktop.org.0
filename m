Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0B45592D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 11:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BD06E974;
	Thu, 18 Nov 2021 10:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092866E970
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 10:38:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 60ECA580912;
 Thu, 18 Nov 2021 05:38:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 18 Nov 2021 05:38:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=f9AWCn1f9NM1P779cGBn/7e6eL
 HMaXXXXAcVhXv/p0k=; b=mcO8yzipcFYwr11NFCy9Fkono2trVfyjiqz8OPlFUl
 yMC9qSJKknwdHpRbdVHHho0I325aIBRaHr2sVStLhzsQAwoaDdJb8PsUIRTSXcRP
 KhschTN/aRtgyrxMEch1xmSoZaU9b0qlmq7YscdS7Oh0F9zRUqPuAFXPdBUTAnp5
 AGiIYdcxQzriyOd02WvTjTx12DbWBMEcWV2pNd+bMGK1cKAMBFP/zxzrjKrPtEBm
 Uzv/zLYIyOraqGFbPEmta4XO+SPsr2s/JkfmCpJwQlOdrmzdUqZNEzVKCGnw1ovH
 X0BHurxDVZp2LxwavytGySC3+XV8LypCPVXAS+4G4Lqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=f9AWCn
 1f9NM1P779cGBn/7e6eLHMaXXXXAcVhXv/p0k=; b=iwqn3I5FEoRokBPRnVg0Jz
 sJYkA/MFt7lzg9BVhzE1y+qVoIX5uDzaxAaAydiwpIPscEadBLPEzFzhin1RRy9/
 mrJtUySIVAQHEeGSk2RQHgluGZ+ZaxyasyY2VJqXnZUggRxt9vpARGbf6Alxv2ky
 +b8wU93VWUoHiIy+VaO6H+vMt//8aleYC4I2R+pNlcRUXXm+jhFh6JbUOM+ZfRsA
 8ehtkx8b+LMcOVwzYbKFbfEHerkvs3sf9xZwCG1VrxP/4if0XcGLaWfDlUxMi0Fu
 oj9kaHbLAKaz+JjLpWg+6tWHxNExu6wioUFFdf+zYT3LTtI+m4jArAmE7UBrYk2w
 ==
X-ME-Sender: <xms:GS2WYVxz43GXca8DEJOe0Y-92QFVLOPNSiJfrqGoYI1rQqaaG3uRRQ>
 <xme:GS2WYVTiQkAV5ldX4Q4K-uDqJKQtdG8ZcKmOsT_7TmYFyvtX2zGVtX2Tbhbd2h3Ra
 sWm3QnJy8T4k4eEHLA>
X-ME-Received: <xmr:GS2WYfUtouib_bmtvO7YW0qd0HJtAGun5eFw7-1y4Gwd0ys9_l_1ozvXVaclKyF38OsJmFWEJU-WcA381UXPXg0pR5zaGAhzI7if6toiXEo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeigdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteetledtudejhffftdeugfduffelleelheejgeegffduvddvgfdvhffhlefgteff
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GS2WYXgbF9sG08xTKP9ZgqPqIG4B_7AU3tJcEZOsq7Ran2l7q-c21Q>
 <xmx:GS2WYXBGaKo7d_tq-BRxR_7S98Mje1F-1oOzHcoKpBrhRfszDy5J_A>
 <xmx:GS2WYQI61c3Di5ubcL1d8A822gzMXmn4-vV4Mpc2ZxdVJ9_gm-lukw>
 <xmx:Gi2WYTsKil6tHwtSsDNVbMkIQ9K4_ZHhwg0_Ow4Q7Wux54-VCwwSWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Nov 2021 05:38:17 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 00/13] drm: Add generic helpers for HDMI scrambling
Date: Thu, 18 Nov 2021 11:38:01 +0100
Message-Id: <20211118103814.524670-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This is a follow-up of the work to support the interactions between the hot=
plug=0D
and the scrambling support for vc4:=0D
=0D
https://lore.kernel.org/dri-devel/20210507150515.257424-11-maxime@cerno.tec=
h/=0D
https://lore.kernel.org/dri-devel/20211025152903.1088803-10-maxime@cerno.te=
ch/=0D
=0D
Ville feedback was that the same discussion happened some time ago for i915=
,=0D
and resulted in a function to do an full disable/enable cycle on reconnecti=
on=0D
to avoid breaking the HDMI 2.0 spec.=0D
=0D
This series improves the current scrambling support by adding generic helpe=
rs=0D
for usual scrambling-related operations, and builds upon them to provide a=
=0D
generic alternative to intel_hdmi_reset_link.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
  - Dropped the 340MHz define=0D
  - Make drm_mode_hdmi_requires_scrambling use the bpc=0D
  - Make more drm_display_mode const in vc4=0D
  - Dropped the tegra conversion=0D
  - Added more comments=0D
=0D
Maxime Ripard (13):=0D
  drm/connector: Add helper to check if a mode requires scrambling=0D
  drm/atomic: Add HDMI scrambler state helper=0D
  drm/atomic: Add HDMI reset link helper=0D
  drm/scdc: Document hotplug gotchas=0D
  drm/vc4: hdmi: Constify drm_display_mode=0D
  drm/vc4: hdmi: Remove unused argument in vc4_hdmi_supports_scrambling=0D
  drm/vc4: hdmi: Remove mutex in detect=0D
  drm/vc4: hdmi: Remove HDMI flag from encoder=0D
  drm/vc4: hdmi: Simplify the hotplug handling=0D
  drm/vc4: hdmi: Simplify the connector state retrieval=0D
  drm/vc4: hdmi: Switch to detect_ctx=0D
  drm/vc4: hdmi: Leverage new SCDC atomic_check=0D
  drm/vc4: hdmi: Reset link on hotplug=0D
=0D
 drivers/gpu/drm/drm_atomic_helper.c       | 109 +++++++++=0D
 drivers/gpu/drm/drm_atomic_state_helper.c |  58 +++++=0D
 drivers/gpu/drm/drm_scdc_helper.c         |  13 ++=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 257 ++++++++++------------=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h            |  19 +-=0D
 include/drm/drm_atomic_helper.h           |   3 +=0D
 include/drm/drm_atomic_state_helper.h     |   3 +=0D
 include/drm/drm_connector.h               |  25 +++=0D
 include/drm/drm_modes.h                   |  20 ++=0D
 9 files changed, 353 insertions(+), 154 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
