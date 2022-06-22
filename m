Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D72554D19
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D1A11238A;
	Wed, 22 Jun 2022 14:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE98F11238A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:32:29 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 909D93200942;
 Wed, 22 Jun 2022 10:32:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Jun 2022 10:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908348; x=1655994748; bh=q8
 bNnQlcHLkW1QbquoGHFNpCXQQuGLQASk5MsZXi9QE=; b=XMRov4p6cQPmEVZtXD
 B+MOI/zwrSCyzF2Wi5t2kgEtI8rCn5keNs9FflCxZOaGuQ+D8Liz11GU5ZMjqdRO
 ImwdnvbyaSwQCqS+cnh1gZ+YVpe/Qh/ANIekwd2+PDLXVvQJ4ESKnP6T1dFQwTVZ
 yO/pYuiOaoohY4BWqnCQ3qURar99aOaj/hTvSUtFx/SySgfaP79SeLmHqDVCfZ61
 8MXibg793xJwQB+Tr4QIrUUKPZbFxm6rpW3l6XUeL5VS+dsG7E1evM29frbmCrM5
 JBueO8lyaGaT/72nfVHzbjCFiWFCwnhvPwVYieMZbA4nm1RsxajYvfl85guHonL8
 0K6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908348; x=1655994748; bh=q8bNnQlcHLkW1
 QbquoGHFNpCXQQuGLQASk5MsZXi9QE=; b=DYwX0UYHbNauxZJIic7r/NNjanfhr
 OG+d/N6Lbc+cDCHA8UD8HHyVsxFTqcfL5ENIsYD1ARIgbuFmkn+vZ88TykxQ0FbE
 SCuhac31BMN5aXAbq3yhg24XDcLGitQ+qFYGiSZ4OHjndqLXmp+ShaIOeQsLk1Uv
 4b1y4pkwY1F7zXg772uPGx16jhGfT6PrjgBzlv7xOIYrurmJ0T4eoC4x4QK7/9wR
 xcj/Tu90ZYL1VyalCqVYlk+XO5q5kIMC6XfA2GaQYDLKcVlCveE7YBo5tfbg9wrN
 Tu2qF6jFwEpQrK1/xnh90HVCnB+cWZXylThzu3iOIDAAls+p7sVX1FUkA==
X-ME-Sender: <xms:-yezYrRsRdlAtd4xfTVYOR0Yl7m4hRHilhKrzkNhUzCpniIvh63REQ>
 <xme:-yezYswcH3jEV1YThLWoFXHiY4GUsmT48YkLGZARMKputEnWs05x7slHhx2JLlj0N
 NC52i1T0R2KyrJNvZc>
X-ME-Received: <xmr:-yezYg3jjoShD5FxFk4FZqdUP1dnJjpqAt5U6mzBHGzLXEO6afXtzQUdQT9-SmB1Df65R-QbW1sASXkuJ2wWYs4F6609G9pfmtdnGvI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-yezYrDGs6swpLoQeFvAiRG04gEdKO3Qk1XiYI2EKI1UysAzTg9DqQ>
 <xmx:-yezYkh9kabPgdjlKqQHHztfcU_IgeLARARL-qdFk_A2gNxuCmWAQw>
 <xmx:-yezYvqjxxGopGejdGQ4hyLxrMi9_4vyDc9adNj5BTo_VNmJRzjLrA>
 <xmx:_CezYsd0rtIy6NZ_BHIurtTH9qg9OazY2sNa59VRML30rvhETFheog>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:32:27 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 04/68] drm/connector: Reorder headers
Date: Wed, 22 Jun 2022 16:31:05 +0200
Message-Id: <20220622143209.600298-5-maxime@cerno.tech>
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

