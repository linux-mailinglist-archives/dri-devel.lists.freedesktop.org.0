Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B485570927
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:41:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD4C90338;
	Mon, 11 Jul 2022 17:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94F690304
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 37A285C015E;
 Mon, 11 Jul 2022 13:40:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 13:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561226; x=1657647626; bh=nz
 0MhVMKddGTgYw4FqcQbDjuapCCCmkgrWxIJwpCfuM=; b=xZ9Bfl5V6k9T49NU0O
 vrmlFa1E4yVfOkT6e2THOWLvzRxmIeKg4fu/F5rlor5PDWjC4KNV6WPlGVvabPno
 5abJrrS4UuBDcM0GBUYoMjBCng5RiXS4cJEq3NbagszUftv8BaR39Hc4tefFqg/5
 znQ5mZ16/E7NJUWx43UQjBVAJraRrOM+8KKh9vDGzj6ceJ/ztkTP9vY+M+mhw72D
 p4JdaBm8LstpgvXzB61r6lJa03YsqZjcmDBM+oR/aBcjWCYbr6IrJwDKOvpEFtbB
 tZcNgN0kqSc1tki5+fT+6+zgHkonllYev/kYqVEmjemmKQ1M1Cu2OkzpbwM1k0OV
 R2aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561226; x=1657647626; bh=nz0MhVMKddGTg
 Yw4FqcQbDjuapCCCmkgrWxIJwpCfuM=; b=EPEZPAJ847WrEjmjf7T3uGAfk8P/y
 LjgWWgA3elUYVVD8VhqBv2EndVVJZFNtfl6bqoZpb9XSj6137VT7mcOIfY5s7H2e
 dyxbEwtcWr1rNXNHvjLCE7tcRBsiF3x7IwAIEpl1JsRD3PLSlABoO9ioXveRjIqj
 itfC9Mo8euWSCbyuWVkPWwxd7Hk+EoOj/416RHNlPU09wFl0OOabSDEUyiVy+hjl
 Yx4+OF4J/xf5JLLMoqzOhQC3Yav73Qx5l5ro+cFBAjyTq/G+DPriqx3Lm4otVCtM
 n8pD0x9TTHzlSqdVXzzU3elHaX8//ivjS8+YacX66FKPfUdbhHqCbGKlQ==
X-ME-Sender: <xms:imDMYhGYg9xznYb14OmBnEd0NVwcsiWVWrCwHpuckFiTEamq6v8dtA>
 <xme:imDMYmUhSVSIPG2WuqkK_ZN9jKsUtcD5JhAgvh47N720E0TqsmdlhaAEQyO7UDHkb
 DxsWYYx660qxLvPV1s>
X-ME-Received: <xmr:imDMYjJOoO0OLP-gZcfG8UzI-Lke3gJOxom-5BX4IAbfOTwJW0lcAZ0rAydcXGKmXuMIPAUsIxsFP5lW_1DaQupw4g1GsKhdqHFiNj4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:imDMYnGjferDkGvFQhtVyMSu1dJ1n-Y4_OmQlRoKqi_RZEE6Tm_Y5g>
 <xmx:imDMYnXhxZ7CxGf5p3jWeUQz80VdawqFF65dMpamfbZcJ3dRcQrB8w>
 <xmx:imDMYiO5kjGZOaJ7gRCUJtk747nvKwrjDHlyg4H7bS-aE9_AuAlQpQ>
 <xmx:imDMYteJJ2niMaLhp6JKffv6f1EyOu5ngmWAZxZuHabG7F-05FUUcw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 25/69] drm/vc4: dpi: Switch to drmm_kzalloc
Date: Mon, 11 Jul 2022 19:38:55 +0200
Message-Id: <20220711173939.1132294-26-maxime@cerno.tech>
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

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 7c4bfbd7ed9f..7a1112c12be4 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -264,9 +264,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	struct vc4_dpi *dpi;
 	int ret;
 
-	dpi = devm_kzalloc(dev, sizeof(*dpi), GFP_KERNEL);
+	dpi = drmm_kzalloc(drm, sizeof(*dpi), GFP_KERNEL);
 	if (!dpi)
 		return -ENOMEM;
+
 	dpi->encoder.type = VC4_ENCODER_TYPE_DPI;
 	dpi->pdev = pdev;
 	dpi->regs = vc4_ioremap_regs(pdev, 0);
-- 
2.36.1

