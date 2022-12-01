Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747CF63F36A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 16:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D09710E14C;
	Thu,  1 Dec 2022 15:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1D910E14B
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 15:14:46 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 09507580393;
 Thu,  1 Dec 2022 10:14:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 10:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669907686; x=
 1669914886; bh=iuEilx+xRoYQO1RYgfutYD8lYjMUxNr7wUiIyqj/yYs=; b=L
 q18AxKAxYF6umWFcqBiTe7oEWaogxy4bIEaiYKKcBbGXkJwD4PuJs2Rmlj4VuxnU
 TR1rOrLWM0+Av5O4Y5bfztC9JswWK98vOx/1PmtknN1lG6hZr4Wmm2B7eik/sQbF
 oSBzZg6Qn8NAov7CYFAOb2/gwbCnO2lyN6Go8qCdqSFErBvLh0E3B24ZPWgcL8o8
 llPb/vt9zCVw7NQDdg/VL553Bmoyh23gsYm0ZrU7YUAsaoZPOPaKIxn5HBQ85lfB
 qeCm8zOG64joDG876S98aFU42/56itN6xXLLI54ZrdXjJb39Q8X7rOK9I4jmgOa3
 WIrP+jruNCp5qRl/dKaTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669907686; x=
 1669914886; bh=iuEilx+xRoYQO1RYgfutYD8lYjMUxNr7wUiIyqj/yYs=; b=H
 jJCN06LIct5EKfWYVhtn9kcucLCGGjuggh0QCWAYWfszpJYVU1BbRrto/Of2E70L
 6d2zNm6c2zJ/v90XuiYj07svHIq6RWkP+5m1k6Faopd8aUAsIMqCXtsZLBqy6AsA
 9jcDmFaO2li/S2Anf/QcboXZiZOjW9dFLT/AVxShalC4pit+HbqkH+3JNqzlKIjl
 kR3UpFK5CufbnmorSN/0DW3k/rYCdSGf/em2Yao3gPM38oMNBVbvFUyQhVbKH1IV
 yDXYiZPSA/Cg1nJN6YjP0uVxAYZgNGPnTiRCzlYzINGPqvY+FCPfW7gGjAQqejiy
 TU1Q1JuTN2U0/sWxV5JvA==
X-ME-Sender: <xms:5cSIYzjdtjOA7ZK1IVkdoKIIOnWhwPt_8SgYn2qkrWAOISCEbdfCEg>
 <xme:5cSIYwCdMhe-0tnl7O44fM0msVIGxvoQWp4vFhiDTSfBzkgRo8Pp_vVCGruC7DoeS
 iGwFeAhX8EqoBAAcIA>
X-ME-Received: <xmr:5cSIYzEx-wxf9SdwohshGberKo6CyUnao6dyk-rYJgFZd6Q1492iVU2qNHYEWVbaofQryqTQtK16-VLh3LkgJufjCa306D4ctX552U6HByrRFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:5cSIYwRkNVFIQt-keryhE8__8NJtp2jHGdGqf1-SQPWA8Ul6dye-kQ>
 <xmx:5cSIYwzyinN8F8oWDK5bpsnLoQW5hHp-1KR8nPwq2E0Hj-llr28hUQ>
 <xmx:5cSIY25zlhNWLh5-DtP5Ejiv49NpFRjFOU4wl6g_8rKfAxGiIz1bJw>
 <xmx:5sSIY9TWXN4VIDORoxN3kX0b-yZ62xmmW75dTaAq3nWGGbAOasufnQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 10:14:44 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 16:11:33 +0100
Subject: [PATCH v3 02/20] drm/tests: Introduce a config option for the KUnit
 helpers
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20221123-rpi-kunit-tests-v3-2-4615a663a84a@cerno.tech>
References: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
In-Reply-To: <20221123-rpi-kunit-tests-v3-0-4615a663a84a@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2332; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=AL8w9JCRskBiZKslQFe5w0wf2+nO0cN/2cUYvvpK3eM=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdR9Rrni12zTk1WcC5d1NA24x3arsmBljdXmVkPDN/3enH
 iwNed5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAi4TMYGTYaaT2YmKahsnHOqgdeyy
 Plo9i0u0TONLavftAjJnjmxFaG/168wTKTr65XTai/zHXWpNfu7/f1Ky9EfmyVqzn61dsylhsA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: David Gow <davidgow@google.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maíra Canal <mcanal@igalia.com>, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Brendan Higgins <brendan.higgins@linux.dev>, Maxime Ripard <maxime@cerno.tech>, linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, Maíra Canal <mairacanal@riseup.net>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Driver-specific tests will need access to the helpers without pulling
every DRM framework test. Let's create an intermediate Kconfig options
for the helpers.

Suggested-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/Kconfig        | 7 +++++++
 drivers/gpu/drm/Makefile       | 2 +-
 drivers/gpu/drm/tests/Makefile | 4 +++-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 315cbdf61979..9f019cd053e1 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -63,6 +63,12 @@ config DRM_USE_DYNAMIC_DEBUG
 	  bytes per callsite, the .data costs can be substantial, and
 	  are therefore configurable.
 
+config DRM_KUNIT_TEST_HELPERS
+	tristate
+	depends on DRM && KUNIT
+	help
+	  KUnit Helpers for KMS drivers.
+
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
 	depends on DRM && KUNIT
@@ -73,6 +79,7 @@ config DRM_KUNIT_TEST
 	select DRM_KMS_HELPER
 	select DRM_BUDDY
 	select DRM_EXPORT_FOR_TESTS if m
+	select DRM_KUNIT_TEST_HELPERS
 	default KUNIT_ALL_TESTS
 	help
 	  This builds unit tests for DRM. This option is not useful for
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index f92cd7892711..8d61fbdfdfac 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -125,7 +125,7 @@ obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 # Drivers and the rest
 #
 
-obj-$(CONFIG_DRM_KUNIT_TEST) += tests/
+obj-y			+= tests/
 
 obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 94fe546d937d..ef14bd481139 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_DRM_KUNIT_TEST_HELPERS) += \
+	drm_kunit_helpers.o
+
 obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_buddy_test.o \
 	drm_cmdline_parser_test.o \
@@ -9,7 +12,6 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_format_helper_test.o \
 	drm_format_test.o \
 	drm_framebuffer_test.o \
-	drm_kunit_helpers.o \
 	drm_mm_test.o \
 	drm_modes_test.o \
 	drm_plane_helper_test.o \

-- 
b4 0.10.1
