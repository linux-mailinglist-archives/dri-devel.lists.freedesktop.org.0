Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6A860495A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 16:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0A910EAF4;
	Wed, 19 Oct 2022 14:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE0D710E4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 14:34:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7BCFA3200979;
 Wed, 19 Oct 2022 10:34:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 19 Oct 2022 10:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1666190086; x=1666276486; bh=Fhl6BQCPY0rkl0QoLfOepzSJz
 HiwIn6PlkcSdV+0qxw=; b=XUfOaF4t53K1XQEAyCydvaUuH4ogukwLrRiWQ/JZy
 tl4vDfSda4lnRCssqaodSvPgBEifpXRe1vPUOu+2hWa1IYz6qOTfeFhXJNUuvWCs
 7LvE95kN5068D6SRiMpNr4SawM/kBYsq3PQ8XS9LMmMg3v4ooTY9CbSmSkWVkbYR
 5uXSAuVPtQgJ8xEaOsVfDDGJv98PwJQQktt6y/aUjsNIO41ga3NuM0+HYOC86sQN
 R5QUiA2fSOdUxpCcTqgiTPuEoSiK0Y4GOHN93nvAzsC7EWXVUnIbJv0YQPHG4LhZ
 EVdBffwVJ8R4JY6b1IQiwDPR6eI8LlC/NqUP6BPuh9y8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1666190086; x=1666276486; bh=Fhl6BQCPY0rkl0QoLfOepzSJzHiwIn6Plkc
 SdV+0qxw=; b=ArIVRAPK77Xf17MZWmVFgvCKw/Her1T+e6nm3nY+4klqcdcCUuy
 IUFzoFVEauDb2C5FdkvbiPY8Emwzrmne1Dz8etM1uMBO1ePakI7avLNjAFsjHxgQ
 Gi/kEMzfwq6invYFbWyxum2SwE2SpbpXN5rM98PXJmjvlcj9ksSMODWQOGj6qoin
 7F0huPd3cLWA6Atk7LqK3Ue4sgH6FvZwFywLay89fsqXuh9eAn0e3mq3kzVAhO5u
 ARcTmdCyqhcbewIXjU6sWs2qJJIA8pIU/rDmFutN87c18BiOb7oSBVrcDVTbK5WD
 3A4x0I8XicWMNGDSfX+l4D9Stvh0QBQhRUA==
X-ME-Sender: <xms:BQtQY0k09Xwic3s8ciCuOpYLaujFeNwwuqkmArKWYRicfxqAMgomYQ>
 <xme:BQtQYz31okpUyvq1zNcyvVNNDraeqspeFwpsPgJHdoE3cx_cRs25ZOHrWhU3KV-k3
 2Ixuone1j79ufQ3Us4>
X-ME-Received: <xmr:BQtQYyqRUyFwRlBn1qkUkDENnW2t0OGYH84PD62bXc3AeYpFuNHTuzN1ZDa8qnPOHHorL2riRPnLY3NlCzV_GW799qKHe56ydhpi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeektedujeeijeefhfejuedtudegtdejffffvdettdeigeekffeileelgeevgfdv
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BQtQYwn3m8j1fbKgEnPkI9b-Zm7Q8-5AMWvecBZeJizAb-7gLvkC1A>
 <xmx:BQtQYy0J6lB3jhOJr_25UyWpFCsiaJehkNOeDlukcklIQxKPiqczBw>
 <xmx:BQtQY3vyRrQrWAO0B8BWWmN0m4-Q7AtlTuoj6s0S6DGweTTUdNyexw>
 <xmx:BgtQY7tASfh0w4BPh3XIArw2sVfGexDZFGIQFJQzct-kpVcIXStHMw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Oct 2022 10:34:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/connector: Set DDC pointer in drmm_connector_init
Date: Wed, 19 Oct 2022 16:34:42 +0200
Message-Id: <20221019143442.1798964-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.3
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

Commit 35a3b82f1bdd ("drm/connector: Introduce drmm_connector_init")
introduced the function drmm_connector_init() with a parameter for an
optional ddc pointer to the i2c controller used to access the DDC bus.

However, the underlying call to __drm_connector_init() was always
setting it to NULL instead of passing the ddc argument around.

This resulted in unexpected null pointer dereference on platforms
expecting to get a DDC controller.

Fixes: 35a3b82f1bdd ("drm/connector: Introduce drmm_connector_init")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3142c8142b3..61c29ce74b03 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -435,7 +435,7 @@ int drmm_connector_init(struct drm_device *dev,
 	if (drm_WARN_ON(dev, funcs && funcs->destroy))
 		return -EINVAL;
 
-	ret = __drm_connector_init(dev, connector, funcs, connector_type, NULL);
+	ret = __drm_connector_init(dev, connector, funcs, connector_type, ddc);
 	if (ret)
 		return ret;
 
-- 
2.37.3

