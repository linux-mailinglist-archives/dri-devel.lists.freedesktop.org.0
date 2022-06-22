Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2781554D15
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEAC10EFD0;
	Wed, 22 Jun 2022 14:32:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D237910FB5F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:19 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A418F320095B;
 Wed, 22 Jun 2022 10:32:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 22 Jun 2022 10:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908338; x=1655994738; bh=ym
 BhDJF4q6mehOBaWADfPA4QyEuYhC+KMn24ivptCcs=; b=b5MOz85QKgsLLra2kS
 8pOd2Vd50EggUJXAMeCf7OzZrXewrskJ/HglAAnLWEnAxzb6KJ/B/LfES4d/KiUC
 lbT9zkOElaItHXI1wFWa7rXPOyhjSdfnx3DPn/Q0xmYrNvDW5n0LGrVVCoMas+3G
 imHbBWnS/ReCQ2B5ULH9ZV2/sSCnz2vUVN3xYg1V3pv9Q/deZI9N+v2Xd1RMOqbt
 phT23TGArUH+/HBQw92L3YIrl2FNPgbywmfbT9RWg0LZHESTEgTM08TgZl46RqqB
 En9TqhJJ0SC3oGn0fXTuznLSGA/Qa27dGUEd+7Ow8E/jRyi+Xp0eBdxzJ13LK3Ek
 Yiwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908338; x=1655994738; bh=ymBhDJF4q6meh
 OBaWADfPA4QyEuYhC+KMn24ivptCcs=; b=gh8JMK3+kQvvOtsBci/ilecF3crcs
 ogfPvqMf8TQx3QWmPa2vMhsqCPCwG5ki/UcOAz1LFoYMvxR0dDMq1CkDqdrd739A
 +VlMCTMK4toozqrSPKFjwv+UuGvOReUeC79T26WrCQPsKvN9Chx6c+9SHPCjTk6h
 a2wBQ6rwLOMUL+M0o74X4g7p5U1psQJ5xfyRkS86FywnokTBdqsQcrbloC417vve
 0RSZmZQo7oXw17Yl91h8PRyBZ/FW3FRhnQhnhz3Es8YdP1F/aZP1WEc03VAOVemV
 cmnYpAZHILZ/gRtdDeWvSmOy1WFXOqDw9bFMHgKazDq2KGBZBd9GW/zlw==
X-ME-Sender: <xms:8SezYue6wRKpmgbLRTBN2R5mBdLmoj_EXK3y3Vp8zEgtYo8SD4ynPQ>
 <xme:8SezYoM6UvGgavgqdnSB4E5g16cjUT9StkbZusXYkwWo4E8kdwcpz6hCacSCGS-15
 fulp5kZtD16Z9O8ftw>
X-ME-Received: <xmr:8SezYvjzuCInA7hj1AGocT3eDKzV-jtz4fkdB3u34oZdpipPoOshdWcadit8Q-MfUNXTDCghv2boWDivbIqv9BjyRALkN8_S3lfZuh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8SezYr8cdDG7msQdcAveLYC0lt5SkOcF0QY8v66wDaGemy2ta2-E4A>
 <xmx:8SezYqubm74sdKKONAbUEQDnRLWfTk5Pw5JtC-Mk-oCF4cSgnFeYrg>
 <xmx:8SezYiGGp0K7kZDmBF0YcI5H4n_7B5cMorzgBd4uuThMFP-QE-ZPOQ>
 <xmx:8iezYsKh4mHJmGgvFmxxOy1pzWyLZbay0xdyIKLmaBOqGID94ZlLxg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 01/68] drm/mipi-dsi: Detach devices when removing the host
Date: Wed, 22 Jun 2022 16:31:02 +0200
Message-Id: <20220622143209.600298-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
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

Whenever the MIPI-DSI host is unregistered, the code of
mipi_dsi_host_unregister() loops over every device currently found on that
bus and will unregister it.

However, it doesn't detach it from the bus first, which leads to all kind
of resource leaks if the host wants to perform some clean up whenever a
device is detached.

Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index c40bde96cfdf..c317ee9fa445 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -346,6 +346,7 @@ static int mipi_dsi_remove_device_fn(struct device *dev, void *priv)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
 
+	mipi_dsi_detach(dsi);
 	mipi_dsi_device_unregister(dsi);
 
 	return 0;
-- 
2.36.1

