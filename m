Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD98560039
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F3514A682;
	Wed, 29 Jun 2022 12:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C314A66B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:38:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9DA863200979;
 Wed, 29 Jun 2022 08:38:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 29 Jun 2022 08:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506295; x=1656592695; bh=BV
 xubKD0bZZo/P0MJzKmLRn/YrJkV/gBo8LgkEqmBv4=; b=bsru+GF7RO+8EnH9fO
 uec4uKBqCcpbel+ESSyHT74+G0UqeiUbhvn1LsYQHIPIhkEHEG3MyeSH1YR2mQ7Q
 s1VvME3g3glNxHv+DjgTdU3zyiRZggVoDO4KuarSFHVHC/w2aXhuluTJUnz0vrrN
 aGPjlYMrvKnx302B1TrU+Xz82oEF1WYvLDGU45ZAe9ytCYi5PRy9EUKhLuq22c3S
 Yc+HdCaU/y822U/08pBQtYkOl03ja3eHqRbee8FcAj8cNtF/T2KPeEqjeq2acvAy
 WGX1UargujVaoc/cEE7XqGbB49ABbDPjwneoAv0BLFNLjMYk3OpTsFIrPkLbZOM9
 fy1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506295; x=1656592695; bh=BVxubKD0bZZo/
 P0MJzKmLRn/YrJkV/gBo8LgkEqmBv4=; b=KlsGqVJXZ2gkPKxn872q5/2mjp2yF
 wkqY1YwkdPYIqMP5+zu9vri3yVGHd2mqHLC7oem3tDTsK2wK+fwLIN04n9oko+wI
 3q11qlkhoYRh8VnH84UJNbD4C5Q3EitGaYOqpK0aDcYeLfaQDUqqbgfEH2p8jZnh
 Uio7gP6i6ejR+IxPq08Oq0wsdaLdJx8OPiO/xcS4MOl51bqHlOyEuTUX4HBFIuna
 mMrAC7BmVi9+N5vfShu2lvRUVJ6yppaDcUVOCJYMS366a2ZnEZ81VLeYh+IIz5qb
 C15SeJTcNyihhzwFBbQS50mqzeANAtTmfxQ+6zNjfqsVQmEp7s4FFdr6g==
X-ME-Sender: <xms:tke8YgH_YtuddM7Yu3EtjDUFvaBW4NrUcBk7OKI1h4EFhLX3q-cgtA>
 <xme:tke8YpWVI5Xf5ysAFbVH5Oym41zYW266bf1P12YyuhpwndX7Umits0BARbsSFKLFN
 ub2EOLb76y2-ALtM9s>
X-ME-Received: <xmr:tke8YqLmRov1IuvXfqfGrruLTXbfWY15Msj6J9deKhz2YTZUcxeDAzhgort_v7s7niBTjufGOoY5I7ilWA9uqqKk-XW2igUypV71YeI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:t0e8YiEroV6UoWij_QUY57JHDvx__oWZhUuVicKyps8SxEnHVSmkxw>
 <xmx:t0e8YmXHDrS4V6cmCQg5vOuAoXyhT0PT473zImXv9CvdwXNonCeH3A>
 <xmx:t0e8YlNActn6Pul65OHu2Yu5_0DPvH6vGZp378CwcteHDlZL7YJESA>
 <xmx:t0e8Ykw0aP89wJIivFdjxRAN-2hO_4FCxvLKGxc24Un1BCJPUVRcGw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:38:14 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 61/71] drm/vc4: vec: Switch to DRM-managed connector
 initialization
Date: Wed, 29 Jun 2022 14:35:00 +0200
Message-Id: <20220629123510.1915022-62-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

The current code will call drm_connector_unregister() and
drm_connector_cleanup() when the device is unbound. However, by then, there
might still be some references held to that connector, including by the
userspace that might still have the DRM device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 518b66bcc0b5..4b843b18c006 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -309,7 +309,6 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -322,12 +321,15 @@ static const struct drm_connector_helper_funcs vc4_vec_connector_helper_funcs =
 static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
 {
 	struct drm_connector *connector = &vec->connector;
+	int ret;
 
 	connector->interlace_allowed = true;
 
+	ret = drmm_connector_init(dev, connector, &vc4_vec_connector_funcs,
+				 DRM_MODE_CONNECTOR_Composite, NULL);
+	if (ret)
+		return ret;
 
-	drm_connector_init(dev, connector, &vc4_vec_connector_funcs,
-			   DRM_MODE_CONNECTOR_Composite);
 	drm_connector_helper_add(connector, &vc4_vec_connector_helper_funcs);
 
 	drm_object_attach_property(&connector->base,
@@ -556,9 +558,6 @@ static int vc4_vec_bind(struct device *dev, struct device *master, void *data)
 static void vc4_vec_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct vc4_vec *vec = dev_get_drvdata(dev);
-
-	drm_connector_cleanup(&vec->connector);
 	pm_runtime_disable(dev);
 }
 
-- 
2.36.1

