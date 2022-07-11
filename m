Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3B570914
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DD09031B;
	Mon, 11 Jul 2022 17:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277C690307
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:35 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 6FE9A5C015C;
 Mon, 11 Jul 2022 13:40:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561234; x=1657647634; bh=S4
 IwQwilp9MbI7mX6sunJejucqIp4Zp/8ywgQvIpGqE=; b=HrXlYRHYGqRtfKjG86
 G42pRHZ9Yy35cbBD36ouq1Vep74PDZFFr2rbVmQuD239cPAwwiEg5r7gWQtugCQZ
 seQCKzI0Lpp62DH83PHqIIah+wRFZG9UJgxkEG9b1R5SyJV01GoIor7WmMaA2IkP
 gwrcD07Ied4eOaJecvHltjQ9p8LKBQrrhT+mL8CiFf5ukXXbIjpOSoAA9RbgVpJJ
 zycdvekvW6viS/xiyUQ0FwYZlknREpKnAMg5Hx1w7oqaOlTKoyhBriO5/2t+YzWn
 lSVhXqI1OBKOi4HcokjLVav8ealbi+UHJyJ1Ug5yMZr1qQ5tORZkNeVcnIIY2Twm
 fa+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561234; x=1657647634; bh=S4IwQwilp9MbI
 7mX6sunJejucqIp4Zp/8ywgQvIpGqE=; b=sCDeboDXIJBTlRTKo8uGZfAK/SS/L
 hjts47HCBhTpvn3K7fvuLYT/E9dLrmF6eOvtpQ7VBA8LJe2YxL2/OyEJEOffaoko
 fPqJY5rXOl07gQ9WHfaFdQklQOPe8cVADnxodPthrH23Pl4/Lh1VAz6MDUE/K0Eb
 ojVK4twjYpTjy4Jphz/fzIUCuikjk6dPMJjmD/mToa8KPpPhrYpijHIeJ+iNDG4x
 GGOQDLKcjQHg9c35OBJ32bIyh0ftoEoAdTNIeIUBGTgHC7A3YYoXMVAMizRkFOkM
 6IfCrRn7ORFcGWp5XBV6XzyjLQRRTL6nlWCGpoNumYDXiY9O+KAZ/7veA==
X-ME-Sender: <xms:kmDMYlgdKeTo2USJXvAWBYGybhBxEHoe3Tl1Hrzs2T3yGj-NWn5bow>
 <xme:kmDMYqCq9LreLKcY0tOhsc8Y8mRDREJQiDAYfL0XQOz4iupuLftXYfGeq6Lw6ODpx
 3IShpNEN5kT5OChb1M>
X-ME-Received: <xmr:kmDMYlG-WG6grRUAorT_PG9ntcVXf4Ac_pYblCskGADQkx4ZDR-EkGxApMzdTbfK6FqOx8NbWdlPMH9YLhsletw9M6ALXLpC7bgPNuI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepgfeikedvveffkeeujefftdejgfekkeejvdevtdejkedvteeliefgledu
 jeekffegnecuffhomhgrihhnpegsrghsvgdruggvvhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kmDMYqQ6Vay1bPXtS3nQ357dT8ZLKNH3U0NKA5UgBNNJ75_Adrv7Mg>
 <xmx:kmDMYiwUbXZUVgIMP5tT4gTBajgKDgGBSJFFvY6p2ZrqiCRUkOPpsQ>
 <xmx:kmDMYg67B66cQib-Oizk0mB3QavY8vHa0XoesEfbUoKtJiI9MYHKnA>
 <xmx:kmDMYprqbOlipyhU7oxVmOLhhR4feG1DT3jgrWs9qJ6fEtT48oB1Ig>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 30/69] drm/vc4: dpi: Switch to drmm_of_get_bridge
Date: Mon, 11 Jul 2022 19:39:00 +0200
Message-Id: <20220711173939.1132294-31-maxime@cerno.tech>
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

The current code uses a device-managed function to retrieve the next bridge
downstream.

However, that means that it will be removed at unbind time, where the DRM
device is still very much live and might still have some applications that
still have it open.

Switch to a DRM-managed variant to clean everything up once the DRM device
has been last closed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index ceb14aea6c05..660feea0534d 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -240,10 +240,11 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
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

