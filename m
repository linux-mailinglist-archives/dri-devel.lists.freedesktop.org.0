Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BEF54624F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F8111B356;
	Fri, 10 Jun 2022 09:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C3111B356
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 920745C01B5;
 Fri, 10 Jun 2022 05:30:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853432; x=1654939832; bh=t+
 kGHtBzCrg0i3dyFjBGIuGaZtypvdbhhWT33ScgPX0=; b=QJ3zbnNVRFgdb9Svm2
 Vcm8H5o9en1XymU0/nKmX+omfyuDE3oDp+KYi75YbT6nFvrBYRDmZVQojXLGWbKv
 z+iHv/VajjCBAPPQTqkpYh6o7cvF/BNZdIV7VMvCEt2OJUC6S52ue2R5Q8E4o3Ra
 ZqfEyZ7rJk59/7xRkhUnJP9SGGZuJFvZstLGz1zeyxoaLmwT7kvaXtaZ3G3B6kMf
 pq0dvgaRpdHqDwtkiAeOqptBRyDdVRC29ISgwMhUR5rksp7KmPxOT9G+QCa/L4Ck
 +W5IX31cwZKgOYu24yz023VxANZPz2w62TEjCHsPlsdEMH7Tg5+rEZARWdaAyS3x
 CJUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853432; x=1654939832; bh=t+kGHtBzCrg0i
 3dyFjBGIuGaZtypvdbhhWT33ScgPX0=; b=EzpxANZKvwyZHs0Oa2Al0UXzvy9nT
 dX1dBEcBDReZ+GWT5l4CRIpDiLjH0Z1w/T5BBO74Fyn6OkMcaOF3Kd+hOPz8BE8p
 tRRBkU6PCZDqiF8IKoWD3Uo7tTnL8Lfyhfd2gtlw788w3mqRDBwzIaiGq36BfC7c
 b11JeaqXxdqf63WLOClW0VulEqBwCZkCyURjjdthlbk4PsH0WjavUqo8LUFpwS+u
 gnu3/ylQqL6qjK8JUy9aop5EOa86eiGYkWz05f65beXGGl4yXIjCSLW+fNCuiZef
 sQVlLg/QE/d+C+tFe03vjjAeyQO06/WvVhU8hY7TF8ZDFrbkzGrWA6pmA==
X-ME-Sender: <xms:OA-jYrjjfTHertZF2unvp2JJca4NoMby-HoJOuvT8Idl2cB3PaP_VA>
 <xme:OA-jYoBhx_J50SsZSZ5xHhcKWwb38Qqcr5X4-8MTpNqGgMHpXunHtWGBJYSOZKKrK
 MRIQSrfWI0kO8UXoYo>
X-ME-Received: <xmr:OA-jYrHb3VneNOzoYY6y3DtdarOp4F73-_iGZLvDXwbFvCnW3ctnOYlS7BRGHIuxlvgkxZzdHb1qOojTK_VB-VoBZk1Brbi1Xc3DiKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:OA-jYoT85uApr0I-0xnmUatpQjgePn0IGQzMVAHX67Em7e1IdP62bg>
 <xmx:OA-jYozgK8cjzkiPs08_r0J_M5hI2CtigS8zQoLPrH4cCmwjVAwYow>
 <xmx:OA-jYu7_YiMT0MAPM5zPHcALy57eLrlCrtJ89ujqeuRn3FHBcvgsfQ>
 <xmx:OA-jYitMsRR-TxY2MIZfsetMqko90HEjsMO3c-nFzpqoqytsNLIITQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 36/64] drm/vc4: hdmi: Switch to DRM-managed connector
 initialization
Date: Fri, 10 Jun 2022 11:28:56 +0200
Message-Id: <20220610092924.754942-37-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_hdmi.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index e5b6e35f57f6..63d9a91f5038 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -255,12 +255,6 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_disconnected;
 }
 
-static void vc4_hdmi_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_unregister(connector);
-	drm_connector_cleanup(connector);
-}
-
 static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 {
 	struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
@@ -368,7 +362,6 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.detect = vc4_hdmi_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = vc4_hdmi_connector_destroy,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
@@ -386,10 +379,13 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	struct drm_encoder *encoder = &vc4_hdmi->encoder.base;
 	int ret;
 
-	drm_connector_init_with_ddc(dev, connector,
-				    &vc4_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    vc4_hdmi->ddc);
+	ret = drmm_connector_init_with_ddc(dev, connector,
+					   &vc4_hdmi_connector_funcs,
+					   DRM_MODE_CONNECTOR_HDMIA,
+					   vc4_hdmi->ddc);
+	if (ret)
+		return ret;
+
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/*
@@ -2933,7 +2929,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = vc4_hdmi_hotplug_init(vc4_hdmi);
 	if (ret)
-		goto err_destroy_conn;
+		goto err_put_runtime_pm;
 
 	ret = vc4_hdmi_cec_init(vc4_hdmi);
 	if (ret)
@@ -2955,8 +2951,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	vc4_hdmi_cec_exit(vc4_hdmi);
 err_free_hotplug:
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-err_destroy_conn:
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
@@ -2998,7 +2992,6 @@ static void vc4_hdmi_unbind(struct device *dev, struct device *master,
 	vc4_hdmi_audio_exit(vc4_hdmi);
 	vc4_hdmi_cec_exit(vc4_hdmi);
 	vc4_hdmi_hotplug_exit(vc4_hdmi);
-	vc4_hdmi_connector_destroy(&vc4_hdmi->connector);
 
 	pm_runtime_disable(dev);
 
-- 
2.36.1

