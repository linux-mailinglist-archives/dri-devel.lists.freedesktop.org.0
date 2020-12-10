Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135C52D5E84
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6729E6EACF;
	Thu, 10 Dec 2020 14:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D226F6E8B3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:23:37 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id D8F3B455;
 Thu, 10 Dec 2020 09:23:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 09:23:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=83kZ4pXmfvMiM
 WnGP2rS7tH+UOZXtIm2wa0gfyJc2hM=; b=Um7y9w5Rc+lt5tykjQvy4astu4Pg3
 JSax+CzDmCrNbMROn4r0/wkuicoobXfV3uS7CXU5EhnGmvie3hopOXVQv8qOb3xi
 Z0u/t677neCGs3q0dOIZOh+TcPU1hTVZI0QrOnPinVjoUrcSv5iYDQltV6tdsAfs
 G/oVtwSXN0SZtYbQVD1JBxmc5GfIS6psqpcmKBMX/oQDwMEuj+eim7UNJx7fkpph
 XqkYyC289lXgT7B9lkSfXKBLkXphdrPO5DBvcWLx5Wq7QGsQ6zJ7w8FHQoJ5YQpb
 HXPJwdliC1gKGoVO5p5YF4lYvq5C86E4sa1VLwK5poMz4z9iKHanFgG1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=83kZ4pXmfvMiMWnGP2rS7tH+UOZXtIm2wa0gfyJc2hM=; b=e1sV9EFj
 /b8ZxYWtR3OpsLn5eFBu5KapvDN98ONSh7idmnokFMNS5mzu1ZefAOnnzb1SH1dy
 J7uy0xWsBsF9G8Ok+vSxoQIbQhIHDEzrENJPgFMI4UXTeAQCjSxoAbI69yXKe08e
 FrGKVAKvq/+bdvXTvvHkQZbGZY69Tv8gPZ4vYvx0H0bwK6nbw6/gvn8zloRc1MlZ
 lsX5zMwUmASoDKPxV4aCaWFvBva+x5P5bA36wgZvdaYXZ2M33KnhFEB4PKNjOUCc
 5mu33wZutdmZLduWEY1HkcEuPKyOKycu2U/0ArG3qFacnf/Qbbd2PwyTOrzmIlNN
 IO5U07vhl1bxRw==
X-ME-Sender: <xms:aC_SX58gqgYKI9WFOfivcpIpdN1KHFrGjkw_aHfEcVe-sup05LRkhw>
 <xme:aC_SX9vZSOxD7ath9jH5Wcu2S27cPzU0hMgVL5qdX9a_BjFPSXgzwt0_gNbVZlrGj
 4n3YWfmYlDU4DYZ01o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aC_SX3DcA8ZNNC2D0iTbuhuVWN7EDuGqnwYik68LDnUstYKROBMq6Q>
 <xmx:aC_SX9fn1GPk9NahnIJCa8DITU4R8zigqr83CU1p7ZzYA3auufBBbQ>
 <xmx:aC_SX-OkaTKk_fX_TpZtOj4RaXgCOQuowzhHfu4frh009PnqVo2Azg>
 <xmx:aC_SX_jAImm4eX4NwvwDw2ZZSUXvHQbdBvKusS90RufVk3H29KG6tArDZOY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F36B3240057;
 Thu, 10 Dec 2020 09:23:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v6 4/9] drm/vc4: hdmi: Don't access the connector state in
 reset if kmalloc fails
Date: Thu, 10 Dec 2020 15:23:24 +0100
Message-Id: <20201210142329.10640-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210142329.10640-1-maxime@cerno.tech>
References: <20201210142329.10640-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_atomic_helper_connector_reset uses kmalloc which, from an API
standpoint, can fail, and thus setting connector->state to NULL.
However, our reset hook then calls drm_atomic_helper_connector_tv_reset
that will access connector->state without checking if it's a valid
pointer or not.

Make sure we don't end up accessing a NULL pointer.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a88aa20beeb6..61039cc89d9d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -171,7 +171,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
 static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 {
 	drm_atomic_helper_connector_reset(connector);
-	drm_atomic_helper_connector_tv_reset(connector);
+
+	if (connector->state)
+		drm_atomic_helper_connector_tv_reset(connector);
 }
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
