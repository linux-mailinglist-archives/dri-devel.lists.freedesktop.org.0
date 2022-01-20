Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1BC495140
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CB2F10E484;
	Thu, 20 Jan 2022 15:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912D310E47E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:17:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id E47EE2B00158;
 Thu, 20 Jan 2022 10:17:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 20 Jan 2022 10:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=ttOetNNmfDd++1lwywZJq9OWR8IjXZ
 XM4ndiGo8q5xM=; b=OYPgGyF11PMZz/MKX5B5u98e+h/hmMzMNQBX/iKbPbtV7z
 8yrtJ09ViRbuSa2yS8iu4E9ry1N9w0GffkRZRZtuwb14bAT/8IH8xsSxdGy+PZWM
 xAxnTDRZAVnkTus0uxw4RuIaUMaIBXD12aVkbEXAoNtmga7o+O38HaMxPYz/fXZL
 ayz9etQ4GAqWbAV/c86DyoAo8cm1Jg5sPuaGTuJCmAOMlY+jUB+baxUGTmSEk75S
 n2RqRIm9iEFqd/cleo8JNHT9nTk7DFw58fVwCI5DDwacKG6/kSt5qzu4CM6s+VmW
 HG9RCvtAqdEMhyvPSpEfB3j72ESzlH038fezJJxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ttOetN
 NmfDd++1lwywZJq9OWR8IjXZXM4ndiGo8q5xM=; b=bJiXPzi2WD80SJSgTUNPUa
 6cobtoyIqgojKtd3Gg5DlznVopUUy/NXPfv39PJX6pwYp3Ik0D8mgIQxn+pvZhx/
 Omqf94OBuX6jl/z/l9tXaCckZPUv+aUnFODwbNt4Rjy1pqPJpvhOgaM/VGB2TH4z
 J/41N1fBt40iMfSPqip4Jr4PIIGx6oSqGLMjobR7eoMfJ5RzzoMtSMMJsK/MGGpL
 UfOC1rpkPeEkhi9Cuub5fg9ipIVFI0FJYSniq0OZZ/HZkf+z4CZ3FQ7olrXyzwGo
 TYCJAlGEd3Y0CEQPuHYsfwqlcydV+M9FL0JiMhaEDfnHDNscY/XRCLaJfzbAC8cg
 ==
X-ME-Sender: <xms:AH3pYa32fGNkizAcl7BZ5X0LB2nnT3pt8doUbHjZX1RCxuGCy3_Xag>
 <xme:AH3pYdGRRlcB8mIX7F3ohLjzN7kE4IkXmlx32ptn-jy6VN8WAF3eUp7_KGsZ9J8lu
 Jtsba-45fFNSTpsa2o>
X-ME-Received: <xmr:AH3pYS40GjIWgGdR7NJoSOGjd2lL0lF9qd6RScBs-t7_FH-mC2qhY-PjLJyCtJEJ6hdoFf347PBbYp-6P4P9oGuGZaCS6c_PKdXOt5E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AH3pYb33VCPMCgjruHVX-yLjPeTk61kiZ4-Midtd8hic-Dz27yu4_w>
 <xmx:AH3pYdENQeYz1VAGw3e2M87oqfIxJRwWq1_NNW5g4Hrv0YBKxzcBmQ>
 <xmx:AH3pYU9Er_fdzOr-VzTfs3tzttsUmeBi4IzBDYuWRGbHp3Olw7dciw>
 <xmx:AH3pYV-2uit3spcxfuP8I8waHX6-LXPRmY8GotGpkoV45gngHF0g4NlC260>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:17:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 13/16] drm/vc4: hdmi: Take the sink maximum TMDS clock into
 account
Date: Thu, 20 Jan 2022 16:16:22 +0100
Message-Id: <20220120151625.594595-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-1-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the function that validates that the clock isn't too high, we've only
taken our controller limitations into account so far.

However, the sink can have a limit on the maximum TMDS clock it can deal
with too which is exposed through the EDID and the drm_display_info.

Make sure we check it.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 764f3c5cfa54..b68d3626d1a3 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1266,12 +1266,18 @@ static enum drm_mode_status
 vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
 			     unsigned long long clock)
 {
+	const struct drm_connector *connector = &vc4_hdmi->connector;
+	const struct drm_display_info *info = &connector->display_info;
+
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
 	if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
 		return MODE_CLOCK_HIGH;
 
+	if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
+		return MODE_CLOCK_HIGH;
+
 	return MODE_OK;
 }
 
-- 
2.34.1

