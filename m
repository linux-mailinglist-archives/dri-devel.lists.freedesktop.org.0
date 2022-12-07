Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9E645962
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 12:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923BA10E074;
	Wed,  7 Dec 2022 11:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30BA710E040
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 11:55:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7AAC65C01D2;
 Wed,  7 Dec 2022 06:55:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Dec 2022 06:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1670414112; x=1670500512; bh=pkqMTedPSS
 4g+nzqyFmxdSVav2tzofouo+R7SiW8/4M=; b=P+UwZSn5aiBU1K/Ttfcm902bTL
 d+9t5UAiSHuWKPhOKvc5KYIVzCOm0Ub1Nsp1BggJT4BbwMHh7CQqc5JpsGBDepq0
 Dh3sseBs6/aDDxCg0dHRvBULzPjEZ4Q1TkJLn0cpsVy++m3UImuEYlABRR+GbRhI
 iNQghc93nXfftDv6/ssS917igQRoiqjSv9xo9lakyCijaIA4wpGvVVz4O6Bl4w9/
 +cqO6oL43NHFmN2LNtrnKRO0QdYSBGgk5dHcuHKJxLlQ35+RW6j2w7NylPJCvsDT
 HoBdV7pAKvVHtpbqMXE0HlC243T2SvMueekELx16jWraK60Nu4iIApTEGpfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1670414112; x=1670500512; bh=pkqMTedPSS4g+
 nzqyFmxdSVav2tzofouo+R7SiW8/4M=; b=s/ZInIPkvm38R+uHYPXRaeeZCzoyq
 IRTjeu/m76XxQlIUDuvISzooaUekoG0ILuK9DqJca5KNvCpsOdiSe0gC5SGr9QEf
 iZA/fMLYZyt5W97kPSxyBCPYsGu7EZVE4YU3/1P7IJxi4dbBKvVNYClOAOXbcNzs
 DRtPNUHTLv9FhkPX2DXL/syYkLJkRINlscOUTfaOHPV7bKcpJPn2DCe8bEsN9mZg
 1oGUnrvNsBqD1Oe2xKazrynD+vqzpFb22HhNTKJj4s+UKYURSQfDyi6WhvO2QRIF
 JAVAhtv9CoLWYFKCdS+g7t3MMuY0vdpeNAuUeEe7f/sfkzIhk+RtWEzow==
X-ME-Sender: <xms:IH-QYyvP42Wk_VbLyBqVb9ka6Ljs7iPj_m5tuMwJXI1pxnCPyK1J0Q>
 <xme:IH-QY3fzuZuFIlJOyYYI_xW6W-sNyUitx5okCEA9BjWXDjK4X3F27YTMlkc_UlPRB
 yH1UaSRcOTz6r8DnP8>
X-ME-Received: <xmr:IH-QY9zr_fk-1tLOJrgbOcPI-eF5ZRmiKZxO1zulurFEAfRJSoCCBo9UflMsgf-SozodVyRoV2Mj-XJwA-HbRIA6ZWUOX0VGYaEN-IMqsfA8rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefugggtgffhfffkvfevofesthejredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevgfeiffffhfeugedvvdffgfevhfelgfehueeujeeiffejfffgleelvdffgeek
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IH-QY9OAuA5TpFt1Pz4euiBpo5vUHI-CF0GWIuRW2lFSsfJAWJY2WQ>
 <xmx:IH-QYy8wFAEpk7eprR6BC_0a4Z9ly_3igI_akjSQ4I507y2F1AK_gA>
 <xmx:IH-QY1VaHUfLyRtgs_avHSxbALl95LG0DiiWQ3MLfbmZdnr8GUiGfw>
 <xmx:IH-QY12IqGuE4yYjE2vhsAJPqN4z32bInJq1CzlXIsq3BpieTobu9g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 06:55:11 -0500 (EST)
Subject: [PATCH 00/15] drm/vc4: Misc fixes and improvements for the HVS and
 CRTCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKd+kGMC/w3LMQqAMAwAwK9IZgNtBkV/U9NgA1olURfx73a84V
 5wMRWHuXvB5FHXozbEvgMuqa6CmpuBAlGkMKKdiuVxZLsYd3XGPI1xCnlIAxG0tyQXXCxVLm3We9
 u+7wc3Nn/qaAAAAA==
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 12:53:11 +0100
Message-Id: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=2182; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=BTg/iRPeaQ5YaDF5kWRxTOApky7KyiymtFgMBBO/Swo=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkT6laYX33MwsFT4Mtq/K/gi4PWv0dpDLqxXc0aX6Lzv2hW
 CjZ2lLIwiHExyIopssQImy+JOzXrdScb3zyYOaxMIEMYuDgFYCKr2Bn+2Zyqqn750N8msKhjkd67Av
 lTYVsNt9ebnP+hzbVui9jpcIb/jo4f5D2N9E/FxZUuyas+eEWT5V2uSA4fv5GA2nLnO5KMAA==
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a collection of patches for the HVS and CRTCs that fix a few
issues (with DMA accesses and timings, mostly), and add a few minor
features.

Let me know what you think,
Maxime

To: Emma Anholt <emma@anholt.net>
To: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Dave Stevenson (12):
      drm/vc4: hvs: Configure the HVS COB allocations
      drm/vc4: hvs: Set AXI panic modes
      drm/vc4: hvs: SCALER_DISPBKGND_AUTOHS is only valid on HVS4
      drm/vc4: hvs: Correct interrupt masking bit assignment for HVS5
      drm/vc4: hvs: Support zpos on all planes
      drm/vc4: hvs: Fix colour order for xRGB1555 on HVS5
      drm/vc4: hvs: Add DRM 210101010 RGB formats
      drm/vc4: plane: Allow using 0 as a pixel order value
      drm/vc4: plane: Omit pixel_order from the hvs_format for hvs5 only formats
      drm/vc4: plane: Add 3:3:2 and 4:4:4:4 RGB/RGBX/RGBA formats
      drm/vc4: Add comments for which HVS_PIXEL_ORDER_xxx defines apply
      drm/vc4: hdmi: Correct interlaced timings again

Mateusz Kwiatkowski (2):
      drm/vc4: crtc: Fix timings for VEC modes
      drm/vc4: vec: Support progressive modes

Maxime Ripard (1):
      drm/vc4: hvs: Ignore atomic_flush if we're disabled

 drivers/gpu/drm/vc4/vc4_crtc.c  |  71 +++++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.c  |   5 +-
 drivers/gpu/drm/vc4/vc4_hvs.c   | 175 +++++++++++++++++++++++++++++++---------
 drivers/gpu/drm/vc4/vc4_kms.c   |   1 +
 drivers/gpu/drm/vc4/vc4_plane.c | 139 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/vc4/vc4_regs.h  |  20 ++++-
 drivers/gpu/drm/vc4/vc4_vec.c   |   4 +-
 7 files changed, 337 insertions(+), 78 deletions(-)
---
base-commit: 99e2d98adc738597abcc5d38b03d0e9858db5c00
change-id: 20221207-rpi-hvs-crtc-misc-d97190d6a622

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
