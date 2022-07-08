Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BB56B6D8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 12:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341691138C9;
	Fri,  8 Jul 2022 10:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E7E1138C4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 10:00:00 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7EA6532009CD;
 Fri,  8 Jul 2022 05:59:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 08 Jul 2022 06:00:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274399; x=1657360799; bh=GZ
 owahH53I4EfL36xeRkJs03uocoSCHPgmmwZRUWtO0=; b=vyoZv+le/988MLD+iQ
 yMmGYOKNDwuLYbs46TWrymCIs2872OKfT5bj04Glu8sinUOVEL8Q3tcQDSyzEa3d
 Cp5EYB4GQDi3Qb1YKgSVTGo81SUJiAqy4PhR14k5WedOs6YjcTnpE9zCNmxyLvbD
 tWU7IDXHcSFTnK9XDXUvO+qwIc5UVFwJhE89hcQEykvjmC2OmQk9+XMT4nC2J1Ek
 SCmY2JQUstKAzfwvXwrDFu/3TvD/5MZs1Atv9dxiBxyDABOi3r4BiE/o9mcA0LzG
 MJHUhqvw0Sv5WRGB72cZuHT/DSqZpffb73kHU7doyfWcEhfCZGBEF7jO1Nx7n1w0
 dbmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274399; x=1657360799; bh=GZowahH53I4Ef
 L36xeRkJs03uocoSCHPgmmwZRUWtO0=; b=hgHDDpdcJZOGVlt28wQkcN2Id3FIF
 n4uxyRsWEDhFT0qIjl80sFMwjX8DWvuhFXGDnBbCNuEXA5KtKLTjJcsqLaSGi8jd
 zRzlWE3OC8aC7zQH/O3mxTq+O15sr4GMvSw9ncOrxLMKyn/MOzyBGCnOI9dMciqt
 3CHWzNACYRC2QfgD3XO7mNEqc8El2N2TdWPQ8J9X+AChokIf97YspuG5I7WrS0Ob
 4cyyrItlJ1TRbg8l4WqbFZ1Y3oN2uGdDFQ0uGEMti/afqbLe7/Dr8NJhHUeme+oF
 sTjuW6uTOG2m1T/s+XB7MH3ZGb8pVpMU7cwXS5leoEFVxopLQ/tP5XyjA==
X-ME-Sender: <xms:HgDIYiYDoGp0qnN2r2ymURGvLw_XfnpbZZdmdTKFuf90i0nP8u__JQ>
 <xme:HgDIYlaX80sJvyt48Ck44R9NBaJhsxX7QS3Q2EzOlZWEDWtK6Vq34R3d67GsJf8bD
 xqrZha55iX2GduiB78>
X-ME-Received: <xmr:HgDIYs8LVz81tR8dfqL19aqmI7B2xPdOPf09DTQtlJqY5hsubziK9WnTj56LuyeT2Em7tggBQH1l_cIGHryP5xRcKAYmznKYVn2JeMo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduheenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HgDIYkptY9YZBEtiRpky409yTk3EpFYAeBuxonbgGojkeOlbB1O_tg>
 <xmx:HgDIYtrIAcVF1fX6xGU2AYPcCaIiPKPpClC5fn7Yc5BYL5mzXx648g>
 <xmx:HgDIYiT9FDKP-tOdObP-wAusyfcM88mLtmMCMCr7Wyg3IRDFWmUDdw>
 <xmx:HwDIYunhi47GklmJXju-qWUdlzkR4Zqj_xIp3KnYRsSX4tKewF_U6Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:59:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 57/69] drm/vc4: vec: Remove call to
 drm_connector_unregister()
Date: Fri,  8 Jul 2022 11:56:55 +0200
Message-Id: <20220708095707.257937-58-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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

drm_connector_unregister() is only to be used for connectors that have been
registered through drm_connector_register() after drm_dev_register() has
been called. This is our case here so let's remove the call.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_vec.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index a051b25337c0..2e9dc09fc6f0 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -289,12 +289,6 @@ vc4_vec_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_unknown;
 }
 
-static void vc4_vec_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_connector_state *state = connector->state;
@@ -315,7 +309,7 @@ static int vc4_vec_connector_get_modes(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_vec_connector_funcs = {
 	.detect = vc4_vec_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_vec_connector_destroy,
+	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -559,7 +553,7 @@ static void vc4_vec_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_vec *vec = dev_get_drvdata(dev);
 
-	vc4_vec_connector_destroy(&vec->connector);
+	drm_connector_cleanup(&vec->connector);
 	drm_encoder_cleanup(&vec->encoder.base);
 	pm_runtime_disable(dev);
 }
-- 
2.36.1

