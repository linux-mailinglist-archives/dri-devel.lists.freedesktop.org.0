Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F03570949
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC5190395;
	Mon, 11 Jul 2022 17:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F14F9032F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DD46D5C006F;
 Mon, 11 Jul 2022 13:41:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561300; x=1657647700; bh=QH
 om9BUGqjHVBhElvC9X+JqBwtmWJEf573Bn6c7tmls=; b=QTM6+ZpBnVAuKVEK5t
 wLxUT+27Pxsd17wGQycDzZWUVxxbIRJ2tNsPhXlnY3dmlcf5oISMvqnWZQwUFHIl
 cGKoyViABBZfFnQ0Wms45GLAwcEzvoMUibsnROfzu7BJ210EyOt7vaNPoyA5Rk+t
 Qpm2JtvNn2dJnB7c4ETkjno/swLuhLrmfFkhKjtXC+ewdW9FDj1oYQABa9EerTFF
 fC2IVQ4y+/QVHoHmnjxux/OEtLyTPH8WztQ9PwKMuEqOx9abQZGV8NOQlWkLclUB
 SRVt2ZJim8o+x9fhnLnY22taMppBEu89tOQz+9afaVFSg5urFc6sNIK8VqS40XDk
 3mXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561300; x=1657647700; bh=QHom9BUGqjHVB
 hElvC9X+JqBwtmWJEf573Bn6c7tmls=; b=BUFObpgLEKxB8m3BzeEFN/0Wg0tYL
 ws3VoUBI9onbslWLHJnK2rZvWH11bVNTGqAnHHtag7NPdYEe+1lOoA52IVgQRckw
 XPvOFTDFkOIu+mE3rO3NyIihRCcUP4IPRoueLg6e16hV7pccfGYptF1WOYuGtCeM
 DF2fu1tNVd6WKI+jwBaJzDNH7Cplw4WwJw+igwPkxvv/ab1Ted72s9w9R+4Zp453
 Vq/+gjz8Ow1KprUNAxJUT6uImg4LI2iIH6LrEBqu2zVEIBLC1aWUt3aFfsz3PnBw
 svvz9vfpKOy0eAX/E4KwwAQn69C7PuSO6HreE3W6DV2IF4sHmW++3Dokg==
X-ME-Sender: <xms:1GDMYn-A7h5ymu56kjfp8JSalSmR_kxi9TEytG2U-yaNo1hAcs_pCg>
 <xme:1GDMYjvsCFIlAgGfI_MmbejDhlO1NfkTFXxsCixipvxIkKUYncmxV77q5FrD9QjMZ
 OY-msHF6cSEKVQpO2A>
X-ME-Received: <xmr:1GDMYlDvzdmMmtiG5QzBvHK01elZ6w5UHRDTibAuhvqe7-ZLLG-vNOmo6BPGIR1OogjZdnc2Lj-O3oaysn_LwyyQUN6c6clVWHSYzmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1GDMYjcxVATP1KByL8L5xXIBozuvlmn_7hva1FPOwzl6zpyWbYTNew>
 <xmx:1GDMYsMiCMnuz4J5pHkuM8W4FRsHktAuzAvBDjl-YhLRZLzyreYa2Q>
 <xmx:1GDMYlmbXI7bLuVlt1QYyc4xO5OzA0hD0mxuwRoujb5vBxuKSDAilg>
 <xmx:1GDMYpo9XrQqu_XLOhKvAPh7TMg9f4RIK5IamVsV2jY4JFn-zlG9Bw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 69/69] drm/vc4: v3d: Switch to devm_pm_runtime_enable
Date: Mon, 11 Jul 2022 19:39:39 +0200
Message-Id: <20220711173939.1132294-70-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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

devm_pm_runtime_enable() simplifies the driver a bit since it will call
pm_runtime_disable() automatically through a device-managed action.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index d82c86865079..40f04157ea39 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -468,11 +468,13 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	vc4->irq = ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
-		goto err_disable_runtime_pm;
+		return ret;
 
 	if (V3D_READ(V3D_IDENT0) != V3D_EXPECTED_IDENT0) {
 		DRM_ERROR("V3D_IDENT0 read 0x%08x instead of 0x%08x\n",
@@ -501,9 +503,6 @@ static int vc4_v3d_bind(struct device *dev, struct device *master, void *data)
 err_put_runtime_pm:
 	pm_runtime_put(dev);
 
-err_disable_runtime_pm:
-	pm_runtime_disable(dev);
-
 	return ret;
 }
 
@@ -513,8 +512,6 @@ static void vc4_v3d_unbind(struct device *dev, struct device *master,
 	struct drm_device *drm = dev_get_drvdata(master);
 	struct vc4_dev *vc4 = to_vc4_dev(drm);
 
-	pm_runtime_disable(dev);
-
 	vc4_irq_uninstall(drm);
 
 	/* Disable the binner's overflow memory address, so the next
-- 
2.36.1

