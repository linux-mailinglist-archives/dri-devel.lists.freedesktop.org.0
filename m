Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC033D8F21
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D63D6E9E6;
	Wed, 28 Jul 2021 13:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1676E9E6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 13:32:38 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EBDE3580B89;
 Wed, 28 Jul 2021 09:32:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 28 Jul 2021 09:32:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=s1/AGqxR15g+h
 Pk2op+DrdT6xO3KSQkr55JaRssrGcY=; b=S4RIe9lWYsv7BQi3qSJKjL6zckLrC
 C4hClnsa4/3gIWlspEhNzsJWdS1RQaH8kpbnCWyHWzZ3LkrxEn1NVrTClsRDlXsh
 0iEXtA+iNeYvSxkPrnA/L3rcBcj4OMrhS7fuF7INwMN/F458sVbARP7qdqNnzubN
 jOGhJ2EIGWHqTn6bgLPwyFPQoku4hJBLvJmB0yiySd70hkOibchWVXsalwG7g8bs
 b7/+NaVMuW9R+4/t8IodPDBBuM/qUCg4ReYYRoTCrEM7ZDQVq9euiOFvlibwZHWN
 lVZy29fZwYH9YboGV5fb8pmXPUrILk0ThP+NTJx2iycBRNZn682v6qCew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=s1/AGqxR15g+hPk2op+DrdT6xO3KSQkr55JaRssrGcY=; b=fiy/ciDZ
 olclcVZJcc3IRh1EsV32IMWz9JEByU+/bVx3fMw8ercbvRD1OH+lfW8PzyPUE6AS
 OV7wuS4J2tcbSnto4iL6ZzNnwF56xZFFWZFZOu5pbvcy3FpflIf5NcuM/MJ6wAQ6
 wkjxzHH2dGHbw4Mh0uMM6cs2gveTDrFjcn+oSYp9yh2bld4P7wnaLKiUqUiOqvm2
 Nyo5XDu6rUIt4WlJ6v/3s1vGRYxeKIAFxGtGJIZcoJIpgCGRlABQCbYhGFP1u+1N
 HGjzLrQkphL2ezzs6W0M8stKB16T/Rjq+eDmgUGa9rnPDyDb/B7nsPLcfnArMHa8
 YV5JH03ynGmLiQ==
X-ME-Sender: <xms:dFwBYV6Sqj33n3hQkN4j2WnrOgdFLzEiXfPqkAq9qZKsxagi8F2siQ>
 <xme:dFwBYS7ivju8jldBSCLgPUmyk0GH7VtthhYamvEQshUEwvojRCYyocho4-dhxbc0-
 T0jhTLU6t-ut51axHk>
X-ME-Received: <xmr:dFwBYcf5Q01bbqNqifxTsipT6MqrqFqTvmAWCzPX6uszolA-VUhj2MEZXj7U0jkBZxtTNLs7fk5__NmpvWZXufS9dx8GI7T_34uB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dFwBYeKPsRLk3ITgC738ftdaPkhpsCHti58S5flGY-VdW7S4p6vM3A>
 <xmx:dFwBYZITe1ln2jvZGupnB7Tk8CK3xqabMOli_JONyjX_-wyU6IkqSQ>
 <xmx:dFwBYXwde9TwpN9DIZlDSqysNaj_Zx-x3frz1cGdxGZVpk69vD57vw>
 <xmx:dVwBYQawi1fvW2iEuO2bn1syK7fhyF62WCFX2QsoTkG0x0hFnsNAog>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 09:32:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v2 1/8] Revert "drm/vc4: dsi: Only register our component once
 a DSI device is attached"
Date: Wed, 28 Jul 2021 15:32:22 +0200
Message-Id: <20210728133229.2247965-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728133229.2247965-1-maxime@cerno.tech>
References: <20210728133229.2247965-1-maxime@cerno.tech>
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

This reverts commit 7213246a803f9b8da0677adb9ae06a3d8b806d02.

The commit 7213246a803f ("drm/vc4: dsi: Only register our component once
a DSI device is attached") aimed at preventing an endless probe loop
between the DSI host driver and its panel/bridge where both would wait
for each other to probe.

The solution implemented in that commit however relies on the fact that
MIPI-DSI device will either be a MIPI-DSI device, or would call
mipi_dsi_device_register_full() at probe time.

This assumption isn't true for bridges though where most drivers will do
so in the bridge attach hook. However, the drm_bridge_attach is usually
called in the DSI host bind hook, and thus we never get this far,
resulting in a DSI bridge that will never have its attach run, and the
DSI host that will never be bound, effectively creating the same
situation we were trying to avoid for panels.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index a55256ed0955..6dfcbd9e234e 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -1257,12 +1257,10 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 	return ret;
 }
 
-static const struct component_ops vc4_dsi_ops;
 static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 			       struct mipi_dsi_device *device)
 {
 	struct vc4_dsi *dsi = host_to_dsi(host);
-	int ret;
 
 	dsi->lanes = device->lanes;
 	dsi->channel = device->channel;
@@ -1297,12 +1295,6 @@ static int vc4_dsi_host_attach(struct mipi_dsi_host *host,
 		return 0;
 	}
 
-	ret = component_add(&dsi->pdev->dev, &vc4_dsi_ops);
-	if (ret) {
-		mipi_dsi_host_unregister(&dsi->dsi_host);
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -1689,6 +1681,7 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vc4_dsi *dsi;
+	int ret;
 
 	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
 	if (!dsi)
@@ -1696,10 +1689,26 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dsi);
 
 	dsi->pdev = pdev;
+
+	/* Note, the initialization sequence for DSI and panels is
+	 * tricky.  The component bind above won't get past its
+	 * -EPROBE_DEFER until the panel/bridge probes.  The
+	 * panel/bridge will return -EPROBE_DEFER until it has a
+	 * mipi_dsi_host to register its device to.  So, we register
+	 * the host during pdev probe time, so vc4 as a whole can then
+	 * -EPROBE_DEFER its component bind process until the panel
+	 * successfully attaches.
+	 */
 	dsi->dsi_host.ops = &vc4_dsi_host_ops;
 	dsi->dsi_host.dev = dev;
 	mipi_dsi_host_register(&dsi->dsi_host);
 
+	ret = component_add(&pdev->dev, &vc4_dsi_ops);
+	if (ret) {
+		mipi_dsi_host_unregister(&dsi->dsi_host);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.31.1

