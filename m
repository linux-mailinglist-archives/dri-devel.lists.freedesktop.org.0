Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B493554D56
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E693011339F;
	Wed, 22 Jun 2022 14:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1C011339E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:34:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 21B363200979;
 Wed, 22 Jun 2022 10:34:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 Jun 2022 10:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908492; x=1655994892; bh=jP
 4r4ALNNsnNMWwXsGaPc52/FCE0amHNv/NgBz3NfMg=; b=vQKKxRkyWvZBOEr5WA
 Yc+fQpO1f0cusGL86CsADLP+REclgQbJhqZcyKXbnyd5wjhk023HmQepxZRqm7T8
 aCe3ZUOy1D5FkPAbuXAsgen1YQHWZxZ8nPf2V7iJo6oB18JbhSR6ewHKZBxr4st9
 7CcoWY00P43EJELAbKMaMOSFXrc2NCHGs78doAtLu/WbXPZUQKcRCJi/kteZeQCd
 V43tcM3ZHt/5DvpXdjsaqAFaeCHez83T+8gFI5poA3swN48d1+0eH/NCm+c3Ay7F
 p2U2GIRHI1qTp7g+ozVlk7E7Exh3Lpv/FdrxgpdhbrHpeSklz2K1XV9UV2tlfZ2R
 iFMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908492; x=1655994892; bh=jP4r4ALNNsnNM
 WwXsGaPc52/FCE0amHNv/NgBz3NfMg=; b=TcDKNW26CHuWoMkRV5a9s5aKkLpWA
 fW32lhrvxA9GdKRARU85kQ+wU5JTLldkaFaSMhxsWMNBA+WS75UiWo2kxyFoiXrg
 MV4CaNBU22i+5vh73s/sOHJYpIqktGD7AfADncwFHkc1TLPnGQYRt80ZEpKdCjIr
 17wx9h3aQEEzRwlV0L8+TJYOQ5ptP70vT5zS2T7VbgJzCyn81kVshIRt/Dw1gbiK
 G3EVvAm+06M3dS284u9/+gQbzvf/jnBJQNZ1nZUh0d/PJqkJ2idAfT3Ltd2qgDpm
 bP4JyQgmT6vTJsocV48VbDTas8qeAe16Emk5WS0qtxX96MgJKhpyG5ggA==
X-ME-Sender: <xms:jCizYgYbBug-xkpZRsHT20xTfi5MAglFet-I0KrUpEomsfFlTf3vCw>
 <xme:jCizYrYBX6zk-rhafV7BMzMAbgm3_IIBpdQUKZRN-8EglwgA_DAuXBcPVtKbkrijb
 ADnXZOAimHckRiBRdU>
X-ME-Received: <xmr:jCizYq-WJR9A80Vwrddj3MFRL4WbJ3CVC-GqwdD0j8-SnWtdePpuuxToga4lkTfQ3EBZr_y2Je0Cet7RrGPYbIuBXwoJHLA9tgwjsXY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduudenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jCizYqrOmfixWwP475LJGBJsOJwmTdCrSwsw5khvCu51HOBidEWEiQ>
 <xmx:jCizYrp-JTaWXzdh6v9p_uxwhCSGJpj_GwKN23XwMVBB3vIO4Mudhg>
 <xmx:jCizYoStMF6zTB1AMJoV0pzv_aXXMex81_eGSJwpA1sULPfTvByJVQ>
 <xmx:jCizYsl26paVAM1QwXxO6MTTD7oQoAdNcGAq7RmUF68o8Lp9QItsig>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:34:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 50/68] drm/vc4: txp: Switch to drmm_kzalloc
Date: Wed, 22 Jun 2022 16:31:51 +0200
Message-Id: <20220622143209.600298-51-maxime@cerno.tech>
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

Our internal structure that stores the DRM entities structure is allocated
through a device-managed kzalloc.

This means that this will eventually be freed whenever the device is
removed. In our case, the most likely source of removal is that the main
device is going to be unbound, and component_unbind_all() is being run.

However, it occurs while the DRM device is still registered, which will
create dangling pointers, eventually resulting in use-after-free.

Switch to a DRM-managed allocation to keep our structure until the DRM
driver doesn't need it anymore.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 10862a850d6e..93576b2d9ba6 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -477,7 +477,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 	if (irq < 0)
 		return irq;
 
-	txp = devm_kzalloc(dev, sizeof(*txp), GFP_KERNEL);
+	txp = drmm_kzalloc(drm, sizeof(*txp), GFP_KERNEL);
 	if (!txp)
 		return -ENOMEM;
 	vc4_crtc = &txp->base;
-- 
2.36.1

