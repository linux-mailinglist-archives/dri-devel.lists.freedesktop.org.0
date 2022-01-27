Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666C549E435
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F7C10EEF4;
	Thu, 27 Jan 2022 14:10:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C314D10EEE5
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:10:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D9035805AF;
 Thu, 27 Jan 2022 09:10:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 Jan 2022 09:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=9mbUfQ1GEQHnSAUGIKRKIKh820kKx3
 t6FdGLkje7Ekg=; b=lQahqLs9uHNt+iwOExLzZp70XNFZBjg8RWliDzjtiZ1IFJ
 sEDtq8i6MB+OyQRmYVHXvciBjsPGkvfj4V4FbJRAlYrqr4q7Jq3rLxmQqyo6FNz1
 VAsNo+iBFGAsWmqXzvuY83QB6N3ONLW9edPt5KjhRD7ajgZ+RhW7IKLTZhIeqL1r
 6VQy2SoByPcvCsZgjmUwPgnLg1Q7rQZdF/1OqxCqnzb91h2wlYdEP5S0J65cS1W9
 Jl9YGYWclm0DsV/qeAZ6nCTPz7E8mHvPUQq8kwhiyzRQ+/4B2baMWoTD6s/JYjeV
 jWJESVsswqsBFyYnD3k+LxDdO6Uf3P/Z2AhIpkVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9mbUfQ
 1GEQHnSAUGIKRKIKh820kKx3t6FdGLkje7Ekg=; b=JhkA78TWo+ZJbDR1rvki2s
 Cmd+wYZ6wwqrdAoK9Bck88t6DjbamoiaTZLk3F8TNZf/sS8nBkWbiHk+UNkqs7ne
 7pUefAZtmnN0T+H6mxHNlfsC8MHhRTy9MighJtxG5O784i33YIZAVtAsK8nyCi6m
 szSYaC9zO7NFdXrHUiPlsBXeRE1JsSE3uA9Tt1TtEzHtMOoRZQjb0/1Srb+2flXx
 e6vLFGPig97P47aS5gfM8RtZuVsLQsBp8GJ9mEW1C9qmsmTOttDjo+TrbAoxmmfX
 xTaOXWbunC5rxum6DDLRkV2H0RAvRd9JUAQktFVEqx9cyzYgwOCkRTmgPHsau8mQ
 ==
X-ME-Sender: <xms:1qfyYS8bKInpFuEVoMXh1OWU5EL2jPfCJx-Q9rA1dobIiNsMQy18NA>
 <xme:1qfyYSvpyYeO8C8clg-E9snAqYWfR2d5CCYKwspJ9wY_X0vWtLGJUihOp_OUxgBXL
 hvBLiotsxX448aapj0>
X-ME-Received: <xmr:1qfyYYBBeW2m_oIlSJwkVTG3VFFruJckLhr922AG51LhU3lKrDcR_ud0T58E0aZX50Rc0FILDOvylp_prWZGhmlnQdROCzN5A4X_lBY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1qfyYadPXTR3U9Xqe7zL1adcslpSxRB8B2gz2LJuJRnk13Ufl_kWyg>
 <xmx:1qfyYXO4gp0dQXJOVVLSya2Qlp3O_V9O-QxLQ6BX_cI7DzpTQzgnSA>
 <xmx:1qfyYUl3SseC7uLdvGPINiUA6Hw3MVX7DIjPrXm9BtKVr3rIZ4kSEQ>
 <xmx:1qfyYYFNJEiXxLEvllck4FvaewQ4U6B6vxcX4FzINkVwkthxbgV3mw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 09:10:29 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 3/6] drm/vc4: hdmi: Take the sink maximum TMDS clock into
 account
Date: Thu, 27 Jan 2022 15:10:18 +0100
Message-Id: <20220127141021.302482-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127141021.302482-1-maxime@cerno.tech>
References: <20220127141021.302482-1-maxime@cerno.tech>
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
index a1fa37ad350d..4c3a5959c7f5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1265,12 +1265,18 @@ static enum drm_mode_status
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

