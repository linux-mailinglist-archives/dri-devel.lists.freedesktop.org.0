Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445265931E6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 17:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF891CC5DC;
	Mon, 15 Aug 2022 15:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA6A96859
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 15:31:57 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BF6793200904;
 Mon, 15 Aug 2022 11:31:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 15 Aug 2022 11:31:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1660577515; x=
 1660663915; bh=vhRyXQqISjoh2e7pk/F7Qvq1OW7LWLQLkUXMxS8tBmU=; b=K
 7GTLnMsU5E+bUwUJznMdn2JkicORd839JUwoJ1rWqF5DSDJKuK5fY2wsvw3iaS2K
 vfK5UKgmDROHDJdyUVG0xymVaIa0lo1OA7oekdRI8VAQKM76bhOrT5o7M6xAlvrM
 2bVa5lB6NEZfHRFEDhr0xtHab49aCb98AeOOGwyt1xYymqXM54CPJHKx6xMksgWe
 /QFgV5zbzTcs02/rolYN0sVCubVBWUSTYD7L5tSlyDyc6FQUTfP+Ls6Io8Q0q8lG
 7MUHWOZqCCrgyZ4Kq+9n+g/9DlZd2vLt2+Q3SeO9koIls+stEGio6LOcMExow5HB
 1Ob6VsmGhegGaqscMkWSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660577515; x=
 1660663915; bh=vhRyXQqISjoh2e7pk/F7Qvq1OW7LWLQLkUXMxS8tBmU=; b=R
 lD1gwhMfRtlNxJdxjZiEuX0Ka125BYvyhsQv7PlVarTHxsvsnPRivGIoGHyUolL4
 2oCZ7NW6A8dVVAhth4vNO58ANCT4lMxdNZ27VXWyQokZ8kF4IF1zMTWgrV97K2Wf
 Egn46eQJOxP35NVkthT4W+gcNrMtJidPLfArHSGMSwiOMQMb5uvHmjHobOYcSaLZ
 0KJiLuasedFQN5fVngUYaVVA/+2VubM8cQJIN6WeX1tYkeTruoLp1xVvQz17G9PT
 0vrf1wIbSIshMrvUZYVhyKoRnqTgpaNUtB4Bk0OdJp2iFd7dQkIQwQ5C59kJiFht
 UDJy05PbuXfLzZgSuGLpg==
X-ME-Sender: <xms:62b6Yi1UQOTVPpzVgKwfE2uQWHVVKK_aG9JiPyvuzf0y8CA9o6PZiA>
 <xme:62b6YlFhduIJ8jcMe_MF0HkEcH3woE3UpPJd43bajpSPFuJa-Z0RLLAIcM8G4rtvF
 dIaiOy5pC2FrIusvPc>
X-ME-Received: <xmr:62b6Yq6N4rO__ImHuQpJ1DWz4Xuj-KZJGKvYK5TpHEUQHEtIouxke0dAUJ1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfogfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpefgfffgteffuddulefhveeiffffudelvefggeekueetgfffjeehleel
 keejfefhjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:62b6Yj0TDOhvjnmEe2R6eLC3Wyz_IDl_GWFbjd8CKggYzxfmk_lqCw>
 <xmx:62b6YlHD7IR4FqpUKFV0vJg369fp3LHI5M6PFoDO2-xm2wUf-pJWBg>
 <xmx:62b6Ys-L3B0x7XZTzS1TnRtSqrSztBwAdD4791dmUINXdXNou7A0Xg>
 <xmx:62b6YnF6iDE1s84oWmbVFj-8M-xd4Pf99PtaaB-_8Y9vQoc5slSZ0g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:31:54 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Scott Branden <sbranden@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 Emma Anholt <emma@anholt.net>
Subject: [PATCH v1 4/7] drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
Date: Mon, 15 Aug 2022 17:31:26 +0200
Message-Id: <20220815-rpi-fix-4k-60-v1-4-c52bd642f7c6@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-a76f5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=0XTcURUE3scuqpvcocFWLSNEWe2VrFtmV9qgTsz3u18=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDEm/0k4cTT3wx+IJm2tUxjNuLr1Hqz3mnnQ4H3Fx86zign/1
 R+UEOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRFRaMDBdLyjbcyuJRf7vuXpv1qw
 8JgT+f28zTU/QPV2C2dLk0SYORYUX5DLmJhc0rVc6l9JpWXfzssnTJwxnbn6atuLoh+9R2CzYA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
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

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 592c3b5d03e6..aa3ebda55e04 100644
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
@@ -2966,7 +2967,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	if (variant->max_pixel_clock == 600000000) {
 		struct vc4_dev *vc4 = to_vc4_dev(drm);
-		long max_rate = clk_round_rate(vc4->hvs->core_clk, 550000000);
+		unsigned long max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
 
 		if (max_rate < 550000000)
 			vc4_hdmi->disable_4kp60 = true;

-- 
b4 0.10.0-dev-a76f5
