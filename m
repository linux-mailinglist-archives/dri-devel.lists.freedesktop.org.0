Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6559D38FD82
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2676E519;
	Tue, 25 May 2021 09:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4856E9CF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 09:11:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 79C9DD3C;
 Tue, 25 May 2021 05:11:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 25 May 2021 05:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=wP0jl4KlEN32L
 vnqGPt1Hnbbz7tRZrPWgnwL8nfmbWw=; b=PR+k1p8obfXp464V47PmmciELKDWk
 v79jXB5j6JgqBpaJErdwCbMwIy1EXUvgjr6jamNjXbUBKpYBKRHUlvAuXcvXD3vV
 YBy1Upg7CrnSL5osU+0Llc5wpkS4MHdHpbId/CGltzuaAygaDsgCfNm3Xk2aJKHz
 mXDi7iTwLgdlJt8i9gyt+dTm02b/kfyHFDcVFAHhtkOQQmpCIfxv0/pF9TJ4pWAV
 d/R7xmClbvXsNGXRimfzVtzFc9ZO1vsteJc0ZBaN2K9FTPfZYSZ7bOY2rs7/iscc
 D/7lFWrF0z6ZaD+xj3i4xCZ3W7Db4lmSX7Tb/8vW+S/lDXc0IOSaILvNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=wP0jl4KlEN32LvnqGPt1Hnbbz7tRZrPWgnwL8nfmbWw=; b=FaJaliG5
 dcGxiKFue3W4UTbstltzVT1skrWaahkYUE+di0K5CrYRX3BRXd3nnatsorzxmtcp
 6vgRS++8BjPV3F9LhR4LzWvtcS8nfpXjBZwGKdqJvOq2V51ovsP3xnau+85DauEJ
 zTiaN/XcKXRxvOYYqF3QoEHqZlCQt2qQat5PT7qtAH5icXzToU2P4Rdh5wRBWNGU
 E0FEDn3iNaU78TA2OIEQ1AlwkBU9Fxr9pkRxUkVhlOYPmnRbPaQ8dqrMfUe1/cQc
 g3zHT22rt1+4QBcTWEhpOncGnU/+22Ix3O4iMu+qroB4sFil04h4kwIB8VNvaq7R
 QgLPmXxlf7MrzQ==
X-ME-Sender: <xms:Mr-sYP0XOaqsioYRAuAMwKfZYfK-LJog788sXg4UziPpxo6mjyEwTA>
 <xme:Mr-sYOGgDpFz6300LoDOitmc-RUg7RahoKzn7IxDg3JpDWwFxoon4qucWIsdUymOv
 bKJemAJTqmmug68IDs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:M7-sYP79kEywN9wVvx4LyYD3vqoSniQ1ooc2Rx7TXhe6n_Om631O-Q>
 <xmx:M7-sYE3F-YwBKPpJT5oqPPZf5p5Dz3LPtBgyb3_srBNlqhgXYHNH2w>
 <xmx:M7-sYCH021KB2WKCqSpwXpBPQZObgx1CjhnUBLcAQFcIkKo0buTr4Q>
 <xmx:M7-sYOFt3FK_Ufwwm1628zLONCbDnA2MK1Bbga4DYyzVqOAEz4pbgK_s2Ow>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 05:11:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 3/3] drm/vc4: hdmi: Make sure the controller is powered in
 detect
Date: Tue, 25 May 2021 11:10:59 +0200
Message-Id: <20210525091059.234116-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525091059.234116-1-maxime@cerno.tech>
References: <20210525091059.234116-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the HPD GPIO is not available and drm_probe_ddc fails, we end up
reading the HDMI_HOTPLUG register, but the controller might be powered
off resulting in a CPU hang. Make sure we have the power domain and the
HSM clock powered during the detect cycle to prevent the hang from
happening.

Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 867009a471e1..4b6857467e58 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -166,6 +166,8 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	bool connected = false;
 
+	WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
+
 	if (vc4_hdmi->hpd_gpio) {
 		if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
 		    vc4_hdmi->hpd_active_low)
@@ -187,10 +189,12 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 			}
 		}
 
+		pm_runtime_put(&vc4_hdmi->pdev->dev);
 		return connector_status_connected;
 	}
 
 	cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
+	pm_runtime_put(&vc4_hdmi->pdev->dev);
 	return connector_status_disconnected;
 }
 
-- 
2.31.1

