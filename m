Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE74555FFEA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 14:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F05E12B004;
	Wed, 29 Jun 2022 12:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE0011BE95
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:35:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C620932006F5;
 Wed, 29 Jun 2022 08:35:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Jun 2022 08:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656506127; x=1656592527; bh=te
 oKdC+Qt8FDUo5obHk65zt/u7QVAlG8HiCJWNnTXyc=; b=3Z0KSFEd8C0A7eymbQ
 MpOpSxu7LSRCFvM/srSNVFTy/rEGuAiNtX2zq2g+4GYQkg2iv95xaBlywGt3/VRN
 kwEvlN/tg/nVIniL7UYr+SMhrArxnIzY3ra6JWQdlDXMuVaugshlu2lxRRwyo3gR
 hKMh/aUPn9YrCg7hQlFOv1IcM7nQvOuLwaFXJkdBEr6tZ4Mp6Y2/xycmC7DvJafm
 LH/gBxmoS0mVPIShmC4R6ysC9TotkY+5+2bXr6W0e9++QSdnnxGJxXlMeyEYLdfZ
 D36xzJA2U5yt/SjnJjqNZse/qdfhfGZLzmFVzX91KOPcGOc5vH9dS46ZVTBJVELT
 kaEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1656506127; x=1656592527; bh=teoKdC+Qt8FDU
 o5obHk65zt/u7QVAlG8HiCJWNnTXyc=; b=RPrm5GNSPBs+YD87/XTtRj08kBbB2
 /Xwvra6jqz+ehsA4GKyqRwEUxkULvYW18QHjev/0kzTlaOD+DYe2byUt6CYIojV4
 VHCJUDO1DdG4ItW47Yt7PLpFDS6QdouH1Kxzuv6KTDDKknvec10g0nguqf7qSon/
 S7de7B73VHuD3gEbaTQPIkaYYwVtnhVClCHF9JNp7YMvB9IjRrg0wcQ4G75pHNVx
 FZOx4/q9xOhh5I8mBNYeFAeyreySdpPUhbfG1B4oFeMwwqSrfrzSvTiE7BI8hvvr
 ipzz5sDXE0yiBzv8YZBFBDnHikFTczcXx6eSUESUfh8c8wZAjfG4N6YKA==
X-ME-Sender: <xms:D0e8YrFb22tEH547PIROKNa71VuvzuTE4SSwceBBRLcY0L17BjW-2w>
 <xme:D0e8YoUs6U2kUgyCF8qbr8uJmICkXxO6FXwQXkkfq6FEvZMQQZATek9Ksb6xkcm3h
 7dLSD77RWTON6jNNbw>
X-ME-Received: <xmr:D0e8YtLKQwKRA5KT7E9VX5-ZS5y3SMvhEgs5NAmcuziWNsVlIcwNeW4XkAiSLMPa5QtaTOS69so_cEJE6g05A6dxVcWjdmtdxLLMN8s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:D0e8YpFzkTm1Y5JZvj-WlmrqgWuJVNRjG3fo92PqjSPfqBwq4v9lBA>
 <xmx:D0e8YhU_srR-RD3ytO7in6xDRfi5r9taWtBNl7SmmYk6KQfG8GF_VQ>
 <xmx:D0e8YkNW1PKPyiKcN3Hs7hg3cFU2KLBw08SS7eRoHXNzdnBLMD3-xw>
 <xmx:D0e8YvdfDCw9yB4wlCUVvmehhRUxBgEldsa_UC0DAzX5kCuQYKR0dA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Jun 2022 08:35:26 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 04/71] drm/connector: Reorder headers
Date: Wed, 29 Jun 2022 14:34:03 +0200
Message-Id: <20220629123510.1915022-5-maxime@cerno.tech>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unlike most of the other files in DRM, and Linux in general, the headers in
drm_connector.c aren't sorted alphabetically. Let's fix that.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index c7ca435ceb95..77c33662b436 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -22,15 +22,15 @@
 
 #include <drm/drm_auth.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_file.h>
 #include <drm/drm_panel.h>
-#include <drm/drm_utils.h>
 #include <drm/drm_print.h>
-#include <drm/drm_drv.h>
-#include <drm/drm_file.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_sysfs.h>
+#include <drm/drm_utils.h>
 
 #include <linux/uaccess.h>
 
-- 
2.36.1

