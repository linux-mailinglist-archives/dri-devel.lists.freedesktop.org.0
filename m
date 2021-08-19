Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A293F16A3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40F526E4B5;
	Thu, 19 Aug 2021 09:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8337A6E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:51:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 146C8580B71;
 Thu, 19 Aug 2021 05:51:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 19 Aug 2021 05:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=1nS9g9scrWU1cXO/69EjPPlPET
 IxxoWAnqPD1Fg3LtA=; b=X0NCNAsBk3UQWyd3M4NmHCr1WYqW45lVtquc1X1NMg
 BB64VHIylTF7U0XZuKpmdaUV03aL8XjGZCuPhQ0BnH5TE6Xjgap5wot1iaxcThTQ
 n1eeDxPnbatsTXIQ41N7sY4lLU9/M6QjI0VAWM8PQjJr3s9F549fRR04EKStpIy/
 lhgBJZYlPVv49edTor+5DhC81oe1YUqkmCXgGX+uaLVwisagLpLsczfZMIjcCCAc
 Mn2+qAfXovi6Xz/WeOk/SttK2TuWcFUxf3/OQZlyNgHEST1lVL8BGB4NXWXpWeDC
 IbjW5chVeHPSDptb5u7Fjz0Y566n4W1pANgUEm3Soo/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1nS9g9
 scrWU1cXO/69EjPPlPETIxxoWAnqPD1Fg3LtA=; b=jpLODyr3Bi+SoaPxsMP/j7
 pWZ4EOG1kHh8DtbL7tBtFVnkdLU1LVEjVk/wBn1uDPtVSkoc4QSP9LdaR7EzbsTM
 f5QOKza9ka/AvM6r8gNb1gqHaoaDxxaTTKRg1ZSQ9IjhIdsM98rcffnKFB4dG81u
 Pc+1NWbnplQYbi6rdm4JxGgT197ayszkx1b7wpI0WWqGLYTFiZVtXW2lsUewfEAy
 1Nx8FkvLpqFcAv6q9PAezAm2lf5R2uEpDV2praUrLvizqr9CbSP5IQ/kiIu60qq2
 +NCDr/ZJqfPLohysutoGCRZa0x+ffzH8VFu2MQb2oY0JDupE+1vic4JH5EoFnrnw
 ==
X-ME-Sender: <xms:mykeYWx01y-7zUz-c9q5RazES27HTHwjTXQm4JUTLB99F2GcCtmhEA>
 <xme:mykeYSS22zT-w_zj5nRSfpWwR5g4oAoLtkhfor_BIW1wPjwLcePS0Ei8y3WhROIhJ
 d-aurkGlKLjUPGGSeo>
X-ME-Received: <xmr:mykeYYU9wf8UYyiNtHwB5HlxFilLtYh9_e1hmoGoHOqF5YJnxcHS636G-FGt2dXcL0fUTObxJtqpCKSb2HJcpXtF55oDiXJRY8yi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mykeYcgbDNRKpBGfaz1yATJGeLtKPB3iGFZO3W6sYBK_luZWEDU7Gw>
 <xmx:mykeYYBIwXJSSAHTL-ok9irDH7LhRtdLsotljNmAM0Wpxyqj1INU9A>
 <xmx:mykeYdJ6Vdrc97BkMWVA1XIltPMT0Yj0wn3pAQk6braeNrGA3wfRHQ>
 <xmx:nSkeYQa9Z9v__HxBRXRuSyBPlVzulM3e8NE_l_Iy5k82vtIRjq3sXQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 05:51:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v7 00/10] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date: Thu, 19 Aug 2021 11:51:09 +0200
Message-Id: <20210819095119.689945-1-maxime@cerno.tech>
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
Changes from v6:=0D
  - Rebased on current drm-misc-next=0D
  - Removed stale clk_request pointer=0D
=0D
Changes from v5:=0D
  - Fixed unused variables warning=0D
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
 drivers/gpu/drm/vc4/vc4_drv.h     |   8 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  20 +++--=0D
 drivers/gpu/drm/vc4/vc4_kms.c     | 126 +++++++++++++++++++++++++-----=0D
 drivers/gpu/drm/vc4/vc4_plane.c   |   5 --=0D
 6 files changed, 163 insertions(+), 63 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
