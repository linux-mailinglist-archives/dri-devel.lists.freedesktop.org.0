Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E436747590F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF5610ECCB;
	Wed, 15 Dec 2021 12:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6427F10ECCA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id D913C2B0024D;
 Wed, 15 Dec 2021 07:44:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 15 Dec 2021 07:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=jRwkmLpd9Nndb
 j3mEezhof84G2aO5vv8/Opou90CXXQ=; b=QdENVoAao1JyVGOPMTVKHi/gUaZ4W
 scrmnZT9TB/hYoJr6tOKKboWjT9XEZoWl5bsD01xQe4e5aZLVGT8HWXNzM0mnXNm
 Ks1LEORO2Dkuxl/eqe7useE+2r2xFUp5EKInUYv2Gd2rYUSoaWlb6maGDDjf6cvz
 h2fiBLpHY39CgeDyL5Q9Mrn10wstR4a9B6YMZoiQ/7474fXGPszFn5n6b3k1od0R
 cyOcy9fDvky5SV1H9vUoJmFP47tiWQ2mVQWT/OnXMP1+eA+fgqPiT+Y2RvqnYa09
 CGyR184CtWckOhhJX4/DFec14tcVyA3DLn/LGAjAvaGA0bZ79wOj+kjTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=jRwkmLpd9Nndbj3mEezhof84G2aO5vv8/Opou90CXXQ=; b=StElBWJt
 eyBQ86VimtKUcYTleIFBayrZ2SPtyhyJCqGY5Frp8WBIxYnhbCN1+CMPWUPmSuqS
 I1BcYB9nnSClY9A1YV8YtI3QgI359aCMRbxfQ7ObGHbRW9ZVvfciNT8+K/N15kky
 wpHQbVLhuTE9z7hiiNEoOUyznTI2pEYCsvHNsTTINxBA3KcTKJMXaKcCvP5oYAzj
 MpILcabOMuNoy9wUtk4RgjxW+ksxFbP/wg6m2ase2yNZtCdgHPLpdX12TAQ7TgiI
 7DJ8vO5X8tBGrCzLwT+L23jAZhKp20RXJuk1WoFbodpXxR0hJyrv3Q9dclo7hJui
 p+knYaMY/sCOQg==
X-ME-Sender: <xms:RuO5YZ0GTS4npRG8TDrK6GHSe6F5CIfqHhn6CTkiqsSr-qjWcSCLRg>
 <xme:RuO5YQH7bnECPeCue1mGJfGklc4xnZzgglZ_EUI1_7y-igWcz5oUpuaJmO4C1YpqP
 bfMV-xxJHv2jQ-l5js>
X-ME-Received: <xmr:RuO5YZ4dEDxP1psc0rijPOzNkphoeiBqp2pVMcHkgs1zRyMyQYIuxwpsAgY2Z5XWY2w-dgReZcqPgDqNHBEghQA2P70s2ZWHxw2AkFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RuO5YW38A6TEj_xhJbPNakWHnrN9Y97AIho3jzVkpucGDTj1Q4EzxQ>
 <xmx:RuO5YcEsPOGyOxIpqX2elBOSOsbLyPJZeCkRiuCCbsUTXbZWl0j1aQ>
 <xmx:RuO5YX8QpxdMFZB0Bk3f8IFdgSaFIEdEfZtpv5eeO1pUZAbwD6EIiQ>
 <xmx:RuO5YU9xe-DKAff691vJ9FR7vMlaunCjP-f5xzF8czwilvAN_Qccn3RGSlI>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 11/14] drm/vc4: hdmi: Take the sink maximum TMDS clock into
 account
Date: Wed, 15 Dec 2021 13:44:03 +0100
Message-Id: <20211215124406.340180-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215124406.340180-1-maxime@cerno.tech>
References: <20211215124406.340180-1-maxime@cerno.tech>
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
index 02a5d5a8847e..effc2d42e320 100644
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
 
+	if (clock > (info->max_tmds_clock * 1000))
+		return MODE_CLOCK_HIGH;
+
 	return MODE_OK;
 }
 
-- 
2.33.1

