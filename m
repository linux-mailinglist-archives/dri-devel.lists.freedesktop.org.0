Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB848D977
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0F310E539;
	Thu, 13 Jan 2022 14:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D8810E515
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 50550580805;
 Thu, 13 Jan 2022 09:07:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 13 Jan 2022 09:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ttOetNNmfDd++
 1lwywZJq9OWR8IjXZXM4ndiGo8q5xM=; b=auGRLaf+Fq5SnRVKQzJK5jY/AU+e9
 pvKPggkdGA415s9GaFCoS+hARe0rMI6KQ11a5Hz6MLSgtetB4uH/pPlAu2TERu9v
 1gt+wa70dAVeGV5tER9GzQiWe4jVhG4uKzW/bDIWGAE5Wi59U11aR29RbrrlXuYa
 4W+ySCQZV81bUMYwMqaPmfaUgeTbFjUfq2QDhzI1DyZtzjr8JjLGXKPp0CAlW3mr
 2V0VqRTL6vRXg01FYhBElAa9X0qeYuFdSI4fD26w+V+qQbbm8Ky/3/+j/pNJd1z8
 UO+EixA8kkYNpFw+ooBZzn9XtBFAfRwqujMmktJ6EZf9ZIvcDv9UFU8xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ttOetNNmfDd++1lwywZJq9OWR8IjXZXM4ndiGo8q5xM=; b=O8+izWhw
 UL/frQX47cHDS4ki9gDQshPCE3arUIkD40Ta5/beJ5TwUODv7m8o1bAYerwXUyr5
 YSkP+RKPREQSA/NTDSDvofRSzphbV/bSxdelYcJKkZLwcf8Rex8lHIkDnnFGuyz5
 e1H9Mns0BuSLqmfBVej+EBvkSyBMHbNgBw23+vXTEemxCDoauCS+YU2etkRptG7z
 VTnp6eEk/Z7tL/1wLkkePaabgpW1FJio7QCoxeMtWuPPcSYYCu4oypmO10GalkGf
 0xwoKgMaewYoaeAbwab+TUGLvwNjHCADk605//vBbkjQeRAsCd7NhX4yqjypOER8
 OK0OmE4+UirBYg==
X-ME-Sender: <xms:OTLgYTn10DN3FvfSMPEEzFoxqOVWmSoICf-hUcq7x_IRLPDQ2s37nA>
 <xme:OTLgYW27y5KAlyi4fax2TUaBeiMEXz2T6---_7GSo9g6PzbkIu1UivHJHxCePj2cF
 QLCH-5eeh-yC6CY6ug>
X-ME-Received: <xmr:OTLgYZoT_9CygVuX8Ilnc2fwkttT4k78IppvjsD6dqZqYHddGK_c-Qk_says7ptIC7rB79UVipGJwfozpcJpPyfxu-eMZTrsQnDwwE0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OTLgYbkgEwu3QVbU3f9noyPvSsQljrq59Hz2hXBz-2i8IlogJxlE6Q>
 <xmx:OTLgYR3pWrsz7_Ltd4Ppdggp8oC1k3zS9JiQQVCaZ7Mf0Z2xhJh9Qw>
 <xmx:OTLgYavrxwDGSaj2cME4CEtT7hjBill6Av1Z36NtHg4p4aZG1hOqbg>
 <xmx:OTLgYav8cVmnYyqz_WE-sEHF4ojol0TALddrcftMPGAQLiSU1RTQAg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:52 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 13/16] drm/vc4: hdmi: Take the sink maximum TMDS clock into
 account
Date: Thu, 13 Jan 2022 15:07:17 +0100
Message-Id: <20220113140720.1678907-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113140720.1678907-1-maxime@cerno.tech>
References: <20220113140720.1678907-1-maxime@cerno.tech>
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
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
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

