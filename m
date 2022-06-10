Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2A754623F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF4011B33E;
	Fri, 10 Jun 2022 09:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7B711B33E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 845F15C01AE;
 Fri, 10 Jun 2022 05:30:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853416; x=1654939816; bh=bX
 LbrGc39N/dtaJvM0KY8pDQlxbf6vuijpaa2TsR52k=; b=Qza80EpLHWlbN8ZR07
 nFI3T6Am5QfzSgrQP3O0cTIwoN8xqRUczue4a3C56jmE7jhLG+tkt7ugZc4FYtkv
 gFeNnhnlXaLMIP9cMKNF3ZkFc23wdDVC+UCRcJ4qOGzohhIhXmQ9xzbfrQ8NE7Xf
 p0DcvbZdZXke9r0iC+GUendvuaWbYBsnhTISrK7CRvegrdp4Yq4VIr5WoF1CAVtz
 KttTG3T1vE7ib5JWNNBSX7yNdkcx1LQeyCzuDCS+Yo3CrQ0x5vE6PS3++Lulgtmn
 3W+webffnLUL1Mnnvx824eVuMI+KKtLr7HgHb8RCvGF+zFzQ2jxXfytNnZUCLYfp
 F00Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853416; x=1654939816; bh=bXLbrGc39N/dt
 aJvM0KY8pDQlxbf6vuijpaa2TsR52k=; b=iThRpFh061FDpyG2faXhdybBaOSQx
 z/1pHbDE3O35hqcxbf763JlV+NAm33WHUYzfhEOUs7AQja2TrY0Z4Nn1FGXd/d69
 rmBTw8JXEJ59Ph9B+GdDebsE0KDji8Owr3ivBl/Lmw9Pon+8nI9bU8mlzlng8CsD
 MVnB/5XObH5K4JbiTod+dggvw6700UKPlHZ9YDhbG9z91zLU7GD+EUuCra82k9i/
 cupTvY3BebUzeLit1UBS8gKKPHgZwI4VwLYdqo0lvZ3Z315LCC3E0PA8lcv6qE0b
 iGhQAncBorAvaYLojfri42pmX1AaVzb//oz9YdVED3zpPWEQMWGHDYjIw==
X-ME-Sender: <xms:KA-jYtDAP2bYViTyLPGnUcgnptXK4sfFOTd9ovPcLRgf3z3iSC3yVw>
 <xme:KA-jYrgUFjjKndkv_0IH8iBhwnG9ybFBQFr1tHWecZH9104nXi9UG_NW7QQn78294
 bQno4cqIgeHxrb6QW0>
X-ME-Received: <xmr:KA-jYol6BFl8ydwCBvln9AwEoZ8GaMW8hPy0xk_TNrPcvqWQoGnxGUlwfKhLZZ7AwSJBL9iF7IJhEtRbHPL7ZnF57LZPZHaW-w9Ebp4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgieekvdevffekueejffdtjefgkeekjedvvedtjeekvdetleeigfeludej
 keffgeenucffohhmrghinhepsggrshgvrdguvghvnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KA-jYnyuLvbknfo4QZrgevncsP2OflttL2uCu6c5lRJeabb7HsZ4Ug>
 <xmx:KA-jYiR3N2G3mf_AK9sGkWs7kLhs6jNbIomE0pY17OVvCK0F7lyW1Q>
 <xmx:KA-jYqauvsfbzmrLgyAIYLvyNbAQEje4xv8cTKNPKiHsDEinbhhgAA>
 <xmx:KA-jYoMzZUuw0MJXi2U6Us9-prnQJEmE6PdpmoULt0MfomvmA-A4Kg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 27/64] drm/vc4: dpi: Switch to drmm_of_get_bridge
Date: Fri, 10 Jun 2022 11:28:47 +0200
Message-Id: <20220610092924.754942-28-maxime@cerno.tech>
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

The current code uses a device-managed function to retrieve the next bridge
downstream.

However, that means that it will be removed at unbind time, where the DRM
device is still very much live and might still have some applications that
still have it open.

Switch to a DRM-managed variant to clean everything up once the DRM device
has been last closed.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 8a50de2c40d9..9950761449cf 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -220,10 +220,11 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
  */
 static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
 {
+	struct drm_device *drm = dpi->encoder.base.dev;
 	struct device *dev = &dpi->pdev->dev;
 	struct drm_bridge *bridge;
 
-	bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
+	bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
 	if (IS_ERR(bridge)) {
 		/* If nothing was connected in the DT, that's not an
 		 * error.
-- 
2.36.1

