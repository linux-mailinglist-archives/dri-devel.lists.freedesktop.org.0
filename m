Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BEA764408
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 04:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD1010E46A;
	Thu, 27 Jul 2023 02:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43AC10E46A;
 Thu, 27 Jul 2023 02:55:44 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 514CF5C014E;
 Wed, 26 Jul 2023 22:55:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 26 Jul 2023 22:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=davidreaver.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1690426541; x=1690512941; bh=zx
 o1R13hZud6WyDtBUOyEV6yDE5nCsrCzF/BEThNRQ0=; b=uj91V9VmExkytqGQYV
 AZQnfS9fFzM8T3gLhrZm7k1UQt53qlJ+CcZiddess5B7DJj6IiDchezM1HxcUspl
 ahOuniTVqqvlanamXpUlnlQIKHp6Nne+Y2VwOY50+VDP3DXZFNvOs/IT+ydtRkRV
 rG2R8Wx+j1VacSj0Gqg3M0SUXsiNWeizwfuzvg3eNNIp6VacLgFsfkplixenkcCc
 6xTA3+VR/5gBEvtg32hsuCTqZBh7oIq8+A7PQ/qYoCC6DX+pBKLq/F0p+U4UO0vA
 zeaUELCZL7dutlerJ0sgAXhPYItW3VU0e863IPXvP3m9VbLH9E37P8R6cOgdLhGG
 zL1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1690426541; x=1690512941; bh=zxo1R13hZud6W
 yDtBUOyEV6yDE5nCsrCzF/BEThNRQ0=; b=MWPSUQY1KN+1N+NQOy+G/FznZNHit
 Q7CpFBRwh+HwXdIKQPLWgf2TygnLC6R6WxUD1nr9Hvtez15Th/wloaED8ImiBeyI
 +jWb6uP1ZtuTwEWW1kx8m3nIy7f3kN2gka4eHAF4QnlS20yCtcjMUr7pX6kaHauu
 NeOF1FnEJrka5zzqnzmR/XwGskl59D/+eFCooZRxcMmzaZ+L2knR6qNw6QkwwoCN
 6qKB5Foeur24f4pv7ylS1qtQv+O8i8hkjdldJoMlxh67fSMwEXDljkX2rSgKwENJ
 dmNvAU0FXR6dqR+ZHIV6W+fzneJIQP9Zx7ot3CRDdeZEToEzITnpMZhTg==
X-ME-Sender: <xms:rdzBZHs_EhrGpV9W7echt94Fkx7jCiMhDCjYuYTFqiN6JrXYA1HSEw>
 <xme:rdzBZIelJ_ZoC4XiO0CD67WyCaW1_Zy09XoB9B-Pk-x4Xz3bdRhKGZBoib8-79Dy2
 aedxmctAr3nGl30LTE>
X-ME-Received: <xmr:rdzBZKwcbQ9FqsT8k9Q3rPon87r7RIX1cJKZ8JIY0WDqXWnE2M4-h3oynF2LJ2QV36FRCBo7ZNz6cSUdv1w2k2sVzRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrieefgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucft
 vggrvhgvrhcuoehmvgesuggrvhhiughrvggrvhgvrhdrtghomheqnecuggftrfgrthhtvg
 hrnhepheetveetgfdvffehfeffieeugeejhfevieejveeivdeuiefgvdduueffhfefveeh
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesuggrvhhiughrvggrvhgvrhdrtghomh
X-ME-Proxy: <xmx:rdzBZGMpq3R22NUo5a_aA4H_L6biOGbLsIjT25btfeMbYGYXbbCd0g>
 <xmx:rdzBZH9Vl7FyzqsXycNKjdRWcLvpDb9TW3TGzVNBXoZJVgQszhIEog>
 <xmx:rdzBZGUdOggLbApT_ChbgbdAg_Y7uvpSDJWvGwEbBCdC1Ma7CQe6hg>
 <xmx:rdzBZOZoufMZBSE7r-indcukFOgI17rNUHMskBUn8kNqYEfC0U1-Gg>
Feedback-ID: i67e946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jul 2023 22:55:39 -0400 (EDT)
From: David Reaver <me@davidreaver.com>
To: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/huc: fix intel_huc.c doc bulleted list format error
Date: Wed, 26 Jul 2023 19:54:00 -0700
Message-ID: <20230727025400.372965-1-me@davidreaver.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>, linux-doc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 David Reaver <me@davidreaver.com>, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following make htmldocs errors/warnings:

./drivers/gpu/drm/i915/gt/uc/intel_huc.c:29: ERROR: Unexpected indentation.
./drivers/gpu/drm/i915/gt/uc/intel_huc.c:30: WARNING: Block quote ends without a blank line; unexpected unindent.
./drivers/gpu/drm/i915/gt/uc/intel_huc.c:35: WARNING: Bullet list ends without a blank line; unexpected unindent.

This output is a bit misleading. The real issue here is we need a blank
line before and after the bulleted list.

Link: https://www.kernel.org/doc/html/latest/gpu/i915.html#huc
Link: https://lore.kernel.org/dri-devel/20230530152958.1384061-1-daniele.ceraolospurio@intel.com/

Signed-off-by: David Reaver <me@davidreaver.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index ddd146265beb..fa70defcb5b2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -26,6 +26,7 @@
  * The kernel driver is only responsible for loading the HuC firmware and
  * triggering its security authentication. This is done differently depending
  * on the platform:
+ *
  * - older platforms (from Gen9 to most Gen12s): the load is performed via DMA
  *   and the authentication via GuC
  * - DG2: load and authentication are both performed via GSC.
@@ -33,6 +34,7 @@
  *   not-DG2 older platforms), while the authentication is done in 2-steps,
  *   a first auth for clear-media workloads via GuC and a second one for all
  *   workloads via GSC.
+ *
  * On platforms where the GuC does the authentication, to correctly do so the
  * HuC binary must be loaded before the GuC one.
  * Loading the HuC is optional; however, not using the HuC might negatively
