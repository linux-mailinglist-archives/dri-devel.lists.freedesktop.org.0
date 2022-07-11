Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8718A57091A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9CE90318;
	Mon, 11 Jul 2022 17:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFAF90312
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D66C25C015C;
 Mon, 11 Jul 2022 13:40:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Jul 2022 13:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561232; x=1657647632; bh=4u
 DgSdHpp+qURN8db9X4iLS+B4ku09Ksntp7OG8mbY4=; b=uElQofCtd38DOAYOqy
 SKbDVBTHH0xWT/siLg99arge3pgVjdxrLbS4tQP8J9ksmAwyivKZ6gRQ/8UGSkIB
 wAi3ciBsxOOmDrtWR0Hh0bySWlfsxzc6C5gIZNuoys52kTWh7/jk3p39ySAw7/j7
 41tCRDNmZYAYsU5gjOV4hyxcYkXoNWJ5NKZizJ8GmSawGl7+CigZYaGyolkVQwuM
 xo2hGeQouMohAXlUb90wc7Xxlg9RLdiSkMlQYqw5HS9VdHZRrqh1uxV6ouic3T0R
 OHU0DjlkRwy6TV0eRb96upbGopiftgwlRVvYLlhG1+7vI0TxyGB76u4oRGpKfrUj
 mDYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561232; x=1657647632; bh=4uDgSdHpp+qUR
 N8db9X4iLS+B4ku09Ksntp7OG8mbY4=; b=YTmRDlgXjFrD0NvnoGkFSHtUfzJ3x
 Pc7eDoNcfs5UoIFxKuI+BcSAhlhvOBM1tKqhLisIeFvfwyVw99niNQraiG29g2um
 92o2oy5xplb8xziM62EK0M2ryiywxJ/9oYd2uloz68Tb+n8pS2iKZ0u6B7m7Eux1
 aPN9tL0aBeDH/kck2URzzhaxRckntOZrh9mgG0PFPPf4MDMS60MShYLQd30GRPPh
 IVuvtVaU3Rp9T7qbwKt+lLnZbLms+FnHw3p1I9qqFqhzjP6RhJTX7zPB+rfvdydb
 XgX5huRHi3BaYnCvPq6M039z4UL3ps+3GCL3KeP20FhZVFN3fDYj3Bfhg==
X-ME-Sender: <xms:kGDMYurj24eYNNyKU_8HKLKE2g3yHz6umnVaFp68A34Xk36JVVcvQw>
 <xme:kGDMYspiErcUM5yvKACAJEymuHcXUycGaqyHKAG8A7sS4CbDx4H3WjFoMU6JsYwzo
 RshgJEyAsAGvcQXekc>
X-ME-Received: <xmr:kGDMYjPkLa1s19-xnmLgUEejK5uAk_4uH6BQ9dvLcMbX0Ece0URsWRGjjHhWiinF9-pI3LBjNSqzwcjhld3aIWNF3-i93n7jC0Ih9BY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kGDMYt5nd9Wl2A7WN-580xCu8OKsOHgzx2SokgQ8ZRqZMUQeNa4ytQ>
 <xmx:kGDMYt5xFKzXPhRasACTqYTRzoLQVPcFnajTZNlZs7ngUKY2o4bhcQ>
 <xmx:kGDMYtiLkKCb375vC7Ktb8oySTvAjTYzfrwP8tdkufT2WeN620NAtQ>
 <xmx:kGDMYrSyZiL0hCzwUU4rrXwW1jnGVX4N-vElRvgngOzE0NI2Og6FiA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:32 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 29/69] drm/vc4: dpi: Switch to DRM-managed encoder
 initialization
Date: Mon, 11 Jul 2022 19:38:59 +0200
Message-Id: <20220711173939.1132294-30-maxime@cerno.tech>
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

The current code will call drm_encoder_cleanup() when the device is
unbound. However, by then, there might still be some references held to
that encoder, including by the userspace that might still have the DRM
device open.

Let's switch to a DRM-managed initialization to clean up after ourselves
only once the DRM device has been last closed.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index c4ea99f85e5b..ceb14aea6c05 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -316,35 +316,28 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	if (ret)
 		return ret;
 
-	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
+	ret = drmm_encoder_init(drm, &dpi->encoder.base,
+				NULL,
+				DRM_MODE_ENCODER_DPI,
+				NULL);
+	if (ret)
+		return ret;
+
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
 
 	ret = vc4_dpi_init_bridge(dpi);
 	if (ret)
-		goto err_destroy_encoder;
+		return ret;
 
 	dev_set_drvdata(dev, dpi);
 
 	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
 
 	return 0;
-
-err_destroy_encoder:
-	drm_encoder_cleanup(&dpi->encoder.base);
-	return ret;
-}
-
-static void vc4_dpi_unbind(struct device *dev, struct device *master,
-			   void *data)
-{
-	struct vc4_dpi *dpi = dev_get_drvdata(dev);
-
-	drm_encoder_cleanup(&dpi->encoder.base);
 }
 
 static const struct component_ops vc4_dpi_ops = {
 	.bind   = vc4_dpi_bind,
-	.unbind = vc4_dpi_unbind,
 };
 
 static int vc4_dpi_dev_probe(struct platform_device *pdev)
-- 
2.36.1

