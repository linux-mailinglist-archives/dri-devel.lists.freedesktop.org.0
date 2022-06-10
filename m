Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B32546237
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348C311B2F6;
	Fri, 10 Jun 2022 09:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 294A011B0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 828D95C01C0;
 Fri, 10 Jun 2022 05:30:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:30:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853409; x=1654939809; bh=8d
 1NbrvZhwtf0mKIja59v/Syg42KZI2eCYD9Xl6s+KE=; b=m2xxxeeey1dLIUDL3f
 s6XwrtMVLURZEHz/+aD9uBc7CWBdl1dw2ZUdH2ZExCXkXiXBJ3fmV4b44rXIJhfG
 CEq5lAIpH5PtWkSlOjA9PC2FL7ModcfY2dzU0rbDuIL0KKSXzPIk7RzLLUQH4twl
 nk9On6/dKlZwuO+3VkGx9yI2x+5U8HxrWZZeRsYdPbN2392+lFrcpBgu7jGoOdGU
 AhcpsaBi+tc3BQrXJyt0zMEomN1f45i0Mjy2gtrSGmnQnsouNBzDOVb4XZveh2Uu
 FJt+Lsd9IWoZWZH+vdL2/XxEaL4PRgxYK9o7ZOUkrFxxBuGpztvYItE9PDZBRdsR
 sWLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853409; x=1654939809; bh=8d1NbrvZhwtf0
 mKIja59v/Syg42KZI2eCYD9Xl6s+KE=; b=VlVBX2zhRXGHtDZst58vPhLDugMOy
 isjGs6pyNPBheXNIz1tUxIpxnN1JUhR6ADXMhqR7WQyV0Ui14LfQwjax1fCoqc6h
 5adzDZ3t28Awhb/gUKDWZZtzRd/t9ARXoW0gsxUK/zusY4x2x4tGwstgf2ctWWnT
 Dd4S7h1U9D5brofnHkBTT0CFr20kKzu/vGyFouoK0ZBxumwFGgGA7ysJkKeDgslP
 pSu55zf0c2/6IbuohptmNjv4Y7tFdxqObtiXqFVGuoT4Zs0w6h83uNlddQG+slLv
 5tesj3FyBD5t2H4POp6Fr5q4Fz1Zt6CoO/KXO7bujenwIi93LVjVKNbOQ==
X-ME-Sender: <xms:IQ-jYtJVsal-BkwQy-MWr7ZrVJgnx_plF2ZIdv3e-FP1kP_wyS0u9A>
 <xme:IQ-jYpJSKhX2drH1U3oLCwYKQzQ8uAy8NmFU3B5GIXa2ieR3ldN7KFH6AJoHV7NbX
 smuGiR078w8-JQLXSE>
X-ME-Received: <xmr:IQ-jYlusLLvHoCxDicZ__o6VSRQf-F7U808PDg2l79h8KwmWrE5XfKlV8JyNS_7ffJvB6znsW8Ac3ryUbkBbjALUke7i9e9c9xGZ2So>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IQ-jYuaQpuewTWBNjAmJ5QSRExoEaHR1qFCKugksOf52-ok9XIUsmw>
 <xmx:IQ-jYkYaZozqOsde6vKcLIwRzGwO11DQ1dwxhgULyDRm5cVvYdmSGw>
 <xmx:IQ-jYiCwgvCOX4G689kzvp0fSA7OZ7zrTbPhs46HZxxLwTKBDPVMIA>
 <xmx:IQ-jYrVcgZM5HgHToJV6H8i_xuM3DOs_rbkdQkCoczHdg3acNz7sOg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 23/64] drm/vc4: dpi: Return an error if we can't enable our
 clock
Date: Fri, 10 Jun 2022 11:28:43 +0200
Message-Id: <20220610092924.754942-24-maxime@cerno.tech>
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

If we fail to enable the DPI clock, we just ignore the error and moves
forward. Let's return an error instead.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_dpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index d1eaafb43bd1..658e0aa9e2e1 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -270,6 +270,7 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 			DRM_ERROR("Failed to get core clock: %d\n", ret);
 		return ret;
 	}
+
 	dpi->pixel_clock = devm_clk_get(dev, "pixel");
 	if (IS_ERR(dpi->pixel_clock)) {
 		ret = PTR_ERR(dpi->pixel_clock);
@@ -279,8 +280,10 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
 	}
 
 	ret = clk_prepare_enable(dpi->core_clock);
-	if (ret)
+	if (ret) {
 		DRM_ERROR("Failed to turn on core clock: %d\n", ret);
+		return ret;
+	}
 
 	drm_simple_encoder_init(drm, &dpi->encoder.base, DRM_MODE_ENCODER_DPI);
 	drm_encoder_helper_add(&dpi->encoder.base, &vc4_dpi_encoder_helper_funcs);
-- 
2.36.1

