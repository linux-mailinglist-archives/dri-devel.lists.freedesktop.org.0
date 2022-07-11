Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFCB570924
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D9C90336;
	Mon, 11 Jul 2022 17:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8950590303
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E3FDE5C0162;
 Mon, 11 Jul 2022 13:40:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 11 Jul 2022 13:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561222; x=1657647622; bh=Ld
 OHFOaSSYGiIKd3eFqRjSY6sOpsnClpy7sQKTPslFM=; b=LoTXvPMWW43FAN75pM
 Rs4KkZkL2h1HuhEIhzbTcEBGKm5uu2PLpxB68RJQYUBv3El3ikQ/O1QVaXh0PBtZ
 6XrK6mcXh9hKfxW0BzPuYkP0ZFyCacTb2haLlPlYhkq9HXXtSghQr43bcsk8cf1h
 62QDYr8/b+UClRZUrLDArtAKXUsCK6gq4HSDrr3+uz6A7HVVLp5J7syaPMdBWlQL
 86JeJFwfdymICradNtNvpnQNTju9tfN1dU30QiQVMPbC0FpQZxiAf4oR6TUfNlcV
 DLi7hOXR6O6rZczAef4r1/COTGHmLUENH78c6cHijL2HSMNr0PlvW7yElQHTDwdT
 fmbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561222; x=1657647622; bh=LdOHFOaSSYGiI
 Kd3eFqRjSY6sOpsnClpy7sQKTPslFM=; b=YVduoaG0QAo8lWckjzoUqlp26zu8s
 ojaEZMNPpVFcyEnswKcNEYkxWy5lXEHcMvbe9FAupqsYqUzsXlcy5Hk6nL3XZQrI
 b6FvhUVss3XBcIMi6W7aSFO6gIGGpHZDDl9yN3dpf921pP4EG2h/urEi2kUfEAdT
 XegHZSqjBHvuN1XBzHZ5FS2jrk7hktn00pUpsGiN1bP6Vr2zIBjZBWlYz6fKpp0s
 eq5RniLw0zOAUsXeHlFnKCkA1TPvWtHAtqBM8eM3KYNLl9HlTXFuSxXO6nnIvdEz
 2M/7cLKbXmjb4Ur9Gs0NeLQBoEcNXLoG3lCmPlNX/hYn6XxQ+Ozn/67Ug==
X-ME-Sender: <xms:hmDMYhslpMayasva6j2cm8ygMyWkOrgdwg97DKA475bGI50Lj8o8eA>
 <xme:hmDMYqcqFPQO5t6RzxgWUJwxbbfi3GJwEA2ZNyMd_NjDjORdcNJzmK7avXbspEUvw
 qOfMZJRHfjjoQoRsgU>
X-ME-Received: <xmr:hmDMYkyLPCY_XTIyW7DtCddxs2DD4jlZD3cgYkV8YZDC0ZNy6j9ROlFrG9PZoWYTqGwvZ9ZuZCSJPOMeJAEUjbRnwA05k_qwsOifwaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepjeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hmDMYoMD4UMBimpa0mwvNhmQIioUYihcLQ2qIKvluBGsjx-G7xeU_g>
 <xmx:hmDMYh_1_SKbvC46Oh33axSgMGQhokNffhujH58apH-vvlhotClbRw>
 <xmx:hmDMYoXU1WsEUSICJM-k4NCg9fRXNggFTCXJAmnccOIqkVDpkenp2Q>
 <xmx:hmDMYkmNKzdHdNNNNPes-Qpw-v8oUewivZvquA2fo3LLi3TdUH7c1Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 23/69] drm/vc4: dpi: Remove vc4_dev dpi pointer
Date: Mon, 11 Jul 2022 19:38:53 +0200
Message-Id: <20220711173939.1132294-24-maxime@cerno.tech>
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

There's no user for that pointer so let's just get rid of it.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 7 -------
 drivers/gpu/drm/vc4/vc4_drv.h | 1 -
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index ef5e3921062c..d3625dcb5dcb 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -269,7 +269,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dpi *dpi;
 	struct vc4_dpi_encoder *vc4_dpi_encoder;
 	int ret;
@@ -328,8 +327,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 
 	dev_set_drvdata(dev, dpi);
 
-	vc4->dpi = dpi;
-
 	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
 
 	return 0;
@@ -343,8 +340,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 static void vc4_dpi_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
-	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
 	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
@@ -352,8 +347,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 	drm_encoder_cleanup(dpi->encoder);
 
 	clk_disable_unprepare(dpi->core_clock);
-
-	vc4->dpi = NULL;
 }
 
 static const struct component_ops vc4_dpi_ops = {
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 116e54fc1363..835d286c2802 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -84,7 +84,6 @@ struct vc4_dev {
 
 	struct vc4_hvs *hvs;
 	struct vc4_v3d *v3d;
-	struct vc4_dpi *dpi;
 	struct vc4_vec *vec;
 	struct vc4_txp *txp;
 
-- 
2.36.1

