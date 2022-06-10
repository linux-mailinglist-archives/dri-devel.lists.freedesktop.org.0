Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C70546231
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC2D11B0C5;
	Fri, 10 Jun 2022 09:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F9011B0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 46F7B5C01B2;
 Fri, 10 Jun 2022 05:30:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853411; x=1654939811; bh=tD
 7vmahNDSxsmq7Jrmb+x5G5NulPNAqgVyt82m2T0sw=; b=UDhfV0oYdnenIujAOL
 00g49QmgpdhtAYMp22WvJuoxqs0ii2olozp+88hhsjdvoJiApeI7qo8jlm+R1Ck0
 Oveh/k7YgVTerEnUgq6ldUR3gyTX0BZZ2SGF3glf3Tfi483f5pzolBytkKsjQ4JX
 sd7AaXixYZdiB+Vfd9920f4cOKr56cQlhmb2B1WlMN0gYIL60Hgkyq2oz224mKXn
 Xeon8JYZkXflNePpUtOgCsYs2Npv0B0MIACORJ5cshY3ROLPIzwJWskaHSpHn5i1
 6Pb9GotVN8a4B9f6f8YPNi/rdSmJqyFC6eIUCSpsvQd3ZRVwFTNG38ihpwUJH56r
 A8YA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853411; x=1654939811; bh=tD7vmahNDSxsm
 q7Jrmb+x5G5NulPNAqgVyt82m2T0sw=; b=JAkrJ1YBayQ8DTXcQQfg4c18kXgEg
 naR1Kpvl+IXISFElMyAf3e9ZqU0uoO3pvjwfH5OHIzfpBgtSBngq5pZQutSADcNT
 nIDkldBJZYS8brZTI5/DPqdm0949EM3+pZUWCFNrEFpNTZSyTQ/eBhuWxblrQrZj
 ZVy/EARUdpV67nQD/sHVY/59iOSEvoTVsOCEB2agD0EsTUKzj/NmEknZipP4FLr8
 yOdOGSsGf3otEDvu9g5lwBIoPoha/MyeIp2rUNuA6AKztdx4QFXpbHWPqInKsBJ1
 ssg1P07DaCBRsUxEc6scSKKgbj1UxMFJwUJ5uihcok0ur908nzX1JWqzw==
X-ME-Sender: <xms:Iw-jYgMR-Lu4-uew_Z4zEhRoq-vZwkk-cyTXlMlX94zUkfXhnoc-8Q>
 <xme:Iw-jYm8Moni2_NJg1qAbQLuAmFCB-axIcVdNzjLKtG8ycLA5gLI76G-zn6mVilZ9j
 viY1ZtB_HNE0_erIOg>
X-ME-Received: <xmr:Iw-jYnRd36NocrinxyB0MujJpfZCSHsz-sa_wrkLShARa6nsL-12qG2J5YPd5ZzhIv2A4vFoRG4866RLsggqbSiJHAzrQabkG4IPYbU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Iw-jYotu5Hfu64FtRR9LGXgtqh2m_6-xjoiFchZWw6bomiTUE_j5Hg>
 <xmx:Iw-jYoe3-_VcujwKghadB4WKM3mD5kxkptw8hf6YrZFYVlAWuTjCwQ>
 <xmx:Iw-jYs0Ka6YAyfDJGnelaBN3M8Vkl9KqivncRl258a8ZpRuVH9-TnA>
 <xmx:Iw-jYn6SEYM3TFcqDymydQPd15EjIUVqc4iHFmt6SG16gk2TSocNAQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 24/64] drm/vc4: dpi: Remove unnecessary
 drm_of_panel_bridge_remove call
Date: Fri, 10 Jun 2022 11:28:44 +0200
Message-Id: <20220610092924.754942-25-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we have a managed call to create our panel_bridge instance, the call
to drm_of_panel_bridge_remove() at unbind is both redundant and dangerous
since it might lead to a use-after-free.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 658e0aa9e2e1..5a6cdea7bf7b 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -309,8 +309,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
 {
 	struct vc4_dpi *dpi = dev_get_drvdata(dev);
 
-	drm_of_panel_bridge_remove(dev->of_node, 0, 0);
-
 	drm_encoder_cleanup(&dpi->encoder.base);
 
 	clk_disable_unprepare(dpi->core_clock);
-- 
2.36.1

