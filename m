Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390535E1F4
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 16:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA5E6E51C;
	Tue, 13 Apr 2021 14:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CABD6E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 14:54:50 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 79F6D1640;
 Tue, 13 Apr 2021 10:54:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 13 Apr 2021 10:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=WE7RC/NDvgPNNim5GUlDTAtwqs
 8TgEBSeBdKCi0LpJw=; b=XcQE46NFf46UBKaAw3R43TENCq/VQK0o90AxNkcgOk
 Zx11iiomcLZXPZ+evYs9qxlkfrF2S737M+8WM3WeODBUOHxbC1JrWh9zNIL+FCcz
 i7nXo5Hah80aWkd/VYmDmG9v7lYvjfbkFnUiW93nB/TTXy/CwokOmlhAcmaqMqGn
 zFteguFbCYlt36Q3gKiYxZPzEF0C6fCq9Y4tR0zTfcGkktotR7p6lFe5LY3uxY/P
 WD87MfKqXHTLOgRJ5ULaMX2QzB4uGKwGtArZPujW/sctyuoIoIrVRpZJ+kssBZDP
 CRXVoVsfKvydJgEW7u9C/D//Djuah75Z+G2NnnjSvpxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WE7RC/
 NDvgPNNim5GUlDTAtwqs8TgEBSeBdKCi0LpJw=; b=Z1I34787BtAW3sClguacEb
 avafAiW/ycDqS5ng8ylahgTwkjkDhSOcCjS3qppJvPU0i09UoDwkiaDRoA7MfqGe
 ythvOZpCXP2jdcql4TZNaxhw6UxapPMCzujZugv85bzyIx3irDYbN5w4WOFxCUCH
 LyHqZoTcbpc1aFH7eeWdyQArxgHKdCLWl76GIaJuy7lDS1HUyGUi2POwaC9Qrtfp
 nNufJp/GMowz2DSJ5aPKGFqlrSBHjnMIv+4a4uqeRXb0MIZZdw1aWP5olo82rsoN
 9/RsXWRhAlXpai5CLxsCTRS4FvEz+waJNJfApvZR0pDzLNTZ/hn762P7OisG7dog
 ==
X-ME-Sender: <xms:tLB1YOcZP-Bc2Lj1ZIbO00V02UnK9KiwtoLVTReeFiaiVKyiZGfQwA>
 <xme:tLB1YFn61_IntEt4uUhHk3ZRtaLIke3lV4ch4gYOBhZLNDAGNDqxjvhwWQO_TAOcZ
 A5c1TkAHJUWf186zwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tLB1YJCeXyvsr3c62ME-_caIiZFeo-3kmbBph-Xfm-RJBR__xtVyrg>
 <xmx:tLB1YHOlZvaiAQQuxgor-XyAnUzqzpBe_GYU5tGp27iPuaxXZZsSnQ>
 <xmx:tLB1YANK1sTMy1v8frH5ACGzDGqbkhvbyccnrUMBXXHRjUPmyGe9fA>
 <xmx:trB1YOy7g911_QFf_ZToDw6J10oIq6tzRRn3KgWAKY0gbzt6Gf2MvE9FqpM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BC2DE1080064;
 Tue, 13 Apr 2021 10:54:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 0/9] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date: Tue, 13 Apr 2021 16:54:32 +0200
Message-Id: <20210413145441.483977-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here is a series that enables the higher resolutions on the HDMI0 Controller
found in the BCM2711 (RPi4).

In order to work it needs a few adjustments to config.txt, most notably to
enable the enable_hdmi_4kp60 option.

The firmware also has a glitch at the moment and will not properly release the
BSC controllers, which will make the EDID retrieval fail.

We can work around this using the following config.txt options:

disable_fw_kms_setup=1
hdmi_edid_file:0=1
hdmi_edid_filename:0=1366x768.bin
hdmi_ignore_edid:0=1
hdmi_edid_file:1=1
hdmi_edid_filename:1=1366x768.bin
hdmi_ignore_edid:1=1

A fix will come for the firmware eventually.

Let me know what you think,
Maxime

---

Changes from v2:
  - Gathered the various tags
  - Added Cc stable when relevant
  - Split out the check to test whether the scrambler is required into
    an helper
  - Fixed a bug where the scrambler state wouldn't be tracked properly
    if it was enabled at boot

Changes from v1:
  - Dropped the range accessors
  - Drop the mention of force_turbo
  - Reordered the SCRAMBLER_CTL register to match the offset
  - Removed duplicate HDMI_14_MAX_TMDS_CLK define
  - Warn about enable_hdmi_4kp60 only if there's some modes that can't be reached
  - Rework the BVB clock computation

Maxime Ripard (9):
  drm/vc4: txp: Properly set the possible_crtcs mask
  drm/vc4: crtc: Skip the TXP
  drm/vc4: Rework the encoder retrieval code
  drm/vc4: hdmi: Prevent clock unbalance
  drm/vc4: hvs: Make the HVS bind first
  drm/vc4: hdmi: Properly compute the BVB clock rate
  drm/vc4: hdmi: Check and warn if we can't reach 4kp60 frequencies
  drm/vc4: hdmi: Enable the scrambler
  drm/vc4: hdmi: Raise the maximum clock rate

 drivers/gpu/drm/vc4/vc4_crtc.c      |  28 ++++++-
 drivers/gpu/drm/vc4/vc4_drv.c       |  47 ++++++++++-
 drivers/gpu/drm/vc4/vc4_drv.h       |  10 +++
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 122 ++++++++++++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_hdmi.h      |   8 ++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   3 +
 drivers/gpu/drm/vc4/vc4_txp.c       |   2 +-
 7 files changed, 207 insertions(+), 13 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
