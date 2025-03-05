Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2CBA4FF48
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCCC10E786;
	Wed,  5 Mar 2025 13:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nLrh+BqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F46890B6;
 Wed,  5 Mar 2025 13:01:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22040A44F06;
 Wed,  5 Mar 2025 12:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3FFC1C4CEE9;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741179663;
 bh=rLC1csFLpPbsBGmpTzEtCZcjoj6fGUUt+jbAO4S9frI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=nLrh+BqDGh4kF5UD7LaRIsZjcFXDd7YHQ1IeFElGsWYPGOOXTUmEL7NcCYZNPJmfB
 CrqYIu9PsEu2VFnWDpBvUDR4qhI4tzeb29hMFfbhPNIE0FpdtPzzdGiiUKhLVLfpCT
 R4ZDO+tw7tWpGS7b+6tw9yUlm+lVOjt/9hapWrjkAisxfNZCVDadrGXo5Ycb51haaA
 RURj5k+pEcPjXrr6ziLl5ex+urWBDb5pjiAR0QJOh+S4WqKOWr82cual0PH/EtOUie
 K+PEX6AIPV9eHd5trPNgLWLRwE9ryw5KSqfNICYbkTaCHkrTJ8XhhntnKGB+SSQCRv
 LlHe1Xv0IzMDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFC8C282EC;
 Wed,  5 Mar 2025 13:01:03 +0000 (UTC)
From: Vincent Mailhol via B4 Relay
 <devnull+mailhol.vincent.wanadoo.fr@kernel.org>
Date: Wed, 05 Mar 2025 22:00:13 +0900
Subject: [PATCH v4 1/8] bits: fix typo 'unsigned __init128' -> 'unsigned
 __int128'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-fixed-type-genmasks-v4-1-1873dcdf6723@wanadoo.fr>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
In-Reply-To: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
To: Yury Norov <yury.norov@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>, 
 David Laight <David.Laight@ACULAB.COM>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=mailhol.vincent@wanadoo.fr; h=from:subject:message-id;
 bh=OwRhvflyURxATxZcko1vxuJdGFTknPZsp+6vhXZr8YE=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDOknvL7N+3ySo8NTU7DScMITxwmchcZbm/4cihU4M8dPw
 mvSidVTOkpZGMS4GGTFFFmWlXNyK3QUeocd+msJM4eVCWQIAxenAExEX4Phf2T/rL9/Pv794nb5
 +Ua+T2lfdugeviDXEML4ROTLXFa/vSsYGTadUTy/IEmr81Rqja7Fn7SrpqdXHIr6aLihs8v7/jI
 HBhYA
X-Developer-Key: i=mailhol.vincent@wanadoo.fr; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Endpoint-Received: by B4 Relay for mailhol.vincent@wanadoo.fr/default
 with auth_id=291
X-Original-From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
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
Reply-To: mailhol.vincent@wanadoo.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

"int" was misspelled as "init" in GENMASK_U128() comments. Fix the typo.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index 61a75d3f294bfa96267383b5e2fd2a5d4593fcee..14fd0ca9a6cd17339dd2f69e449558312a8a001b 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -40,7 +40,7 @@
  * Missing asm support
  *
  * __GENMASK_U128() depends on _BIT128() which would not work
- * in the asm code, as it shifts an 'unsigned __init128' data
+ * in the asm code, as it shifts an 'unsigned __int128' data
  * type instead of direct representation of 128 bit constants
  * such as long and unsigned long. The fundamental problem is
  * that a 128 bit constant will get silently truncated by the

-- 
2.45.3


