Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3880656B60A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679F91137A8;
	Fri,  8 Jul 2022 09:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5892E1137A8
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:57:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2FCD732009CD;
 Fri,  8 Jul 2022 05:57:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 08 Jul 2022 05:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657274231; x=1657360631; bh=/0
 yRrWTSrRejQgP4eF0zDr5Zf8H9Cbhesbm/Gr09mGQ=; b=oxy1Xly6c+sLe/p/Uz
 feNQ/hYPa8sdMJiGHPCRAyvSXlDmaGjGiuHiW0Q1TsG2+cMRRneDNJm/rzmP8V0a
 zi7AcnYsj/DtvAY9Zekre1pjHmFEBhBKtgclSzsPG4DPa9rMEke7GOi40IusjyFi
 kRrF3Emldlc7m0Q5fujCGJS0YQHhT6bdgQATT0aaQF0Kc2FjMVoOMIO/+CPvwoRK
 yk3LL0aliW+HNQKplcU7hkyhka9Q3bEyIBeZbyfyk8qrrQjllpApcTmeKT0ClkMa
 dpESPb5HwTebfX5ZfH6xI7wK/rNZLdDOK5l+zvLED2YluMizYH7n4SRSWmWDKUfk
 uhbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657274231; x=1657360631; bh=/0yRrWTSrRejQ
 gP4eF0zDr5Zf8H9Cbhesbm/Gr09mGQ=; b=sZljnhFFNyXv1S/KeJOye0gcKP+Xr
 JeQajiTwZHIVwN+DY1y3wX2gkVLbdVRMv/PiVk8BkoPdA+6QFGRs0cl7n7v68nDb
 3VpaNNnJ4ROlfARP4ishyzKHvwgl/2pZ4ehixaBkMeoIHUMAP18nE8xLZwijUVTP
 SJPPM0y12RdKqwMKza+iA2kATfURB2EZrsFwMtCCps9axt/HtpQeyaNVgEdGbIHs
 8w9MQJ6lX+Ld13LyBCaknTcf2+gNT6dJVJ2+qvRdBQsfa0ihH30u6Ppu25ZM1v7d
 ZCVsoeMKDIIiLYDHL6crBVw5OighnS5OY+JZVdEYQC+lIxSIp6s3eH5RA==
X-ME-Sender: <xms:d__HYnTEsC949BqkeS6omTaTEt3CjX0bHiwdWr5xgBfQVbgsExJMbA>
 <xme:d__HYoz5qRkj942Vm0h7jkPALwEh02eqvP5oYtgqSt4jc_7P5NmKEFcpdaV0A5oE1
 vMcRsecprZWE_CkykM>
X-ME-Received: <xmr:d__HYs1gAxBWm1HXwByJJSQ6LEIbauGvG4NIvUy-28DrJPu1ewwwnx2DqHtTUK1T0vL-RPI5mznTx4mxVlyT2SS6Rs72u1-G4pR-KbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeijedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:d__HYnDRRyIDUmRKxC8K5Y8u2kTzoOfiBONjKqDHt7ilD1xSju3rkQ>
 <xmx:d__HYgiRQo7i1_wFoqiDPhajOlQa5qkB267ASRvEVngf_IqnrD4zCg>
 <xmx:d__HYrqM64Q73T198mh3liiJVT9uHgxTAiLYyieTRArAMnycjJrMjQ>
 <xmx:d__HYoeGJqyasW3QZytSj2xHOBdOhA5E16FAxATdKFSgXk6mLvXexQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Jul 2022 05:57:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 01/69] drm/mipi-dsi: Detach devices when removing the host
Date: Fri,  8 Jul 2022 11:55:59 +0200
Message-Id: <20220708095707.257937-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708095707.257937-1-maxime@cerno.tech>
References: <20220708095707.257937-1-maxime@cerno.tech>
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

