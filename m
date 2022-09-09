Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4175B3039
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7795910EC36;
	Fri,  9 Sep 2022 07:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F5010EBFE;
 Fri,  9 Sep 2022 07:34:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DC9861F13;
 Fri,  9 Sep 2022 07:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08182C4167A;
 Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708895;
 bh=hzUkiXC8poEW7PSNZ3y+1t01Krzj3+KpWCjMfiGyzFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RrTp5RRjPFsW8KobeSqOT3qCsDklniuWOO3RlcN6JfhP1GTxLqLH/OKoed8eTiw2R
 K2Q9jYA0ADLd0npLp+ph23TF5zPRaSzPqoGGXYN2r7fKrFGRwEN1pAA3UqU/8ggEOu
 SVRX+foBR3AmbluFMwkehtrAjLCmiUCPU6mEQd/QHT1YpDQJ+kaPZFo4lkcnlz4yHF
 luluW5YioSvX0k1uCw2jN+h3an+EQ6nqpWlEAZ0n1azlv7clkq0usC0cUmR1rg+fQ4
 6dMu7HJJ49MIYuYQhVgl7UBZ/Pawxqwb71D3DJXk7yUUUkDBjJNWq5qNc/JB6qfVeE
 44bHtOXqAKHHw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXH-007FHD-0n;
 Fri, 09 Sep 2022 09:34:47 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 25/37] drm/i915: i915_deps: use a shorter title markup
Date: Fri,  9 Sep 2022 09:34:32 +0200
Message-Id: <5289f6f591addc53604d35872bcc32d5fadf0a69.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DOC: tag waits for a one-line short title for the doc
section. Using multiple lines will produce a weird output.
So, add a shorter description for the title, while keeping
the current content below it.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/i915_deps.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_deps.c b/drivers/gpu/drm/i915/i915_deps.c
index 297b8e4e42ee..df6af832e3f2 100644
--- a/drivers/gpu/drm/i915/i915_deps.c
+++ b/drivers/gpu/drm/i915/i915_deps.c
@@ -11,7 +11,9 @@
 #include "i915_deps.h"
 
 /**
- * DOC: Set of utilities to dynamically collect dependencies into a
+ * DOC: Utilities to collect dependencies for GT migration code
+ *
+ * Set of utilities to dynamically collect dependencies into a
  * structure which is fed into the GT migration code.
  *
  * Once we can do async unbinding, this is also needed to coalesce
-- 
2.37.3

