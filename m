Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAAE56001A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:37:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C1C14A62F;
	Wed, 29 Jun 2022 12:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A4B14A61D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:37:06 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id CCEA3320095E;
 Wed, 29 Jun 2022 08:37:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506225; x=1656592625; bh=3T
 KfQA+tPl6x6XVkLqcCKSaKAhwYbiwUJC6T6PduLSs=; b=4pcB2wQYGIa56nfcp2
 lMhiSD+KGa1sLrVUSYsPk5ojZC7WTsT+AHHPkRxIqNQUKlA5SVesJhTVKlc/yYEt
 W5MtnMBAjy96orgukKL2Up6S9Q8X1x2BP2l7fL0XgbmnG8TePFMucY1dblRPEa/6
 eZG1gZZ44zMrjqfX8R0iSKwXNO+KYtNG7SHLMMoR2g3hyELG74kRgbdlfxiChhUo
 vZ8RYgF5cWM3gRO3OXngdI4EgJrlFP6be5ZY9Lc8YKbFcY66FzGAJ75pcyBZu1FT
 KM5iim3AZIJ8CzNqn50hMsReIvWXMv2+YQ5TF9BXwNosPswwgB2YHntqTHFMFPjQ
 TNCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506225; x=1656592625; bh=3TKfQA+tPl6x6
 XVkLqcCKSaKAhwYbiwUJC6T6PduLSs=; b=S77vM7jV1RUgZFsfsjkS/cJMd/fJW
 xJZPTeYUHuU5/uDy6/o0z6iALmv8Of1eBNdEWV8AJwOKY3BioSjoae1wDU8JWWS0
 fJgGcPKtLI+Ss6ar4upvpZV3YdiP84pJnjtwNf7Z6+2T1wqV3bT8kGHqDkhSYmfY
 wv8JpKufl77m/Ffq5gFvz2qVJP9qcSodzvIdZwy+waIOcgQ5Znv7Tw8MWy6+fgiA
 JERlMsfKEbE8VhvWYaqoNNlc+nQHZZP2BuSxB91AVMU13cjI0LJDvKZVNzKjDvar
 +v771rUxWtNsgCl04SNbnUNKaAS7M/nDFjogLaVRSaaxomq2H4vPH7NBA==
X-ME-Sender: <xms:cUe8Ymsk29r32heabaw3MLZDeZxDWQ2nC-abUp1b41d3RCAnBt0Ljg>
 <xme:cUe8Yre_oLajgl3KtcM4H_TtaJmS81NbmD9rA9pENRztTNyaJzytqq5l5eFiv-1uu
 BnOQ1FZv8NTa-i1CGo>
X-ME-Received: <xmr:cUe8YhxjxJRInD2Br-hxkXcw_RiF0kyKm4wBljWvlo6lA3tP59E1YL99AUotcRfl2yw7D8MzXz7vuMdpzZ_PlSmLvg8vUDKa90N53N0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cUe8YhPHXLOgBcp-eH7hVkXF5J7fvvV8mXGNRViHjFalqv61tQRxow>
 <xmx:cUe8Ym-ZI_Vw_upWwMqwk72PGg8_NDxg40rucmICJnE66_zBzusY6w>
 <xmx:cUe8YpWqPJEtA0yy5AtmCdmjT7E8DjGW9ae2oDTxrxSPv8qzgcD4AA>
 <xmx:cUe8YqYnQLDaL1ZGeKYh6iRAxwkDhsUBrQlnuUu3at5OySqtoqMadQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:37:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 37/71] drm/vc4: hdmi: Depends on CONFIG_PM
Date: Wed, 29 Jun 2022 14:34:36 +0200
Message-Id: <20220629123510.1915022-38-maxime@cerno.tech>
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

We already depend on runtime PM to get the power domains and clocks for
most of the devices supported by the vc4 driver, so let's just select it
to make sure it's there.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/Kconfig    | 1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index 061be9a6619d..b0f3117102ca 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -8,6 +8,7 @@ config DRM_VC4
 	depends on DRM
 	depends on SND && SND_SOC
 	depends on COMMON_CLK
+	depends on PM
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6ab83296b0e4..77e3ec52b175 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2854,7 +2854,7 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 	return 0;
 }
 
-static int __maybe_unused vc4_hdmi_runtime_suspend(struct device *dev)
+static int vc4_hdmi_runtime_suspend(struct device *dev)
 {
 	struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
 
-- 
2.36.1

