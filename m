Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5D618019
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA5210E629;
	Thu,  3 Nov 2022 14:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD5510E60A;
 Thu,  3 Nov 2022 14:51:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B2BFB8284C;
 Thu,  3 Nov 2022 14:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236F7C433D7;
 Thu,  3 Nov 2022 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667487103;
 bh=SZs0xzRAu/lUh7Ou+KjchMQxPSRyfWrY0vjw5o+g4yI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PpKxgCyL33L3sNUJHVl20aN3tHAcB4PT7LFh9WPwQ825+Mh1wn6j7Z/itVmsLysmd
 yGk1LCuWoqegvFew/7rHWwljdrQ0ArgGkTlgATCkbrQ4PdxvelR6onNZ959t6epyvG
 mvcZRlEiF7bMEGRUN7gitM7r6JD126nL/cy1miwXjGD4Ur1MlZmMCYDX8s7eSftYVO
 lR6rMO0/x4xhg67XtY1mvmNcRDk+boLrsOHBhLraEj6p57B6hYGRVBZ60yNF87zEsS
 wg+GhRyb0aI6GM2ZrGlJNNGFfBZXEM2PfOtm3lZcw/QAgh+nKkyQG2Cmuabvr2QnTb
 9MufaJxB8Kkcw==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1oqbZE-0076bA-0R;
 Thu, 03 Nov 2022 14:51:40 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH RFC v2 7/8] drm/i915: now that all functions are used,
 remove __maybe_unused
Date: Thu,  3 Nov 2022 14:51:37 +0000
Message-Id: <499491f3b7307648fcf6c31c45713d26331d76d7.1667486144.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667486144.git.mchehab@kernel.org>
References: <cover.1667486144.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, skhan@linuxfoundation.org,
 linux-kselftest@vger.kernel.org, Daniel Latypov <dlatypov@google.com>,
 linux-kernel@vger.kernel.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Isabella Basso <isabbasso@riseup.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PCI-specific KUnit tests that run in bare metal got added,
so we can remove the __maybe_unused from such functions.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH RFC v2 0/8] at: https://lore.kernel.org/all/cover.1667486144.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/selftests/i915_kunit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_kunit.c b/drivers/gpu/drm/i915/selftests/i915_kunit.c
index 6de5d3fa8920..e6dbffe919e6 100644
--- a/drivers/gpu/drm/i915/selftests/i915_kunit.c
+++ b/drivers/gpu/drm/i915/selftests/i915_kunit.c
@@ -26,7 +26,7 @@
 
 static int n_boards;
 static struct pci_dev *dev_i915[MAX_PCI_BOARDS];
-static int __maybe_unused i915_pci_init_suite(struct kunit_suite *suite)
+static int i915_pci_init_suite(struct kunit_suite *suite)
 {
 	struct pci_dev *pdev = NULL;
 	int i;
@@ -64,7 +64,7 @@ static int __maybe_unused i915_pci_init_suite(struct kunit_suite *suite)
 	return 0;
 }
 
-static void __maybe_unused i915_pci_exit_suite(struct kunit_suite *suite)
+static void i915_pci_exit_suite(struct kunit_suite *suite)
 {
 	int i;
 
@@ -74,8 +74,8 @@ static void __maybe_unused i915_pci_exit_suite(struct kunit_suite *suite)
 	n_boards = 0;
 }
 
-static void __maybe_unused run_pci_test(struct kunit *test,
-					int (*f)(struct drm_i915_private *i915))
+static void run_pci_test(struct kunit *test,
+			 int (*f)(struct drm_i915_private *i915))
 {
 	struct drm_i915_private *i915;
 	int i, ret, disable_display;
-- 
2.38.1

