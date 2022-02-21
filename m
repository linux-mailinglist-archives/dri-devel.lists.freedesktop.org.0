Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD04BDA00
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:42:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F5A10E3C9;
	Mon, 21 Feb 2022 13:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F204410E392
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:42:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5D8435C0216;
 Mon, 21 Feb 2022 08:42:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 21 Feb 2022 08:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=dTwPvpWInF8D8+c0xpipAxXhExRLVv
 ohe2k1eFtk04I=; b=WldALEki+nyUtEQehNNwxvKCcBuk2+tmxuwPkkJD/1WC16
 gls953DvuifV1pRM3Cn+e+OjUwdYsbFO5sH9PzvdFELmZeDOL2bVctbNlHE2k4Zy
 VGL6XQ1LGx7Oq4YaHG74HHycx2vRrhaMTub4JV120tuANd0fnLTb5AcIgdZa+qWY
 PgSDkDT26H7xF4LcAMDR0xPg+Kkc+9NkOLWYZ0f4F89qBSa+SoQA7yksESV6t+l3
 utygMSFrTb3T+w9mCOYB7lzhPnYI6LW3zW1kWqZXWctv4VBrWH207ItfUCzgFptq
 dq4ojxUBlQ5eEQ72bZKgMzWwk4frXGJUrnWXeixw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dTwPvp
 WInF8D8+c0xpipAxXhExRLVvohe2k1eFtk04I=; b=BIkOHROlQSLwIFNOmb1eGY
 lw1B7Rk4qiFGczq1hOgccv/Hsi5X49iegnZIJhyLPiDx5m/9z/TQ8Wv+zCdSGvBt
 v0H+I7X6/aLXl4+rD4/peGQ0gJs6IFuWRmq9jIUFdA0T9QYXSG+bpBxUKaY0Lt1O
 o877Qt0dNvSlCdFsjTQ/rQ18FWTSZq3hUHyGiQkQuFvm1v4TNk/9uyDtWeKVNE9O
 hAa5+n6Bii2oO//B2+5s5PIYHOW4aGUpcZgTssTUP8o+U8NUB0FvnvMvNxPEXxrY
 CnTLuuf7mHzORxt4PiIU6zByd+oPcYzfg2M3KtX8MVZjjODcmeCm1GungNeBSEeA
 ==
X-ME-Sender: <xms:tZYTYvRcGt4eg_OKSf2rcPBugj4SYP0gcyhe340uFI0Wjpb8m4NVBA>
 <xme:tZYTYgzootEkuhXD8qO8jGm75iploULnJt47BFX4YYDAOkAIeLQs5MekVvFWltyTV
 hHT4EA-4l8aQrOXLr0>
X-ME-Received: <xmr:tZYTYk3tR-l8oFAiVGeI0spkpcvSly4Q3K8ySB0THwLNjs4cSNhP6MKQpELuMdTozPX9UHJCWw7uG6E8-OG3oxZClSpN1_3uBlCAZSc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tZYTYvCjssCTz5ptRWOxKGrblkeKv7lipC8Dkwa4HMSQU-EJ-4XC1Q>
 <xmx:tZYTYogx3QgScsqnyrI-xvR8BQh9ALRiy7j7KhXY_brjwThu6Kx4IQ>
 <xmx:tZYTYjrj9Jqbrt-akIZblZLqoC9p9mrXhyxZbh-073qkJTOFMsAHjQ>
 <xmx:tZYTYhXDsGmcZ-v-TZYzaJ__Ge_dBrve5cHOGnlOWHwFIHK94a4Xqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 08:42:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 6/8] drm/vc4: hvs: Ignore atomic_flush if we're disabled
Date: Mon, 21 Feb 2022 14:41:53 +0100
Message-Id: <20220221134155.125447-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221134155.125447-1-maxime@cerno.tech>
References: <20220221134155.125447-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

atomic_flush will be called for each CRTC even if they aren't enabled.

The whole code we have there will thus run without a properly affected
channel, which can then result in all sorts of weird behaviour.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2d540fc11357..5db125dc2358 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -472,6 +472,9 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
 	u32 __iomem *dlist_next = dlist_start;
 
+	if (vc4_state->assigned_channel == VC4_HVS_CHANNEL_DISABLED)
+		return;
+
 	if (debug_dump_regs) {
 		DRM_INFO("CRTC %d HVS before:\n", drm_crtc_index(crtc));
 		vc4_hvs_dump_state(dev);
-- 
2.35.1

