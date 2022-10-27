Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B2B60F812
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 14:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABEC10E625;
	Thu, 27 Oct 2022 12:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A5210E612
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 12:53:06 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 45CDA32000EB;
 Thu, 27 Oct 2022 08:53:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 27 Oct 2022 08:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666875183; x=
 1666961583; bh=ABXVuFRFwD7VoP1BttJsNvCdZUJ4AkHnkkTr/OV+M3w=; b=e
 egEqx+P420KIQD0QnK7FGrABV2GkI/4NFblmEcca9dczDawU+tXS5CM1MrutnS4/
 jDHY+r9XBTESM/SpP0Rw4t32yAhK+8WHGQ6/w1wmnWXzVqUqfqG9AimC2ULj1yjx
 I1a/H4pPc5D80nUcdrHDo1EZwJfPw6ENMmbFz404Qikxaxfqto1PnCgrJBwg3GwA
 zvj/T2qbUxC7d2sjfEGTVi5jucnd6mj8MN3pVRiJkl8EAokyy+uY7HAY1/FbmaGR
 XNCFQKK30P1/fkjxYOb+9w5mBpGsMOncGa3J0UXSgfS7PB8aMweor37YAId8qUSC
 eMsnKfkqKbooyHzthh45Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666875183; x=
 1666961583; bh=ABXVuFRFwD7VoP1BttJsNvCdZUJ4AkHnkkTr/OV+M3w=; b=l
 okLEfdb4VoauKaW7T1vSh8z+yOfAwl5Knp5m0zH4ulY+D6bSzQSJu5m6EU8AJit+
 d6AEGo+eQReA2g1zHrNCuyFT58ED/WNWxbdCO/VhuQMCl0bIGyv77dhw0klQmIUW
 pb9rPTr/dXinVcK3rcqXKwwqGxKplz/1OJ2E8HfG1pENjJk9+U6uclTcayZETM0I
 jOhaI6RcIsZgFrohWzsaDVQK1nWXFaCqbdr/CnwczKXfQUyNdJhVwxm1wApLNNff
 iwOboXRM598NXFj2MdRoV8vlJIwEborZGb8YR9KBGP50sms+TdV5uUORmiHBr30P
 whSp/Fkbv9oucTXxLN7WQ==
X-ME-Sender: <xms:L39aY2OX4RwZL7SbNjNL4VAzWrBcEulw9efkVesquTjlYXDnV2-hRA>
 <xme:L39aY0-DSqucoqdcrY-un3Ng7DNhr5VToiNTMLIvooW0Vkuttc5ottXs7d4kqV9wc
 ckAJDBkaSxEQHxGPDM>
X-ME-Received: <xmr:L39aY9Q652ZkcTPzIi87leizdWaBvePyc3pbwHy44yhxcWOpJTu8Na3pUG5-Q02wRE-ncRV30RF6AVmi48ugUXlcUtYenWWZdX1HhZeU5-zkqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:L39aY2vwoedgHkSci0VlM1fEQmD5HuZGg2_jIhFjBBEiBQiwLnfM_A>
 <xmx:L39aY-dD28Y-637xwdWSjlZbPf4mrudQQjy0ANqkNb3MlDBMaIB9Dw>
 <xmx:L39aY60POBZQ_o6DSw9khc9T5VHhhgdNr__wzssWQ1xuuow6_fwuGg>
 <xmx:L39aY1BtOxqJPbz05LUZWD1rjKtZGQzuXg7I0enFCQ3rWUS7IYRkwQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Oct 2022 08:53:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 27 Oct 2022 14:52:44 +0200
Subject: [PATCH v5 4/7] drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v5-4-fe9e7ac8b111@cerno.tech>
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, 
 David Airlie <airlied@linux.ie>, Ray Jui <rjui@broadcom.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1974; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=/rK7qcfEbvt9MabtcYvHML13bEdfRKh9F+Jr1qCrtwg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMlR9TLLed/P8j93eGv0tB13Qo9IJzVl3ksVOOz6a9ExdYa9
 CzgudpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiGesZ/tcdWFVjdGh364Kb6kp8hv
 OXsTzcP+l4QJnR5KD1ml9ZWdIZ/rtq/1U7teHCfbFaedbdz27bTjE+zSAjuqe08AyLLI9FKycA
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org,
 Dom Cobley <popcornmix@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
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
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 64f9feabf43e..3acc1858c55f 100644
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
+		unsigned int max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
 
 		if (max_rate < 550000000)
 			vc4_hdmi->disable_4kp60 = true;

-- 
b4 0.11.0-dev-99e3a
