Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F40D5485CB
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0898210E815;
	Mon, 13 Jun 2022 14:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE7610E815
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:48:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 92CC9320092F;
 Mon, 13 Jun 2022 10:48:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 13 Jun 2022 10:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131721; x=1655218121; bh=1j
 Y2zWEDhJrChee2ZkfgbF8slN5wGMHaqrOM09IVp08=; b=EzMHTDD4kpGHShZboW
 BeAosLfKWpRBipuxvMCevolZp/yAUAexyfL0GByhXVbur0LNPHPnOJo5I15V4KKm
 /v8v7j9SUWuHLzrJ20dQOllnkqbseFvvD5wwVHPPGeMGUUwSMmjCF+nZo6U9m7ru
 9mpmWm7+ZuEt33iyRcYjvohQGNfizC3XsF6M8CrjYfdfp35GDF70Ziyigp6pIJv2
 AU8fsaAddWjUaQozpi97AxAm1w1Wu8R+2Ywq/UpPtyoXt2uosNEDumWbZhNbf0Wk
 VrwsLAldR93oux9nHxt+2CvrpCEo8prMO/l1yv2kJ8JEysnpjM9kkezVJE6FV3HG
 SkAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131721; x=1655218121; bh=1jY2zWEDhJrCh
 ee2ZkfgbF8slN5wGMHaqrOM09IVp08=; b=TrQxC5fTBl+70WeQha64GcuvYxZCD
 I43feve3h+3iCjorENL92G+32SdMbvStJplt3c1qV3zc5rGrGCfiFV6E1r8+kag0
 w1xZp7X+x9wo3YNJTYSqOMRWokeR1gXw/v79Hc9V10+jqJOzzhQ26AjEBxYF/sN4
 /jzLoLllaAIArPQuG/rDeI8TnalL8hxZLXXW4SUbESZjPlIYTQEOOpmGDrae6Osl
 KwsR+ae7PzxaBiVCO2BJOZUCYWxoTPT3j1nyuZAWqMVDOWto6PLwK9Ykbk/QLuJp
 GAftMdOEIoweQto0lLfsjlMiiCqK7Ru7pcoDQQeKmBB4XViAkBcF0pa6w==
X-ME-Sender: <xms:SE6nYmAk96iiycJkZua6Z40GW29xcwdzQEShk1ujI23XCffyM9mUxw>
 <xme:SE6nYgjZXgwwV66klsz8Gnt5mDuneRnpWRj3viGXyHJC5YhOtvI3Kd6R784j04qsI
 Nbm0Mhjr7k8jRfO2bY>
X-ME-Received: <xmr:SE6nYpnwH3Y591Gbu7DupUeNXDnysk5-ET6JIdFfXxijpSyBJ2PJSSha2r9I8kzJa4qeBFJSpFg_ZarP6h39Mvnavsm3JOUUqHELdqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SE6nYkxTsr2xtsRZBGknK4KRB3oTnM8ZCwgrffAGEnFojYuuTkdqGw>
 <xmx:SE6nYrSDF-pUDBL5VfQrY0zxE9rbG1Z4G1DsQL6_eC-0BJB2Ha40sw>
 <xmx:SE6nYvZnLc_t7Mmt993AZawJ1G-pR9WRvwXBzU8sP8u6Sn-II6EXSg>
 <xmx:SU6nYsIiBwW4vGk0ojQXxZea4tZPOz2GwuqDg52gjK0gnD_YuJGG9g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:48:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 12/33] drm/vc4: dsi: Correct DSI divider calculations
Date: Mon, 13 Jun 2022 16:47:39 +0200
Message-Id: <20220613144800.326124-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The divider calculations tried to find the divider just faster than the
clock requested. However if it required a divider of 7 then the for loop
aborted without handling the "error" case, and could end up with a clock
lower than requested.

The integer divider from parent PLL to DSI clock is also capable of
going up to /255, not just /7 that the driver was trying.  This allows
for slower link frequencies on the DSI bus where the resolution permits.

Correct the loop so that we always have a clock greater than requested,
and covering the whole range of dividers.

Fixes: 86c1b9eff3f2 ("drm/vc4: Adjust modes in DSI to work around the integer PLL divider.")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index e82ee94cafc7..81a6c4e9576d 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -805,11 +805,9 @@ static bool vc4_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
 	/* Find what divider gets us a faster clock than the requested
 	 * pixel clock.
 	 */
-	for (divider = 1; divider < 8; divider++) {
-		if (parent_rate / divider < pll_clock) {
-			divider--;
+	for (divider = 1; divider < 255; divider++) {
+		if (parent_rate / (divider + 1) < pll_clock)
 			break;
-		}
 	}
 
 	/* Now that we've picked a PLL divider, calculate back to its
-- 
2.36.1

