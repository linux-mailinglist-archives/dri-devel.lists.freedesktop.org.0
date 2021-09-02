Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFB23FF6B4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 23:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353A16E81E;
	Thu,  2 Sep 2021 21:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2046A6E81E;
 Thu,  2 Sep 2021 21:57:39 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 9E16C3F07E; 
 Thu,  2 Sep 2021 21:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630619857;
 bh=RrGb14526Hzdi2/6F7zzMyJp4jDW7pX9lwkBYSkcqpM=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=coaFRyxoT+NWg1LTsanYt1sed4BgbKdeHv4iRV+tv1YdVLbj+1qp8qoLAVUFZXKfD
 tA7nQjAsIvGYP01nwDOzhGMR4j9pRsxNpSSYn8yqfBbw5p4kccz6jweZEF8mDtvSrQ
 hIbQtv2yaNnTK/odnQDg0Tqh4qah7EbhpRBFKxuAYgBuU3Rq70f3ckrvBd2Ehw90On
 dBcBh+ymObVnS8XVihxM9isHp4RYDgIkffT/wg+0yLCqwRFivGjwQkosjHCEDmxBCF
 wSXh7lCdcuKRJ9j2uPmSKWd3Q8g98UXvRE93lgBrPiznazVlJkKJ72/1F3wbedZOrr
 sCQHRUzFgEWlw==
From: Colin King <colin.king@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/i915: clean up inconsistent indenting
Date: Thu,  2 Sep 2021 22:57:37 +0100
Message-Id: <20210902215737.55570-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented one character too deeply,
clean this up.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index de5f9c86b9a4..aeb324b701ec 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2565,7 +2565,7 @@ __execlists_context_pre_pin(struct intel_context *ce,
 	if (!__test_and_set_bit(CONTEXT_INIT_BIT, &ce->flags)) {
 		lrc_init_state(ce, engine, *vaddr);
 
-		 __i915_gem_object_flush_map(ce->state->obj, 0, engine->context_size);
+		__i915_gem_object_flush_map(ce->state->obj, 0, engine->context_size);
 	}
 
 	return 0;
-- 
2.32.0

