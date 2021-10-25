Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC04439A74
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED35F6E0AC;
	Mon, 25 Oct 2021 15:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BF96E0AC
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:29:06 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1E5305806D0;
 Mon, 25 Oct 2021 11:29:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 25 Oct 2021 11:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=+uHGLlaZStEUDZoEdeccQ37+kW
 /i83PHcozXaWvbhgo=; b=IURZZj7zFAQUDtumk7HJCgGhkTR9/yGbRxtF+fBxL4
 0ej6P1oMAmIfKiAZWAC+WBKBiDXkc0JDm+GzwU10rNQGFeq92g37i9imH/exTPbj
 nad8gr48jfLdnp5sWR0CNGQ1NmojYrQ1TKoHFRP4OB6Myu91uZs4bV1xWO+H1AJq
 ibtCgkteujo2gvHKRpsSeC6VFdX8WHKDLlBr4RVFdKezAfWPYnTWIxXPzMnyPzI6
 9+SSrvNh0FKQ/KGpInUGmqC9KiiMNQZhzDl74IHpHh5F/s6lZgUb7na5EAaPwb6L
 LUFCNDuUx/upIimw5TaJwvMVTg38PD56tNUGf7qV1HBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+uHGLl
 aZStEUDZoEdeccQ37+kW/i83PHcozXaWvbhgo=; b=TA8ZJsNTbMABO8HVsVkuF0
 31fM+dnI2LcQirKoKy85RBrBIOf4TxefLO606cv2FK7NtxjU2aI+w0R15gudTwdW
 DEE1htwJlDOUs7pq1+OyjbS0wKc03RxIh6V4b3NtslhiqfibBRCP8FZsmJdUkcx6
 PoHJ3LylJIa2kbl9sjvK8N8Aq7hTCggzLhyj6kC5ggmgxSt/WK/aGgs3diq9DWVc
 zz3yNRqU62425OXrd6YhBwhNWA3dgiK9z/PTmf4iEIz53NB50dOm9kUEEsqz53wO
 28W5oR+qPS/QieV1y2ykKxzxOMrAf7A7tPXX2IZNUAt01rKPUfaynQesPQ95Jvjw
 ==
X-ME-Sender: <xms:Qc12Yc9FleVOWhV4_PJi75A6OMVULPZ7WHzyoIT_zgN1tWX6JrQtmg>
 <xme:Qc12YUvPEALPBYUnkMfNLZOQmYk5VimrTocYXBtvB5q9616B-WJvKtqttay1OY4lz
 gje-8elDX-j-SYvURQ>
X-ME-Received: <xmr:Qc12YSD96RWCKOCDZ5jvsudhoJLo2sMNTVTpMmCdBIQ38Kf4i0M6j8gKvIGAgTgVIxzmGidO7D9ADleBktRwMQGoDnbB2GR5wiKstucg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Qc12Ycfybuy5J96TLlC--HUhy6_ZVYx9OdZxD-NbNz_-XX9D5jdomg>
 <xmx:Qc12YRPtE_e-LJVGvtPur2VsbUlTPsUn-tZcU2M_iNt41LT2azgflQ>
 <xmx:Qc12YWmf5aLGAlfJau_t7vIwlkFq5dktduXx4ymaF2BDn_Eu8HjUtg>
 <xmx:Qs12YYluawrdLUQmrtX6eNAA2-2kXoZHNynhgM-7gavXa4Gx24dAQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:29:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Subject: [PATCH v8 00/10] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date: Mon, 25 Oct 2021 17:28:53 +0200
Message-Id: <20211025152903.1088803-1-maxime@cerno.tech>
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
Changes from v7:=0D
  - Rebased on current drm-misc-next=0D
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
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  13 +--=0D
 drivers/gpu/drm/vc4/vc4_kms.c     | 126 +++++++++++++++++++++++++-----=0D
 drivers/gpu/drm/vc4/vc4_plane.c   |   5 --=0D
 6 files changed, 157 insertions(+), 62 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
