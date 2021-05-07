Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065B6376786
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611026EE51;
	Fri,  7 May 2021 15:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F8E6EE51
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 15:05:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id B220C13A0;
 Fri,  7 May 2021 11:05:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 07 May 2021 11:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=2uFNi/3TthaFiv4+GYmmbBcULi
 A6PkSxR3lwy0Cdm48=; b=iHasEh8lcj/FihZBVh0gBI3gIsUL0br7vswjXf1ZPd
 Yq/w7VZOTONDUtcHDk34VoeF99DdybXMS0mid6qE6NITE1S9BJOpsl3JWDISWV4Q
 RZ3MCFHtVO9Zq5+xjAAZuP2Q8wDoQS9P7Ufy4SV5+8GnmXUlBPkRV3bM7dKe0UHU
 QxQ8yBpE59067mUYeB5DBxnyB8wr/GJiP5CgxGBfzgjTzW5TYxwcDImZLYxIp7VV
 MhWHs9cnMPg7FScqz1EedRy5JIKTqrOPYwsKpRM60YJ9h/iC7bGNw7G0hKmnjxAD
 YjN9HGpIjSoauz6WFqTQWci1Qx3g7TTpWN7ubDYui4RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2uFNi/
 3TthaFiv4+GYmmbBcULiA6PkSxR3lwy0Cdm48=; b=kYdZFYfj+mR8s7Rt8B95/m
 tO3AUGHj06c+SHrdWDCJYmGXFaJGyjRdJBOdqs+SZr/kFSAMzDMVV2oZj5fqBbqM
 FkkzhYSY2fhgWfIh/nmSrh95TERL0jh2PWhg0EG6ilYXUaIILB1EZdjas8MXkJOP
 Uq+2YoG+B8SMrY3VqwTOz/z3b3MLfgecLD0KYBMEHKp+JE6a2FqKgzwX0Ki3cXeV
 YZYrPhFSwhmZEaQ3bi2iKhisT2Sl5u/V7i6PnIAG8zeoZoip0JqXkkh+uqfE/3l6
 tjK99JHifUymC7Ud0H9fRtw6VstkfhJ2LK/qU/rFNkLhaJHKPRUYuqsu7fP/OcYg
 ==
X-ME-Sender: <xms:MFeVYEW9mIk6oOF9vGuEZWGhhweweZC_3Q7YHN76V6PxOr2sqBMYYA>
 <xme:MFeVYImwpmlRlWlHtF8MzgCkIYZeVCeCX4JwDFVTc9QwQGK3-0yQSNYiksjnNQfmU
 8GJwqrU_5WV4S3PHFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegvddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MFeVYIaYQEJRmY22z7ulT774Is0nWh9TqT50bfJzCmfAV90--6Ngaw>
 <xmx:MFeVYDXB9FJU6zt69Vn64iTL9XhZ4aH2DMAlFC-vIotzva8Jsoa4wg>
 <xmx:MFeVYOml64ZDuVln_z1W12yqGafHziCLcs_hvUBeuFDdbe51GKthLA>
 <xmx:M1eVYJ-13ABSgN_KNgv2zz_em1C2nCJpEi3ZwaB9qgTj3VF1wlQnmUb-dB0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri,  7 May 2021 11:05:19 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4 00/12] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date: Fri,  7 May 2021 17:05:03 +0200
Message-Id: <20210507150515.257424-1-maxime@cerno.tech>
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
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
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
Maxime Ripard (12):=0D
  drm/vc4: txp: Properly set the possible_crtcs mask=0D
  drm/vc4: crtc: Skip the TXP=0D
  drm/vc4: crtc: Pass the drm_atomic_state to config_pv=0D
  drm/vc4: crtc: Fix vc4_get_crtc_encoder logic=0D
  drm/vc4: crtc: Lookup the encoder from the register at boot=0D
  drm/vc4: hdmi: Prevent clock unbalance=0D
  drm/vc4: hvs: Make the HVS bind first=0D
  drm/vc4: hdmi: Properly compute the BVB clock rate=0D
  drm/vc4: hdmi: Check and warn if we can't reach 4kp60 frequencies=0D
  drm/vc4: hdmi: Enable the scrambler=0D
  drm/vc4: hdmi: Add a workqueue to set scrambling=0D
  drm/vc4: hdmi: Raise the maximum clock rate=0D
=0D
 drivers/gpu/drm/vc4/vc4_crtc.c      |  66 ++++++++++---=0D
 drivers/gpu/drm/vc4/vc4_drv.c       |  11 ++-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 147 ++++++++++++++++++++++++++--=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  10 ++=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   3 +=0D
 drivers/gpu/drm/vc4/vc4_txp.c       |   2 +-=0D
 6 files changed, 217 insertions(+), 22 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
