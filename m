Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C7570904
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 779D08FF42;
	Mon, 11 Jul 2022 17:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B388EF04
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:39:58 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C97325C015C;
 Mon, 11 Jul 2022 13:39:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561197; x=1657647597; bh=UU
 GJSMCMaJwdbs4l9OBg3rwBsWdoY6m5AkyRr3rypXw=; b=lgjYn1pFgRbRVmhfsl
 tiUWi3TlHfH34lNt2DNGfyoNYg5u9ILs6ZZUaT2smmIox7nFEjLXdsNw8wqCI9iD
 LPoehdCjp6I7IgLgV87TBCEzongSmsBkiWjsNZfBGnsSWKIlINwh53Wq63wT4WE+
 ybBRbCcaDOPuwmMDOzKJS8U4qA+3erhxuqGxyraGzTTJ2WjeX0SpSfiyrJc8HgVX
 r+EoOUwreSG9qppwuGIoAVwR8u/dO93l4ifmNmJExAmTW3DJ6KoJYyy//4CPv9FA
 B5Y+9e26G6uGq/rZb/eRyUE/BvRbdyNlFSNrfoOTbUjDxhVOrXDeac+rpvHbDFgo
 2sSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561197; x=1657647597; bh=UUGJSMCMaJwdb
 s4l9OBg3rwBsWdoY6m5AkyRr3rypXw=; b=F/zdsdRfZ4DgvSSaPVVvF4Oihbk8n
 Fx91VTe47TOH+K/V/NOWpSygiwRQYIiHNB0uoeG6PNYrFZFfK8knYpf6BFXrGMyq
 V38q9aUM6dwCiHqjMMETfqNaY1d7KIyZBsmkSy3NCt327U8UIqnAkWchxt8hLRHL
 LrGKhAP7Uobd6f/tbzZaEPJSQTWJk59OUlBoB/jwZw2rg0TR3TIUb6XtB1LKfnb1
 lMJ1X6NeARh0T0k/p9B9ZUJzDNuzb5GOzuTAbP2uRCgiZzY6Ci6QB8CiIisFTMIa
 HRrT7NL8LOfL4y12nJSgBnLCqgH/8FfqBY6D+ukHTFnXJI9wc4UGF1C2g==
X-ME-Sender: <xms:bWDMYs76KrMmJtVs-5HbbGPe8SDQ5lNMM_4sOPAHpj8lCSHDvYo6pQ>
 <xme:bWDMYt75fwiUBQ08ZtKDGMD7bd7dunR9I_8f0P_DzFectfY4QHT0Vqbi41XII5gFL
 a166RC1UQaFO8ezn6U>
X-ME-Received: <xmr:bWDMYrcvA21TDoUNK5dXZZLfq-dYXZSw7MU99lh1keLcao2L4TSNPvoLOags45vWi24_JqeDVgdyO4yxcwOCn8sIY2r7KEm_tedcc8s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bWDMYhIn0Tr-WZ5puImuVNRUYz-Gx53ctIxxZfRgGrOUt8IVk9BDQQ>
 <xmx:bWDMYgKTA9HUJ5uxJQR28XzKxBbDvsZiU9iDbxvNFxRr0JFUlvJxzA>
 <xmx:bWDMYiwAWPfkFB94ZcBbZQpjQSxpAwOPJ8yUippiO3iTEtKotN8C3A>
 <xmx:bWDMYlFBa8TxIJq23zi-ZMMNVJshR-rUkXE3aNpe419kosOb6BbpNQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:39:57 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 08/69] drm/connector: Check for destroy implementation
Date: Mon, 11 Jul 2022 19:38:38 +0200
Message-Id: <20220711173939.1132294-9-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Connectors need to be cleaned up with a call to drm_connector_cleanup()
in their drm_connector_funcs.destroy implementation.

Let's check for this and complain if there's no such function.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index bbdac23bc5c5..dfd170273f5c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -348,6 +348,9 @@ int drm_connector_init(struct drm_device *dev,
 		       const struct drm_connector_funcs *funcs,
 		       int connector_type)
 {
+	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
+		return -EINVAL;
+
 	return __drm_connector_init(dev, connector, funcs, connector_type, NULL);
 }
 EXPORT_SYMBOL(drm_connector_init);
@@ -378,6 +381,9 @@ int drm_connector_init_with_ddc(struct drm_device *dev,
 				int connector_type,
 				struct i2c_adapter *ddc)
 {
+	if (drm_WARN_ON(dev, !(funcs && funcs->destroy)))
+		return -EINVAL;
+
 	return __drm_connector_init(dev, connector, funcs, connector_type, ddc);
 }
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
-- 
2.36.1

