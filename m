Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E5144310E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 15:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1DB72E5D;
	Tue,  2 Nov 2021 14:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B4072E66
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 14:59:52 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D83F8580735;
 Tue,  2 Nov 2021 10:59:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 02 Nov 2021 10:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=hTJ7BKbJgWOz+5O5IbhM4vJYVS
 UaFoMFeonkevEcMiI=; b=YBORQO5IOh+NISy8U/JszU96lurPdCbtlnJ3244b7R
 tZcuk14fIX+n7ngsSTIm3ZqkSAct0voYALttKYeqSBn23pxGt6MkWiGZd9/3mf5B
 CZHpeMz80miQQL9bnHpl2RZ4/qH5HGVQbiIwwjmnJoJ3mge7w7hsVrMnZ7960XD4
 v2hLGN0obS0cboTEX5rND2ql4I0xcYrK2Vz7Z05YEg0dBPWlqgjQa78IVYavLE4s
 i+O9Ts5LkUGrC6STtfz+SYCVHg9FdO3R4k//mTAfqsyN//tkW1+ILuzKOyDrHcmU
 1H1oeXQ8s04iLCthSRhon7MG2Z1fsmBzuF9gbQCEk7Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hTJ7BK
 bJgWOz+5O5IbhM4vJYVSUaFoMFeonkevEcMiI=; b=ATGJW2JSV3uLMyTjeO2pe1
 2DZnFbV3XLu76yNc8Uasfd8q/KGw1cM5dXhPL0sG9rR+foOJegW3KyZ93HKVLCsu
 FT5h/upiOOVZ3wDRWEgCpL/1TkToxnrygyzIVDayNjHsV4WWvyr9BqOnWmIOayLx
 U8AOdysRx9LWMGu74EUJ2ANkHtOnG8skD7LmMWVdcXAcEipa68wL57J5zi8f95od
 IjCM3En75m3uGQ/sZL5b+BlQTge1gk9SDx2j0ghem0QrdoepSa49Qthh2OYTjkxZ
 y5UXJkPNuYqwFP3jSyLIk6bAkM1nGqyK1rAGetM2Omr1xqhdQxZqVL/C6V24La7A
 ==
X-ME-Sender: <xms:Y1KBYeRcaGoLHX2TdEk4toSwT-7J81PLtTiJH3874jEe_dLq4kta7g>
 <xme:Y1KBYTyBCrQvtcUt8AzTauCnIfDaOuKO_63SwGxxfBmYmtBe0dLnUpOGLy5Q6G5iP
 HQQRf4IG8YIxtu-9js>
X-ME-Received: <xmr:Y1KBYb1GRTukbJNMJZ19QhXU7s91cPIBXF6EaJurwDnUng67GGw_HLNe-nKikSX_5FkVxPlWqaHNXPamb4RDGm064H2yM_H8zRDm3n3W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeevudekjeetieduffduheeiveelieevfeffhfehhfejuddvjeefheejhedtuedv
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Y1KBYaBYLNvFTTYwpHtN85degb_PKORKeoLVYYwZdsRq7rVTf6kW6g>
 <xmx:Y1KBYXhARdmvdzY9171ylY7F8YGpHqhVkDG83DCjSOPF8aDxOqrMoQ>
 <xmx:Y1KBYWrf7rkzBmq9PC8fVMqTx-tps4_12bgY7HfeWdRYqvpgtcopPw>
 <xmx:ZFKBYWPhiESnKQE2pzSjpnly9eaDUi8lWl68adTE-63ak-mSHRjN0A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 10:59:46 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 00/13] drm: Add generic helpers for HDMI scrambling
Date: Tue,  2 Nov 2021 15:59:31 +0100
Message-Id: <20211102145944.259181-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Maxime Ripard (13):=0D
  drm/connector: Add define for HDMI 1.4 Maximum Pixel Rate=0D
  drm/connector: Add helper to check if a mode requires scrambling=0D
  drm/atomic: Add HDMI scrambler state helper=0D
  drm/atomic: Add HDMI reset link helper=0D
  drm/scdc: Document hotplug gotchas=0D
  drm/vc4: hdmi: Remove unused argument in vc4_hdmi_supports_scrambling=0D
  drm/vc4: hdmi: Remove mutex in detect=0D
  drm/vc4: hdmi: Remove HDMI flag from encoder=0D
  drm/vc4: hdmi: Simplify the hotplug handling=0D
  drm/vc4: hdmi: Simplify the connector state retrieval=0D
  drm/vc4: hdmi: Switch to detect_ctx=0D
  drm/vc4: hdmi: Leverage new SCDC atomic_check=0D
  drm/vc4: hdmi: Reset link on hotplug=0D
=0D
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  |   4 +-=0D
 drivers/gpu/drm/drm_atomic_helper.c        | 109 ++++++++++=0D
 drivers/gpu/drm/drm_atomic_state_helper.c  |  58 ++++++=0D
 drivers/gpu/drm/drm_edid.c                 |   2 +-=0D
 drivers/gpu/drm/drm_scdc_helper.c          |  13 ++=0D
 drivers/gpu/drm/i915/display/intel_hdmi.c  |   2 +-=0D
 drivers/gpu/drm/meson/meson_dw_hdmi.c      |   4 +-=0D
 drivers/gpu/drm/radeon/radeon_encoders.c   |   2 +-=0D
 drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c |   2 +-=0D
 drivers/gpu/drm/tegra/sor.c                |  10 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c             | 232 +++++++++------------=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h             |  17 +-=0D
 include/drm/drm_atomic_helper.h            |   3 +=0D
 include/drm/drm_atomic_state_helper.h      |   3 +=0D
 include/drm/drm_connector.h                |  27 +++=0D
 include/drm/drm_modes.h                    |  15 ++=0D
 16 files changed, 342 insertions(+), 161 deletions(-)=0D
=0D
-- =0D
2.32.0=0D
=0D
