Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DE0619766
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 14:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C2C88EA1;
	Fri,  4 Nov 2022 13:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80A988EA1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 13:17:50 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4980458024E;
 Fri,  4 Nov 2022 09:17:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 04 Nov 2022 09:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1667567870; x=
 1667575070; bh=G6roTlQI+WbfuJBVMerfpRGcIgbu8Jj1z+yrfkH1e+4=; b=n
 305Fx+jcKbMsgUN7v1krJxUbv7vaOfIMbnWEiBcRYzX0RmgLNUo6ZQkQ041POXIZ
 dxIzQjfl8zV82UiM8+VLMQJwrb6pLRYX7gCMb+XBMWuH1E/0jDHRJlvJ/Lpuin95
 ZDW+gl9GhhcANj/Hsh5IWBqmfuv3jIxxLX8EstOLGKg7VuSm1kTHzuqYRVBMDUhB
 +JjAc8H/cro+i7N4tOFy91tFBOszwsetF5RzSoAbn6n4jqLKw+oDrzkPQt1uAiRO
 0tL7+W8Sv5otfhI+TTUQ693kejDfv6p3gxSaz+ybZkiMhJ3htwMZwenAoc/Uz60+
 iTbTLunO1rfdpWZpT6mSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667567870; x=
 1667575070; bh=G6roTlQI+WbfuJBVMerfpRGcIgbu8Jj1z+yrfkH1e+4=; b=I
 Z9JokDAMRMmEs198kcOyI8byre7eSOmpJS/5iXjULqjY+mM1ez554uEE5P/Dmq9n
 Y2phF2Ulr43HOi7KVl59kOM2ZXOb2atqD2mg8M/epW+1ArP9EmdYUAJlZliMFOVD
 o12Xx38r37wZLzYpfU+rJPcvqSDRpLY/FCYqk6k3WDWHqAoayvxVtE5/iP9xO5Ej
 yWXKogQGxCteQLxh7SqLZ6FP2k0sBEskWmK/5LsDTWMImCxvmptKYJUVpH2wCBV6
 CsD67r2Fk67TjOH07maYbYHROh63LTNDVT8baKk+pXZhP5+x0ZDzT30G2pMfBFWv
 GuflU3e1PeXPYUL41JYFw==
X-ME-Sender: <xms:_RBlYz5sWVh5Q2Prh_vcUS1V4bUgy-GcLDiEi6lCh0Bcu3Q64KA1vA>
 <xme:_RBlY47mcMoIwdxKw4VYA8CgXYfqwofPIk_yfVQkQzfo1rGrC_va9Afa7ZcugfEHA
 XB2_DJ4y-aQ2O-mC6g>
X-ME-Received: <xmr:_RBlY6cWfkdXCW7SxXxy8D3iUOUKglqMWDCzsclEYVaMDfzMJQ2znJ6I5fQLhAC5V7nfAw1F5rwqAos6yBBWZqikovTGcFmzCpicojzmMbHmVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvddugdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduudduhfevjeetfeegvdffvdevvdejudegudekjeehtdelhfffveethfej
 ledtveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_RBlY0Ib4bHGO5KmpBgwthZxEPtuJoYhiBdH1sJFc6bY_Ro_cIUb-g>
 <xmx:_RBlY3KrcZQruXj4HjKXTloKAi9Ves609ipl5P7HJSwdQSy9j5OqOw>
 <xmx:_RBlY9wHbb5mW5glkJ3V3LnZPKWDZYBch6nxD8xhk9eK8jP0Hj8nNg>
 <xmx:_hBlY-Y-LfwRpLmQErcd1SIYyAqJPysiO5TrAswCdcP4FFrTUcRVcw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Nov 2022 09:17:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 04 Nov 2022 14:17:18 +0100
Subject: [PATCH v2 01/65] clk: Export clk_hw_forward_rate_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221018-clk-range-checks-fixes-v2-1-f6736dec138e@cerno.tech>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas Färber <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=818; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=pHSkDqlAWAoctG0mTmKyzVsJsENtdafsCZJ4udDXPgk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmpAp9aPz1sP7s2/Xn5a/ErU6beWJjGX1Lh2zWb89/fOWUJ
 BsmFHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIRS5GhqnPGtbbXKwz4D9Z52Fi92
 u/dNpMd35p+Z1zHPNui+1TEWVk2F9WoVG819j57F3279o6Mm83xyUl/TrE/K164Z5ff2asZgEA
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
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 linux-phy@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests to the
parent") introduced the public clk_hw_forward_rate_request() function,
but didn't export the symbol. Make sure it's the case.

Fixes: 262ca38f4b6e ("clk: Stop forwarding clk_rate_requests to the parent")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 57b83665e5c3..d4a74759fe29 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1525,6 +1525,7 @@ void clk_hw_forward_rate_request(const struct clk_hw *hw,
 				  parent->core, req,
 				  parent_rate);
 }
+EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
 
 static bool clk_core_can_round(struct clk_core * const core)
 {

-- 
b4 0.11.0-dev-99e3a
