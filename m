Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B51057091B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2C390314;
	Mon, 11 Jul 2022 17:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA4990306
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:40:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D480C5C0152;
 Mon, 11 Jul 2022 13:40:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561227; x=1657647627; bh=VV
 zN8GUcIi5x5hNxX27v4fp48lV/0zBgBiNlCnzTGaA=; b=iYf/NDGkQLtaSNUESE
 PvcKHByt+ToJ9df6AXBbzPb0+WpnZyqNDpKAN8p8jbisUh+2VYbxRq5BCxyI/jIM
 SPbhOlBrA09jUSuMip7DPp9Zzipl7GoTf2/62R59Y+sknftPEC34rRmP98yE6kqn
 Iy5OjMIaRIDDACWrYm5SnlCCZVhnPVnmtTeU3vX6YQWG3D3YtzgKyeo+OPpMWn3J
 0lDz4xheTufrLpOdLAsl/SmUQdaUQmAjWDTCKP8xsDivEV2BpIYA7JyupaMvCAwA
 LG4zJeeUUI9Z0rTK6t2Wcw8oHeD0sx3NRD06Fz0wQODO1dLxuteuF7G9Fula8QaY
 dL4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561227; x=1657647627; bh=VVzN8GUcIi5x5
 hNxX27v4fp48lV/0zBgBiNlCnzTGaA=; b=yPrzjQEffTvpOwtAkOluauZy2ClD3
 qDMiWOaCoNxtNM1/W+80JZMVU/r1Ywfq5FtgQwV+TTmSAeyv4cYV6wZbHfW0ajXW
 wHzq8pJo075cA5wPiSIw58p35vUhbrxlpiDgV0SySxeu8Go6+YHIwo65zV65EDCU
 ILA95CEhaBuF5hiz9WRG6uRB5vBo8oQrD5Qg7Q4rUwuYQW5c8pljFsqkwb8TsrqB
 nXeSrYvj9sXkhCoi6P/YgATk+7USI7myDRapWSr7YaiHL8837k8ujnr1zJzrKIHh
 L7RLI9aDRtTzo0gqP4dFOHWSg+0RryfWFmRbQk9RZfLikHlTQHEDbCxVA==
X-ME-Sender: <xms:i2DMYlslI4nvStgH4NL_E4ZidWd9sPH45IK1PjIxFkB4IHy1SmZ1og>
 <xme:i2DMYufFYJmBd7NJSjUs7gNKhmV0bTons7us_ExWhoT8DCF9zkvFz0JjYJF-1c2zI
 r89eeLVhbslT83oXoc>
X-ME-Received: <xmr:i2DMYowlVvrKbeqfB8iaYEZw05O6CcRKglaR8wCVjkTr-bwEvmp74eYjBl8AS8smMVEr3yLxXUlZXLS90RlUocmEPjASXsjpEzxNnno>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:i2DMYsMwXUZ-_wFbN6bYExKoifwDvlVEKTkYhj_hul5UXfA-ZVspPA>
 <xmx:i2DMYl-5hPlm-mqNwpFAunOxBwFyemhmqE1oNrdmHD-KFx7oocr2DQ>
 <xmx:i2DMYsXjiEIght_TCOcSbF-C6sQFJp1DhF0PJ_Wlbu-6AzRCaeWY4g>
 <xmx:i2DMYok2tHtp_zChNFTyUilxbKGVBXrOfjwOEFq0au8TNbX1ucX8Xg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:40:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 26/69] drm/vc4: dpi: Return an error if we can't enable our
 clock
Date: Mon, 11 Jul 2022 19:38:56 +0200
Message-Id: <20220711173939.1132294-27-maxime@cerno.tech>
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

If we fail to enable the DPI clock, we just ignore the error and moves
forward. Let's return an error instead.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 7a1112c12be4..7028a789919d 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -290,6 +290,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 			DRM_ERROR("Failed to get core clock: %d\n", ret);
 		return ret;
 	}
+
 	dpi->pixel_clock = devm_clk_get(dev, "pixel");
 	if (IS_ERR(dpi->pixel_clock)) {
 		ret = PTR_ERR(dpi->pixel_clock);
@@ -299,8 +300,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = clk_prepare_enable(dpi->core_clock);
-	if (ret)
+	if (ret) {
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
+		return ret;
+	}
 
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
-- 
2.36.1

