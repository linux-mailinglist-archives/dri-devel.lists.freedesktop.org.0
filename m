Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 174233BE497
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FD16E837;
	Wed,  7 Jul 2021 08:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003216E837
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:48:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B479A2B0093B;
 Wed,  7 Jul 2021 04:48:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 04:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=jS6TVx0UliOrH
 1OI8iaaFRuBIIJXKjPyTT8H3/Zjx1Q=; b=NpNHp2jbwZG4HbnDRxsbAF03cl+Zo
 9SHRk8dbSqhjh1uLpuf+IWtBEE33XQDUV+cg39ADbxFYI66vZD0aNp36uzB9iUyr
 A/33cM4OTv8KXrbrYrBI6APd2S5K5MH9UldJlP5lBX9KO1/hQjjBIcmAZhPh+dNs
 jzphd9hxrvpl6aDz+aGI8aNYc5h2e0T8DJqsh7IlqXxtvZszzxLoYx5PzcVnviCt
 su42hmV7FiG2bYJADplfpDWe61UI03TKX7j9EMWDzigxyzP9VR0T0i4KNqvsHfH4
 DIT0621KgW9LBpqp/jpgko13GT+DYWwYDGVS2Gi5SIkLsjv+B9f4X43eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=jS6TVx0UliOrH1OI8iaaFRuBIIJXKjPyTT8H3/Zjx1Q=; b=AvihoGeB
 sfzBE4Z4oel8hBCQ1Y0bW36Wu1pm+dOIy4KG/Bi+KKF+zmB2No5/77K3vMh1dnTS
 UVadIkMkwf4rbo0KiXXANIu+W0W3Sm4Rw3+hueu7OPnTk6zwIFLFAkl6Jz1Qaacy
 3YAB81lL3qcxvL8ZcTjykbZjMsg2PalGPBAsJGPjpN8od0J0wFDNIWRAaMBL8BCt
 iSRSCcTCHQuFNA4VV492Z9aPqsgBldfW6WWmG9M4eUD7od4e7TpcxG8u4bAP9zhL
 7daa+ydoSiHlIGGS1++HBfTUutw7htVya9UBZqqeWNxFTNZvWWCJ3e5WQZNutng0
 s9G8SOS702LSZA==
X-ME-Sender: <xms:QmrlYKVlVDwxD_6Y1vWqDDU4J_a5riRk8xIuod89sTOyciiU6IVZlA>
 <xme:QmrlYGmhU5XHDPu-Z16izrw93Jy_NJ4BzZNXHWWcuvEKLsxsNJAENrHsv0MgX4e3S
 TVc42Rk5RzfJg8slXA>
X-ME-Received: <xmr:QmrlYOZnzIn5CuD7ZIXAHCyQlTomJ0Tc9Z_QAti6tjufkYJ7S91WElToI3piimDknMtf96HIBWM6TSusqYVCLacRGAxMmUVIQ94Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QmrlYBVNTNKBH3XXomU6kpjuI0QdIPPpa-r2Gc223DIvfWvF8WsLgA>
 <xmx:QmrlYEl0XZnPZOhe73EdyQeleIfFvpj1Ymdo4w52ZxVSxZJlBnymlQ>
 <xmx:QmrlYGe1dkURYz2TCdvb3aCU7_n6MPFx3hx4xA2pmrExFvneiq_YQQ>
 <xmx:Q2rlYJ_EhElv0OdUI705T2VSGmFbR8Ekcsh-cBStWm-8sSM5J5VgavJgCYw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 04:48:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 03/10] drm/vc4: Make vc4_crtc_get_encoder public
Date: Wed,  7 Jul 2021 10:47:38 +0200
Message-Id: <20210707084745.1365390-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707084745.1365390-1-maxime@cerno.tech>
References: <20210707084745.1365390-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Emma Anholt <emma@anholt.net>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need that function in vc4_kms to compute the core clock rate
requirements.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 8 ++++----
 drivers/gpu/drm/vc4/vc4_drv.h  | 5 +++++
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 18f5009ce90e..902862a67341 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -279,10 +279,10 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struct vc4_crtc *vc4_crtc,
  * allows drivers to push pixels to more than one encoder from the
  * same CRTC.
  */
-static struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
-						struct drm_atomic_state *state,
-						struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
-											 struct drm_connector *connector))
+struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state,
+					 struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
+										  struct drm_connector *connector))
 {
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 5dceadc61600..d3e5238eadb5 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -515,6 +515,11 @@ vc4_crtc_to_vc4_pv_data(const struct vc4_crtc *crtc)
 	return container_of(data, struct vc4_pv_data, base);
 }
 
+struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state,
+					 struct drm_connector_state *(*get_state)(struct drm_atomic_state *state,
+										  struct drm_connector *connector));
+
 struct vc4_crtc_state {
 	struct drm_crtc_state base;
 	/* Dlist area for this CRTC configuration. */
-- 
2.31.1

