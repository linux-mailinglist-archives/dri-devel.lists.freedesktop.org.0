Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F692570917
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E3D90307;
	Mon, 11 Jul 2022 17:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3950B9030F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:30 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 922505C015E;
 Mon, 11 Jul 2022 13:40:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 13:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561229; x=1657647629; bh=Z0
 DJz7H9tFVgAf3yqEQVf0DsRD1q9j47oH4cHKJNqCo=; b=ZrTCFDct0ESNxcruhR
 YHlzHwnOUY0jt8o9N05Ltk7OaEhvqM+ZocvjWrpqRyRETnYerwVBR2Nv6bdVONN0
 8id6V02inj51YbieV9ix++QLOkvsd3DKxIISVz9ajL4oyQvM1jfTLthRgrk5LSkA
 mhUkMTEBGvlesNEW8Eqio1riS7uO0imAz4u9S2DpEOggKzTxRxJZcRt1wGmIB9T7
 2Ft2xkkzCWjE1K5KOu+7a4fdxburnAoEs8yx7HP4VN4DkUFxWlFIsDM/jjD+HtWi
 liZQZLFvffRs5FRrwoZkM/bS64hkuPebq8L6ZfAJNXWGlEdFz6US4x0UzdDbjodZ
 v4vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561229; x=1657647629; bh=Z0DJz7H9tFVgA
 f3yqEQVf0DsRD1q9j47oH4cHKJNqCo=; b=JvI5Ij3WZdXy8KylyJ6htfutdzHgb
 JiKzBm2zvmbujfUd9ShtmM5po5S4j46ieqgJZgsq0BoyHA5xNknph7uRx6oYHS5c
 t5Zw0guGmAJqTScG0npA/k2UgWCOcKwSTTlUDYaCAO9jchZTrS2qFUDShzxqUNTW
 oDGMrRQYXotL7I2tUqM0faQg3HtrxjVJ9uRZnzVFWijb02ByMb7URGATS0qm4sAF
 OuSRAkTSzAPq0IJyap0kMR0JZt2DtYV8CO1/11DytVhrCeMLdj2CyvQpX1olZNM4
 VxsTQiei7P3UxDCHOh8KmeQrw6lRRG9Ajk3d3zQbKjQnxp+CerFKYp7UQ==
X-ME-Sender: <xms:jWDMYl27ubYa2AXVop56c4mgCsyWSkbfP4XnXUmZZwn3fNP6USFl6Q>
 <xme:jWDMYsFwHFOWUoJ7U7l_3K-jLtFtbTjroqDgxbAa7Mc40YpvWAdOe1yUUqUJsobnQ
 cCfrNQgqToQHT6UqA8>
X-ME-Received: <xmr:jWDMYl7AtTfIk0iQS6oBT7QVrI8X3sd0UNt_d4eVG5rm_oqs5LDI5Qmg_iXGawR8qpEN25_y38CH6w2g3fnL2Ju9yLF--H8q6Jt3U4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jWDMYi3IwiLwvp2vRA7iKRBAwbYFyv_2BYhLDWVvW_V65T7ZXlGCcg>
 <xmx:jWDMYoFth5gFv3vFih9kkK6PRwlCYa3V1C-6KXEjxQ2aXFsxotJdxQ>
 <xmx:jWDMYj8i3u_fjSiCMfJoGprUkv_GkqcCt-0x6Yh4bEoNEV5DnlZmKw>
 <xmx:jWDMYtNRXIUqSe_admmqvb2UTYyGZHm6ImrJL63rc1fVS01eQR-jcg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 27/69] drm/vc4: dpi: Remove unnecessary
 drm_of_panel_bridge_remove call
Date: Mon, 11 Jul 2022 19:38:57 +0200
Message-Id: <20220711173939.1132294-28-maxime@cerno.tech>
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

Since we have a managed call to create our panel_bridge instance, the call
to drm_of_panel_bridge_remove() at unbind is both redundant and dangerous
since it might lead to a use-after-free.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 7028a789919d..f18b05cee8bc 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -329,8 +329,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
-	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
-
 	drm_encoder_cleanup(&dpi->encoder.base);
 
 	clk_disable_unprepare(dpi->core_clock);
-- 
2.36.1

