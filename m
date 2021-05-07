Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C355D37669D
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 16:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C656E233;
	Fri,  7 May 2021 14:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838266E210
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 14:04:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 7A917FD7;
 Fri,  7 May 2021 10:04:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 07 May 2021 10:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=Vtd9BNGxnWTVrdv1sQguNv4d3w
 rORv5ukuxA87nXxow=; b=lcuLsf1Fk/QbKv7GOAiqnZGzSJS6VzQqtd0tMX9vfl
 2cmkq5e8LWKaHxZjaKeaOV8KnOaJOE/W7CazrXkXZdsRuZSxVq4brh4YCuDrXty8
 wEZ1+1dVTC+J1UP/JLYimwBah7NXBWEAJl86BUenMUAIYWBcKPT77o9U4UK7iURd
 EiHLqgBQQX+N94OSG/DFdVuxZ7nXzaJOjAUXhnH7HM1CZQPYcaCS74RIaAGvgUy2
 C24LrF5RrBbHJbfo+1DVHbNjdVXItfsL8feocLev/ei8/eIUPVCdm1khKUOINFpj
 1PcLPfpTdMSDyZcyrRZQFotKfNPFS+NVHXuvC8go14JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Vtd9BN
 GxnWTVrdv1sQguNv4d3wrORv5ukuxA87nXxow=; b=NOzm3ELuTbOQwprurNuRlp
 HsFUqA9CGaHZKhxQG6LiJR6cebgZKW+gg1YiiItyfpkUVMJ0K/4HYNVdSIpWrF1Y
 y3oZReI8y8yhCDMNcGf/GgcpzOgZNWkdwiStAuEOa+U4rNcKpO9XGBTAA9VPNO1f
 NxYK1No9qQqr18rzjXQqgnICVZm7SQrxWDPFAa0F4YjxAPD5RAnjSw7p7XXB577b
 ZAlE0VDFs0JP5wjTP1f10uYYP+pRMRi2BvpHCHPTiPFVZnam3IMLbCRXT+OjxaPF
 bLxSf5gAkDY1qSol0fRcgmkFTBROxfRfsm9hgSUNzXXjLOAKbRYdfAMQlGAV4jrQ
 ==
X-ME-Sender: <xms:80iVYKMpfbY09CTVVlgVGNQez9IRi3y0p-3RQE6JTJLyup230Ze7EQ>
 <xme:80iVYI9I7Spa6OfWxjIZfG5_XS0JTQgpEvLr8YBTVjlb3jxRCI91PhEQuHE5j-D1w
 YFyUKsNfHnWBMjF8EI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetteeltddujefhffdtuefgudffleelleehjeeggeffuddvvdfgvdfhhfelgfet
 ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:80iVYBS3bFPT9iZqv1Wn2jIAxLoA6Y3F5DXWpKAxl7WS5OlhnafUCw>
 <xmx:80iVYKtXGZVZY0ijBSeAxJBS9608yg8EevjzyL38tzhUBOOFQSpQRg>
 <xmx:80iVYCe6dZiHOnqmpKw0q8e4kx7ZQC4_41m2iWE7DDIRwneQvrltoA>
 <xmx:9kiVYGPRLnKrgzWi5QtLBvQ7_Ra0vCOaF48JtfHBTfdeQZx8pOPZAJ-n3pM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 10:04:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 00/11] drm/vc4: hdmi: Enable Channel Mapping, IEC958,
 HBR Passthrough using hdmi-codec
Date: Fri,  7 May 2021 16:03:23 +0200
Message-Id: <20210507140334.204865-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
hdmi-codec allows to have a lot of HDMI-audio related infrastructure in pla=
ce,=0D
it's missing a few controls to be able to provide HBR passthrough. This ser=
ies=0D
adds more infrastructure for the drivers, and leverages it in the vc4 HDMI=
=0D
controller driver.=0D
=0D
One thing that felt a bit weird is that even though=0D
https://www.kernel.org/doc/html/latest/sound/kernel-api/writing-an-alsa-dri=
ver.html#iec958-s-pdif=0D
mentions that the iec958 mask control should be a mixer control and the=0D
default control should be a PCM one, it feels a bit weird to have two diffe=
rent=0D
control type for two controls so similar, and other drivers are pretty=0D
inconsistent with this. Should we update the documentation?=0D
=0D
Thanks!=0D
Maxime=0D
=0D
Dom Cobley (5):=0D
  drm/vc4: hdmi: Set HD_CTL_WHOLSMP and HD_CTL_CHALIGN_SET=0D
  drm/vc4: hdmi: Set HDMI_MAI_FMT=0D
  drm/vc4: hdmi: Set VC4_HDMI_MAI_CONFIG_FORMAT_REVERSE=0D
  drm/vc4: hdmi: Remove firmware logic for MAI threshold setting=0D
  ARM: dts: bcm2711: Tune DMA parameters for HDMI audio=0D
=0D
Maxime Ripard (6):=0D
  snd: iec958: split status creation and fill=0D
  ASoC: hdmi-codec: Rework to support more controls=0D
  ASoC: hdmi-codec: Add iec958 controls=0D
  ASoC: hdmi-codec: Add a prepare hook=0D
  drm/vc4: hdmi: Register HDMI codec=0D
  drm/vc4: hdmi: Remove redundant variables=0D
=0D
 arch/arm/boot/dts/bcm2711.dtsi |   4 +-=0D
 drivers/gpu/drm/vc4/Kconfig    |   1 +=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c | 322 ++++++++++++++-------------------=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h |   5 +-=0D
 drivers/gpu/drm/vc4/vc4_regs.h |  30 +++=0D
 include/sound/hdmi-codec.h     |  12 +-=0D
 include/sound/pcm_iec958.h     |   8 +=0D
 sound/core/pcm_iec958.c        | 131 +++++++++-----=0D
 sound/soc/codecs/hdmi-codec.c  | 219 +++++++++++++++++-----=0D
 9 files changed, 456 insertions(+), 276 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
