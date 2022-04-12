Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 392614FCDEE
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF4A10EDE2;
	Tue, 12 Apr 2022 04:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4334E10EDE4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:28:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CE4AF320187F;
 Tue, 12 Apr 2022 00:28:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 12 Apr 2022 00:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1649737723; x=1649824123; bh=Qk
 iqJQsRMBNjDm556z2E8TzPBn5kwgUgalPVUN5j18M=; b=o0sodiilYG2XI3Hc+m
 dOVW9JLbFfTOSb6/b52EOL3+LWbiKhHDTp2aAx+xqGOdnF+CcwE5PIKBoxPNHLnS
 RpzD2iLidYUFSbE0QyIpMTSDSW7br9q14frEdTVjyqfYA4BYFIXS5MWvQJQWilQC
 iV1QGmZDFxwP5b8xoFPIp+UQJnIelihcXSj1eH3J68YKUQQ7wSyjDd9P/P00O/kJ
 /7FmMNkj1CGOVR07+nb1Y2kUhFM+OZ9ZO1j07fqVedhA9n26R1FgoivuTOCmtSyP
 BA05VFaqOiUyaORZQjFMFkS4OaLm73gHTGLDVUKcX0BsPm3Z6munrUV3m9MoO2hU
 +1hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1649737723; x=1649824123; bh=QkiqJQsRMBNjDm556z2E8TzPBn5kwgUgalP
 VUN5j18M=; b=Ol79mX0tkx1lYps2PO1TBNM8hUMEuSzfHaXfS9/RbhR6okKLPs3
 lUgkMFY7+eTE9Ymda+z0UGqLK1htdw4CXFwzH8BdDiJUibDJFW8OFAsnQo8ZSF0G
 acn5vLlZLvkm2PVcN+b250V6NMcX4gv3mMg1mYZdjx9HkNJ6/fsK9XStnc0N9PEz
 aVL5fOdtWBPdRQgvIfWneb6wcMzGPVIOoQRhNz49O1Zo2XPfLLOAqHo/OUe4kEZb
 QgMRgGAMKA8imOgDfiz5e0uwXd6Lb+iREMRxDcScyGi9GUxY31IQhsvq080Gmx0N
 F/vWpMxr1nskI0B3IgSpKZtmtcrB8HJyUIg==
X-ME-Sender: <xms:-_9UYk8GHAQKOzb10ufjNIua_wXDNPPdaaWDA-9Vjz85Nao5-ajw3A>
 <xme:-_9UYsvFY4iAyp40vbN3Y2nRbsEbbZlyhZVMFzcfRvzYpE-eQvZ3E8uSa6Z-EEgz8
 66ifkZ1A7NLKAiHPg>
X-ME-Received: <xmr:-_9UYqDxsw4Kb6y-Lg47nBHWUYt1Bbfs0ZCnGb92V6IXmTYqbELt3WmA5Izv7pvv6O_bJyWiNf9BbuUQkd2JEZOTHlas7qZaSfcnS77OvBe4oPNwfwPQebKIeHpkM2818GhFFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekjedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeduhfejfedvhffgfeehtefghfeiiefgfeehgfdvvdevfeegjeehjedv
 gfejheeuieenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:-_9UYkcNF7JCQDRJ8FmluIHdStAGP8xzhBJYRHNGdY6dKDXynPT1fA>
 <xmx:-_9UYpM1dpXtovbW8TtSd023s4fYhkKtY5z9DlMkHKolNrtcQ86yvg>
 <xmx:-_9UYul94TVdImPR5E-wEekCJ8HtcwcdBXAwCKmcF4plJgkQGmMatg>
 <xmx:-_9UYuncZh2TdBlEpehP9ptMtjHXZu7yi0X2Rsa44u-CcKZ9sFXboQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Apr 2022 00:28:42 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 11/14] drm/sun4i: Add support for D1 mixers
Date: Mon, 11 Apr 2022 23:28:03 -0500
Message-Id: <20220412042807.47519-12-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412042807.47519-1-samuel@sholland.org>
References: <20220412042807.47519-1-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

D1 has a display engine with the usual pair of mixers, albeit with
relatively few layers. In fact, D1 appears to be the first SoC to have
a mixer without any UI layers. Add support for these new variants.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/gpu/drm/sun4i/sun8i_mixer.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 4ce593c99807..875a1156c04e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -615,6 +615,24 @@ static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg = {
 	.mod_rate = 150000000,
 };
 
+static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg = {
+	.ccsc		= CCSC_D1_MIXER0_LAYOUT,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0x3,
+	.scanline_yuv	= 2048,
+	.ui_num		= 1,
+	.vi_num		= 1,
+};
+
+static const struct sun8i_mixer_cfg sun20i_d1_mixer1_cfg = {
+	.ccsc		= CCSC_MIXER1_LAYOUT,
+	.mod_rate	= 297000000,
+	.scaler_mask	= 0x1,
+	.scanline_yuv	= 1024,
+	.ui_num		= 0,
+	.vi_num		= 1,
+};
+
 static const struct sun8i_mixer_cfg sun50i_a64_mixer0_cfg = {
 	.ccsc		= CCSC_MIXER0_LAYOUT,
 	.mod_rate	= 297000000,
@@ -668,6 +686,14 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun8i-v3s-de2-mixer",
 		.data = &sun8i_v3s_mixer_cfg,
 	},
+	{
+		.compatible = "allwinner,sun20i-d1-de2-mixer-0",
+		.data = &sun20i_d1_mixer0_cfg,
+	},
+	{
+		.compatible = "allwinner,sun20i-d1-de2-mixer-1",
+		.data = &sun20i_d1_mixer1_cfg,
+	},
 	{
 		.compatible = "allwinner,sun50i-a64-de2-mixer-0",
 		.data = &sun50i_a64_mixer0_cfg,
-- 
2.35.1

