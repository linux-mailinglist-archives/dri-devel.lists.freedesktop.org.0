Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 421103CFB06
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E386E314;
	Tue, 20 Jul 2021 13:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57CD6E314
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:45:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 941872B01187;
 Tue, 20 Jul 2021 09:45:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 20 Jul 2021 09:45:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=8yAEGsFt+FTE6
 Oglj0fT1zDjBqe/OTSnpQ+lXQWNmQI=; b=RxhxK2sJ9lnaAnyxBhS5odAYTWl6K
 RK4JFMbjDVeiLlX6B1apYmEoB2LJS1YmMxAvnh48ksfLvBmE/mH4zDr8gfx2XU6/
 lKUiMk3lKHt/VgAa2OW5g0MfaGzWPobbwr7/bYdr34ZMeQmHJRw6PdBowyE5gxhC
 14WrQMNAubyjsxdnIkpfyZmKvmaxASVXGkL9SLHJaPMSdpQJuZin6W4bO4EjuTdz
 nmp+BK2GHACwoNHCMrr0byBiXWK9OsLO0ggmSkthSyRJI5srZ0Snc1SCaHOXSHcP
 xsJOu5zoxLhktZspOejNrM39aQxJGsM+0M6wNq8yQFJv9ajDFvyZhSvLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=8yAEGsFt+FTE6Oglj0fT1zDjBqe/OTSnpQ+lXQWNmQI=; b=HBkKpOXd
 po1yKVaQrn7c1QFp2kX8A71zvW3Id8RF2c2nfbCZ4PNXNQYv8YWK7ZtyU0DUKTzD
 1XMuc0T0nLbejPpreoW4ZMkSeUNK2+i+/tcfI45zQj9iynujyasaAws5Iz7Y2Dy0
 zlXP+aTtnX1uoaORIUcUmhkd49dIfoxmbROo6KZbJNKMt3VRMKhzuB6xveEz0zwV
 TkHZx4qs8XTtNdFHH3MTnoLSp8Z81RoEvGFICJuO2Vf08pH8PIeBIKwx1f47c8H8
 57Wmv0PS6/6XWyqhOQAWAbmy8L4wvG0JKJy5svUFfoJiJYlvBA/NSLDmNQriXBYn
 Ol+NumLtA9dCrg==
X-ME-Sender: <xms:kNP2YGy9JnAmK-Ob440GybMeuQDw3aqEO1xehxhVlrXYeYe394wtKA>
 <xme:kNP2YCTLMx57n2nt9KoDKBM7oEEvfEomrvlYjdy8OQhuzcQkPLv-mD42AVQ8ShVbc
 Np7HTXQm3JponbUuPk>
X-ME-Received: <xmr:kNP2YIUuINkMm1KdFHXYTa0BaRr_f3TssKrV1-icsUI6v7TgEMf4uv3yXYEkOFcyJp6oJAhf2Gr6ZRqWFFkFpgfBqE5eeOiq1xf->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kNP2YMi4_tntY8eISDbDcQSFWlb04u0UEQcsK3y-8WD4qZUnWdk0uw>
 <xmx:kNP2YIAhHLDPtT2INzZ9iBlaaUZTbZcLRTJ4azoQ6VlBjkWB_VlLzA>
 <xmx:kNP2YNLf-aQoyj9Gob9OCng4j7IgJGejiXWMMe1iiIL-Ci_i2yfNoA>
 <xmx:kNP2YMyef9qefPyF90LahoZB5ugS5GQ9gw_GvFonR-O316EX0cxHu5AZ-RE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:45:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH 05/10] drm/panel: Create attach and detach callbacks
Date: Tue, 20 Jul 2021 15:45:20 +0200
Message-Id: <20210720134525.563936-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720134525.563936-1-maxime@cerno.tech>
References: <20210720134525.563936-1-maxime@cerno.tech>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to make the probe order expectation more consistent between
bridges, let's create attach and detach hooks for the panels as well to
match what is there for bridges.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_panel.c | 20 ++++++++++++++++++++
 include/drm/drm_panel.h     |  6 ++++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index f634371c717a..23bca798a2f3 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -223,6 +223,26 @@ int drm_panel_get_modes(struct drm_panel *panel,
 }
 EXPORT_SYMBOL(drm_panel_get_modes);
 
+int drm_panel_attach(struct drm_panel *panel)
+{
+	if (!panel)
+		return -EINVAL;
+
+	if (panel->funcs && panel->funcs->attach)
+		return panel->funcs->attach(panel);
+
+	return -EOPNOTSUPP;
+}
+
+void drm_panel_detach(struct drm_panel *panel)
+{
+	if (!panel)
+		return;
+
+	if (panel->funcs && panel->funcs->detach)
+		panel->funcs->detach(panel);
+}
+
 #ifdef CONFIG_OF
 /**
  * of_drm_find_panel - look up a panel using a device tree node
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 4602f833eb51..b9201d520754 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -68,6 +68,9 @@ enum drm_panel_orientation;
  * does not need to implement the functionality to enable/disable backlight.
  */
 struct drm_panel_funcs {
+	int (*attach)(struct drm_panel *panel);
+	void (*detach)(struct drm_panel *panel);
+
 	/**
 	 * @prepare:
 	 *
@@ -180,6 +183,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
 void drm_panel_add(struct drm_panel *panel);
 void drm_panel_remove(struct drm_panel *panel);
 
+int drm_panel_attach(struct drm_panel *panel);
+void drm_panel_detach(struct drm_panel *panel);
+
 int drm_panel_prepare(struct drm_panel *panel);
 int drm_panel_unprepare(struct drm_panel *panel);
 
-- 
2.31.1

