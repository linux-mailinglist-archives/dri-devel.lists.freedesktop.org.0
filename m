Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F8F38FD7F
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBE06E053;
	Tue, 25 May 2021 09:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC606E053
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 09:11:10 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id AEDB1A09;
 Tue, 25 May 2021 05:11:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 25 May 2021 05:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=uQPzFz4rsR1CZ
 Eyj9NEDhDZyvUIuqds/jM6YN+Bp8Yw=; b=v3oNEPbQZCKbTJHYgNi4p6WJGadSF
 dBm9kQyizws/1qRyYlWRrdDF0NXAToqWhtc/w6pOgImZAD1DQxtuUCuejmrcgCrb
 z7mu8ShruIFh1FscZXNyio4amADV2uHBTCvpvpumbf0hk/grljZMKTak2uu1PFMC
 r0K4YSKzp2ntdh9gClOGDBDWaLfR5GXj+7LM9aGZNmFq5YgtHTi3ErLE4jn8+S7r
 VlltL8F5eqvpUa3+F5KJxjn+wHRBk+JCwrEhmuIecQVzNV+FhaJfxc+4akynGCGM
 sItv+GGSrDXvaxqNsyMw9jPNu9QPi1frN8a4sgmIpXTXflcZV68HFxnyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=uQPzFz4rsR1CZEyj9NEDhDZyvUIuqds/jM6YN+Bp8Yw=; b=ekTzkxU9
 QKKoE4lf387CUY0NxzluXZ/7NwSolxI2DgJwK/3M7hftS5M6FsrzD3oIasFjN1VR
 WkmP+Q2AQHu6plkdU3ZmzCfQADX6+8ONb+caR1HbipQjINIHn/G3p+h8gR6TrAzn
 lMkMmvNFJyvE3fkbp/wNBizpYSZ1OqLyBHOhG7HOx7aJNH/n6yKpYUq8nosdXkx9
 XpatXTYQRfRiZQllhnyK5konLDE4xOsuEPznFpD4q5xhKqu5zwX9HwzvUOXDLJb0
 n3qgBJZuaieWpb4xukJK7t21moYEsIEYQNm4vhdsOeIO6kmlHYtuyxSle5Lm7V9q
 BsQ19VE6jS6e1w==
X-ME-Sender: <xms:K7-sYMz-QS4Xivf-7Ol4iWhBsrIq4ktbbmybEByq8fnhRq1O5KJEpQ>
 <xme:K7-sYAThChFuiFAVxQHsWliF2sEnjb83YILcghh7YBgcisqxuu1yQwED6Ys2VvRH4
 KEao_Y0a03owGXbGIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:K7-sYOW-2-bphzXG666x1hn2K-gjAwFAU_BeblujW9fmCBQ0kiZ_3A>
 <xmx:K7-sYKhxEY-uOelwyyHY70AF5mJ3B4xy8nv4fNqQu2P1k8jAKIqM0A>
 <xmx:K7-sYOAYrkl24_rQy0rtLoG-opBBq0saG74l198rJDN48nV65dh1ow>
 <xmx:LL-sYKx9gOBwk-hL7f7Rr51WEZkGsfFQV0g1FYISOrc3qf0atiOFmaFGJFk>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 05:11:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/3] drm: Mention the power state requirement on side-channel
 operations
Date: Tue, 25 May 2021 11:10:57 +0200
Message-Id: <20210525091059.234116-2-maxime@cerno.tech>
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

The drm_connector detect, drm_dp_aux transfer and mipi_dsi_host
operations typically require to access their underlying device to
perform what is expected of them.

However, there's no guarantee on the fact that the device has been
enabled through atomic_enable or similar that will usually power the
device. The access to an unpowered device is then an undefined behaviour
ranging from the access being ignored to a hard CPU hang.

Let's document that expectation to avoid as much as possible those
consequences.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/drm/drm_connector.h | 5 +++++
 include/drm/drm_dp_helper.h | 4 ++++
 include/drm/drm_mipi_dsi.h  | 5 +++++
 3 files changed, 14 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 714d1a01c065..0a1d9a0fcbb2 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -848,6 +848,11 @@ struct drm_connector_funcs {
 	 * locks to avoid races with concurrent modeset changes need to use
 	 * &drm_connector_helper_funcs.detect_ctx instead.
 	 *
+	 * Also note that this callback can be called no matter the
+	 * state the connector is in. Drivers that need the underlying
+	 * device to be powered to perform the detection will first need
+	 * to make sure it's been properly enabled.
+	 *
 	 * RETURNS:
 	 *
 	 * drm_connector_status indicating the connector's status.
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 06681bf46d81..4fcb027c8821 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1884,6 +1884,10 @@ struct drm_dp_aux_cec {
  * Note that the aux helper code assumes that the @transfer() function only
  * modifies the reply field of the &drm_dp_aux_msg structure. The retry logic
  * and i2c helpers assume this is the case.
+ *
+ * Also note that @transfer() can be called no matter the state @dev is
+ * in. Drivers that need that device to be powered to perform this
+ * operation will first need to make sure it's been properly enabled.
  */
 struct drm_dp_aux {
 	const char *name;
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 360e6377e84b..849d3029e303 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -80,6 +80,11 @@ int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
  * Note that typically DSI packet transmission is atomic, so the .transfer()
  * function will seldomly return anything other than the number of bytes
  * contained in the transmit buffer on success.
+ *
+ * Also note that those callbacks can be called no matter the state the
+ * host is in. Drivers that need the underlying device to be powered to
+ * perform these operations will first need to make sure it's been
+ * properly enabled.
  */
 struct mipi_dsi_host_ops {
 	int (*attach)(struct mipi_dsi_host *host,
-- 
2.31.1

