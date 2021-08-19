Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA943F16AE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A40D6E7EF;
	Thu, 19 Aug 2021 09:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5DA16E7EF
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:51:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A753580B72;
 Thu, 19 Aug 2021 05:51:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 19 Aug 2021 05:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=nRV1Eai6qAJHU
 roNTrS4upIzp/dN/NJiwqZjUd1o110=; b=PymZsxRgKwiL9isqGGRQW4IIOu5Ks
 X/5AiS4B3wNGIYgWRCeGMzBFUeNw/5h964tfKyTrmuHqCAzhlQgXMgCmwC78bVPI
 4eNCOIw2WnxLkUqxlo034Wk3p8cylkO6w5XQEDv6bv2cial50c4A3HWoC6z0zLur
 HRP6W8AnsosiiJPdcIYKq6B9dNYTBy48gCZfbkA/Yb+2tGM90cNQyXMOYHlgeyAQ
 s0k2a0eCV7S8HkolGEdfSJjWY36jPyNpC6Uu9B3YhApsaM8ERK6ZAW6o1/Jy0Kui
 YZskncn/Qt1jaWdjt64dAszRDRPmMAPTYIZE4xGA411drBTvZfIl6NjgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=nRV1Eai6qAJHUroNTrS4upIzp/dN/NJiwqZjUd1o110=; b=LiitCguB
 EbcA/2Q0vgoWqOwAJ5a6JPSr+kvJqwfNe/3OiEG0/XX/AR99Ii+6mEfjq6NmLP5w
 QX7BhfSq3fRHIlIrKvLgpaZfXF9phdBqUWwn/CJhliMj3nrIdoNYj2tW1WfT/KCY
 eTS2m+3cKdJy0oV5S4EtrrSRQXNbk3UtYd/vXkIPjMZLiFQtPs5oBtpYfUN1gjyQ
 yFZUUP9DvEXHQE/8BP1KtcMeZt+IFm+UoQQKQ3bQC1aw6ZSxMAS53aQ6EfajpNEm
 kh2BPtWCa7OyCO0SNWZn6Ejf7SH+82+U4F3FtBFGY6EPozKml58gO6H2nvJlqKAB
 5uLRaV1QCMgmsA==
X-ME-Sender: <xms:sCkeYQHQvbUdmmyOTVuKrqMIQ2nFn7aiVez9tmbQLbyNS43g4b9x8A>
 <xme:sCkeYZWSlNHqDQqNw3bf3TNI2n1UDQWR79wvkU_AGXXN47BgZwIX1hmWot0Fjy-Zp
 htdzxigjf3BdLR0EPo>
X-ME-Received: <xmr:sCkeYaKfsAamZ8578HhRoWUUGEfR1C4W_6PAhKtRDhDEgWu2vi9x7vaHghxMsklaNV5HNsZJsWopYWAlGo-Wfudd5IcKYvm9LUom>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:sCkeYSHw2nKGxENK_952LHh-gp7Njn9Lby0jXoUWXxlxUSbJPBFgQg>
 <xmx:sCkeYWWopdPQm1F-8M_1f-ZVBXz1Y3HfLpu5e_r4fBHZKWlZbBc2Ng>
 <xmx:sCkeYVMN1kYcbsxBMHSBEcjK6JChNphQLH1IGTDdf_xZq0ycMeKqpw>
 <xmx:sSkeYXvNUMTRJMqdu03ahuY_JBkAgUUQuUD7cILIXkVjquSpIr4BCA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 05:51:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org
Subject: [PATCH v7 09/10] drm/vc4: hdmi: Enable the scrambler on reconnection
Date: Thu, 19 Aug 2021 11:51:18 +0200
Message-Id: <20210819095119.689945-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819095119.689945-1-maxime@cerno.tech>
References: <20210819095119.689945-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we have a state already and disconnect/reconnect the display, the
SCDC messages won't be sent again since we didn't go through a disable /
enable cycle.

In order to fix this, let's call the vc4_hdmi_enable_scrambling function
in the detect callback if there is a mode and it needs the scrambler to
be enabled.

Fixes: c85695a2016e ("drm/vc4: hdmi: Enable the scrambler")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d2a720e05ddd..a3dbd1fdff7d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -161,6 +161,8 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
+static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
+
 static enum drm_connector_status
 vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
@@ -187,7 +189,9 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 			}
 		}
 
+		vc4_hdmi_enable_scrambling(&vc4_hdmi->encoder.base.base);
 		pm_runtime_put(&vc4_hdmi->pdev->dev);
+
 		return connector_status_connected;
 	}
 
@@ -543,8 +547,12 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
 	struct drm_connector *connector = &vc4_hdmi->connector;
 	struct drm_connector_state *cstate = connector->state;
 	struct drm_crtc *crtc = cstate->crtc;
-	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	struct drm_display_mode *mode;
 
+	if (!crtc || !crtc->state)
+		return;
+
+	mode = &crtc->state->adjusted_mode;
 	if (!vc4_hdmi_supports_scrambling(encoder, mode))
 		return;
 
-- 
2.31.1

