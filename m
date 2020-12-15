Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D48FD2DBD1D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9466E042;
	Wed, 16 Dec 2020 08:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC2F6E3EE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 15:42:52 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id B5C1FA57;
 Tue, 15 Dec 2020 10:42:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 15 Dec 2020 10:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=K/2dJKjWuDlDD
 +pbZkz3NemH5MUhnJv/7FProiUrI/w=; b=NLAAvq3GadkebKwc15xb7WJpize54
 Z29SJh9wy7o6LFFqJx6L7Y8W9gQzNeriOf1Q5Trk2EaTIoc442/kJCb+o7wtJAvd
 CcSgESM5fBVcqtbbWalmxe+VYeyUE3+Ji6u7PhG8nBn1XHDgvR6jZTfi7k4Z9aA4
 30XLFQ3bUO6TIe5IAZftdB0Zc9CYewLdCNijYLF8tguH1gSjegykVnllU62wAjNX
 hvL3A/2gKiMGtM9t0gIhplqj754c9GBZxG5Fdkq3WcJ206lxugRnJI27C5mxLLpt
 jVtDswLKIu/yHNhCM3+7o8wSzoaN+qmZG2b38PgGS1IgORdX60TrB2JaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=K/2dJKjWuDlDD+pbZkz3NemH5MUhnJv/7FProiUrI/w=; b=RsvumrDW
 hdimKniYZdEhCR+9O45w1VcozIfLU2jvAUsNqBIgltBIC13B1IGMOJOJoiKeSpAQ
 K3XBuO1G3LVddJsEgVWheZHDFz5cSGr8vTwtJ9t35FcfnVOVVvvWo9xQMg0IZ//U
 b2loAXB/Gz4Jb9oYpLPX1AnesRcaM5GMyucdcarrdtU2HgsCo6bkiTLIu6gcsx6D
 IBfa+fzZINvymCKP93OCrEmyn/Juqo+yENlNojpjEv3U/AKIV7RqOFEWREZfTfn5
 WNSwzvFtxbOAjLW+NbDyh+oUHx6RwD4X33zmbQ4FoijwznEyrNqh978h7SpkYi0f
 PX8oFQClxlrejA==
X-ME-Sender: <xms:e9nYXw8dFL6O2qGWzcSNXPhI-atwQP-nHzQ2msB-R-qPiVpoKJeBsA>
 <xme:e9nYX2jnn6Xioo8ygspgFP-fk94vQnib74PmLejQLgoqt4vdiuHD7Mj2RRGbhFrv2
 Z1XZ--EhPdMOlWLK3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeltddgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:e9nYXwctHmBlXeCRwO_bHRxGZ5DFiYK8NVWoxanGQ45jqazukDQ37w>
 <xmx:e9nYX9rDV-yaW3r31Zf11DVlxNb51oYB2luxTvs790vtSuXGJH_y-Q>
 <xmx:e9nYX1BTN5wo1hzG-bzRVSOKpS2NlmxEQq1jK03gE4m0Vkqq7bNZCQ>
 <xmx:e9nYXzuK03TzaAjr69jc-Q_9XJBYEArumg_FhnTEMWLmTUH6VdF3td9qPaw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B5C424005D;
 Tue, 15 Dec 2020 10:42:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v7 4/9] drm/vc4: hdmi: Don't access the connector state in
 reset if kmalloc fails
Date: Tue, 15 Dec 2020 16:42:38 +0100
Message-Id: <20201215154243.540115-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215154243.540115-1-maxime@cerno.tech>
References: <20201215154243.540115-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:55:47 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_atomic_helper_connector_reset uses kmalloc which, from an API
standpoint, can fail, and thus setting connector->state to NULL.
However, our reset hook then calls drm_atomic_helper_connector_tv_reset
that will access connector->state without checking if it's a valid
pointer or not.

Make sure we don't end up accessing a NULL pointer.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3dac839b0fa5..920895deb2e7 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -171,7 +171,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	drm_atomic_helper_connector_tv_reset(connector);
+
+	if (connector->state)
+		drm_atomic_helper_connector_tv_reset(connector);
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
