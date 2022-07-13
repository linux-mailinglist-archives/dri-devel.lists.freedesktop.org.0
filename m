Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80842573075
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8D1953C2;
	Wed, 13 Jul 2022 08:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFE195285;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5FA2CB81D58;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE501C3411E;
 Wed, 13 Jul 2022 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=jsZox1/hS+Rp3roCl4CQZXK0GfImJ8rOe0DamxNA7YA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BqpZ6D1y4nYBKKFKDkDRktPZB0oi7scya5HlbvCHEM6NrHTIrFwgtrhmohbaUIASf
 E0srcJoOLQO43CMmQu/KtHr69R7lprThRt8aCU/Iam08rQKEYl8OZuMFFJH/i2Q/OW
 guM/xLpHMoD2Zc4RYGeY/KjNYH3KqCVi6Wm8nHtf/hOVC6ax2M5YbRZ6CZWhyY14an
 vDSy/BBXQgPXYBWRetWN0EJh6rCJeu+bp99OfzkGT7w+uYV63HYvFkMjKpIhV19H7v
 dthp5V8oCzAC5bpiTmhUemfoHZ0IEzl2sswqix5YadwAGEBxmwFKeSHXGynZ5hygey
 UotWi6sQAK3VA==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004ztO-Kf;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 16/39] drm/i915: intel_fb: fix a kernel-doc issue with
 Sphinx
Date: Wed, 13 Jul 2022 09:12:04 +0100
Message-Id: <5647d7b6ffe47f53b90342e4ad881d4d4e6b005b.1657699522.git.mchehab@kernel.org>
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
 dri-devel@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can't use %foo[<something>] as this produces a bad markup.
Use instead, the emphasis markup directly.

Fix this issue:
	Documentation/gpu/i915:136: ./drivers/gpu/drm/i915/display/intel_fb.c:280: WARNING: Inline strong start-string without end-string.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index b191915ab351..fe72c75a9c79 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -276,7 +276,7 @@ lookup_format_info(const struct drm_format_info formats[],
  * @cmd: FB add command structure
  *
  * Returns:
- * Returns the format information for @cmd->pixel_format specific to @cmd->modifier[0],
+ * Returns the format information for @cmd->pixel_format specific to **cmd->modifier[0]**,
  * or %NULL if the modifier doesn't override the format.
  */
 const struct drm_format_info *
-- 
2.36.1

