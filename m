Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E81F3CFB08
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 15:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF796E321;
	Tue, 20 Jul 2021 13:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E8A6E321
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 13:45:59 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 61D722B0008E;
 Tue, 20 Jul 2021 09:45:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 20 Jul 2021 09:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=RJHCd20ztixx0
 Jw0hO0kTjsLqhDgzKUjg5r4sge0A3k=; b=b/Dqp/4SuZ4fRuuF0mw63N6FkvEiK
 XWVE5SG3erjQu3d4EMkDN3KxLukIlAVW5M0FA9qZay+yPkXN8vWNA6owNahtsr7J
 d2wsBOkziMvOhjeyXyYU283mcSs5x6S9qj5gru8uNNLnxYSkQAgjlgwzihO4htDQ
 jzEYDkUkXf8djMLBYuNfx43BzU1eoNeJVqTEvaoG5Ky06sCrs/RtMCCpQF/t9tgw
 RS9dPTMEnX0tHLSBY4W1Ql2ym44WMbmtWNGv7fzOdEa97UgqKRXy3znn7L/+eT17
 REZjrvipA9JRsNkQMbKLfdEhUEDloVqG1mR/G8RojrWqxRuttNMyQcseQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=RJHCd20ztixx0Jw0hO0kTjsLqhDgzKUjg5r4sge0A3k=; b=BNzg5woU
 ZlQOd4XT3rvqi69Bbgc5meQVUsppSMwEAVwgU1VewteLmpjEIAKQv9WQsIp/Pfo9
 tswUWAVAS1uaox43hx41w8u2x2SmIu+OTGaLZju1KM0BUgxBZ6xnyE5f6NQOj/99
 wE+Ogly3BioO30klFOFvMHCASJMD3l5uGqcbu5fa7HHha5FnAfcFa/dJtX3/udcA
 n/GtikGBbUxmU2ycza0AMO1eVBlXVwFTol5fjJCPu7mHNPnan8UgbpZrtcTOWqfF
 6i+inil0RUvR6p/DUhYrvpDJ2+T71Dv0oOI4lZ2TF4H2ytj/v+GrMmDCsJaiaqbk
 jznmgqbAUM4E9A==
X-ME-Sender: <xms:k9P2YNX8JLeGaeQv4_wUCiQML_gA5fEDXkslKiIGRKauI-RRZcfNoQ>
 <xme:k9P2YNkgOUi4G_J4cN2R5IQS0yQUdSQYOOa1ZNsSsYcKFwkdlsEQqMCnMRS0SzsTe
 1pNtO8fjqPrktAZczI>
X-ME-Received: <xmr:k9P2YJZKQoGnTLJ0sAo0EfGEivnq8JRuhlhrQgXShX7KXWOTneQhf9H9VV1ovZX-DuExA1wqjqMgvQuMxUbFHyWMWFj5bkHzFhlr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedvgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k9P2YAXyZ7Nz0U9kAa4azhcmkyovIYdmp8uqSXou2g517B6Tp25ccg>
 <xmx:k9P2YHlOknX-Aq5gItTTUkh9gN6N-4Yg8byd9nwJbXj05XU3KToCLg>
 <xmx:k9P2YNe7PkiBr8VoMFups02fg1xExQtRNzC41cKWfDFOzMF2ZZdYhg>
 <xmx:ltP2YBkslghzxG3JnCirVhr5Eq1H3SoIGb0Flo7TI7m9kHdw-bcVjeR6v6I>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Jul 2021 09:45:55 -0400 (EDT)
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
Subject: [PATCH 06/10] drm/bridge: panel: Call attach and detach for the panel
Date: Tue, 20 Jul 2021 15:45:21 +0200
Message-Id: <20210720134525.563936-7-maxime@cerno.tech>
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

Now that we have additional attach and detach hooks for panels, make
sure that the panel bridge driver calls them when relevant.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/panel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index c916f4b8907e..c2249f3fd357 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -60,6 +60,8 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 	struct drm_connector *connector = &panel_bridge->connector;
 	int ret;
 
+	drm_panel_attach(panel_bridge->panel);
+
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
 		return 0;
 
@@ -90,6 +92,8 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
 	struct drm_connector *connector = &panel_bridge->connector;
 
+	drm_panel_detach(panel_bridge->panel);
+
 	/*
 	 * Cleanup the connector if we know it was initialized.
 	 *
-- 
2.31.1

