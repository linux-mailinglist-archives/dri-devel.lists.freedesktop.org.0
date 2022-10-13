Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8234A5FD6BE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 11:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1334C10E650;
	Thu, 13 Oct 2022 09:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD9310E55F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 09:13:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F4375C00EE;
 Thu, 13 Oct 2022 05:13:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 13 Oct 2022 05:13:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1665652399; x=
 1665738799; bh=ZQjFpYF4e0Dy/cWO7rqPvZZq5y+2aveHJD01sKou3PU=; b=y
 cebru2AvS8YSPHdZivIu35r08q7j5b0spf7C2/oPrjCXnSPNwTe32zs7h8+CSW4N
 uC4pNldahFzjVWhzMkVvIOg0Zt9rxNMREr3pTZXS6o0X0IoCEOXhOdBQkY4MaVIv
 nERnRt16WNUhv2+k84DHjxJis9PTxACkchZfTD/ohIFT7uyY6JbR8GDMGA0ctluM
 jT7O5Jocer5xv1LHdk3qYvTt/KfkjjveiMgl7qAmqiCOkLjQHmHGLjJhL5nDzxwt
 97a2SOoAArQplSz8sfdbmaQg7M8TpLZ58tXwCiqbOoZ/akdfwP4MXvOVHTiUiVbg
 xQ/LaeQKz4R0DcoWcEfHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665652399; x=
 1665738799; bh=ZQjFpYF4e0Dy/cWO7rqPvZZq5y+2aveHJD01sKou3PU=; b=e
 CFacKkbVJPckcAjNKWtetOmybTV+4rF97s1DA2qsNrPa4KK3Be7hFQf/qrWjgMoU
 04VvoqoBG9hhUgCYjUvPqQj64YHWqfvHR+oUrZrWYRiij0OiEDp8UN58et6muUeu
 HZ0daqS/a2AFa6CqeLyxl2pr/zqBUt6zX5HV0lEZCOumoKIVVeVqh4kw90qOHF/k
 yjqUGyrYGsjGY1SJUKqPpXCbLdM5+ejBsYcCmtOvewyxp8FUgEyMBQ2Rt7m70MAt
 0JKHp/3SPeByD3bOOB5WQvISdAX+AtcEP0UIeSfmE2kTls3nO94GUQKuh4G5/mIj
 4y/1YwwCIc7SN6lO96Pmg==
X-ME-Sender: <xms:r9ZHY_GdfQVLOeSjfglB0xcYKym97Le9pXvFT4W8bvltmCg_D1qVIg>
 <xme:r9ZHY8XhhBL6fzm5NKXbDcs0HXE84iSuGSJOxThimBPTXNEpeQ3Zh-eraoffjHXxS
 KbPO2d1wERiaUn9vJo>
X-ME-Received: <xmr:r9ZHYxJ3ZzRUhva6njjqn2bdslbMIGrchMGOg-b1ZAnREj8WwTcdaT9U6YcAd5dlYHXrXSYS8upaE1MbbCOFfAytL1M-FKclptpH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeektddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:r9ZHY9FKg-qB3tacvIdaShMlgcbAOQGBpanLi_HCtm2N_bYHAmRTAw>
 <xmx:r9ZHY1VlDkL4QTZYRvko5ph0Wc9hxup1iLnetMAl2uqJmwg5iyPcKA>
 <xmx:r9ZHY4MfbrDL0nNocNrzrBfAanjP_UxY2X0S5lvOndnUdLspXVoL8Q>
 <xmx:r9ZHY5nbg4AuF789wD4qgelnRDcWilivNPn9HVHS1Fevr3hksjuEng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Oct 2022 05:13:18 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Oct 2022 11:13:11 +0200
Subject: [PATCH v3 4/7] drm/vc4: hdmi: Fix hdmi_enable_4kp60 detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220815-rpi-fix-4k-60-v3-4-fc56729d11fe@cerno.tech>
References: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v3-0-fc56729d11fe@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Emma Anholt <emma@anholt.net>, 
 Stephen Boyd <sboyd@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.11.0-dev-7da52
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=f1lo6Ai83eEY39RwlVf8bpafgmNreYn4rcZrYcxd9Lc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMnu15bYFYvKHn33JrTu102PFdfPm1y58np6WuKsB8lfp5Zs
 k59q1VHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJmN5kZDg/c66DyqWv93i2ljpEBJ
 koGRybdOf53ffGiqeOaiwpzvjN8N+7rrvyffARowALc0e3+4uiJwpMuHpuKk+sGueEQBedCWwA
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
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 1e5f68704d7d..3b75ac6fa0db 100644
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
b4 0.11.0-dev-7da52
