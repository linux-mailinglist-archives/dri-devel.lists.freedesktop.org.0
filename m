Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4071033F410
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 16:44:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCE66E598;
	Wed, 17 Mar 2021 15:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB19E6E5C6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 15:44:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id E9605580E66;
 Wed, 17 Mar 2021 11:44:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 17 Mar 2021 11:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=RxWHx4pPwxAQR
 x8k4ZlKfyiNqaKxA4rQkPy3N5YGr9A=; b=vuUEYhMBl8hBbE24QIfMBzVYebVfN
 /wy8fcZZFkDDgJPxfayw+VzsT3M7mWOAB8euNH4Hvoqyh0w2gMFB0soS/U7h3rZm
 26KhMxpXdX/RqFfmAjf0qdO7XSY6ErUGFdkvzL7wNb7ZWX/aQ8HBMiuF9GveZW6B
 gDxEvmi7xXpLA5t8KGTRVdTSayKRrB2djgl6Wp6Hvt9PQIT0PdlD9U418/2/NyDc
 d4qCGdnGhe64oY688IT4hvDKuCH5Ij73/JosrUywu3+zaeSJJGa25kB/DD87YSGx
 /F968jMAX5dOtm7nUDr6/j4egnd8HlaJUnmCaZHS0hW8L+GWmVqqTkEdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RxWHx4pPwxAQRx8k4ZlKfyiNqaKxA4rQkPy3N5YGr9A=; b=A8ze/iw4
 uHxCY0uqk3+Yqyezz/l2HG6pAqg+7Tc4C2HLwnxePzWINYeNz2I1D+VC0sw7n6ky
 d2bmuIbJIE6wnxIOqHJdvEaiHUp2ZjgkbqgrZUkbCWuwa8fUs9UaASSo8KC+E5s/
 UjAziz2amBdAO7yImTrT8plw8A0M7fmuzfO2mAo4Hq/Ioc7tb8Cgi1rg9wpx4lhW
 Ms9Dso+KSAxJx4v9r0V7qabieTSwYCbxZ5Z5nQugjbgixdNyCW2RnOR6PPi79xjd
 DA9t8aXaKk/08oxjPn4GEt/yBompG+waoPbdM+DI7TrsUfI5skr9GecdnQbr+uHL
 dsDQlp/B9uGxNA==
X-ME-Sender: <xms:wSNSYBq4MayJXAjTJUVi-KARuHon0iRT776qxNWg121eilCYhokjTQ>
 <xme:wSNSYKYPTsPsKH3hqq8JEf9T3Zhy6HZHHrI8YpRDi2n6NJZ-SbT8ll7UnNEzaIgUa
 3N2yQ-lW3wZvE7bo4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wSNSYP-tB95OySbjWqtKLy0EAjtClDsnrf7sZu7HtR_tSrTWkiE_TA>
 <xmx:wSNSYIkEyn-we0HJR9wNBr9NHLLbND7shvFccSJSUHsouc9wZmncSQ>
 <xmx:wSNSYMy57_Loi1KMCp2M8FEf26mD2xhYmWhjLKIx9HGkRrUuI5Ed-A>
 <xmx:wSNSYIgRglKs7jDELJVs4O1asP75qXoFW3I4g9M_wk6dXLsH2uJqNQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D688240068;
 Wed, 17 Mar 2021 11:44:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 04/18] drm/vc4: txp: Properly set the possible_crtcs mask
Date: Wed, 17 Mar 2021 16:43:38 +0100
Message-Id: <20210317154352.732095-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317154352.732095-1-maxime@cerno.tech>
References: <20210317154352.732095-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current code does a binary or on the possible_crtcs variable of the
TXP encoder, while we want to set it to that value instead.

Fixes: 39fcb2808376 ("drm/vc4: txp: Turn the TXP into a CRTC of its own")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c0122d83b651..2fc7f4b5fa09 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -507,7 +507,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	encoder = &txp->connector.encoder;
-	encoder->possible_crtcs |= drm_crtc_mask(crtc);
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = devm_request_irq(dev, irq, vc4_txp_interrupt, 0,
 			       dev_name(dev), txp);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
