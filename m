Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4A605AD0
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 11:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C2710E55D;
	Thu, 20 Oct 2022 09:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFD010E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 09:13:42 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id C37A52B05D99;
 Thu, 20 Oct 2022 05:13:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Oct 2022 05:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666257219; x=
 1666264419; bh=R9HharCQOI9TrJb7L8LG1ocNL0PwXIwue7dcYvnXGEI=; b=P
 6E14VtcV4tD4OHapRYW1LQXA2qEoPTFsRT0tCxyATp4fCtFUnH4Ubslomc3ArezC
 TtP0ouQEf+Co1coPtjFwYR2bLqOCSdNxZ05CatpiJ7cZmKV0UJYYeFpUdYRbEy1+
 RFQ8obhgceNnEQtDcsxVWYwfVwpo5lqkP5Xdm9RLWP/Aa4qQgSupV4FBcIlHBnkk
 o1rjuBpNB7Mz0Mf2MaxlEKmTr7eoHkNy2eZX/mi3JOVwEJOtDbyezPsxRTUQJLbI
 7QDSrlBInnAdgRS4BQIExBIkrqDX0ouabfrTPNv3Ja4M8Epk5I6FUKxToiiY6I5m
 7zcyIL9pu3EiouQSaWpvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666257219; x=
 1666264419; bh=R9HharCQOI9TrJb7L8LG1ocNL0PwXIwue7dcYvnXGEI=; b=E
 UhuMgTLVUlMJX/vkOmRLo4UAcodx9cJzfthoGQGlrr8q9rh1mCMN3iBtlk0jmfIk
 UH2o/bjkosD62d5dYt7bE0eTOKL0mebB7L6vwqlEuaKGUlxr6+XbgqMG6/ARDEid
 lbZea53mRisxsk0PBxOGrn+r6uedGW9b8IuMKaVo5yysqQ+4e08ZtpjIh2pJO+1u
 2Xvtv452d9UTdVCo3PPxRlx8HLm9kbbrhubQ/RMthb17KWx5z/VhJl9fxc1xhB3N
 UjfAeD0FmOar8fUDEsNUNo1ZNXUT0pYnyIgzR6NvUuDlL9xMY3qdbp20ClxkZV1H
 /20pcSRftyKED30ehVFwA==
X-ME-Sender: <xms:QxFRY3DjWpCt7R8MBn0L_g_XjhPmbEnISR25aRZMhVcsBDzdENruiA>
 <xme:QxFRY9iSPzIq3fM4wu-i2Ckl6B4BGIPpTzL72vdUOgJQTo0Ljd-gMPMYWg86ijHxG
 pK_W-6RR22Gtr6Uwxk>
X-ME-Received: <xmr:QxFRYynufykL6mObNkHk8H5r4L5VXyIkTQetn0nyBO3eBqJgUmmtPL4ITo3a4v3sTkz8aUm6dyUNqX6fLpT7RHWz7E0lW4gyi6w7X189Few8kA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpehmrgig
 ihhmvgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhepfeduhfegveehhfeftd
 euveeuleduuddttedutddvvdegkeehleevhfetkeetiefhnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvg
 gthh
X-ME-Proxy: <xmx:QxFRY5ypIPxF5q-gpL1csN7wg0yu92ZUDa2QYTRlGRVN4LSein5wwQ>
 <xmx:QxFRY8QjXpIbWHx6Ed2L0cp5aCT4RLG44HWyhycM_1kj0uzR_QfURw>
 <xmx:QxFRY8buzVdQIoicrvxOE2qZTGCGvhPnddQUGEM1nWkBZs-5GM9yXw>
 <xmx:QxFRY8yCz64DCv8plhobIBMDqedSqkzhlOxgdAyVQRdlRWxqRCSnL4vecMs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 05:13:38 -0400 (EDT)
From: maxime@cerno.tech
Date: Thu, 20 Oct 2022 11:12:12 +0200
Subject: [PATCH v4 4/7] drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v4-4-a1b40526df3e@cerno.tech>
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Ray Jui <rjui@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=Po/0zWeG0J9jRRowzpJU7mdz3tNlPWD94CHiLGqKoOU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmBAq8WZaV4Ltdy2HTqus7G+QFxGto/lu9ZKXNPPSPFkvGr
 jI59RykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACbitJ+RofNDwr0NE4oXiKxamPc8Lc
 hb6uKmR9lpC/qknU2zVnYEH2T4K3X1QjJfxtPIi91ziiQWyZ04N9XUw0E5ImCSH/P+mutr+AA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support higher HDMI frequencies, users have to set the
hdmi_enable_4kp60 parameter in their config.txt file.

We were detecting this so far by calling clk_round_rate() on the core
clock with the frequency we're supposed to run at when one of those
modes is enabled. Whether or not the parameter was enabled could then be
inferred by the returned rate since the maximum clock rate reported by
the firmware was one of the side effect of setting that parameter.

However, the recent clock rework we did changed what clk_round_rate()
was returning to always return the minimum allowed, and thus this test
wasn't reliable anymore.

Let's use the new clk_get_max_rate() function to reliably determine the
maximum rate allowed on that clock and fix the 4k@60Hz output.

Fixes: e9d6cea2af1c ("clk: bcm: rpi: Run some clocks at the minimum rate allowed")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 64f9feabf43e..87961d4de5aa 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -46,6 +46,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/rational.h>
 #include <linux/reset.h>
+#include <soc/bcm2835/raspberrypi-clocks.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/hdmi-codec.h>
 #include <sound/pcm_drm_eld.h>
@@ -3429,7 +3430,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	if (variant->max_pixel_clock == 600000000) {
 		struct vc4_dev *vc4 = to_vc4_dev(drm);
-		long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
+		unsigned long max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
 
 		if (max_rate < 550000000)
 			vc4_hdmi->disable_4kp60 = true;

-- 
b4 0.10.1
