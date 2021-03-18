Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849E734020A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 10:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DA66E0DB;
	Thu, 18 Mar 2021 09:29:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E4236E0DB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 09:29:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5A582580EFF;
 Thu, 18 Mar 2021 05:29:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 18 Mar 2021 05:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=sEX5yQqxK73ezn+B85KgGRF2A5
 9oMWhh0mh4+gwd4AY=; b=bBEE8YpFQOcZPvmM4y3i+ddwsguKCnIl4nljzFML7V
 EvpwZl1GgZ6gymTVT2l3WyBfSz/lLBZg9/2HhDjMHPJYiWngTIuoOLlUc5XUfnSu
 EQHfE2bOFjp3gf4KzIvVg5MJNHZckIfTlrWqBVkjM7TKl2dLBMkAG8lW5FGTd7b4
 37uP9RfTp28ffDQvZ2aQxP06rJcflEXmWDqQ7Qtg1C1nA6sVSRBPO0ktipUO1GD/
 Xdwb5oMMO7+Z2B0tjyyVApNnUMwP+6cok+10G3Ms0cPOiGVS6Rg76XpwPRezQ5OP
 tnXPq8cVazg0aoX5PqJbGxXnXw34fK3ioViq9s1XnMzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sEX5yQ
 qxK73ezn+B85KgGRF2A59oMWhh0mh4+gwd4AY=; b=wpMbfH93zUq4zvugL43xes
 gLr33BAtGac2syQm3ztUbPB+b5/GZltWEn2BHVM9+2DIffv+3hRMY8VN1Uv1Fat8
 IbnOF0JkohAkM/+f6x4R2fHwng7QmviTp9iXIFj9wvaZuzeDR1B9Z79fr48P27Am
 /LRNE3jw2q6DlJUJe8PeZescYljrn3NqMFGWkkFut3NfQrQd/GTSzkyQL3A00VUD
 wyMfOYUjHmpSuXVUKIV512t0CLEbrUK2b2jrmNJRacBLXUkJEHyuwJbDGKbwsei3
 s+9xXiZqYwko4pC2EcFUZcIA/BJFzoPTz/sYHhpmhSQDBVAXfF+kXwkclalo3PGw
 ==
X-ME-Sender: <xms:cB1TYHjeVm8uWlSfioGpuQwRjwu-qW9KUpgw8H_hVfMoUcyIy5L_Uw>
 <xme:cB1TYEClcuL_wF8k1FVqWbylKXVBVflQvCtnMH9NKoxgglAExFpda5qWoyYg0uMrk
 22ZViV8Ze7XA8S3NuM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cB1TYHE0qDk_lxqXZY1lO6lXq0RKjv7Y1C9K8fbhSEzALEtCOgiUxw>
 <xmx:cB1TYERGy0bvIwAej4TwvolffhLYIeHbyh3Lr3w0GGSt48QaSAbdsg>
 <xmx:cB1TYEzHocAhVykGEMRvu-F5Xp4rqvpFQMuCSoRTq9_E9RXjcCRx2Q>
 <xmx:cR1TYAeADgTMz3asGN3DEnIIBEXSsQWV8v1IHWTGnFIryI68fD9cPA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id EBE1C240057;
 Thu, 18 Mar 2021 05:29:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 0/5] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date: Thu, 18 Mar 2021 10:29:12 +0100
Message-Id: <20210318092917.831995-1-maxime@cerno.tech>
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

Changes from v1:
  - Dropped the range accessors
  - Drop the mention of force_turbo
  - Reordered the SCRAMBLER_CTL register to match the offset
  - Removed duplicate HDMI_14_MAX_TMDS_CLK define
  - Warn about enable_hdmi_4kp60 only if there's some modes that can't be reached
  - Rework the BVB clock computation

Maxime Ripard (5):
  drm/vc4: hvs: Make the HVS bind first
  drm/vc4: hdmi: Properly compute the BVB clock rate
  drm/vc4: hdmi: Check and warn if we can't reach 4kp60 frequencies
  drm/vc4: hdmi: Enable the scrambler
  drm/vc4: hdmi: Raise the maximum clock rate

 drivers/gpu/drm/vc4/vc4_drv.c       |  11 ++-
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 101 +++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_hdmi.h      |   8 +++
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   3 +
 4 files changed, 113 insertions(+), 10 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
