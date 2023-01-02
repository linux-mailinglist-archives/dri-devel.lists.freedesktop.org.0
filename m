Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D835065B1B1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 13:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45BD10E344;
	Mon,  2 Jan 2023 12:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DAD10E344
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 12:01:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D003B580C7A;
 Mon,  2 Jan 2023 07:01:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 02 Jan 2023 07:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1672660886; x=1672668086; bh=uEKmG+6dNXPgUJX+bG2DQMjEj
 SeELmo5mzB+Sfe2Ijs=; b=aH9ptOHGgwDqNDOWzPlQI3GzhncviGWnhB09eGkVA
 7mQUfbSPn/AgZHfrWwiUPvTpsTIdLGh7WgOawj82EqHKG8Z5MhtcMWJ+wN1agZYP
 zQQiiVc/GKEUsVzkmIQTDb9pQVLS7WswWksVXflggl8tke2SLrK0VrSlWuKXB1YM
 yYDMSMzNeSeUqAAWFFrsICZj4qtvb7N2XBhAPMvj1ZpXNw2n08gcGUt7JbaEIw6H
 DtaDpzyDj55jJeloo1SsNlzm3VqGRuEZrp7TVn1+RnpMI4jZhLoP1CmIcMt+mSJd
 ZSCkFrt+JAoQ9Scv60yRo15WIjFi6ME2vNk6cT1DJAeCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1672660886; x=1672668086; bh=uEKmG+6dNXPgUJX+bG2DQMjEjSeELmo5mzB
 +Sfe2Ijs=; b=Ey02JA7ym7ZhluUrnVsLJphnMC8hixoTHKKZUZ0Lrr8kwKBe+6e
 uj2GUVQ0sIpPXGdlapXhku1KWfA3KtwfqK32k2TxKacrPkdWVwi7eVgKmJjY5uPi
 /Gt8FcsxjZrvvngbKW8FeXuiWEHLgcJHIikbvs4qT5toj0BpfmATbzCYb/KpNlLN
 VM8rm/z+AbAUpgihxy36NeMO1/phtAutMuB9mhh4ISKMXkulfMe4WSHHJRRej0vJ
 7zkWQ0skeEHk6FkWIfFbsy9vEuT/aXFOdmiJwL6qLyMO6pD416QOwTJIXZzlPHXw
 VWFAMNH/8ioMcd9MXnDLJ0JpvearWFY7C5A==
X-ME-Sender: <xms:lseyY86NN9i2I1_iZ-XjPX-IeZOGwGziQ1vNq0tdCsfmmvWkFiqQBw>
 <xme:lseyY96Q7J5nxwVH7at4wKEGDLPvoFk4k92Opmea9cLsgs2StablExVC3TRVD4rw8
 5_9Bi6dNLfQIbmSwlY>
X-ME-Received: <xmr:lseyY7d66TwjBIc8_5YtEs__gsNONU7t3HqjMVAwB6f2mfIXEI3FrDoEChgEPrESvJNrNUzH0xvj17Lfl33TwHxNQlMInVFhdW4XrrId2K78gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepkeetudejieejfefhjeeutddugedtjeffffdvtedtieegkeffieelleegvefgvddv
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lseyYxIWQctBa9k2a8OMryC5KcCxx7eocESvaG5Qg6fJqc_st63iEA>
 <xmx:lseyYwJWZjVaoUeu0bl0Bex5KLk4xvmoYektkFxJQ2a3mns-o2ZI4Q>
 <xmx:lseyYywHlzSSqyn9Zt3Y5ngQ6fj3P1odVYZaW8pFR8YicN7mitrc1Q>
 <xmx:lseyY21ZudLiaqI3eGeEjRicZ5UFwTEchMFZqQ-lP3RQEG3o3EeBCQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jan 2023 07:01:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/bridge: panel: Prevent ERR_PTR Dereference
Date: Mon,  2 Jan 2023 13:01:23 +0100
Message-Id: <20230102120123.19062-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
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
Cc: Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to
drm_panel") introduced an access to the bridge pointer in the
devm_drm_panel_bridge_add_typed() function.

However, due to the unusual ERR_PTR check when getting that pointer, the
pointer access is done even though the pointer might be an error
pointer.

Rework the function for a more traditional design that will return
immediately if it gets an ERR_PTR so that we never access the pointer in
that case.

Fixes: 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/bridge/panel.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 1708098fba6d..e8aae3cdc73d 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -357,15 +357,16 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	bridge = drm_panel_bridge_add_typed(panel, connector_type);
-	if (!IS_ERR(bridge)) {
-		*ptr = bridge;
-		devres_add(dev, ptr);
-	} else {
+	if (IS_ERR(bridge)) {
 		devres_free(ptr);
+		return bridge;
 	}
 
 	bridge->pre_enable_prev_first = panel->prepare_prev_first;
 
+	*ptr = bridge;
+	devres_add(dev, ptr);
+
 	return bridge;
 }
 EXPORT_SYMBOL(devm_drm_panel_bridge_add_typed);
-- 
2.38.1

