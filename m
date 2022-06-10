Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281FF546220
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AF61122C2;
	Fri, 10 Jun 2022 09:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F4D1124FA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:29:36 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E779B5C01AC;
 Fri, 10 Jun 2022 05:29:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Jun 2022 05:29:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853375; x=1654939775; bh=q8
 bNnQlcHLkW1QbquoGHFNpCXQQuGLQASk5MsZXi9QE=; b=peNc7H77G55ZwTSwqj
 iFEFCZfUlbhqZA0ZAyShcvQMaeiVEWzdK9Lh9TJ0vqtBbEFlt3bQ06w0AcKNAFU5
 XaBUJXwBeoL1SuUWF/n66rN5l2wDVb6lOTeqBssu5fzq6AvQVdbFHci2Qk3hG6ZD
 uP0+B4QyYSnvplBbnTwYlqSowzPASSX9Ej3hmlGZRt2uLRoCVYL8CjOHkhTHQmg/
 zy1monR861o0f4fmmfZHWLCfBKQkC1CE4nNZJuThHWLTfi2Z0fDegDbS/4XW29pr
 8igrvpfgYTPmewR3T3V6T9N2/lttG86HduAXBDGsQ9M5XvzLDW8MqAO5AFCyoqhn
 iesw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853375; x=1654939775; bh=q8bNnQlcHLkW1
 QbquoGHFNpCXQQuGLQASk5MsZXi9QE=; b=nKeHWArHHFCZDwaZwVzCN18ITLi4P
 lLNfZYctp0ii6YT0r8jMrb1oD4j/RnjL9+mhk4cg/3MZG7+5ymUjzbEindLrRLNG
 BPcKyN/epxtaJABNjdAf3wyXRoDMvMtmR14tvVcbdeNgwYsWd6CGNn3SOEGaz3cm
 9q6ER5J1dk3E4kTFOeOmmXavtG/NDkwRp1d+QCNBI4nVgSsxQ7iVdZ9CFtmGf35P
 qgpoY4UfnsL66cPiuV6VbQFijJ8aneUN4HEcSbJgTv4OrcKDhbRs+1PKnbC+dPZM
 uo92W+kHCFN94mz1WVuWQaH5IZGx/oX260vCszCg8jzQdk8YXK6yzPe8A==
X-ME-Sender: <xms:_w6jYm1Hd7fadTuU7qkaJcnIF1B-PG56XtEr8669An50DSsAUHheNw>
 <xme:_w6jYpFzZ-4N7Sb1lpzFxZkfdpn6XIX66LWjhHt1xp13YzmAQnufspO5shV_zPRjp
 jarePprYvrR5S-9KO8>
X-ME-Received: <xmr:_w6jYu7S7LKPxPv7VEF4bSAAE4jYmMlmJYUS2ozFAeViee1pnSLRLu8WNtS_Ef65YyzmvbvY4ZPQomkXc-0O35hFfwYEAQ2Pe4ltFN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_w6jYn0PoxCMeK_B73V03TlmlER1B7nH8NU6zIH1hk4aqOnF3Se_ig>
 <xmx:_w6jYpGq135MiUuX8igOLExhZUzV_Fgjt6nBUEFX47XcgJ61jpwj5w>
 <xmx:_w6jYg-CpEGU_GOuiF0LzUQwCIATLHSnYGhSXnPUggts34R2ID5GHg>
 <xmx:_w6jYtguyLYy48g0tmIRSc9nWpXLIuBeFpj22U6dg4tD48g4ohr_AQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:29:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 04/64] drm/connector: Reorder headers
Date: Fri, 10 Jun 2022 11:28:24 +0200
Message-Id: <20220610092924.754942-5-maxime@cerno.tech>
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

Unlike most of the other files in DRM, and Linux in general, the headers in
drm_connector.c aren't sorted alphabetically. Let's fix that.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 1c48d162c77e..353d83ae09d3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -22,14 +22,14 @@
 
 #include <drm/drm_auth.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
-#include <drm/drm_utils.h>
-#include <drm/drm_print.h>
-#include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include <drm/drm_privacy_screen_consumer.h>
 #include <drm/drm_sysfs.h>
+#include <drm/drm_utils.h>
 
 #include <linux/uaccess.h>
 
-- 
2.36.1

