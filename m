Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE3B57307F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFD195CB3;
	Wed, 13 Jul 2022 08:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80BC952B6;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34F45B81CBD;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB11AC34114;
 Wed, 13 Jul 2022 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=UE5bMB/I8eWX1xHZMDai5CItggo59EnrC/VAbWT3ySc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cFsCfTGZRujn9BkLgJg4JoUR1y/p4ixxOm3EW5RkQpwrGTB+ycmxkgmRUQpYzqkJk
 FEadDaLPhTvw3YMNgZeM2KWK1EYCr6wX9FOKswO2Kl+rqkBSeGQa88lWYC7a9NcuJ/
 PZP6j+rcOgtS/lPZBGkToKKEcNfKjWLyQx2mVz/dXdeX0kcH72Z1fmWuEKf1RhNfOx
 csFhuwyzX8nbP1ecnxsxqGGzJJAZWhwiPTs011TxlL3fqp70/cGDspA7hvvsgKn1O1
 /yLAv17Y81eksVtnuMNF90s2OyoI9F756zOFgUX9ubLpDfu9TESTUp1DD1SzA60dJ1
 WjWejoQntPQpA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zt9-Il;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 13/39] drm/i915: i915_gpu_error.c: document dump_flags
Date: Wed, 13 Jul 2022 09:12:01 +0100
Message-Id: <bbebefd789a7038661783ceb13fad8fdbd440f54.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kernel-doc dump_flags parameter is missing at i915_capture_error_state().
Document it.

Fixes: a6f0f9cf330a ("drm/i915/guc: Plumb GuC-capture into gpu_coredump")
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_gpu_error.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 32e92651ef7c..7790f97b26db 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -2096,7 +2096,8 @@ void i915_error_state_store(struct i915_gpu_coredump *error)
  * i915_capture_error_state - capture an error record for later analysis
  * @gt: intel_gt which originated the hang
  * @engine_mask: hung engines
- *
+ * @dump_flags: bitmap flags. When %CORE_DUMP_FLAG_IS_GUC_CAPTURE is used,
+ *	dump engine record registers and execlists.
  *
  * Should be called when an error is detected (either a hang or an error
  * interrupt) to capture error state from the time of the error.  Fills
-- 
2.36.1

