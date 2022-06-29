Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC8656001B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7427014A630;
	Wed, 29 Jun 2022 12:37:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C160514A620
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:12 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 8ADC9320094D;
 Wed, 29 Jun 2022 08:37:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 Jun 2022 08:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506231; x=1656592631; bh=Oo
 /xgkgHuPeXPtxtevn6/2FkFM6qrNvylIlNu/uvFgA=; b=R/q24MAxKP0yHHc0tT
 /j0OJEw0x8NXIrMOp1ARlOyqIQlQ92ggrJJt9SNRtLt965qKE69eM7rqdmyLTngo
 Tn9ahCTslAm06XEHZoVoP2w1AxWFj362RRABZJudi3wSkwtiKo3EvL34kfXltQl5
 QEAqdKIpjkz8qHA/bsKG5B7KSsvcN/x2nFySlx5bOMmQDXcYmYiww3BuyO8hSJrX
 fOWeOot1IiRJl2wJcrMwT1WHg12heql7bsHwhI/rbJitoSoXbgaXw1Ir9PXTEiPE
 8LlbyGyg1vrSnnO+PRvGf6Kz9aeV6AWWQxdOc+9PmCVOUUVdgViCoI0i8V7DVRcn
 4aMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506231; x=1656592631; bh=Oo/xgkgHuPeXP
 txtevn6/2FkFM6qrNvylIlNu/uvFgA=; b=rhZtvurFNqpKaGuGJBn7EZB8BrB26
 LLPbL4fCVSLYktijhMZ3jzNSaLIrcfXFRVJ+Y75kiX78VFAxHHyBsY66wq6kr+NK
 UcUBAV9FS9iJy3fzmpaTTw3WZFDao/QHqXj1bIn0ESOpLtd7MIh+ECS/Jmm/usvK
 gO/5GJB6fzLB/Iks/Phrz5F7tL+BrpT0bRKZWS8AYyBWhYclyOcUeAzsj0aQMB9L
 pPARnEvW+ZFwoQ1lm+WuoFtmNROGN0f97rKDKo/RkND8TiLRyoh4V2dr6/QBsDSv
 3Qmp0WODTuwfs8ZmHjk/AiWhc6VVjwskMQhsuBi+taBH5bRp0IvgBGSfA==
X-ME-Sender: <xms:dke8YmyzLkYTRncCyHaquInt6cmdpz0BGoVl8nLK7v9LnK_jvuetuw>
 <xme:dke8YiSJmy6MKWyz6si8jJcfK-9kIgTDrpbe8qxsCl9oYV9cH18LnRV63_WeyOuTW
 kkVYW3LNObUgFFN_qc>
X-ME-Received: <xmr:dke8YoUUADIgQhX3nVXnnaOyL_zMXMFtHR-3QdOpcto3UJzT72DDGGxW9VBR8g69JQaZ49i6j6mj2Ul88oG4my3BLbOeJBM_Ua8nymM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dke8Ysim9-GNkzxrXZ5z0G5kLuL038LqFQBjBUKOyqTkREPcR8BpoA>
 <xmx:dke8YoB37SKKtzEnmdFa0_kSL7S3l9ssFhWTJMUpNjT5ACURtrPZJw>
 <xmx:dke8YtJ9X-PyQygMIyahzEmV1qYG6ISsWgKHxt4mnatPq8DZQhziqw>
 <xmx:d0e8Yr9syg8rNtiG9jIUPZyWK8GM_vWKna7ZbEeGSk3KOzNxCkBMXg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 39/71] drm/vc4: hdmi: Switch to drmm_kzalloc
Date: Wed, 29 Jun 2022 14:34:38 +0200
Message-Id: <20220629123510.1915022-40-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629123510.1915022-1-maxime@cerno.tech>
References: <20220629123510.1915022-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 73fb2f91c3e4..fba549edcfc5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2907,9 +2907,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	struct device_node *ddc_node;
 	int ret;
 
-	vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
+	vc4_hdmi = drmm_kzalloc(drm, sizeof(*vc4_hdmi), GFP_KERNEL);
 	if (!vc4_hdmi)
 		return -ENOMEM;
+
 	mutex_init(&vc4_hdmi->mutex);
 	spin_lock_init(&vc4_hdmi->hw_lock);
 	INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
-- 
2.36.1

