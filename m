Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BBF3A9D51
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 16:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615026E58A;
	Wed, 16 Jun 2021 14:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB296E55C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 14:15:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AC6565C00AD;
 Wed, 16 Jun 2021 10:15:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 16 Jun 2021 10:15:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=3dtHcBV3tS8vF
 0DKoVI8uru7i7UpqZ4KJaobGxNtttI=; b=3k59SEegZuGLSA9PebY0gVdB7w+m3
 z7jCuQK42EMVyKWDf+3hFVJ6K4HfjT+KvqIAipi3WmdyTA6x5aia9m0qNq2DJDT6
 BHxcBD5itGcKUCHjvLlVvaTRlWmMLgxTpsVz/c2LnReylXNeQx/ZMSm5VlSaMenu
 T7c5Ywuk96Nu2+grBVVzQ8AIT6/1Vb7xKZ7lDNm1PhwqiMMifIkidWQKe3FfP7Cy
 boIj1QELVU+iWw/lGoH/cj6FW/lJHCrUPWygtyVgXxuyxxR2090pZAGa2ldLOjOO
 7tA57UNj1lrKD635dfKCNmH+bL7BHuXr1gGjBDWDJRcK0fklL0r1hqzpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3dtHcBV3tS8vF0DKoVI8uru7i7UpqZ4KJaobGxNtttI=; b=ZrIjQ10v
 znZueIhgxG+Qp5+gUrsKahPwfTjerxvDMpUSCWFZhe01513HQLV9j3s3yhhggddi
 GAnp+nj64gM1etGSqoHSYORBM38qcfkEmMuHJ4RshYn6uSCEqVb8nqKZDVSbe4ap
 sLE/Q7vhDqIXA68Yb2Iy1siITiLWrxv1xE2SYkM5VV4zd38i+nkmKTRD/+49hbF9
 FLSRTLlCA6QKNhRx3Zy2MJcnFt2jiDgbe3lifQhafHuqhBjrHxdvZnmqs4RRC13k
 raqI5YXyWagJnfG1fabRmCjm2S4W/x2vwN65+BOqiomRsxe3kp/4BoD//Odz6Pmz
 9iTr2Xrg3bLdPA==
X-ME-Sender: <xms:jQfKYBnldQEF_wT3IKcQJrAmEZ6ZAT_YGE0j3CsEOGHqWoSSxPAx5A>
 <xme:jQfKYM0dCbTqZnKs4TwjhksmKba0C4qm4KYmtw8jID2l0gn99FtpyGNrXt3OVMVDL
 pnvvr8gmv-gD9EB3tc>
X-ME-Received: <xmr:jQfKYHo2BA8LyFupr1et76KVPrSkL4H1x4_DOv8mbmEWmDbKZMNytHqgnbhmvZ3Esp3QrUprtgMHPxkFjWOuN12FqxyJ8CXpt5L_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jQfKYBk6GHeLTRXUF1MKWYxMY-Ewn15I80ovGcGwP3xwPv_gdgBqbw>
 <xmx:jQfKYP320vIMNvDJMBnnN-b6T6Cu-S1YOOJXPNXySSWEW9qAQAyxww>
 <xmx:jQfKYAsU3YUGsfxdFDYb_dodBSosl1W2JjP0Y__Z4SB8-a0_UkErEA>
 <xmx:jQfKYKT8w75u5Sina_o28LFlU4LC-Dn2wh5LBYQFktMd4fNzWwsmjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 10:15:41 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 3/3] drm: Mention the power state requirement on
 side-channel operations
Date: Wed, 16 Jun 2021 16:15:29 +0200
Message-Id: <20210616141529.630719-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616141529.630719-1-maxime@cerno.tech>
References: <20210616141529.630719-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
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

Changes from v1:
  - moved to the field documentation instead of the structure's
---
 include/drm/drm_connector.h | 5 +++++
 include/drm/drm_dp_helper.h | 5 +++++
 include/drm/drm_mipi_dsi.h  | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1922b278ffad..fae03a43d04f 100644
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
index 0cc6062ff3ad..cb673bc5b871 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -1915,6 +1915,11 @@ struct drm_dp_aux {
 	 * The @transfer() function must only modify the reply field of
 	 * the &drm_dp_aux_msg structure. The retry logic and i2c
 	 * helpers assume this is the case.
+	 *
+	 * Also note that this callback can be called no matter the
+	 * state @dev is in. Drivers that need that device to be powered
+	 * to perform this operation will first need to make sure it's
+	 * been properly enabled.
 	 */
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
 			    struct drm_dp_aux_msg *msg);
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

