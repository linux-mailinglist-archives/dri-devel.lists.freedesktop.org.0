Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23615570925
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0BE90324;
	Mon, 11 Jul 2022 17:40:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13D890307
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 26FDF5C015A;
 Mon, 11 Jul 2022 13:40:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561231; x=1657647631; bh=pJ
 crKCoG7IhNWP+w2dHjwD9Iin4zKcCM6h6ityddm2A=; b=In3psbRho+ROSBT5zR
 O9U59G0FD2Zv/yCOrKyhSyEUVanXglj4ll597QVDhh7IOKNIp7g9wvZwv6/gL3JM
 qx7u19IWWmVyQPCc6p7W5PeCAbmTQHd+hZb9miERIZ3qIAIeDIFSbDPsOIcp0dqR
 eMy1cQKcidZHNUxJsY9Vd6NFstrKSpat594/ITSfUUvSeP0O1+KCd7JCXMiW36ik
 CrHjhaPEWvvyp5kM6Q+5wcf7Y259GuNBZz8dRb39z4BRcR+VswyKBvW1lX2LSdcd
 f3YKNwcWHySIXvsvZPAgHqsS8PY7FL/MFQf3bDtyLLKmvsUZXuKy8agdCIiIizjm
 bx7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561231; x=1657647631; bh=pJcrKCoG7IhNW
 P+w2dHjwD9Iin4zKcCM6h6ityddm2A=; b=uZgfKm8nk+Wz/eOrAVeubM7Sa7uPC
 H/NCYhtiT20DkXwllBxfdfnsMfBsbut5g9N2WWrhHDCZq29TztbVs+3N/HDRoWvB
 C7zPp855W9+TSqbfIuq7wez6rnN32/CkcjLRTpcZ2PuQnsflU5GmyS6hwNQVUwo3
 gbEjwv2k2NbN2JMnEHHi5++dZnEU6qeg6EoLc3+er674BEmKsflgwsZMAMpyK40y
 mbAuuvsY1LEtIgwjHOxfeqZAoQcJJnOGAJhBQ945sNmCawfYj/N7zF4+qG/wF//Z
 uSTSB0uhHE92DL3ZfAyyr8114f0WenWxkAGcbxD/d4QRyI5sEAWYPf7Qw==
X-ME-Sender: <xms:j2DMYql_Pv-UUbFcciVTux5GMKHDUjev4OQSOudmzHnYtuwkilwu8Q>
 <xme:j2DMYh1NEFozb7TAJat7rFE3QIJ-LsVWONIfoeJOqToFLxWSBhHDtZetoU_C_p21g
 kerGDocfFMOPZJSgxo>
X-ME-Received: <xmr:j2DMYoo7VTKZh5MHZODbOQCWI_H9E88QQbLOoPtqe1yS7cvVyw8Kj6dVZcNKhXzM20xhMnmN8fFwjPFWGzBQVwjw9WXqZG5EnMxeVbE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:j2DMYunB49V82rTxhAE34PFxAlsAIctb4Z0Lor1EUZnIPgsFJkJ9Ig>
 <xmx:j2DMYo2qQL9h7C0cRlDNEweZWpKSCVJwfWiWs4pU86LluKoP84K1Qw>
 <xmx:j2DMYlvopYgaoi63mm-eEaWn9Am35z1YeeUiiJ47-lylIdN-F0phig>
 <xmx:j2DMYs_etFpGwv5aO80Y8WfuU5jyYhQwGr6Eh7eL21xcFSgTAeAKXQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 28/69] drm/vc4: dpi: Add action to disable the clock
Date: Mon, 11 Jul 2022 19:38:58 +0200
Message-Id: <20220711173939.1132294-29-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DPI controller has two clocks called core and pixel, the core clock
being enabled at bind time.

Adding a device-managed action will make the error path easier, so let's
create one to disable it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index f18b05cee8bc..c4ea99f85e5b 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -257,6 +257,13 @@ static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 	return drm_bridge_attach(&dpi->encoder.base, bridge, NULL, 0);
 }
 
+static void vc4_dpi_disable_clock(void *ptr)
+{
+	struct vc4_dpi *dpi = ptr;
+
+	clk_disable_unprepare(dpi->core_clock);
+}
+
 static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -305,6 +312,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(dev, vc4_dpi_disable_clock, dpi);
+	if (ret)
+		return ret;
+
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
@@ -320,7 +331,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 err_destroy_encoder:
 	drm_encoder_cleanup(&dpi->encoder.base);
-	clk_disable_unprepare(dpi->core_clock);
 	return ret;
 }
 
@@ -330,8 +340,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
 	drm_encoder_cleanup(&dpi->encoder.base);
-
-	clk_disable_unprepare(dpi->core_clock);
 }
 
 static const struct component_ops vc4_dpi_ops = {
-- 
2.36.1

